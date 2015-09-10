TankCopDamage = TankCopDamage or class(CopDamage)
function TankCopDamage:init(...)
	TankCopDamage.super.init(self, ...)
	self._is_halloween = self._unit:name() == Idstring("units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4")
end
function TankCopDamage:damage_bullet(attack_data, ...)
	if self._is_halloween then
		attack_data.damage = math.min(attack_data.damage, 235)
	end
	return TankCopDamage.super.damage_bullet(self, attack_data, ...)
end
function TankCopDamage:damage_melee(attack_data)
	local tweak_data = tweak_data.blackmarket.melee_weapons[attack_data.name_id]
	if tweak_data and (tweak_data.type == "knife" or tweak_data.type == "sword" or attack_data.name_id == "boxing_gloves") then
		return TankCopDamage.super.damage_melee(self, attack_data)
	else
		return
	end
end
function TankCopDamage:seq_clbk_vizor_shatter()
	if not self._unit:character_damage():dead() then
		self._unit:sound():say("visor_lost")
	end
end
