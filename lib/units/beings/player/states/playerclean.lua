PlayerClean = PlayerClean or class(PlayerStandard)
function PlayerClean:init(unit)
	PlayerClean.super.init(self, unit)
	self._ids_unequip = Idstring("unequip")
end
function PlayerClean:enter(state_data, enter_data)
	PlayerClean.super.enter(self, state_data, enter_data)
	self._equiped_armor = managers.blackmarket:equipped_armor()
	if self._equiped_armor and self._equiped_armor ~= "level_1" then
		managers.blackmarket:equip_armor("level_1")
	else
		self._equiped_armor = nil
	end
	if managers.player:selected_equipment() then
		self._selected_equipment = {}
		self._selected_equipment.equipment = managers.player:selected_equipment().equipment
		self._selected_equipment.amount = managers.player:selected_equipment().amount
		managers.player:set_equipment_amount(self._selected_equipment.equipment, 0)
		managers.player:update_deployable_equipment_amount_to_peers(self._selected_equipment.equipment, 0)
	end
end
function PlayerClean:_enter(enter_data)
	local equipped_selection = self._unit:inventory():equipped_selection()
	if equipped_selection ~= 1 then
		self._previous_equipped_selection = equipped_selection
		self._ext_inventory:equip_selection(1, false)
		managers.upgrades:setup_current_weapon()
	end
	if self._unit:camera():anim_data().equipped then
		self._unit:camera():play_redirect(self._ids_unequip)
	end
	self._unit:base():set_slot(self._unit, 4)
	self._ext_movement:set_attention_settings({"pl_clean"})
	if not managers.groupai:state():enemy_weapons_hot() then
		self._enemy_weapons_hot_listen_id = "PlayerClean" .. tostring(self._unit:key())
		managers.groupai:state():add_listener(self._enemy_weapons_hot_listen_id, {
			"enemy_weapons_hot"
		}, callback(self, self, "clbk_enemy_weapons_hot"))
	end
	self._ext_network:send("set_stance", 1, false, false)
	self._show_casing_t = Application:time() + 4
end
function PlayerClean:exit(state_data, new_state_name)
	PlayerClean.super.exit(self, state_data)
	if self._equiped_armor then
		managers.blackmarket:equip_armor(self._equiped_armor)
		self._equiped_armor = nil
	end
	if self._selected_equipment and self._selected_equipment.amount and type(self._selected_equipment.amount) == "string" then
		local amount = Application:digest_value(self._selected_equipment.amount, false)
		managers.player:set_equipment_amount(self._selected_equipment.equipment, amount)
		managers.player:update_deployable_equipment_amount_to_peers(self._selected_equipment.equipment, amount)
		self._selected_equipment = nil
	end
	managers.hud:hide_casing()
	if self._previous_equipped_selection then
		self._unit:inventory():equip_selection(self._previous_equipped_selection, false)
		self._previous_equipped_selection = nil
	end
	self._unit:base():set_slot(self._unit, 2)
	if self._enemy_weapons_hot_listen_id then
		managers.groupai:state():remove_listener(self._enemy_weapons_hot_listen_id)
	end
	return
end
function PlayerClean:update(t, dt)
	PlayerClean.super.update(self, t, dt)
	if self._show_casing_t and t > self._show_casing_t then
		self._show_casing_t = nil
		managers.hud:show_casing("clean")
	end
end
function PlayerClean:_update_check_actions(t, dt)
	local input = self:_get_input()
	self._stick_move = self._controller:get_input_axis("move")
	if mvector3.length(self._stick_move) < 0.1 or self:_interacting() then
		self._move_dir = nil
	else
		self._move_dir = mvector3.copy(self._stick_move)
		local cam_flat_rot = Rotation(self._cam_fwd_flat, math.UP)
		mvector3.rotate_with(self._move_dir, cam_flat_rot)
	end
	self:_update_interaction_timers(t)
	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end
	self:_update_foley(t, input)
	local new_action
	new_action = new_action or self:_check_action_interact(t, input)
	self:_check_action_jump(t, input)
	self:_check_action_duck(t, input)
end
function PlayerClean:_check_action_interact(t, input)
	local new_action, timer, interact_object
	if input.btn_interact_press then
		local action_forbidden = self:chk_action_forbidden("interact") or self._unit:base():stats_screen_visible() or self:_interacting() or self._ext_movement:has_carry_restriction() or self:_on_zipline()
		if not action_forbidden then
			new_action, timer, interact_object = managers.interaction:interact(self._unit)
			if timer then
				new_action = true
				self._ext_camera:camera_unit():base():set_limits(80, 50)
				self:_start_action_interact(t, input, timer, interact_object)
			end
			if not new_action and (not self._intimidate_t or t - self._intimidate_t > tweak_data.player.movement_state.interaction_delay) then
				self._intimidate_t = t
				new_action = self:mark_units("f11", t, true)
			end
		end
		if not new_action then
			managers.hint:show_hint("mask_off_block_interact")
		end
	end
	if input.btn_interact_release then
		self:_interupt_action_interact()
	end
	return new_action
end
function PlayerClean:_start_action_interact(t, input, timer, interact_object)
	self._interact_expire_t = t + timer
	self._interact_params = {
		object = interact_object,
		timer = timer,
		tweak_data = interact_object:interaction().tweak_data
	}
	managers.hud:show_interaction_bar(0, timer)
	managers.network:session():send_to_peers_synched("sync_teammate_progress", 1, true, self._interact_params.tweak_data, timer, false)
end
function PlayerClean:_interupt_action_interact(t, input, complete)
	if self._interact_expire_t then
		self._interact_expire_t = nil
		if alive(self._interact_params.object) then
			self._interact_params.object:interaction():interact_interupt(self._unit, complete)
		end
		self._ext_camera:camera_unit():base():remove_limits()
		managers.interaction:interupt_action_interact(self._unit)
		managers.hud:hide_interaction_bar(complete)
		managers.network:session():send_to_peers_synched("sync_teammate_progress", 1, false, self._interact_params.tweak_data, 0, complete and true or false)
		self._interact_params = nil
	end
end
function PlayerClean:_update_interaction_timers(t)
	if self._interact_expire_t then
		if not alive(self._interact_params.object) or self._interact_params.object ~= managers.interaction:active_unit() or self._interact_params.tweak_data ~= self._interact_params.object:interaction().tweak_data or self._interact_params.object:interaction():check_interupt() then
			self:_interupt_action_interact(t)
		else
			managers.hud:set_interaction_bar_width(self._interact_params.timer - (self._interact_expire_t - t), self._interact_params.timer)
			if t >= self._interact_expire_t then
				self:_end_action_interact(t)
				self._interact_expire_t = nil
			end
		end
	end
end
function PlayerClean:mark_units(line, t, no_gesture, skip_alert)
	local mark_sec_camera = managers.player:has_category_upgrade("player", "sec_camera_highlight_mask_off")
	local mark_special_enemies = managers.player:has_category_upgrade("player", "special_enemy_highlight_mask_off")
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(mark_special_enemies, false, false, false, false)
	local interact_type, sound_name
	if voice_type == "mark_cop" or voice_type == "mark_cop_quiet" then
		interact_type = "cmd_point"
		if voice_type == "mark_cop_quiet" then
			sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].silent_priority_shout .. "_any"
		else
			sound_name = tweak_data.character[prime_target.unit:base()._tweak_table].priority_shout .. "x_any"
		end
		if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
			prime_target.unit:contour():add(managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_enemy_damage_bonus" or "mark_enemy", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
		end
	elseif voice_type == "mark_camera" and mark_sec_camera then
		sound_name = "f39_any"
		interact_type = "cmd_point"
		prime_target.unit:contour():add("mark_unit", true)
	end
	if interact_type then
		if not no_gesture then
		else
		end
		self:_do_action_intimidate(t, interact_type or nil, sound_name, skip_alert)
		return true
	end
	return mark_sec_camera or mark_special_enemies
end
function PlayerClean:_check_action_jump(t, input)
	if input.btn_duck_press then
		managers.hint:show_hint("clean_block_interact")
	end
end
function PlayerClean:_check_action_duck(t, input)
	if input.btn_jump_press then
		managers.hint:show_hint("clean_block_interact")
	end
end
function PlayerClean:clbk_enemy_weapons_hot()
	managers.groupai:state():remove_listener(self._enemy_weapons_hot_listen_id)
	self._enemy_weapons_hot_listen_id = nil
end
function PlayerClean:interaction_blocked()
	return false
end
function PlayerClean:_get_walk_headbob()
	return 0.0125
end
