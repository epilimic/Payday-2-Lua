VehicleDamage = VehicleDamage or class()
VehicleDamage.VEHICLE_DEFAULT_HEALTH = 100
function VehicleDamage:init(unit)
	self._unit = unit
	self._unit:set_extension_update_enabled(Idstring("character_damage"), false)
	self._god_mode = Global.god_mode
	self._invulnerable = false
	self._incapacitated = nil
	self._listener_holder = EventListenerHolder:new()
	self._health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	self._current_max_health = VehicleDamage.VEHICLE_DEFAULT_HEALTH
	self._next_allowed_dmg_t = Application:digest_value(-100, true)
	self._last_received_dmg = 0
end
function VehicleDamage:set_tweak_data(data)
	self._tweak_data = data
	self._current_max_health = self._tweak_data.damage.max_health
	self._health = self._tweak_data.damage.max_health
end
function VehicleDamage:damage_killzone(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "killzone"}
	}
	if self._god_mode or self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	end
	local health_subtracted = self:_calc_health_damage(attack_data)
	if self:get_real_health() <= 0 then
		self._health = 0
		self._unit:vehicle_driving():on_vehicle_death()
	end
	self:_send_vehicle_health(self._health)
	self:_call_listeners(damage_info)
end
function VehicleDamage:damage_bullet(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	if self._god_mode then
		if attack_data.damage > 0 then
		end
		self:_call_listeners(damage_info)
		return
	elseif self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:is_friendly_fire(attack_data.attacker_unit) then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	local health_subtracted = self:_calc_health_damage(attack_data)
	if 0 >= self:get_real_health() then
		self._health = 0
		self._unit:vehicle_driving():on_vehicle_death()
	end
	local result
	local damage = attack_data.damage
	if damage >= self._health then
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
	else
		attack_data.damage = damage
		result = {
			type = "hurt",
			variant = attack_data.variant
		}
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local attacker = attack_data.attacker_unit
	if attacker:id() == -1 then
		attacker = self._unit
	end
	self:_send_vehicle_health(self._health)
	return result
end
function VehicleDamage:damage_explosion(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "explosion"}
	}
	if self._god_mode or self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	end
	local health_subtracted = self:_calc_health_damage(attack_data)
	if self:get_real_health() <= 0 then
		self._health = 0
		self._unit:vehicle_driving():on_vehicle_death()
	end
	self:_send_vehicle_health(self._health)
	self:_call_listeners(damage_info)
end
function VehicleDamage:damage_fire(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "fire"}
	}
	if self._god_mode or self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	end
	local health_subtracted = self:_calc_health_damage(attack_data)
	if self:get_real_health() <= 0 then
		self._health = 0
		self._unit:vehicle_driving():on_vehicle_death()
	end
	self:_send_vehicle_health(self._health)
	self:_call_listeners(damage_info)
end
function VehicleDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, death)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	if self.dead() then
		return
	end
	local damage = damage_percent * self:_max_health() / 100
	local attack_data = {}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())
	mvector3.set_z(hit_pos, hit_pos.z + hit_offset_height)
	attack_data.pos = hit_pos
	local attack_dir, distance
	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:movement():m_head_pos()
		distance = mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	local shotgun_push, result
	if death then
		result = {type = "death", variant = "bullet"}
	else
		result = {type = "hurt", variant = "bullet"}
		self._health = self._health - damage
		self._health_ratio = self._health / self:_max_health()
	end
	attack_data.variant = "bullet"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	self:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
end
function VehicleDamage:_send_vehicle_health(health)
	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_ai_vehicle_action", "health", self._unit, health, nil)
	end
end
function VehicleDamage:sync_vehicle_health(health)
	self._health = tonumber(health)
end
function VehicleDamage:_on_damage_received(damage_info)
	Application:debug(" .... VehicleDamage:_on_damage_received: ", inspect(damage_info))
	self:_call_listeners(damage_info)
end
function VehicleDamage:_calc_health_damage(attack_data)
	local health_subtracted = 0
	health_subtracted = self:get_real_health()
	self:change_health(-attack_data.damage)
	self:_send_set_health()
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
	self:set_health(self:_max_health())
end
function VehicleDamage:need_revive()
	return self.dead()
end
function VehicleDamage:dead()
	return self._health <= 0
end
function VehicleDamage:is_friendly_fire(attacker_unit)
	if not attacker_unit then
		return
	end
	local unit_is_criminal = attacker_unit:in_slot(managers.slot:get_mask("criminals")) or attacker_unit:in_slot(managers.slot:get_mask("harmless_criminals"))
	return not unit_is_criminal
end
function VehicleDamage:_chk_dmg_too_soon(damage)
	local next_allowed_dmg_t = type(self._next_allowed_dmg_t) == "number" and self._next_allowed_dmg_t or Application:digest_value(self._next_allowed_dmg_t, false)
	if damage <= self._last_received_dmg + 0.01 and next_allowed_dmg_t > managers.player:player_timer():time() then
		return true
	end
end
function VehicleDamage:_hit_direction(col_ray)
	if col_ray then
		local dir = col_ray.ray
		local infront = math.dot(self._unit:camera():forward(), dir)
		if infront < -0.9 then
			managers.environment_controller:hit_feedback_front()
		elseif infront > 0.9 then
			managers.environment_controller:hit_feedback_back()
			managers.hud:on_hit_direction("right")
		else
			local polar = self._unit:camera():forward():to_polar_with_reference(-dir, Vector3(0, 0, 1))
			local direction = Vector3(polar.spin, polar.pitch, 0):normalized()
			if math.abs(direction.x) > math.abs(direction.y) then
				if 0 > direction.x then
					managers.environment_controller:hit_feedback_left()
					managers.hud:on_hit_direction("left")
				else
					managers.environment_controller:hit_feedback_right()
					managers.hud:on_hit_direction("right")
				end
			elseif 0 > direction.y then
				managers.environment_controller:hit_feedback_up()
				managers.hud:on_hit_direction("up")
			else
				managers.environment_controller:hit_feedback_down()
				managers.hud:on_hit_direction("down")
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
function VehicleDamage:_send_set_health()
	if self._unit:network() then
		local hp = math.round(self:get_real_health() / self:_max_health() * 100)
		self._unit:network():send("set_health", math.clamp(hp, 0, 100))
	end
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
function VehicleDamage:die(variant)
end
