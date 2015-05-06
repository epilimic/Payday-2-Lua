BaseNetworkSession = BaseNetworkSession or class()
BaseNetworkSession.TIMEOUT_CHK_INTERVAL = 5
if SystemInfo:platform() == Idstring("X360") then
	BaseNetworkSession.CONNECTION_TIMEOUT = 15
else
	BaseNetworkSession.CONNECTION_TIMEOUT = 10
end
BaseNetworkSession.LOADING_CONNECTION_TIMEOUT = 20
BaseNetworkSession._LOAD_WAIT_TIME = 3
BaseNetworkSession._STEAM_P2P_SEND_INTERVAL = 1
function BaseNetworkSession:init()
	print("[BaseNetworkSession:init]")
	self._ids_WIN32 = Idstring("WIN32")
	self._peers = {}
	self._server_peer = nil
	self._timeout_chk_t = 0
	self._kicked_list = {}
	self._connection_established_results = {}
	self._soft_remove_peers = false
	Network:set_client_send_callback(callback(self, self, "clbk_network_send"))
	self._dropin_complete_event_manager_id = EventManager:register_listener(Idstring("net_save_received"), callback(self, self, "on_peer_save_received"))
end
function BaseNetworkSession:create_local_peer(load_outfit)
	local my_name = managers.network.account:username_id()
	local my_user_id = SystemInfo:platform() == self._ids_WIN32 and Steam:userid() or false
	self._local_peer = NetworkPeer:new(my_name, Network:self("TCP_IP"), 0, false, false, false, managers.blackmarket:get_preferred_character(), my_user_id)
	if load_outfit then
		self._local_peer:set_outfit_string(managers.blackmarket:outfit_string(), nil)
	end
end
function BaseNetworkSession:load(data)
	for peer_id, peer_data in pairs(data.peers) do
		self._peers[peer_id] = NetworkPeer:new()
		self._peers[peer_id]:load(peer_data)
	end
	if data.server_peer then
		self._server_peer = self._peers[data.server_peer]
	end
	self._local_peer:load(data.local_peer)
	self.update = self.update_skip_one
	self._kicked_list = data.kicked_list
	self._connection_established_results = data.connection_established_results
	if data.dead_con_reports then
		self._dead_con_reports = {}
		for _, report in ipairs(data.dead_con_reports) do
			local report = {
				process_t = report.process_t,
				reporter = self._peers[report.reporter],
				reported = self._peers[report.reported]
			}
			table.insert(self._dead_con_reports, report)
		end
	end
	self._server_protocol = data.server_protocol
	self._notify_host_when_outfits_loaded = data.notify_host_when_outfits_loaded
	self._load_counter = data.load_counter
end
function BaseNetworkSession:save(data)
	if self._server_peer then
		data.server_peer = self._server_peer:id()
	end
	local peers = {}
	data.peers = peers
	for peer_id, peer in pairs(self._peers) do
		local peer_data = {}
		peers[peer_id] = peer_data
		peer:save(peer_data)
	end
	data.local_peer = {}
	self._local_peer:save(data.local_peer)
	data.kicked_list = self._kicked_list
	data.connection_established_results = self._connection_established_results
	if self._dead_con_reports then
		data.dead_con_reports = {}
		for _, report in ipairs(self._dead_con_reports) do
			local save_report = {
				process_t = report.process_t,
				reporter = report.reporter:id(),
				reported = report.reported:id()
			}
			table.insert(data.dead_con_reports, save_report)
		end
	end
	if self._dropin_complete_event_manager_id then
		EventManager:unregister_listener(self._dropin_complete_event_manager_id)
		self._dropin_complete_event_manager_id = nil
	end
	self:_flush_soft_remove_peers()
	data.server_protocol = self._server_protocol
	data.notify_host_when_outfits_loaded = self._notify_host_when_outfits_loaded
	data.load_counter = self._load_counter
end
function BaseNetworkSession:server_peer()
	return self._server_peer
end
function BaseNetworkSession:peer(peer_id)
	local peer = self._peers[peer_id]
	if peer then
		return peer
	elseif peer_id == self._local_peer:id() then
		return self._local_peer
	end
end
function BaseNetworkSession:peers()
	return self._peers
end
function BaseNetworkSession:peer_by_ip(ip)
	for peer_id, peer in pairs(self._peers) do
		if peer:ip() == ip then
			return peer
		end
	end
	if self._local_peer:ip() == ip then
		return self._local_peer
	end
end
function BaseNetworkSession:peer_by_name(name)
	for peer_id, peer in pairs(self._peers) do
		if peer:name() == name then
			return peer
		end
	end
end
function BaseNetworkSession:peer_by_user_id(user_id)
	for peer_id, peer in pairs(self._peers) do
		if peer:user_id() == user_id then
			return peer
		end
	end
	if self._local_peer:user_id() == user_id then
		return self._local_peer
	end
end
function BaseNetworkSession:local_peer()
	return self._local_peer
end
function BaseNetworkSession:is_kicked(peer_name)
	return self._kicked_list[peer_name]
end
function BaseNetworkSession:add_peer(name, rpc, in_lobby, loading, synched, id, character, user_id, xuid, xnaddr)
	print("[BaseNetworkSession:add_peer]", name, rpc, in_lobby, loading, synched, id, character, user_id, xuid, xnaddr)
	local peer = NetworkPeer:new(name, rpc, id, loading, synched, in_lobby, character, user_id)
	peer:set_xuid(xuid)
	peer:set_xnaddr(xnaddr)
	if SystemInfo:platform() == Idstring("WIN32") then
		Steam:set_played_with(peer:user_id())
	end
	self._peers[id] = peer
	managers.network:game():on_peer_added(peer, id)
	if synched then
		managers.network:game():on_peer_sync_complete(peer, id)
	end
	if rpc then
		self:remove_connection_from_trash(rpc)
		self:remove_connection_from_soft_remove_peers(rpc)
	end
	return id, peer
end
function BaseNetworkSession:remove_peer(peer, peer_id, reason)
	print("[BaseNetworkSession:remove_peer]", inspect(peer), peer_id, reason)
	Application:stack_dump()
	peer:end_ticket_session()
	if peer_id == 1 then
		self._server_peer = nil
	end
	self._peers[peer_id] = nil
	self._connection_established_results[peer:name()] = nil
	managers.network:game():on_peer_removed(peer, peer_id, reason)
	if peer:rpc() then
		self:_soft_remove_peer(peer)
	else
		peer:destroy()
	end
end
function BaseNetworkSession:_soft_remove_peer(peer)
	self._soft_remove_peers = self._soft_remove_peers or {}
	self._soft_remove_peers[peer:rpc():ip_at_index(0)] = {
		peer = peer,
		expire_t = TimerManager:wall():time() + 1.5
	}
end
function BaseNetworkSession:on_peer_left_lobby(peer)
	if peer:id() == 1 and self:is_client() and self._cb_find_game then
		self:on_join_request_timed_out()
	end
end
function BaseNetworkSession:on_peer_left(peer, peer_id)
	cat_print("multiplayer_base", "[BaseNetworkSession:on_peer_left] Peer Left", peer_id, peer:name(), peer:ip())
	Application:stack_dump()
	self:remove_peer(peer, peer_id, "left")
	if peer_id == 1 and self:is_client() then
		if self._cb_find_game then
			self:on_join_request_timed_out()
		else
			if self:_local_peer_in_lobby() then
				managers.network.matchmake:leave_game()
			else
				managers.network.matchmake:destroy_game()
			end
			managers.network.voice_chat:destroy_voice()
			if game_state_machine:current_state().on_server_left then
				game_state_machine:current_state():on_server_left()
			end
		end
	end
end
function BaseNetworkSession:on_peer_lost(peer, peer_id)
	cat_print("multiplayer_base", "[BaseNetworkSession:on_peer_lost] Peer Lost", peer_id, peer:name(), peer:ip())
	Application:stack_dump()
	self:remove_peer(peer, peer_id, "lost")
	if peer_id == 1 and self:is_client() then
		if self._cb_find_game then
			self:on_join_request_timed_out()
		else
			if self:_local_peer_in_lobby() then
				managers.network.matchmake:leave_game()
			else
				managers.network.matchmake:destroy_game()
			end
			managers.network.voice_chat:destroy_voice()
			if managers.network:stopping() then
				return
			end
			managers.system_menu:close("leave_lobby")
			if game_state_machine:current_state().on_server_left then
				Global.on_server_left_message = "dialog_connection_to_host_lost"
				game_state_machine:current_state():on_server_left()
			end
		end
	end
	if peer_id ~= 1 and self:is_client() and self._server_peer then
		self._server_peer:send("report_dead_connection", peer_id)
	end
end
function BaseNetworkSession:on_peer_kicked(peer, peer_id, message_id)
	if peer ~= self._local_peer then
		if message_id == 0 then
			local ident = self._ids_WIN32 == SystemInfo:platform() and peer:user_id() or peer:name()
			self._kicked_list[ident] = true
		end
		local reason = "kicked"
		if message_id == 1 then
			reason = "removed_dead"
		elseif message_id == 2 or message_id == 3 then
			reason = "auth_fail"
		end
		self:remove_peer(peer, peer_id, reason)
	else
		if message_id == 1 then
			Global.on_remove_peer_message = "dialog_remove_dead_peer"
		elseif message_id == 2 then
			Global.on_remove_peer_message = "dialog_authentication_fail"
		elseif message_id == 3 then
			Global.on_remove_peer_message = "dialog_authentication_host_fail"
		elseif message_id == 4 then
			Global.on_remove_peer_message = "dialog_cheated_host"
		end
		print("IVE BEEN KICKED!")
		if self:_local_peer_in_lobby() then
			print("KICKED FROM LOBBY")
			managers.menu:on_leave_lobby()
			managers.menu:show_peer_kicked_dialog()
		else
			print("KICKED FROM INGAME")
			managers.network.matchmake:destroy_game()
			managers.network.voice_chat:destroy_voice()
			if game_state_machine:current_state().on_kicked then
				game_state_machine:current_state():on_kicked()
			end
		end
	end
end
function BaseNetworkSession:_local_peer_in_lobby()
	return self._local_peer:in_lobby() and game_state_machine:current_state_name() ~= "ingame_lobby_menu"
end
function BaseNetworkSession:update_skip_one()
	self.update = nil
	local wall_time = TimerManager:wall():time()
	self._timeout_chk_t = wall_time + self.TIMEOUT_CHK_INTERVAL
end
function BaseNetworkSession:update()
	local wall_time = TimerManager:wall():time()
	if wall_time > self._timeout_chk_t then
		for peer_id, peer in pairs(self._peers) do
			peer:chk_timeout(peer:loading() and self.LOADING_CONNECTION_TIMEOUT or self.CONNECTION_TIMEOUT)
		end
		self._timeout_chk_t = wall_time + self.TIMEOUT_CHK_INTERVAL
	end
	if self._closing and self:is_ready_to_close() then
		self._closing = false
		managers.network:queue_stop_network()
	end
	self:upd_trash_connections(wall_time)
	self:send_steam_p2p_msgs(wall_time)
end
function BaseNetworkSession:end_update()
end
function BaseNetworkSession:send_to_peers(...)
	for peer_id, peer in pairs(self._peers) do
		peer:send(...)
	end
end
function BaseNetworkSession:send_to_peers_ip_verified(...)
	for peer_id, peer in pairs(self._peers) do
		if peer:ip_verified() then
			peer:send(...)
		end
	end
end
function BaseNetworkSession:send_to_peers_except(id, ...)
	for peer_id, peer in pairs(self._peers) do
		if peer_id ~= id then
			peer:send(...)
		end
	end
end
function BaseNetworkSession:send_to_peers_synched(...)
	for peer_id, peer in pairs(self._peers) do
		peer:send_queued_sync(...)
	end
end
function BaseNetworkSession:send_to_peers_synched_except(id, ...)
	for peer_id, peer in pairs(self._peers) do
		if peer_id ~= id then
			peer:send_queued_sync(...)
		end
	end
end
function BaseNetworkSession:send_to_peers_loaded(...)
	for peer_id, peer in pairs(self._peers) do
		peer:send_after_load(...)
	end
end
function BaseNetworkSession:send_to_peers_loaded_except(id, ...)
	for peer_id, peer in pairs(self._peers) do
		if peer_id ~= id then
			peer:send_after_load(...)
		end
	end
end
function BaseNetworkSession:send_to_peer(peer, ...)
	peer:send(...)
end
function BaseNetworkSession:send_to_peer_synched(peer, ...)
	peer:send_queued_sync(...)
end
function BaseNetworkSession:has_recieved_ok_to_load_level()
	return self._recieved_ok_to_load_level
end
function BaseNetworkSession:_load_level(...)
	self._local_peer:set_loading(true)
	Network:set_multiplayer(true)
	setup:load_level(...)
	self._load_wait_timeout_t = TimerManager:wall():time() + self._LOAD_WAIT_TIME
end
function BaseNetworkSession:_load_lobby(...)
	managers.menu:on_leave_active_job()
	self._local_peer:set_loading(true)
	Network:set_multiplayer(true)
	setup:load_start_menu_lobby(...)
	self._load_wait_timeout_t = TimerManager:wall():time() + self._LOAD_WAIT_TIME
end
function BaseNetworkSession:debug_list_peers()
	for i, peer in pairs(self._peers) do
		cat_print("multiplayer_base", "Peer", i, peer:connection_info())
	end
end
function BaseNetworkSession:clbk_network_send(target_rpc, post_send)
	local target_ip = target_rpc:ip_at_index(0)
	if post_send then
		if self._soft_remove_peers and self._soft_remove_peers[target_ip] then
			local ok_to_delete = true
			local peer_remove_info = self._soft_remove_peers[target_ip]
			if not peer_remove_info.expire_t or peer_remove_info.expire_t > TimerManager:game():time() then
				local send_resume = Network:get_connection_send_status(target_rpc)
				if send_resume then
					for delivery_type, amount in pairs(send_resume) do
						if amount > 0 then
							ok_to_delete = false
						else
						end
					end
				end
			end
			if ok_to_delete then
				print("[BaseNetworkSession:clbk_network_send] soft-removed peer", peer_remove_info.peer:id(), target_ip)
				peer_remove_info.peer:destroy()
				self._soft_remove_peers[target_ip] = nil
				if not next(self._soft_remove_peers) then
					self._soft_remove_peers = false
				end
			end
		else
			local peer = target_rpc:protocol_at_index(0) == "TCP_IP" and self:peer_by_ip(target_ip) or self:peer_by_user_id(target_ip)
			if not peer then
				self:add_connection_to_trash(target_rpc)
			end
		end
	else
		local peer = self:peer_by_ip(target_ip)
		if peer then
			peer:on_send()
		end
	end
end
function BaseNetworkSession:is_ready_to_close()
	for peer_id, peer in pairs(self._peers) do
		if peer:has_queued_rpcs() then
			print("[BaseNetworkSession:is_ready_to_close] waiting queued rpcs", peer_id)
		end
		if peer:is_loading_outfit_assets() then
			return false
		end
		if not peer:rpc() then
			print("[BaseNetworkSession:is_ready_to_close] waiting rpc", peer_id)
			return false
		end
	end
	return true
end
function BaseNetworkSession:closing()
	return self._closing
end
function BaseNetworkSession:prepare_to_close(skip_destroy_matchmaking)
	print("[BaseNetworkSession:prepare_to_close]")
	self._closing = true
	if not skip_destroy_matchmaking then
		managers.network.matchmake:destroy_game()
	end
	Network:set_disconnected()
end
function BaseNetworkSession:set_peer_loading_state(peer, state, load_counter)
	print("[BaseNetworkSession:set_peer_loading_state]", peer:id(), state)
	if Global.load_start_menu_lobby then
		return
	end
	if not state and self._local_peer:loaded() then
		if peer:ip_verified() then
			Global.local_member:sync_lobby_data(peer)
			Global.local_member:sync_data(peer)
		end
		peer:flush_overwriteable_msgs()
	end
end
function BaseNetworkSession:upd_trash_connections(wall_t)
	if self._trash_connections then
		for ip, info in pairs(self._trash_connections) do
			if wall_t > info.expire_t then
				local reset = true
				for peer_id, peer in pairs(self._peers) do
					if peer:ip_verified() and peer:ip() == ip or peer:user_id() == ip then
						reset = false
					else
					end
				end
				if reset then
					print("[BaseNetworkSession:upd_trash_connections] resetting connection:", info.rpc:ip_at_index(0))
					Network:reset_connection(info.rpc)
				end
				self._trash_connections[ip] = nil
			end
		end
		if not next(self._trash_connections) then
			self._trash_connections = nil
		end
	end
	if self._soft_remove_peers then
		for peer_ip, info in pairs(self._soft_remove_peers) do
			if wall_t > info.expire_t then
				info.peer:destroy()
				self._soft_remove_peers[peer_ip] = nil
			else
			end
		end
		if not next(self._soft_remove_peers) then
			self._soft_remove_peers = nil
		end
	end
end
function BaseNetworkSession:add_connection_to_trash(rpc)
	local wanted_ip = rpc:ip_at_index(0)
	self._trash_connections = self._trash_connections or {}
	if not self._trash_connections[wanted_ip] then
		print("[BaseNetworkSession:add_connection_to_trash]", wanted_ip)
		self._trash_connections[wanted_ip] = {
			rpc = rpc,
			expire_t = TimerManager:wall():time() + self.CONNECTION_TIMEOUT
		}
	end
end
function BaseNetworkSession:remove_connection_from_trash(rpc)
	local wanted_ip = rpc:ip_at_index(0)
	if self._trash_connections then
		if self._trash_connections[wanted_ip] then
			print("[BaseNetworkSession:remove_connection_from_trash]", wanted_ip)
		end
		self._trash_connections[wanted_ip] = nil
		if not next(self._trash_connections) then
			self._trash_connections = nil
		end
	end
end
function BaseNetworkSession:remove_connection_from_soft_remove_peers(rpc)
	if self._soft_remove_peers and self._soft_remove_peers[rpc:ip_at_index(0)] then
		self._soft_remove_peers[rpc:ip_at_index(0)] = nil
		if not next(self._soft_remove_peers) then
			self._soft_remove_peers = nil
		end
	end
end
function BaseNetworkSession:chk_send_local_player_ready()
	local state = self._local_peer:waiting_for_player_ready()
	if self:is_host() then
		self:send_to_peers_loaded("set_member_ready", self._local_peer:id(), state and 1 or 0, 1, "")
	else
		self:send_to_host("set_member_ready", self._local_peer:id(), state and 1 or 0, 1, "")
	end
end
function BaseNetworkSession:destroy()
	for _, peer in pairs(self._peers) do
		peer:end_ticket_session()
		peer:destroy()
	end
	self._local_peer:destroy()
	if self._dropin_complete_event_manager_id then
		EventManager:unregister_listener(self._dropin_complete_event_manager_id)
		self._dropin_complete_event_manager_id = nil
	end
end
function BaseNetworkSession:_flush_soft_remove_peers()
	if self._soft_remove_peers then
		for ip, peer_remove_info in pairs(self._soft_remove_peers) do
			cat_print("multiplayer_base", "[BaseNetworkSession:destroy] soft-removed peer", peer_remove_info.peer:id(), ip)
			peer_remove_info.peer:destroy()
		end
	end
	self._soft_remove_peers = nil
end
function BaseNetworkSession:on_load_complete()
	print("[BaseNetworkSession:on_load_complete]")
	self._local_peer:set_loading(false)
	for peer_id, peer in pairs(self._peers) do
		if peer:ip_verified() then
			peer:send("set_loading_state", false, self._load_counter)
		end
	end
end
function BaseNetworkSession:on_steam_p2p_ping(sender_rpc)
	local user_id = sender_rpc:ip_at_index(0)
	local peer = self:peer_by_user_id(user_id)
	if not peer then
		print("[BaseNetworkSession:on_steam_p2p_ping] unknown peer", user_id)
		return
	end
	if self._server_protocol ~= "TCP_IP" then
		print("[BaseNetworkSession:on_steam_p2p_ping] wrong server protocol", self._server_protocol)
		return
	end
	local final_rpc = self:resolve_new_peer_rpc(peer)
	if not final_rpc then
		return
	end
	if peer:rpc() and final_rpc:ip_at_index(0) == peer:rpc():ip_at_index(0) and final_rpc:protocol_at_index(0) == peer:rpc():protocol_at_index(0) then
		local sender_ip = Network:get_ip_address_from_user_id(user_id)
		print("[BaseNetworkSession:on_steam_p2p_ping] already had IP", peer:rpc():ip_at_index(0), peer:rpc():protocol_at_index(0))
		return
	end
	peer:set_rpc(final_rpc)
	Network:add_co_client(final_rpc)
	self:remove_connection_from_trash(final_rpc)
	self:remove_connection_from_soft_remove_peers(final_rpc)
	self:chk_send_connection_established(nil, user_id)
end
function BaseNetworkSession:chk_send_connection_established(name, user_id, peer)
	if SystemInfo:platform() == Idstring("PS3") then
		peer = self:peer_by_name(name)
		if not peer then
			print("[BaseNetworkSession:chk_send_connection_established] no peer yet", name)
			return
		end
		local connection_info = managers.network.matchmake:get_connection_info(name)
		if not connection_info then
			print("[BaseNetworkSession:chk_send_connection_established] no connection_info yet", name)
			return
		end
		if connection_info.dead then
			if peer:id() ~= 1 then
				print("[BaseNetworkSession:chk_send_connection_established] reporting dead connection", name)
				if self._server_peer then
					self._server_peer:send_queued_load("report_dead_connection", peer:id())
				end
			end
			return
		end
		local rpc = Network:handshake(connection_info.external_ip, connection_info.port, "TCP_IP")
		peer:set_rpc(rpc)
		Network:add_co_client(rpc)
		self:remove_connection_from_trash(rpc)
		self:remove_connection_from_soft_remove_peers(rpc)
	else
		peer = peer or self:peer_by_user_id(user_id)
		if not peer then
			print("[BaseNetworkSession:chk_send_connection_established] no peer yet", user_id)
			return
		end
		if not peer:rpc() then
			print("[BaseNetworkSession:chk_send_connection_established] no rpc yet", user_id)
			return
		end
	end
	print("[BaseNetworkSession:chk_send_connection_established] success", name or "", user_id or "", peer:id())
	if self._server_peer then
		self._server_peer:send("connection_established", peer:id())
	end
end
function BaseNetworkSession:send_steam_p2p_msgs(wall_t)
	if self._server_protocol ~= "TCP_IP" then
		return
	end
	if SystemInfo:platform() ~= self._ids_WIN32 then
		return
	end
	for peer_id, peer in pairs(self._peers) do
		if peer ~= self._server_peer and not peer:ip_verified() and (not peer:next_steam_p2p_send_t() or wall_t > peer:next_steam_p2p_send_t()) then
			peer:steam_rpc():steam_p2p_ping()
			peer:set_next_steam_p2p_send_t(wall_t + self._STEAM_P2P_SEND_INTERVAL)
		end
	end
end
function BaseNetworkSession:resolve_new_peer_rpc(new_peer, incomming_rpc)
	if SystemInfo:platform() ~= self._ids_WIN32 then
		return incomming_rpc
	end
	local new_peer_ip_address = Network:get_ip_address_from_user_id(new_peer:user_id())
	print("new_peer_ip_address", new_peer_ip_address)
	if new_peer_ip_address then
		local new_peer_ip_address_split = string.split(new_peer_ip_address, ":")
		local new_peer_ip = new_peer_ip_address_split[1]
		local new_peer_port = new_peer_ip_address_split[2]
		local connect_port = new_peer_port
		print("new_peer_ip", new_peer_ip, "new_peer_port", new_peer_port)
		if string.begins(new_peer_ip, "192.168.") then
			print("using internal port", NetworkManager.DEFAULT_PORT)
			connect_port = NetworkManager.DEFAULT_PORT
		end
		return Network:handshake(new_peer_ip, connect_port, "TCP_IP")
	else
		Application:error("[BaseNetworkSession:resolve_new_peer_rpc] could not resolve IP address!!!")
		return incomming_rpc
	end
end
function BaseNetworkSession:are_peers_done_streaming()
	for peer_id, peer in pairs(self._peers) do
		if peer:synched() and not peer:is_streaming_complete() then
			return
		end
	end
	return true
end
function BaseNetworkSession:peer_streaming_status()
	local status = 100
	local peer_name
	for peer_id, peer in pairs(self._peers) do
		local peer_status = peer:streaming_status()
		if status >= peer_status then
			peer_name = peer:name()
			status = peer_status
		end
	end
	return peer_name, status
end
function BaseNetworkSession:are_all_peer_assets_loaded()
	if not self._local_peer:is_outfit_loaded() then
		return false
	end
	for peer_id, peer in pairs(self._peers) do
		if peer:waiting_for_player_ready() and not peer:is_outfit_loaded() then
			print("[BaseNetworkSession:are_all_peer_assets_loaded] still loading outfit", peer_id)
			return false
		end
	end
	print("[BaseNetworkSession:are_all_peer_assets_loaded] all outfits loaded")
	return true
end
function BaseNetworkSession:_get_peer_outfit_versions_str()
	local outfit_versions_str = ""
	for peer_id = 1, 4 do
		local peer
		if peer_id == self._local_peer:id() then
			peer = self._local_peer
		else
			peer = self._peers[peer_id]
		end
		if peer and peer:waiting_for_player_ready() then
			outfit_versions_str = outfit_versions_str .. tostring(peer_id) .. "-" .. peer:outfit_version() .. "."
		end
	end
	return outfit_versions_str
end
function BaseNetworkSession:on_peer_outfit_loaded(peer)
	print("[BaseNetworkSession:on_peer_outfit_loaded]", inspect(peer))
end
function BaseNetworkSession:set_packet_throttling_enabled(state)
	for peer_id, peer in pairs(self._peers) do
		peer:set_throttling_enabled(state)
	end
end
function BaseNetworkSession:load_counter()
	return self._load_counter
end
