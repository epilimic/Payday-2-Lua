PlayerCarry = PlayerCarry or class(PlayerStandard)
PlayerCarry.target_tilt = -5
function PlayerCarry:init(unit)
	PlayerCarry.super.init(self, unit)
end
function PlayerCarry:enter(state_data, enter_data)
	PlayerCarry.super.enter(self, state_data, enter_data)
	self._unit:camera():camera_unit():base():set_target_tilt(PlayerCarry.target_tilt)
end
function PlayerCarry:_enter(enter_data)
	local my_carry_data = managers.player:get_my_carry_data()
	if my_carry_data then
		local carry_data = tweak_data.carry[my_carry_data.carry_id]
		print("SET CARRY TYPE ON ENTER", carry_data.type)
		self._tweak_data_name = carry_data.type
	else
		self._tweak_data_name = "light"
	end
	if self._ext_movement:nav_tracker() then
		managers.groupai:state():on_criminal_recovered(self._unit)
	end
	local skip_equip = enter_data and enter_data.skip_equip
	if not self:_changing_weapon() and not skip_equip then
		if not self._state_data.mask_equipped then
			self._state_data.mask_equipped = true
			local equipped_mask = managers.blackmarket:equipped_mask()
			local peer_id = managers.network:session() and managers.network:session():local_peer():id()
			local mask_id = managers.blackmarket:get_real_mask_id(equipped_mask.mask_id, peer_id)
			local equipped_mask_type = tweak_data.blackmarket.masks[mask_id].type
			if not equipped_mask_type then
				self._camera_unit:anim_state_machine():set_global("mask_equip", 1)
			elseif equipped_mask_type == "glasses" then
				self._camera_unit:anim_state_machine():set_global("glasses_equip", 1)
			elseif equipped_mask_type == "helmet" then
				self._camera_unit:anim_state_machine():set_global("helmet_equip", 1)
			elseif equipped_mask_type == "beard" then
				self._camera_unit:anim_state_machine():set_global("beard_equip", 1)
			elseif equipped_mask_type == "tiara" then
				self._camera_unit:anim_state_machine():set_global("tiara_equip", 1)
			end
			self:_start_action_equip(self.IDS_MASK_EQUIP, 1.6)
		else
			self:_start_action_equip(self.IDS_EQUIP)
		end
	end
	if not self._state_data.ducking then
		self._ext_movement:set_attention_settings({
			"pl_friend_combatant_cbt",
			"pl_friend_non_combatant_cbt",
			"pl_foe_combatant_cbt_stand",
			"pl_foe_non_combatant_cbt_stand"
		})
	end
end
function PlayerCarry:exit(state_data, new_state_name)
	PlayerCarry.super.exit(self, state_data, new_state_name)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	local exit_data = {}
	exit_data.skip_equip = true
	self._dye_risk = nil
	return exit_data
end
function PlayerCarry:update(t, dt)
	PlayerCarry.super.update(self, t, dt)
	if self._dye_risk and t > self._dye_risk.next_t then
		self:_check_dye_explode()
	end
end
function PlayerCarry:set_tweak_data(name)
	self._tweak_data_name = name
	self:_check_dye_pack()
end
function PlayerCarry:_check_dye_pack()
	local my_carry_data = managers.player:get_my_carry_data()
	if my_carry_data.has_dye_pack then
		self._dye_risk = {}
		self._dye_risk.next_t = managers.player:player_timer():time() + 2 + math.random(3)
	end
end
function PlayerCarry:_check_dye_explode()
	local chance = math.rand(1)
	if chance < 0.25 then
		print("DYE BOOM")
		self._dye_risk = nil
		managers.player:dye_pack_exploded()
		return
	end
	self._dye_risk.next_t = managers.player:player_timer():time() + 2 + math.random(3)
end
function PlayerCarry:_update_check_actions(t, dt)
	local input = self:_get_input()
	self:_determine_move_direction()
	self:_update_interaction_timers(t)
	local projectile_entry = managers.blackmarket:equipped_projectile()
	if tweak_data.blackmarket.projectiles[projectile_entry].is_a_grenade then
		self:_update_throw_grenade_timers(t, input)
	else
		self:_update_throw_projectile_timers(t, input)
	end
	self:_update_reload_timers(t, dt, input)
	self:_update_melee_timers(t, input)
	self:_update_equip_weapon_timers(t, input)
	self:_update_running_timers(t)
	self:_update_zipline_timers(t, dt)
	self:_update_steelsight_timers(t, dt)
	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end
	self:_update_foley(t, input)
	local new_action
	new_action = new_action or self:_check_action_weapon_gadget(t, input)
	new_action = new_action or self:_check_action_weapon_firemode(t, input)
	new_action = new_action or self:_check_action_melee(t, input)
	new_action = new_action or self:_check_action_reload(t, input)
	new_action = new_action or self:_check_change_weapon(t, input)
	new_action = new_action or self:_check_action_equip(t, input)
	if not new_action then
		new_action = self:_check_action_primary_attack(t, input)
		self._shooting = new_action
	end
	if not new_action then
		local projectile_entry = managers.blackmarket:equipped_projectile()
		if tweak_data.blackmarket.projectiles[projectile_entry].is_a_grenade then
			new_action = self:_check_action_throw_grenade(t, input)
		else
			new_action = self:_check_action_throw_projectile(t, input)
		end
	end
	self:_check_action_interact(t, input)
	self:_check_action_jump(t, input)
	self:_check_action_run(t, input)
	self:_check_action_ladder(t, input)
	self:_check_action_zipline(t, input)
	self:_check_action_cash_inspect(t, input)
	self:_check_action_deploy_bipod(t, input)
	self:_check_action_duck(t, input)
	self:_check_action_steelsight(t, input)
	self:_check_use_item(t, input)
	self:_find_pickups(t)
end
function PlayerCarry:_check_action_run(...)
	if tweak_data.carry.types[self._tweak_data_name].can_run or managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") then
		PlayerCarry.super._check_action_run(self, ...)
	end
end
function PlayerCarry:_check_use_item(t, input)
	local new_action
	local action_wanted = input.btn_use_item_press
	if action_wanted then
		local action_forbidden = self._use_item_expire_t or self:_changing_weapon() or self:_interacting() or self._ext_movement:has_carry_restriction() or self:_is_throwing_projectile() or self:_on_zipline()
		if not action_forbidden then
			managers.player:drop_carry()
			new_action = true
		end
	end
	return new_action
end
function PlayerCarry:_check_change_weapon(...)
	return PlayerCarry.super._check_change_weapon(self, ...)
end
function PlayerCarry:_check_action_equip(...)
	return PlayerCarry.super._check_action_equip(self, ...)
end
function PlayerCarry:_update_movement(t, dt)
	PlayerCarry.super._update_movement(self, t, dt)
end
function PlayerCarry:_start_action_jump(...)
	PlayerCarry.super._start_action_jump(self, ...)
end
function PlayerCarry:_perform_jump(jump_vec)
	if managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") then
	else
		mvector3.multiply(jump_vec, tweak_data.carry.types[self._tweak_data_name].jump_modifier)
	end
	PlayerCarry.super._perform_jump(self, jump_vec)
end
function PlayerCarry:_get_max_walk_speed(...)
	local multiplier = tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
	if managers.player:has_category_upgrade("carry", "movement_penalty_nullifier") then
		multiplier = 1
	else
		multiplier = math.clamp(multiplier * managers.player:upgrade_value("carry", "movement_speed_multiplier", 1), 0, 1)
	end
	return PlayerCarry.super._get_max_walk_speed(self, ...) * multiplier
end
function PlayerCarry:_get_walk_headbob(...)
	return PlayerCarry.super._get_walk_headbob(self, ...) * tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
end
function PlayerCarry:pre_destroy(unit)
end
function PlayerCarry:destroy()
end
