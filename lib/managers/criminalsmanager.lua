CriminalsManager = CriminalsManager or class()
CriminalsManager.MAX_NR_TEAM_AI = 2
CriminalsManager.MAX_NR_CRIMINALS = 4
function CriminalsManager:init()
	self:_create_characters()
end
function CriminalsManager:_create_characters()
	self._characters = {}
	for _, character in ipairs(tweak_data.criminals.characters) do
		local static_data = deep_clone(character.static_data)
		local character_data = {
			taken = false,
			name = character.name,
			unit = nil,
			peer_id = 0,
			static_data = static_data,
			data = {}
		}
		table.insert(self._characters, character_data)
	end
end
function CriminalsManager.convert_old_to_new_character_workname(workname)
	local t = {
		american = "hoxton",
		german = "wolf",
		russian = "dallas",
		spanish = "chains"
	}
	return t[workname] or workname
end
function CriminalsManager.character_names()
	return tweak_data.criminals.character_names
end
function CriminalsManager.get_num_characters()
	return #tweak_data.criminals.character_names
end
function CriminalsManager.character_workname_by_peer_id(peer_id)
	return CriminalsManager.character_names()[peer_id]
end
function CriminalsManager:on_simulation_ended()
	for id, data in pairs(self._characters) do
		self:_remove(id)
	end
end
function CriminalsManager:local_character_name()
	return self._local_character
end
function CriminalsManager:characters()
	return self._characters
end
function CriminalsManager:get_any_unit()
	for id, data in pairs(self._characters) do
		if data.taken and alive(data.unit) and data.unit:id() ~= -1 then
			return data.unit
		end
	end
end
function CriminalsManager:get_valid_player_spawn_pos_rot()
	local server_unit = managers.network:session():local_peer():unit()
	if alive(server_unit) then
		return self:_get_unit_pos_rot(server_unit, true)
	end
	for u_key, u_data in pairs(managers.groupai:state():all_player_criminals()) do
		if u_data and alive(u_data.unit) then
			return self:_get_unit_pos_rot(u_data.unit, true)
		end
	end
	if self._last_valid_player_spawn_pos_rot then
		return self._last_valid_player_spawn_pos_rot
	end
	for u_key, u_data in pairs(managers.groupai:state():all_AI_criminals()) do
		if u_data and alive(u_data.unit) then
			return self:_get_unit_pos_rot(u_data.unit, false)
		end
	end
	return nil
end
function CriminalsManager:_get_unit_pos_rot(unit, check_zipline)
	if check_zipline then
		local zipline_unit = unit:movement():zipline_unit()
		if zipline_unit then
			unit = zipline_unit
		end
	end
	local state = unit:movement():current_state_name()
	if state == "jerry1" or state == "jerry2" then
		return nil
	end
	if unit:in_slot(managers.slot:get_mask("players")) and not unit:base().is_husk_player then
		local rot = unit:camera():rotation()
		return {
			unit:position(),
			Rotation(rot:yaw())
		}
	else
		return {
			unit:position(),
			Rotation(unit:rotation():yaw())
		}
	end
end
function CriminalsManager:on_last_valid_player_spawn_point_updated(unit)
	self._last_valid_player_spawn_pos_rot = self:_get_unit_pos_rot(unit, true)
end
function CriminalsManager:_remove(id)
	local data = self._characters[id]
	if data.name == self._local_character then
		self._local_character = nil
	end
	if data.unit then
		managers.hud:remove_mugshot_by_character_name(data.name)
		if not data.ai and alive(data.unit) then
			self:on_last_valid_player_spawn_point_updated(data.unit)
		end
	else
		managers.hud:remove_teammate_panel_by_name_id(data.name)
	end
	if not data.ai then
		managers.trade:on_player_criminal_removed(data.name)
	end
	data.taken = false
	data.unit = nil
	data.peer_id = 0
	data.data = {}
end
function CriminalsManager:add_character(name, unit, peer_id, ai)
	print("[CriminalsManager:add_character]", name, unit, peer_id, ai)
	for id, data in pairs(self._characters) do
		if data.name == name then
			if data.taken then
				Application:error("[CriminalsManager:set_character] Error: Trying to take a unit slot that has already been taken!")
				Application:stack_dump()
				Application:error("[CriminalsManager:set_character] -----")
				self:_remove(id)
			end
			data.taken = true
			data.unit = unit
			data.peer_id = peer_id
			data.data.ai = ai or false
			data.data.mask_obj = tweak_data.blackmarket.masks[data.static_data.ai_mask_id].unit
			data.data.mask_id = data.static_data.ai_mask_id
			data.data.mask_blueprint = nil
			if not ai and unit then
				local mask_id = managers.network:session():peer(peer_id):mask_id()
				data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(mask_id, peer_id)
				data.data.mask_id = managers.blackmarket:get_real_mask_id(mask_id, peer_id)
				data.data.mask_blueprint = managers.network:session():peer(peer_id):mask_blueprint()
			end
			managers.hud:remove_mugshot_by_character_name(name)
			if unit then
				data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
				if unit:base().is_local_player then
					self._local_character = name
					managers.hud:reset_player_hpbar()
				end
				unit:sound():set_voice(data.static_data.voice)
				unit:inventory():set_mask_visibility(unit:inventory()._mask_visibility)
			else
				if not ai or not managers.localization:text("menu_" .. name) then
				end
				data.data.mugshot_id = managers.hud:add_mugshot_without_unit(name, ai, peer_id, (managers.network:session():peer(peer_id):name()))
			end
		else
		end
	end
end
function CriminalsManager:set_unit(name, unit)
	print("[CriminalsManager:set_unit] name", name, "unit", unit)
	Application:stack_dump()
	for id, data in pairs(self._characters) do
		if data.name == name then
			if not data.taken then
				Application:error("[CriminalsManager:set_character] Error: Trying to set a unit on a slot that has not been taken!")
				Application:stack_dump()
				return
			end
			data.unit = unit
			managers.hud:remove_mugshot_by_character_name(data.name)
			data.data.mugshot_id = managers.hud:add_mugshot_by_unit(unit)
			data.data.mask_obj = tweak_data.blackmarket.masks[data.static_data.ai_mask_id].unit
			data.data.mask_id = data.static_data.ai_mask_id
			data.data.mask_blueprint = nil
			if not data.data.ai then
				local mask_id = managers.network:session():peer(data.peer_id):mask_id()
				data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(mask_id, data.peer_id)
				data.data.mask_id = managers.blackmarket:get_real_mask_id(mask_id, data.peer_id)
				data.data.mask_blueprint = managers.network:session():peer(data.peer_id):mask_blueprint()
			end
			if unit:base().is_local_player then
				self._local_character = name
				managers.hud:reset_player_hpbar()
			end
			unit:sound():set_voice(data.static_data.voice)
		else
		end
	end
end
function CriminalsManager:set_data(name)
	for id, data in pairs(self._characters) do
		if data.name == name then
			if not data.taken then
				return
			end
			if not data.data.ai then
				local mask_id = managers.network:session():peer(data.peer_id):mask_id()
				data.data.mask_obj = managers.blackmarket:mask_unit_name_by_mask_id(mask_id, data.peer_id)
				data.data.mask_id = managers.blackmarket:get_real_mask_id(mask_id, data.peer_id)
				data.data.mask_blueprint = managers.network:session():peer(data.peer_id):mask_blueprint()
			end
		else
		end
	end
end
function CriminalsManager:is_taken(name)
	for _, data in pairs(self._characters) do
		if name == data.name then
			return data.taken
		end
	end
	return false
end
function CriminalsManager:character_name_by_peer_id(peer_id)
	for _, data in pairs(self._characters) do
		if data.taken and peer_id == data.peer_id then
			return data.name
		end
	end
end
function CriminalsManager:character_color_id_by_peer_id(peer_id)
	local workname = self.character_workname_by_peer_id(peer_id)
	return self:character_color_id_by_name(workname)
end
function CriminalsManager:character_color_id_by_unit(unit)
	local search_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and search_key == data.unit:key() then
			if data.data.ai then
				return 5
			end
			return data.peer_id
		end
	end
end
function CriminalsManager:character_color_id_by_name(name)
	for id, data in pairs(self._characters) do
		if name == data.name then
			return data.static_data.color_id
		end
	end
end
function CriminalsManager:character_data_by_name(name)
	for _, data in pairs(self._characters) do
		if data.taken and name == data.name then
			return data.data
		end
	end
end
function CriminalsManager:character_data_by_peer_id(peer_id)
	for _, data in pairs(self._characters) do
		if data.taken and peer_id == data.peer_id then
			return data.data
		end
	end
end
function CriminalsManager:character_data_by_unit(unit)
	local search_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.data
		end
	end
end
function CriminalsManager:character_static_data_by_name(name)
	for _, data in pairs(self._characters) do
		if name == data.name then
			return data.static_data
		end
	end
end
function CriminalsManager:character_unit_by_name(name)
	for _, data in pairs(self._characters) do
		if data.taken and name == data.name then
			return data.unit
		end
	end
end
function CriminalsManager:character_unit_by_peer_id(peer_id)
	for _, data in pairs(self._characters) do
		if data.taken and peer_id == data.peer_id then
			return data.unit
		end
	end
end
function CriminalsManager:character_taken_by_name(name)
	for _, data in pairs(self._characters) do
		if name == data.name then
			return data.taken
		end
	end
end
function CriminalsManager:character_peer_id_by_name(name)
	for _, data in pairs(self._characters) do
		if data.taken and name == data.name then
			return data.peer_id
		end
	end
end
function CriminalsManager:character_peer_id_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return nil
	end
	local search_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.peer_id
		end
	end
end
function CriminalsManager:get_free_character_name()
	local available = {}
	for id, data in pairs(self._characters) do
		local taken = data.taken
		if not taken and not self:is_character_as_AI_level_blocked(data.name) then
			table.insert(available, data.name)
		end
	end
	if #available > 0 then
		return available[math.random(#available)]
	end
end
function CriminalsManager:get_num_player_criminals()
	local num = 0
	for id, data in pairs(self._characters) do
		if data.taken and not data.data.ai then
			num = num + 1
		end
	end
	return num
end
function CriminalsManager:on_peer_left(peer_id)
	for id, data in pairs(self._characters) do
		local char_dmg = alive(data.unit) and data.unit:character_damage()
		if char_dmg and char_dmg.get_paused_counter_name_by_peer then
			local counter_name = char_dmg:get_paused_counter_name_by_peer(peer_id)
			if counter_name then
				if counter_name == "downed" then
					char_dmg:unpause_downed_timer(peer_id)
				elseif counter_name == "arrested" then
					char_dmg:unpause_arrested_timer(peer_id)
				elseif counter_name == "bleed_out" then
					char_dmg:unpause_bleed_out(peer_id)
				else
					Application:stack_dump_error("Unknown counter name \"" .. tostring(counter_name) .. "\" by peer id " .. tostring(peer_id))
				end
				local interact_ext = data.unit:interaction()
				if interact_ext then
					interact_ext:set_waypoint_paused(false)
				end
				managers.network:session():send_to_peers_synched("interaction_set_waypoint_paused", data.unit, false)
			end
		end
	end
end
function CriminalsManager:remove_character_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return
	end
	local rem_u_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and rem_u_key == data.unit:key() then
			self:_remove(id)
			return
		end
	end
end
function CriminalsManager:remove_character_by_peer_id(peer_id)
	for id, data in pairs(self._characters) do
		if data.taken and peer_id == data.peer_id then
			self:_remove(id)
			return
		end
	end
end
function CriminalsManager:remove_character_by_name(name)
	for id, data in pairs(self._characters) do
		if data.taken and name == data.name then
			self:_remove(id)
			return
		end
	end
end
function CriminalsManager:character_name_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return nil
	end
	local search_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.name
		end
	end
end
function CriminalsManager:character_name_by_panel_id(panel_id)
	for id, data in pairs(self._characters) do
		if data.taken and data.data.panel_id == panel_id then
			return data.name
		end
	end
end
function CriminalsManager:character_static_data_by_unit(unit)
	if type_name(unit) ~= "Unit" then
		return nil
	end
	local search_key = unit:key()
	for id, data in pairs(self._characters) do
		if data.unit and data.taken and search_key == data.unit:key() then
			return data.static_data
		end
	end
end
function CriminalsManager:nr_AI_criminals()
	local nr_AI_criminals = 0
	for i, char_data in pairs(self._characters) do
		if char_data.data.ai then
			nr_AI_criminals = nr_AI_criminals + 1
		end
	end
	return nr_AI_criminals
end
function CriminalsManager:nr_taken_criminals()
	local nr_taken_criminals = 0
	for i, char_data in pairs(self._characters) do
		if char_data.taken then
			nr_taken_criminals = nr_taken_criminals + 1
		end
	end
	return nr_taken_criminals
end
function CriminalsManager:is_character_as_AI_level_blocked(name)
	if not Global.game_settings.level_id then
		return false
	end
	local block_AIs = tweak_data.levels[Global.game_settings.level_id].block_AIs
	return block_AIs and block_AIs[name] or false
end
