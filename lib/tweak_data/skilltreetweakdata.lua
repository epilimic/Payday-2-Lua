SkillTreeTweakData = SkillTreeTweakData or class()
function SkillTreeTweakData:init()
	local digest = function(value)
		return Application:digest_value(value, true)
	end
	self.tier_unlocks = {
		digest(1),
		digest(5),
		digest(10),
		digest(20),
		digest(30),
		digest(40)
	}
	self.costs = {
		unlock_tree = digest(1),
		default = digest(1),
		pro = digest(3),
		hightier = digest(4),
		hightierpro = digest(8)
	}
	self.unlock_tree_cost = {
		digest(0),
		digest(0),
		digest(0),
		digest(0),
		digest(0)
	}
	self.HIDE_TIER_BONUS = true
	self.skills = {}
	self.skills.mastermind = {
		["name_id"] = "menu_mastermind",
		["desc_id"] = "menu_mastermind_desc",
		["icon_xy"] = {2, 7},
		[1] = {
			upgrades = {"doctor_bag"},
			cost = self.costs.unlock_tree,
			desc_id = "menu_mastermind_tier_1"
		},
		[2] = {
			upgrades = {},
			desc_id = "menu_mastermind_tier_2"
		},
		[3] = {
			upgrades = {},
			desc_id = "menu_mastermind_tier_3"
		},
		[4] = {
			upgrades = {},
			desc_id = "menu_mastermind_tier_4"
		},
		[5] = {
			upgrades = {},
			desc_id = "menu_mastermind_tier_5"
		},
		[6] = {
			upgrades = {},
			desc_id = "menu_mastermind_tier_6"
		}
	}
	self.skills.enforcer = {
		["name_id"] = "menu_enforcer",
		["desc_id"] = "menu_enforcer_desc",
		["icon_xy"] = {1, 0},
		[1] = {
			upgrades = {"ammo_bag"},
			cost = self.costs.unlock_tree,
			desc_id = "menu_menu_enforcer_tier_1"
		},
		[2] = {
			upgrades = {},
			desc_id = "menu_menu_enforcer_tier_2"
		},
		[3] = {
			upgrades = {},
			desc_id = "menu_menu_enforcer_tier_3"
		},
		[4] = {
			upgrades = {},
			desc_id = "menu_menu_enforcer_tier_4"
		},
		[5] = {
			upgrades = {},
			desc_id = "menu_menu_enforcer_tier_5"
		},
		[6] = {
			upgrades = {},
			desc_id = "menu_menu_enforcer_tier_6"
		}
	}
	self.skills.technician = {
		["name_id"] = "menu_technician",
		["desc_id"] = "menu_technician_desc",
		["icon_xy"] = {7, 4},
		[1] = {
			upgrades = {"trip_mine"},
			cost = self.costs.unlock_tree,
			desc_id = "menu_technician_tier_1"
		},
		[2] = {
			upgrades = {},
			desc_id = "menu_technician_tier_2"
		},
		[3] = {
			upgrades = {},
			desc_id = "menu_technician_tier_3"
		},
		[4] = {
			upgrades = {},
			desc_id = "menu_technician_tier_4"
		},
		[5] = {
			upgrades = {},
			desc_id = "menu_technician_tier_5"
		},
		[6] = {
			upgrades = {},
			desc_id = "menu_technician_tier_6"
		}
	}
	self.skills.ghost = {
		["name_id"] = "menu_ghost",
		["desc_id"] = "menu_ghost_desc",
		["icon_xy"] = {1, 4},
		[1] = {
			upgrades = {
				"ecm_jammer",
				"ecm_jammer_affects_cameras"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_ghost_tier_1"
		},
		[2] = {
			upgrades = {},
			desc_id = "menu_ghost_tier_2"
		},
		[3] = {
			upgrades = {},
			desc_id = "menu_ghost_tier_3"
		},
		[4] = {
			upgrades = {},
			desc_id = "menu_ghost_tier_4"
		},
		[5] = {
			upgrades = {},
			desc_id = "menu_ghost_tier_5"
		},
		[6] = {
			upgrades = {},
			desc_id = "menu_ghost_tier_6"
		}
	}
	self.skills.hoxton = {
		["name_id"] = "menu_hoxton_pack",
		["desc_id"] = "menu_hoxton_pack_desc",
		["icon_xy"] = {3, 10},
		[1] = {
			upgrades = {
				"first_aid_kit"
			},
			cost = self.costs.unlock_tree,
			desc_id = "menu_hoxton_tier_1"
		},
		[2] = {
			upgrades = {},
			desc_id = "menu_hoxton_tier_2"
		},
		[3] = {
			upgrades = {},
			desc_id = "menu_hoxton_tier_3"
		},
		[4] = {
			upgrades = {},
			desc_id = "menu_hoxton_tier_4"
		},
		[5] = {
			upgrades = {},
			desc_id = "menu_hoxton_tier_5"
		},
		[6] = {
			upgrades = {},
			desc_id = "menu_hoxton_tier_6"
		}
	}
	self.skills.black_marketeer = {
		["name_id"] = "menu_black_marketeer",
		["desc_id"] = "menu_black_marketeer_desc",
		["icon_xy"] = {2, 10},
		[1] = {
			upgrades = {
				"player_hostage_health_regen_addend_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_hostage_health_regen_addend_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.gun_fighter = {
		["name_id"] = "menu_gun_fighter",
		["desc_id"] = "menu_gun_fighter_desc",
		["icon_xy"] = {0, 9},
		[1] = {
			upgrades = {
				"pistol_reload_speed_multiplier",
				"akimbo_reload_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"akimbo_damage_addend",
				"pistol_damage_addend"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.combat_medic = {
		["name_id"] = "menu_combat_medic",
		["desc_id"] = "menu_combat_medic_desc",
		["icon_xy"] = {5, 7},
		[1] = {
			upgrades = {
				"temporary_combat_medic_damage_multiplier1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_revive_health_boost"
			},
			cost = self.costs.pro
		}
	}
	self.skills.control_freak = {
		["name_id"] = "menu_control_freak",
		["desc_id"] = "menu_control_freak_desc",
		["icon_xy"] = {1, 10},
		["prerequisites"] = {"joker"},
		[1] = {
			upgrades = {
				"player_minion_master_speed_multiplier",
				"player_passive_convert_enemies_health_multiplier_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_minion_master_health_multiplier",
				"player_passive_convert_enemies_health_multiplier_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.leadership = {
		["name_id"] = "menu_leadership",
		["desc_id"] = "menu_leadership_desc",
		["icon_xy"] = {7, 7},
		[1] = {
			upgrades = {
				"team_pistol_recoil_index_addend",
				"team_akimbo_recoil_index_addend",
				"team_pistol_suppression_recoil_index_addend",
				"team_akimbo_suppression_recoil_index_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"team_weapon_recoil_index_addend",
				"team_weapon_suppression_recoil_index_addend"
			},
			cost = self.costs.pro
		}
	}
	self.skills.inside_man = {
		["name_id"] = "menu_inside_man",
		["desc_id"] = "menu_inside_man_desc",
		["icon_xy"] = {6, 7},
		[1] = {
			upgrades = {
				"player_civ_calming_alerts",
				"player_civ_intimidation_mul"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_additional_assets"
			},
			cost = self.costs.pro
		}
	}
	self.skills.target_mark = {
		["name_id"] = "menu_target_mark",
		["desc_id"] = "menu_target_mark_desc",
		["icon_xy"] = {3, 7},
		[1] = {
			upgrades = {},
			cost = self.costs.default
		},
		[2] = {
			cost = self.costs.pro
		}
	}
	self.skills.dominator = {
		["name_id"] = "menu_dominator",
		["desc_id"] = "menu_dominator_desc",
		["icon_xy"] = {2, 8},
		[1] = {
			upgrades = {
				"player_intimidate_enemies"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_intimidate_range_mul",
				"player_intimidate_aura"
			},
			cost = self.costs.pro
		}
	}
	self.skills.fast_learner = {
		["name_id"] = "menu_fast_learner",
		["desc_id"] = "menu_fast_learner_desc",
		["icon_xy"] = {0, 10},
		[1] = {
			upgrades = {
				"player_revive_damage_reduction_level_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_revive_damage_reduction_level_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.stockholm_syndrome = {
		["name_id"] = "menu_stockholm_syndrome",
		["desc_id"] = "menu_stockholm_syndrome_desc",
		["icon_xy"] = {3, 8},
		[1] = {
			upgrades = {
				"player_civilian_reviver"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_civilian_gives_ammo"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.cable_guy = {
		["name_id"] = "menu_cable_guy",
		["desc_id"] = "menu_cable_guy_desc",
		["icon_xy"] = {4, 7},
		[1] = {
			upgrades = {
				"cable_tie_interact_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"cable_tie_quantity"
			},
			cost = self.costs.pro
		}
	}
	self.skills.tactician = {
		["name_id"] = "menu_tactician",
		["desc_id"] = "menu_tactician_desc",
		["icon_xy"] = {3, 7},
		[1] = {
			upgrades = {
				"player_marked_enemy_extra_damage"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_buy_spotter_asset"
			},
			cost = self.costs.pro
		}
	}
	self.skills.triathlete = {
		["name_id"] = "menu_triathlete",
		["desc_id"] = "menu_triathlete_desc",
		["icon_xy"] = {1, 8},
		[1] = {
			upgrades = {
				"player_stamina_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"team_stamina_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.kilmer = {
		["name_id"] = "menu_kilmer",
		["desc_id"] = "menu_kilmer_desc",
		["icon_xy"] = {1, 9},
		[1] = {
			upgrades = {
				"assault_rifle_reload_speed_multiplier",
				"snp_reload_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"assault_rifle_move_spread_index_addend",
				"player_run_and_reload",
				"snp_move_spread_index_addend"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.equilibrium = {
		["name_id"] = "menu_equilibrium",
		["desc_id"] = "menu_equilibrium_desc",
		["icon_xy"] = {3, 9},
		[1] = {
			upgrades = {
				"pistol_spread_index_addend",
				"pistol_swap_speed_multiplier",
				"akimbo_spread_index_addend",
				"akimbo_swap_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"pistol_fire_rate_multiplier",
				"akimbo_fire_rate_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.negotiator = {
		["name_id"] = "menu_negotiator",
		["desc_id"] = "menu_negotiator_desc",
		["icon_xy"] = {7, 8},
		[1] = {
			cost = self.costs.hightier
		},
		[2] = {
			cost = self.costs.hightierpro
		}
	}
	self.skills.medic_2x = {
		["name_id"] = "menu_medic_2x",
		["desc_id"] = "menu_medic_2x_desc",
		["icon_xy"] = {5, 8},
		[1] = {
			upgrades = {
				"doctor_bag_quantity"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"doctor_bag_amount_increase1"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.joker = {
		["name_id"] = "menu_joker",
		["desc_id"] = "menu_joker_desc",
		["icon_xy"] = {6, 8},
		["prerequisites"] = {"dominator"},
		[1] = {
			upgrades = {
				"player_convert_enemies",
				"player_convert_enemies_max_minions_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_convert_enemies_health_multiplier",
				"player_convert_enemies_damage_multiplier",
				"player_convert_enemies_interaction_speed_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.inspire = {
		["name_id"] = "menu_inspire",
		["desc_id"] = "menu_inspire_desc",
		["icon_xy"] = {4, 9},
		[1] = {
			upgrades = {
				"player_revive_interaction_speed_multiplier",
				"player_morale_boost"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_long_dis_revive"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.pistol_messiah = {
		["name_id"] = "menu_pistol_messiah",
		["desc_id"] = "menu_pistol_messiah_desc",
		["icon_xy"] = {2, 9},
		[1] = {
			upgrades = {
				"player_pistol_revive_from_bleed_out_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_pistol_revive_from_bleed_out_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.ammo_reservoir = {
		["name_id"] = "menu_ammo_reservoir",
		["desc_id"] = "menu_ammo_reservoir_desc",
		["icon_xy"] = {4, 5},
		[1] = {
			upgrades = {
				"temporary_no_ammo_cost_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"temporary_no_ammo_cost_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.demolition_man = {
		["name_id"] = "menu_demolition_man",
		["desc_id"] = "menu_demolition_man_desc",
		["icon_xy"] = {4, 5},
		[1] = {
			upgrades = {},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {},
			cost = self.costs.pro
		}
	}
	self.skills.oppressor = {
		["name_id"] = "menu_oppressor",
		["desc_id"] = "menu_oppressor_desc",
		["icon_xy"] = {7, 0},
		[1] = {
			upgrades = {
				"player_suppression_bonus"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_suppression_mul_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.steroids = {
		["name_id"] = "menu_steroids",
		["desc_id"] = "menu_steroids_desc",
		["icon_xy"] = {4, 0},
		[1] = {
			upgrades = {
				"player_non_special_melee_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_melee_damage_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.bandoliers = {
		["name_id"] = "menu_bandoliers",
		["desc_id"] = "menu_bandoliers_desc",
		["icon_xy"] = {3, 0},
		[1] = {
			upgrades = {
				"extra_ammo_multiplier1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_pick_up_ammo_multiplier",
				"player_pick_up_ammo_multiplier_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.pack_mule = {
		["name_id"] = "menu_pack_mule",
		["desc_id"] = "menu_pack_mule_desc",
		["icon_xy"] = {6, 0},
		[1] = {
			upgrades = {
				"carry_movement_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"carry_throw_distance_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.shotgun_impact = {
		["name_id"] = "menu_shotgun_impact",
		["desc_id"] = "menu_shotgun_impact_desc",
		["icon_xy"] = {5, 0},
		[1] = {
			upgrades = {
				"shotgun_recoil_index_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"shotgun_damage_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.portable_saw = {
		["name_id"] = "menu_portable_saw",
		["desc_id"] = "menu_portable_saw_desc",
		["icon_xy"] = {0, 1},
		[1] = {
			upgrades = {"saw"},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"saw_extra_ammo_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.tough_guy = {
		["name_id"] = "menu_tough_guy",
		["desc_id"] = "menu_tough_guy_desc",
		["icon_xy"] = {1, 1},
		[1] = {
			upgrades = {
				"player_damage_shake_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_bleed_out_health_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.underdog = {
		["name_id"] = "menu_underdog",
		["desc_id"] = "menu_underdog_desc",
		["icon_xy"] = {2, 1},
		[1] = {
			upgrades = {
				"player_damage_multiplier_outnumbered"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_damage_dampener_outnumbered"
			},
			cost = self.costs.pro
		}
	}
	self.skills.juggernaut = {
		["name_id"] = "menu_juggernaut",
		["desc_id"] = "menu_juggernaut_desc",
		["icon_xy"] = {3, 1},
		[1] = {
			upgrades = {
				"body_armor6"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_shield_knock",
				"player_run_and_shoot"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.from_the_hip = {
		["name_id"] = "menu_from_the_hip",
		["desc_id"] = "menu_from_the_hip_desc",
		["icon_xy"] = {4, 1},
		[1] = {
			upgrades = {
				"shotgun_hip_fire_spread_index_addend"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"weapon_hip_fire_spread_index_addend"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.shotgun_cqb = {
		["name_id"] = "menu_shotgun_cqb",
		["desc_id"] = "menu_shotgun_cqb_desc",
		["icon_xy"] = {5, 1},
		[1] = {
			upgrades = {
				"shotgun_reload_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"shotgun_enter_steelsight_speed_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.shades = {
		["name_id"] = "menu_shades",
		["desc_id"] = "menu_shades_desc",
		["icon_xy"] = {6, 1},
		[1] = {
			upgrades = {
				"player_flashbang_multiplier_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_flashbang_multiplier_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.ammo_2x = {
		["name_id"] = "menu_ammo_2x",
		["desc_id"] = "menu_ammo_2x_desc",
		["icon_xy"] = {7, 1},
		[1] = {
			upgrades = {
				"ammo_bag_quantity"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"ammo_bag_ammo_increase1"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.carbon_blade = {
		["name_id"] = "menu_carbon_blade",
		["desc_id"] = "menu_carbon_blade_desc",
		["icon_xy"] = {0, 2},
		["prerequisites"] = {
			"portable_saw"
		},
		[1] = {
			upgrades = {
				"player_saw_speed_multiplier_1",
				"saw_lock_damage_multiplier_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_saw_speed_multiplier_2",
				"saw_lock_damage_multiplier_2",
				"saw_enemy_slicer",
				"saw_secondary"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.show_of_force = {
		["name_id"] = "menu_show_of_force",
		["desc_id"] = "menu_show_of_force_desc",
		["icon_xy"] = {1, 2},
		[1] = {
			upgrades = {
				"player_primary_weapon_when_downed"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_armor_regen_timer_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.wolverine = {
		["name_id"] = "menu_wolverine",
		["desc_id"] = "menu_wolverine_desc",
		["icon_xy"] = {2, 2},
		[1] = {
			upgrades = {
				"player_melee_damage_health_ratio_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_damage_health_ratio_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.overkill = {
		["name_id"] = "menu_overkill",
		["desc_id"] = "menu_overkill_desc",
		["icon_xy"] = {3, 2},
		[1] = {
			upgrades = {
				"player_overkill_damage_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_overkill_all_weapons"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.mag_plus = {
		["name_id"] = "menu_mag_plus",
		["desc_id"] = "menu_mag_plus_desc",
		["icon_xy"] = {2, 0},
		[1] = {
			upgrades = {
				"weapon_clip_ammo_increase_1",
				"akimbo_clip_ammo_increase_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"weapon_clip_ammo_increase_2",
				"akimbo_clip_ammo_increase_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.iron_man = {
		["name_id"] = "menu_iron_man",
		["desc_id"] = "menu_iron_man_desc",
		["icon_xy"] = {6, 4},
		[1] = {
			upgrades = {
				"player_armor_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"team_armor_regen_time_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.rifleman = {
		["name_id"] = "menu_rifleman",
		["desc_id"] = "menu_rifleman_desc",
		["icon_xy"] = {0, 5},
		[1] = {
			upgrades = {
				"assault_rifle_enter_steelsight_speed_multiplier",
				"snp_enter_steelsight_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"assault_rifle_zoom_increase",
				"snp_zoom_increase"
			},
			cost = self.costs.pro
		}
	}
	self.skills.blast_radius = {
		["name_id"] = "menu_blast_radius",
		["desc_id"] = "menu_blast_radius_desc",
		["icon_xy"] = {7, 9},
		[1] = {
			upgrades = {
				"trip_mine_explosion_size_multiplier_2"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_carry_sentry_and_trip"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.insulation = {
		["name_id"] = "menu_insulation",
		["desc_id"] = "menu_insulation_desc",
		["icon_xy"] = {3, 5},
		[1] = {
			upgrades = {
				"player_taser_malfunction"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_taser_self_shock"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.hardware_expert = {
		["name_id"] = "menu_hardware_expert",
		["desc_id"] = "menu_hardware_expert_desc",
		["icon_xy"] = {5, 5},
		[1] = {
			upgrades = {
				"player_drill_fix_interaction_speed_multiplier",
				"player_trip_mine_deploy_time_multiplier_2"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_drill_autorepair",
				"player_sentry_gun_deploy_time_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.trip_mine_expert = {
		["name_id"] = "menu_trip_mine_expert",
		["desc_id"] = "menu_trip_mine_expert_desc",
		["icon_xy"] = {4, 6},
		[1] = {
			upgrades = {
				"trip_mine_can_switch_on_off"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"trip_mine_sensor_toggle",
				"trip_mine_sensor_highlight"
			},
			cost = self.costs.pro
		}
	}
	self.skills.sharpshooter = {
		["name_id"] = "menu_sharpshooter",
		["desc_id"] = "menu_sharpshooter_desc",
		["icon_xy"] = {6, 5},
		[1] = {
			upgrades = {
				"weapon_single_spread_index_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"assault_rifle_recoil_index_addend",
				"snp_recoil_index_addend"
			},
			cost = self.costs.pro
		}
	}
	self.skills.sentry_gun = {
		["name_id"] = "menu_sentry_gun",
		["desc_id"] = "menu_sentry_gun_desc",
		["icon_xy"] = {7, 5},
		[1] = {
			upgrades = {"sentry_gun"},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"sentry_gun_armor_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.sentry_targeting_package = {
		["name_id"] = "menu_sentry_targeting_package",
		["desc_id"] = "menu_sentry_targeting_package_desc",
		["icon_xy"] = {1, 6},
		["prerequisites"] = {"sentry_gun"},
		[1] = {
			upgrades = {
				"sentry_gun_spread_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_rot_speed_multiplier",
				"sentry_gun_extra_ammo_multiplier_1"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.sentry_2_0 = {
		["name_id"] = "menu_sentry_2_0",
		["desc_id"] = "menu_sentry_2_0_desc",
		["icon_xy"] = {5, 6},
		["prerequisites"] = {"sentry_gun"},
		[1] = {
			upgrades = {
				"sentry_gun_can_reload"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_shield"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.drill_expert = {
		["name_id"] = "menu_drill_expert",
		["desc_id"] = "menu_drill_expert_desc",
		["icon_xy"] = {3, 6},
		[1] = {
			upgrades = {
				"player_drill_speed_multiplier1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_drill_speed_multiplier2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.military_grade = {
		["name_id"] = "menu_military_grade",
		["desc_id"] = "menu_military_grade_desc",
		["icon_xy"] = {4, 6},
		[1] = {
			upgrades = {
				"trip_mine_quantity_increase_2"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {},
			cost = self.costs.hightierpro
		}
	}
	self.skills.dye_pack_removal = {
		["name_id"] = "menu_dye_pack_removal",
		["desc_id"] = "menu_dye_pack_removal_desc",
		["icon_xy"] = {0, 6},
		[1] = {
			upgrades = {
				"player_dye_pack_chance_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_dye_pack_cash_loss_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.silent_drilling = {
		["name_id"] = "menu_silent_drilling",
		["desc_id"] = "menu_silent_drilling_desc",
		["icon_xy"] = {2, 6},
		[1] = {
			upgrades = {
				"player_drill_alert"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_silent_drill"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.discipline = {
		["name_id"] = "menu_discipline",
		["desc_id"] = "menu_discipline_desc",
		["icon_xy"] = {6, 6},
		[1] = {
			upgrades = {
				"player_interacting_damage_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_steelsight_when_downed"
			},
			cost = self.costs.pro
		}
	}
	self.skills.trip_miner = {
		["name_id"] = "menu_trip_miner",
		["desc_id"] = "menu_trip_miner_desc",
		["icon_xy"] = {2, 5},
		[1] = {
			upgrades = {
				"trip_mine_quantity_increase_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_trip_mine_deploy_time_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.shaped_charge = {
		["name_id"] = "menu_shaped_charge",
		["desc_id"] = "menu_shaped_charge_desc",
		["icon_xy"] = {0, 7},
		[1] = {
			upgrades = {
				"trip_mine_quantity_increase_3"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_trip_mine_shaped_charge"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.master_craftsman = {
		["name_id"] = "menu_master_craftsman",
		["desc_id"] = "menu_master_craftsman_desc",
		["icon_xy"] = {6, 9},
		[1] = {
			upgrades = {
				"trip_mine_explosion_size_multiplier_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"trip_mine_marked_enemy_extra_damage"
			},
			cost = self.costs.pro
		}
	}
	self.skills.sentry_gun_2x = {
		["name_id"] = "menu_sentry_gun_2x",
		["desc_id"] = "menu_sentry_gun_2x_desc",
		["icon_xy"] = {7, 6},
		["prerequisites"] = {"sentry_gun"},
		[1] = {
			upgrades = {
				"sentry_gun_quantity_increase"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"sentry_gun_damage_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.ecm_booster = {
		["name_id"] = "menu_ecm_booster",
		["desc_id"] = "menu_ecm_booster_desc",
		["icon_xy"] = {6, 3},
		[1] = {
			upgrades = {
				"ecm_jammer_duration_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"ecm_jammer_can_open_sec_doors"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.sprinter = {
		["name_id"] = "menu_sprinter",
		["desc_id"] = "menu_sprinter_desc",
		["icon_xy"] = {7, 3},
		[1] = {
			upgrades = {
				"player_stamina_regen_timer_multiplier",
				"player_stamina_regen_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_run_dodge_chance",
				"player_run_speed_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.smg_training = {
		["name_id"] = "menu_smg_training",
		["desc_id"] = "menu_smg_training_desc",
		["icon_xy"] = {3, 3},
		[1] = {
			upgrades = {
				"smg_reload_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"smg_recoil_multiplier"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.smg_master = {
		["name_id"] = "menu_smg_master",
		["desc_id"] = "menu_smg_master_desc",
		["icon_xy"] = {3, 3},
		[1] = {
			upgrades = {
				"smg_reload_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"smg_fire_rate_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.transporter = {
		["name_id"] = "menu_transporter",
		["desc_id"] = "menu_transporter_desc",
		["icon_xy"] = {4, 3},
		[1] = {
			upgrades = {
				"carry_interact_speed_multiplier_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"carry_interact_speed_multiplier_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.cat_burglar = {
		["name_id"] = "menu_cat_burglar",
		["desc_id"] = "menu_cat_burglar_desc",
		["icon_xy"] = {0, 4},
		[1] = {
			upgrades = {
				"player_fall_damage_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_fall_health_damage_multiplier",
				"player_respawn_time_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.chameleon = {
		["name_id"] = "menu_chameleon",
		["desc_id"] = "menu_chameleon_desc",
		["icon_xy"] = {5, 3},
		[1] = {
			upgrades = {
				"player_suspicion_bonus",
				"player_sec_camera_highlight_mask_off",
				"player_special_enemy_highlight_mask_off"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_camouflage_bonus"
			},
			cost = self.costs.pro
		}
	}
	self.skills.cleaner = {
		["name_id"] = "menu_cleaner",
		["desc_id"] = "menu_cleaner_desc",
		["icon_xy"] = {7, 2},
		[1] = {
			upgrades = {
				"player_buy_bodybags_asset",
				"weapon_special_damage_taken_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_corpse_dispose_amount_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.ecm_2x = {
		["name_id"] = "menu_ecm_2x",
		["desc_id"] = "menu_ecm_2x_desc",
		["icon_xy"] = {3, 4},
		[1] = {
			upgrades = {
				"ecm_jammer_quantity_increase_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"ecm_jammer_duration_multiplier_2",
				"ecm_jammer_feedback_duration_boost_2",
				"ecm_jammer_affects_pagers"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.assassin = {
		["name_id"] = "menu_assassin",
		["desc_id"] = "menu_assassin_desc",
		["icon_xy"] = {0, 3},
		[1] = {
			upgrades = {
				"player_walk_speed_multiplier",
				"player_crouch_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.pro
		}
	}
	self.skills.martial_arts = {
		["name_id"] = "menu_martial_arts",
		["desc_id"] = "menu_martial_arts_desc",
		["icon_xy"] = {1, 3},
		[1] = {
			upgrades = {
				"player_melee_knockdown_mul"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_melee_damage_dampener"
			},
			cost = self.costs.pro
		}
	}
	self.skills.nine_lives = {
		["name_id"] = "menu_nine_lives",
		["desc_id"] = "menu_nine_lives_desc",
		["icon_xy"] = {5, 2},
		[1] = {
			upgrades = {
				"player_additional_lives_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_cheat_death_chance"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.ecm_feedback = {
		["name_id"] = "menu_ecm_feedback",
		["desc_id"] = "menu_ecm_feedback_desc",
		["icon_xy"] = {6, 2},
		[1] = {
			upgrades = {
				"ecm_jammer_can_activate_feedback"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"ecm_jammer_feedback_duration_boost",
				"ecm_jammer_interaction_speed_multiplier",
				"ecm_jammer_can_retrigger"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.moving_target = {
		["name_id"] = "menu_moving_target",
		["desc_id"] = "menu_moving_target_desc",
		["icon_xy"] = {2, 4},
		[1] = {
			upgrades = {
				"player_can_strafe_run"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_can_free_run"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.scavenger = {
		["name_id"] = "menu_scavenger",
		["desc_id"] = "menu_scavenger_desc",
		["icon_xy"] = {2, 3},
		[1] = {
			upgrades = {
				"player_small_loot_multiplier1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_small_loot_multiplier2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.hitman = {
		["name_id"] = "menu_hitman",
		["desc_id"] = "menu_hitman_desc",
		["icon_xy"] = {5, 9},
		[1] = {
			upgrades = {
				"weapon_silencer_damage_multiplier_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"weapon_silencer_damage_multiplier_2",
				"weapon_silencer_armor_piercing_chance_1"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.silence_expert = {
		["name_id"] = "menu_silence_expert",
		["desc_id"] = "menu_silence_expert_desc",
		["icon_xy"] = {4, 4},
		[1] = {
			upgrades = {
				"weapon_silencer_recoil_index_addend",
				"weapon_silencer_enter_steelsight_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"weapon_silencer_spread_index_addend",
				"weapon_silencer_armor_piercing_chance_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.good_luck_charm = {
		["name_id"] = "menu_good_luck_charm",
		["desc_id"] = "menu_good_luck_charm_desc",
		["icon_xy"] = {4, 2},
		[1] = {
			upgrades = {
				"player_tape_loop_duration_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_tape_loop_duration_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.disguise = {
		["name_id"] = "menu_disguise",
		["desc_id"] = "menu_disguise_desc",
		["icon_xy"] = {6, 4},
		[1] = {
			cost = self.costs.hightier
		},
		[2] = {
			cost = self.costs.hightierpro
		}
	}
	self.skills.magic_touch = {
		["name_id"] = "menu_magic_touch",
		["desc_id"] = "menu_magic_touch_desc",
		["icon_xy"] = {5, 4},
		[1] = {
			upgrades = {
				"player_pick_lock_easy",
				"player_pick_lock_easy_speed_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_pick_lock_hard",
				"player_pick_lock_easy_speed_multiplier_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.freedom_call = {
		["name_id"] = "menu_freedom_call",
		["desc_id"] = "menu_freedom_call_desc",
		["icon_xy"] = {5, 10},
		[1] = {
			upgrades = {
				"player_climb_speed_multiplier_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_on_zipline_dodge_chance"
			},
			cost = self.costs.pro
		}
	}
	self.skills.hidden_blade = {
		["name_id"] = "menu_hidden_blade",
		["desc_id"] = "menu_hidden_blade_desc",
		["icon_xy"] = {4, 10},
		[1] = {
			upgrades = {
				"player_melee_concealment_modifier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_silent_kill"
			},
			cost = self.costs.pro
		}
	}
	self.skills.tea_time = {
		["name_id"] = "menu_tea_time",
		["desc_id"] = "menu_tea_time_desc",
		["icon_xy"] = {1, 11},
		[1] = {
			upgrades = {
				"first_aid_kit_deploy_time_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"first_aid_kit_damage_reduction_upgrade"
			},
			cost = self.costs.pro
		}
	}
	self.skills.awareness = {
		["name_id"] = "menu_awareness",
		["desc_id"] = "menu_awareness_desc",
		["icon_xy"] = {7, 10},
		[1] = {
			upgrades = {
				"player_movement_speed_multiplier"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_steelsight_normal_movement_speed"
			},
			cost = self.costs.pro
		}
	}
	self.skills.alpha_dog = {
		["name_id"] = "menu_alpha_dog",
		["desc_id"] = "menu_alpha_dog_desc",
		["icon_xy"] = {0, 11},
		[1] = {
			upgrades = {
				"player_crouch_dodge_chance_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_crouch_dodge_chance_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.tea_cookies = {
		["name_id"] = "menu_tea_cookies",
		["desc_id"] = "menu_tea_cookies_desc",
		["icon_xy"] = {2, 11},
		[1] = {
			upgrades = {
				"first_aid_kit_quantity_increase_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"first_aid_kit_quantity_increase_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.cell_mates = {
		["name_id"] = "menu_cell_mates",
		["desc_id"] = "menu_cell_mates_desc",
		["icon_xy"] = {4, 11},
		[1] = {
			upgrades = {
				"player_gangster_damage_dampener_1"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_gangster_damage_dampener_2"
			},
			cost = self.costs.pro
		}
	}
	self.skills.thug_life = {
		["name_id"] = "menu_thug_life",
		["desc_id"] = "menu_thug_life_desc",
		["icon_xy"] = {3, 12},
		[1] = {
			upgrades = {
				"player_extra_corpse_dispose_amount"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_cleaner_cost_multiplier"
			},
			cost = self.costs.pro
		}
	}
	self.skills.thick_skin = {
		["name_id"] = "menu_thick_skin",
		["desc_id"] = "menu_thick_skin_desc",
		["icon_xy"] = {2, 12},
		[1] = {
			upgrades = {
				"player_damage_shake_addend"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_level_2_armor_addend",
				"player_level_3_armor_addend",
				"player_level_4_armor_addend"
			},
			cost = self.costs.pro
		}
	}
	self.skills.backstab = {
		["name_id"] = "menu_backstab",
		["desc_id"] = "menu_backstab_desc",
		["icon_xy"] = {0, 12},
		[1] = {
			upgrades = {
				"player_detection_risk_add_crit_chance_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_detection_risk_add_crit_chance_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.drop_soap = {
		["name_id"] = "menu_drop_soap",
		["desc_id"] = "menu_drop_soap_desc",
		["icon_xy"] = {4, 12},
		[1] = {
			upgrades = {
				"player_counter_strike_melee"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_counter_strike_spooc"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.second_chances = {
		["name_id"] = "menu_second_chances",
		["desc_id"] = "menu_second_chances_desc",
		["icon_xy"] = {5, 11},
		[1] = {
			upgrades = {
				"bodybags_bag"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"bodybags_bag_quantity"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.trigger_happy = {
		["name_id"] = "menu_trigger_happy",
		["desc_id"] = "menu_trigger_happy_desc",
		["icon_xy"] = {7, 11},
		[1] = {
			upgrades = {
				"pistol_stacking_hit_expire_t_1",
				"pistol_stacking_hit_damage_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"pistol_stacking_hit_expire_t_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.perseverance = {
		["name_id"] = "menu_perseverance",
		["desc_id"] = "menu_perseverance_desc",
		["icon_xy"] = {5, 12},
		[1] = {
			upgrades = {
				"temporary_berserker_damage_multiplier_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"temporary_berserker_damage_multiplier_2",
				"player_berserker_no_ammo_cost"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.jail_workout = {
		["name_id"] = "menu_jail_workout",
		["desc_id"] = "menu_jail_workout_desc",
		["icon_xy"] = {6, 10},
		[1] = {
			upgrades = {
				"player_standstill_omniscience"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_mask_off_pickup"
			},
			cost = self.costs.pro
		}
	}
	self.skills.akimbo = {
		["name_id"] = "menu_akimbo_skill",
		["desc_id"] = "menu_akimbo_skill_desc",
		["icon_xy"] = {3, 11},
		[1] = {
			upgrades = {
				"jowi",
				"x_1911",
				"x_b92fs",
				"x_deagle",
				"x_g22c",
				"x_g17",
				"x_usp",
				"akimbo_recoil_index_addend_1",
				"akimbo_recoil_index_addend_2"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"akimbo_extra_ammo_multiplier_1",
				"akimbo_extra_ammo_multiplier_2",
				"akimbo_recoil_index_addend_3"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.jail_diet = {
		["name_id"] = "menu_jail_diet",
		["desc_id"] = "menu_jail_diet_desc",
		["icon_xy"] = {1, 12},
		[1] = {
			upgrades = {
				"player_detection_risk_add_dodge_chance_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_detection_risk_add_dodge_chance_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.skills.prison_wife = {
		["name_id"] = "menu_prison_wife",
		["desc_id"] = "menu_prison_wife_desc",
		["icon_xy"] = {6, 11},
		[1] = {
			upgrades = {
				"player_headshot_regen_armor_bonus_1"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_headshot_regen_armor_bonus_2"
			},
			cost = self.costs.hightierpro
		}
	}
	self.trees = {}
	self.trees[1] = {
		name_id = "st_menu_mastermind",
		skill = "mastermind",
		background_texture = "guis/textures/pd2/skilltree/bg_mastermind",
		tiers = {}
	}
	self.trees[2] = {
		name_id = "st_menu_enforcer",
		skill = "enforcer",
		background_texture = "guis/textures/pd2/skilltree/bg_enforcer",
		tiers = {}
	}
	self.trees[3] = {
		name_id = "st_menu_technician",
		skill = "technician",
		background_texture = "guis/textures/pd2/skilltree/bg_technician",
		tiers = {}
	}
	self.trees[4] = {
		name_id = "st_menu_ghost",
		skill = "ghost",
		background_texture = "guis/textures/pd2/skilltree/bg_ghost",
		tiers = {}
	}
	self.trees[5] = {
		name_id = "st_menu_hoxton_pack",
		skill = "hoxton",
		background_texture = "guis/textures/pd2/skilltree/bg_fugitive",
		tiers = {}
	}
	self.trees[1].tiers[1] = {
		"cable_guy",
		"combat_medic",
		"triathlete"
	}
	self.trees[1].tiers[2] = {
		"inside_man",
		"fast_learner",
		"leadership"
	}
	self.trees[1].tiers[3] = {
		"tactician",
		"equilibrium",
		"dominator"
	}
	self.trees[1].tiers[4] = {
		"stockholm_syndrome",
		"medic_2x",
		"joker"
	}
	self.trees[1].tiers[5] = {
		"kilmer",
		"gun_fighter",
		"control_freak"
	}
	self.trees[1].tiers[6] = {
		"black_marketeer",
		"pistol_messiah",
		"inspire"
	}
	self.trees[2].tiers[1] = {
		"oppressor",
		"ammo_reservoir",
		"pack_mule"
	}
	self.trees[2].tiers[2] = {
		"show_of_force",
		"underdog",
		"steroids"
	}
	self.trees[2].tiers[3] = {
		"shotgun_impact",
		"shades",
		"tough_guy"
	}
	self.trees[2].tiers[4] = {
		"shotgun_cqb",
		"ammo_2x",
		"wolverine"
	}
	self.trees[2].tiers[5] = {
		"from_the_hip",
		"bandoliers",
		"portable_saw"
	}
	self.trees[2].tiers[6] = {
		"overkill",
		"juggernaut",
		"carbon_blade"
	}
	self.trees[3].tiers[1] = {
		"rifleman",
		"trip_miner",
		"discipline"
	}
	self.trees[3].tiers[2] = {
		"sharpshooter",
		"trip_mine_expert",
		"hardware_expert"
	}
	self.trees[3].tiers[3] = {
		"sentry_gun",
		"master_craftsman",
		"drill_expert"
	}
	self.trees[3].tiers[4] = {
		"sentry_targeting_package",
		"blast_radius",
		"silent_drilling"
	}
	self.trees[3].tiers[5] = {
		"sentry_2_0",
		"shaped_charge",
		"insulation"
	}
	self.trees[3].tiers[6] = {
		"sentry_gun_2x",
		"mag_plus",
		"iron_man"
	}
	self.trees[4].tiers[1] = {
		"scavenger",
		"sprinter",
		"cat_burglar"
	}
	self.trees[4].tiers[2] = {
		"transporter",
		"chameleon",
		"cleaner"
	}
	self.trees[4].tiers[3] = {
		"assassin",
		"martial_arts",
		"smg_master"
	}
	self.trees[4].tiers[4] = {
		"nine_lives",
		"ecm_2x",
		"hitman"
	}
	self.trees[4].tiers[5] = {
		"magic_touch",
		"ecm_booster",
		"silence_expert"
	}
	self.trees[4].tiers[6] = {
		"good_luck_charm",
		"ecm_feedback",
		"moving_target"
	}
	self.trees[5].tiers[1] = {
		"freedom_call",
		"hidden_blade",
		"thick_skin"
	}
	self.trees[5].tiers[2] = {
		"awareness",
		"jail_workout",
		"alpha_dog"
	}
	self.trees[5].tiers[3] = {
		"cell_mates",
		"thug_life",
		"tea_time"
	}
	self.trees[5].tiers[4] = {
		"perseverance",
		"second_chances",
		"tea_cookies"
	}
	self.trees[5].tiers[5] = {
		"trigger_happy",
		"backstab",
		"drop_soap"
	}
	self.trees[5].tiers[6] = {
		"prison_wife",
		"jail_diet",
		"akimbo"
	}
	self.default_upgrades = {
		"cable_tie",
		"player_special_enemy_highlight",
		"player_hostage_trade",
		"player_sec_camera_highlight",
		"player_corpse_dispose",
		"player_corpse_dispose_amount_1",
		"player_civ_harmless_melee",
		"striker_reload_speed_default",
		"temporary_first_aid_damage_reduction",
		"temporary_passive_revive_damage_reduction_2"
	}
	self.skill_switches = {
		{
			name_id = "menu_st_skill_switch_1"
		},
		{
			name_id = "menu_st_skill_switch_2",
			locks = {level = 50}
		},
		{
			name_id = "menu_st_skill_switch_3",
			locks = {level = 75}
		},
		{
			name_id = "menu_st_skill_switch_4",
			locks = {level = 100}
		},
		{
			name_id = "menu_st_skill_switch_5",
			locks = {level = 100, achievement = "frog_1"}
		}
	}
	self.specialization_convertion_rate = {
		100,
		200,
		300,
		400,
		500,
		600,
		700,
		800,
		900,
		1000
	}
	local deck2 = {
		upgrades = {
			"weapon_passive_headshot_damage_multiplier"
		},
		cost = 300,
		icon_xy = {1, 0},
		name_id = "menu_deckall_2",
		desc_id = "menu_deckall_2_desc"
	}
	local deck4 = {
		upgrades = {
			"passive_player_xp_multiplier",
			"player_passive_suspicion_bonus",
			"player_passive_armor_movement_penalty_multiplier"
		},
		cost = 600,
		icon_xy = {3, 0},
		name_id = "menu_deckall_4",
		desc_id = "menu_deckall_4_desc"
	}
	local deck6 = {
		upgrades = {
			"armor_kit",
			"player_pick_up_ammo_multiplier"
		},
		cost = 1600,
		icon_xy = {5, 0},
		name_id = "menu_deckall_6",
		desc_id = "menu_deckall_6_desc"
	}
	local deck8 = {
		upgrades = {
			"weapon_passive_damage_multiplier",
			"passive_doctor_bag_interaction_speed_multiplier"
		},
		cost = 3200,
		icon_xy = {7, 0},
		name_id = "menu_deckall_8",
		desc_id = "menu_deckall_8_desc"
	}
	self.specializations = {
		{
			name_id = "menu_st_spec_1",
			desc_id = "menu_st_spec_1_desc",
			{
				upgrades = {
					"player_passive_health_multiplier_1"
				},
				cost = 200,
				icon_xy = {0, 0},
				name_id = "menu_deck1_1",
				desc_id = "menu_deck1_1_desc"
			},
			deck2,
			{
				upgrades = {
					"team_passive_stamina_multiplier_1",
					"player_passive_intimidate_range_mul"
				},
				cost = 400,
				icon_xy = {2, 0},
				name_id = "menu_deck1_3",
				desc_id = "menu_deck1_3_desc"
			},
			deck4,
			{
				upgrades = {
					"team_passive_health_multiplier"
				},
				cost = 1000,
				icon_xy = {4, 0},
				name_id = "menu_deck1_5",
				desc_id = "menu_deck1_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_tier_armor_multiplier_1",
					"team_passive_armor_multiplier"
				},
				cost = 2400,
				icon_xy = {6, 0},
				name_id = "menu_deck1_7",
				desc_id = "menu_deck1_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"team_hostage_health_multiplier",
					"team_hostage_stamina_multiplier",
					"team_hostage_damage_dampener_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 1},
				name_id = "menu_deck1_9",
				desc_id = "menu_deck1_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_2",
			desc_id = "menu_st_spec_2_desc",
			{
				upgrades = {
					"player_passive_health_multiplier_1"
				},
				cost = 200,
				icon_xy = {0, 0},
				name_id = "menu_deck2_1",
				desc_id = "menu_deck2_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_passive_health_multiplier_2",
					"player_uncover_multiplier"
				},
				cost = 400,
				icon_xy = {1, 1},
				name_id = "menu_deck2_3",
				desc_id = "menu_deck2_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_health_multiplier_3"
				},
				cost = 1000,
				icon_xy = {2, 1},
				name_id = "menu_deck2_5",
				desc_id = "menu_deck2_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_panic_suppression"
				},
				cost = 2400,
				icon_xy = {3, 1},
				name_id = "menu_deck2_7",
				desc_id = "menu_deck2_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_health_multiplier_4",
					"player_passive_health_regen",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {4, 1},
				name_id = "menu_deck2_9",
				desc_id = "menu_deck2_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_3",
			desc_id = "menu_st_spec_3_desc",
			{
				upgrades = {
					"player_tier_armor_multiplier_1",
					"player_tier_armor_multiplier_2"
				},
				cost = 200,
				icon_xy = {6, 0},
				name_id = "menu_deck3_1",
				desc_id = "menu_deck3_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_tier_armor_multiplier_3"
				},
				cost = 400,
				icon_xy = {5, 1},
				name_id = "menu_deck3_3",
				desc_id = "menu_deck3_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_tier_armor_multiplier_4"
				},
				cost = 1000,
				icon_xy = {7, 1},
				name_id = "menu_deck3_5",
				desc_id = "menu_deck3_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_regen_timer_multiplier_passive"
				},
				cost = 2400,
				icon_xy = {6, 1},
				name_id = "menu_deck3_7",
				desc_id = "menu_deck3_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_tier_armor_multiplier_5",
					"player_tier_armor_multiplier_6",
					"team_passive_armor_regen_time_multiplier",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 2},
				name_id = "menu_deck3_9",
				desc_id = "menu_deck3_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_4",
			desc_id = "menu_st_spec_4_desc",
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck4_1",
				desc_id = "menu_deck4_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_camouflage_multiplier"
				},
				cost = 400,
				icon_xy = {4, 2},
				name_id = "menu_deck4_3",
				desc_id = "menu_deck4_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_passive_dodge_chance_2"
				},
				cost = 1000,
				icon_xy = {2, 2},
				name_id = "menu_deck4_5",
				desc_id = "menu_deck4_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_passive_dodge_chance_3"
				},
				cost = 2400,
				icon_xy = {3, 2},
				name_id = "menu_deck4_7",
				desc_id = "menu_deck4_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"weapon_passive_armor_piercing_chance",
					"weapon_passive_swap_speed_multiplier_1"
				},
				cost = 4000,
				icon_xy = {5, 2},
				name_id = "menu_deck4_9",
				desc_id = "menu_deck4_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_5",
			desc_id = "menu_st_spec_5_desc",
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_1"
				},
				cost = 200,
				icon_xy = {6, 2},
				name_id = "menu_deck5_1",
				desc_id = "menu_deck5_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_2",
					"player_perk_armor_loss_multiplier_1",
					"akimbo_recoil_index_addend_1",
					"jowi",
					"x_1911",
					"x_b92fs",
					"x_deagle",
					"x_g22c",
					"x_g17",
					"x_usp"
				},
				cost = 400,
				icon_xy = {7, 2},
				name_id = "menu_deck5_3",
				desc_id = "menu_deck5_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_3",
					"player_perk_armor_loss_multiplier_2"
				},
				cost = 1000,
				icon_xy = {0, 3},
				name_id = "menu_deck5_5",
				desc_id = "menu_deck5_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_4",
					"player_perk_armor_loss_multiplier_3"
				},
				cost = 2400,
				icon_xy = {1, 3},
				name_id = "menu_deck5_7",
				desc_id = "menu_deck5_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_perk_armor_regen_timer_multiplier_5",
					"player_perk_armor_loss_multiplier_4",
					"player_passive_loot_drop_multiplier",
					"akimbo_recoil_index_addend_2",
					"akimbo_extra_ammo_multiplier_1"
				},
				cost = 4000,
				icon_xy = {3, 3},
				name_id = "menu_deck5_9",
				desc_id = "menu_deck5_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_6",
			desc_id = "menu_st_spec_6_desc",
			{
				upgrades = {
					"player_passive_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck6_1",
				desc_id = "menu_deck6_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_level_2_dodge_addend_1",
					"player_level_3_dodge_addend_1",
					"player_level_4_dodge_addend_1",
					"player_level_2_armor_multiplier_1",
					"player_level_3_armor_multiplier_1",
					"player_level_4_armor_multiplier_1"
				},
				cost = 400,
				icon_xy = {4, 3},
				name_id = "menu_deck6_3",
				desc_id = "menu_deck6_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_level_2_dodge_addend_2",
					"player_level_3_dodge_addend_2",
					"player_level_4_dodge_addend_2",
					"player_level_2_armor_multiplier_2",
					"player_level_3_armor_multiplier_2",
					"player_level_4_armor_multiplier_2"
				},
				cost = 1000,
				icon_xy = {5, 3},
				name_id = "menu_deck6_5",
				desc_id = "menu_deck6_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_level_2_dodge_addend_3",
					"player_level_3_dodge_addend_3",
					"player_level_4_dodge_addend_3",
					"player_level_2_armor_multiplier_3",
					"player_level_3_armor_multiplier_3",
					"player_level_4_armor_multiplier_3"
				},
				cost = 2400,
				icon_xy = {6, 3},
				name_id = "menu_deck6_7",
				desc_id = "menu_deck6_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_passive_loot_drop_multiplier",
					"player_armor_regen_timer_multiplier_tier"
				},
				cost = 4000,
				icon_xy = {6, 2},
				name_id = "menu_deck6_9",
				desc_id = "menu_deck6_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_7",
			desc_id = "menu_st_spec_7_desc",
			dlc = "character_pack_clover",
			{
				upgrades = {
					"player_tier_dodge_chance_1"
				},
				cost = 200,
				icon_xy = {1, 2},
				name_id = "menu_deck7_1",
				desc_id = "menu_deck7_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_stand_still_crouch_camouflage_bonus_1",
					"player_corpse_dispose_speed_multiplier"
				},
				cost = 400,
				icon_xy = {0, 4},
				name_id = "menu_deck7_3",
				desc_id = "menu_deck7_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_tier_dodge_chance_2",
					"player_stand_still_crouch_camouflage_bonus_2",
					"player_pick_lock_speed_multiplier"
				},
				cost = 1000,
				icon_xy = {7, 3},
				name_id = "menu_deck7_5",
				desc_id = "menu_deck7_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_tier_dodge_chance_3",
					"player_stand_still_crouch_camouflage_bonus_3",
					"player_alarm_pager_speed_multiplier"
				},
				cost = 2400,
				icon_xy = {1, 4},
				name_id = "menu_deck7_7",
				desc_id = "menu_deck7_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_armor_regen_timer_stand_still_multiplier",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {2, 4},
				name_id = "menu_deck7_9",
				desc_id = "menu_deck7_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_8",
			desc_id = "menu_st_spec_8_desc",
			dlc = "character_pack_dragan",
			{
				upgrades = {
					"player_damage_dampener_close_contact_1"
				},
				cost = 200,
				icon_xy = {3, 4},
				name_id = "menu_deck8_1",
				desc_id = "menu_deck8_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_damage_dampener_close_contact_2"
				},
				cost = 400,
				icon_xy = {4, 4},
				name_id = "menu_deck8_3",
				desc_id = "menu_deck8_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_damage_dampener_close_contact_3",
					"melee_stacking_hit_expire_t",
					"melee_stacking_hit_damage_multiplier_1"
				},
				cost = 1000,
				icon_xy = {5, 4},
				name_id = "menu_deck8_5",
				desc_id = "menu_deck8_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_damage_dampener_outnumbered_strong",
					"melee_stacking_hit_damage_multiplier_2"
				},
				cost = 2400,
				icon_xy = {6, 4},
				name_id = "menu_deck8_7",
				desc_id = "menu_deck8_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_melee_life_leech",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {7, 4},
				name_id = "menu_deck8_9",
				desc_id = "menu_deck8_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_9",
			desc_id = "menu_st_spec_9_desc",
			dlc = "hlm2_deluxe",
			{
				upgrades = {
					"player_damage_dampener_close_contact_1"
				},
				cost = 200,
				icon_xy = {3, 4},
				name_id = "menu_deck9_1",
				desc_id = "menu_deck9_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_killshot_regen_armor_bonus"
				},
				cost = 400,
				icon_xy = {0, 5},
				name_id = "menu_deck9_3",
				desc_id = "menu_deck9_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_melee_kill_life_leech"
				},
				cost = 1000,
				icon_xy = {1, 5},
				name_id = "menu_deck9_5",
				desc_id = "menu_deck9_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_killshot_close_regen_armor_bonus"
				},
				cost = 2400,
				icon_xy = {2, 5},
				name_id = "menu_deck9_7",
				desc_id = "menu_deck9_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_killshot_close_panic_chance",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {3, 5},
				name_id = "menu_deck9_9",
				desc_id = "menu_deck9_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_10",
			desc_id = "menu_st_spec_10_desc",
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_1"
				},
				cost = 200,
				icon_xy = {4, 5},
				name_id = "menu_deck10_1",
				desc_id = "menu_deck10_1_desc"
			},
			deck2,
			{
				upgrades = {
					"temporary_loose_ammo_give_team"
				},
				cost = 400,
				icon_xy = {5, 5},
				name_id = "menu_deck10_3",
				desc_id = "menu_deck10_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_loose_ammo_restore_health_give_team"
				},
				cost = 1000,
				icon_xy = {6, 5},
				name_id = "menu_deck10_5",
				desc_id = "menu_deck10_5_desc"
			},
			deck6,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_2"
				},
				cost = 2400,
				icon_xy = {7, 5},
				name_id = "menu_deck10_7",
				desc_id = "menu_deck10_7_desc"
			},
			deck8,
			{
				upgrades = {
					"temporary_loose_ammo_restore_health_3",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {0, 6},
				name_id = "menu_deck10_9",
				desc_id = "menu_deck10_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_11",
			desc_id = "menu_st_spec_11_desc",
			dlc = "character_pack_sokol",
			{
				upgrades = {
					"player_damage_to_hot_1"
				},
				cost = 200,
				icon_xy = {1, 6},
				name_id = "menu_deck11_1",
				desc_id = "menu_deck11_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_damage_to_hot_2",
					"player_passive_health_multiplier_1",
					"player_passive_health_multiplier_2"
				},
				cost = 400,
				icon_xy = {2, 6},
				name_id = "menu_deck11_3",
				desc_id = "menu_deck11_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_damage_to_hot_3",
					"player_armor_piercing_chance_1"
				},
				cost = 1000,
				icon_xy = {3, 6},
				name_id = "menu_deck11_5",
				desc_id = "menu_deck11_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_damage_to_hot_4",
					"player_passive_health_multiplier_3"
				},
				cost = 2400,
				icon_xy = {4, 6},
				name_id = "menu_deck11_7",
				desc_id = "menu_deck11_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_damage_to_hot_extra_ticks",
					"player_armor_piercing_chance_2",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {5, 6},
				name_id = "menu_deck11_9",
				desc_id = "menu_deck11_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_12",
			desc_id = "menu_st_spec_12_desc",
			dlc = "dragon",
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_1"
				},
				cost = 200,
				icon_xy = {6, 6},
				name_id = "menu_deck12_1",
				desc_id = "menu_deck12_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_movement_speed_damage_health_ratio_multiplier"
				},
				cost = 400,
				icon_xy = {7, 6},
				name_id = "menu_deck12_3",
				desc_id = "menu_deck12_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_2"
				},
				cost = 1000,
				icon_xy = {0, 7},
				name_id = "menu_deck12_5",
				desc_id = "menu_deck12_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_multiplier_3"
				},
				cost = 2400,
				icon_xy = {1, 7},
				name_id = "menu_deck12_7",
				desc_id = "menu_deck12_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_armor_regen_damage_health_ratio_threshold_multiplier",
					"player_movement_speed_damage_health_ratio_threshold_multiplier",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {2, 7},
				name_id = "menu_deck12_9",
				desc_id = "menu_deck12_9_desc"
			}
		},
		{
			name_id = "menu_st_spec_13",
			desc_id = "menu_st_spec_13_desc",
			{
				upgrades = {
					"player_armor_health_store_amount_1"
				},
				cost = 200,
				icon_xy = {3, 7},
				name_id = "menu_deck13_1",
				desc_id = "menu_deck13_1_desc"
			},
			deck2,
			{
				upgrades = {
					"player_armor_health_store_amount_2",
					"player_passive_health_multiplier_1",
					"player_level_2_dodge_addend_1",
					"player_level_3_dodge_addend_1",
					"player_level_4_dodge_addend_1"
				},
				cost = 400,
				icon_xy = {4, 7},
				name_id = "menu_deck13_3",
				desc_id = "menu_deck13_3_desc"
			},
			deck4,
			{
				upgrades = {
					"player_armor_max_health_store_multiplier",
					"player_passive_health_multiplier_2",
					"player_passive_dodge_chance_1"
				},
				cost = 1000,
				icon_xy = {5, 7},
				name_id = "menu_deck13_5",
				desc_id = "menu_deck13_5_desc"
			},
			deck6,
			{
				upgrades = {
					"player_armor_health_store_amount_3",
					"player_passive_health_multiplier_3",
					"player_level_2_dodge_addend_2",
					"player_level_3_dodge_addend_2",
					"player_level_4_dodge_addend_2"
				},
				cost = 2400,
				icon_xy = {6, 7},
				name_id = "menu_deck13_7",
				desc_id = "menu_deck13_7_desc"
			},
			deck8,
			{
				upgrades = {
					"player_kill_change_regenerate_speed",
					"player_passive_loot_drop_multiplier"
				},
				cost = 4000,
				icon_xy = {7, 7},
				name_id = "menu_deck13_9",
				desc_id = "menu_deck13_9_desc"
			}
		}
	}
end
