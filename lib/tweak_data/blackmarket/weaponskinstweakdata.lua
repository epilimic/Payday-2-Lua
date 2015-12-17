function BlackMarketTweakData:_init_weapon_skins()
	self.weapon_skins = {}
	self.weapon_skins.serbu_woodland = {}
	self.weapon_skins.serbu_woodland.name_id = "bm_wskn_serbu_woodland"
	self.weapon_skins.serbu_woodland.desc_id = "bm_wskn_serbu_woodland_desc"
	self.weapon_skins.serbu_woodland.weapon_id = "serbu"
	self.weapon_skins.serbu_woodland.rarity = "common"
	self.weapon_skins.serbu_woodland.bonus = "concealment_p1"
	self.weapon_skins.serbu_woodland.reserve_quality = true
	self.weapon_skins.serbu_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.serbu_woodland.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df")
	self.weapon_skins.p90_woodland = {}
	self.weapon_skins.p90_woodland.name_id = "bm_wskn_p90_woodland"
	self.weapon_skins.p90_woodland.desc_id = "bm_wskn_p90_woodland_desc"
	self.weapon_skins.p90_woodland.weapon_id = "p90"
	self.weapon_skins.p90_woodland.rarity = "common"
	self.weapon_skins.p90_woodland.bonus = "recoil_p1"
	self.weapon_skins.p90_woodland.reserve_quality = true
	self.weapon_skins.p90_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.p90_woodland.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_004_df")
	self.weapon_skins.p90_woodland.pattern_tweak = Vector3(6.35822, 0, 0)
	self.weapon_skins.p90_woodland.pattern_pos = Vector3(0.826616, -0.375387, 0)
	self.weapon_skins.p90_woodland.parts = {
		wpn_fps_smg_p90_body_p90 = {
			[Idstring("p90"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stars_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df")
			}
		},
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stars_df"),
				pattern_pos = Vector3(0.111138, -0.0987357, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df"),
				pattern_tweak = Vector3(1.77916, 0, 1)
			}
		}
	}
	self.weapon_skins.plainsrider_woodland = {}
	self.weapon_skins.plainsrider_woodland.name_id = "bm_wskn_plainsrider_woodland"
	self.weapon_skins.plainsrider_woodland.desc_id = "bm_wskn_plainsrider_woodland_desc"
	self.weapon_skins.plainsrider_woodland.weapon_id = "plainsrider"
	self.weapon_skins.plainsrider_woodland.rarity = "common"
	self.weapon_skins.plainsrider_woodland.bonus = "concealment_p1"
	self.weapon_skins.plainsrider_woodland.reserve_quality = true
	self.weapon_skins.plainsrider_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.plainsrider_woodland.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df")
	self.weapon_skins.plainsrider_woodland.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_004_df")
	self.weapon_skins.plainsrider_woodland.pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_pixel_camo_df")
	self.weapon_skins.plainsrider_woodland.pattern_tweak = Vector3(3.44861, 0, 0.997)
	self.weapon_skins.plainsrider_woodland.pattern_pos = Vector3(1.40516, 1.00779, 0)
	self.weapon_skins.rpg7_woodland = {}
	self.weapon_skins.rpg7_woodland.name_id = "bm_wskn_rpg7_woodland"
	self.weapon_skins.rpg7_woodland.desc_id = "bm_wskn_rpg7_woodland_desc"
	self.weapon_skins.rpg7_woodland.weapon_id = "rpg7"
	self.weapon_skins.rpg7_woodland.rarity = "common"
	self.weapon_skins.rpg7_woodland.bonus = "spread_p1"
	self.weapon_skins.rpg7_woodland.reserve_quality = true
	self.weapon_skins.rpg7_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.rpg7_woodland.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_001_df")
	self.weapon_skins.rpg7_woodland.pattern_tweak = Vector3(5.26115, 0, 2)
	self.weapon_skins.rpg7_woodland.pattern_pos = Vector3(-1.17618, -0.715976, 0)
	self.weapon_skins.rpg7_woodland.parts = {
		wpn_fps_rpg7_m_rocket = {
			[Idstring("mtr_rocket"):key()] = {
				pattern_tweak = Vector3(3.44861, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_type_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df")
			}
		}
	}
	self.weapon_skins.ppk_woodland = {}
	self.weapon_skins.ppk_woodland.name_id = "bm_wskn_ppk_woodland"
	self.weapon_skins.ppk_woodland.desc_id = "bm_wskn_ppk_woodland_desc"
	self.weapon_skins.ppk_woodland.weapon_id = "ppk"
	self.weapon_skins.ppk_woodland.rarity = "common"
	self.weapon_skins.ppk_woodland.bonus = "recoil_p1"
	self.weapon_skins.ppk_woodland.reserve_quality = true
	self.weapon_skins.ppk_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.ppk_woodland.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_005_df")
	self.weapon_skins.ppk_woodland.parts = {
		wpn_fps_pis_ppk_body_standard = {
			[Idstring("mtr_frame"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_leopard_df"),
				pattern_tweak = Vector3(2.06535, 0, 1)
			}
		},
		wpn_fps_pis_ppk_b_standard = {
			[Idstring("mtr_slide"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_leopard_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df"),
				pattern_tweak = Vector3(1.49297, 0, 1)
			}
		},
		wpn_fps_pis_ppk_b_long = {
			[Idstring("mtr_slide_long"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_leopard_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df"),
				pattern_tweak = Vector3(1.49297, 0, 1)
			}
		}
	}
	self.weapon_skins.judge_woodland = {}
	self.weapon_skins.judge_woodland.name_id = "bm_wskn_judge_woodland"
	self.weapon_skins.judge_woodland.desc_id = "bm_wskn_judge_woodland_desc"
	self.weapon_skins.judge_woodland.weapon_id = "judge"
	self.weapon_skins.judge_woodland.reserve_quality = true
	self.weapon_skins.judge_woodland.rarity = "common"
	self.weapon_skins.judge_woodland.bonus = "concealment_p1"
	self.weapon_skins.judge_woodland.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.judge_woodland.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df")
	self.weapon_skins.judge_woodland.parts = {
		wpn_fps_pis_judge_body_standard = {
			[Idstring("mtr_frame"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_002_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_pixel_camo_df"),
				pattern_tweak = Vector3(1.01598, 0, 1)
			}
		}
	}
	self.weapon_skins.new_m4_goldstripes = {}
	self.weapon_skins.new_m4_goldstripes.name_id = "bm_wskn_new_m4_goldstripes"
	self.weapon_skins.new_m4_goldstripes.desc_id = "bm_wskn_new_m4_goldstripes_desc"
	self.weapon_skins.new_m4_goldstripes.weapon_id = "new_m4"
	self.weapon_skins.new_m4_goldstripes.rarity = "uncommon"
	self.weapon_skins.new_m4_goldstripes.bonus = "concealment_p1"
	self.weapon_skins.new_m4_goldstripes.reserve_quality = true
	self.weapon_skins.new_m4_goldstripes.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.new_m4_goldstripes.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.new_m4_goldstripes.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_009_df")
	self.weapon_skins.new_m4_goldstripes.pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_flag_stripes_df")
	self.weapon_skins.new_m4_goldstripes.pattern_tweak = Vector3(2.82853, 0, 0)
	self.weapon_skins.new_raging_bull_goldstripes = {}
	self.weapon_skins.new_raging_bull_goldstripes.weapon_id = "new_raging_bull"
	self.weapon_skins.new_raging_bull_goldstripes.name_id = "bm_wskn_new_raging_bull_goldstripes"
	self.weapon_skins.new_raging_bull_goldstripes.desc_id = "bm_wskn_new_raging_bull_goldstripes_desc"
	self.weapon_skins.new_raging_bull_goldstripes.rarity = "uncommon"
	self.weapon_skins.new_raging_bull_goldstripes.bonus = "recoil_p1"
	self.weapon_skins.new_raging_bull_goldstripes.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_004_df")
	self.weapon_skins.new_raging_bull_goldstripes.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.new_raging_bull_goldstripes.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_goldstripes = {}
	self.weapon_skins.flamethrower_mk2_goldstripes.name_id = "bm_wskn_flamethrower_mk2_goldstripes"
	self.weapon_skins.flamethrower_mk2_goldstripes.desc_id = "bm_wskn_flamethrower_mk2_goldstripes_desc"
	self.weapon_skins.flamethrower_mk2_goldstripes.weapon_id = "flamethrower_mk2"
	self.weapon_skins.flamethrower_mk2_goldstripes.rarity = "uncommon"
	self.weapon_skins.flamethrower_mk2_goldstripes.bonus = "damage_p1"
	self.weapon_skins.flamethrower_mk2_goldstripes.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_goldstripes.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.flamethrower_mk2_goldstripes.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.flamethrower_mk2_goldstripes.parts = {
		wpn_fps_fla_mk2_mag = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stbasil_df"),
				pattern_pos = Vector3(-0.308609, -0.237292, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_005_df"),
				pattern_tweak = Vector3(1.96995, 4.72475, 1)
			}
		},
		wpn_fps_fla_mk2_mag_rare = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stbasil_df"),
				pattern_pos = Vector3(-0.308609, -0.237292, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_004_df"),
				pattern_tweak = Vector3(1.96995, 4.72475, 1)
			}
		},
		wpn_fps_fla_mk2_mag_welldone = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stbasil_df"),
				pattern_pos = Vector3(-0.308609, -0.237292, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df"),
				pattern_tweak = Vector3(1.96995, 4.72475, 1)
			}
		}
	}
	self.weapon_skins.g36_goldstripes = {}
	self.weapon_skins.g36_goldstripes.name_id = "bm_wskn_g36_goldstripes"
	self.weapon_skins.g36_goldstripes.desc_id = "bm_wskn_g36_goldstripes_desc"
	self.weapon_skins.g36_goldstripes.weapon_id = "g36"
	self.weapon_skins.g36_goldstripes.rarity = "uncommon"
	self.weapon_skins.g36_goldstripes.reserve_quality = true
	self.weapon_skins.g36_goldstripes.bonus = "spread_p1"
	self.weapon_skins.g36_goldstripes.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.g36_goldstripes.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_006_df")
	self.weapon_skins.g36_goldstripes.pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_004_df")
	self.weapon_skins.g36_goldstripes.pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_leopard_df")
	self.weapon_skins.g36_goldstripes.pattern_tweak = Vector3(1.2, 0, 1)
	self.weapon_skins.new_m14_luxury = {}
	self.weapon_skins.new_m14_luxury.name_id = "bm_wskn_new_m14_luxury"
	self.weapon_skins.new_m14_luxury.desc_id = "bm_wskn_new_m14_luxury_desc"
	self.weapon_skins.new_m14_luxury.weapon_id = "new_m14"
	self.weapon_skins.new_m14_luxury.reserve_quality = true
	self.weapon_skins.new_m14_luxury.rarity = "rare"
	self.weapon_skins.new_m14_luxury.bonus = "recoil_p1"
	self.weapon_skins.new_m14_luxury.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.new_m14_luxury.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df")
	self.weapon_skins.new_m14_luxury.parts = {
		wpn_fps_upg_o_acog = {
			[Idstring("mtr_acog"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_sputnik_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_galaxy_df"),
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df"),
				uv_offset_rot = Vector3(0.0920584, 0.874315, 6.28319),
				pattern_pos = Vector3(0.769378, 0, 0),
				uv_scale = Vector3(8.8918, 8.8918, 0),
				pattern_tweak = Vector3(0.634393, 0.828668, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_002_df")
			}
		},
		wpn_fps_upg_o_m14_scopemount = {
			[Idstring("mtr_mount"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df"),
				pattern_tweak = Vector3(1, 0, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df")
			}
		},
		wpn_fps_ass_m14_body_jae = {
			[Idstring("jae"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_sputnik_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_galaxy_df"),
				cubemap_pattern_control = Vector3(1, 1, 0),
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df"),
				uv_offset_rot = Vector3(-0.376308, 0.920473, 0),
				pattern_pos = Vector3(0, 0.187455, 0),
				uv_scale = Vector3(8.22535, 9.41622, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_007_df"),
				pattern_tweak = Vector3(1.01598, 0, 1)
			}
		},
		wpn_fps_ass_m14_body_upper = {
			[Idstring("base"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stars_df"),
				pattern_pos = Vector3(0, 0.158836, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df"),
				cubemap_pattern_control = Vector3(0, 1, 0),
				pattern_tweak = Vector3(14.0854, 0, 1)
			}
		},
		wpn_fps_ass_m14_body_lower = {
			[Idstring("lower"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_001_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_stars_df"),
				pattern_tweak = Vector3(20, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_003_df")
			}
		}
	}
	self.weapon_skins.new_m14_luxury.default_blueprint = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_m_standard",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_ass_m14_body_jae",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_m14_scopemount"
	}
	self.weapon_skins.m95_luxury = {}
	self.weapon_skins.m95_luxury.name_id = "bm_wskn_m95_luxury"
	self.weapon_skins.m95_luxury.desc_id = "bm_wskn_m95_luxury_desc"
	self.weapon_skins.m95_luxury.weapon_id = "m95"
	self.weapon_skins.m95_luxury.reserve_quality = true
	self.weapon_skins.m95_luxury.rarity = "rare"
	self.weapon_skins.m95_luxury.bonus = "total_ammo_p1"
	self.weapon_skins.m95_luxury.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.m95_luxury.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.m95_luxury.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crackled_ground_df")
	self.weapon_skins.m95_luxury.parts = {
		wpn_fps_snp_m95_upper_reciever = {
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_matryoshka_heisters_df"),
				uv_offset_rot = Vector3(0.0634394, 0.982791, 0),
				pattern_pos = Vector3(0.0920584, 0.216075, 0),
				uv_scale = Vector3(7.84295, 11.6569, 1),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_faberge_df"),
				pattern_tweak = Vector3(12.7498, 4.70977, 1)
			}
		},
		wpn_fps_snp_m95_lower_reciever = {
			[Idstring("mtr_lower"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_matryoshka_heisters_df"),
				uv_offset_rot = Vector3(0.108598, 1.02295, 0),
				pattern_pos = Vector3(-0.0550372, 0.0583599, 0),
				uv_scale = Vector3(10.2267, 10.179, 1),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_faberge_df"),
				pattern_tweak = Vector3(14.7285, 0, 1)
			}
		}
	}
	self.weapon_skins.m95_luxury.default_blueprint = {
		"wpn_fps_snp_m95_bipod",
		"wpn_fps_snp_m95_lower_reciever",
		"wpn_fps_snp_m95_upper_reciever",
		"wpn_fps_snp_m95_magazine",
		"wpn_fps_snp_m95_barrel_long",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_o_leupold"
	}
	self.weapon_skins.b92fs_luxury = {}
	self.weapon_skins.b92fs_luxury.name_id = "bm_wskn_b92fs_luxury"
	self.weapon_skins.b92fs_luxury.desc_id = "bm_wskn_b92fs_luxury_desc"
	self.weapon_skins.b92fs_luxury.weapon_id = "b92fs"
	self.weapon_skins.b92fs_luxury.rarity = "rare"
	self.weapon_skins.b92fs_luxury.bonus = "concealment_p3"
	self.weapon_skins.b92fs_luxury.reserve_quality = true
	self.weapon_skins.b92fs_luxury.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.b92fs_luxury.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_004_df")
	self.weapon_skins.b92fs_luxury.default_blueprint = {
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_m_std",
		"wpn_fps_pis_beretta_o_std",
		"wpn_fps_upg_ns_pis_large",
		"wpn_fps_pis_beretta_g_ergo",
		"wpn_fps_pis_beretta_sl_brigadier"
	}
	self.weapon_skins.b92fs_luxury.parts = {
		wpn_fps_pis_beretta_body_beretta = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_bear_df"),
				uv_scale = Vector3(6.74644, 2.36036, 0),
				uv_offset_rot = Vector3(-0.470784, 0.906234, 0)
			}
		},
		wpn_fps_pis_beretta_sl_brigadier = {
			[Idstring("brig"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_bear_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_flag_stripes_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_010_df"),
				pattern_pos = Vector3(-0.213212, 0.254233, 0),
				uv_scale = Vector3(2.21734, 2.31269, 0),
				uv_offset_rot = Vector3(-0.332768, 0.987251, 4.73174),
				pattern_tweak = Vector3(4.64107, 3.43605, 0)
			}
		},
		wpn_fps_upg_ns_pis_large = {
			[Idstring("large"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_bear_df"),
				uv_offset_rot = Vector3(-0.28907, 0.916393, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_010_df"),
				pattern_pos = Vector3(0, -0.140434, 0),
				uv_scale = Vector3(7.27086, 7.27086, 0.105652),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_flag_stripes_df"),
				pattern_tweak = Vector3(5.64274, 3.40608, 0)
			}
		}
	}
	self.weapon_skins.famas_hypno = {}
	self.weapon_skins.famas_hypno.name_id = "bm_wskn_famas_hypno"
	self.weapon_skins.famas_hypno.desc_id = "bm_wskn_famas_hypno_desc"
	self.weapon_skins.famas_hypno.weapon_id = "famas"
	self.weapon_skins.famas_hypno.reserve_quality = true
	self.weapon_skins.famas_hypno.rarity = "epic"
	self.weapon_skins.famas_hypno.bonus = "damage_p2"
	self.weapon_skins.famas_hypno.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.famas_hypno.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
	self.weapon_skins.famas_hypno.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/pattern_gradient_camo_snow_001_df")
	self.weapon_skins.famas_hypno.pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_wheat_df")
	self.weapon_skins.famas_hypno.pattern_tweak = Vector3(1.20678, 3.40608, 1)
	self.weapon_skins.famas_hypno.parts = {
		wpn_fps_ass_famas_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_topowl_df"),
				uv_offset_rot = Vector3(-0.324149, 0.941092, 5.62385),
				uv_scale = Vector3(4.7441, 4.7441, 0),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_wheat_df"),
				pattern_tweak = Vector3(5.30885, 0, 1)
			},
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_topowl_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_wheat_df"),
				pattern_pos = Vector3(-0.108275, -0.499403, 0),
				uv_scale = Vector3(1.1685, 1.26385, 0),
				uv_offset_rot = Vector3(0.0363599, 0.71052, 0),
				pattern_tweak = Vector3(3.01532, 0, 1)
			},
			[Idstring("mtr_charge"):key()] = {
				pattern_pos = Vector3(-0.022418, 0, 0),
				pattern_tweak = Vector3(0.872886, 2.64185, 1)
			}
		},
		wpn_fps_ass_famas_m_standard = {
			[Idstring("mtr_mag"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_wheat_df"),
				pattern_tweak = Vector3(2.78083, 0, 1)
			}
		},
		wpn_fps_upg_ass_ns_surefire = {
			[Idstring("mtr_surefire"):key()] = {
				pattern_pos = Vector3(-0.136895, -0.461245, 0),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_wheat_df"),
				pattern_tweak = Vector3(0.443599, 0.012, 1)
			}
		}
	}
	self.weapon_skins.famas_hypno.default_blueprint = {
		"wpn_fps_ass_famas_body_standard",
		"wpn_fps_ass_famas_m_standard",
		"wpn_fps_ass_famas_b_sniper",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_ass_famas_g_retro"
	}
	self.weapon_skins.huntsman_hypno = {}
	self.weapon_skins.huntsman_hypno.name_id = "bm_wskn_huntsman_hypno"
	self.weapon_skins.huntsman_hypno.desc_id = "bm_wskn_huntsman_hypno_desc"
	self.weapon_skins.huntsman_hypno.weapon_id = "huntsman"
	self.weapon_skins.huntsman_hypno.reserve_quality = true
	self.weapon_skins.huntsman_hypno.rarity = "epic"
	self.weapon_skins.huntsman_hypno.bonus = "spread_n1"
	self.weapon_skins.huntsman_hypno.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.huntsman_hypno.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_006_df")
	self.weapon_skins.huntsman_hypno.parts = {
		wpn_fps_shot_huntsman_b_long = {
			[Idstring("long_barrel"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_009_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_khokloma_df"),
				uv_offset_rot = Vector3(0.120677, 0.922013, 0),
				pattern_pos = Vector3(0, -1.66517, 0),
				uv_scale = Vector3(3.93363, 3.83828, 1),
				pattern_tweak = Vector3(3.87489, 0.169331, 1)
			}
		},
		wpn_fps_shot_huntsman_b_short = {
			[Idstring("short_barrel"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_009_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_khokloma_df"),
				uv_offset_rot = Vector3(0.120677, 0.922013, 0),
				pattern_pos = Vector3(0, -1.66517, 0),
				uv_scale = Vector3(3.93363, 3.83828, 1),
				pattern_tweak = Vector3(3.87489, 0.169331, 1)
			}
		},
		wpn_fps_shot_huntsman_s_long = {
			[Idstring("long_stock"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_bear_bullets_df"),
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_009_df"),
				uv_scale = Vector3(1.32152, 1.28318, 1),
				uv_offset_rot = Vector3(-0.27999, 0.340091, 0),
				pattern_tweak = Vector3(2.06535, 0, 1)
			}
		}
	}
	self.weapon_skins.huntsman_hypno.default_blueprint = {
		"wpn_fps_shot_huntsman_body_standard",
		"wpn_fps_shot_huntsman_b_long",
		"wpn_fps_shot_huntsman_s_long",
		"wpn_fps_upg_a_slug"
	}
	self.weapon_skins.ak74_rodina = {}
	self.weapon_skins.ak74_rodina.name_id = "bm_wskn_ak74_rodina"
	self.weapon_skins.ak74_rodina.desc_id = "bm_wskn_ak74_rodina_desc"
	self.weapon_skins.ak74_rodina.weapon_id = "ak74"
	self.weapon_skins.ak74_rodina.reserve_quality = true
	self.weapon_skins.ak74_rodina.rarity = "legendary"
	self.weapon_skins.ak74_rodina.bonus = "spread_p1"
	self.weapon_skins.ak74_rodina.texture_bundle_folder = "cash/safes/sputnik"
	self.weapon_skins.ak74_rodina.unique_name_id = "bm_wskn_ak74_rodina"
	self.weapon_skins.ak74_rodina.locked = true
	self.weapon_skins.ak74_rodina.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_005_df")
	self.weapon_skins.ak74_rodina.default_blueprint = {
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_ass_74_b_legend",
		"wpn_fps_upg_ak_m_uspalm",
		"wpn_upg_ak_s_legend",
		"wpn_upg_ak_g_legend",
		"wpn_upg_ak_fg_legend",
		"wpn_upg_ak_fl_legend",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_o_ak_scopemount"
	}
	self.weapon_skins.ak74_rodina.parts = {
		wpn_fps_upg_ak_m_uspalm = {
			[Idstring("mtr_uspalm"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_russian_flag_df"),
				pattern = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_flag_stripes_df"),
				pattern_tweak = Vector3(2.35154, 3.49599, 1),
				pattern_pos = Vector3(-0.156974, -1.42476, 0),
				uv_scale = Vector3(0.01, 1.12082, 0),
				uv_offset_rot = Vector3(0.244694, 0.979251, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_004_df")
			}
		},
		wpn_fps_ass_74_body_upperreceiver = {
			[Idstring("ak74_dustcover"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_starbomb_df"),
				uv_scale = Vector3(2.69309, 2.69377, 1),
				uv_offset_rot = Vector3(-0.165514, 0.893394, 0)
			}
		},
		wpn_fps_ass_ak_body_lowerreceiver = {
			[Idstring("ak_base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_starbomb_df"),
				uv_scale = Vector3(4.26735, 4.69642, 1),
				uv_offset_rot = Vector3(-0.223752, 0.977171, 0)
			}
		},
		wpn_upg_ak_fg_legend = {
			[Idstring("mtr_fore"):key()] = {
				uv_scale = Vector3(11.1802, 10.2744, 1),
				uv_offset_rot = Vector3(0.406869, 1.00787, 0)
			},
			[Idstring("handguard_upper_wood"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/sputnik/sticker/sticker_stbasil_df"),
				uv_scale = Vector3(1.54989, 1.1685, 1),
				uv_offset_rot = Vector3(-0.108275, 0.960172, 0)
			}
		}
	}
	self.weapon_skins.m95_forest = {}
	self.weapon_skins.m95_forest.name_id = "bm_wskn_m95_forest"
	self.weapon_skins.m95_forest.desc_id = "bm_wskn_m95_forest_desc"
	self.weapon_skins.m95_forest.weapon_id = "m95"
	self.weapon_skins.m95_forest.reserve_quality = true
	self.weapon_skins.m95_forest.rarity = "common"
	self.weapon_skins.m95_forest.bonus = "total_ammo_p1"
	self.weapon_skins.m95_forest.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_001_df")
	self.weapon_skins.m95_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.famas_forest = {}
	self.weapon_skins.famas_forest.name_id = "bm_wskn_famas_forest"
	self.weapon_skins.famas_forest.desc_id = "bm_wskn_famas_forest_desc"
	self.weapon_skins.famas_forest.weapon_id = "famas"
	self.weapon_skins.famas_forest.reserve_quality = true
	self.weapon_skins.famas_forest.rarity = "common"
	self.weapon_skins.famas_forest.bonus = "spread_p1"
	self.weapon_skins.famas_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.famas_forest.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df")
	self.weapon_skins.famas_forest.parts = {
		wpn_fps_ass_famas_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				pattern_tweak = Vector3(17.1858, 6.02844, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_goldcoins_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_new_002_df")
			}
		}
	}
	self.weapon_skins.huntsman_forest = {}
	self.weapon_skins.huntsman_forest.name_id = "bm_wskn_huntsman_forest"
	self.weapon_skins.huntsman_forest.desc_id = "bm_wskn_huntsman_forest_desc"
	self.weapon_skins.huntsman_forest.weapon_id = "huntsman"
	self.weapon_skins.huntsman_forest.reserve_quality = true
	self.weapon_skins.huntsman_forest.rarity = "common"
	self.weapon_skins.huntsman_forest.bonus = "recoil_p1"
	self.weapon_skins.huntsman_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.huntsman_forest.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_001_df")
	self.weapon_skins.r93_forest = {}
	self.weapon_skins.r93_forest.name_id = "bm_wskn_r93_forest"
	self.weapon_skins.r93_forest.desc_id = "bm_wskn_r93_forest_desc"
	self.weapon_skins.r93_forest.weapon_id = "r93"
	self.weapon_skins.r93_forest.reserve_quality = true
	self.weapon_skins.r93_forest.rarity = "common"
	self.weapon_skins.r93_forest.bonus = "recoil_p1"
	self.weapon_skins.r93_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.r93_forest.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_005_df")
	self.weapon_skins.r93_forest.parts = {
		wpn_fps_snp_r93_b_standard = {
			[Idstring("mtr_barrel"):key()] = {
				uv_offset_rot = Vector3(-0.29907, 0, 0),
				pattern_pos = Vector3(0, -0.556642, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_005_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_tweak = Vector3(1.11138, 0, 1)
			}
		},
		wpn_fps_snp_r93_body_standard = {
			[Idstring("mtr_body"):key()] = {
				pattern_tweak = Vector3(1.49297, 0, 1)
			},
			[Idstring("mtr_upper"):key()] = {
				pattern_tweak = Vector3(0.491297, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_005_df")
			}
		},
		wpn_fps_upg_o_shortdot = {
			[Idstring("mtr_shortdot"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_pos = Vector3(0.883854, 0.168376, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_005_df"),
				pattern_tweak = Vector3(0.538996, 0, 1)
			}
		},
		wpn_fps_snp_r93_m_std = {
			[Idstring("mtr_mag"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_005_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_tweak = Vector3(0.300503, 0, 1)
			}
		}
	}
	self.weapon_skins.b92fs_forest = {}
	self.weapon_skins.b92fs_forest.name_id = "bm_wskn_b92fs_forest"
	self.weapon_skins.b92fs_forest.desc_id = "bm_wskn_b92fs_forest_desc"
	self.weapon_skins.b92fs_forest.weapon_id = "b92fs"
	self.weapon_skins.b92fs_forest.reserve_quality = true
	self.weapon_skins.b92fs_forest.rarity = "common"
	self.weapon_skins.b92fs_forest.bonus = "recoil_p1"
	self.weapon_skins.b92fs_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.b92fs_forest.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df")
	self.weapon_skins.m134_forest = {}
	self.weapon_skins.m134_forest.name_id = "bm_wskn_m134_forest"
	self.weapon_skins.m134_forest.desc_id = "bm_wskn_m134_forest_desc"
	self.weapon_skins.m134_forest.weapon_id = "m134"
	self.weapon_skins.m134_forest.reserve_quality = true
	self.weapon_skins.m134_forest.rarity = "common"
	self.weapon_skins.m134_forest.bonus = "spread_p1"
	self.weapon_skins.m134_forest.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.m134_forest.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_001_df")
	self.weapon_skins.m134_forest.parts = {
		wpn_fps_lmg_m134_body = {
			[Idstring("mtr_body"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crimenet_df"),
				pattern_pos = Vector3(0.158836, -0.0701165, 0),
				pattern_tweak = Vector3(3.5917, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_bones_df")
			}
		}
	}
	self.weapon_skins.serbu_camohex = {}
	self.weapon_skins.serbu_camohex.weapon_id = "serbu"
	self.weapon_skins.serbu_camohex.name_id = "bm_wskn_serbu_camohex"
	self.weapon_skins.serbu_camohex.desc_id = "bm_wskn_serbu_camohex_desc"
	self.weapon_skins.serbu_camohex.rarity = "uncommon"
	self.weapon_skins.serbu_camohex.bonus = "spread_n1"
	self.weapon_skins.serbu_camohex.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_002_df")
	self.weapon_skins.serbu_camohex.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.serbu_camohex.reserve_quality = true
	self.weapon_skins.new_m14_camohex = {}
	self.weapon_skins.new_m14_camohex.weapon_id = "new_m14"
	self.weapon_skins.new_m14_camohex.name_id = "bm_wskn_new_m14_camohex"
	self.weapon_skins.new_m14_camohex.desc_id = "bm_wskn_new_m14_camohex_desc"
	self.weapon_skins.new_m14_camohex.rarity = "uncommon"
	self.weapon_skins.new_m14_camohex.bonus = "recoil_p1"
	self.weapon_skins.new_m14_camohex.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_new_m14_df")
	self.weapon_skins.new_m14_camohex.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.new_m14_camohex.reserve_quality = true
	self.weapon_skins.judge_camohex = {}
	self.weapon_skins.judge_camohex.weapon_id = "judge"
	self.weapon_skins.judge_camohex.name_id = "bm_wskn_judge_camohex"
	self.weapon_skins.judge_camohex.desc_id = "bm_wskn_judge_camohex_desc"
	self.weapon_skins.judge_camohex.rarity = "uncommon"
	self.weapon_skins.judge_camohex.bonus = "spread_n1"
	self.weapon_skins.judge_camohex.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_002_df")
	self.weapon_skins.judge_camohex.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.judge_camohex.reserve_quality = true
	self.weapon_skins.mg42_camohex = {}
	self.weapon_skins.mg42_camohex.weapon_id = "mg42"
	self.weapon_skins.mg42_camohex.name_id = "bm_wskn_mg42_camohex"
	self.weapon_skins.mg42_camohex.desc_id = "bm_wskn_mg42_camohex_desc"
	self.weapon_skins.mg42_camohex.rarity = "uncommon"
	self.weapon_skins.mg42_camohex.bonus = "spread_p1"
	self.weapon_skins.mg42_camohex.reserve_quality = true
	self.weapon_skins.mg42_camohex.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.mg42_camohex.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df")
	self.weapon_skins.mg42_camohex.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_001_df")
	self.weapon_skins.mg42_camohex.pattern_tweak = Vector3(0.634393, 2.64684, 0.942682)
	self.weapon_skins.mg42_camohex.parts = {
		wpn_fps_lmg_mg42_reciever = {
			[Idstring("wpn_fps_ass_fal_base_nm"):key()] = {
				pattern_tweak = Vector3(11.8435, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_bones_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_bones_df")
			}
		}
	}
	self.weapon_skins.p90_luxury = {}
	self.weapon_skins.p90_luxury.name_id = "bm_wskn_p90_luxury"
	self.weapon_skins.p90_luxury.desc_id = "bm_wskn_p90_luxury_desc"
	self.weapon_skins.p90_luxury.weapon_id = "p90"
	self.weapon_skins.p90_luxury.reserve_quality = true
	self.weapon_skins.p90_luxury.rarity = "rare"
	self.weapon_skins.p90_luxury.bonus = "concealment_p2"
	self.weapon_skins.p90_luxury.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.p90_luxury.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
	self.weapon_skins.p90_luxury.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_binary_df")
	self.weapon_skins.p90_luxury.parts = {
		wpn_fps_smg_p90_body_p90 = {
			[Idstring("p90"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_hoxton_hacks_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/binary_pattern_df"),
				pattern_pos = Vector3(0.024, 0.014, 0),
				uv_scale = Vector3(5.17317, 5.36387, 1),
				uv_offset_rot = Vector3(-0.337228, 0.927013, 6.22325),
				pattern_tweak = Vector3(6.63141, 0, 1)
			}
		},
		wpn_fps_smg_p90_b_ninja = {
			[Idstring("mtr_ninja"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_hoxton_hacks_df"),
				uv_scale = Vector3(2.21734, 2.21734, 0.804436),
				uv_offset_rot = Vector3(0.0443599, 1.16651, 3.19629)
			}
		}
	}
	self.weapon_skins.p90_luxury.default_blueprint = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_m_std",
		"wpn_fps_smg_p90_b_ninja",
		"wpn_fps_upg_o_eotech"
	}
	self.weapon_skins.ak74_luxury = {}
	self.weapon_skins.ak74_luxury.name_id = "bm_wskn_ak74_luxury"
	self.weapon_skins.ak74_luxury.desc_id = "bm_wskn_ak74_luxury_desc"
	self.weapon_skins.ak74_luxury.weapon_id = "ak74"
	self.weapon_skins.ak74_luxury.reserve_quality = true
	self.weapon_skins.ak74_luxury.rarity = "rare"
	self.weapon_skins.ak74_luxury.bonus = "spread_p1"
	self.weapon_skins.ak74_luxury.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.ak74_luxury.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_002_df")
	self.weapon_skins.ak74_luxury.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_002_df")
	self.weapon_skins.ak74_luxury.parts = {
		wpn_fps_upg_ak_m_quad = {
			[Idstring("mtr_quadstack"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_sad_almir_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_dead_birds_df"),
				pattern_pos = Vector3(-0.184593, 0, 0),
				uv_scale = Vector3(4.02898, 4.172, 1),
				uv_offset_rot = Vector3(0.177916, 0.998331, 0.184315),
				pattern_tweak = Vector3(5.49964, 0, 0.33699)
			}
		},
		wpn_fps_ass_74_body_upperreceiver = {
			[Idstring("ak74_dustcover"):key()] = {
				pattern_pos = Vector3(0, 0.0920584, 0),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_dead_birds_df"),
				pattern_tweak = Vector3(3.21011, 0, 1)
			}
		},
		wpn_fps_ass_ak_body_lowerreceiver = {
			[Idstring("ak_base"):key()] = {
				uv_offset_rot = Vector3(0.130217, 0.931553, 0.0944058),
				pattern_pos = Vector3(0.0348201, 0, 0),
				uv_scale = Vector3(14.8511, 14.6128, 0),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_dead_birds_df"),
				pattern_tweak = Vector3(4.78417, 0, 1)
			}
		},
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_sad_almir_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_dead_birds_df"),
				pattern_tweak = Vector3(7.78917, 0, 1),
				uv_scale = Vector3(7.99564, 7.98598, 1),
				uv_offset_rot = Vector3(-0.371387, 0.578663, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_binary_df")
			}
		}
	}
	self.weapon_skins.ak74_luxury.default_blueprint = {
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_upg_ak_b_ak105",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ak_fg_trax",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_o_ak_scopemount"
	}
	self.weapon_skins.ppk_luxury = {}
	self.weapon_skins.ppk_luxury.name_id = "bm_wskn_ppk_luxury"
	self.weapon_skins.ppk_luxury.desc_id = "bm_wskn_ppk_luxury_desc"
	self.weapon_skins.ppk_luxury.weapon_id = "ppk"
	self.weapon_skins.ppk_luxury.reserve_quality = true
	self.weapon_skins.ppk_luxury.rarity = "rare"
	self.weapon_skins.ppk_luxury.bonus = "recoil_p1"
	self.weapon_skins.ppk_luxury.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.ppk_luxury.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df")
	self.weapon_skins.ppk_luxury.parts = {
		wpn_fps_pis_ppk_g_standard = {
			[Idstring("mtr_grip"):key()] = {
				pattern_tweak = Vector3(2.59003, 0, 1)
			}
		},
		wpn_fps_pis_ppk_body_standard = {
			[Idstring("mtr_frame"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_cloaker_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/dungeon_pattern_df"),
				pattern_tweak = Vector3(3.5917, 0, 0.410923),
				uv_scale = Vector3(1.69292, 1.97897, 0.148581),
				uv_offset_rot = Vector3(0.0423599, 1.02295, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_new_004_df")
			}
		},
		wpn_fps_pis_ppk_b_standard = {
			[Idstring("mtr_slide"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_cloaker_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/dungeon_pattern_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_new_004_df"),
				uv_scale = Vector3(1.74059, 2.12199, 0.141426),
				uv_offset_rot = Vector3(-0.022418, 0.874315, 0),
				pattern_tweak = Vector3(2.97162, 0, 0.623182)
			},
			[Idstring("mtr_barrel"):key()] = {
				uv_scale = Vector3(1.31152, 1.50222, 1),
				uv_offset_rot = Vector3(-0.222752, 1.12235, 0),
				pattern_tweak = Vector3(2.25614, 0, 1)
			}
		},
		wpn_fps_upg_ns_pis_medium_gem = {
			[Idstring("silencer"):key()] = {
				pattern_pos = Vector3(0, -0.00333858, 0),
				uv_scale = Vector3(1.12082, 2.31269, 0.363224),
				uv_offset_rot = Vector3(0.0634394, 0.864775, 0)
			}
		},
		wpn_fps_pis_ppk_b_long = {
			[Idstring("mtr_slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_cloaker_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/dungeon_pattern_df"),
				base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_005_df"),
				uv_offset_rot = Vector3(-0.022418, 0.902934, 0),
				pattern_pos = Vector3(0, -0.0987357, 0),
				uv_scale = Vector3(1.50222, 1.74059, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_new_004_df"),
				pattern_tweak = Vector3(2.73313, 0, 1)
			}
		}
	}
	self.weapon_skins.ppk_luxury.default_blueprint = {
		"wpn_fps_pis_ppk_body_standard",
		"wpn_fps_pis_ppk_m_standard",
		"wpn_fps_pis_ppk_b_long",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_pis_ppk_g_laser"
	}
	self.weapon_skins.plainsrider_linked = {}
	self.weapon_skins.plainsrider_linked.name_id = "bm_wskn_plainsrider_linked"
	self.weapon_skins.plainsrider_linked.desc_id = "bm_wskn_plainsrider_linked_desc"
	self.weapon_skins.plainsrider_linked.weapon_id = "plainsrider"
	self.weapon_skins.plainsrider_linked.rarity = "epic"
	self.weapon_skins.plainsrider_linked.bonus = "total_ammo_p3"
	self.weapon_skins.plainsrider_linked.reserve_quality = true
	self.weapon_skins.plainsrider_linked.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.plainsrider_linked.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
	self.weapon_skins.plainsrider_linked.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_005_df")
	self.weapon_skins.plainsrider_linked.pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_waves_df")
	self.weapon_skins.plainsrider_linked.sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_thebomb_df")
	self.weapon_skins.plainsrider_linked.pattern_tweak = Vector3(8.55235, 0, 1)
	self.weapon_skins.plainsrider_linked.pattern_pos = Vector3(0.058, 0.036, 0)
	self.weapon_skins.plainsrider_linked.uv_scale = Vector3(20, 20, 1)
	self.weapon_skins.plainsrider_linked.uv_offset_rot = Vector3(-0.037418, 1.21774, 0)
	self.weapon_skins.plainsrider_linked.default_blueprint = {
		"wpn_fps_bow_plainsrider_b_standard",
		"wpn_fps_bow_plainsrider_body_standard",
		"wpn_fps_upg_a_bow_explosion"
	}
	self.weapon_skins.new_m4_payday = {}
	self.weapon_skins.new_m4_payday.name_id = "bm_wskn_new_m4_payday"
	self.weapon_skins.new_m4_payday.desc_id = "bm_wskn_new_m4_payday_desc"
	self.weapon_skins.new_m4_payday.weapon_id = "new_m4"
	self.weapon_skins.new_m4_payday.reserve_quality = true
	self.weapon_skins.new_m4_payday.rarity = "epic"
	self.weapon_skins.new_m4_payday.bonus = "spread_p1"
	self.weapon_skins.new_m4_payday.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.new_m4_payday.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_002_df")
	self.weapon_skins.new_m4_payday.pattern_tweak = Vector3(0.968283, 0, 1)
	self.weapon_skins.new_m4_payday.pattern_pos = Vector3(0.187455, -0.0510372, 0)
	self.weapon_skins.new_m4_payday.parts = {
		wpn_fps_upg_o_acog = {
			[Idstring("mtr_acog"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_pixel_safe_df"),
				uv_offset_rot = Vector3(0.216075, 1.18912, 3.36112),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df"),
				uv_scale = Vector3(5.84062, 6.17434, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_tweak = Vector3(0.72979, 0, 1)
			}
		},
		wpn_fps_upg_ass_ns_jprifles = {
			[Idstring("mtr_jprifles"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df"),
				pattern_tweak = Vector3(0.538996, 0, 1)
			}
		},
		wpn_fps_ass_l85a2_m_emag = {
			[Idstring("mtr_emag"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_pixel_safe_df"),
				uv_offset_rot = Vector3(-0.179133, 0.673981, 5.98349),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df"),
				uv_scale = Vector3(2.78944, 2.98014, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_tweak = Vector3(0.443599, 0, 1)
			}
		},
		wpn_fps_m4_lower_reciever = {
			[Idstring("m4_lower_reciever"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_pixel_safe_df"),
				uv_offset_rot = Vector3(0.243773, 0.731219, 0.109391),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df"),
				pattern_pos = Vector3(0, -0.318149, 0),
				uv_scale = Vector3(3.36153, 4.02898, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_tweak = Vector3(0.682091, 0, 1)
			}
		},
		wpn_fps_upg_m4_s_ubr = {
			[Idstring("mtr_ubr"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_pixel_safe_df"),
				uv_offset_rot = Vector3(0.33471, 0.954712, 6.0734),
				uv_scale = Vector3(7.69993, 7.98598, 1),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df")
			}
		},
		wpn_fps_upg_ass_m4_fg_moe = {
			[Idstring("mtr_moe"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_pixel_safe_df"),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_crackled_ground_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_001_df"),
				uv_scale = Vector3(6.12667, 6.55574, 0),
				uv_offset_rot = Vector3(0.265233, 0.880774, 6.2682),
				pattern_tweak = Vector3(0.920584, 0, 1)
			}
		}
	}
	self.weapon_skins.new_m4_payday.default_blueprint = {
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ass_m4_fg_moe",
		"wpn_fps_m4_uupg_b_long",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_ass_m4_upper_reciever_ballos"
	}
	self.weapon_skins.deagle_bling = {}
	self.weapon_skins.deagle_bling.name_id = "bm_wskn_deagle_bling"
	self.weapon_skins.deagle_bling.desc_id = "bm_wskn_deagle_bling_desc"
	self.weapon_skins.deagle_bling.weapon_id = "deagle"
	self.weapon_skins.deagle_bling.rarity = "legendary"
	self.weapon_skins.deagle_bling.bonus = "recoil_p2"
	self.weapon_skins.deagle_bling.reserve_quality = true
	self.weapon_skins.deagle_bling.texture_bundle_folder = "cash/safes/cf15"
	self.weapon_skins.deagle_bling.unique_name_id = "bm_wskn_deagle_bling"
	self.weapon_skins.deagle_bling.locked = true
	self.weapon_skins.deagle_bling.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
	self.weapon_skins.deagle_bling.default_blueprint = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_m_standard",
		"wpn_fps_pis_deagle_b_legend",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_upg_o_rmr"
	}
	self.weapon_skins.deagle_bling.parts = {
		wpn_fps_pis_deagle_g_ergo = {
			[Idstring("ergo"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
			},
			[Idstring("grip"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_goldcoins_df"),
				pattern_tweak = Vector3(4.54567, 0, 1),
				uv_scale = Vector3(2.64641, 2.64641, 1),
				uv_offset_rot = Vector3(-0.170117, 1.01187, 4.70977),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_005_df")
			}
		},
		wpn_fps_pis_deagle_b_legend = {
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_001_df"),
				uv_offset_rot = Vector3(0.244694, 1.07465, 0),
				pattern_pos = Vector3(0.005, 0.769457, 0),
				uv_scale = Vector3(3.45688, 3.93363, 1),
				pattern_tweak = Vector3(0.641791, 0, 0)
			},
			[Idstring("mtr_legendcomp"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_tweak = Vector3(0.200805, 4.71977, 0),
				pattern_pos = Vector3(0.530885, 1.03795, 0),
				uv_scale = Vector3(2.07432, 2.21734, 1),
				uv_offset_rot = Vector3(-0.0128784, 0.712139, 4.72674),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df")
			}
		},
		wpn_fps_pis_deagle_b_standard = {
			[Idstring("barrel"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_pos = Vector3(0.0443599, -0.0128784, 0),
				cubemap_pattern_control = Vector3(0, 5, 0),
				pattern_tweak = Vector3(0.825187, 0, 1)
			}
		},
		wpn_fps_pis_deagle_body_standard = {
			[Idstring("base"):key()] = {
				pattern_tweak = Vector3(0.292202, 0, 0),
				pattern = Idstring("units/payday2_cash/safes/cf15/pattern/fire_pattern_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df")
			}
		},
		wpn_fps_pis_deagle_co_short = {
			[Idstring("comp2"):key()] = {
				cubemap_pattern_control = Vector3(0, 5, 0),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_tweak = Vector3(1, 0, 1.06511)
			}
		}
	}
	self.weapon_skins.new_m4_skullimov = {}
	self.weapon_skins.new_m4_skullimov.name_id = "bm_wskn_new_m4_skullimov"
	self.weapon_skins.new_m4_skullimov.desc_id = "bm_wskn_new_m4_skullimov_desc"
	self.weapon_skins.new_m4_skullimov.weapon_id = "new_m4"
	self.weapon_skins.new_m4_skullimov.reserve_quality = true
	self.weapon_skins.new_m4_skullimov.rarity = "rare"
	self.weapon_skins.new_m4_skullimov.bonus = "spread_p1_tem_p1"
	self.weapon_skins.new_m4_skullimov.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.new_m4_skullimov.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_ferrar_df")
	self.weapon_skins.new_m4_skullimov.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_zebrafade_df")
	self.weapon_skins.new_m4_skullimov.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df")
	self.weapon_skins.new_m4_skullimov.sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_zebra_df")
	self.weapon_skins.new_m4_skullimov.pattern_tweak = Vector3(0.252805, 0, 0)
	self.weapon_skins.new_m4_skullimov.pattern_pos = Vector3(0.645361, 0, 0)
	self.weapon_skins.new_m4_skullimov.uv_scale = Vector3(0.405702, 0.405702, 1)
	self.weapon_skins.new_m4_skullimov.uv_offset_rot = Vector3(0, 0, 2.23725)
	self.weapon_skins.new_m4_skullimov.cubemap_pattern_control = Vector3(0, 1, 0)
	self.weapon_skins.new_m4_skullimov.default_blueprint = {
		"wpn_fps_m4_lower_reciever",
		"wpn_fps_m4_uupg_draghandle",
		"wpn_fps_upg_ass_m4_fg_moe",
		"wpn_fps_ass_l85a2_m_emag",
		"wpn_fps_m4_uupg_b_short",
		"wpn_fps_upg_ass_m4_upper_reciever_ballos",
		"wpn_fps_upg_m4_s_ubr",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_m4_g_hgrip"
	}
	self.weapon_skins.new_m4_skullimov.parts = {
		wpn_fps_upg_ass_m4_fg_moe = {
			[Idstring("mtr_moe"):key()] = {
				pattern_pos = Vector3(-0.194133, 0.00620103, 0),
				pattern_tweak = Vector3(0.3959, 0, 1)
			}
		},
		wpn_fps_upg_ass_m4_upper_reciever_ballos = {
			[Idstring("mtr_balios"):key()] = {
				pattern_pos = Vector3(0.492726, 0, 0)
			}
		},
		wpn_fps_upg_m4_g_hgrip = {
			[Idstring("mtr_hogue"):key()] = {
				pattern_pos = Vector3(0.301932, 0, 0)
			}
		},
		wpn_fps_upg_m4_s_ubr = {
			[Idstring("mtr_ubr"):key()] = {
				pattern_pos = Vector3(1.36084, 2, 0)
			}
		},
		wpn_fps_m4_uupg_b_short = {
			[Idstring("m4_barrel"):key()] = {
				pattern_pos = Vector3(-0.900071, 0, 0)
			}
		},
		wpn_fps_upg_m4_s_adapter = {
			[Idstring("stock_adapter"):key()] = {
				pattern_pos = Vector3(0.912473, 0.263773, 0)
			}
		},
		wpn_fps_upg_ass_ns_jprifles = {
			[Idstring("mtr_jprifles"):key()] = {
				pattern_pos = Vector3(-2, 0, 0)
			}
		},
		wpn_fps_upg_m4_s_standard_vanilla = {
			[Idstring("stock_standard"):key()] = {
				pattern_pos = Vector3(2, 2, 0)
			}
		},
		wpn_fps_upg_m4_s_pts = {
			[Idstring("stock_pts"):key()] = {
				pattern_pos = Vector3(2, 2, 0)
			}
		},
		wpn_fps_upg_m4_s_crane = {
			[Idstring("mtr_lmt"):key()] = {
				pattern_pos = Vector3(2, 2, 0)
			}
		},
		wpn_fps_upg_m4_s_mk46 = {
			[Idstring("mtr_ubr"):key()] = {
				pattern_pos = Vector3(2, 2, 0)
			}
		}
	}
	self.weapon_skins.deagle_skullimov = {}
	self.weapon_skins.deagle_skullimov.name_id = "bm_wskn_deagle_skullimov"
	self.weapon_skins.deagle_skullimov.desc_id = "bm_wskn_deagle_skullimov_desc"
	self.weapon_skins.deagle_skullimov.weapon_id = "deagle"
	self.weapon_skins.deagle_skullimov.reserve_quality = true
	self.weapon_skins.deagle_skullimov.rarity = "rare"
	self.weapon_skins.deagle_skullimov.bonus = "recoil_p1_tem_p1"
	self.weapon_skins.deagle_skullimov.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.deagle_skullimov.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df")
	self.weapon_skins.deagle_skullimov.parts = {
		wpn_fps_pis_deagle_g_ergo = {
			[Idstring("grip"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_boom_df"),
				uv_scale = Vector3(1.64524, 1.50222, 1),
				uv_offset_rot = Vector3(-0.191434, 1.02241, 4.96451)
			}
		},
		wpn_fps_pis_deagle_co_long = {
			[Idstring("comp1"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_boom_df"),
				uv_scale = Vector3(1.45455, 1.02547, 1),
				uv_offset_rot = Vector3(-0.528023, 0.883854, 0)
			}
		},
		wpn_fps_pis_deagle_b_standard = {
			[Idstring("barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_boom_df"),
				uv_scale = Vector3(1.59757, 1.1685, 1),
				uv_offset_rot = Vector3(0.0348201, 0.883854, 0.033)
			}
		},
		wpn_fps_pis_deagle_body_standard = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_boom_df"),
				uv_offset_rot = Vector3(0.218075, 0.928013, 0),
				uv_scale = Vector3(2.88479, 2.12399, 1)
			}
		},
		wpn_fps_pis_deagle_m_extended = {
			[Idstring("extended_mag"):key()] = {
				uv_scale = Vector3(2.59874, 2.55106, 1),
				uv_offset_rot = Vector3(-0.203673, 0.807537, 0)
			}
		}
	}
	self.weapon_skins.deagle_skullimov.default_blueprint = {
		"wpn_fps_pis_deagle_body_standard",
		"wpn_fps_pis_deagle_b_standard",
		"wpn_fps_pis_deagle_co_long",
		"wpn_fps_pis_deagle_m_extended",
		"wpn_fps_pis_deagle_g_ergo",
		"wpn_fps_pis_deagle_extra",
		"wpn_upg_o_marksmansight_rear"
	}
	self.weapon_skins.p90_skullimov = {}
	self.weapon_skins.p90_skullimov.name_id = "bm_wskn_p90_skullimov"
	self.weapon_skins.p90_skullimov.desc_id = "bm_wskn_p90_skullimov_desc"
	self.weapon_skins.p90_skullimov.weapon_id = "p90"
	self.weapon_skins.p90_skullimov.reserve_quality = true
	self.weapon_skins.p90_skullimov.rarity = "rare"
	self.weapon_skins.p90_skullimov.bonus = "spread_p1_tem_p1"
	self.weapon_skins.p90_skullimov.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.p90_skullimov.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.p90_skullimov.uv_scale = Vector3(1.21617, 1.1685, 0)
	self.weapon_skins.p90_skullimov.uv_offset_rot = Vector3(-0.00333858, 0.836156, 0)
	self.weapon_skins.p90_skullimov.cubemap_pattern_control = Vector3(0, 0.0484141, 0)
	self.weapon_skins.p90_skullimov.parts = {
		wpn_fps_smg_p90_body_p90 = {
			[Idstring("p90"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_overkill_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df"),
				uv_offset_rot = Vector3(-0.346768, 0.969712, 5.11436),
				pattern_pos = Vector3(0.216075, -0.566182, 0),
				uv_scale = Vector3(2.21734, 2.16967, 0.389459),
				pattern_tweak = Vector3(0.491297, 5.45901, 1)
			}
		},
		wpn_fps_upg_ass_ns_jprifles = {
			[Idstring("mtr_jprifles"):key()] = {
				pattern_pos = Vector3(0, -0.194133, 0),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_acryl_001_df"),
				pattern_tweak = Vector3(0.348202, 5.56391, 1)
			}
		}
	}
	self.weapon_skins.p90_skullimov.default_blueprint = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_m_std",
		"wpn_fps_smg_p90_b_long",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_ass_ns_jprifles"
	}
	self.weapon_skins.plainsrider_skullimov = {}
	self.weapon_skins.plainsrider_skullimov.name_id = "bm_wskn_plainsrider_skullimov"
	self.weapon_skins.plainsrider_skullimov.desc_id = "bm_wskn_plainsrider_skullimov_desc"
	self.weapon_skins.plainsrider_skullimov.weapon_id = "plainsrider"
	self.weapon_skins.plainsrider_skullimov.reserve_quality = true
	self.weapon_skins.plainsrider_skullimov.rarity = "rare"
	self.weapon_skins.plainsrider_skullimov.bonus = "total_ammo_p3_tem_p1"
	self.weapon_skins.plainsrider_skullimov.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.plainsrider_skullimov.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_004_df")
	self.weapon_skins.plainsrider_skullimov.uv_scale = Vector3(1.21617, 1.1685, 1)
	self.weapon_skins.plainsrider_skullimov.uv_offset_rot = Vector3(-0.00333858, 0.836156, 0)
	self.weapon_skins.plainsrider_skullimov.parts = {
		wpn_fps_bow_plainsrider_body_standard = {
			[Idstring("mtr_bow"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_headshot_skull_df"),
				uv_offset_rot = Vector3(-0.015418, 1.05057, 1.02347),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_007_df"),
				pattern_pos = Vector3(0.540425, 0, 0),
				uv_scale = Vector3(19.995, 15.4709, 0.270212),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_tweak = Vector3(3.21011, 1.57791, 1)
			}
		}
	}
	self.weapon_skins.plainsrider_skullimov.default_blueprint = {
		"wpn_fps_bow_plainsrider_b_standard",
		"wpn_fps_bow_plainsrider_body_standard",
		"wpn_fps_bow_plainsrider_m_standard"
	}
	self.weapon_skins.m95_bombmatta = {}
	self.weapon_skins.m95_bombmatta.weapon_id = "m95"
	self.weapon_skins.m95_bombmatta.rarity = "rare"
	self.weapon_skins.m95_bombmatta.bonus = "total_ammo_p1_tem_p1"
	self.weapon_skins.m95_bombmatta.name_id = "bm_wskn_m95_bombmatta"
	self.weapon_skins.m95_bombmatta.desc_id = "bm_wskn_m95_bombmatta_desc"
	self.weapon_skins.m95_bombmatta.reserve_quality = true
	self.weapon_skins.m95_bombmatta.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.m95_bombmatta.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df")
	self.weapon_skins.m95_bombmatta.pattern_tweak = Vector3(1.3439, 0, 1.04841)
	self.weapon_skins.m95_bombmatta.uv_scale = Vector3(1.14466, 7.10995, 1)
	self.weapon_skins.m95_bombmatta.uv_offset_rot = Vector3(-0.245409, 0.931552, 0)
	self.weapon_skins.m95_bombmatta.cubemap_pattern_control = Vector3(0.01, 0.01, 0)
	self.weapon_skins.m95_bombmatta.parts = {
		wpn_fps_snp_m95_upper_reciever = {
			[Idstring("mtr_upper"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_blurred_df"),
				pattern_pos = Vector3(0.979251, 0.0920584, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_002_df"),
				pattern_tweak = Vector3(4.68877, 0, 1)
			},
			[Idstring("mtr_pin"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_blurred_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_002_df")
			}
		},
		wpn_fps_upg_o_leupold = {
			[Idstring("leupold"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_002_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_blurred_df"),
				pattern_tweak = Vector3(3.92559, 0, 1)
			}
		},
		wpn_fps_snp_m95_barrel_suppressed = {
			[Idstring("mtr_suppressed"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_hypetrain_df"),
				uv_offset_rot = Vector3(0.0634394, 0.941092, 0),
				uv_scale = Vector3(1.93129, 2.98014, 0),
				pattern_tweak = Vector3(1.63606, 0, 1)
			}
		},
		wpn_fps_snp_m95_lower_reciever = {
			[Idstring("mtr_lower"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_blurred_df"),
				pattern_pos = Vector3(-0.0319577, 0.216075, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_002_df"),
				pattern_tweak = Vector3(4.87956, 0, 1)
			}
		},
		wpn_fps_snp_m95_bipod = {
			[Idstring("mtr_bipod"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_blurred_df"),
				pattern_pos = Vector3(-0.0510372, 0.072979, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_002_df"),
				pattern_tweak = Vector3(1.54067, 0, 1)
			}
		}
	}
	self.weapon_skins.m95_bombmatta.default_blueprint = {
		"wpn_fps_snp_m95_bipod",
		"wpn_fps_snp_m95_lower_reciever",
		"wpn_fps_snp_m95_upper_reciever",
		"wpn_fps_snp_m95_magazine",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_snp_m95_barrel_suppressed",
		"wpn_fps_upg_m4_g_sniper"
	}
	self.weapon_skins.huntsman_bloodsplat = {}
	self.weapon_skins.huntsman_bloodsplat.name_id = "bm_wskn_huntsman_bloodsplat"
	self.weapon_skins.huntsman_bloodsplat.desc_id = "bm_wskn_huntsman_bloodsplat_desc"
	self.weapon_skins.huntsman_bloodsplat.weapon_id = "huntsman"
	self.weapon_skins.huntsman_bloodsplat.reserve_quality = true
	self.weapon_skins.huntsman_bloodsplat.rarity = "rare"
	self.weapon_skins.huntsman_bloodsplat.bonus = "spread_n1_tem_p1"
	self.weapon_skins.huntsman_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.huntsman_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.huntsman_bloodsplat.pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df")
	self.weapon_skins.huntsman_bloodsplat.pattern_tweak = Vector3(2.25614, 1.45804, 2)
	self.weapon_skins.huntsman_bloodsplat.uv_offset_rot = Vector3(0.607203, 0.979251, 3.03145)
	self.weapon_skins.huntsman_bloodsplat.parts = {
		wpn_fps_shot_huntsman_b_short = {
			[Idstring("slug"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_002_df")
			},
			[Idstring("short_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_angrybomb_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hex_001_df"),
				pattern_pos = Vector3(-0.022418, -0.0796564, 0),
				uv_scale = Vector3(1.45455, 1.78827, 0.780587),
				uv_offset_rot = Vector3(0.139757, 0.998331, 4.66481),
				pattern_tweak = Vector3(0.72979, 0, 1)
			}
		},
		wpn_fps_shot_huntsman_b_long = {
			[Idstring("long_barrel"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hex_001_df"),
				pattern_pos = Vector3(0, -1.66517, 0),
				pattern_tweak = Vector3(3.87489, 0.169331, 1)
			}
		},
		wpn_fps_shot_huntsman_s_short = {
			[Idstring("short_stock"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_angrybomb_df"),
				uv_offset_rot = Vector3(-0.0281166, 1.04149, 4.61986),
				uv_scale = Vector3(6.46039, 7.27086, 1),
				pattern_tweak = Vector3(0.872886, 0, 1)
			}
		}
	}
	self.weapon_skins.huntsman_bloodsplat.default_blueprint = {
		"wpn_fps_shot_huntsman_body_standard",
		"wpn_fps_shot_huntsman_b_short",
		"wpn_fps_shot_huntsman_s_short"
	}
	self.weapon_skins.r93_bloodsplat = {}
	self.weapon_skins.r93_bloodsplat.name_id = "bm_wskn_r93_bloodsplat"
	self.weapon_skins.r93_bloodsplat.desc_id = "bm_wskn_r93_bloodsplat_desc"
	self.weapon_skins.r93_bloodsplat.weapon_id = "r93"
	self.weapon_skins.r93_bloodsplat.reserve_quality = true
	self.weapon_skins.r93_bloodsplat.rarity = "rare"
	self.weapon_skins.r93_bloodsplat.bonus = "recoil_p1_tem_p1"
	self.weapon_skins.r93_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.r93_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_007_df")
	self.weapon_skins.r93_bloodsplat.parts = {
		wpn_fps_snp_r93_body_wood = {
			[Idstring("mtr_wooden"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_shark_df"),
				uv_scale = Vector3(3.79061, 4.88712, 0.549249),
				uv_offset_rot = Vector3(0.110598, 0.950632, 0.0194812)
			},
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_shark_df"),
				uv_offset_rot = Vector3(-0.30807, 1.42808, 3.2862),
				pattern_pos = Vector3(0, 0.597663, 0),
				uv_scale = Vector3(1.50222, 2.07432, 0.0388744),
				cubemap_pattern_control = Vector3(0, 0.011, 0)
			}
		}
	}
	self.weapon_skins.r93_bloodsplat.default_blueprint = {
		"wpn_fps_snp_r93_b_standard",
		"wpn_fps_snp_r93_m_std",
		"wpn_fps_snp_r93_body_wood",
		"wpn_fps_upg_o_leupold"
	}
	self.weapon_skins.judge_wooh = {}
	self.weapon_skins.judge_wooh.name_id = "bm_wskn_judge_wooh"
	self.weapon_skins.judge_wooh.desc_id = "bm_wskn_judge_wooh_desc"
	self.weapon_skins.judge_wooh.weapon_id = "judge"
	self.weapon_skins.judge_wooh.reserve_quality = true
	self.weapon_skins.judge_wooh.rarity = "rare"
	self.weapon_skins.judge_wooh.bonus = "spread_p1_tem_p1"
	self.weapon_skins.judge_wooh.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.judge_wooh.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_checker_df")
	self.weapon_skins.judge_wooh.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_checker_df")
	self.weapon_skins.judge_wooh.pattern_tweak = Vector3(0.272407, 0, 0)
	self.weapon_skins.judge_wooh.pattern_pos = Vector3(-1.88266, -1.30628, 0)
	self.weapon_skins.judge_wooh.cubemap_pattern_control = Vector3(0.883139, 1, 0)
	self.weapon_skins.judge_wooh.default_blueprint = {
		"wpn_fps_pis_judge_body_standard",
		"wpn_fps_pis_judge_b_standard",
		"wpn_fps_pis_judge_g_standard",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_shot_ns_king"
	}
	self.weapon_skins.judge_wooh.parts = {
		wpn_fps_pis_judge_g_standard = {
			[Idstring("mtr_grip"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_004_df"),
				uv_offset_rot = Vector3(-0.384927, 1.00787, 4.88959),
				pattern_pos = Vector3(0.005, 0.027, 0),
				uv_scale = Vector3(1.78827, 1.74059, 0.773432),
				pattern_tweak = Vector3(0.748188, 0.364135, 1)
			}
		},
		wpn_fps_upg_shot_ns_king = {
			[Idstring("mtr_king"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(1.16051, 1.26544, 0),
				uv_scale = Vector3(0.374378, 0.374703, 0.787741),
				pattern_tweak = Vector3(2.25614, 0, 1)
			}
		},
		wpn_fps_pis_judge_body_standard = {
			[Idstring("mtr_mech"):key()] = {
				uv_offset_rot = Vector3(-0.241831, 1.13189, 0)
			},
			[Idstring("mtr_cylinder"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(0.950632, 1.12235, 0.723773),
				uv_scale = Vector3(0.453377, 0.501052, 0.82113),
				pattern_tweak = Vector3(0.300503, 0, 1)
			},
			[Idstring("mtr_frame"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(0.597663, 1.04603, 0),
				uv_scale = Vector3(0.7871, 0.7871, 0.618412),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_checker_001_df"),
				pattern_tweak = Vector3(1.73146, 0, 1)
			}
		}
	}
	self.weapon_skins.b92fs_bloodsplat = {}
	self.weapon_skins.b92fs_bloodsplat.name_id = "bm_wskn_b92fs_bloodsplat"
	self.weapon_skins.b92fs_bloodsplat.desc_id = "bm_wskn_b92fs_bloodsplat_desc"
	self.weapon_skins.b92fs_bloodsplat.weapon_id = "b92fs"
	self.weapon_skins.b92fs_bloodsplat.reserve_quality = true
	self.weapon_skins.b92fs_bloodsplat.rarity = "rare"
	self.weapon_skins.b92fs_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.b92fs_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.b92fs_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df")
	self.weapon_skins.b92fs_bloodsplat.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_smoker_df")
	self.weapon_skins.b92fs_bloodsplat.pattern_tweak = Vector3(2.44694, 1.45804, 2)
	self.weapon_skins.b92fs_bloodsplat.uv_offset_rot = Vector3(0.607203, 0.979251, 3.03145)
	self.weapon_skins.b92fs_bloodsplat.parts = {
		wpn_fps_pis_beretta_g_engraved = {
			[Idstring("mtr_engraved"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_8ball_df"),
				uv_offset_rot = Vector3(-7.98971E-4, 0.855235, 5.98349),
				pattern_pos = Vector3(-0.117815, -0.0414975, 0),
				uv_scale = Vector3(6.88946, 7.12783, 1),
				pattern_tweak = Vector3(2.25614, 1.96752, 1)
			}
		},
		wpn_fps_pis_beretta_g_std = {
			[Idstring("std_grips"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
			}
		},
		wpn_fps_pis_beretta_sl_brigadier = {
			[Idstring("brig"):key()] = {
				pattern_pos = Vector3(0.290074, -0.34637, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_psybilly_df"),
				pattern_tweak = Vector3(3.16242, 0.553073, 1)
			}
		},
		wpn_fps_pis_beretta_body_beretta = {
			[Idstring("body"):key()] = {
				pattern_pos = Vector3(0.261836, -0.0184975, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_psybilly_df"),
				pattern_tweak = Vector3(4.45028, 1.36813, 1)
			}
		},
		wpn_fps_pis_beretta_o_std = {
			[Idstring("std_sight"):key()] = {
				pattern_tweak = Vector3(1.82686, 0, 1)
			}
		},
		wpn_fps_pis_beretta_m_extended = {
			[Idstring("extd"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_8ball_df"),
				uv_offset_rot = Vector3(-0.0641165, 1.38346, 1.15834),
				uv_scale = Vector3(11.5616, 11.5616, 1),
				pattern_tweak = Vector3(5.49964, 0, 1)
			}
		},
		wpn_fps_upg_ns_pis_jungle = {
			[Idstring("mtr_jungle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_8ball_df"),
				uv_offset_rot = Vector3(0.348471, 1.00787, 4.0804),
				uv_scale = Vector3(4.50573, 4.50573, 1),
				pattern_tweak = Vector3(2.06535, 0.439059, 1)
			}
		}
	}
	self.weapon_skins.b92fs_bloodsplat.default_blueprint = {
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_sl_brigadier",
		"wpn_fps_pis_beretta_m_extended",
		"wpn_fps_pis_beretta_g_engraved",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_pis_beretta_o_std"
	}
	self.weapon_skins.mg42_bloodsplat = {}
	self.weapon_skins.mg42_bloodsplat.name_id = "bm_wskn_mg42_bloodsplat"
	self.weapon_skins.mg42_bloodsplat.desc_id = "bm_wskn_mg42_bloodsplat_desc"
	self.weapon_skins.mg42_bloodsplat.weapon_id = "mg42"
	self.weapon_skins.mg42_bloodsplat.reserve_quality = true
	self.weapon_skins.mg42_bloodsplat.rarity = "rare"
	self.weapon_skins.mg42_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.mg42_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.mg42_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_006_df")
	self.weapon_skins.mg42_bloodsplat.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_008_df")
	self.weapon_skins.mg42_bloodsplat.pattern_tweak = Vector3(5.26115, 1.11338, 2)
	self.weapon_skins.mg42_bloodsplat.uv_offset_rot = Vector3(0.607203, 0.979251, 3.03145)
	self.weapon_skins.mg42_bloodsplat.parts = {
		wpn_fps_lmg_mg42_b_mg34 = {
			[Idstring("wpn_fps_ass_fal_barrel_mg34_nm"):key()] = {
				pattern_tweak = Vector3(12.3682, 0, 1)
			}
		},
		wpn_fps_lmg_mg42_reciever = {
			[Idstring("wpn_fps_ass_fal_base_nm"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_burning_skull_df"),
				uv_offset_rot = Vector3(0.0422805, 0.721679, 5.32415),
				pattern_pos = Vector3(0, -0.006, 0),
				uv_scale = Vector3(8.84412, 9.0825, 0.282137),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_rockabilly_df"),
				pattern_tweak = Vector3(13.9423, 0.006, 0.997)
			}
		}
	}
	self.weapon_skins.mg42_bloodsplat.default_blueprint = {
		"wpn_fps_lmg_mg42_n42",
		"wpn_fps_lmg_mg42_reciever",
		"wpn_fps_lmg_mg42_b_mg34"
	}
	self.weapon_skins.m134_bloodsplat = {}
	self.weapon_skins.m134_bloodsplat.name_id = "bm_wskn_m134_bloodsplat"
	self.weapon_skins.m134_bloodsplat.desc_id = "bm_wskn_m134_bloodsplat_desc"
	self.weapon_skins.m134_bloodsplat.weapon_id = "m134"
	self.weapon_skins.m134_bloodsplat.reserve_quality = true
	self.weapon_skins.m134_bloodsplat.rarity = "rare"
	self.weapon_skins.m134_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.m134_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.m134_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.m134_bloodsplat.parts = {
		wpn_fps_lmg_m134_body = {
			[Idstring("mtr_body"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_rosered_df"),
				pattern_pos = Vector3(0.101598, 0.0252805, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_008_df"),
				pattern_tweak = Vector3(8.12306, 0, 1)
			}
		},
		wpn_fps_lmg_m134_body_upper = {
			[Idstring("mtr_handle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_dabomb_df"),
				uv_scale = Vector3(11.2755, 11.2279, 0),
				uv_offset_rot = Vector3(0.123217, 1.03649, 1.57791)
			}
		}
	}
	self.weapon_skins.m134_bloodsplat.default_blueprint = {
		"wpn_fps_lmg_m134_body",
		"wpn_fps_lmg_m134_body_upper",
		"wpn_fps_lmg_m134_m_standard",
		"wpn_fps_lmg_m134_barrel_extreme"
	}
	self.weapon_skins.flamethrower_mk2_bloodsplat = {}
	self.weapon_skins.flamethrower_mk2_bloodsplat.name_id = "bm_wskn_flamethrower_mk2_bloodsplat"
	self.weapon_skins.flamethrower_mk2_bloodsplat.desc_id = "bm_wskn_flamethrower_mk2_bloodsplat_desc"
	self.weapon_skins.flamethrower_mk2_bloodsplat.weapon_id = "flamethrower_mk2"
	self.weapon_skins.flamethrower_mk2_bloodsplat.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_bloodsplat.rarity = "rare"
	self.weapon_skins.flamethrower_mk2_bloodsplat.bonus = "damage_p1_tem_p1"
	self.weapon_skins.flamethrower_mk2_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.flamethrower_mk2_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df")
	self.weapon_skins.flamethrower_mk2_bloodsplat.pattern_tweak = Vector3(2.25614, 1.45804, 2)
	self.weapon_skins.flamethrower_mk2_bloodsplat.uv_scale = Vector3(1, 0.999, 1)
	self.weapon_skins.flamethrower_mk2_bloodsplat.uv_offset_rot = Vector3(0.35917, 0.979251, 3.03145)
	self.weapon_skins.flamethrower_mk2_bloodsplat.parts = {
		wpn_fps_fla_mk2_body = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/dw_skull_df"),
				uv_offset_rot = Vector3(0.0443599, 0.922013, 6.05841),
				pattern_pos = Vector3(0.168376, -0.00333858, 0),
				uv_scale = Vector3(3.79061, 4.172, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(5.88123, 1.66782, 1)
			}
		},
		wpn_fps_fla_mk2_mag_rare = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_overkill_logo_df"),
				pattern_pos = Vector3(0.111138, 0.147836, 0),
				uv_scale = Vector3(8.60575, 8.55807, 0.775817),
				uv_offset_rot = Vector3(0.196995, 0.883854, 1.69779),
				pattern_tweak = Vector3(4.02099, 3.36112, 1)
			}
		}
	}
	self.weapon_skins.flamethrower_mk2_bloodsplat.default_blueprint = {
		"wpn_fps_fla_mk2_empty",
		"wpn_fps_fla_mk2_body",
		"wpn_fps_fla_mk2_mag_rare"
	}
	self.weapon_skins.rpg7_bloodsplat = {}
	self.weapon_skins.rpg7_bloodsplat.name_id = "bm_wskn_rpg7_bloodsplat"
	self.weapon_skins.rpg7_bloodsplat.desc_id = "bm_wskn_rpg7_bloodsplat_desc"
	self.weapon_skins.rpg7_bloodsplat.weapon_id = "rpg7"
	self.weapon_skins.rpg7_bloodsplat.reserve_quality = true
	self.weapon_skins.rpg7_bloodsplat.rarity = "rare"
	self.weapon_skins.rpg7_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.rpg7_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.rpg7_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df")
	self.weapon_skins.rpg7_bloodsplat.uv_scale = Vector3(0.01, 0.548726, 1)
	self.weapon_skins.rpg7_bloodsplat.parts = {
		wpn_fps_rpg7_m_rocket = {
			[Idstring("mtr_rocket"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_trex_df"),
				uv_scale = Vector3(0.977799, 1.58791, 1),
				uv_offset_rot = Vector3(-0.0319577, 1.00033, 6.28319)
			}
		},
		wpn_fps_rpg7_body = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_trex_df"),
				uv_offset_rot = Vector3(0.301932, 0.998331, 6.28319),
				uv_scale = Vector3(0.930124, 1.59757, 0),
				pattern_tweak = Vector3(6.8829, 1.02347, 1)
			}
		}
	}
	self.weapon_skins.g36_bloodsplat = {}
	self.weapon_skins.g36_bloodsplat.name_id = "bm_wskn_g36_bloodsplat"
	self.weapon_skins.g36_bloodsplat.desc_id = "bm_wskn_g36_bloodsplat_desc"
	self.weapon_skins.g36_bloodsplat.weapon_id = "g36"
	self.weapon_skins.g36_bloodsplat.rarity = "rare"
	self.weapon_skins.g36_bloodsplat.reserve_quality = true
	self.weapon_skins.g36_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.g36_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.g36_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_002_df")
	self.weapon_skins.g36_bloodsplat.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_overkill_logo_df")
	self.weapon_skins.g36_bloodsplat.pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df")
	self.weapon_skins.g36_bloodsplat.pattern_tweak = Vector3(1.34987, 1.69779, 1)
	self.weapon_skins.g36_bloodsplat.default_blueprint = {
		"wpn_fps_ass_g36_m_standard",
		"wpn_fps_ass_g36_b_long",
		"wpn_fps_ass_g36_fg_ksk",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_ass_g36_s_sl8",
		"wpn_fps_upg_ass_ns_surefire"
	}
	self.weapon_skins.g36_bloodsplat.parts = {
		wpn_fps_ass_g36_fg_ksk = {
			[Idstring("ksk"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(0.235154, 0.635822, 1.69779),
				uv_scale = Vector3(0.739425, 0.834774, 1),
				pattern_tweak = Vector3(1.34987, 1.69779, 1)
			}
		},
		wpn_fps_ass_g36_body_sl8 = {
			[Idstring("base"):key()] = {
				pattern_tweak = Vector3(2.11305, 1.66782, 1)
			}
		},
		wpn_fps_ass_g36_b_long = {
			[Idstring("barrel"):key()] = {
				pattern_pos = Vector3(-0.384927, 0, 0),
				pattern_tweak = Vector3(0.872886, 1.8926, 1)
			}
		},
		wpn_fps_ass_g36_s_sl8 = {
			[Idstring("sl8"):key()] = {
				pattern_tweak = Vector3(1, 1.86263, 1)
			}
		},
		wpn_fps_upg_fl_ass_utg = {
			[Idstring("mtr_led"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(0.540425, 1.02695, 2.56692),
				uv_scale = Vector3(0.739425, 0.548726, 1),
				pattern_tweak = Vector3(1.58836, 1.7877, 1)
			}
		},
		wpn_fps_upg_ass_ns_surefire = {
			[Idstring("mtr_surefire"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bloodsplat_df"),
				uv_offset_rot = Vector3(0.282853, 0.759838, 0),
				uv_scale = Vector3(0.644076, 1.02547, 1)
			}
		}
	}
	self.weapon_skins.serbu_stunner = {}
	self.weapon_skins.serbu_stunner.name_id = "bm_wskn_serbu_stunner"
	self.weapon_skins.serbu_stunner.desc_id = "bm_wskn_serbu_stunner_desc"
	self.weapon_skins.serbu_stunner.weapon_id = "serbu"
	self.weapon_skins.serbu_stunner.reserve_quality = true
	self.weapon_skins.serbu_stunner.rarity = "epic"
	self.weapon_skins.serbu_stunner.bonus = "spread_p1_tem_p1"
	self.weapon_skins.serbu_stunner.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.serbu_stunner.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_shot_shorty_s_solid_short",
		"wpn_fps_upg_a_explosive"
	}
	self.weapon_skins.serbu_stunner.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df")
	self.weapon_skins.serbu_stunner.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_003_df")
	self.weapon_skins.serbu_stunner.pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df")
	self.weapon_skins.serbu_stunner.pattern_tweak = Vector3(0.340202, 0, 1)
	self.weapon_skins.serbu_stunner.pattern_pos = Vector3(-1.00501, 0, 0)
	self.weapon_skins.serbu_stunner.parts = {
		wpn_fps_upg_m4_g_ergo = {
			[Idstring("ergo_grip"):key()] = {
				pattern_pos = Vector3(-0.232292, 0.36871, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df"),
				pattern_tweak = Vector3(0.240805, 0, 1)
			}
		},
		wpn_fps_shot_r870_b_short = {
			[Idstring("short_barrel"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
			}
		},
		wpn_fps_shot_r870_body_standard = {
			[Idstring("receiver"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bombs_away_df"),
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
				uv_scale = Vector3(1.21617, 1.97897, 0),
				uv_offset_rot = Vector3(-0.034799, 1.00087, 6.28319)
			}
		},
		wpn_fps_shot_shorty_s_solid_short = {
			[Idstring("solid"):key()] = {
				pattern_pos = Vector3(-0.909611, -0.026, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df"),
				pattern_tweak = Vector3(0.321202, 0, 1)
			},
			[Idstring("big_rail"):key()] = {
				pattern_pos = Vector3(-0.737896, -0.00333858, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df"),
				pattern_tweak = Vector3(0.272503, 0, 1)
			}
		},
		wpn_fps_shot_r870_s_solid = {
			[Idstring("solid"):key()] = {
				pattern_pos = Vector3(-0.909611, -0.026, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df"),
				pattern_tweak = Vector3(0.321202, 0, 1)
			}
		},
		wpn_fps_shot_r870_fg_small = {
			[Idstring("short_pump"):key()] = {
				pattern_pos = Vector3(2, -0.155974, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_smoke_df"),
				pattern_tweak = Vector3(0.348202, 0, 1)
			}
		},
		wpn_fps_shot_shorty_m_extended_short = {
			[Idstring("extension"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
			}
		}
	}
	self.weapon_skins.new_m14_bloodsplat = {}
	self.weapon_skins.new_m14_bloodsplat.name_id = "bm_wskn_new_m14_bloodsplat"
	self.weapon_skins.new_m14_bloodsplat.desc_id = "bm_wskn_new_m14_bloodsplat_desc"
	self.weapon_skins.new_m14_bloodsplat.weapon_id = "new_m14"
	self.weapon_skins.new_m14_bloodsplat.reserve_quality = true
	self.weapon_skins.new_m14_bloodsplat.rarity = "epic"
	self.weapon_skins.new_m14_bloodsplat.bonus = "recoil_p1_tem_p1"
	self.weapon_skins.new_m14_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.new_m14_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_008_df")
	self.weapon_skins.new_m14_bloodsplat.parts = {
		wpn_fps_ass_m14_body_upper = {
			[Idstring("base"):key()] = {
				pattern_pos = Vector3(0.454567, 0.149297, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_overkill_logo_df"),
				pattern_tweak = Vector3(1.58836, 1.02347, 1)
			}
		},
		wpn_fps_ass_m14_body_lower = {
			[Idstring("lower"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_overkill_logo_df"),
				pattern_tweak = Vector3(2.01765, 0.948547, 1)
			}
		},
		wpn_fps_ass_m14_m_standard = {
			[Idstring("mag"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_pinupp_df"),
				uv_offset_rot = Vector3(0.029201, 0.570584, 0),
				uv_scale = Vector3(2.83711, 2.83711, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_overkill_logo_df"),
				pattern_tweak = Vector3(2.14075, 1.02152, 1)
			}
		},
		wpn_fps_ass_m14_body_jae = {
			[Idstring("jae"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
			}
		}
	}
	self.weapon_skins.new_m14_bloodsplat.default_blueprint = {
		"wpn_fps_ass_m14_b_standard",
		"wpn_fps_ass_m14_body_lower",
		"wpn_fps_ass_m14_body_upper",
		"wpn_fps_ass_m14_m_standard",
		"wpn_fps_ass_m14_body_jae",
		"wpn_fps_upg_o_acog",
		"wpn_fps_upg_o_m14_scopemount",
		"wpn_fps_upg_ns_ass_smg_large"
	}
	self.weapon_skins.new_raging_bull_bloodsplat = {}
	self.weapon_skins.new_raging_bull_bloodsplat.name_id = "bm_wskn_new_raging_bull_bloodsplat"
	self.weapon_skins.new_raging_bull_bloodsplat.desc_id = "bm_wskn_new_raging_bull_bloodsplat_desc"
	self.weapon_skins.new_raging_bull_bloodsplat.weapon_id = "new_raging_bull"
	self.weapon_skins.new_raging_bull_bloodsplat.reserve_quality = true
	self.weapon_skins.new_raging_bull_bloodsplat.rarity = "epic"
	self.weapon_skins.new_raging_bull_bloodsplat.bonus = "concealment_p3_tem_p1"
	self.weapon_skins.new_raging_bull_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.new_raging_bull_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_005_df")
	self.weapon_skins.new_raging_bull_bloodsplat.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_008_df")
	self.weapon_skins.new_raging_bull_bloodsplat.pattern_tweak = Vector3(1.44527, 0, 1)
	self.weapon_skins.new_raging_bull_bloodsplat.parts = {
		wpn_fps_pis_rage_body_smooth = {
			[Idstring("smooth"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_stripes_df"),
				pattern_pos = Vector3(-0.561642, -0.342388, 0),
				uv_scale = Vector3(1.1685, 1.1685, 1),
				uv_offset_rot = Vector3(-0.219292, 0.756838, 5.21925),
				pattern_tweak = Vector3(1.30217, 2.11737, 1)
			},
			[Idstring("base"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.146434, 0, 0),
				pattern_tweak = Vector3(0.300503, 0, 1)
			}
		},
		wpn_fps_pis_rage_body_standard = {
			[Idstring("cylinder"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_stripes_df"),
				pattern_pos = Vector3(-0.561642, -0.342388, 0),
				uv_scale = Vector3(1.1685, 1.1685, 1),
				uv_offset_rot = Vector3(-0.219292, 0.756838, 5.21925),
				pattern_tweak = Vector3(1.30217, 2.11737, 1)
			},
			[Idstring("base"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.146434, 0, 0),
				pattern_tweak = Vector3(0.300503, 0, 1)
			}
		},
		wpn_fps_pis_rage_b_standard = {
			[Idstring("barrel_standard"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.241831, -0.0605769, 0),
				pattern_tweak = Vector3(0.443599, 3.34614, 0)
			}
		},
		wpn_fps_pis_rage_b_long = {
			[Idstring("barrel_long"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.241831, -0.0605769, 0),
				pattern_tweak = Vector3(0.443599, 3.34614, 0)
			}
		},
		wpn_fps_pis_rage_b_comp1 = {
			[Idstring("comp1"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.241831, -0.0605769, 0),
				pattern_tweak = Vector3(0.443599, 3.34614, 0)
			}
		},
		wpn_fps_pis_rage_b_comp2 = {
			[Idstring("comp2"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.241831, -0.0605769, 0),
				pattern_tweak = Vector3(0.443599, 3.34614, 0)
			}
		},
		wpn_fps_pis_rage_b_short = {
			[Idstring("barrel_short"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_fade_001_df"),
				pattern_pos = Vector3(-0.241831, -0.0605769, 0),
				pattern_tweak = Vector3(0.443599, 3.34614, 0)
			}
		},
		wpn_fps_pis_rage_g_standard = {
			[Idstring("grip"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_001_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_pos = Vector3(0.0252805, -0.0796564, 0),
				pattern_tweak = Vector3(0.72979, 1.53296, 1)
			}
		},
		wpn_fps_pis_rage_g_ergo = {
			[Idstring("ergo"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_001_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_pos = Vector3(0.0252805, -0.0796564, 0),
				pattern_tweak = Vector3(0.72979, 1.53296, 1)
			}
		}
	}
	self.weapon_skins.new_raging_bull_bloodsplat.default_blueprint = {
		"wpn_fps_pis_rage_g_ergo",
		"wpn_fps_pis_rage_b_long",
		"wpn_fps_pis_rage_body_smooth"
	}
	self.weapon_skins.famas_bloodsplat = {}
	self.weapon_skins.famas_bloodsplat.name_id = "bm_wskn_famas_bloodsplat"
	self.weapon_skins.famas_bloodsplat.desc_id = "bm_wskn_famas_bloodsplat_desc"
	self.weapon_skins.famas_bloodsplat.weapon_id = "famas"
	self.weapon_skins.famas_bloodsplat.reserve_quality = true
	self.weapon_skins.famas_bloodsplat.rarity = "epic"
	self.weapon_skins.famas_bloodsplat.bonus = "concealment_p3_tem_p1"
	self.weapon_skins.famas_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.famas_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/sputnik/base_gradient/base_sput_004_df")
	self.weapon_skins.famas_bloodsplat.pattern_tweak = Vector3(2.25614, 1.45804, 2)
	self.weapon_skins.famas_bloodsplat.uv_scale = Vector3(1, 1, 0)
	self.weapon_skins.famas_bloodsplat.uv_offset_rot = Vector3(0.607203, 0.979251, 3.03145)
	self.weapon_skins.famas_bloodsplat.parts = {
		wpn_fps_ass_famas_m_standard = {
			[Idstring("mtr_mag"):key()] = {
				uv_scale = Vector3(0.358028, 0.739425, 1),
				uv_offset_rot = Vector3(0.645361, 0.988791, 0)
			}
		},
		wpn_fps_ass_famas_g_standard = {
			[Idstring("mtr_grip_2"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_verdunne_df"),
				uv_scale = Vector3(0.405702, 0.548726, 0),
				uv_offset_rot = Vector3(0.244694, 1.57071, 0)
			}
		},
		wpn_fps_ass_famas_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_verdunne_df"),
				uv_offset_rot = Vector3(0.066979, 1.08419, 0),
				pattern_pos = Vector3(0, 0.0252805, 0),
				uv_scale = Vector3(1.50355, 3.50456, 0)
			},
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_verdunne_df"),
				uv_offset_rot = Vector3(0.0267406, 0.666521, 6.28319),
				uv_scale = Vector3(0.7871, 2.12199, 0)
			}
		}
	}
	self.weapon_skins.famas_bloodsplat.default_blueprint = {
		"wpn_fps_ass_famas_body_standard",
		"wpn_fps_ass_famas_g_standard",
		"wpn_fps_ass_famas_m_standard",
		"wpn_fps_ass_famas_b_short"
	}
	self.weapon_skins.r93_wooh = {}
	self.weapon_skins.r93_wooh.name_id = "bm_wskn_r93_wooh"
	self.weapon_skins.r93_wooh.desc_id = "bm_wskn_r93_wooh_desc"
	self.weapon_skins.r93_wooh.weapon_id = "r93"
	self.weapon_skins.r93_wooh.reserve_quality = true
	self.weapon_skins.r93_wooh.rarity = "epic"
	self.weapon_skins.r93_wooh.bonus = "recoil_p1_tem_p1"
	self.weapon_skins.r93_wooh.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.r93_wooh.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_ferrar_df")
	self.weapon_skins.r93_wooh.default_blueprint = {
		"wpn_fps_snp_r93_b_standard",
		"wpn_fps_snp_r93_m_std",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_snp_r93_body_standard"
	}
	self.weapon_skins.r93_wooh.parts = {
		wpn_fps_snp_r93_body_standard = {
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_falcogini_df"),
				uv_offset_rot = Vector3(-0.157974, 1.00033, 4.71377),
				uv_scale = Vector3(5.60224, 5.55457, 1),
				pattern_tweak = Vector3(20, 0, 1)
			},
			[Idstring("mtr_body"):key()] = {
				uv_scale = Vector3(12.5151, 12.6104, 1),
				uv_offset_rot = Vector3(0.0634394, 0.931553, 0)
			}
		},
		wpn_fps_upg_o_leupold = {
			[Idstring("leupold"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_falcogini_text_df"),
				uv_offset_rot = Vector3(0.332551, 0.971172, 0),
				uv_scale = Vector3(4.3627, 6.03132, 1),
				cubemap_pattern_control = Vector3(0.198665, 0, 0),
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_005_df")
			}
		},
		wpn_fps_snp_r93_b_standard = {
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_falcogini_text_df"),
				uv_scale = Vector3(1.31152, 0.405702, 1),
				uv_offset_rot = Vector3(-0.0987357, 1.11281, 0)
			}
		}
	}
	self.weapon_skins.ak74_bloodsplat = {}
	self.weapon_skins.ak74_bloodsplat.name_id = "bm_wskn_ak74_bloodsplat"
	self.weapon_skins.ak74_bloodsplat.desc_id = "bm_wskn_ak74_bloodsplat_desc"
	self.weapon_skins.ak74_bloodsplat.weapon_id = "ak74"
	self.weapon_skins.ak74_bloodsplat.reserve_quality = true
	self.weapon_skins.ak74_bloodsplat.rarity = "epic"
	self.weapon_skins.ak74_bloodsplat.bonus = "spread_p1_tem_p1"
	self.weapon_skins.ak74_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.ak74_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_005_df")
	self.weapon_skins.ak74_bloodsplat.parts = {
		wpn_fps_ass_74_body_upperreceiver = {
			[Idstring("ak74_dustcover"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_houston_df"),
				uv_scale = Vector3(3.69526, 3.83828, 1),
				uv_offset_rot = Vector3(0.235154, 0.864775, 0)
			}
		},
		wpn_fps_upg_ak_g_pgrip = {
			[Idstring("mtr_akgrip"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_orange_prison_suit_df"),
				pattern_pos = Vector3(0.072979, 0.177916, 0),
				pattern_tweak = Vector3(1.63606, 1.48801, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
			}
		},
		wpn_fps_upg_ak_m_quad = {
			[Idstring("mtr_quadstack"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_orange_prison_suit_df"),
				pattern_pos = Vector3(0.158836, -0.0510372, 0),
				pattern_tweak = Vector3(2.82853, 1.30819, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
			}
		},
		wpn_fps_ass_ak_body_lowerreceiver = {
			[Idstring("ak_base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cf15/sticker/sticker_houston_df"),
				uv_scale = Vector3(5.84062, 5.64992, 1),
				uv_offset_rot = Vector3(0.0302805, 0.968632, 0)
			}
		},
		wpn_fps_upg_ak_s_solidstock = {
			[Idstring("mtr_solid"):key()] = {
				uv_offset_rot = Vector3(-0.089196, 0.836156, 0),
				pattern_tweak = Vector3(1.63606, 0.0194812, 1),
				pattern_pos = Vector3(-0.480324, 0, 0),
				uv_scale = Vector3(2.93246, 4.02898, 1),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_orange_prison_suit_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
			}
		}
	}
	self.weapon_skins.ak74_bloodsplat.default_blueprint = {
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_upg_ak_b_ak105",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ak_fg_trax",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_o_ak_scopemount"
	}
	self.weapon_skins.ppk_bloodsplat = {}
	self.weapon_skins.ppk_bloodsplat.name_id = "bm_wskn_ppk_bloodsplat"
	self.weapon_skins.ppk_bloodsplat.desc_id = "bm_wskn_ppk_bloodsplat_desc"
	self.weapon_skins.ppk_bloodsplat.weapon_id = "ppk"
	self.weapon_skins.ppk_bloodsplat.reserve_quality = true
	self.weapon_skins.ppk_bloodsplat.rarity = "epic"
	self.weapon_skins.ppk_bloodsplat.bonus = "concealment_p3_tem_p1"
	self.weapon_skins.ppk_bloodsplat.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.ppk_bloodsplat.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df")
	self.weapon_skins.ppk_bloodsplat.parts = {
		wpn_fps_pis_ppk_b_long = {
			[Idstring("mtr_slide_long"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_009_df"),
				pattern_tweak = Vector3(8.88624, 0, 1)
			}
		},
		wpn_fps_pis_ppk_b_standard = {
			[Idstring("mtr_barrel"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_009_df"),
				pattern_tweak = Vector3(8.88624, 0, 1)
			}
		}
	}
	self.weapon_skins.ppk_bloodsplat.default_blueprint = {
		"wpn_fps_pis_ppk_body_standard",
		"wpn_fps_pis_ppk_m_standard",
		"wpn_fps_pis_ppk_b_long",
		"wpn_fps_pis_ppk_g_laser",
		"wpn_fps_upg_ns_pis_jungle"
	}
	self.weapon_skins.b92fs_wooh = {}
	self.weapon_skins.b92fs_wooh.name_id = "bm_wskn_b92fs_wooh"
	self.weapon_skins.b92fs_wooh.desc_id = "bm_wskn_b92fs_wooh_desc"
	self.weapon_skins.b92fs_wooh.weapon_id = "b92fs"
	self.weapon_skins.b92fs_wooh.reserve_quality = true
	self.weapon_skins.b92fs_wooh.rarity = "epic"
	self.weapon_skins.b92fs_wooh.bonus = "spread_p1_tem_p1"
	self.weapon_skins.b92fs_wooh.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.b92fs_wooh.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_005_df")
	self.weapon_skins.b92fs_wooh.pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
	self.weapon_skins.b92fs_wooh.pattern = Idstring("units/payday2_cash/safes/cf15/pattern/pattern_waves_df")
	self.weapon_skins.b92fs_wooh.pattern_tweak = Vector3(1.82686, 0, 1)
	self.weapon_skins.b92fs_wooh.default_blueprint = {
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_sl_brigadier",
		"wpn_fps_pis_beretta_m_extended",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_pis_beretta_g_engraved",
		"wpn_fps_pis_beretta_co_co1"
	}
	self.weapon_skins.b92fs_wooh.parts = {
		wpn_fps_pis_beretta_body_beretta = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_whiskey_label_df"),
				uv_scale = Vector3(4.60008, 8.08133, 1),
				uv_offset_rot = Vector3(0.276853, 1.09873, 0)
			}
		},
		wpn_fps_pis_beretta_sl_brigadier = {
			[Idstring("brig"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_whiskey_label_df"),
				uv_scale = Vector3(3.02281, 5.50689, 1),
				uv_offset_rot = Vector3(0.236614, 0.910473, 0)
			}
		}
	}
	self.weapon_skins.flamethrower_mk2_fire = {}
	self.weapon_skins.flamethrower_mk2_fire.name_id = "bm_wskn_flamethrower_mk2_fire"
	self.weapon_skins.flamethrower_mk2_fire.desc_id = "bm_wskn_flamethrower_mk2_fire_desc"
	self.weapon_skins.flamethrower_mk2_fire.weapon_id = "flamethrower_mk2"
	self.weapon_skins.flamethrower_mk2_fire.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_fire.rarity = "legendary"
	self.weapon_skins.flamethrower_mk2_fire.bonus = "damage_p1_tem_p1"
	self.weapon_skins.flamethrower_mk2_fire.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.flamethrower_mk2_fire.unique_name_id = "bm_wskn_flamethrower_mk2_fire"
	self.weapon_skins.flamethrower_mk2_fire.locked = true
	self.weapon_skins.flamethrower_mk2_fire.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.flamethrower_mk2_fire.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df")
	self.weapon_skins.flamethrower_mk2_fire.pattern_tweak = Vector3(5.07036, 1.62287, 1)
	self.weapon_skins.flamethrower_mk2_fire.uv_scale = Vector3(1, 0.999, 1)
	self.weapon_skins.flamethrower_mk2_fire.default_blueprint = {
		"wpn_fps_fla_mk2_empty",
		"wpn_fps_fla_mk2_body_fierybeast",
		"wpn_fps_fla_mk2_mag"
	}
	self.weapon_skins.flamethrower_mk2_fire.parts = {
		wpn_fps_fla_mk2_body_fierybeast = {
			[Idstring("body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/dragons_df"),
				uv_offset_rot = Vector3(0.101598, 0.998331, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_overkill_logo_df"),
				uv_scale = Vector3(2.78944, 2.78944, 0.401383),
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_003_df"),
				pattern_tweak = Vector3(10.2218, 4.66481, 1)
			},
			[Idstring("mtr_head"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_fla_mk2_mag = {
			[Idstring("flame_fuel_can"):key()] = {
				cubemap_pattern_control = Vector3(0.1772, 0.444312, 0),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dragon_scales_df")
			}
		}
	}
	self.weapon_skins.rpg7_boom = {}
	self.weapon_skins.rpg7_boom.name_id = "bm_wskn_rpg7_boom"
	self.weapon_skins.rpg7_boom.desc_id = "bm_wskn_rpg7_boom_desc"
	self.weapon_skins.rpg7_boom.weapon_id = "rpg7"
	self.weapon_skins.rpg7_boom.reserve_quality = true
	self.weapon_skins.rpg7_boom.rarity = "legendary"
	self.weapon_skins.rpg7_boom.bonus = "spread_p1_tem_p1"
	self.weapon_skins.rpg7_boom.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.rpg7_boom.unique_name_id = "bm_wskn_rpg7_boom"
	self.weapon_skins.rpg7_boom.locked = true
	self.weapon_skins.rpg7_boom.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_007_df")
	self.weapon_skins.rpg7_boom.pattern_tweak = Vector3(0.999, 0, 1)
	self.weapon_skins.rpg7_boom.default_blueprint = {
		"wpn_fps_rpg7_body",
		"wpn_fps_rpg7_m_grinclown",
		"wpn_fps_rpg7_barrel",
		"wpn_fps_upg_o_rx30"
	}
	self.weapon_skins.rpg7_boom.parts = {
		wpn_fps_rpg7_m_rocket = {
			[Idstring("mtr_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df"),
				cubemap_pattern_control = Vector3(0.0245649, 0.141426, 0)
			}
		},
		wpn_fps_upg_o_rx30 = {
			[Idstring("rx30"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_rpg7_m_grinclown = {
			[Idstring("mtr_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_006_df")
			},
			[Idstring("mtr_custom_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_005_df")
			}
		},
		wpn_fps_rpg7_sight = {
			[Idstring("mtr_sights"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
			}
		},
		wpn_fps_rpg7_body = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/golden_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_dollar_bling_df"),
				cubemap_pattern_control = Vector3(0.484856, 0.0555689, 0),
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df"),
				uv_offset_rot = Vector3(0.312392, 0.964172, 0),
				uv_scale = Vector3(2.21734, 4.02898, 0),
				pattern_tweak = Vector3(11.1281, 0.169331, 0.780587),
				pattern_gradient = Idstring("units/payday2_cash/safes/cop/pattern_gradient/gradient_cop_prisonsuit_df")
			}
		}
	}
	self.weapon_skins.m134_bulletstorm = {}
	self.weapon_skins.m134_bulletstorm.name_id = "bm_wskn_m134_bulletstorm"
	self.weapon_skins.m134_bulletstorm.desc_id = "bm_wskn_m134_bulletstorm_desc"
	self.weapon_skins.m134_bulletstorm.weapon_id = "m134"
	self.weapon_skins.m134_bulletstorm.reserve_quality = true
	self.weapon_skins.m134_bulletstorm.rarity = "legendary"
	self.weapon_skins.m134_bulletstorm.bonus = "spread_p1_tem_p1"
	self.weapon_skins.m134_bulletstorm.texture_bundle_folder = "cash/safes/cop"
	self.weapon_skins.m134_bulletstorm.unique_name_id = "bm_wskn_m134_bulletstorm"
	self.weapon_skins.m134_bulletstorm.locked = true
	self.weapon_skins.m134_bulletstorm.base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df")
	self.weapon_skins.m134_bulletstorm.default_blueprint = {
		"wpn_fps_lmg_m134_body",
		"wpn_fps_lmg_m134_m_standard",
		"wpn_fps_lmg_m134_barrel_legendary",
		"wpn_fps_lmg_m134_body_upper_spikey",
		"wpn_fps_upg_fl_ass_utg"
	}
	self.weapon_skins.m134_bulletstorm.parts = {
		wpn_fps_lmg_m134_body_upper_spikey = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_handle"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_overkill_df"),
				uv_offset_rot = Vector3(0.403869, 1.06965, 4.72475),
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_008_df"),
				uv_scale = Vector3(11.7046, 11.5616, 1),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(4.35488, 1.7877, 1)
			}
		},
		wpn_fps_lmg_m134_barrel_legendary = {
			[Idstring("mtr_spikey"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/cop/base_gradient/base_cop_spikey_df")
			},
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/cop/sticker/sticker_bdsm_df"),
				uv_offset_rot = Vector3(-0.30007, 1.43362, 3.12136),
				pattern_pos = Vector3(0, 0.00620103, 0),
				uv_scale = Vector3(6.98481, 6.98481, 1),
				pattern_tweak = Vector3(16.4703, 0, 1)
			}
		},
		wpn_fps_lmg_m134_body = {
			[Idstring("mtr_body"):key()] = {
				uv_offset_rot = Vector3(0.196995, 1.22728, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df"),
				pattern = Idstring("units/payday2_cash/safes/cop/pattern/pattern_flames_df"),
				pattern_tweak = Vector3(7.55068, 1.71278, 1)
			}
		}
	}
	self.weapon_skins.p90_golddigger = {}
	self.weapon_skins.p90_golddigger.name_id = "bm_wskn_p90_golddigger"
	self.weapon_skins.p90_golddigger.desc_id = "bm_wskn_p90_golddigger_desc"
	self.weapon_skins.p90_golddigger.weapon_id = "p90"
	self.weapon_skins.p90_golddigger.rarity = "common"
	self.weapon_skins.p90_golddigger.bonus = "recoil_p1"
	self.weapon_skins.p90_golddigger.reserve_quality = true
	self.weapon_skins.p90_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.p90_golddigger.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
	self.weapon_skins.huntsman_golddigger = {}
	self.weapon_skins.huntsman_golddigger.name_id = "bm_wskn_huntsman_golddigger"
	self.weapon_skins.huntsman_golddigger.desc_id = "bm_wskn_huntsman_golddigger_desc"
	self.weapon_skins.huntsman_golddigger.weapon_id = "huntsman"
	self.weapon_skins.huntsman_golddigger.rarity = "common"
	self.weapon_skins.huntsman_golddigger.bonus = "recoil_p1"
	self.weapon_skins.huntsman_golddigger.reserve_quality = true
	self.weapon_skins.huntsman_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.huntsman_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_007_df")
	self.weapon_skins.huntsman_golddigger.pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_ornaments_df")
	self.weapon_skins.huntsman_golddigger.parts = {
		wpn_fps_shot_huntsman_b_short = {
			[Idstring("short_barrel"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_ornaments_df"),
				pattern_pos = Vector3(-1.63471, -1.52969, 0),
				pattern_tweak = Vector3(2.54233, 1.53296, 1)
			}
		},
		wpn_fps_shot_huntsman_b_long = {
			[Idstring("long_barrel"):key()] = {
				pattern_pos = Vector3(-1.63701, -1.52576, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_ornaments_df"),
				pattern_tweak = Vector3(3.97529, 1.55488, 1)
			}
		},
		wpn_fps_shot_huntsman_body_standard = {
			[Idstring("mech"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_ornaments_df"),
				pattern_pos = Vector3(-0.365848, 0.187455, 0),
				pattern_tweak = Vector3(0.825187, 1.63785, 1)
			}
		}
	}
	self.weapon_skins.r93_golddigger = {}
	self.weapon_skins.r93_golddigger.name_id = "bm_wskn_r93_golddigger"
	self.weapon_skins.r93_golddigger.desc_id = "bm_wskn_r93_golddigger_desc"
	self.weapon_skins.r93_golddigger.weapon_id = "r93"
	self.weapon_skins.r93_golddigger.rarity = "common"
	self.weapon_skins.r93_golddigger.bonus = "spread_p1"
	self.weapon_skins.r93_golddigger.reserve_quality = true
	self.weapon_skins.r93_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.r93_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_005_df")
	self.weapon_skins.r93_golddigger.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df")
	self.weapon_skins.r93_golddigger.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_stains_df")
	self.weapon_skins.r93_golddigger.pattern_tweak = Vector3(11.2712, 0.813683, 1)
	self.weapon_skins.r93_golddigger.pattern_pos = Vector3(1.26982, 0.0538995, 0)
	self.weapon_skins.ak74_golddigger = {}
	self.weapon_skins.ak74_golddigger.name_id = "bm_wskn_ak74_golddigger"
	self.weapon_skins.ak74_golddigger.desc_id = "bm_wskn_ak74_golddigger_desc"
	self.weapon_skins.ak74_golddigger.weapon_id = "ak74"
	self.weapon_skins.ak74_golddigger.rarity = "rare"
	self.weapon_skins.ak74_golddigger.bonus = "spread_p1"
	self.weapon_skins.ak74_golddigger.reserve_quality = true
	self.weapon_skins.ak74_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.ak74_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.ak74_golddigger.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_gold_df")
	self.weapon_skins.ak74_golddigger.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_lines_df")
	self.weapon_skins.ak74_golddigger.pattern_tweak = Vector3(1.30217, 0.547939, 1)
	self.weapon_skins.ak74_golddigger.pattern_pos = Vector3(0, -0.528023, 0)
	self.weapon_skins.ak74_golddigger.default_blueprint = {
		"wpn_fps_ass_74_body_upperreceiver",
		"wpn_fps_ass_ak_body_lowerreceiver",
		"wpn_fps_upg_ak_b_ak105",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_ak_fg_trax",
		"wpn_fps_upg_ak_g_pgrip",
		"wpn_fps_upg_ak_m_quad",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_o_ak_scopemount"
	}
	self.weapon_skins.ak74_golddigger.parts = {
		wpn_fps_ass_74_body_upperreceiver = {
			[Idstring("ak74_dustcover"):key()] = {
				pattern_pos = Vector3(-0.94023, -0.0510372, 0),
				pattern_tweak = Vector3(1.34987, 0.573924, 1)
			}
		},
		wpn_fps_upg_ak_g_pgrip = {
			[Idstring("mtr_akgrip"):key()] = {
				pattern_pos = Vector3(0, -0.559102, 0)
			}
		},
		wpn_fps_upg_ak_m_quad = {
			[Idstring("mtr_quadstack"):key()] = {
				pattern_pos = Vector3(-0.957309, -0.510262, 0),
				pattern_tweak = Vector3(0.876186, 0.410075, 1)
			}
		},
		wpn_fps_upg_ak_s_solidstock = {
			[Idstring("mtr_solid"):key()] = {
				pattern_pos = Vector3(0.022, -1.50915, 0)
			}
		},
		wpn_fps_upg_o_ak_scopemount = {
			[Idstring("mtr_kv04"):key()] = {
				pattern_pos = Vector3(0, -0.677578, 0)
			}
		}
	}
	self.weapon_skins.m134_golddigger = {}
	self.weapon_skins.m134_golddigger.name_id = "bm_wskn_m134_golddigger"
	self.weapon_skins.m134_golddigger.desc_id = "bm_wskn_m134_golddigger_desc"
	self.weapon_skins.m134_golddigger.weapon_id = "m134"
	self.weapon_skins.m134_golddigger.rarity = "uncommon"
	self.weapon_skins.m134_golddigger.bonus = "recoil_p1"
	self.weapon_skins.m134_golddigger.reserve_quality = true
	self.weapon_skins.m134_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.m134_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_005_df")
	self.weapon_skins.serbu_golddigger = {}
	self.weapon_skins.serbu_golddigger.name_id = "bm_wskn_serbu_golddigger"
	self.weapon_skins.serbu_golddigger.desc_id = "bm_wskn_serbu_golddigger_desc"
	self.weapon_skins.serbu_golddigger.weapon_id = "serbu"
	self.weapon_skins.serbu_golddigger.rarity = "rare"
	self.weapon_skins.serbu_golddigger.bonus = "spread_n1"
	self.weapon_skins.serbu_golddigger.reserve_quality = true
	self.weapon_skins.serbu_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.serbu_golddigger.base_gradient = Idstring("units/payday2_cash/safes/red/base_gradient/base_red_fleur_df")
	self.weapon_skins.serbu_golddigger.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_002_df")
	self.weapon_skins.serbu_golddigger.parts = {
		wpn_fps_shot_shorty_s_solid_short = {
			[Idstring("solid"):key()] = {
				pattern_pos = Vector3(0.216075, -0.327689, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_fleur_de_lis_df"),
				pattern_tweak = Vector3(3.30551, 0.139361, 1)
			},
			[Idstring("big_rail"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_fleur_de_lis_df"),
				pattern_pos = Vector3(-0.130736, 0.121138, 0),
				uv_offset_rot = Vector3(-0.136895, 0, 0),
				pattern_tweak = Vector3(4.02099, 0, 1)
			}
		},
		wpn_fps_shot_r870_b_short = {
			[Idstring("short_barrel"):key()] = {
				pattern_pos = Vector3(0.301932, 0.177916, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_fleur_de_lis_df"),
				pattern_tweak = Vector3(2.16075, 0, 1)
			}
		},
		wpn_fps_shot_r870_body_standard = {
			[Idstring("receiver"):key()] = {
				pattern_pos = Vector3(-0.029418, 0.721679, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_fleur_de_lis_df"),
				pattern_tweak = Vector3(2.88422, 0, 1)
			}
		}
	}
	self.weapon_skins.serbu_golddigger.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_shot_r870_body_rack",
		"wpn_fps_shot_shorty_s_solid_short"
	}
	self.weapon_skins.famas_golddigger = {}
	self.weapon_skins.famas_golddigger.name_id = "bm_wskn_famas_golddigger"
	self.weapon_skins.famas_golddigger.desc_id = "bm_wskn_famas_golddigger_desc"
	self.weapon_skins.famas_golddigger.weapon_id = "famas"
	self.weapon_skins.famas_golddigger.rarity = "epic"
	self.weapon_skins.famas_golddigger.bonus = "spread_p1"
	self.weapon_skins.famas_golddigger.reserve_quality = true
	self.weapon_skins.famas_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.famas_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_002_df")
	self.weapon_skins.famas_golddigger.parts = {
		wpn_fps_ass_famas_m_standard = {
			[Idstring("mtr_mag"):key()] = {
				uv_offset_rot = Vector3(0.002, 0, 0)
			}
		},
		wpn_fps_ass_famas_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/red/sticker/sticker_yggdrasil_df"),
				uv_scale = Vector3(2.09764, 2.93246, 0.537324),
				uv_offset_rot = Vector3(0.183916, 1.03449, 5.00451)
			},
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/red/sticker/sticker_yggdrasil_df"),
				uv_scale = Vector3(1.31152, 1.64524, 0.639876),
				uv_offset_rot = Vector3(0.0193599, 0.615282, 4.93454)
			}
		},
		wpn_fps_ass_famas_g_retro = {
			[Idstring("mtr_grip"):key()] = {
				uv_scale = Vector3(0.358028, 0.501052, 1),
				uv_offset_rot = Vector3(0.35917, 0.111138, 0)
			}
		}
	}
	self.weapon_skins.famas_golddigger.default_blueprint = {
		"wpn_fps_ass_famas_body_standard",
		"wpn_fps_ass_famas_m_standard",
		"wpn_fps_ass_famas_b_sniper",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_ass_famas_g_retro",
		"wpn_fps_upg_o_reflex"
	}
	self.weapon_skins.new_m14_golddigger = {}
	self.weapon_skins.new_m14_golddigger.name_id = "bm_wskn_new_m14_golddigger"
	self.weapon_skins.new_m14_golddigger.desc_id = "bm_wskn_new_m14_golddigger_desc"
	self.weapon_skins.new_m14_golddigger.weapon_id = "new_m14"
	self.weapon_skins.new_m14_golddigger.rarity = "uncommon"
	self.weapon_skins.new_m14_golddigger.bonus = "recoil_p1"
	self.weapon_skins.new_m14_golddigger.reserve_quality = true
	self.weapon_skins.new_m14_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.new_m14_golddigger.base_gradient = Idstring("units/payday2_cash/safes/cf15/base_gradient/base_cf15_004_df")
	self.weapon_skins.ppk_golddigger = {}
	self.weapon_skins.ppk_golddigger.name_id = "bm_wskn_ppk_golddigger"
	self.weapon_skins.ppk_golddigger.desc_id = "bm_wskn_ppk_golddigger_desc"
	self.weapon_skins.ppk_golddigger.weapon_id = "ppk"
	self.weapon_skins.ppk_golddigger.rarity = "common"
	self.weapon_skins.ppk_golddigger.bonus = "recoil_p1"
	self.weapon_skins.ppk_golddigger.reserve_quality = true
	self.weapon_skins.ppk_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.ppk_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_005_df")
	self.weapon_skins.ppk_golddigger.pattern_tweak = Vector3(5.48065, 5.50196, 1)
	self.weapon_skins.ppk_golddigger.pattern_pos = Vector3(-0.007, -0.05, 0)
	self.weapon_skins.ppk_golddigger.parts = {
		wpn_fps_pis_ppk_body_standard = {
			[Idstring("mtr_frame"):key()] = {
				pattern_pos = Vector3(2, -0.0881166, 0),
				pattern_tweak = Vector3(6.7875, 5.48198, 1)
			}
		},
		wpn_fps_pis_ppk_g_standard = {
			[Idstring("mtr_grip"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_marble_floor_df"),
				pattern_pos = Vector3(0.126217, -0.0481165, 0),
				pattern_tweak = Vector3(4.83186, 2.37212, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df")
			}
		},
		wpn_fps_pis_ppk_b_standard = {
			[Idstring("mtr_slide"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_marble_floor_df"),
				pattern_pos = Vector3(0.025, 0.0167406, 0),
				pattern_tweak = Vector3(4.91926, 0.786698, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df")
			}
		},
		wpn_fps_pis_ppk_g_laser = {
			[Idstring("mtr_grip_laser"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_marble_floor_df"),
				pattern_pos = Vector3(0.283677, -0.176, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern_tweak = Vector3(5.16575, 2.37212, 1)
			}
		},
		wpn_fps_pis_ppk_b_long = {
			[Idstring("mtr_slide_long"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/pattern_marble_floor_df"),
				pattern_pos = Vector3(0.0378201, -0.0251799, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/pattern_gradient_marble_floor_df"),
				pattern_tweak = Vector3(5.69044, 0.782743, 1)
			}
		}
	}
	self.weapon_skins.m95_golddigger = {}
	self.weapon_skins.m95_golddigger.name_id = "bm_wskn_m95_golddigger"
	self.weapon_skins.m95_golddigger.desc_id = "bm_wskn_m95_golddigger_desc"
	self.weapon_skins.m95_golddigger.weapon_id = "m95"
	self.weapon_skins.m95_golddigger.rarity = "uncommon"
	self.weapon_skins.m95_golddigger.bonus = "total_ammo_p1"
	self.weapon_skins.m95_golddigger.reserve_quality = true
	self.weapon_skins.m95_golddigger.texture_bundle_folder = "cash/safes/red"
	self.weapon_skins.m95_golddigger.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_004_df")
	self.weapon_skins.m95_golddigger.pattern_gradient = Idstring("units/payday2_cash/safes/red/pattern_gradient/gradient_france_df")
	self.weapon_skins.m95_golddigger.parts = {
		wpn_fps_snp_m95_barrel_standard = {
			[Idstring("mtr_medium"):key()] = {
				pattern_pos = Vector3(-0.213212, 0, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_tweak = Vector3(0.491297, 0, 1)
			},
			[Idstring("mtr_muzzlebreak"):key()] = {
				pattern_pos = Vector3(0.0825188, 2, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_tweak = Vector3(0.205106, 0, 1)
			}
		},
		wpn_fps_snp_m95_bipod = {
			[Idstring("mtr_bipod"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_pos = Vector3(0.616742, 0, 0),
				cubemap_pattern_control = Vector3(0.136656, 0.143811, 0),
				pattern_tweak = Vector3(0.109709, 0, 1)
			}
		},
		wpn_fps_upg_o_shortdot = {
			[Idstring("mtr_shortdot"):key()] = {
				pattern_pos = Vector3(0.110979, -0.108275, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_tweak = Vector3(0.860585, 0, 1)
			}
		},
		wpn_fps_snp_m95_lower_reciever = {
			[Idstring("mtr_lower"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/red/sticker/b2_france_df"),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_pos = Vector3(0.206535, 0, 0),
				uv_scale = Vector3(9.0825, 8.74877, 0.277367),
				uv_offset_rot = Vector3(0.101058, 1.01033, 6.28319),
				pattern_tweak = Vector3(0.831488, 0, 1)
			}
		},
		wpn_fps_snp_m95_magazine = {
			[Idstring("mtr_clip"):key()] = {
				pattern_pos = Vector3(0.788457, 0.645361, 0),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_tweak = Vector3(0.538996, 0, 1)
			}
		},
		wpn_fps_snp_m95_upper_reciever = {
			[Idstring("mtr_upper"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/red/sticker/b2_france_df"),
				pattern = Idstring("units/payday2_cash/safes/red/pattern/france_df"),
				pattern_pos = Vector3(0.337631, 0.954552, 0),
				uv_scale = Vector3(6.98481, 7.03248, 0),
				uv_offset_rot = Vector3(0.0543599, 0.973251, 0),
				pattern_tweak = Vector3(0.634393, 0, 1)
			}
		}
	}
	self.weapon_skins.judge_bloodbath = {}
	self.weapon_skins.judge_bloodbath.name_id = "bm_wskn_judge_bloodbath"
	self.weapon_skins.judge_bloodbath.desc_id = "bm_wskn_judge_bloodbath_desc"
	self.weapon_skins.judge_bloodbath.weapon_id = "judge"
	self.weapon_skins.judge_bloodbath.rarity = "common"
	self.weapon_skins.judge_bloodbath.bonus = "spread_p1"
	self.weapon_skins.judge_bloodbath.reserve_quality = true
	self.weapon_skins.judge_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.judge_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_001_df")
	self.weapon_skins.judge_bloodbath.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_003_df")
	self.weapon_skins.judge_bloodbath.pattern_tweak = Vector3(0.586694, 0, 1)
	self.weapon_skins.judge_bloodbath.pattern_pos = Vector3(0.254233, -0.364308, 0)
	self.weapon_skins.judge_bloodbath.parts = {
		wpn_fps_pis_judge_g_standard = {
			[Idstring("mtr_grip"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df")
			}
		},
		wpn_fps_pis_judge_body_standard = {
			[Idstring("mtr_cylinder"):key()] = {
				pattern_pos = Vector3(0.39463, -0.442546, 0),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df"),
				pattern_tweak = Vector3(0.513996, 0, 1)
			},
			[Idstring("mtr_frame"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_hypnotic_001_df")
			}
		}
	}
	self.weapon_skins.b92fs_bloodbath = {}
	self.weapon_skins.b92fs_bloodbath.name_id = "bm_wskn_b92fs_bloodbath"
	self.weapon_skins.b92fs_bloodbath.desc_id = "bm_wskn_b92fs_bloodbath_desc"
	self.weapon_skins.b92fs_bloodbath.weapon_id = "b92fs"
	self.weapon_skins.b92fs_bloodbath.rarity = "uncommon"
	self.weapon_skins.b92fs_bloodbath.bonus = "spread_p1"
	self.weapon_skins.b92fs_bloodbath.reserve_quality = true
	self.weapon_skins.b92fs_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.b92fs_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_002_df")
	self.weapon_skins.b92fs_bloodbath.pattern_gradient = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df")
	self.weapon_skins.b92fs_bloodbath.parts = {
		wpn_fps_pis_beretta_sl_brigadier = {
			[Idstring("brig"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_003_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_scales_df"),
				pattern_pos = Vector3(0, 0.048, 0),
				pattern_tweak = Vector3(2.44694, 0, 1)
			}
		},
		wpn_fps_pis_beretta_sl_std = {
			[Idstring("std_slide"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_001_df"),
				pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_scales_df"),
				pattern_pos = Vector3(0, -0.432626, 0),
				pattern_tweak = Vector3(3.01932, 0, 1)
			}
		}
	}
	self.weapon_skins.new_raging_bull_bloodbath = {}
	self.weapon_skins.new_raging_bull_bloodbath.name_id = "bm_wskn_new_raging_bull_bloodbath"
	self.weapon_skins.new_raging_bull_bloodbath.desc_id = "bm_wskn_new_raging_bull_bloodbath_desc"
	self.weapon_skins.new_raging_bull_bloodbath.weapon_id = "new_raging_bull"
	self.weapon_skins.new_raging_bull_bloodbath.rarity = "common"
	self.weapon_skins.new_raging_bull_bloodbath.bonus = "recoil_p1"
	self.weapon_skins.new_raging_bull_bloodbath.reserve_quality = true
	self.weapon_skins.new_raging_bull_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.new_raging_bull_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_001_df")
	self.weapon_skins.new_raging_bull_bloodbath.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_017_df")
	self.weapon_skins.new_raging_bull_bloodbath.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_stains_df")
	self.weapon_skins.new_raging_bull_bloodbath.pattern_tweak = Vector3(0.830488, 0.037, 1)
	self.weapon_skins.new_raging_bull_bloodbath.pattern_pos = Vector3(0.521345, 0.37825, 0)
	self.weapon_skins.new_raging_bull_bloodbath.parts = {
		wpn_fps_upg_o_docter = {
			[Idstring("docter"):key()] = {
				pattern_tweak = Vector3(1.39757, 0, 1)
			}
		},
		wpn_fps_pis_rage_g_standard = {
			[Idstring("grip"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/red/base_gradient/base_red_fleur_df")
			}
		},
		wpn_fps_upg_o_eotech_xps = {
			[Idstring("eotech"):key()] = {
				pattern_tweak = Vector3(1.63606, 0, 1)
			}
		},
		wpn_fps_pis_rage_body_standard = {
			[Idstring("cylinder"):key()] = {
				pattern_pos = Vector3(0, -0.232292, 0),
				pattern_tweak = Vector3(3.21011, 0, 1)
			}
		},
		wpn_fps_pis_rage_b_comp1 = {
			[Idstring("comp1"):key()] = {
				pattern_pos = Vector3(0.759838, -0.019, 0)
			}
		},
		wpn_fps_upg_o_cs = {
			[Idstring("mtr_cs"):key()] = {
				pattern_tweak = Vector3(1.68376, 0, 1)
			}
		},
		wpn_fps_upg_o_eotech = {
			[Idstring("mtr_eotech"):key()] = {
				pattern_tweak = Vector3(1.63606, 0, 1)
			}
		},
		wpn_fps_upg_o_aimpoint_2 = {
			[Idstring("aimpoint"):key()] = {
				pattern_tweak = Vector3(3.5917, 0, 1)
			}
		},
		wpn_fps_upg_o_rx30 = {
			[Idstring("rx30"):key()] = {
				pattern_tweak = Vector3(1.34987, 0, 1)
			}
		},
		wpn_fps_pis_rage_o_adapter = {
			[Idstring("mtr_rail"):key()] = {
				pattern_tweak = Vector3(2.16075, 0, 1)
			}
		},
		wpn_fps_pis_rage_b_comp2 = {
			[Idstring("comp2"):key()] = {
				pattern_pos = Vector3(-0.690198, 0, 0)
			}
		},
		wpn_fps_pis_rage_g_ergo = {
			[Idstring("ergo"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/red/base_gradient/base_red_fleur_df")
			}
		},
		wpn_fps_upg_o_rx01 = {
			[Idstring("rx01"):key()] = {
				pattern_tweak = Vector3(1.63606, 0, 1)
			}
		},
		wpn_fps_upg_o_reflex = {
			[Idstring("reflex"):key()] = {
				pattern_tweak = Vector3(1.68376, 0, 1)
			}
		},
		wpn_fps_upg_o_t1micro = {
			[Idstring("mtr_t1micro"):key()] = {
				pattern_tweak = Vector3(1.73146, 0, 0.997)
			}
		},
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				pattern_tweak = Vector3(1.39757, 0, 1)
			}
		},
		wpn_fps_pis_rage_b_long = {
			[Idstring("barrel_long"):key()] = {
				pattern_tweak = Vector3(1.06368, 0, 1)
			}
		},
		wpn_fps_upg_o_specter = {
			[Idstring("mtr_specter"):key()] = {
				pattern_tweak = Vector3(1.96995, 0, 1)
			}
		},
		wpn_fps_upg_o_aimpoint = {
			[Idstring("aimpoint"):key()] = {
				pattern_tweak = Vector3(1.73146, 0, 1)
			}
		},
		wpn_fps_pis_rage_body_smooth = {
			[Idstring("smooth"):key()] = {
				pattern_tweak = Vector3(1.87455, 0, 1)
			}
		}
	}
	self.weapon_skins.mg42_bloodbath = {}
	self.weapon_skins.mg42_bloodbath.name_id = "bm_wskn_mg42_bloodbath"
	self.weapon_skins.mg42_bloodbath.desc_id = "bm_wskn_mg42_bloodbath_desc"
	self.weapon_skins.mg42_bloodbath.weapon_id = "mg42"
	self.weapon_skins.mg42_bloodbath.rarity = "rare"
	self.weapon_skins.mg42_bloodbath.bonus = "spread_p1"
	self.weapon_skins.mg42_bloodbath.reserve_quality = true
	self.weapon_skins.mg42_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.mg42_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_002_df")
	self.weapon_skins.mg42_bloodbath.default_blueprint = {
		"wpn_fps_lmg_mg42_reciever",
		"wpn_fps_lmg_mg42_b_mg34",
		"wpn_fps_upg_ass_ns_jprifles",
		"wpn_fps_upg_fl_ass_utg"
	}
	self.weapon_skins.mg42_bloodbath.parts = {
		wpn_fps_lmg_mg42_reciever = {
			[Idstring("wpn_fps_ass_fal_base_nm"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_butcher_df"),
				uv_offset_rot = Vector3(0.406869, 0.998331, 5.06941),
				pattern_gradient = Idstring("units/payday2_cash/safes/dinner/pattern_gradient/gradient_din_meat_df"),
				pattern_pos = Vector3(0.401488, 0.156757, 0),
				uv_scale = Vector3(8.79645, 8.5104, 0),
				pattern = Idstring("units/payday2_cash/safes/dinner/pattern/pattern_meat_hook_df"),
				pattern_tweak = Vector3(6.9783, 0.648849, 1)
			}
		}
	}
	self.weapon_skins.plainsrider_bloodbath = {}
	self.weapon_skins.plainsrider_bloodbath.name_id = "bm_wskn_plainsrider_bloodbath"
	self.weapon_skins.plainsrider_bloodbath.desc_id = "bm_wskn_plainsrider_bloodbath_desc"
	self.weapon_skins.plainsrider_bloodbath.weapon_id = "plainsrider"
	self.weapon_skins.plainsrider_bloodbath.rarity = "common"
	self.weapon_skins.plainsrider_bloodbath.bonus = "concealment_p1"
	self.weapon_skins.plainsrider_bloodbath.reserve_quality = true
	self.weapon_skins.plainsrider_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.plainsrider_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_001_df")
	self.weapon_skins.new_m4_bloodbath = {}
	self.weapon_skins.new_m4_bloodbath.name_id = "bm_wskn_new_m4_bloodbath"
	self.weapon_skins.new_m4_bloodbath.desc_id = "bm_wskn_new_m4_bloodbath_desc"
	self.weapon_skins.new_m4_bloodbath.weapon_id = "new_m4"
	self.weapon_skins.new_m4_bloodbath.rarity = "uncommon"
	self.weapon_skins.new_m4_bloodbath.bonus = "spread_p1"
	self.weapon_skins.new_m4_bloodbath.reserve_quality = true
	self.weapon_skins.new_m4_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.new_m4_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_001_df")
	self.weapon_skins.g36_bloodbath = {}
	self.weapon_skins.g36_bloodbath.name_id = "bm_wskn_g36_bloodbath"
	self.weapon_skins.g36_bloodbath.desc_id = "bm_wskn_g36_bloodbath_desc"
	self.weapon_skins.g36_bloodbath.weapon_id = "g36"
	self.weapon_skins.g36_bloodbath.rarity = "epic"
	self.weapon_skins.g36_bloodbath.bonus = "spread_p1"
	self.weapon_skins.g36_bloodbath.reserve_quality = true
	self.weapon_skins.g36_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.g36_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_003_df")
	self.weapon_skins.g36_bloodbath.pattern_gradient = Idstring("units/payday2_cash/safes/dinner/pattern_gradient/gradient_din_warning_df")
	self.weapon_skins.g36_bloodbath.pattern = Idstring("units/payday2_cash/safes/dinner/pattern/pattern_warning_tape_df")
	self.weapon_skins.g36_bloodbath.cubemap_pattern_control = Vector3(0.3, 0.3, 0)
	self.weapon_skins.g36_bloodbath.default_blueprint = {
		"wpn_fps_ass_g36_m_standard",
		"wpn_fps_ass_g36_b_long",
		"wpn_fps_ass_g36_fg_ksk",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_ass_g36_s_sl8",
		"wpn_fps_upg_ass_ns_surefire"
	}
	self.weapon_skins.g36_bloodbath.parts = {
		wpn_fps_ass_g36_s_sl8 = {
			[Idstring("sl8"):key()] = {
				pattern_pos = Vector3(0.0157406, 0.282853, 0)
			}
		},
		wpn_fps_ass_g36_body_sl8 = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_assaultinprogress"),
				uv_offset_rot = Vector3(-0.112275, 0.831616, 0),
				pattern_pos = Vector3(0.0920584, -0.0605769, 0),
				uv_scale = Vector3(2.12199, 6.22201, 0.475316),
				pattern_tweak = Vector3(1.68376, 0, 1)
			}
		},
		wpn_fps_ass_g36_body_standard = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_assaultinprogress"),
				uv_offset_rot = Vector3(-0.0916564, 0.836695, 0),
				pattern_pos = Vector3(0.079979, 0.027, 0),
				uv_scale = Vector3(1.88362, 6.50806, 0.174815),
				pattern_tweak = Vector3(1.82686, 0, 1)
			}
		}
	}
	self.weapon_skins.flamethrower_mk2_bloodbath = {}
	self.weapon_skins.flamethrower_mk2_bloodbath.name_id = "bm_wskn_flamethrower_mk2_bloodbath"
	self.weapon_skins.flamethrower_mk2_bloodbath.desc_id = "bm_wskn_flamethrower_mk2_bloodbath_desc"
	self.weapon_skins.flamethrower_mk2_bloodbath.weapon_id = "flamethrower_mk2"
	self.weapon_skins.flamethrower_mk2_bloodbath.rarity = "uncommon"
	self.weapon_skins.flamethrower_mk2_bloodbath.bonus = "damage_p1"
	self.weapon_skins.flamethrower_mk2_bloodbath.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.flamethrower_mk2_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_002_df")
	self.weapon_skins.flamethrower_mk2_bloodbath.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_stripe_df")
	self.weapon_skins.flamethrower_mk2_bloodbath.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_005_df")
	self.weapon_skins.flamethrower_mk2_bloodbath.parts = {
		wpn_fps_fla_mk2_body = {
			[Idstring("body"):key()] = {
				pattern_pos = Vector3(0, -0.0128784, 0),
				pattern_tweak = Vector3(3.8302, 2.11741, 1)
			}
		},
		wpn_fps_fla_mk2_mag = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern_pos = Vector3(0, -0.0128784, 0),
				pattern_tweak = Vector3(1.30217, 2.11741, 1)
			}
		},
		wpn_fps_fla_mk2_mag_rare = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern_pos = Vector3(0, -0.0128784, 0),
				pattern_tweak = Vector3(1.30217, 2.11741, 1)
			}
		},
		wpn_fps_fla_mk2_mag_welldone = {
			[Idstring("flame_fuel_can"):key()] = {
				pattern_pos = Vector3(0, -0.0128784, 0),
				pattern_tweak = Vector3(1.30217, 2.11741, 1)
			}
		}
	}
	self.weapon_skins.deagle_bloodbath = {}
	self.weapon_skins.deagle_bloodbath.name_id = "bm_wskn_deagle_bloodbath"
	self.weapon_skins.deagle_bloodbath.desc_id = "bm_wskn_deagle_bloodbath_desc"
	self.weapon_skins.deagle_bloodbath.weapon_id = "deagle"
	self.weapon_skins.deagle_bloodbath.rarity = "common"
	self.weapon_skins.deagle_bloodbath.bonus = "recoil_p1"
	self.weapon_skins.deagle_bloodbath.reserve_quality = true
	self.weapon_skins.deagle_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.deagle_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_004_df")
	self.weapon_skins.deagle_bloodbath.parts = {
		wpn_fps_pis_deagle_body_standard = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_assaultinprogress"),
				uv_scale = Vector3(3.12316, 13.7546, 0),
				uv_offset_rot = Vector3(0.137297, 0.896394, 0)
			}
		}
	}
	self.weapon_skins.rpg7_bloodbath = {}
	self.weapon_skins.rpg7_bloodbath.name_id = "bm_wskn_rpg7_bloodbath"
	self.weapon_skins.rpg7_bloodbath.desc_id = "bm_wskn_rpg7_bloodbath_desc"
	self.weapon_skins.rpg7_bloodbath.weapon_id = "rpg7"
	self.weapon_skins.rpg7_bloodbath.rarity = "rare"
	self.weapon_skins.rpg7_bloodbath.bonus = "spread_p1"
	self.weapon_skins.rpg7_bloodbath.reserve_quality = true
	self.weapon_skins.rpg7_bloodbath.texture_bundle_folder = "cash/safes/dinner"
	self.weapon_skins.rpg7_bloodbath.base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_002_df")
	self.weapon_skins.rpg7_bloodbath.parts = {
		wpn_fps_rpg7_m_rocket = {
			[Idstring("mtr_rocket"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_assault_005_df"),
				uv_offset_rot = Vector3(0.225614, 1.05557, 0.663833),
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_radioactive"),
				uv_scale = Vector3(8.36738, 8.36738, 1)
			}
		},
		wpn_fps_rpg7_body = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dinner/sticker/sticker_maycauseharm"),
				uv_scale = Vector3(1.45455, 10.4651, 1),
				uv_offset_rot = Vector3(0.145836, 1.02895, 3.13535)
			}
		}
	}
	self.weapon_skins.new_raging_bull_dallas = {}
	self.weapon_skins.new_raging_bull_dallas.name_id = "bm_wskn_new_raging_bull_dallas"
	self.weapon_skins.new_raging_bull_dallas.desc_id = "bm_wskn_new_raging_bull_dallas_desc"
	self.weapon_skins.new_raging_bull_dallas.weapon_id = "new_raging_bull"
	self.weapon_skins.new_raging_bull_dallas.rarity = "common"
	self.weapon_skins.new_raging_bull_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.new_raging_bull_dallas.reserve_quality = true
	self.weapon_skins.new_raging_bull_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.new_raging_bull_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df")
	self.weapon_skins.new_raging_bull_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
	self.weapon_skins.new_raging_bull_dallas.pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df")
	self.weapon_skins.new_raging_bull_dallas.pattern_tweak = Vector3(1.25447, 0, 1)
	self.weapon_skins.new_raging_bull_dallas.pattern_pos = Vector3(-0.00333858, -1.27212, 0)
	self.weapon_skins.mg42_dallas = {}
	self.weapon_skins.mg42_dallas.name_id = "bm_wskn_mg42_dallas"
	self.weapon_skins.mg42_dallas.desc_id = "bm_wskn_mg42_dallas_desc"
	self.weapon_skins.mg42_dallas.weapon_id = "mg42"
	self.weapon_skins.mg42_dallas.reserve_quality = true
	self.weapon_skins.mg42_dallas.rarity = "common"
	self.weapon_skins.mg42_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.mg42_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.mg42_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.famas_dallas = {}
	self.weapon_skins.famas_dallas.name_id = "bm_wskn_famas_dallas"
	self.weapon_skins.famas_dallas.desc_id = "bm_wskn_famas_dallas_desc"
	self.weapon_skins.famas_dallas.weapon_id = "famas"
	self.weapon_skins.famas_dallas.reserve_quality = true
	self.weapon_skins.famas_dallas.rarity = "common"
	self.weapon_skins.famas_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.famas_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.famas_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
	self.weapon_skins.famas_dallas.parts = {
		wpn_fps_ass_famas_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_pos = Vector3(0.0920584, 0.244694, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df"),
				pattern_tweak = Vector3(7.12139, 0, 1)
			}
		},
		wpn_fps_ass_famas_g_retro = {
			[Idstring("mtr_grip"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_pos = Vector3(0.37825, -0.108275, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df"),
				pattern_tweak = Vector3(1.92225, 0, 1)
			}
		},
		wpn_fps_ass_famas_g_standard = {
			[Idstring("mtr_grip_2"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_pos = Vector3(0.37825, -0.108275, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df"),
				pattern_tweak = Vector3(1.92225, 0, 1)
			}
		}
	}
	self.weapon_skins.flamethrower_mk2_dallas = {}
	self.weapon_skins.flamethrower_mk2_dallas.name_id = "bm_wskn_flamethrower_mk2_dallas"
	self.weapon_skins.flamethrower_mk2_dallas.desc_id = "bm_wskn_flamethrower_mk2_dallas_desc"
	self.weapon_skins.flamethrower_mk2_dallas.weapon_id = "flamethrower_mk2"
	self.weapon_skins.flamethrower_mk2_dallas.rarity = "common"
	self.weapon_skins.flamethrower_mk2_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.flamethrower_mk2_dallas.reserve_quality = true
	self.weapon_skins.flamethrower_mk2_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.flamethrower_mk2_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.flamethrower_mk2_dallas.types = {
		magazine = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
		}
	}
	self.weapon_skins.huntsman_dallas = {}
	self.weapon_skins.huntsman_dallas.name_id = "bm_wskn_huntsman_dallas"
	self.weapon_skins.huntsman_dallas.desc_id = "bm_wskn_huntsman_dallas_desc"
	self.weapon_skins.huntsman_dallas.weapon_id = "huntsman"
	self.weapon_skins.huntsman_dallas.rarity = "common"
	self.weapon_skins.huntsman_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.huntsman_dallas.reserve_quality = true
	self.weapon_skins.huntsman_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.huntsman_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_004_df")
	self.weapon_skins.huntsman_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crackled_ground_df")
	self.weapon_skins.huntsman_dallas.pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df")
	self.weapon_skins.huntsman_dallas.pattern_tweak = Vector3(2.54233, 0, 1)
	self.weapon_skins.r93_dallas = {}
	self.weapon_skins.r93_dallas.name_id = "bm_wskn_r93_dallas"
	self.weapon_skins.r93_dallas.desc_id = "bm_wskn_r93_dallas_desc"
	self.weapon_skins.r93_dallas.weapon_id = "r93"
	self.weapon_skins.r93_dallas.reserve_quality = true
	self.weapon_skins.r93_dallas.rarity = "common"
	self.weapon_skins.r93_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.r93_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.r93_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
	self.weapon_skins.r93_dallas.pattern_tweak = Vector3(5.97663, 0, 1)
	self.weapon_skins.r93_dallas.parts = {
		wpn_fps_snp_r93_body_standard = {
			[Idstring("mtr_body"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df"),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crackled_ground_df")
			}
		},
		wpn_fps_snp_r93_body_wood = {
			[Idstring("mtr_wooden"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crackled_ground_df"),
				pattern_tweak = Vector3(7.35989, 0, 1)
			},
			[Idstring("mtr_pouch"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
			}
		}
	}
	self.weapon_skins.ak74_dallas = {}
	self.weapon_skins.ak74_dallas.name_id = "bm_wskn_ak74_dallas"
	self.weapon_skins.ak74_dallas.desc_id = "bm_wskn_ak74_dallas_desc"
	self.weapon_skins.ak74_dallas.weapon_id = "ak74"
	self.weapon_skins.ak74_dallas.reserve_quality = true
	self.weapon_skins.ak74_dallas.rarity = "uncommon"
	self.weapon_skins.ak74_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.ak74_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.ak74_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df")
	self.weapon_skins.ak74_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crackled_ground_df")
	self.weapon_skins.ak74_dallas.pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df")
	self.weapon_skins.ak74_dallas.pattern_tweak = Vector3(2.11305, 0, 1)
	self.weapon_skins.ak74_dallas.pattern_pos = Vector3(0, 0.101598, 0)
	self.weapon_skins.ak74_dallas.types = {
		magazine = {
			pattern_tweak = Vector3(2.92392, 0, 1)
		}
	}
	self.weapon_skins.ppk_dallas = {}
	self.weapon_skins.ppk_dallas.name_id = "bm_wskn_ppk_dallas"
	self.weapon_skins.ppk_dallas.desc_id = "bm_wskn_ppk_dallas_desc"
	self.weapon_skins.ppk_dallas.weapon_id = "ppk"
	self.weapon_skins.ppk_dallas.reserve_quality = true
	self.weapon_skins.ppk_dallas.rarity = "uncommon"
	self.weapon_skins.ppk_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.ppk_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.ppk_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.ppk_dallas.parts = {
		wpn_fps_pis_ppk_b_standard = {
			[Idstring("mtr_slide"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_eagle_wings_df"),
				uv_scale = Vector3(1.54989, 2.31269, 1),
				uv_offset_rot = Vector3(0.340091, 0.962251, 0)
			}
		},
		wpn_fps_pis_ppk_b_long = {
			[Idstring("mtr_slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_eagle_wings_df"),
				uv_offset_rot = Vector3(0.174678, 0.973711, 0),
				uv_scale = Vector3(2.21834, 2.83911, 1)
			}
		}
	}
	self.weapon_skins.deagle_dallas = {}
	self.weapon_skins.deagle_dallas.name_id = "bm_wskn_deagle_dallas"
	self.weapon_skins.deagle_dallas.desc_id = "bm_wskn_deagle_dallas_desc"
	self.weapon_skins.deagle_dallas.weapon_id = "deagle"
	self.weapon_skins.deagle_dallas.rarity = "uncommon"
	self.weapon_skins.deagle_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.deagle_dallas.reserve_quality = true
	self.weapon_skins.deagle_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.deagle_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
	self.weapon_skins.deagle_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_004_df")
	self.weapon_skins.deagle_dallas.pattern_tweak = Vector3(1.39757, 3.15133, 1)
	self.weapon_skins.deagle_dallas.pattern_pos = Vector3(0.187455, -0.117815, 0)
	self.weapon_skins.deagle_dallas.types = {
		slide = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df"),
			pattern_tweak = Vector3(1.54067, 0, 1)
		},
		grip = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df"),
			pattern_pos = Vector3(0.168376, -0.089196, 0),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_snakeskin_df"),
			pattern_tweak = Vector3(0.967981, 0, 1)
		}
	}
	self.weapon_skins.new_m14_dallas = {}
	self.weapon_skins.new_m14_dallas.name_id = "bm_wskn_new_m14_dallas"
	self.weapon_skins.new_m14_dallas.desc_id = "bm_wskn_new_m14_dallas_desc"
	self.weapon_skins.new_m14_dallas.weapon_id = "new_m14"
	self.weapon_skins.new_m14_dallas.rarity = "uncommon"
	self.weapon_skins.new_m14_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.new_m14_dallas.reserve_quality = true
	self.weapon_skins.new_m14_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.new_m14_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df")
	self.weapon_skins.new_m14_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_002_df")
	self.weapon_skins.new_m14_dallas.pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df")
	self.weapon_skins.new_m14_dallas.pattern_tweak = Vector3(6.9783, 0, 1)
	self.weapon_skins.new_m14_dallas.parts = {
		wpn_fps_ass_m14_body_dmr = {
			[Idstring("dmr1"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_texaslonghorn_df"),
				uv_scale = Vector3(2.88479, 2.69409, 0),
				uv_offset_rot = Vector3(0.069979, 0.926473, 0.22927)
			}
		},
		wpn_fps_ass_m14_body_upper = {
			[Idstring("base"):key()] = {
				uv_scale = Vector3(1.02547, 0.834774, 1),
				uv_offset_rot = Vector3(0.310932, 0.598203, 0.109391)
			}
		},
		wpn_fps_ass_m14_body_ebr = {
			[Idstring("ebr"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_texaslonghorn_df"),
				uv_scale = Vector3(3.02781, 4.02898, 1),
				uv_offset_rot = Vector3(0.05682, 0.909473, 0.28921)
			}
		},
		wpn_fps_ass_m14_m_standard = {
			[Idstring("mag"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_texaslonghorn_df"),
				uv_scale = Vector3(1.21617, 1.26385, 1),
				uv_offset_rot = Vector3(0.00666143, 0.801917, 0.22927)
			}
		},
		wpn_fps_ass_m14_body_jae = {
			[Idstring("jae"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_texaslonghorn_df"),
				uv_scale = Vector3(3.45688, 3.31386, 0),
				uv_offset_rot = Vector3(0.151297, 0.932553, 0.1993)
			}
		},
		wpn_fps_ass_m14_body_lower = {
			[Idstring("lower"):key()] = {
				uv_scale = Vector3(1.3592, 0.69175, 1),
				uv_offset_rot = Vector3(0.120677, 0.874536, 0)
			}
		}
	}
	self.weapon_skins.judge_dallas = {}
	self.weapon_skins.judge_dallas.name_id = "bm_wskn_judge_dallas"
	self.weapon_skins.judge_dallas.desc_id = "bm_wskn_judge_dallas_desc"
	self.weapon_skins.judge_dallas.weapon_id = "judge"
	self.weapon_skins.judge_dallas.reserve_quality = true
	self.weapon_skins.judge_dallas.rarity = "rare"
	self.weapon_skins.judge_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.judge_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.judge_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.judge_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df")
	self.weapon_skins.judge_dallas.default_blueprint = {
		"wpn_fps_pis_judge_body_standard",
		"wpn_fps_pis_judge_b_standard",
		"wpn_fps_pis_judge_g_standard",
		"wpn_fps_upg_a_explosive",
		"wpn_fps_upg_shot_ns_king"
	}
	self.weapon_skins.judge_dallas.parts = {
		wpn_fps_pis_judge_g_standard = {
			[Idstring("mtr_grip"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
				uv_scale = Vector3(0.596401, 0.548726, 0.243978),
				uv_offset_rot = Vector3(0, 1.06065, 0)
			}
		},
		wpn_fps_pis_judge_body_standard = {
			[Idstring("mtr_cylinder"):key()] = {
				pattern_pos = Vector3(0, -0.442165, 0),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
				pattern_tweak = Vector3(2.87622, 0, 0)
			},
			[Idstring("mtr_frame"):key()] = {
				pattern_pos = Vector3(0, -0.0409577, 0),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
				pattern_tweak = Vector3(4.92726, 0, 1)
			}
		}
	}
	self.weapon_skins.b92fs_dallas = {}
	self.weapon_skins.b92fs_dallas.name_id = "bm_wskn_b92fs_dallas"
	self.weapon_skins.b92fs_dallas.desc_id = "bm_wskn_b92fs_dallas_desc"
	self.weapon_skins.b92fs_dallas.weapon_id = "b92fs"
	self.weapon_skins.b92fs_dallas.reserve_quality = true
	self.weapon_skins.b92fs_dallas.rarity = "rare"
	self.weapon_skins.b92fs_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.b92fs_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.b92fs_dallas.base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_shared_003_df")
	self.weapon_skins.b92fs_dallas.pattern_tweak = Vector3(4.45028, 1.45804, 1)
	self.weapon_skins.b92fs_dallas.parts = {
		wpn_fps_pis_beretta_g_std = {
			[Idstring("std_grips"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_dallas_logo_df"),
				uv_scale = Vector3(11.7046, 11.7046, 1),
				uv_offset_rot = Vector3(0.0147406, 0.770139, 6.05841)
			}
		},
		wpn_fps_pis_beretta_g_engraved = {
			[Idstring("mtr_engraved"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df"),
				uv_offset_rot = Vector3(-0.0510372, 0.7026, 6.04343),
				pattern_pos = Vector3(0, -0.308609, 0),
				uv_scale = Vector3(9.32087, 8.8918, 0),
				cubemap_pattern_control = Vector3(0.0555689, 1, 0),
				pattern_tweak = Vector3(2.35154, 1.56293, 1)
			}
		}
	}
	self.weapon_skins.b92fs_dallas.types = {
		grip = {
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
		}
	}
	self.weapon_skins.b92fs_dallas.default_blueprint = {
		"wpn_fps_pis_beretta_body_beretta",
		"wpn_fps_pis_beretta_b_std",
		"wpn_fps_pis_beretta_sl_brigadier",
		"wpn_fps_pis_beretta_m_extended",
		"wpn_fps_pis_beretta_g_std",
		"wpn_fps_upg_ns_pis_jungle",
		"wpn_fps_pis_beretta_o_std"
	}
	self.weapon_skins.serbu_dallas = {}
	self.weapon_skins.serbu_dallas.name_id = "bm_wskn_serbu_dallas"
	self.weapon_skins.serbu_dallas.desc_id = "bm_wskn_serbu_dallas_desc"
	self.weapon_skins.serbu_dallas.weapon_id = "serbu"
	self.weapon_skins.serbu_dallas.rarity = "rare"
	self.weapon_skins.serbu_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.serbu_dallas.reserve_quality = true
	self.weapon_skins.serbu_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.serbu_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.serbu_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df")
	self.weapon_skins.serbu_dallas.cubemap_pattern_control = Vector3(0.329836, 0.625566, 0)
	self.weapon_skins.serbu_dallas.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_short",
		"wpn_fps_shot_r870_fg_small",
		"wpn_fps_upg_ns_shot_shark",
		"wpn_fps_upg_m4_g_ergo",
		"wpn_fps_shot_shorty_m_extended_short",
		"wpn_fps_shot_shorty_s_solid_short",
		"wpn_fps_upg_a_explosive"
	}
	self.weapon_skins.serbu_dallas.types = {
		lower_reciever = {
			pattern_pos = Vector3(0, -0.003, 0),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
			pattern_tweak = Vector3(2.16075, 0, 1)
		},
		stock = {
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
			pattern_tweak = Vector3(2.54233, 0, 1)
		},
		lower_body = {
			pattern_tweak = Vector3(2.25614, 0, 1)
		}
	}
	self.weapon_skins.serbu_dallas.parts = {
		wpn_fps_shot_r870_fg_small = {
			[Idstring("short_pump"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
				uv_scale = Vector3(0.596401, 0.69175, 0),
				uv_offset_rot = Vector3(-0.00333858, 1.01741, 0)
			}
		}
	}
	self.weapon_skins.g36_dallas = {}
	self.weapon_skins.g36_dallas.name_id = "bm_wskn_g36_dallas"
	self.weapon_skins.g36_dallas.desc_id = "bm_wskn_g36_dallas_desc"
	self.weapon_skins.g36_dallas.weapon_id = "g36"
	self.weapon_skins.g36_dallas.rarity = "epic"
	self.weapon_skins.g36_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.g36_dallas.reserve_quality = true
	self.weapon_skins.g36_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.g36_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_003_df")
	self.weapon_skins.g36_dallas.default_blueprint = {
		"wpn_fps_ass_g36_m_standard",
		"wpn_fps_ass_g36_b_long",
		"wpn_fps_ass_g36_fg_ksk",
		"wpn_fps_upg_fl_ass_utg",
		"wpn_fps_ass_g36_s_sl8",
		"wpn_fps_upg_ass_ns_surefire"
	}
	self.weapon_skins.g36_dallas.parts = {
		wpn_fps_ass_g36_s_sl8 = {
			[Idstring("sl8"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_do_not_thread_df"),
				uv_scale = Vector3(0.882449, 1.26385, 0.5),
				uv_offset_rot = Vector3(0.769378, 0.211455, 5.54892)
			}
		},
		wpn_fps_ass_g36_body_sl8 = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_do_not_thread_df"),
				uv_scale = Vector3(0.888449, 1.11248, 0.5),
				uv_offset_rot = Vector3(-0.489864, 0.594884, 5.84862)
			}
		},
		wpn_fps_ass_g36_g_standard = {
			[Idstring("grip"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_do_not_thread_df"),
				uv_scale = Vector3(0.548726, 0.882449, 1),
				uv_offset_rot = Vector3(0.0261216, 0.715679, 6.06543)
			}
		},
		wpn_fps_ass_g36_body_standard = {
			[Idstring("base"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_do_not_thread_df"),
				uv_scale = Vector3(1, 1.02547, 1),
				uv_offset_rot = Vector3(-0.241831, 0.578583, 5.93853)
			}
		}
	}
	self.weapon_skins.g36_dallas.types = {
		sight = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
		},
		barrel = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
		}
	}
	self.weapon_skins.m95_dallas = {}
	self.weapon_skins.m95_dallas.name_id = "bm_wskn_m95_dallas"
	self.weapon_skins.m95_dallas.desc_id = "bm_wskn_m95_dallas_desc"
	self.weapon_skins.m95_dallas.weapon_id = "m95"
	self.weapon_skins.m95_dallas.rarity = "epic"
	self.weapon_skins.m95_dallas.bonus = "team_exp_money_p3"
	self.weapon_skins.m95_dallas.reserve_quality = true
	self.weapon_skins.m95_dallas.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.m95_dallas.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_002_df")
	self.weapon_skins.m95_dallas.pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_stars_df")
	self.weapon_skins.m95_dallas.default_blueprint = {
		"wpn_fps_snp_m95_bipod",
		"wpn_fps_snp_m95_lower_reciever",
		"wpn_fps_snp_m95_upper_reciever",
		"wpn_fps_snp_m95_magazine",
		"wpn_fps_snp_m95_barrel_long",
		"wpn_fps_upg_m4_g_hgrip",
		"wpn_fps_upg_o_leupold"
	}
	self.weapon_skins.m95_dallas.parts = {
		wpn_fps_snp_m95_upper_reciever = {
			[Idstring("mtr_upper"):key()] = {
				pattern_pos = Vector3(0, -0.005, 0),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
				pattern_tweak = Vector3(6.11973, 0.184315, 1)
			}
		},
		wpn_fps_snp_m95_lower_reciever = {
			[Idstring("mtr_lower"):key()] = {
				pattern_pos = Vector3(0.230154, -0.658499, 0),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
				pattern_tweak = Vector3(5.30885, 0.304195, 1)
			}
		},
		wpn_fps_snp_m95_barrel_short = {
			[Idstring("mtr_muzzlebreak"):key()] = {
				uv_scale = Vector3(0.358028, 0.358028, 1),
				uv_offset_rot = Vector3(1.72335, 1.4467, 0)
			},
			[Idstring("mtr_long1"):key()] = {
				uv_scale = Vector3(0.405702, 0.405702, 1),
				uv_offset_rot = Vector3(1.00787, 1.4944, 0)
			}
		},
		wpn_fps_snp_m95_barrel_suppressed = {
			[Idstring("mtr_suppressed"):key()] = {
				uv_scale = Vector3(1.63957, 1.45455, 1),
				uv_offset_rot = Vector3(0.062979, 0.970154, 0)
			}
		}
	}
	self.weapon_skins.m95_dallas.types = {
		barrel = {
			sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_american_flag_df"),
			uv_scale = Vector3(1.26385, 1.12082, 1),
			uv_offset_rot = Vector3(0.173059, 0.969712, 0),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_waveylines_df"),
			pattern_tweak = Vector3(7.026, 0.169331, 1)
		}
	}
	self.weapon_skins.p90_dallas_sallad = {}
	self.weapon_skins.p90_dallas_sallad.name_id = "bm_wskn_p90_dallas_sallad"
	self.weapon_skins.p90_dallas_sallad.desc_id = "bm_wskn_p90_dallas_sallad_desc"
	self.weapon_skins.p90_dallas_sallad.weapon_id = "p90"
	self.weapon_skins.p90_dallas_sallad.rarity = "legendary"
	self.weapon_skins.p90_dallas_sallad.bonus = "team_exp_money_p3"
	self.weapon_skins.p90_dallas_sallad.reserve_quality = true
	self.weapon_skins.p90_dallas_sallad.unique_name_id = "bm_wskn_p90_dallas_sallad"
	self.weapon_skins.p90_dallas_sallad.locked = true
	self.weapon_skins.p90_dallas_sallad.texture_bundle_folder = "cash/safes/dallas"
	self.weapon_skins.p90_dallas_sallad.base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_005_df")
	self.weapon_skins.p90_dallas_sallad.pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
	self.weapon_skins.p90_dallas_sallad.pattern = Idstring("units/payday2_cash/safes/shared/pattern/pattern_smoke_df")
	self.weapon_skins.p90_dallas_sallad.pattern_tweak = Vector3(1, 0, 0)
	self.weapon_skins.p90_dallas_sallad.default_blueprint = {
		"wpn_fps_smg_p90_body_p90",
		"wpn_fps_smg_p90_m_std",
		"wpn_fps_smg_p90_b_legend",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_fl_ass_utg"
	}
	self.weapon_skins.p90_dallas_sallad.parts = {
		wpn_fps_smg_p90_body_p90 = {
			[Idstring("p90"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_molon_labe_df"),
				uv_scale = Vector3(2.64641, 5.26852, 0.0555689),
				uv_offset_rot = Vector3(-0.194212, 0.896394, 0)
			}
		},
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/dallas/sticker/sticker_delta_df"),
				uv_scale = Vector3(7.35821, 8.93947, 0.401383),
				uv_offset_rot = Vector3(-0.380086, 0.584203, 0)
			}
		}
	}
	self.weapon_skins.p90_dallas_sallad.types = {
		sight = {
			base_gradient = Idstring("units/payday2_cash/safes/dinner/base_gradient/base_dinner_001_df"),
			pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df")
		},
		gadget = {
			base_gradient = Idstring("units/payday2_cash/safes/dallas/base_gradient/base_dallas_001_df"),
			pattern = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df")
		}
	}
	self.weapon_skins.akm_waves = {}
	self.weapon_skins.akm_waves.name_id = "bm_wskn_akm_waves"
	self.weapon_skins.akm_waves.desc_id = "bm_wskn_akm_waves_desc"
	self.weapon_skins.akm_waves.weapon_id = "akm"
	self.weapon_skins.akm_waves.rarity = "common"
	self.weapon_skins.akm_waves.bonus = "spread_p1"
	self.weapon_skins.akm_waves.reserve_quality = true
	self.weapon_skins.akm_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.akm_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_001_df")
	self.weapon_skins.asval_waves = {}
	self.weapon_skins.asval_waves.name_id = "bm_wskn_asval_waves"
	self.weapon_skins.asval_waves.desc_id = "bm_wskn_asval_waves_desc"
	self.weapon_skins.asval_waves.weapon_id = "asval"
	self.weapon_skins.asval_waves.rarity = "common"
	self.weapon_skins.asval_waves.bonus = "spread_p1"
	self.weapon_skins.asval_waves.reserve_quality = true
	self.weapon_skins.asval_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.asval_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_002_df")
	self.weapon_skins.asval_waves.types = {
		foregrip = {
			pattern_pos = Vector3(-0.404006, 0.797997, 0),
			pattern_tweak = Vector3(1.68376, 1.5929, 1),
			pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_003b_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_003_df")
		}
	}
	self.weapon_skins.m16_waves = {}
	self.weapon_skins.m16_waves.name_id = "bm_wskn_m16_waves"
	self.weapon_skins.m16_waves.desc_id = "bm_wskn_m16_waves_desc"
	self.weapon_skins.m16_waves.weapon_id = "m16"
	self.weapon_skins.m16_waves.rarity = "common"
	self.weapon_skins.m16_waves.bonus = "recoil_p1"
	self.weapon_skins.m16_waves.reserve_quality = true
	self.weapon_skins.m16_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.m16_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_003_df")
	self.weapon_skins.baka_waves = {}
	self.weapon_skins.baka_waves.name_id = "bm_wskn_baka_waves"
	self.weapon_skins.baka_waves.desc_id = "bm_wskn_baka_waves_desc"
	self.weapon_skins.baka_waves.weapon_id = "baka"
	self.weapon_skins.baka_waves.rarity = "common"
	self.weapon_skins.baka_waves.bonus = "recoil_p1"
	self.weapon_skins.baka_waves.reserve_quality = true
	self.weapon_skins.baka_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.baka_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_005_df")
	self.weapon_skins.baka_waves.pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_003_df")
	self.weapon_skins.baka_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_003b_df")
	self.weapon_skins.baka_waves.pattern_tweak = Vector3(1.96995, 0, 1)
	self.weapon_skins.s552_waves = {}
	self.weapon_skins.s552_waves.name_id = "bm_wskn_s552_waves"
	self.weapon_skins.s552_waves.desc_id = "bm_wskn_s552_waves_desc"
	self.weapon_skins.s552_waves.weapon_id = "s552"
	self.weapon_skins.s552_waves.rarity = "common"
	self.weapon_skins.s552_waves.bonus = "spread_p1"
	self.weapon_skins.s552_waves.reserve_quality = true
	self.weapon_skins.s552_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.s552_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_005_df")
	self.weapon_skins.s552_waves.pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_003_df")
	self.weapon_skins.s552_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_003b_df")
	self.weapon_skins.s552_waves.pattern_tweak = Vector3(2.30384, 0.768728, 1)
	self.weapon_skins.s552_waves.pattern_pos = Vector3(-0.0701165, -0.27999, 0)
	self.weapon_skins.usp_waves = {}
	self.weapon_skins.usp_waves.name_id = "bm_wskn_usp_waves"
	self.weapon_skins.usp_waves.desc_id = "bm_wskn_usp_waves_desc"
	self.weapon_skins.usp_waves.weapon_id = "usp"
	self.weapon_skins.usp_waves.rarity = "common"
	self.weapon_skins.usp_waves.bonus = "spread_p1"
	self.weapon_skins.usp_waves.reserve_quality = true
	self.weapon_skins.usp_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.usp_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_006_df")
	self.weapon_skins.mac10_waves = {}
	self.weapon_skins.mac10_waves.name_id = "bm_wskn_mac10_waves"
	self.weapon_skins.mac10_waves.desc_id = "bm_wskn_mac10_waves_desc"
	self.weapon_skins.mac10_waves.weapon_id = "mac10"
	self.weapon_skins.mac10_waves.rarity = "uncommon"
	self.weapon_skins.mac10_waves.bonus = "recoil_p1"
	self.weapon_skins.mac10_waves.reserve_quality = true
	self.weapon_skins.mac10_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.mac10_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_007_df")
	self.weapon_skins.mac10_waves.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_009_df")
	self.weapon_skins.mac10_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_001_df")
	self.weapon_skins.mac10_waves.pattern_tweak = Vector3(9.60172, 3.13635, 1)
	self.weapon_skins.mac10_waves.pattern_pos = Vector3(-0.127355, 0.177916, 0)
	self.weapon_skins.mac10_waves.uv_offset_rot = Vector3(-1.23396, 0, 6.28319)
	self.weapon_skins.mac10_waves.cubemap_pattern_control = Vector3(0.286907, 1, 0)
	self.weapon_skins.mac10_waves.parts = {
		wpn_fps_upg_fl_ass_peq15 = {
			[Idstring("mtr_peq15"):key()] = {
				pattern_pos = Vector3(0.36179, 0.405249, 0),
				pattern_tweak = Vector3(1.73146, 1.54794, 1)
			}
		}
	}
	self.weapon_skins.aug_waves = {}
	self.weapon_skins.aug_waves.name_id = "bm_wskn_aug_waves"
	self.weapon_skins.aug_waves.desc_id = "bm_wskn_aug_waves_desc"
	self.weapon_skins.aug_waves.weapon_id = "aug"
	self.weapon_skins.aug_waves.rarity = "uncommon"
	self.weapon_skins.aug_waves.bonus = "recoil_p1"
	self.weapon_skins.aug_waves.reserve_quality = true
	self.weapon_skins.aug_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.aug_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_008_df")
	self.weapon_skins.aug_waves.parts = {
		wpn_fps_aug_body_aug = {
			[Idstring("aug"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_004_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df"),
				pattern_pos = Vector3(-0.0244975, -0.00387842, 0),
				pattern_tweak = Vector3(1, 3.16632, 1)
			}
		},
		wpn_fps_aug_body_f90 = {
			[Idstring("mtr_f90"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_004_df"),
				pattern_pos = Vector3(0.00620103, 0.68352, 0),
				pattern_tweak = Vector3(1.15908, 3.04644, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df")
			}
		}
	}
	self.weapon_skins.aug_waves.types = {
		vertical_grip = {
			base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_008_b_df")
		}
	}
	self.weapon_skins.scar_waves = {}
	self.weapon_skins.scar_waves.name_id = "bm_wskn_scar_waves"
	self.weapon_skins.scar_waves.desc_id = "bm_wskn_scar_waves_desc"
	self.weapon_skins.scar_waves.weapon_id = "scar"
	self.weapon_skins.scar_waves.rarity = "uncommon"
	self.weapon_skins.scar_waves.bonus = "spread_p1"
	self.weapon_skins.scar_waves.reserve_quality = true
	self.weapon_skins.scar_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.scar_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_009_b_df")
	self.weapon_skins.scar_waves.types = {
		barrel_ext = {
			pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_001_df"),
			pattern_pos = Vector3(-0.0701165, 0.36871, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_004_df"),
			pattern_tweak = Vector3(0.586694, 4.72475, 1)
		}
	}
	self.weapon_skins.scar_waves.parts = {
		wpn_fps_ass_scar_body_standard = {
			[Idstring("mtr_lower"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_009_df")
			},
			[Idstring("mtr_upper"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_001_df"),
				pattern_pos = Vector3(0.177916, -0.909611, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_004_df"),
				pattern_tweak = Vector3(1.06368, 0, 1)
			}
		},
		wpn_fps_upg_vg_ass_smg_afg = {
			[Idstring("afg"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_009_df")
			}
		},
		wpn_fps_ass_scar_m_standard = {
			[Idstring("mtr_mag"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_009_df")
			}
		}
	}
	self.weapon_skins.colt_1911_waves = {}
	self.weapon_skins.colt_1911_waves.name_id = "bm_wskn_colt_1911_waves"
	self.weapon_skins.colt_1911_waves.desc_id = "bm_wskn_colt_1911_waves_desc"
	self.weapon_skins.colt_1911_waves.weapon_id = "colt_1911"
	self.weapon_skins.colt_1911_waves.rarity = "uncommon"
	self.weapon_skins.colt_1911_waves.bonus = "spread_p1"
	self.weapon_skins.colt_1911_waves.reserve_quality = true
	self.weapon_skins.colt_1911_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.colt_1911_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_010_df")
	self.weapon_skins.colt_1911_waves.parts = {
		wpn_fps_pis_1911_g_ergo = {
			[Idstring("ergo"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_010_df")
			}
		},
		wpn_fps_pis_1911_g_bling = {
			[Idstring("bling"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_010_b_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df"),
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_002_df")
			}
		}
	}
	self.weapon_skins.colt_1911_waves.types = {
		grip = {
			base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_010_b_df")
		},
		barrel_ext = {
			pattern_pos = Vector3(0, -0.327689, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df"),
			pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_002_df"),
			pattern_tweak = Vector3(1.68376, 0, 1)
		},
		slide = {
			pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_002_df"),
			pattern_pos = Vector3(-0.146434, -0.27045, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df"),
			pattern_tweak = Vector3(3.7378, 0, 1)
		}
	}
	self.weapon_skins.polymer_waves = {}
	self.weapon_skins.polymer_waves.name_id = "bm_wskn_polymer_waves"
	self.weapon_skins.polymer_waves.desc_id = "bm_wskn_polymer_waves_desc"
	self.weapon_skins.polymer_waves.weapon_id = "polymer"
	self.weapon_skins.polymer_waves.rarity = "rare"
	self.weapon_skins.polymer_waves.bonus = "spread_p1"
	self.weapon_skins.polymer_waves.reserve_quality = true
	self.weapon_skins.polymer_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.polymer_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_011_df")
	self.weapon_skins.polymer_waves.default_blueprint = {
		"wpn_fps_smg_polymer_body_standard",
		"wpn_fps_smg_polymer_bolt_standard",
		"wpn_fps_smg_polymer_dh_standard",
		"wpn_fps_smg_polymer_extra_sling",
		"wpn_fps_smg_polymer_fg_standard",
		"wpn_fps_smg_polymer_barrel_standard",
		"wpn_fps_smg_polymer_m_standard",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_reflex",
		"wpn_fps_upg_m4_s_mk46"
	}
	self.weapon_skins.polymer_waves.parts = {
		wpn_fps_smg_polymer_body_standard = {
			[Idstring("mtr_body"):key()] = {
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_004_df"),
				pattern_pos = Vector3(-0.112275, 0.00566143, 0),
				pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_checker_df"),
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_011_b_df"),
				pattern_tweak = Vector3(1.20678, 0, 1)
			}
		}
	}
	self.weapon_skins.polymer_waves.types = {
		barrel_ext = {
			pattern_pos = Vector3(0.0443599, 1.46578, 0),
			pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_checker_df"),
			pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_004_df"),
			pattern_tweak = Vector3(0.443599, 0, 1)
		}
	}
	self.weapon_skins.ak5_waves = {}
	self.weapon_skins.ak5_waves.name_id = "bm_wskn_ak5_waves"
	self.weapon_skins.ak5_waves.desc_id = "bm_wskn_ak5_waves_desc"
	self.weapon_skins.ak5_waves.weapon_id = "ak5"
	self.weapon_skins.ak5_waves.rarity = "rare"
	self.weapon_skins.ak5_waves.bonus = "spread_p1"
	self.weapon_skins.ak5_waves.reserve_quality = true
	self.weapon_skins.ak5_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.ak5_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_012_df")
	self.weapon_skins.ak5_waves.pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_002_b_df")
	self.weapon_skins.ak5_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_003c_df")
	self.weapon_skins.ak5_waves.pattern_tweak = Vector3(4.25948, 0, 0)
	self.weapon_skins.ak5_waves.pattern_pos = Vector3(-0.00333858, 0.225614, 0)
	self.weapon_skins.ak5_waves.default_blueprint = {
		"wpn_fps_ass_ak5_body_ak5",
		"wpn_fps_ass_ak5_b_short",
		"wpn_fps_ass_ak5_s_ak5b",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_m4_m_quad",
		"wpn_fps_ass_ak5_fg_ak5c",
		"wpn_fps_upg_ass_ns_surefire"
	}
	self.weapon_skins.ak5_waves.parts = {
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_bodhi_df"),
				uv_scale = Vector3(5.07782, 5.64992, 1),
				uv_offset_rot = Vector3(-0.379387, 0.585123, 0)
			}
		}
	}
	self.weapon_skins.mosin_waves = {}
	self.weapon_skins.mosin_waves.name_id = "bm_wskn_mosin_waves"
	self.weapon_skins.mosin_waves.desc_id = "bm_wskn_mosin_waves_desc"
	self.weapon_skins.mosin_waves.weapon_id = "mosin"
	self.weapon_skins.mosin_waves.rarity = "rare"
	self.weapon_skins.mosin_waves.bonus = "total_ammo_p1"
	self.weapon_skins.mosin_waves.reserve_quality = true
	self.weapon_skins.mosin_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.mosin_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_013_df")
	self.weapon_skins.mosin_waves.pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_001_df")
	self.weapon_skins.mosin_waves.pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df")
	self.weapon_skins.mosin_waves.pattern_tweak = Vector3(6.31052, 0, 1)
	self.weapon_skins.mosin_waves.pattern_pos = Vector3(-0.0128784, -0.194133, 0)
	self.weapon_skins.mosin_waves.default_blueprint = {
		"wpn_fps_snp_mosin_m_standard",
		"wpn_fps_snp_mosin_body_black",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_snp_mosin_b_short"
	}
	self.weapon_skins.mosin_waves.parts = {
		wpn_fps_snp_mosin_b_sniper = {
			[Idstring("mtr_sniper"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_013_b_df"),
				pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_001_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/sputnik/pattern_gradient/gradient_sput_002_df"),
				pattern_tweak = Vector3(12.3682, 5.474, 1)
			}
		},
		wpn_fps_snp_mosin_body_black = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(1.20017, 4.45805, 1),
				uv_offset_rot = Vector3(-0.00141802, 0.986171, 3.05149)
			}
		},
		wpn_fps_snp_mosin_body_standard = {
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(1.20017, 4.45805, 1),
				uv_offset_rot = Vector3(-0.00141802, 0.986171, 3.05149)
			}
		}
	}
	self.weapon_skins.mosin_waves.types = {
		barrel = {
			base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_013_c_df")
		}
	}
	self.weapon_skins.striker_waves = {}
	self.weapon_skins.striker_waves.name_id = "bm_wskn_striker_waves"
	self.weapon_skins.striker_waves.desc_id = "bm_wskn_striker_waves_desc"
	self.weapon_skins.striker_waves.weapon_id = "striker"
	self.weapon_skins.striker_waves.rarity = "epic"
	self.weapon_skins.striker_waves.bonus = "spread_p1"
	self.weapon_skins.striker_waves.reserve_quality = true
	self.weapon_skins.striker_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.striker_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_014_df")
	self.weapon_skins.striker_waves.pattern_gradient = Idstring("units/payday2_cash/safes/shared/pattern_gradient/gradient_shared_007_df")
	self.weapon_skins.striker_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_001_df")
	self.weapon_skins.striker_waves.pattern_tweak = Vector3(7.78917, 2.32716, 1)
	self.weapon_skins.striker_waves.default_blueprint = {
		"wpn_fps_sho_striker_body_standard",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_shot_ns_king",
		"wpn_fps_sho_striker_b_standard"
	}
	self.weapon_skins.striker_waves.parts = {
		wpn_fps_sho_striker_b_standard = {
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(0.644076, 1.83594, 0),
				uv_offset_rot = Vector3(-0.62034, 0.623583, 3.13635)
			}
		},
		wpn_fps_sho_striker_b_long = {
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(0.644076, 1.83594, 0),
				uv_offset_rot = Vector3(-0.62034, 0.623583, 3.13635)
			}
		},
		wpn_fps_sho_striker_b_suppressed = {
			[Idstring("mtr_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(0.644076, 1.83594, 0),
				uv_offset_rot = Vector3(-0.62034, 0.623583, 3.13635)
			}
		},
		wpn_fps_sho_striker_body_standard = {
			[Idstring("mtr_rail"):key()] = {
				uv_scale = Vector3(3.40921, 0.882449, 1),
				uv_offset_rot = Vector3(0.0268201, 0.931553, 1.62287)
			},
			[Idstring("mtr_body"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(0.834774, 3.17083, 0),
				uv_offset_rot = Vector3(0.206995, 0.951632, 3.15235)
			}
		},
		wpn_fps_upg_o_cmore = {
			[Idstring("cmore"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
				uv_scale = Vector3(1.50222, 0.69175, 1),
				uv_offset_rot = Vector3(0.349631, 0.902934, 1.36813)
			}
		},
		wpn_fps_upg_o_aimpoint_2 = {
			[Idstring("aimpoint"):key()] = {
				uv_scale = Vector3(3.93363, 1, 1),
				uv_offset_rot = Vector3(-0.0987357, 0.979251, 1.51798)
			}
		},
		wpn_fps_upg_o_eotech = {
			[Idstring("mtr_eotech"):key()] = {
				uv_scale = Vector3(2.83711, 0.69175, 1),
				uv_offset_rot = Vector3(0.0538995, 1.13189, 4.73974)
			}
		},
		wpn_fps_upg_o_t1micro = {
			[Idstring("mtr_t1micro"):key()] = {
				uv_scale = Vector3(2.16967, 0.739425, 1),
				uv_offset_rot = Vector3(0.153678, 0.998331, 1.50299)
			}
		},
		wpn_fps_upg_o_acog = {
			[Idstring("mtr_acog"):key()] = {
				uv_scale = Vector3(2.26502, 0.596401, 1),
				uv_offset_rot = Vector3(0.169376, 1.21774, 1.53296)
			}
		},
		wpn_fps_upg_o_aimpoint = {
			[Idstring("aimpoint"):key()] = {
				uv_scale = Vector3(2.02664, 0.69175, 1),
				uv_offset_rot = Vector3(0.134757, 1.06957, 4.76971)
			}
		},
		wpn_fps_upg_o_specter = {
			[Idstring("mtr_specter"):key()] = {
				uv_scale = Vector3(2.26502, 0.644076, 1),
				uv_offset_rot = Vector3(-0.0414975, 0.454567, 1.50299)
			}
		},
		wpn_fps_upg_o_cs = {
			[Idstring("mtr_cs"):key()] = {
				uv_scale = Vector3(2.36004, 0.834774, 1),
				uv_offset_rot = Vector3(0.032582, 1.31314, 1.50299)
			}
		},
		wpn_fps_upg_o_reflex = {
			[Idstring("reflex"):key()] = {
				uv_scale = Vector3(1.17817, 0.413027, 1),
				uv_offset_rot = Vector3(-0.00133858, 1.52125, 1.57791)
			}
		},
		wpn_fps_upg_o_rx01 = {
			[Idstring("rx01"):key()] = {
				uv_scale = Vector3(2.55106, 0.69175, 1),
				uv_offset_rot = Vector3(0.0915188, 0.530885, 4.64888)
			}
		},
		wpn_fps_upg_o_rx30 = {
			[Idstring("rx30"):key()] = {
				uv_scale = Vector3(1.64524, 0.531727, 1),
				uv_offset_rot = Vector3(0.220075, 1.399, 1.49997)
			}
		}
	}
	self.weapon_skins.striker_waves.types = {
		sight = {
			sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_waves_df"),
			uv_scale = Vector3(1.59757, 0.760425, 1),
			uv_offset_rot = Vector3(0.244694, 1.24636, 1.50001)
		}
	}
	self.weapon_skins.x_g22c_waves = {}
	self.weapon_skins.x_g22c_waves.name_id = "bm_wskn_x_g22c_waves"
	self.weapon_skins.x_g22c_waves.desc_id = "bm_wskn_x_g22c_waves_desc"
	self.weapon_skins.x_g22c_waves.weapon_id = "x_g22c"
	self.weapon_skins.x_g22c_waves.rarity = "epic"
	self.weapon_skins.x_g22c_waves.bonus = "recoil_p1"
	self.weapon_skins.x_g22c_waves.reserve_quality = true
	self.weapon_skins.x_g22c_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.x_g22c_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_015_df")
	self.weapon_skins.x_g22c_waves.pattern_gradient = Idstring("units/payday2_cash/safes/surf/pattern_gradient/gradient_surf_005_df")
	self.weapon_skins.x_g22c_waves.pattern = Idstring("units/payday2_cash/safes/surf/pattern/pattern_surf_002b_df")
	self.weapon_skins.x_g22c_waves.pattern_tweak = Vector3(3.49631, 0, 1)
	self.weapon_skins.x_g22c_waves.pattern_pos = Vector3(0.216075, -0.432626, 0)
	self.weapon_skins.x_g22c_waves.cubemap_pattern_control = Vector3(0.3513, 1, 0)
	self.weapon_skins.x_g22c_waves.default_blueprint = {
		"wpn_fps_pis_g22c_b_standard",
		"wpn_fps_pis_g22c_body_standard",
		"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_pis_g18c_g_ergo",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_upg_ns_pis_ipsccomp"
	}
	self.weapon_skins.x_g22c_waves.parts = {
		wpn_fps_pis_g22c_b_standard = {
			[Idstring("mtr_g22c"):key()] = {
				pattern_pos = Vector3(0, 0.35917, 0),
				pattern_tweak = Vector3(2.68543, 0, 1)
			}
		},
		wpn_fps_upg_fl_pis_crimson = {
			[Idstring("mtr_crimson"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_009_df")
			}
		},
		wpn_fps_upg_fl_pis_m3x = {
			[Idstring("mtr_m3x"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_010_b_df")
			}
		}
	}
	self.weapon_skins.x_g22c_waves.types = {
		lower_reciever = {
			base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_015_b_df")
		}
	}
	self.weapon_skins.r870_waves = {}
	self.weapon_skins.r870_waves.name_id = "bm_wskn_r870_waves"
	self.weapon_skins.r870_waves.desc_id = "bm_wskn_r870_waves_desc"
	self.weapon_skins.r870_waves.weapon_id = "r870"
	self.weapon_skins.r870_waves.rarity = "legendary"
	self.weapon_skins.r870_waves.bonus = "spread_n1"
	self.weapon_skins.r870_waves.reserve_quality = true
	self.weapon_skins.r870_waves.texture_bundle_folder = "cash/safes/surf"
	self.weapon_skins.r870_waves.unique_name_id = "bm_wskn_r870_waves"
	self.weapon_skins.r870_waves.locked = true
	self.weapon_skins.r870_waves.base_gradient = Idstring("units/payday2_cash/safes/surf/base_gradient/base_surf_017_df")
	self.weapon_skins.r870_waves.default_blueprint = {
		"wpn_fps_shot_r870_body_standard",
		"wpn_fps_shot_r870_b_legendary",
		"wpn_fps_shot_r870_fg_legendary",
		"wpn_fps_shot_r870_s_legendary"
	}
	self.weapon_skins.r870_waves.parts = {
		wpn_fps_shot_r870_body_standard = {
			[Idstring("receiver"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_scale = Vector3(0.78745, 0.787775, 1),
				uv_offset_rot = Vector3(-0.132736, 1.12235, 0)
			}
		},
		wpn_fps_shot_r870_b_legendary = {
			[Idstring("long_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_scale = Vector3(0.834774, 0.930124, 1),
				uv_offset_rot = Vector3(-0.165514, 1.10327, 3.15133)
			},
			[Idstring("mtr_legendary_barrel"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_big_df"),
				uv_offset_rot = Vector3(0.184614, 1.15697, 1.61487),
				uv_scale = Vector3(2.79044, 2.59874, 1),
				base_gradient = Idstring("units/payday2_cash/safes/shared/base_gradient/base_tactical_001_df")
			}
		}
	}
	self.weapon_skins.r870_waves.types = {
		foregrip = {
			pattern_pos = Vector3(-0.842833, 0.130217, 0),
			pattern_tweak = Vector3(2.92392, 0, 1),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_002_df")
		},
		stock = {
			sticker = Idstring("units/payday2_cash/safes/surf/sticker/sticker_legendary_small_df"),
			uv_offset_rot = Vector3(-0.323229, 0.956632, 4.91956),
			pattern_tweak = Vector3(2.73313, 1.5929, 1),
			pattern_pos = Vector3(-0.127355, -0.585261, 0),
			uv_scale = Vector3(19.9523, 20, 1),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_002_df")
		}
	}
	self.weapon_skins.saiga_ginger = {}
	self.weapon_skins.saiga_ginger.name_id = "bm_wskn_saiga_ginger"
	self.weapon_skins.saiga_ginger.desc_id = "bm_wskn_saiga_ginger_desc"
	self.weapon_skins.saiga_ginger.weapon_id = "saiga"
	self.weapon_skins.saiga_ginger.rarity = "common"
	self.weapon_skins.saiga_ginger.bonus = "total_ammo_p1"
	self.weapon_skins.saiga_ginger.reserve_quality = true
	self.weapon_skins.saiga_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.saiga_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_001_df")
	self.weapon_skins.saiga_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/flake_pattern_gradient_01_df")
	self.weapon_skins.saiga_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_01_df")
	self.weapon_skins.saiga_ginger.pattern_tweak = Vector3(0.491297, 1.17332, 1)
	self.weapon_skins.saiga_ginger.pattern_pos = Vector3(-0.642499, 0, 0)
	self.weapon_skins.saiga_ginger.cubemap_pattern_control = Vector3(1, 0, 0)
	self.weapon_skins.p226_ginger = {}
	self.weapon_skins.p226_ginger.name_id = "bm_wskn_p226_ginger"
	self.weapon_skins.p226_ginger.desc_id = "bm_wskn_p226_ginger_desc"
	self.weapon_skins.p226_ginger.weapon_id = "p226"
	self.weapon_skins.p226_ginger.rarity = "common"
	self.weapon_skins.p226_ginger.bonus = "spread_p1"
	self.weapon_skins.p226_ginger.reserve_quality = true
	self.weapon_skins.p226_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.p226_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_002_df")
	self.weapon_skins.p226_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/flake_pattern_gradient_01_df")
	self.weapon_skins.p226_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_01_df")
	self.weapon_skins.p226_ginger.pattern_tweak = Vector3(2.39924, 1.26323, 0)
	self.weapon_skins.p226_ginger.pattern_pos = Vector3(-0.480324, -0.480324, 0)
	self.weapon_skins.new_mp5_ginger = {}
	self.weapon_skins.new_mp5_ginger.name_id = "bm_wskn_new_mp5_ginger"
	self.weapon_skins.new_mp5_ginger.desc_id = "bm_wskn_new_mp5_ginger_desc"
	self.weapon_skins.new_mp5_ginger.weapon_id = "new_mp5"
	self.weapon_skins.new_mp5_ginger.rarity = "common"
	self.weapon_skins.new_mp5_ginger.bonus = "spread_p1"
	self.weapon_skins.new_mp5_ginger.reserve_quality = true
	self.weapon_skins.new_mp5_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.new_mp5_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
	self.weapon_skins.new_mp5_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_003b_df")
	self.weapon_skins.new_mp5_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_03_df")
	self.weapon_skins.new_mp5_ginger.pattern_tweak = Vector3(1, 0, 0)
	self.weapon_skins.new_mp5_ginger.types = {
		foregrip = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003c_df")
		},
		stock = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003c_df")
		}
	}
	self.weapon_skins.m249_ginger = {}
	self.weapon_skins.m249_ginger.name_id = "bm_wskn_m249_ginger"
	self.weapon_skins.m249_ginger.desc_id = "bm_wskn_m249_ginger_desc"
	self.weapon_skins.m249_ginger.weapon_id = "m249"
	self.weapon_skins.m249_ginger.rarity = "common"
	self.weapon_skins.m249_ginger.bonus = "spread_p1"
	self.weapon_skins.m249_ginger.reserve_quality = true
	self.weapon_skins.m249_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.m249_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_004_df")
	self.weapon_skins.m249_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_002_df")
	self.weapon_skins.m249_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_01_df")
	self.weapon_skins.m249_ginger.pattern_tweak = Vector3(2.64073, 0, 0)
	self.weapon_skins.m249_ginger.pattern_pos = Vector3(0.159836, 0.445409, 0)
	self.weapon_skins.m249_ginger.types = {
		gadget = {
			pattern_tweak = Vector3(0.777488, 0, 1)
		},
		barrel = {
			pattern_pos = Vector3(-0.308609, -0.127355, 0),
			pattern_tweak = Vector3(0.348202, 0, 1)
		},
		stock = {
			pattern_pos = Vector3(0.158836, 0.0252805, 0),
			pattern_tweak = Vector3(1.30217, 0, 1)
		},
		upper_reciever = {
			pattern_pos = Vector3(-0.105196, 0.0853599, 0),
			pattern_tweak = Vector3(1.21038, 0, 1)
		},
		magazine = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_004_b_df")
		},
		lower_reciever = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_004_b_df")
		},
		barrel_ext = {
			pattern_pos = Vector3(0, 0.0323599, 0),
			pattern_tweak = Vector3(0.703091, 0, 1)
		}
	}
	self.weapon_skins.x_b92fs_ginger = {}
	self.weapon_skins.x_b92fs_ginger.name_id = "bm_wskn_x_b92fs_ginger"
	self.weapon_skins.x_b92fs_ginger.desc_id = "bm_wskn_x_b92fs_ginger_desc"
	self.weapon_skins.x_b92fs_ginger.weapon_id = "x_b92fs"
	self.weapon_skins.x_b92fs_ginger.rarity = "uncommon"
	self.weapon_skins.x_b92fs_ginger.bonus = "recoil_p1"
	self.weapon_skins.x_b92fs_ginger.reserve_quality = true
	self.weapon_skins.x_b92fs_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.x_b92fs_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_df")
	self.weapon_skins.x_b92fs_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_001_df")
	self.weapon_skins.x_b92fs_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_02_df")
	self.weapon_skins.x_b92fs_ginger.pattern_tweak = Vector3(1.37487, 3.14536, 1)
	self.weapon_skins.x_b92fs_ginger.pattern_pos = Vector3(0.0764394, 0.447488, 0)
	self.weapon_skins.x_b92fs_ginger.parts = {
		wpn_fps_pis_beretta_g_engraved = {
			[Idstring("mtr_engraved"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df")
			}
		},
		wpn_fps_pis_beretta_sl_brigadier = {
			[Idstring("brig"):key()] = {
				pattern_pos = Vector3(-0.032, -0.27599, 0)
			}
		},
		wpn_fps_pis_beretta_sl_std = {
			[Idstring("std_slide"):key()] = {
				pattern_pos = Vector3(0.14444, 0.428488, 0)
			}
		},
		wpn_fps_pis_beretta_body_rail = {
			[Idstring("front_rail"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df"),
				pattern_pos = Vector3(0.00620103, 0, 0)
			}
		},
		wpn_fps_pis_beretta_body_beretta = {
			[Idstring("body"):key()] = {
				pattern_pos = Vector3(-0.039, -0.26572, 0),
				pattern_tweak = Vector3(1.96995, 0, 1)
			}
		}
	}
	self.weapon_skins.x_b92fs_ginger.types = {
		gadget = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df")
		},
		lower_reciever = {
			pattern_pos = Vector3(0.00620103, 0.0157406, 0)
		},
		barrel_ext = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df")
		},
		magazine = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df")
		}
	}
	self.weapon_skins.ksg_ginger = {}
	self.weapon_skins.ksg_ginger.name_id = "bm_wskn_ksg_ginger"
	self.weapon_skins.ksg_ginger.desc_id = "bm_wskn_ksg_ginger_desc"
	self.weapon_skins.ksg_ginger.weapon_id = "ksg"
	self.weapon_skins.ksg_ginger.rarity = "uncommon"
	self.weapon_skins.ksg_ginger.bonus = "spread_n1"
	self.weapon_skins.ksg_ginger.reserve_quality = true
	self.weapon_skins.ksg_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.ksg_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_006_df")
	self.weapon_skins.ksg_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_002_df")
	self.weapon_skins.ksg_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_02_df")
	self.weapon_skins.ksg_ginger.parts = {
		wpn_fps_sho_ksg_body_standard = {
			[Idstring("mat_body"):key()] = {
				pattern_pos = Vector3(0.155297, 0.339011, 0),
				pattern_tweak = Vector3(2.20844, 1.57791, 1)
			}
		},
		wpn_fps_sho_ksg_fg_short = {
			[Idstring("mat_pump"):key()] = {
				pattern_pos = Vector3(0.0322805, 0.387789, 0),
				pattern_tweak = Vector3(1.73146, 1.62287, 1)
			}
		},
		wpn_fps_upg_ns_sho_salvo_large = {
			[Idstring("mtr_salvo_large"):key()] = {
				pattern_pos = Vector3(0.012, -0.995468, 0),
				pattern_tweak = Vector3(1.11138, 1.5769, 1)
			}
		}
	}
	self.weapon_skins.ksg_ginger.types = {
		sight = {
			pattern_tweak = Vector3(0.825187, 1.56293, 1)
		},
		foregrip = {
			pattern_pos = Vector3(-0.006, 0.055, 0),
			pattern_tweak = Vector3(1.54067, 1.54396, 1)
		},
		gadget = {
			pattern_pos = Vector3(0.35917, 0.511806, 0),
			pattern_tweak = Vector3(0.634393, 1.57791, 1)
		},
		barrel = {
			pattern_pos = Vector3(0.0784394, 0.797997, 0),
			pattern_tweak = Vector3(1.25447, 1.5929, 1)
		},
		barrel_ext = {
			pattern_tweak = Vector3(0.348202, 1.57791, 1)
		}
	}
	self.weapon_skins.m1928_ginger = {}
	self.weapon_skins.m1928_ginger.name_id = "bm_wskn_m1928_ginger"
	self.weapon_skins.m1928_ginger.desc_id = "bm_wskn_m1928_ginger_desc"
	self.weapon_skins.m1928_ginger.weapon_id = "m1928"
	self.weapon_skins.m1928_ginger.rarity = "uncommon"
	self.weapon_skins.m1928_ginger.bonus = "spread_p1"
	self.weapon_skins.m1928_ginger.reserve_quality = true
	self.weapon_skins.m1928_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.m1928_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003b_df")
	self.weapon_skins.m1928_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_003b_df")
	self.weapon_skins.m1928_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_09_df")
	self.weapon_skins.m1928_ginger.pattern_tweak = Vector3(7.55068, 1.87761, 0)
	self.weapon_skins.m1928_ginger.pattern_pos = Vector3(-0.0796564, -0.508943, 0)
	self.weapon_skins.m1928_ginger.uv_scale = Vector3(1, 1, 0)
	self.weapon_skins.m1928_ginger.types = {
		foregrip = {
			pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_003_df"),
			pattern_tweak = Vector3(4.25948, 0.25924, 1)
		},
		stock = {
			pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_003_df"),
			pattern_tweak = Vector3(4.64107, 0, 1)
		},
		grip = {
			pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_003_df"),
			pattern_tweak = Vector3(3.35321, 1.38311, 1)
		}
	}
	self.weapon_skins.g22c_ginger = {}
	self.weapon_skins.g22c_ginger.name_id = "bm_wskn_g22c_ginger"
	self.weapon_skins.g22c_ginger.desc_id = "bm_wskn_g22c_ginger_desc"
	self.weapon_skins.g22c_ginger.weapon_id = "g22c"
	self.weapon_skins.g22c_ginger.rarity = "rare"
	self.weapon_skins.g22c_ginger.bonus = "spread_p1"
	self.weapon_skins.g22c_ginger.reserve_quality = true
	self.weapon_skins.g22c_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.g22c_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_008_df")
	self.weapon_skins.g22c_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_002_df")
	self.weapon_skins.g22c_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_02_df")
	self.weapon_skins.g22c_ginger.uv_scale = Vector3(1, 1, 0)
	self.weapon_skins.g22c_ginger.cubemap_pattern_control = Vector3(0.630336, 0.635106, 0)
	self.weapon_skins.g22c_ginger.default_blueprint = {
		"wpn_fps_pis_g22c_body_standard",
		"wpn_fps_upg_fl_pis_crimson",
		"wpn_fps_pis_g18c_g_ergo",
		"wpn_fps_pis_g18c_m_mag_33rnd",
		"wpn_fps_upg_o_rmr",
		"wpn_fps_pis_g22c_b_standard",
		"wpn_fps_upg_ns_pis_ipsccomp"
	}
	self.weapon_skins.g22c_ginger.parts = {
		wpn_fps_pis_g22c_b_standard = {
			[Idstring("mtr_g22c"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/sticker_g22c_df"),
				uv_offset_rot = Vector3(0.109058, 1.05979, 0),
				pattern_pos = Vector3(0.099598, 0.306472, 0),
				uv_scale = Vector3(2.26502, 2.26502, 0),
				pattern_tweak = Vector3(1.77916, 0, 1)
			}
		},
		wpn_fps_upg_ns_pis_large_kac = {
			[Idstring("silencer"):key()] = {
				pattern_pos = Vector3(-0.089196, 0.177455, 0)
			}
		},
		wpn_fps_upg_ns_pis_medium_gem = {
			[Idstring("silencer"):key()] = {
				pattern_pos = Vector3(-0.0656563, 0.165297, 0)
			}
		},
		wpn_fps_pis_g18c_co_1 = {
			[Idstring("comp1"):key()] = {
				pattern_pos = Vector3(0.288853, 0.273773, 0),
				pattern_tweak = Vector3(0.872886, 1.54794, 1)
			}
		},
		wpn_fps_upg_ns_ass_filter = {
			[Idstring("mtr_filter"):key()] = {
				pattern_pos = Vector3(0.0157406, -0.572721, 0),
				pattern_tweak = Vector3(1.20678, 0, 1)
			}
		},
		wpn_fps_upg_ns_pis_meatgrinder = {
			[Idstring("mtr_strikeface"):key()] = {
				pattern_pos = Vector3(-0.251371, 0.226694, 0)
			}
		},
		wpn_fps_upg_ns_pis_jungle = {
			[Idstring("mtr_jungle"):key()] = {
				pattern_pos = Vector3(0.330551, 0.242694, 0),
				pattern_tweak = Vector3(1.25447, 0, 1)
			}
		},
		wpn_fps_upg_pis_ns_flash = {
			[Idstring("mtr_flash"):key()] = {
				pattern_pos = Vector3(0.168376, 0.473726, 0),
				pattern_tweak = Vector3(1.39757, 0, 1)
			}
		},
		wpn_fps_upg_ns_pis_large = {
			[Idstring("large"):key()] = {
				pattern_pos = Vector3(0, -0.433086, 0),
				pattern_tweak = Vector3(1.39757, 0, 1)
			}
		},
		wpn_fps_pis_g22c_body_standard = {
			[Idstring("mtr_magwell"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_008_b_df")
			}
		}
	}
	self.weapon_skins.g22c_ginger.types = {
		gadget = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_008_b_df"),
			pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_01_df"),
			pattern_tweak = Vector3(0.968283, 0, 1)
		},
		lower_reciever = {
			pattern_pos = Vector3(0, 0.890235, 0),
			pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_01_df"),
			pattern_tweak = Vector3(1.68376, 0, 1)
		},
		upper_reciever = {
			pattern_tweak = Vector3(1.39757, 0, 1)
		},
		sight = {
			pattern = Idstring("units/payday2_cash/safes/flake/pattern/pattern_xmasknit_01_df")
		},
		barrel_ext = {
			pattern_pos = Vector3(0, 0.159836, 0)
		},
		grip = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_008_b_df")
		}
	}
	self.weapon_skins.wa2000_ginger = {}
	self.weapon_skins.wa2000_ginger.name_id = "bm_wskn_wa2000_ginger"
	self.weapon_skins.wa2000_ginger.desc_id = "bm_wskn_wa2000_ginger_desc"
	self.weapon_skins.wa2000_ginger.weapon_id = "wa2000"
	self.weapon_skins.wa2000_ginger.rarity = "rare"
	self.weapon_skins.wa2000_ginger.bonus = "recoil_p1"
	self.weapon_skins.wa2000_ginger.reserve_quality = true
	self.weapon_skins.wa2000_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.wa2000_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_009_df")
	self.weapon_skins.wa2000_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_01_df")
	self.weapon_skins.wa2000_ginger.pattern_tweak = Vector3(0.825187, 0, 0)
	self.weapon_skins.wa2000_ginger.pattern_pos = Vector3(-0.652039, 0.0825188, 0)
	self.weapon_skins.wa2000_ginger.uv_scale = Vector3(1, 1, 0)
	self.weapon_skins.wa2000_ginger.default_blueprint = {
		"wpn_fps_snp_wa2000_body_standard",
		"wpn_fps_snp_wa2000_m_standard",
		"wpn_fps_snp_wa2000_s_standard",
		"wpn_fps_snp_wa2000_b_long",
		"wpn_fps_snp_wa2000_g_walnut",
		"wpn_fps_upg_o_leupold",
		"wpn_fps_upg_o_45iron"
	}
	self.weapon_skins.wa2000_ginger.types = {
		stock = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_009b_df"),
			pattern_tweak = Vector3(1, 0, 0)
		},
		grip = {
			sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_helper_df"),
			uv_offset_rot = Vector3(-0.259451, 0.664901, 0),
			pattern_tweak = Vector3(4.73647, 0, 0),
			pattern_pos = Vector3(-0.337228, -0.575721, 0),
			uv_scale = Vector3(14.5651, 13.3732, 1),
			pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
			pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/gradient_flake_009_df")
		}
	}
	self.weapon_skins.akmsu_ginger = {}
	self.weapon_skins.akmsu_ginger.name_id = "bm_wskn_akmsu_ginger"
	self.weapon_skins.akmsu_ginger.desc_id = "bm_wskn_akmsu_ginger_desc"
	self.weapon_skins.akmsu_ginger.weapon_id = "akmsu"
	self.weapon_skins.akmsu_ginger.rarity = "epic"
	self.weapon_skins.akmsu_ginger.bonus = "spread_p1"
	self.weapon_skins.akmsu_ginger.reserve_quality = true
	self.weapon_skins.akmsu_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.akmsu_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_010_df")
	self.weapon_skins.akmsu_ginger.pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/flake_pattern_gradient_01_df")
	self.weapon_skins.akmsu_ginger.pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_01_df")
	self.weapon_skins.akmsu_ginger.pattern_tweak = Vector3(1.39757, 0, 1)
	self.weapon_skins.akmsu_ginger.pattern_pos = Vector3(0.664441, -0.127355, 0)
	self.weapon_skins.akmsu_ginger.default_blueprint = {
		"wpn_fps_smg_akmsu_body_lowerreceiver",
		"wpn_fps_ass_akm_body_upperreceiver_vanilla",
		"wpn_fps_smg_akmsu_b_standard",
		"wpn_fps_upg_o_cmore",
		"wpn_fps_upg_ass_ns_surefire",
		"wpn_fps_upg_o_ak_scopemount",
		"wpn_fps_smg_akmsu_fg_rail",
		"wpn_fps_upg_ak_s_solidstock",
		"wpn_fps_upg_ak_m_quad"
	}
	self.weapon_skins.akmsu_ginger.parts = {
		wpn_fps_upg_m4_s_ubr = {
			[Idstring("mtr_ubr"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_wonderland_df"),
				uv_scale = Vector3(1.59757, 1.54989, 1),
				uv_offset_rot = Vector3(0, 1.06511, 0)
			}
		},
		wpn_upg_ak_s_psl = {
			[Idstring("psl"):key()] = {
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/flake_pattern_gradient_01_df"),
				pattern_tweak = Vector3(0, 0, 1)
			}
		},
		wpn_fps_upg_ak_s_solidstock = {
			[Idstring("mtr_solid"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_wonderland_df"),
				uv_offset_rot = Vector3(0.0443599, 0.998331, 0),
				pattern_pos = Vector3(0, -0.29907, 0),
				uv_scale = Vector3(1.1685, 1.26385, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_001_df"),
				pattern_tweak = Vector3(0, 0, 1)
			}
		},
		wpn_fps_upg_ak_m_quad = {
			[Idstring("mtr_quadstack"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_wonderland_df"),
				uv_scale = Vector3(0.882449, 0.882449, 1),
				uv_offset_rot = Vector3(-0.232292, 1.2082, 0)
			}
		}
	}
	self.weapon_skins.akmsu_ginger.types = {
		sight = {
			pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/flake_pattern_gradient_01_df"),
			pattern_tweak = Vector3(0, 0, 1)
		},
		magazine = {
			sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_wonderland_df"),
			uv_scale = Vector3(1.02547, 1.02547, 1),
			uv_offset_rot = Vector3(-0.232292, 1.17005, 0),
			pattern_tweak = Vector3(0, 0, 1)
		},
		stock = {
			base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_001_df"),
			uv_offset_rot = Vector3(0.00620103, 1.03649, 0),
			pattern_pos = Vector3(-0.814214, 0, 0),
			uv_scale = Vector3(1.26385, 1.1685, 1),
			sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_wonderland_df"),
			pattern_tweak = Vector3(0, 0, 1)
		}
	}
	self.weapon_skins.x_1911_ginger = {}
	self.weapon_skins.x_1911_ginger.name_id = "bm_wskn_x_1911_ginger"
	self.weapon_skins.x_1911_ginger.desc_id = "bm_wskn_x_1911_ginger_desc"
	self.weapon_skins.x_1911_ginger.weapon_id = "x_1911"
	self.weapon_skins.x_1911_ginger.rarity = "legendary"
	self.weapon_skins.x_1911_ginger.bonus = "recoil_p1"
	self.weapon_skins.x_1911_ginger.reserve_quality = true
	self.weapon_skins.x_1911_ginger.texture_bundle_folder = "cash/safes/flake"
	self.weapon_skins.x_1911_ginger.unique_name_id = "bm_wskn_x_1911_ginger"
	self.weapon_skins.x_1911_ginger.locked = true
	self.weapon_skins.x_1911_ginger.base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_005_b_df")
	self.weapon_skins.x_1911_ginger.default_blueprint = {
		"wpn_fps_pis_1911_g_legendary",
		"wpn_fps_pis_1911_fl_legendary",
		"wpn_fps_pis_1911_body_standard",
		"wpn_fps_pis_1911_b_long",
		"wpn_fps_pis_1911_o_long",
		"wpn_fps_pis_1911_m_standard"
	}
	self.weapon_skins.x_1911_ginger.parts = {
		wpn_fps_pis_1911_o_long = {
			[Idstring("sights"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_b_long = {
			[Idstring("slide_long"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				uv_offset_rot = Vector3(-0.146434, 1.01741, 0),
				pattern_pos = Vector3(0.301932, 0, 0),
				uv_scale = Vector3(1.78827, 2.88479, 1),
				pattern_tweak = Vector3(1.06368, 0, 1),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			},
			[Idstring("barrel_vented"):key()] = {
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df")
			}
		},
		wpn_fps_pis_1911_fl_legendary = {
			[Idstring("mtr_legend_laser"):key()] = {
				sticker = Idstring("units/payday2_cash/safes/flake/sticker/flake_sticker_swirl_df"),
				uv_offset_rot = Vector3(0.158836, 1.00787, 3.36112),
				pattern_tweak = Vector3(1.87455, 0, 1),
				pattern = Idstring("units/payday2_cash/safes/flake/pattern/flake_pattern_04_df"),
				uv_scale = Vector3(2.78944, 6.03132, 1),
				base_gradient = Idstring("units/payday2_cash/safes/flake/base_gradient/base_flake_003_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/flake/pattern_gradient/pattern_gradient_001_df")
			}
		},
		wpn_fps_pis_1911_g_legendary = {
			[Idstring("mtr_legend_grip"):key()] = {
				pattern_tweak = Vector3(5.21345, 3.04644, 1),
				pattern = Idstring("units/payday2_cash/safes/dallas/pattern/pattern_wood_df"),
				pattern_gradient = Idstring("units/payday2_cash/safes/dallas/pattern_gradient/gradient_dallas_wood_001_df")
			}
		}
	}
end
