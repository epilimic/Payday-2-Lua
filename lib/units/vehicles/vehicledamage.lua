VehicleDamage = VehicleDamage or class()
VehicleDamage.VEHICLE_DEFAULT_HEALTH = 100
function VehicleDamage:init(unit)
	self._unit = unit
	self._unit:set_extension_update_enabled(Idstring("character_damage"), false)
	self._incapacitated = nil
	self._listener_holder = EventListenerHolder:new()
	self._health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	self._current_max_health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	self._next_allowed_dmg_t = Application:digest_value(-100, true)
	self._last_received_dmg = 0
	self._team_police = "law1"
	self._team_criminal = "criminal1"
	self._half_damaged_squence_played = false
end
function VehicleDamage:set_tweak_data(data)
	self._tweak_data = data
	self._current_max_health = self._tweak_data.damage.max_health
	self._health = self._tweak_data.damage.max_health
end
function VehicleDamage:is_invulnerable()
	local result = false
	local players_count_inside_vehicle = self._unit:vehicle_driving():num_players_inside()
	if players_count_inside_vehicle <= 0 then
		result = true
	end
	return result
end
function VehicleDamage:damage_mission(dmg)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "killzone"}
	}
	local attack_data = {damage = dmg}
	self:_health_recap(attack_data)
	self:_call_listeners(damage_info)
end
function VehicleDamage:damage_killzone(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "killzone"}
	}
	if Global.god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self:is_invulnerable() then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_health_recap(attack_data)
	self:_call_listeners(damage_info)
end
function VehicleDamage:damage_bullet(attack_data)
	if self._unit:vehicle_driving() and not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	if Global.god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self:is_invulnerable() then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_hit_direction(attack_data.col_ray)
	self:_health_recap(attack_data)
	return attack_data.result
end
function VehicleDamage:damage_explosion(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "explosion"}
	}
	if Global.god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self:is_invulnerable() then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_hit_direction(attack_data.col_ray)
	self:_health_recap(attack_data)
end
function VehicleDamage:damage_fire(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "fire"}
	}
	if Global.god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self:is_invulnerable() then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_hit_direction(attack_data.col_ray)
	self:_health_recap(attack_data)
end
function VehicleDamage:damage_collision(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "collision"}
	}
	if Global.god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self:is_invulnerable() then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_health_recap(attack_data)
end
function VehicleDamage:_send_vehicle_health(health)
	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_ai_vehicle_action", "health", self._unit, health, nil)
	end
end
function VehicleDamage:sync_vehicle_health(health)
	self:set_health(tonumber(health))
	self:_set_health_recap()
end
function VehicleDamage:_on_damage_received(damage_info)
	self:_call_listeners(damage_info)
end
function VehicleDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
	self:change_health(-attack_data.damage)
	self:_set_health_effect()
	return health_subtracted
end
function VehicleDamage:get_real_health()
	return self._health
end
function VehicleDamage:change_health(change_of_health)
	self:set_health(self:get_real_health() + change_of_health)
	if self:get_real_health() < 0 then
		self:set_health(0)
	end
end
function VehicleDamage:incapacitated()
	return self._incapacitated
end
function VehicleDamage:revive()
	self:_revive()
	if managers.network and managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_ai_vehicle_action", "revive", self._unit, nil, nil)
	end
end
function VehicleDamage:_revive()
	self:set_health(self:_max_health())
	self._unit:vehicle_driving():set_state(VehicleDrivingExt.STATE_DRIVING, false)
	if self._unit:damage():has_sequence(VehicleDrivingExt.SEQUENCE_REPAIRED) then
		self._unit:damage():run_sequence_simple(VehicleDrivingExt.SEQUENCE_REPAIRED)
	end
	self._half_damaged_squence_played = false
end
function VehicleDamage:sync_vehicle_revive()
	self:_revive()
end
function VehicleDamage:need_revive()
	return self.dead()
end
function VehicleDamage:dead()
	return self._health <= 0
end
function VehicleDamage:is_friendly_fire(attacker_unit)
	local friendly_fire = false
	if not attacker_unit then
		return
	end
	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		return false
	end
	friendly_fire = attacker_unit:movement():team().foes[self._team_criminal]
	return not friendly_fire
end
function VehicleDamage:_chk_dmg_too_soon(damage)
	local next_allowed_dmg_t = type(self._next_allowed_dmg_t) == "number" and self._next_allowed_dmg_t or Application:digest_value(self._next_allowed_dmg_t, false)
	if damage <= self._last_received_dmg + 0.01 and next_allowed_dmg_t > managers.player:player_timer():time() then
		return true
	end
end
function VehicleDamage:_hit_direction(col_ray)
	local local_player_vehicle = managers.player:get_vehicle()
	if local_player_vehicle and self._unit == local_player_vehicle.vehicle_unit and col_ray then
		local dir = col_ray.ray
		local infront = math.dot(managers.player:local_player():camera():forward(), dir)
		if infront < -0.9 then
		elseif infront > 0.9 then
			managers.hud:on_hit_direction("right", HUDHitDirection.UNIT_TYPE_HIT_VEHICLE)
		else
			local polar = managers.player:local_player():camera():forward():to_polar_with_reference(-dir, Vector3(0, 0, 1))
			local direction = Vector3(polar.spin, polar.pitch, 0):normalized()
			if math.abs(direction.x) > math.abs(direction.y) then
				if 0 > direction.x then
					managers.hud:on_hit_direction("left", HUDHitDirection.UNIT_TYPE_HIT_VEHICLE)
				else
					managers.hud:on_hit_direction("right", HUDHitDirection.UNIT_TYPE_HIT_VEHICLE)
				end
			elseif 0 > direction.y then
				managers.hud:on_hit_direction("up", HUDHitDirection.UNIT_TYPE_HIT_VEHICLE)
			else
				managers.hud:on_hit_direction("down", HUDHitDirection.UNIT_TYPE_HIT_VEHICLE)
			end
		end
	else
	end
end
function VehicleDamage:_call_listeners(damage_info)
	self._listener_holder:call(damage_info.result.type, self._unit, damage_info)
end
function VehicleDamage:add_listener(key, events, clbk)
	events = events or self._all_event_types
	self._listener_holder:add(key, events, clbk)
end
function VehicleDamage:remove_listener(key)
	self._listener_holder:remove(key)
end
function VehicleDamage:set_health(health)
	self._health = health
end
function VehicleDamage:_max_health()
	return self._current_max_health
end
function VehicleDamage:_set_health_effect()
	local hp = self:get_real_health() / self:_max_health()
	math.clamp(hp, 0, 1)
end
function VehicleDamage:_get_attack_variant_index(variant)
	for i, test_variant in ipairs(CopDamage._ATTACK_VARIANTS) do
		if variant == test_variant then
			return i
		end
	end
	debug_pause("variant not found!", variant, inspect(self._ATTACK_VARIANTS))
	return 1
end
function VehicleDamage:_health_recap(attack_data)
	if Network:is_server() then
		self:_calc_health_damage(attack_data)
		self:_set_health_recap()
		self:_send_vehicle_health(self._health)
	end
end
function VehicleDamage:_set_health_recap()
	if not self._half_damaged_squence_played and self:get_real_health() / self:_max_health() <= 0.5 then
		if self._unit:damage():has_sequence(VehicleDrivingExt.SEQUENCE_HALF_DAMAGED) then
			self._unit:damage():run_sequence_simple(VehicleDrivingExt.SEQUENCE_HALF_DAMAGED)
		end
		self._half_damaged_squence_played = true
	end
	if self:get_real_health() <= 0 and self._unit:vehicle_driving():get_state_name() ~= VehicleDrivingExt.STATE_BROKEN then
		self._health = 0
		self._unit:vehicle_driving():on_vehicle_death()
	end
end
