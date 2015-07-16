CarryTweakData = CarryTweakData or class()
function CarryTweakData:init(tweak_data)
	self.value_multiplier = tweak_data.money_manager.bag_value_multiplier
	self.dye = {}
	self.dye.chance = 0.5
	self.dye.value_multiplier = 60
	self.types = {}
	self.types.being = {}
	self.types.being.move_speed_modifier = 0.5
	self.types.being.jump_modifier = 0.5
	self.types.being.can_run = false
	self.types.being.throw_distance_multiplier = 0.5
	self.types.mega_heavy = {}
	self.types.mega_heavy.move_speed_modifier = 0.25
	self.types.mega_heavy.jump_modifier = 0.25
	self.types.mega_heavy.can_run = false
	self.types.mega_heavy.throw_distance_multiplier = 0.125
	self.types.very_heavy = {}
	self.types.very_heavy.move_speed_modifier = 0.25
	self.types.very_heavy.jump_modifier = 0.25
	self.types.very_heavy.can_run = false
	self.types.very_heavy.throw_distance_multiplier = 0.3
	self.types.heavy = {}
	self.types.heavy.move_speed_modifier = 0.5
	self.types.heavy.jump_modifier = 0.5
	self.types.heavy.can_run = false
	self.types.heavy.throw_distance_multiplier = 0.5
	self.types.medium = {}
	self.types.medium.move_speed_modifier = 0.75
	self.types.medium.jump_modifier = 1
	self.types.medium.can_run = false
	self.types.medium.throw_distance_multiplier = 1
	self.types.light = {}
	self.types.light.move_speed_modifier = 1
	self.types.light.jump_modifier = 1
	self.types.light.can_run = true
	self.types.light.throw_distance_multiplier = 1
	self.types.coke_light = {}
	self.types.coke_light.move_speed_modifier = self.types.light.move_speed_modifier
	self.types.coke_light.jump_modifier = self.types.light.jump_modifier
	self.types.coke_light.can_run = self.types.light.can_run
	self.types.coke_light.throw_distance_multiplier = self.types.light.throw_distance_multiplier
	self.types.explosives = deep_clone(self.types.medium)
	self.types.explosives.can_explode = true
	self.small_loot = {}
	self.small_loot.money_bundle = tweak_data:get_value("money_manager", "small_loot", "money_bundle")
	self.small_loot.diamondheist_vault_bust = tweak_data:get_value("money_manager", "small_loot", "diamondheist_vault_bust")
	self.small_loot.diamondheist_vault_diamond = tweak_data:get_value("money_manager", "small_loot", "diamondheist_vault_diamond")
	self.small_loot.diamondheist_big_diamond = tweak_data:get_value("money_manager", "small_loot", "diamondheist_big_diamond")
	self.small_loot.mus_small_artifact = tweak_data:get_value("money_manager", "small_loot", "mus_small_artifact")
	self.small_loot.value_gold = tweak_data:get_value("money_manager", "small_loot", "value_gold")
	self.small_loot.gen_atm = tweak_data:get_value("money_manager", "small_loot", "gen_atm")
	self.small_loot.special_deposit_box = tweak_data:get_value("money_manager", "small_loot", "special_deposit_box")
	self.small_loot.slot_machine_payout = tweak_data:get_value("money_manager", "small_loot", "slot_machine_payout")
	self.small_loot.vault_loot_chest = tweak_data:get_value("money_manager", "small_loot", "vault_loot_chest")
	self.small_loot.vault_loot_diamond_chest = tweak_data:get_value("money_manager", "small_loot", "vault_loot_diamond_chest")
	self.small_loot.vault_loot_banknotes = tweak_data:get_value("money_manager", "small_loot", "vault_loot_banknotes")
	self.small_loot.vault_loot_silver = tweak_data:get_value("money_manager", "small_loot", "vault_loot_silver")
	self.small_loot.vault_loot_diamond_collection = tweak_data:get_value("money_manager", "small_loot", "vault_loot_diamond_collection")
	self.small_loot.vault_loot_trophy = tweak_data:get_value("money_manager", "small_loot", "vault_loot_trophy")
	self.small_loot.money_wrap_single_bundle_vscaled = tweak_data:get_value("money_manager", "small_loot", "money_wrap_single_bundle_vscaled")
	self.small_loot.spawn_bucket_of_money = tweak_data:get_value("money_manager", "small_loot", "spawn_bucket_of_money")
	self.small_loot.vault_loot_gold = tweak_data:get_value("money_manager", "small_loot", "vault_loot_gold")
	self.small_loot.vault_loot_cash = tweak_data:get_value("money_manager", "small_loot", "vault_loot_cash")
	self.small_loot.vault_loot_coins = tweak_data:get_value("money_manager", "small_loot", "vault_loot_coins")
	self.small_loot.vault_loot_ring = tweak_data:get_value("money_manager", "small_loot", "vault_loot_ring")
	self.small_loot.vault_loot_jewels = tweak_data:get_value("money_manager", "small_loot", "vault_loot_jewels")
	self.small_loot.vault_loot_macka = tweak_data:get_value("money_manager", "small_loot", "vault_loot_macka")
	self.gold = {}
	self.gold.type = "heavy"
	self.gold.name_id = "hud_carry_gold"
	self.gold.bag_value = "gold"
	self.gold.AI_carry = {SO_category = "enemies"}
	self.money = {}
	self.money.type = "medium"
	self.money.name_id = "hud_carry_money"
	self.money.bag_value = "money"
	self.money.dye = true
	self.money.AI_carry = {SO_category = "enemies"}
	self.diamonds = {}
	self.diamonds.type = "light"
	self.diamonds.name_id = "hud_carry_diamonds"
	self.diamonds.bag_value = "diamonds"
	self.diamonds.AI_carry = {SO_category = "enemies"}
	self.painting = {}
	self.painting.type = "light"
	self.painting.name_id = "hud_carry_painting"
	self.painting.bag_value = "painting"
	self.painting.visual_object = "g_canvas_bag"
	self.painting.unit = "units/payday2/pickups/gen_pku_canvasbag/gen_pku_canvasbag"
	self.painting.AI_carry = {SO_category = "enemies"}
	self.coke = {}
	self.coke.type = "coke_light"
	self.coke.name_id = "hud_carry_coke"
	self.coke.bag_value = "coke"
	self.coke.AI_carry = {SO_category = "enemies"}
	self.meth = {}
	self.meth.type = "coke_light"
	self.meth.name_id = "hud_carry_meth"
	self.meth.bag_value = "meth"
	self.meth.AI_carry = {SO_category = "enemies"}
	self.lance_bag = {}
	self.lance_bag.type = "medium"
	self.lance_bag.name_id = "hud_carry_lance_bag"
	self.lance_bag.skip_exit_secure = true
	self.lance_bag.visual_object = "g_toolsbag"
	self.lance_bag.unit = "units/payday2/pickups/gen_pku_toolbag/gen_pku_toolbag"
	self.lance_bag_large = {}
	self.lance_bag_large.type = "heavy"
	self.lance_bag_large.name_id = "hud_carry_huge_bag"
	self.lance_bag_large.skip_exit_secure = true
	self.lance_bag_large.visual_object = "g_toolsbag_large"
	self.lance_bag_large.unit = "units/payday2/pickups/gen_pku_toolbag_large/gen_pku_toolbag_large"
	self.cage_bag = {}
	self.cage_bag.type = "medium"
	self.cage_bag.name_id = "hud_carry_cage_bag"
	self.cage_bag.skip_exit_secure = true
	self.cage_bag.visual_object = "g_cagebag"
	self.cage_bag.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.weapon = {}
	self.weapon.type = "heavy"
	self.weapon.name_id = "hud_carry_weapon"
	self.weapon.bag_value = "weapons"
	self.weapons = {}
	self.weapons.type = "heavy"
	self.weapons.bag_value = "weapons"
	self.weapons.name_id = "hud_carry_weapons"
	self.grenades = {}
	self.grenades.type = "explosives"
	self.grenades.name_id = "hud_carry_grenades"
	self.grenades.bag_value = "weapons"
	self.grenades.visual_object = "g_explosives_bag"
	self.grenades.unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag"
	self.grenades.AI_carry = {SO_category = "enemies"}
	self.person = {}
	self.person.type = "being"
	self.person.name_id = "hud_carry_person"
	self.person.unit = "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag"
	self.person.visual_object = "g_body_bag"
	self.person.default_value = 1
	self.person.is_unique_loot = true
	self.person.skip_exit_secure = true
	self.special_person = {}
	self.special_person.type = "being"
	self.special_person.name_id = "hud_carry_special_person"
	self.special_person.unit = "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag"
	self.special_person.default_value = 1
	self.special_person.is_unique_loot = true
	self.special_person.skip_exit_secure = true
	self.circuit = {}
	self.circuit.type = "heavy"
	self.circuit.name_id = "hud_carry_circuit"
	self.circuit.bag_value = "circuit"
	self.engine_01 = {}
	self.engine_01.type = "mega_heavy"
	self.engine_01.name_id = "hud_carry_engine_1"
	self.engine_01.skip_exit_secure = true
	self.engine_01.AI_carry = {SO_category = "enemies"}
	self.engine_02 = {}
	self.engine_02.type = "mega_heavy"
	self.engine_02.name_id = "hud_carry_engine_2"
	self.engine_02.skip_exit_secure = true
	self.engine_02.AI_carry = {SO_category = "enemies"}
	self.engine_03 = {}
	self.engine_03.type = "mega_heavy"
	self.engine_03.name_id = "hud_carry_engine_3"
	self.engine_03.skip_exit_secure = true
	self.engine_03.AI_carry = {SO_category = "enemies"}
	self.engine_04 = {}
	self.engine_04.type = "mega_heavy"
	self.engine_04.name_id = "hud_carry_engine_4"
	self.engine_04.skip_exit_secure = true
	self.engine_04.AI_carry = {SO_category = "enemies"}
	self.engine_05 = {}
	self.engine_05.type = "mega_heavy"
	self.engine_05.name_id = "hud_carry_engine_5"
	self.engine_05.skip_exit_secure = true
	self.engine_05.AI_carry = {SO_category = "enemies"}
	self.engine_06 = {}
	self.engine_06.type = "mega_heavy"
	self.engine_06.name_id = "hud_carry_engine_6"
	self.engine_06.skip_exit_secure = true
	self.engine_06.AI_carry = {SO_category = "enemies"}
	self.engine_07 = {}
	self.engine_07.type = "mega_heavy"
	self.engine_07.name_id = "hud_carry_engine_7"
	self.engine_07.skip_exit_secure = true
	self.engine_07.AI_carry = {SO_category = "enemies"}
	self.engine_08 = {}
	self.engine_08.type = "mega_heavy"
	self.engine_08.name_id = "hud_carry_engine_8"
	self.engine_08.skip_exit_secure = true
	self.engine_08.AI_carry = {SO_category = "enemies"}
	self.engine_09 = {}
	self.engine_09.type = "mega_heavy"
	self.engine_09.name_id = "hud_carry_engine_9"
	self.engine_09.skip_exit_secure = true
	self.engine_09.AI_carry = {SO_category = "enemies"}
	self.engine_10 = {}
	self.engine_10.type = "mega_heavy"
	self.engine_10.name_id = "hud_carry_engine_10"
	self.engine_10.skip_exit_secure = true
	self.engine_10.AI_carry = {SO_category = "enemies"}
	self.engine_11 = {}
	self.engine_11.type = "mega_heavy"
	self.engine_11.name_id = "hud_carry_engine_11"
	self.engine_11.skip_exit_secure = true
	self.engine_11.AI_carry = {SO_category = "enemies"}
	self.engine_12 = {}
	self.engine_12.type = "mega_heavy"
	self.engine_12.name_id = "hud_carry_engine_12"
	self.engine_12.skip_exit_secure = true
	self.engine_12.AI_carry = {SO_category = "enemies"}
	self.turret = {}
	self.turret.type = "heavy"
	self.turret.name_id = "hud_carry_turret"
	self.turret.bag_value = "turret"
	self.turret.AI_carry = {SO_category = "enemies"}
	self.ammo = {}
	self.ammo.type = "medium"
	self.ammo.name_id = "hud_carry_ammo"
	self.ammo.bag_value = "shells"
	self.ammo.visual_object = "g_explosives_bag"
	self.ammo.unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag"
	self.ammo.AI_carry = {SO_category = "enemies"}
	self.artifact_statue = {}
	self.artifact_statue.type = "very_heavy"
	self.artifact_statue.name_id = "hud_carry_artifact"
	self.artifact_statue.bag_value = "artifact_statue"
	self.artifact_statue.AI_carry = {SO_category = "enemies"}
	self.mus_artifact = {}
	self.mus_artifact.type = "medium"
	self.mus_artifact.name_id = "hud_carry_artifact"
	self.mus_artifact.bag_value = "mus_artifact_bag"
	self.mus_artifact.AI_carry = {SO_category = "enemies"}
	self.mus_artifact_paint = {}
	self.mus_artifact_paint.type = "light"
	self.mus_artifact_paint.name_id = "hud_carry_artifact"
	self.mus_artifact_paint.bag_value = "mus_artifact_bag"
	self.mus_artifact_paint.unit = "units/payday2/pickups/gen_pku_canvasbag/gen_pku_canvasbag"
	self.mus_artifact_paint.AI_carry = {SO_category = "enemies"}
	self.samurai_suit = {}
	self.samurai_suit.type = "medium"
	self.samurai_suit.name_id = "hud_carry_samurai"
	self.samurai_suit.bag_value = "samurai_suit"
	self.samurai_suit.AI_carry = {SO_category = "enemies"}
	self.equipment_bag = {}
	self.equipment_bag.type = "medium"
	self.equipment_bag.name_id = "hud_carry_equipment_bag"
	self.equipment_bag.skip_exit_secure = true
	self.equipment_bag.visual_object = "g_toolsbag"
	self.equipment_bag.unit = "units/payday2/pickups/gen_pku_toolbag/gen_pku_toolbag"
	self.coke_pure = {}
	self.coke_pure.type = "coke_light"
	self.coke_pure.name_id = "hud_carry_coke_pure"
	self.coke_pure.bag_value = "coke_pure"
	self.coke_pure.AI_carry = {SO_category = "enemies"}
	self.evidence_bag = {}
	self.evidence_bag.type = "light"
	self.evidence_bag.name_id = "hud_carry_evidence_bag"
	self.evidence_bag.bag_value = "evidence_bag"
	self.evidence_bag.AI_carry = {SO_category = "enemies"}
	self.sandwich = {}
	self.sandwich.type = "very_heavy"
	self.sandwich.name_id = "hud_carry_sandwich"
	self.sandwich.bag_value = "sandwich"
	self.sandwich.AI_carry = {SO_category = "enemies"}
	self.sandwich.visual_object = "g_cagebag"
	self.sandwich.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.hope_diamond = {}
	self.hope_diamond.type = "coke_light"
	self.hope_diamond.name_id = "hud_carry_hope_diamond"
	self.hope_diamond.bag_value = "hope_diamond"
	self.hope_diamond.AI_carry = {SO_category = "enemies"}
	self.hope_diamond.visual_object = "g_cagebag"
	self.hope_diamond.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.cro_loot1 = {}
	self.cro_loot1.type = "medium"
	self.cro_loot1.name_id = "hud_carry_cro_loot"
	self.cro_loot1.bag_value = "cro_loot"
	self.cro_loot1.AI_carry = {SO_category = "enemies"}
	self.cro_loot2 = {}
	self.cro_loot2.type = "heavy"
	self.cro_loot2.name_id = "hud_carry_cro_loot"
	self.cro_loot2.bag_value = "cro_loot"
	self.cro_loot2.AI_carry = {SO_category = "enemies"}
	self.ladder_bag = {}
	self.ladder_bag.type = "light"
	self.ladder_bag.name_id = "hud_carry_ladder_bag"
	self.ladder_bag.skip_exit_secure = true
	self.ladder_bag.visual_object = "g_cagebag"
	self.ladder_bag.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.ladder_bag.AI_carry = {SO_category = "enemies"}
	self.vehicle_falcogini = {}
	self.vehicle_falcogini.type = "light"
	self.vehicle_falcogini.name_id = "hud_carry_vehicle_falcogini"
	self.vehicle_falcogini.skip_exit_secure = false
	self.vehicle_falcogini.is_vehicle = true
	self.vehicle_falcogini.visual_object = ""
	self.vehicle_falcogini.unit = ""
	self.vehicle_falcogini.bag_value = "vehicle_falcogini"
	self.vehicle_falcogini.AI_carry = {SO_category = ""}
	self.warhead = {}
	self.warhead.type = "very_heavy"
	self.warhead.name_id = "hud_carry_warhead"
	self.warhead.bag_value = "warhead"
	self.warhead.visual_object = "g_explosives_bag"
	self.warhead.unit = "units/pd2_dlc1/pickups/gen_pku_explosivesbag/gen_pku_explosivesbag"
	self.winch_part = {}
	self.winch_part.type = "heavy"
	self.winch_part.name_id = "hud_carry_winch_bag"
	self.winch_part.skip_exit_secure = true
	self.winch_part.visual_object = "g_toolsbag_large"
	self.winch_part.unit = "units/payday2/pickups/gen_pku_toolbag_large/gen_pku_toolbag_large"
	self.fireworks = {}
	self.fireworks.type = "light"
	self.fireworks.name_id = "hud_carry_fireworks_bag"
	self.fireworks.skip_exit_secure = true
	self.fireworks.visual_object = "g_cagebag"
	self.fireworks.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.watertank_empty = {}
	self.watertank_empty.type = "light"
	self.watertank_empty.name_id = "hud_carry_watertank_empty_bag"
	self.watertank_empty.skip_exit_secure = true
	self.watertank_empty.visual_object = "g_cagebag"
	self.watertank_empty.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.watertank_full = {}
	self.watertank_full.type = "heavy"
	self.watertank_full.name_id = "hud_carry_watertank_full_bag"
	self.watertank_full.skip_exit_secure = true
	self.watertank_full.visual_object = "g_cagebag"
	self.watertank_full.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
	self.unknown = {}
	self.unknown.type = "heavy"
	self.unknown.name_id = "hud_carry_???"
	self.unknown.skip_exit_secure = false
	self.unknown.AI_carry = {SO_category = "enemies"}
	self.unknown.visual_object = "g_cagebag"
	self.unknown.unit = "units/payday2/pickups/gen_pku_cage_bag/gen_pku_cage_bag"
end
function CarryTweakData:get_carry_ids()
	local t = {}
	for id, _ in pairs(tweak_data.carry) do
		if type(tweak_data.carry[id]) == "table" and tweak_data.carry[id].type then
			table.insert(t, id)
		end
	end
	table.sort(t)
	return t
end
function CarryTweakData:get_zipline_offset(carry_id)
	local unit_name = tweak_data.carry[carry_id].unit or "units/payday2/pickups/gen_pku_lootbag/gen_pku_lootbag"
	if unit_name == "units/payday2/pickups/gen_pku_bodybag/gen_pku_bodybag" then
		return Vector3(0, 0, -17)
	elseif unit_name == "units/payday2/pickups/gen_pku_canvasbag/gen_pku_canvasbag" then
		return Vector3(0, 0, 0)
	end
	return Vector3(15, 0, -8)
end
