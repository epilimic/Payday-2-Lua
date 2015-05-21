NpcVehicleDamage = NpcVehicleDamage or class(VehicleDamage)
NpcVehicleDamage.VEHICLE_DEFAULT_HEALTH = 100
function NpcVehicleDamage:init(unit)
	VehicleDamage.init(self, unit)
	self._is_alive = true
	Application:trace("NpcVehicleDamage:init( unit )")
end
function NpcVehicleDamage:damage_bullet(attack_data)
	if self._unit:vehicle_driving() and not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "bullet"},
		attacker_unit = attack_data.attacker_unit
	}
	if self._invulnerable then
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
	return attack_data.result
end
function NpcVehicleDamage:damage_explosion(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "explosion"}
	}
	if self._invulnerable then
		self:_call_listeners(damage_info)
		return
	elseif self:incapacitated() then
		return
	elseif self:_chk_dmg_too_soon(attack_data.damage) then
		return
	end
	self:_health_recap(attack_data)
end
function NpcVehicleDamage:damage_fire(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "fire"}
	}
	if self._invulnerable then
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
function NpcVehicleDamage:damage_collision(attack_data)
	if not self._unit:vehicle_driving():is_vulnerable() then
		return
	end
	local damage_info = {
		result = {type = "hurt", variant = "collision"}
	}
	if self._invulnerable then
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
function NpcVehicleDamage:is_friendly_fire(attacker_unit)
	local friendly_fire = false
	if not attacker_unit then
		return
	end
	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		return false
	end
	friendly_fire = attacker_unit:movement():team().foes[self._team_police]
	return not friendly_fire
end
function NpcVehicleDamage:_set_health_recap()
	local current_health = self:get_real_health()
	if current_health <= 0 and self._is_alive then
		self._is_alive = false
		self._unit:npc_vehicle_driving():on_vehicle_death()
	end
end
function NpcVehicleDamage:spawn_broken_smoke_effect()
	if not self._broken_effect_id then
		local engine_locator = self._unit:get_object(self._broken_engine_locator)
		if engine_locator then
			self._broken_effect_id = World:effect_manager():spawn({
				effect = self._broken_effect,
				parent = engine_locator
			})
		end
	end
end
