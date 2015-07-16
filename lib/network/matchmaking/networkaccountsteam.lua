require("lib/network/matchmaking/NetworkAccount")
NetworkAccountSTEAM = NetworkAccountSTEAM or class(NetworkAccount)
NetworkAccountSTEAM.lb_diffs = {
	easy = "Easy",
	normal = "Normal",
	hard = "Hard",
	overkill = "Very Hard",
	overkill_145 = "Overkill",
	overkill_290 = "Death Wish"
}
NetworkAccountSTEAM.lb_levels = {
	bank = "First World Bank",
	heat_street = "Heat Street",
	bridge = "Green Bridge",
	apartment = "Panic Room",
	slaughter_house = "Slaughterhouse",
	diamond_heist = "Diamond Heist",
	suburbia = "Counterfeit",
	secret_stash = "Undercover",
	hospital = "No Mercy"
}
function NetworkAccountSTEAM:init()
	NetworkAccount.init(self)
	Steam:init()
	Steam:request_listener(NetworkAccountSTEAM._on_join_request, NetworkAccountSTEAM._on_server_request)
	Steam:error_listener(NetworkAccountSTEAM._on_disconnected, NetworkAccountSTEAM._on_ipc_fail, NetworkAccountSTEAM._on_connect_fail)
	Steam:overlay_listener(callback(self, self, "_on_open_overlay"), callback(self, self, "_on_close_overlay"))
	self._gamepad_text_listeners = {}
	if Steam:overlay_open() then
		self:_on_open_overlay()
	end
	Steam:sa_handler():stats_store_callback(NetworkAccountSTEAM._on_stats_stored)
	Steam:sa_handler():init()
	self._masks = {}
	self:_set_presences()
	managers.savefile:add_load_done_callback(callback(self, self, "_load_done"))
	Steam:lb_handler():register_storage_done_callback(NetworkAccountSTEAM._on_leaderboard_stored)
	Steam:lb_handler():register_mappings_done_callback(NetworkAccountSTEAM._on_leaderboard_mapped)
	self:set_lightfx()
end
function NetworkAccountSTEAM:_load_done(...)
	print("NetworkAccountSTEAM:_load_done()", ...)
	self:_set_presences()
end
function NetworkAccountSTEAM:_set_presences()
	Steam:set_rich_presence("level", managers.experience:current_level())
end
function NetworkAccountSTEAM:set_presences_peer_id(peer_id)
	Steam:set_rich_presence("peer_id", peer_id)
end
function NetworkAccountSTEAM:get_win_ratio(difficulty, level)
	local plays = Steam:sa_handler():get_global_stat(difficulty .. "_" .. level .. "_plays", 30)
	local wins = Steam:sa_handler():get_global_stat(difficulty .. "_" .. level .. "_wins", 30)
	local ratio = {}
	if #plays == 0 or #wins == 0 then
		return
	end
	for i, plays_n in pairs(plays) do
		ratio[i] = wins[i] / (plays_n == 0 and 1 or plays_n)
	end
	table.sort(ratio)
	return ratio[#ratio / 2]
end
function NetworkAccountSTEAM:set_lightfx()
	if managers.user:get_setting("use_lightfx") then
		print("[NetworkAccountSTEAM:init] Initializing LightFX...")
		self._has_alienware = LightFX:initialize() and LightFX:has_lamps()
		if self._has_alienware then
			self._masks.alienware = true
			LightFX:set_lamps(0, 255, 0, 255)
		end
		print("[NetworkAccountSTEAM:init] Initializing LightFX done")
	else
		self._has_alienware = nil
		self._masks.alienware = nil
	end
end
function NetworkAccountSTEAM:has_mask(mask)
	return self._masks[mask]
end
function NetworkAccountSTEAM._on_troll_group_recieved(success, page)
	if success and string.find(page, "<steamID64>" .. Steam:userid() .. "</steamID64>") then
		managers.network.account._masks.troll = true
	end
	Steam:http_request("http://steamcommunity.com/gid/103582791432592205/memberslistxml/?xml=1", NetworkAccountSTEAM._on_com_group_recieved)
end
function NetworkAccountSTEAM._on_com_group_recieved(success, page)
	if success and string.find(page, "<steamID64>" .. Steam:userid() .. "</steamID64>") then
		managers.network.account._masks.hockey_com = true
	end
	Steam:http_request("http://steamcommunity.com/gid/103582791432508229/memberslistxml/?xml=1", NetworkAccountSTEAM._on_dev_group_recieved)
end
function NetworkAccountSTEAM._on_dev_group_recieved(success, page)
	if success and string.find(page, "<steamID64>" .. Steam:userid() .. "</steamID64>") then
		managers.network.account._masks.developer = true
	end
end
function NetworkAccountSTEAM:has_alienware()
	return self._has_alienware
end
function NetworkAccountSTEAM:_on_open_overlay()
	if self._overlay_opened then
		return
	end
	self._overlay_opened = true
	game_state_machine:_set_controller_enabled(false)
end
function NetworkAccountSTEAM:_on_close_overlay()
	if not self._overlay_opened then
		return
	end
	self._overlay_opened = false
	game_state_machine:_set_controller_enabled(true)
	managers.dlc:chk_content_updated()
end
function NetworkAccountSTEAM:_on_gamepad_text_submitted(submitted, submitted_text)
	print("[NetworkAccountSTEAM:_on_gamepad_text_submitted]", "submitted", submitted, "submitted_text", submitted_text)
	for id, clbk in pairs(self._gamepad_text_listeners) do
		clbk(submitted, submitted_text)
	end
	self._gamepad_text_listeners = {}
end
function NetworkAccountSTEAM:show_gamepad_text_input(id, callback, params)
	local is_password, is_multi_line, description_text, max_characters, start_text
	if params then
		is_password = params.is_password or params.password or params[1]
		is_multi_line = params.is_multi_line or params.multi or params[2]
		description_text = params.description_text or params.desc or params[3]
		max_characters = params.max_characters or params.max_chars or params[4]
		start_text = params.start_text or params[5]
	end
	if Steam:show_gamepad_text_input(is_password and "password" or "normal", is_multi_line and "multi" or "single", description_text or "", max_characters or 20, start_text or "") then
		self:add_gamepad_text_listener(id, callback)
		return true
	end
	return false
end
function NetworkAccountSTEAM:add_gamepad_text_listener(id, clbk)
	if self._gamepad_text_listeners[id] then
		debug_pause("[NetworkAccountSTEAM:add_gamepad_text_listener] ID already added!", id, "Old Clbk", self._gamepad_text_listeners[id], "New Clbk", clbk)
	end
	self._gamepad_text_listeners[id] = clbk
end
function NetworkAccountSTEAM:remove_gamepad_text_listener(id)
	if not self._gamepad_text_listeners[id] then
		debug_pause("[NetworkAccountSTEAM:remove_gamepad_text_listener] ID do not exist!", id)
	end
	self._gamepad_text_listeners[id] = nil
end
function NetworkAccountSTEAM:achievements_fetched()
	self._achievements_fetched = true
end
function NetworkAccountSTEAM:challenges_loaded()
	self._challenges_loaded = true
end
function NetworkAccountSTEAM:experience_loaded()
	self._experience_loaded = true
end
function NetworkAccountSTEAM._on_leaderboard_stored(status)
	print("[NetworkAccountSTEAM:_on_leaderboard_stored] Leaderboard stored, ", status, ".")
end
function NetworkAccountSTEAM._on_leaderboard_mapped()
	print("[NetworkAccountSTEAM:_on_leaderboard_stored] Leaderboard mapped.")
	Steam:lb_handler():request_storage()
end
function NetworkAccountSTEAM._on_stats_stored(status)
	print("[NetworkAccountSTEAM:_on_stats_stored] Statistics stored, ", status, ". Publishing leaderboard score to Steam!")
end
function NetworkAccountSTEAM:get_stat(key)
	return Steam:sa_handler():get_stat(key)
end
function NetworkAccountSTEAM:get_global_stat(key, days)
	local value = 0
	local global_stat
	if days < 0 then
		local day = math.abs(days) + 1
		global_stat = Steam:sa_handler():get_global_stat(key, day)
		return global_stat[day] or 0
	elseif days then
		global_stat = Steam:sa_handler():get_global_stat(key, days == 1 and 1 or days + 1)
		for i = days > 1 and 2 or 1, #global_stat do
			value = value + global_stat[i]
		end
	else
		global_stat = Steam:sa_handler():get_global_stat(key)
		for _, day in ipairs(global_stat) do
			value = value + day
		end
	end
	return value
end
function NetworkAccountSTEAM:publish_statistics(stats, force_store)
	if managers.dlc:is_trial() then
		return
	end
	local handler = Steam:sa_handler()
	print("[NetworkAccountSTEAM:publish_statistics] Publishing statistics to Steam!")
	if Application:production_build() then
		local err = false
		for key, _ in pairs(stats) do
			if not handler:set_stat(key, handler:get_stat(key)) then
				Application:error("[NetworkAccountSTEAM:publish_statistics] ERROR - Stat is missing on Steam: '" .. key .. "'")
				err = true
			end
		end
		if err then
			Application:throw_exception("[NetworkAccountSTEAM:publish_statistics] Missing statistics, needs to be added!!")
		end
		if not force_store then
			return
		end
	end
	local err = false
	for key, stat in pairs(stats) do
		local res
		if stat.type == "int" then
			local val = math.max(0, handler:get_stat(key))
			if stat.method == "lowest" then
				if val > stat.value then
					res = handler:set_stat(key, stat.value)
				else
					res = true
				end
			elseif stat.method == "highest" then
				if val < stat.value then
					res = handler:set_stat(key, stat.value)
				else
					res = true
				end
			elseif stat.method == "set" then
				res = handler:set_stat(key, math.clamp(stat.value, 0, 2147483008))
			elseif 0 < stat.value then
				local mval = val / 1000 + stat.value / 1000
				if mval >= 2147483 then
					Application:error("[NetworkAccountSTEAM:publish_statistics] Warning, trying to set too high a value on stat " .. key)
					res = handler:set_stat(key, 2147483008)
				else
					res = handler:set_stat(key, val + stat.value)
				end
			else
				res = true
			end
		elseif stat.type == "float" then
			if 0 < stat.value then
				local val = handler:get_stat_float(key)
				res = handler:set_stat_float(key, val + stat.value)
			else
				res = true
			end
		elseif stat.type == "avgrate" then
			res = handler:set_stat_float(key, stat.value, stat.hours)
		end
		if not res then
			Application:error("[NetworkAccountSTEAM:publish_statistics] Error, could not set stat " .. key)
			err = true
		end
	end
	if not Application:production_build() or err then
	end
	if not err then
		handler:store_data()
	end
end
function NetworkAccountSTEAM._on_disconnected(lobby_id, friend_id)
	print("[NetworkAccountSTEAM._on_disconnected]", lobby_id, friend_id)
	Application:warn("Disconnected from Steam!! Please wait", 12)
end
function NetworkAccountSTEAM._on_ipc_fail(lobby_id, friend_id)
	print("[NetworkAccountSTEAM._on_ipc_fail]")
end
function NetworkAccountSTEAM._on_join_request(lobby_id, friend_id)
	print("[NetworkAccountSTEAM._on_join_request]")
	if managers.network.matchmake.lobby_handler and managers.network.matchmake.lobby_handler:id() == lobby_id then
		return
	end
	if managers.network:session() and managers.network:session():_local_peer_in_lobby() then
		Global.game_settings.single_player = false
		MenuCallbackHandler:_dialog_leave_lobby_yes()
		managers.network.matchmake:set_join_invite_pending(lobby_id)
		return
	elseif game_state_machine:current_state_name() ~= "menu_main" then
		print("INGAME INVITE")
		Global.game_settings.single_player = false
		Global.boot_invite = lobby_id
		MenuCallbackHandler:_dialog_end_game_yes()
		return
	else
		if not Global.user_manager.user_index or not Global.user_manager.active_user_state_change_quit then
			print("BOOT UP INVITE")
			Global.boot_invite = lobby_id
			return
		end
		Global.game_settings.single_player = false
		managers.network.matchmake:join_server_with_check(lobby_id, true)
	end
end
function NetworkAccountSTEAM._on_server_request(ip, pw)
	print("[NetworkAccountSTEAM._on_server_request]")
end
function NetworkAccountSTEAM._on_connect_fail(ip, pw)
	print("[NetworkAccountSTEAM._on_connect_fail]")
end
function NetworkAccountSTEAM:signin_state()
	if self:local_signin_state() == true then
		return "signed in"
	end
	return "not signed in"
end
function NetworkAccountSTEAM:local_signin_state()
	return Steam:logged_on()
end
function NetworkAccountSTEAM:username_id()
	return Steam:username()
end
function NetworkAccountSTEAM:username_by_id(id)
	return Steam:username(id)
end
function NetworkAccountSTEAM:player_id()
	return Steam:userid()
end
function NetworkAccountSTEAM:is_connected()
	return true
end
function NetworkAccountSTEAM:lan_connection()
	return true
end
function NetworkAccountSTEAM:set_playing(state)
	Steam:set_playing(state)
end
function NetworkAccountSTEAM:_load_globals()
	if Global.steam and Global.steam.account then
		Global.steam.account = nil
	end
end
function NetworkAccountSTEAM:_save_globals()
	Global.steam = Global.steam or {}
	Global.steam.account = {}
end
function NetworkAccountSTEAM.output_global_stats(file)
	local num_days = 100
	local sa = Steam:sa_handler()
	local invalid = sa:get_global_stat("easy_slaughter_house_plays", num_days)
	invalid[1] = 1
	invalid[3] = 1
	invalid[11] = 1
	invalid[12] = 1
	invalid[19] = 1
	invalid[28] = 1
	invalid[51] = 1
	invalid[57] = 1
	local function get_lvl_stat(diff, heist, stat, i)
		if i == 0 then
			local st = NetworkAccountSTEAM.lb_levels[heist] .. ", " .. NetworkAccountSTEAM.lb_diffs[diff] .. " - "
			if type(stat) == "string" then
				return st .. stat
			else
				return st .. stat[1] .. "/" .. stat[2]
			end
		end
		local num
		if type(stat) == "string" then
			num = sa:get_global_stat(diff .. "_" .. heist .. "_" .. stat, num_days)[i] or 0
		else
			local f = sa:get_global_stat(diff .. "_" .. heist .. "_" .. stat[1], num_days)[i] or 0
			local s = sa:get_global_stat(diff .. "_" .. heist .. "_" .. stat[2], num_days)[i] or 1
			num = f / (s == 0 and 1 or s)
		end
		return num
	end
	local function get_weapon_stat(weapon, stat, i)
		if i == 0 then
			local st = weapon .. " - "
			if type(stat) == "string" then
				return st .. stat
			else
				return st .. stat[1] .. "/" .. stat[2]
			end
		end
		local num
		if type(stat) == "string" then
			num = sa:get_global_stat(weapon .. "_" .. stat, num_days)[i] or 0
		else
			local f = sa:get_global_stat(weapon .. "_" .. stat[1], num_days)[i] or 0
			local s = sa:get_global_stat(weapon .. "_" .. stat[2], num_days)[i] or 1
			num = f / (s == 0 and 1 or s)
		end
		return num
	end
	local diffs = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"overkill_290"
	}
	local heists = {
		"bank",
		"heat_street",
		"bridge",
		"apartment",
		"slaughter_house",
		"diamond_heist"
	}
	local weapons = {
		"beretta92",
		"c45",
		"raging_bull",
		"r870_shotgun",
		"mossberg",
		"m4",
		"mp5",
		"mac11",
		"m14",
		"hk21"
	}
	local lvl_stats = {
		"plays",
		{"wins", "plays"},
		{"kills", "plays"}
	}
	local wep_stats = {
		"kills",
		{"kills", "shots"},
		{"headshots", "shots"}
	}
	local lines = {}
	for i = 0, #invalid do
		if i == 0 or invalid[i] == 0 then
			local out = "" .. i
			for _, lvl_stat in ipairs(lvl_stats) do
				for _, diff in ipairs(diffs) do
					for _, heist in ipairs(heists) do
						out = out .. ";" .. get_lvl_stat(diff, heist, lvl_stat, i)
					end
				end
			end
			for _, wep_stat in ipairs(wep_stats) do
				for _, weapon in ipairs(weapons) do
					out = out .. ";" .. get_weapon_stat(weapon, wep_stat, i)
				end
			end
			table.insert(lines, out)
		end
	end
	local file_handle = SystemFS:open(file, "w")
	for i = 1, #lines do
		file_handle:puts(lines[i == 1 and 1 or #lines - i + 2])
	end
end
