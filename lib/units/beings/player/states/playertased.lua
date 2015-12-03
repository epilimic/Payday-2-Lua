PlayerTased = PlayerTased or class(PlayerStandard)
PlayerTased._update_movement = PlayerBleedOut._update_movement
function PlayerTased:enter(state_data, enter_data)
	PlayerTased.super.enter(self, state_data, enter_data)
	self._ids_tased_boost = Idstring("tased_boost")
	self._ids_tased = Idstring("tased")
	self._ids_counter_tase = Idstring("tazer_counter")
	self:_start_action_tased(managers.player:player_timer():time(), state_data.non_lethal_electrocution)
	if state_data.non_lethal_electrocution then
		state_data.non_lethal_electrocution = nil
		local recover_time = Application:time() + tweak_data.player.damage.TASED_TIME * managers.player:upgrade_value("player", "electrocution_resistance_multiplier", 1)
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
		managers.enemy:add_delayed_clbk(self._recover_delayed_clbk, callback(self, self, "clbk_exit_to_std"), recover_time)
	else
		self._fatal_delayed_clbk = "PlayerTased_fatal_delayed_clbk"
		managers.enemy:add_delayed_clbk(self._fatal_delayed_clbk, callback(self, self, "clbk_exit_to_fatal"), TimerManager:game():time() + tweak_data.player.damage.TASED_TIME)
	end
	self._next_shock = 0.5
	self._taser_value = 1
	self._num_shocks = 0
	managers.groupai:state():on_criminal_disabled(self._unit, "electrified")
	if Network:is_server() then
		self:_register_revive_SO()
	end
	self._equipped_unit:base():on_reload()
	local projectile_entry = managers.blackmarket:equipped_projectile()
	if tweak_data.blackmarket.projectiles[projectile_entry].is_a_grenade then
		self:_interupt_action_throw_grenade()
	else
		self:_interupt_action_throw_projectile()
	end
	self:_interupt_action_reload()
	self:_interupt_action_steelsight()
	self:_interupt_action_melee(managers.player:player_timer():time())
	self:_interupt_action_ladder(managers.player:player_timer():time())
	self:_interupt_action_charging_weapon(managers.player:player_timer():time())
	self._rumble_electrified = managers.rumble:play("electrified")
end
function PlayerTased:_enter(enter_data)
	self._unit:base():set_slot(self._unit, 2)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	self._ext_movement:set_attention_settings({
		"pl_friend_combatant_cbt",
		"pl_friend_non_combatant_cbt",
		"pl_foe_combatant_cbt_stand",
		"pl_foe_non_combatant_cbt_stand"
	})
	if Network:is_server() and self._ext_movement:nav_tracker() then
		managers.groupai:state():on_player_weapons_hot()
	end
end
function PlayerTased:exit(state_data, enter_data)
	PlayerTased.super.exit(self, state_data, enter_data)
	if self._fatal_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._fatal_delayed_clbk)
		self._fatal_delayed_clbk = nil
	end
	if self._recover_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._recover_delayed_clbk)
		self._recover_delayed_clbk = nil
	end
	if Network:is_server() and self._SO_id then
		managers.groupai:state():remove_special_objective(self._SO_id)
	end
	managers.environment_controller:set_taser_value(1)
	self._camera_unit:base():break_recoil()
	self._unit:sound():play("tasered_stop")
	managers.rumble:stop(self._rumble_electrified)
	self._unit:camera():play_redirect(Idstring("idle"))
	self._tase_ended = nil
	self._counter_taser_unit = nil
	self._num_shocks = nil
end
function PlayerTased:interaction_blocked()
	return true
end
function PlayerTased:update(t, dt)
	PlayerTased.super.update(self, t, dt)
end
function PlayerTased:_update_check_actions(t, dt)
	local input = self:_get_input()
	if t > self._next_shock then
		self._num_shocks = self._num_shocks + 1
		self._next_shock = t + 0.25 + math.rand(1)
		self._unit:camera():play_shaker("player_taser_shock", 1, 10)
		self._unit:camera():camera_unit():base():set_target_tilt((math.random(2) == 1 and -1 or 1) * math.random(10))
		self._taser_value = math.max(self._taser_value - 0.25, 0)
		self._unit:sound():play("tasered_shock")
		managers.rumble:play("electric_shock")
		if not alive(self._counter_taser_unit) then
			self._camera_unit:base():start_shooting()
			self._recoil_t = t + 0.5
			if not managers.player:has_category_upgrade("player", "resist_firing_tased") then
				input.btn_primary_attack_state = true
				input.btn_primary_attack_press = true
			end
			self._camera_unit:base():recoil_kick(-5, 5, -5, 5)
			self._unit:camera():play_redirect(self._ids_tased_boost)
		end
	elseif self._recoil_t then
		if not managers.player:has_category_upgrade("player", "resist_firing_tased") then
			input.btn_primary_attack_state = true
		end
		if t > self._recoil_t then
			self._recoil_t = nil
			self._camera_unit:base():stop_shooting()
		end
	end
	self._taser_value = math.step(self._taser_value, 0.8, dt / 4)
	managers.environment_controller:set_taser_value(self._taser_value)
	self._shooting = self:_check_action_primary_attack(t, input)
	if self._shooting then
		self._camera_unit:base():recoil_kick(-5, 5, -5, 5)
	end
	if self._unequip_weapon_expire_t and t >= self._unequip_weapon_expire_t then
		self._unequip_weapon_expire_t = nil
		self:_start_action_equip_weapon(t)
	end
	if self._equip_weapon_expire_t and t >= self._equip_weapon_expire_t then
		self._equip_weapon_expire_t = nil
	end
	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end
	self:_update_foley(t, input)
	local new_action
	if not new_action then
	end
	self:_check_action_interact(t, input)
	local new_action
end
function PlayerTased:_check_action_primary_attack(t, input)
	local new_action
	local action_forbidden = self:chk_action_forbidden("primary_attack")
	action_forbidden = action_forbidden or self:_is_reloading() or self:_changing_weapon() or self._melee_expire_t or self._use_item_expire_t or self:_interacting() or alive(self._counter_taser_unit)
	local action_wanted = input.btn_primary_attack_state
	if action_wanted then
		if not action_forbidden then
			self._queue_reload_interupt = nil
			self._ext_inventory:equip_selected_primary(false)
			if self._equipped_unit then
				local weap_base = self._equipped_unit:base()
				local fire_mode = weap_base:fire_mode()
				if weap_base:out_of_ammo() then
					if input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif weap_base.clip_empty and weap_base:clip_empty() then
					if fire_mode == "single" and input.btn_primary_attack_press then
						weap_base:dryfire()
					end
				elseif self._num_shocks > 1 and weap_base.can_refire_while_tased and not weap_base:can_refire_while_tased() then
				elseif self._running then
					self:_interupt_action_running(t)
				else
					if not self._shooting and weap_base:start_shooting_allowed() then
						local start = fire_mode == "single" and input.btn_primary_attack_press
						start = start or fire_mode ~= "single" and input.btn_primary_attack_state
						if start then
							weap_base:start_shooting()
							self._camera_unit:base():start_shooting()
							if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier()) then
								weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier())
							end
						end
					end
					local suppression_ratio = self._unit:character_damage():effective_suppression_ratio()
					local spread_mul = math.lerp(1, tweak_data.player.suppression.spread_mul, suppression_ratio)
					local autohit_mul = math.lerp(1, tweak_data.player.suppression.autohit_chance_mul, suppression_ratio)
					local suppression_mul = managers.blackmarket:threat_multiplier()
					local dmg_mul = managers.player:temporary_upgrade_value("temporary", "dmg_multiplier_outnumbered", 1)
					local weapon_category = weap_base:weapon_tweak_data().category
					if managers.player:has_category_upgrade("player", "overkill_all_weapons") or weapon_category == "shotgun" or weapon_category == "saw" then
						dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
					end
					local health_ratio = self._ext_damage:health_ratio()
					local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, weapon_category)
					if damage_health_ratio > 0 then
						local upgrade_name = weapon_category == "saw" and "melee_damage_health_ratio_multiplier" or "damage_health_ratio_multiplier"
						local damage_ratio = damage_health_ratio
						dmg_mul = dmg_mul * (1 + managers.player:upgrade_value("player", upgrade_name, 0) * damage_ratio)
					end
					dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
					if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
						self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
						self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
						local stack = self._state_data.stacking_dmg_mul[weapon_category]
						if stack[1] and t < stack[1] then
							dmg_mul = dmg_mul * (1 + managers.player:upgrade_value(weapon_category, "stacking_hit_damage_multiplier", 0) * stack[2])
						else
							stack[2] = 0
						end
					end
					local fired
					if fire_mode == "single" then
						if input.btn_primary_attack_press then
							fired = weap_base:trigger_pressed(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
							if weap_base:fire_on_release() then
								if weap_base.set_tased_shot then
									weap_base:set_tased_shot(true)
								end
								fired = weap_base:trigger_released(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
								if weap_base.set_tased_shot then
									weap_base:set_tased_shot(false)
								end
							end
						end
					elseif input.btn_primary_attack_state then
						fired = weap_base:trigger_held(self._ext_camera:position(), self._ext_camera:forward(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
					end
					new_action = true
					if fired then
						local weap_tweak_data = tweak_data.weapon[weap_base:get_name_id()]
						if not self._state_data.in_steelsight then
						elseif weap_tweak_data.animations.recoil_steelsight then
						end
						local recoil_multiplier = weap_base:recoil() * weap_base:recoil_multiplier() + weap_base:recoil_addend()
						local up, down, left, right = unpack(weap_tweak_data.kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])
						self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
						local spread_multiplier = weap_base:spread_multiplier()
						self._equipped_unit:base():tweak_data_anim_stop("unequip")
						self._equipped_unit:base():tweak_data_anim_stop("equip")
						if managers.player:has_category_upgrade(weapon_category, "stacking_hit_damage_multiplier") then
							self._state_data.stacking_dmg_mul = self._state_data.stacking_dmg_mul or {}
							self._state_data.stacking_dmg_mul[weapon_category] = self._state_data.stacking_dmg_mul[weapon_category] or {nil, 0}
							local stack = self._state_data.stacking_dmg_mul[weapon_category]
							if fired.hit_enemy then
								stack[1] = t + managers.player:upgrade_value(weapon_category, "stacking_hit_expire_t", 1)
								stack[2] = math.min(stack[2] + 1, tweak_data.upgrades.max_weapon_dmg_mul_stacks or 5)
							else
								stack[1] = nil
								stack[2] = 0
							end
						end
						managers.hud:set_ammo_amount(weap_base:selection_index(), weap_base:ammo_info())
						if self._ext_network then
							local impact = not fired.hit_enemy
							self._ext_network:send("shot_blank", impact)
						end
					elseif fire_mode == "single" then
						new_action = false
					end
				end
			end
		elseif self:_is_reloading() and self._equipped_unit:base():reload_interuptable() and input.btn_primary_attack_press then
			self._queue_reload_interupt = true
		end
	else
	end
	if not new_action and self._shooting then
		self._equipped_unit:base():stop_shooting()
		self._camera_unit:base():stop_shooting()
	end
	return new_action
end
function PlayerTased:_check_action_interact(t, input)
	if input.btn_interact_press and (not self._intimidate_t or t - self._intimidate_t > tweak_data.player.movement_state.interaction_delay) and not alive(self._counter_taser_unit) then
		self._intimidate_t = t
		self:call_teammate(nil, t, true, true)
	end
end
function PlayerTased:call_teammate(line, t, no_gesture, skip_alert)
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, false, false, true, false)
	local interact_type, queue_name
	if voice_type == "stop_cop" or voice_type == "mark_cop" then
		local prime_target_tweak = tweak_data.character[prime_target.unit:base()._tweak_table]
		local shout_sound = prime_target_tweak.priority_shout
		shout_sound = managers.groupai:state():whisper_mode() and prime_target_tweak.silent_priority_shout or shout_sound
		if shout_sound then
			interact_type = "cmd_point"
			queue_name = "s07x_sin"
			if managers.player:has_category_upgrade("player", "special_enemy_highlight") then
				prime_target.unit:contour():add(managers.player:has_category_upgrade("player", "marked_enemy_extra_damage") and "mark_enemy_damage_bonus" or "mark_enemy", true, managers.player:upgrade_value("player", "mark_enemy_time_multiplier", 1))
			end
			if not self._tase_ended and managers.player:has_category_upgrade("player", "taser_self_shock") and prime_target.unit:key() == self._unit:character_damage():tase_data().attacker_unit:key() then
				self:_start_action_counter_tase(t, prime_target)
			end
		end
	end
	if interact_type then
		if not no_gesture then
		else
		end
		self:_do_action_intimidate(t, interact_type or nil, queue_name, skip_alert)
	end
end
function PlayerTased:_start_action_tased(t, non_lethal)
	self:_interupt_action_running(t)
	self:_stance_entered()
	self:_update_crosshair_offset()
	self._unit:camera():play_redirect(self._ids_tased)
	self._unit:sound():play("tasered_loop")
	managers.hint:show_hint(non_lethal and "hint_been_electrocuted" or "hint_been_tasered")
end
function PlayerTased:_start_action_counter_tase(t, prime_target)
	self._counter_taser_unit = prime_target.unit
	self._unit:camera():play_redirect(self._ids_counter_tase)
end
function PlayerTased:_register_revive_SO()
	if self._SO_id or not managers.navigation:is_data_ready() then
		return
	end
	local objective = {
		type = "follow",
		follow_unit = self._unit,
		called = true,
		destroy_clbk_key = false,
		scan = true,
		nav_seg = self._unit:movement():nav_tracker():nav_segment()
	}
	local so_descriptor = {
		objective = objective,
		base_chance = 1,
		chance_inc = 0,
		interval = 6,
		search_dis_sq = 25000000,
		search_pos = self._unit:position(),
		usage_amount = 1,
		AI_group = "friendlies"
	}
	local so_id = "PlayerTased_assistance"
	self._SO_id = so_id
	managers.groupai:state():add_special_objective(so_id, so_descriptor)
end
function PlayerTased:clbk_exit_to_fatal()
	self._fatal_delayed_clbk = nil
	managers.player:set_player_state("incapacitated")
end
function PlayerTased:clbk_exit_to_std()
	self._recover_delayed_clbk = nil
	Application:debug("PlayerTased:clbk_exit_to_std(), game_state_machine:last_queued_state_name()", game_state_machine:last_queued_state_name())
	if game_state_machine:last_queued_state_name() == "ingame_electrified" and managers.network:session() then
		managers.player:set_player_state("standard")
	end
end
function PlayerTased:on_tase_ended()
	self._tase_ended = true
	if self._fatal_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._fatal_delayed_clbk)
		self._fatal_delayed_clbk = nil
	end
	if not self._recover_delayed_clbk and game_state_machine:last_queued_state_name() == "ingame_electrified" and managers.network:session() then
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"
		managers.enemy:add_delayed_clbk(self._recover_delayed_clbk, callback(self, self, "clbk_exit_to_std"), TimerManager:game():time() + tweak_data.player.damage.TASED_RECOVER_TIME)
	end
end
function PlayerTased:give_shock_to_taser()
	if not alive(self._counter_taser_unit) then
		return
	end
	self:_give_shock_to_taser(self._counter_taser_unit)
end
function PlayerTased:_give_shock_to_taser(taser_unit)
	local action_data = {
		variant = "counter_tased",
		damage = taser_unit:character_damage()._HEALTH_INIT * (tweak_data.upgrades.counter_taser_damage or 0.2),
		damage_effect = taser_unit:character_damage()._HEALTH_INIT * 2,
		attacker_unit = self._unit,
		attack_dir = -taser_unit:movement()._action_common_data.fwd,
		col_ray = {
			position = mvector3.copy(taser_unit:movement():m_head_pos()),
			body = taser_unit:body("body")
		}
	}
	taser_unit:character_damage():damage_melee(action_data)
end
