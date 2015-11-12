function BlackMarketTweakData:_init_projectiles()
	self.projectiles = {}
	self.projectiles.frag = {}
	self.projectiles.frag.name_id = "bm_grenade_frag"
	self.projectiles.frag.unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade"
	self.projectiles.frag.unit_dummy = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_husk"
	self.projectiles.frag.sprint_unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_sprint"
	self.projectiles.frag.icon = "frag_grenade"
	self.projectiles.frag.dlc = "gage_pack"
	self.projectiles.frag.throwable = true
	self.projectiles.frag.max_amount = 3
	self.projectiles.frag.anim_global_param = "projectile_frag"
	self.projectiles.frag.throw_allowed_expire_t = 0.1
	self.projectiles.frag.expire_t = 1.1
	self.projectiles.frag.repeat_expire_t = 1.5
	self.projectiles.frag.is_a_grenade = true
	self.projectiles.molotov = {}
	self.projectiles.molotov.name_id = "bm_grenade_molotov"
	self.projectiles.molotov.unit = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_third"
	self.projectiles.molotov.unit_dummy = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_husk"
	self.projectiles.molotov.icon = "molotov_grenade"
	self.projectiles.molotov.dlc = "bbq"
	self.projectiles.molotov.no_cheat_count = true
	self.projectiles.molotov.impact_detonation = true
	self.projectiles.molotov.time_cheat = 1
	self.projectiles.molotov.throwable = true
	self.projectiles.molotov.max_amount = 3
	self.projectiles.molotov.texture_bundle_folder = "bbq"
	self.projectiles.molotov.physic_effect = Idstring("physic_effects/molotov_throw")
	self.projectiles.molotov.anim_global_param = "projectile_molotov"
	self.projectiles.molotov.throw_allowed_expire_t = 0.1
	self.projectiles.molotov.expire_t = 1.3
	self.projectiles.molotov.repeat_expire_t = 1.5
	self.projectiles.molotov.is_a_grenade = true
	self.projectiles.dynamite = {}
	self.projectiles.dynamite.name_id = "bm_dynamite"
	self.projectiles.dynamite.unit = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite"
	self.projectiles.dynamite.unit_dummy = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite_husk"
	self.projectiles.dynamite.icon = "dynamite_grenade"
	self.projectiles.dynamite.dlc = "west"
	self.projectiles.dynamite.texture_bundle_folder = "west"
	self.projectiles.dynamite.max_amount = 3
	self.projectiles.dynamite.throwable = true
	self.projectiles.dynamite.anim_global_param = "projectile_molotov"
	self.projectiles.dynamite.throw_allowed_expire_t = 0.1
	self.projectiles.dynamite.expire_t = 1.3
	self.projectiles.dynamite.repeat_expire_t = 1.5
	self.projectiles.dynamite.is_a_grenade = true
	self.projectiles.wpn_prj_four = {}
	self.projectiles.wpn_prj_four.name_id = "bm_wpn_prj_four"
	self.projectiles.wpn_prj_four.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four"
	self.projectiles.wpn_prj_four.unit_dummy = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_husk"
	self.projectiles.wpn_prj_four.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_local"
	self.projectiles.wpn_prj_four.icon = "four_projectile"
	self.projectiles.wpn_prj_four.throw_shout = true
	self.projectiles.wpn_prj_four.no_cheat_count = true
	self.projectiles.wpn_prj_four.impact_detonation = true
	self.projectiles.wpn_prj_four.client_authoritative = true
	self.projectiles.wpn_prj_four.add_trail_effect = true
	self.projectiles.wpn_prj_four.throwable = true
	self.projectiles.wpn_prj_four.texture_bundle_folder = "turtles"
	self.projectiles.wpn_prj_four.dlc = "turtles"
	self.projectiles.wpn_prj_four.max_amount = 10
	self.projectiles.wpn_prj_four.anim_global_param = "projectile_four"
	self.projectiles.wpn_prj_four.throw_allowed_expire_t = 0.15
	self.projectiles.wpn_prj_four.expire_t = 1.1
	self.projectiles.wpn_prj_four.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_ace = {}
	self.projectiles.wpn_prj_ace.name_id = "bm_wpn_prj_ace"
	self.projectiles.wpn_prj_ace.unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace"
	self.projectiles.wpn_prj_ace.unit_dummy = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_husk"
	self.projectiles.wpn_prj_ace.local_unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_local"
	self.projectiles.wpn_prj_ace.icon = "ace_projectile"
	self.projectiles.wpn_prj_ace.throw_shout = true
	self.projectiles.wpn_prj_ace.no_cheat_count = true
	self.projectiles.wpn_prj_ace.impact_detonation = true
	self.projectiles.wpn_prj_ace.client_authoritative = true
	self.projectiles.wpn_prj_ace.add_trail_effect = true
	self.projectiles.wpn_prj_ace.throwable = true
	self.projectiles.wpn_prj_ace.dlc = "pd2_clan"
	self.projectiles.wpn_prj_ace.max_amount = 21
	self.projectiles.wpn_prj_ace.anim_global_param = "projectile_four"
	self.projectiles.wpn_prj_ace.throw_allowed_expire_t = 0.15
	self.projectiles.wpn_prj_ace.expire_t = 1.1
	self.projectiles.wpn_prj_ace.repeat_expire_t = 0.3
	self.projectiles.launcher_frag = {}
	self.projectiles.launcher_frag.name_id = "bm_launcher_frag"
	self.projectiles.launcher_frag.unit = "units/pd2_dlc_gage_assault/weapons/wpn_launcher_frag_grenade/wpn_launcher_frag_grenade"
	self.projectiles.launcher_frag.weapon_id = "gre_m79"
	self.projectiles.launcher_frag.no_cheat_count = true
	self.projectiles.launcher_frag.impact_detonation = true
	self.projectiles.launcher_frag.time_cheat = 1
	self.projectiles.rocket_frag = {}
	self.projectiles.rocket_frag.name_id = "bm_rocket_frag"
	self.projectiles.rocket_frag.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_third_rpg7_fired_rocket/wpn_third_rpg7_fired_rocket"
	self.projectiles.rocket_frag.weapon_id = "rpg7"
	self.projectiles.rocket_frag.no_cheat_count = true
	self.projectiles.rocket_frag.impact_detonation = true
	self.projectiles.rocket_frag.time_cheat = 1
	self.projectiles.rocket_frag.physic_effect = Idstring("physic_effects/anti_gravitate")
	self.projectiles.rocket_frag.adjust_z = 0
	self.projectiles.launcher_incendiary = {}
	self.projectiles.launcher_incendiary.name_id = "bm_launcher_incendiary"
	self.projectiles.launcher_incendiary.unit = "units/pd2_dlc_bbq/weapons/wpn_launcher_incendiary_grenade/wpn_launcher_incendiary_grenade"
	self.projectiles.launcher_incendiary.weapon_id = "gre_m79"
	self.projectiles.launcher_incendiary.no_cheat_count = true
	self.projectiles.launcher_incendiary.impact_detonation = true
	self.projectiles.launcher_incendiary.time_cheat = 1
	self.projectiles.launcher_frag_m32 = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_m32.weapon_id = "m32"
	self.projectiles.west_arrow = {}
	self.projectiles.west_arrow.name_id = "bm_launcher_frag"
	self.projectiles.west_arrow.unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow"
	self.projectiles.west_arrow.local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_local"
	self.projectiles.west_arrow.weapon_id = "plainsrider"
	self.projectiles.west_arrow.no_cheat_count = true
	self.projectiles.west_arrow.impact_detonation = true
	self.projectiles.west_arrow.client_authoritative = true
	self.projectiles.west_arrow_exp = {}
	self.projectiles.west_arrow_exp.name_id = "bm_launcher_frag"
	self.projectiles.west_arrow_exp.unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp"
	self.projectiles.west_arrow_exp.local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp_local"
	self.projectiles.west_arrow_exp.weapon_id = "plainsrider"
	self.projectiles.west_arrow_exp.no_cheat_count = true
	self.projectiles.west_arrow_exp.impact_detonation = true
	self.projectiles.west_arrow_exp.client_authoritative = true
	self.projectiles.bow_poison_arrow = {}
	self.projectiles.bow_poison_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow"
	self.projectiles.bow_poison_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow_local"
	self.projectiles.bow_poison_arrow.weapon_id = "plainsrider"
	self.projectiles.bow_poison_arrow.no_cheat_count = true
	self.projectiles.bow_poison_arrow.impact_detonation = true
	self.projectiles.bow_poison_arrow.client_authoritative = true
	self.projectiles.crossbow_arrow = {}
	self.projectiles.crossbow_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow"
	self.projectiles.crossbow_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow_local"
	self.projectiles.crossbow_arrow.weapon_id = "hunter"
	self.projectiles.crossbow_arrow.no_cheat_count = true
	self.projectiles.crossbow_arrow.impact_detonation = true
	self.projectiles.crossbow_arrow.client_authoritative = true
	self.projectiles.crossbow_poison_arrow = {}
	self.projectiles.crossbow_poison_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow"
	self.projectiles.crossbow_poison_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow_local"
	self.projectiles.crossbow_poison_arrow.weapon_id = "hunter"
	self.projectiles.crossbow_poison_arrow.no_cheat_count = true
	self.projectiles.crossbow_poison_arrow.impact_detonation = true
	self.projectiles.crossbow_poison_arrow.client_authoritative = true
	self.projectiles.crossbow_arrow_exp = {}
	self.projectiles.crossbow_arrow_exp.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp"
	self.projectiles.crossbow_arrow_exp.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp_local"
	self.projectiles.crossbow_arrow_exp.weapon_id = "hunter"
	self.projectiles.crossbow_arrow_exp.no_cheat_count = true
	self.projectiles.crossbow_arrow_exp.impact_detonation = true
	self.projectiles.crossbow_arrow_exp.client_authoritative = true
	self.projectiles.wpn_prj_jav = {}
	self.projectiles.wpn_prj_jav.name_id = "bm_wpn_prj_jav"
	self.projectiles.wpn_prj_jav.unit = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav"
	self.projectiles.wpn_prj_jav.unit_dummy = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav_husk"
	self.projectiles.wpn_prj_jav.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_jav/wpn_prj_jav_local"
	self.projectiles.wpn_prj_jav.icon = "jav_projectile"
	self.projectiles.wpn_prj_jav.throw_shout = true
	self.projectiles.wpn_prj_jav.no_cheat_count = true
	self.projectiles.wpn_prj_jav.impact_detonation = true
	self.projectiles.wpn_prj_jav.client_authoritative = true
	self.projectiles.wpn_prj_jav.add_trail_effect = true
	self.projectiles.wpn_prj_jav.throwable = true
	self.projectiles.wpn_prj_jav.texture_bundle_folder = "steel"
	self.projectiles.wpn_prj_jav.dlc = "steel"
	self.projectiles.wpn_prj_jav.max_amount = 3
	self.projectiles.wpn_prj_jav.anim_global_param = "projectile_jav"
	self.projectiles.wpn_prj_jav.throw_allowed_expire_t = 0.4
	self.projectiles.wpn_prj_jav.expire_t = 1.1
	self.projectiles.wpn_prj_jav.repeat_expire_t = 1
	self.projectiles.arblast_arrow = {}
	self.projectiles.arblast_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow/wpn_prj_arblast_arrow"
	self.projectiles.arblast_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow/wpn_prj_arblast_arrow_local"
	self.projectiles.arblast_arrow.weapon_id = "arblast"
	self.projectiles.arblast_arrow.no_cheat_count = true
	self.projectiles.arblast_arrow.impact_detonation = true
	self.projectiles.arblast_arrow.client_authoritative = true
	self.projectiles.arblast_poison_arrow = {}
	self.projectiles.arblast_poison_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_poison_arrow/wpn_prj_arblast_poison_arrow"
	self.projectiles.arblast_poison_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_poison_arrow/wpn_prj_arblast_poison_arrow_local"
	self.projectiles.arblast_poison_arrow.weapon_id = "arblast"
	self.projectiles.arblast_poison_arrow.no_cheat_count = true
	self.projectiles.arblast_poison_arrow.impact_detonation = true
	self.projectiles.arblast_poison_arrow.client_authoritative = true
	self.projectiles.arblast_arrow_exp = {}
	self.projectiles.arblast_arrow_exp.unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow_exp/wpn_prj_arblast_arrow_exp"
	self.projectiles.arblast_arrow_exp.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_arblast_arrow_exp/wpn_prj_arblast_arrow_exp_local"
	self.projectiles.arblast_arrow_exp.weapon_id = "arblast"
	self.projectiles.arblast_arrow_exp.no_cheat_count = true
	self.projectiles.arblast_arrow_exp.impact_detonation = true
	self.projectiles.arblast_arrow_exp.client_authoritative = true
	self.projectiles.frankish_arrow = {}
	self.projectiles.frankish_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow/wpn_prj_frankish_arrow"
	self.projectiles.frankish_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow/wpn_prj_frankish_arrow_local"
	self.projectiles.frankish_arrow.weapon_id = "frankish"
	self.projectiles.frankish_arrow.no_cheat_count = true
	self.projectiles.frankish_arrow.impact_detonation = true
	self.projectiles.frankish_arrow.client_authoritative = true
	self.projectiles.frankish_poison_arrow = {}
	self.projectiles.frankish_poison_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_poison_arrow/wpn_prj_frankish_poison_arrow"
	self.projectiles.frankish_poison_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_poison_arrow/wpn_prj_frankish_poison_arrow_local"
	self.projectiles.frankish_poison_arrow.weapon_id = "frankish"
	self.projectiles.frankish_poison_arrow.no_cheat_count = true
	self.projectiles.frankish_poison_arrow.impact_detonation = true
	self.projectiles.frankish_poison_arrow.client_authoritative = true
	self.projectiles.frankish_arrow_exp = {}
	self.projectiles.frankish_arrow_exp.unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow_exp/wpn_prj_frankish_arrow_exp"
	self.projectiles.frankish_arrow_exp.local_unit = "units/pd2_dlc_steel/weapons/wpn_prj_frankish_arrow_exp/wpn_prj_frankish_arrow_exp_local"
	self.projectiles.frankish_arrow_exp.weapon_id = "frankish"
	self.projectiles.frankish_arrow_exp.no_cheat_count = true
	self.projectiles.frankish_arrow_exp.impact_detonation = true
	self.projectiles.frankish_arrow_exp.client_authoritative = true
	self.projectiles.long_arrow = {}
	self.projectiles.long_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow"
	self.projectiles.long_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_local"
	self.projectiles.long_arrow.weapon_id = "long"
	self.projectiles.long_arrow.no_cheat_count = true
	self.projectiles.long_arrow.impact_detonation = true
	self.projectiles.long_arrow.client_authoritative = true
	self.projectiles.long_poison_arrow = {}
	self.projectiles.long_poison_arrow.unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_poison_arrow"
	self.projectiles.long_poison_arrow.local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_poison_arrow_local"
	self.projectiles.long_poison_arrow.weapon_id = "long"
	self.projectiles.long_poison_arrow.no_cheat_count = true
	self.projectiles.long_poison_arrow.impact_detonation = true
	self.projectiles.long_poison_arrow.client_authoritative = true
	self.projectiles.long_arrow_exp = {}
	self.projectiles.long_arrow_exp.unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_exp"
	self.projectiles.long_arrow_exp.local_unit = "units/pd2_dlc_steel/weapons/wpn_fps_bow_long_pts/wpn_prj_long_arrow_exp_local"
	self.projectiles.long_arrow_exp.weapon_id = "long"
	self.projectiles.long_arrow_exp.no_cheat_count = true
	self.projectiles.long_arrow_exp.impact_detonation = true
	self.projectiles.long_arrow_exp.client_authoritative = true
	self._projectiles_index = {
		"frag",
		"launcher_frag",
		"rocket_frag",
		"molotov",
		"launcher_incendiary",
		"launcher_frag_m32",
		"west_arrow",
		"west_arrow_exp",
		"dynamite",
		"bow_poison_arrow",
		"crossbow_arrow",
		"crossbow_poison_arrow",
		"crossbow_arrow_exp",
		"wpn_prj_four",
		"wpn_prj_ace",
		"wpn_prj_jav",
		"arblast_arrow",
		"arblast_poison_arrow",
		"arblast_arrow_exp",
		"frankish_arrow",
		"frankish_poison_arrow",
		"frankish_arrow_exp",
		"long_arrow",
		"long_poison_arrow",
		"long_arrow_exp"
	}
	self:_add_desc_from_name_macro(self.projectiles)
end
function BlackMarketTweakData:get_projectiles_index()
	return self._projectiles_index
end
function BlackMarketTweakData:get_index_from_projectile_id(projectile_id)
	for index, entry_name in ipairs(self._projectiles_index) do
		if entry_name == projectile_id then
			return index
		end
	end
	return 0
end
function BlackMarketTweakData:get_projectile_name_from_index(index)
	return self._projectiles_index[index]
end
