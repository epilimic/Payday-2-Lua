EconomyTweakData = EconomyTweakData or class()
function EconomyTweakData:init()
	self.safes = {}
	self.drills = {}
	self.gameplay = {}
	self.contents = {}
	self.bundles = {}
	self.rarities = {}
	self.qualities = {}
	self.rarities.common = {}
	self.rarities.common.index = 1
	self.rarities.common.fake_chance = 75
	self.rarities.common.open_safe_sequence = "anim_open_01"
	self.rarities.common.color = Color("2360D8")
	self.rarities.common.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_common"
	self.rarities.common.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_common"
	self.rarities.common.name_id = "bm_menu_rarity_common"
	self.rarities.uncommon = {}
	self.rarities.uncommon.index = 2
	self.rarities.uncommon.fake_chance = 20
	self.rarities.uncommon.open_safe_sequence = "anim_open_02"
	self.rarities.uncommon.color = Color("9900FF")
	self.rarities.uncommon.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_uncommon"
	self.rarities.uncommon.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_uncommon"
	self.rarities.uncommon.name_id = "bm_menu_rarity_uncommon"
	self.rarities.rare = {}
	self.rarities.rare.index = 3
	self.rarities.rare.fake_chance = 4
	self.rarities.rare.open_safe_sequence = "anim_open_03"
	self.rarities.rare.color = Color("FF00FF")
	self.rarities.rare.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_rare"
	self.rarities.rare.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_rare"
	self.rarities.rare.name_id = "bm_menu_rarity_rare"
	self.rarities.epic = {}
	self.rarities.epic.index = 4
	self.rarities.epic.fake_chance = 1
	self.rarities.epic.open_safe_sequence = "anim_open_04"
	self.rarities.epic.color = Color("FF0000")
	self.rarities.epic.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_epic"
	self.rarities.epic.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_epic"
	self.rarities.epic.name_id = "bm_menu_rarity_epic"
	self.rarities.legendary = {}
	self.rarities.legendary.index = 5
	self.rarities.legendary.fake_chance = 0
	self.rarities.legendary.open_safe_sequence = "anim_open_05"
	self.rarities.legendary.color = Color("FFAA00")
	self.rarities.legendary.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_legendary"
	self.rarities.legendary.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_legendary"
	self.rarities.legendary.name_id = "bm_menu_rarity_legendary"
	self.qualities.poor = {}
	self.qualities.poor.index = 1
	self.qualities.poor.wear_tear_value = 0.3
	self.qualities.poor.name_id = "bm_menu_quality_poor"
	self.qualities.fair = {}
	self.qualities.fair.index = 2
	self.qualities.fair.wear_tear_value = 0.45
	self.qualities.fair.name_id = "bm_menu_quality_fair"
	self.qualities.good = {}
	self.qualities.good.index = 3
	self.qualities.good.wear_tear_value = 0.6
	self.qualities.good.name_id = "bm_menu_quality_good"
	self.qualities.fine = {}
	self.qualities.fine.index = 4
	self.qualities.fine.wear_tear_value = 0.8
	self.qualities.fine.name_id = "bm_menu_quality_fine"
	self.qualities.mint = {}
	self.qualities.mint.index = 5
	self.qualities.mint.wear_tear_value = 1
	self.qualities.mint.name_id = "bm_menu_quality_mint"
	self.contents.legendary = {}
	self.contents.legendary.def_id = 10000
	self.contents.legendary.contains = {
		weapon_skins = {
			"ak74_rodina"
		}
	}
	self.contents.legendary.rarity = "legendary"
	self.contents.event_01 = {}
	self.contents.event_01.def_id = 10003
	self.contents.event_01.contains = {
		weapon_skins = {
			"m95_forest",
			"famas_forest",
			"huntsman_forest",
			"r93_forest",
			"b92fs_forest",
			"m134_forest",
			"serbu_camohex",
			"new_m14_camohex",
			"judge_camohex",
			"mg42_camohex",
			"p90_luxury",
			"ak74_luxury",
			"ppk_luxury",
			"plainsrider_linked",
			"new_m4_payday"
		},
		contents = {
			"event_01_legendary"
		}
	}
	self.contents.event_01_legendary = {}
	self.contents.event_01_legendary.def_id = 10004
	self.contents.event_01_legendary.contains = {
		weapon_skins = {
			"deagle_bling"
		}
	}
	self.contents.event_01_legendary.rarity = "legendary"
	self.contents.weapon_01 = {}
	self.contents.weapon_01.def_id = 10005
	self.contents.weapon_01.contains = {
		weapon_skins = {
			"serbu_woodland",
			"p90_woodland",
			"plainsrider_woodland",
			"rpg7_woodland",
			"ppk_woodland",
			"judge_woodland",
			"new_m4_goldstripes",
			"new_raging_bull_goldstripes",
			"flamethrower_mk2_goldstripes",
			"g36_goldstripes",
			"new_m14_luxury",
			"m95_luxury",
			"b92fs_luxury",
			"famas_hypno",
			"huntsman_hypno"
		},
		contents = {"legendary"}
	}
	self.contents.event_red = {}
	self.contents.event_red.def_id = 10006
	self.contents.event_red.contains = {
		weapon_skins = {
			"p90_golddigger",
			"m95_golddigger",
			"serbu_golddigger",
			"huntsman_golddigger",
			"r93_golddigger",
			"ak74_golddigger",
			"m134_golddigger",
			"famas_golddigger",
			"new_m14_golddigger",
			"ppk_golddigger"
		},
		contents = {
			"event_01_legendary"
		}
	}
	self.contents.event_dinner = {}
	self.contents.event_dinner.def_id = 10007
	self.contents.event_dinner.contains = {
		weapon_skins = {
			"judge_bloodbath",
			"b92fs_bloodbath",
			"new_raging_bull_bloodbath",
			"mg42_bloodbath",
			"plainsrider_bloodbath",
			"new_m4_bloodbath",
			"g36_bloodbath",
			"flamethrower_mk2_bloodbath",
			"deagle_bloodbath",
			"rpg7_bloodbath"
		},
		contents = {"legendary"}
	}
	self.safes.event_01 = {}
	self.safes.event_01.drill = "event_01"
	self.safes.event_01.content = "event_01"
	self.safes.event_01.unit_name = "units/payday2_cash/safes/eco_safe_event_01/eco_safe_event_01"
	self.safes.event_01.name_id = "bm_menu_safe_event_01"
	self.safes.event_01.texture_bundle_folder = "cash/safes/cf15"
	self.safes.weapon_01 = {}
	self.safes.weapon_01.drill = "weapon_01"
	self.safes.weapon_01.content = "weapon_01"
	self.safes.weapon_01.unit_name = "units/payday2_cash/safes/eco_safe_weapon_01/eco_safe_weapon_01"
	self.safes.weapon_01.name_id = "bm_menu_safe_weapon_01"
	self.safes.weapon_01.texture_bundle_folder = "cash/safes/sputnik"
	self.safes.event_red = {}
	self.safes.event_red.def_id = 50003
	self.safes.event_red.drill = "event_red"
	self.safes.event_red.content = "event_red"
	self.safes.event_red.unit_name = "units/payday2_cash/safes/red/safe/eco_safe_event_red"
	self.safes.event_red.name_id = "bm_menu_safe_event_red"
	self.safes.event_red.texture_bundle_folder = "cash/safes/red"
	self.safes.event_red.dlc = "full_game"
	self.safes.event_red.achievement = "green_7"
	self.safes.event_dinner = {}
	self.safes.event_dinner.def_id = 50004
	self.safes.event_dinner.drill = "event_dinner"
	self.safes.event_dinner.content = "event_dinner"
	self.safes.event_dinner.unit_name = "units/payday2_cash/safes/dinner/safe/eco_safe_event_dinner"
	self.safes.event_dinner.name_id = "bm_menu_safe_event_dinner"
	self.safes.event_dinner.texture_bundle_folder = "cash/safes/dinner"
	self.safes.event_dinner.dlc = "full_game"
	self.safes.event_dinner.achievement = "farm_6"
	self.drills.event_01 = {}
	self.drills.event_01.safe = "event_01"
	self.drills.event_01.def_id = 70001
	self.drills.event_01.price = "2.49"
	self.drills.event_01.unit_name = "units/payday2_cash/drills/eco_drill_event_01/eco_drill_event_01"
	self.drills.event_01.name_id = "bm_menu_drill_event_01"
	self.drills.event_01.desc_id = "bm_menu_drill_event_01_desc"
	self.drills.event_01.texture_bundle_folder = "cash/safes/cf15"
	self.drills.weapon_01 = {}
	self.drills.weapon_01.safe = "weapon_01"
	self.drills.weapon_01.def_id = 70002
	self.drills.weapon_01.price = "2.49"
	self.drills.weapon_01.unit_name = "units/payday2_cash/drills/eco_drill_weapon_01/eco_drill_weapon_01"
	self.drills.weapon_01.name_id = "bm_menu_drill_weapon_01"
	self.drills.weapon_01.desc_id = "bm_menu_drill_weapon_01_desc"
	self.drills.weapon_01.texture_bundle_folder = "cash/safes/sputnik"
	self.drills.event_red = {}
	self.drills.event_red.safe = "event_red"
	self.drills.event_red.def_id = 70003
	self.drills.event_red.unit_name = "units/payday2_cash/safes/red/drill/eco_drill_event_red"
	self.drills.event_red.name_id = "bm_menu_drill_event_red"
	self.drills.event_red.desc_id = "bm_menu_drill_event_red_desc"
	self.drills.event_red.texture_bundle_folder = "cash/safes/red"
	self.drills.event_red.dlc = "full_game"
	self.drills.event_red.achievement = "green_7"
	self.drills.event_dinner = {}
	self.drills.event_dinner.def_id = 70004
	self.drills.event_dinner.safe = "event_dinner"
	self.drills.event_dinner.unit_name = "units/payday2_cash/safes/dinner/drill/eco_drill_event_dinner"
	self.drills.event_dinner.name_id = "bm_menu_drill_event_dinner"
	self.drills.event_dinner.desc_id = "bm_menu_drill_event_dinner_desc"
	self.drills.event_dinner.texture_bundle_folder = "cash/safes/dinner"
	self.drills.event_dinner.dlc = "full_game"
	self.drills.event_dinner.achievement = "farm_6"
	self.bonuses = {}
	self.bonuses.concealment_p1 = {}
	self.bonuses.concealment_p1.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p1.stats = {concealment = 1}
	self.bonuses.concealment_p2 = {}
	self.bonuses.concealment_p2.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p2.stats = {concealment = 2}
	self.bonuses.concealment_p3 = {}
	self.bonuses.concealment_p3.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p3.stats = {concealment = 3}
	self.bonuses.spread_p1 = {}
	self.bonuses.spread_p1.name_id = "bm_menu_bonus_spread"
	self.bonuses.spread_p1.stats = {spread = 1}
	self.bonuses.spread_n1 = {}
	self.bonuses.spread_n1.name_id = "bm_menu_bonus_spread"
	self.bonuses.spread_n1.stats = {spread = -1}
	self.bonuses.recoil_p1 = {}
	self.bonuses.recoil_p1.name_id = "bm_menu_bonus_recoil"
	self.bonuses.recoil_p1.stats = {recoil = 1}
	self.bonuses.recoil_p2 = {}
	self.bonuses.recoil_p2.name_id = "bm_menu_bonus_recoil"
	self.bonuses.recoil_p2.stats = {recoil = 2}
	self.bonuses.damage_p1 = {}
	self.bonuses.damage_p1.name_id = "bm_menu_bonus_damage"
	self.bonuses.damage_p1.stats = {damage = 1}
	self.bonuses.damage_p2 = {}
	self.bonuses.damage_p2.name_id = "bm_menu_bonus_damage"
	self.bonuses.damage_p2.stats = {damage = 2}
	self.bonuses.total_ammo_p1 = {}
	self.bonuses.total_ammo_p1.name_id = "bm_menu_bonus_total_ammo"
	self.bonuses.total_ammo_p1.stats = {total_ammo_mod = 1}
	self.bonuses.total_ammo_p3 = {}
	self.bonuses.total_ammo_p3.name_id = "bm_menu_bonus_total_ammo"
	self.bonuses.total_ammo_p3.stats = {total_ammo_mod = 3}
end
function EconomyTweakData:get_entry_from_index(category, index)
	for entry, data in pairs(self[category] or {}) do
		if not data.index then
		elseif data.index == index then
			return entry
		end
	end
end
function EconomyTweakData:get_index_from_entry(category, entry)
	return self[category] and self[category][entry] and self[category][entry].index
end
function EconomyTweakData:create_buy_tradable_url(def_id, quantity)
	return "https://store.steampowered.com/buyitem/218620/" .. tostring(def_id) .. "/"
end
