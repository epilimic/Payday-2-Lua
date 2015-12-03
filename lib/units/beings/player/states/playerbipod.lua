PlayerBipod = PlayerBipod or class(PlayerStandard)
PlayerBipod.target_tilt = -5
PlayerBipod._shoulder_pos = nil
PlayerBipod._camera_pos = nil
function PlayerBipod:init(unit)
	PlayerBipod.super.init(self, unit)
end
function PlayerBipod:set_camera_positions(bipod_pos, camera_pos)
	self._shoulder_pos = Vector3(bipod_pos.x, bipod_pos.y, bipod_pos.z)
	self._camera_pos = Vector3(camera_pos.x, camera_pos.y, camera_pos.z)
end
function PlayerBipod:enter(state_data, enter_data)
	PlayerBipod.super.enter(self, state_data, enter_data)
end
function PlayerBipod:_enter(enter_data)
	local player = managers.player:player_unit()
	if player and self._unit:base().is_local_player then
		local tweak_data = self._equipped_unit:base():weapon_tweak_data()
		local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
		local reload_name_id = tweak_data.animations.reload_name_id or self._equipped_unit:base().name_id
		local equipped_unit_id = self._equipped_unit:base().name_id
		self._unit_deploy_position = player:position()
		self._unit:camera():camera_unit():base():set_limits(tweak_data.bipod_camera_spin_limit, tweak_data.bipod_camera_pitch_limit)
		PlayerBipod.super:start_deploying_bipod(tweak_data.timers.deploy_bipod)
		self._equipped_unit:base():tweak_data_anim_stop("undeploy")
		local result = self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_enter .. "_" .. equipped_unit_id), speed_multiplier)
		local result_deploy = self._equipped_unit:base():tweak_data_anim_play("deploy", speed_multiplier)
		self._headbob = 0
		self._target_headbob = 0
		self._ext_camera:set_shaker_parameter("headbob", "amplitude", 0)
		PlayerStandard.IDS_RECOIL = Idstring(tweak_data.animations.bipod_recoil .. "_" .. equipped_unit_id)
		PlayerStandard.IDS_RECOIL_ENTER = Idstring(tweak_data.animations.bipod_recoil_enter .. "_" .. equipped_unit_id)
		PlayerStandard.IDS_RECOIL_LOOP = Idstring(tweak_data.animations.bipod_recoil_loop .. "_" .. equipped_unit_id)
		PlayerStandard.IDS_RECOIL_EXIT = Idstring(tweak_data.animations.bipod_recoil_exit .. "_" .. equipped_unit_id)
		self._unit:sound_source():post_event("wp_steady_in")
		self:_stance_entered()
		self:_husk_bipod_data()
	end
end
function PlayerBipod:exit(state_data, new_state_name)
	PlayerBipod.super.exit(self, state_data or self._state_data, new_state_name)
	local tweak_data = self._equipped_unit:base():weapon_tweak_data()
	local speed_multiplier = self._equipped_unit:base():reload_speed_multiplier()
	local equipped_unit_id = self._equipped_unit:base().name_id
	self._equipped_unit:base():tweak_data_anim_stop("deploy")
	local result = self._ext_camera:play_redirect(Idstring(tweak_data.animations.bipod_exit .. "_" .. equipped_unit_id), speed_multiplier)
	local result_deploy = self._equipped_unit:base():tweak_data_anim_play("undeploy", speed_multiplier)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	self._unit:camera():camera_unit():base():remove_limits()
	self._unit:camera():camera_unit():base().bipod_location = nil
	local exit_data = {}
	exit_data.skip_equip = true
	self._dye_risk = nil
	PlayerStandard.IDS_RECOIL = Idstring("recoil")
	PlayerStandard.IDS_RECOIL_ENTER = Idstring("recoil_enter")
	PlayerStandard.IDS_RECOIL_LOOP = Idstring("recoil_loop")
	PlayerStandard.IDS_RECOIL_EXIT = Idstring("recoil_exit")
	self._unit:sound_source():post_event("wp_steady_out")
	local peer_id = managers.network:session():peer_by_unit(self._unit):id()
	Application:trace("PlayerBipod:exit: ", peer_id)
	managers.player:set_bipod_data_for_peer({peer_id = peer_id})
	return exit_data
end
function PlayerBipod:_husk_bipod_data()
	local peer_id = managers.network:session():peer_by_unit(self._unit):id()
	local weapon = self._unit:inventory():equipped_unit()
	local bipod_obj = weapon:get_object(Idstring("a_bp"))
	local bipod_pos
	if bipod_obj then
		bipod_pos = bipod_obj:position()
		Application:trace("Getting bipod obj: ", bipod_pos)
	else
		Application:trace("Missing bipod obj: ", bipod_pos)
	end
	local body_pos = Vector3(self._m_pos.x, self._m_pos.y, self._m_pos.z)
	managers.player:set_bipod_data_for_peer({
		peer_id = peer_id,
		bipod_pos = bipod_pos,
		body_pos = body_pos
	})
	managers.network:session():send_to_peers_synched("sync_bipod", bipod_pos, body_pos)
end
function PlayerBipod:update(t, dt)
	PlayerBipod.super.update(self, t, dt)
	local deploy_valid = self._equipped_unit:base():is_bipod_usable()
	local movement_distance = self._unit_deploy_position - managers.player:player_unit():position():length()
	if not managers.player:player_unit():mover():standing() or movement_distance > 10 or not deploy_valid then
		self:exit(nil, "standard")
		managers.player:set_player_state("standard")
	end
end
function PlayerBipod:set_tweak_data(name)
end
function PlayerBipod:_update_check_actions(t, dt)
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
	self:_check_action_duck(t, input)
	self:_check_action_steelsight(t, input)
	self:_check_use_item(t, input)
	self:_check_action_unmount_bipod(t, input)
	self:_find_pickups(t)
end
function PlayerBipod:interaction_blocked()
	return true
end
function PlayerBipod:_check_step(t)
end
function PlayerBipod:_check_action_reload(t, input)
	local new_action
	local action_wanted = input.btn_reload_press
	if action_wanted and self._equipped_unit and not self._equipped_unit:base():clip_full() then
		self:exit(nil, "standard")
		managers.player:set_player_state("standard")
		self:_start_action_reload_enter(t)
		new_action = true
	end
	return new_action
end
function PlayerBipod:_check_action_run(...)
end
function PlayerBipod:_check_use_item(t, input)
end
function PlayerBipod:_check_action_unmount_bipod(t, input)
	if not input.btn_deploy_bipod then
		return
	end
	local weapon = self._equipped_unit:base()
	local bipod_part = managers.weapon_factory:get_parts_from_weapon_by_perk("bipod", weapon._parts)
	if bipod_part and bipod_part[1] then
		local bipod_unit = bipod_part[1].unit:base()
		bipod_unit:_unmount()
		self:exit(nil, "standard")
		managers.player:set_player_state("standard")
	end
end
function PlayerBipod:_check_change_weapon(t, input)
	local new_action
	local action_wanted = input.btn_switch_weapon_press
	if action_wanted then
		local action_forbidden = self:_changing_weapon()
		action_forbidden = action_forbidden or self._use_item_expire_t or self._change_item_expire_t
		action_forbidden = action_forbidden or self._unit:inventory():num_selections() == 1
		if not action_forbidden then
			local data = {}
			data.next = true
			self:exit(nil, "standard")
			managers.player:set_player_state("standard")
			new_action = true
		end
	end
	return new_action
end
function PlayerBipod:_check_action_equip(t, input)
	local new_action
	local selection_wanted = input.btn_primary_choice
	if selection_wanted then
		local action_forbidden = self:chk_action_forbidden("equip")
		action_forbidden = action_forbidden or not self._ext_inventory:is_selection_available(selection_wanted) or self._use_item_expire_t or self:_changing_weapon()
		if not action_forbidden then
			local new_action = not self._ext_inventory:is_equipped(selection_wanted)
			if new_action then
				self:exit(nil, "standard")
				managers.player:set_player_state("standard")
			end
		end
	end
	return new_action
end
function PlayerBipod:_check_action_steelsight(t, input)
end
function PlayerBipod:_update_movement(t, dt)
end
function PlayerBipod:_start_action_jump(...)
end
function PlayerBipod:_perform_jump(jump_vec)
end
function PlayerBipod:_get_max_walk_speed(...)
end
function PlayerBipod:_get_walk_headbob(...)
	return 0
end
function PlayerBipod:pre_destroy(unit)
end
function PlayerBipod:destroy()
end
