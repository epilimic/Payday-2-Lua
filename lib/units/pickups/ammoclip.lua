AmmoClip = AmmoClip or class(Pickup)
AmmoClip.EVENT_IDS = {}
AmmoClip.EVENT_IDS.bonnie_share_ammo = 1
function AmmoClip:init(unit)
	AmmoClip.super.init(self, unit)
	self._ammo_type = ""
end
function AmmoClip:_pickup(unit)
	if self._picked_up then
		return
	end
	local inventory = unit:inventory()
	if not unit:character_damage():dead() and inventory then
		local picked_up = false
		for _, weapon in pairs(inventory:available_selections()) do
			if not self._weapon_category or self._weapon_category == weapon.unit:base():weapon_tweak_data().category then
				picked_up = weapon.unit:base():add_ammo(1, self._ammo_count) or picked_up
				if picked_up and tweak_data.achievement.pickup_sticks and self._weapon_category == tweak_data.achievement.pickup_sticks.weapon_category then
					managers.achievment:award_progress(tweak_data.achievement.pickup_sticks.stat)
				end
			end
		end
		if picked_up then
			self._picked_up = true
			local restored_health
			if not unit:character_damage():is_downed() and managers.player:has_category_upgrade("temporary", "loose_ammo_restore_health") and not managers.player:has_activate_temporary_upgrade("temporary", "loose_ammo_restore_health") then
				managers.player:activate_temporary_upgrade("temporary", "loose_ammo_restore_health")
				local values = managers.player:temporary_upgrade_value("temporary", "loose_ammo_restore_health", 0)
				if values ~= 0 then
					local restore_value = math.random(values[1], values[2])
					local base = tweak_data.upgrades.loose_ammo_restore_health_values.base
					local sync_value = math.round(math.clamp(restore_value - base, 0, 14))
					restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
					unit:character_damage():restore_health(restore_value, true)
					unit:sound():play("pickup_ammo_health_boost", nil, true)
					if managers.player:has_category_upgrade("player", "loose_ammo_restore_health_give_team") then
						managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", 2 + sync_value)
					end
				end
			end
			if managers.player:has_category_upgrade("temporary", "loose_ammo_give_team") and not managers.player:has_activate_temporary_upgrade("temporary", "loose_ammo_give_team") then
				managers.player:activate_temporary_upgrade("temporary", "loose_ammo_give_team")
				managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "pickup", AmmoClip.EVENT_IDS.bonnie_share_ammo)
			end
			if Network:is_client() then
				managers.network:session():send_to_host("sync_pickup", self._unit)
			end
			unit:sound():play(self._pickup_event or "pickup_ammo", nil, true)
			self:consume()
			return true
		end
	end
	return false
end
function AmmoClip:sync_net_event(event, peer)
	local player = managers.player:local_player()
	if not alive(player) or not player:character_damage() or player:character_damage():is_downed() or player:character_damage():dead() then
		return
	end
	if event == AmmoClip.EVENT_IDS.bonnie_share_ammo then
		local inventory = player:inventory()
		if inventory then
			local picked_up = false
			for id, weapon in pairs(inventory:available_selections()) do
				picked_up = weapon.unit:base():add_ammo(tweak_data.upgrades.loose_ammo_give_team_ratio or 0.25) or picked_up
			end
			if picked_up then
				player:sound():play(self._pickup_event or "pickup_ammo", nil, true)
				for id, weapon in pairs(inventory:available_selections()) do
					managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
				end
			end
		end
	elseif event > AmmoClip.EVENT_IDS.bonnie_share_ammo then
		local restore_value = event - 2 + (tweak_data.upgrades.loose_ammo_restore_health_values.base or 3)
		restore_value = restore_value * (tweak_data.upgrades.loose_ammo_restore_health_values.multiplier or 0.1)
		restore_value = restore_value * (tweak_data.upgrades.loose_ammo_give_team_health_ratio or 0.35)
		player:character_damage():restore_health(restore_value, true)
		player:sound():play("pickup_ammo_health_boost", nil, true)
	end
end
