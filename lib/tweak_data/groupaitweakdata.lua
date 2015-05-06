GroupAITweakData = GroupAITweakData or class()
function GroupAITweakData:init(tweak_data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)
	print("[GroupAITweakData:init] difficulty", difficulty, "difficulty_index", difficulty_index)
	self:_read_mission_preset(tweak_data)
	self:_create_table_structure()
	self:_init_task_data(difficulty_index)
	self:_init_chatter_data()
	self:_init_unit_categories(difficulty_index)
	self:_init_enemy_spawn_groups(difficulty_index)
end
function GroupAITweakData:_init_chatter_data()
	self.enemy_chatter = {}
	self.enemy_chatter.aggressive = {
		radius = 1000,
		max_nr = 3,
		duration = {1, 3},
		interval = {2, 5},
		group_min = 3,
		queue = "g90"
	}
	self.enemy_chatter.retreat = {
		radius = 900,
		max_nr = 2,
		duration = {2, 4},
		interval = {0.75, 1.5},
		group_min = 3,
		queue = "m01"
	}
	self.enemy_chatter.follow_me = {
		radius = 700,
		max_nr = 1,
		duration = {5, 10},
		interval = {0.75, 1.5},
		group_min = 2,
		queue = "mov"
	}
	self.enemy_chatter.clear = {
		radius = 700,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.75, 1.5},
		group_min = 3,
		queue = "clr"
	}
	self.enemy_chatter.go_go = {
		radius = 700,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.75, 1.2},
		group_min = 0,
		queue = "mov"
	}
	self.enemy_chatter.ready = {
		radius = 700,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.75, 1.2},
		group_min = 3,
		queue = "rdy"
	}
	self.enemy_chatter.smoke = {
		radius = 0,
		max_nr = 1,
		duration = {0, 0},
		interval = {0, 0},
		group_min = 2,
		queue = "d01"
	}
	self.enemy_chatter.flash_grenade = {
		radius = 0,
		max_nr = 1,
		duration = {0, 0},
		interval = {0, 0},
		group_min = 2,
		queue = "d02"
	}
	self.enemy_chatter.incomming_tank = {
		radius = 1500,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "bdz"
	}
	self.enemy_chatter.incomming_spooc = {
		radius = 1200,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "clk"
	}
	self.enemy_chatter.incomming_shield = {
		radius = 1500,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "shd"
	}
	self.enemy_chatter.incomming_taser = {
		radius = 1500,
		max_nr = 1,
		duration = {60, 60},
		interval = {0.5, 1},
		group_min = 0,
		queue = "tsr"
	}
end
function GroupAITweakData:_init_unit_categories(difficulty_index)
	local access_type_walk_only = {walk = true}
	local access_type_all = {walk = true, acrobatic = true}
	if difficulty_index <= 2 then
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 1,
			spooc = 0,
			shield = 2
		}
	elseif difficulty_index == 3 then
		self.special_unit_spawn_limits = {
			tank = 1,
			taser = 2,
			spooc = 1,
			shield = 4
		}
	elseif difficulty_index == 4 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			spooc = 2,
			shield = 5
		}
	elseif difficulty_index == 5 then
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			spooc = 3,
			shield = 5
		}
	else
		self.special_unit_spawn_limits = {
			tank = 3,
			taser = 4,
			spooc = 4,
			shield = 5
		}
	end
	self.unit_categories = {}
	self.unit_categories.spooc = {
		units = {
			Idstring("units/payday2/characters/ene_spook_1/ene_spook_1")
		},
		access = access_type_all,
		special_type = "spooc"
	}
	self.unit_categories.CS_cop_C45_R870 = {
		units = {
			Idstring("units/payday2/characters/ene_cop_1/ene_cop_1"),
			Idstring("units/payday2/characters/ene_cop_3/ene_cop_3"),
			Idstring("units/payday2/characters/ene_cop_4/ene_cop_4")
		},
		access = access_type_walk_only
	}
	self.unit_categories.CS_cop_stealth_MP5 = {
		units = {
			Idstring("units/payday2/characters/ene_cop_2/ene_cop_2")
		},
		access = access_type_walk_only
	}
	self.unit_categories.CS_swat_MP5 = {
		units = {
			Idstring("units/payday2/characters/ene_swat_1/ene_swat_1")
		},
		access = access_type_all
	}
	self.unit_categories.CS_swat_R870 = {
		units = {
			Idstring("units/payday2/characters/ene_swat_2/ene_swat_2")
		},
		access = access_type_all
	}
	self.unit_categories.CS_heavy_M4 = {
		units = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
		},
		access = access_type_all
	}
	self.unit_categories.CS_heavy_M4_w = {
		units = {
			Idstring("units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1")
		},
		access = access_type_walk_only
	}
	self.unit_categories.CS_tazer = {
		units = {
			Idstring("units/payday2/characters/ene_tazer_1/ene_tazer_1")
		},
		access = access_type_all,
		special_type = "taser"
	}
	self.unit_categories.CS_shield = {
		units = {
			Idstring("units/payday2/characters/ene_shield_2/ene_shield_2")
		},
		access = access_type_walk_only,
		special_type = "shield"
	}
	self.unit_categories.FBI_suit_C45_M4 = {
		units = {
			Idstring("units/payday2/characters/ene_fbi_1/ene_fbi_1"),
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2")
		},
		access = access_type_all
	}
	self.unit_categories.FBI_suit_M4_MP5 = {
		units = {
			Idstring("units/payday2/characters/ene_fbi_2/ene_fbi_2"),
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		access = access_type_all
	}
	self.unit_categories.FBI_suit_stealth_MP5 = {
		units = {
			Idstring("units/payday2/characters/ene_fbi_3/ene_fbi_3")
		},
		access = access_type_all
	}
	if difficulty_index < 6 then
		self.unit_categories.FBI_swat_M4 = {
			units = {
				Idstring("units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1")
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_swat_M4 = {
			units = {
				Idstring("units/payday2/characters/ene_city_swat_1/ene_city_swat_1")
			},
			access = access_type_all
		}
	end
	if difficulty_index < 6 then
		self.unit_categories.FBI_swat_R870 = {
			units = {
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2")
			},
			access = access_type_all
		}
	else
		self.unit_categories.FBI_swat_R870 = {
			units = {
				Idstring("units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2"),
				Idstring("units/payday2/characters/ene_city_swat_3/ene_city_swat_3")
			},
			access = access_type_all
		}
	end
	self.unit_categories.FBI_heavy_G36 = {
		units = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
		},
		access = access_type_all
	}
	self.unit_categories.FBI_heavy_G36_w = {
		units = {
			Idstring("units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1")
		},
		access = access_type_walk_only
	}
	self.unit_categories.FBI_shield = {
		units = {
			Idstring("units/payday2/characters/ene_shield_1/ene_shield_1")
		},
		access = access_type_walk_only,
		special_type = "shield"
	}
	if difficulty_index < 6 then
		self.unit_categories.FBI_tank = {
			units = {
				Idstring("units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1"),
				Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2")
			},
			access = access_type_walk_only,
			special_type = "tank"
		}
	else
		self.unit_categories.FBI_tank = {
			units = {
				Idstring("units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2"),
				Idstring("units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3")
			},
			access = access_type_walk_only,
			special_type = "tank"
		}
	end
end
function GroupAITweakData:_init_enemy_spawn_groups(difficulty_index)
	self._tactics = {
		CS_cop = {
			"provide_coverfire",
			"provide_support",
			"ranged_fire"
		},
		CS_cop_stealth = {
			"flank",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_rifle = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"ranged_fire",
			"deathguard"
		},
		CS_swat_shotgun = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_swat_heavy = {
			"smoke_grenade",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support"
		},
		CS_shield = {
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		CS_swat_rifle_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_shotgun_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		CS_swat_heavy_flank = {
			"flank",
			"flash_grenade",
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		CS_shield_flank = {
			"flank",
			"charge",
			"flash_grenade",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		CS_tazer = {
			"flank",
			"charge",
			"flash_grenade",
			"shield_cover",
			"murder"
		},
		CS_sniper = {
			"ranged_fire",
			"provide_coverfire",
			"provide_support"
		},
		FBI_suit = {
			"flank",
			"ranged_fire",
			"flash_grenade"
		},
		FBI_suit_stealth = {
			"provide_coverfire",
			"provide_support",
			"flash_grenade",
			"flank"
		},
		FBI_swat_rifle = {
			"smoke_grenade",
			"flash_grenade",
			"provide_coverfire",
			"charge",
			"provide_support",
			"ranged_fire"
		},
		FBI_swat_shotgun = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy = {
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover",
			"deathguard"
		},
		FBI_shield = {
			"smoke_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield",
			"deathguard"
		},
		FBI_swat_rifle_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_swat_shotgun_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support"
		},
		FBI_heavy_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield_cover"
		},
		FBI_shield_flank = {
			"flank",
			"smoke_grenade",
			"flash_grenade",
			"charge",
			"provide_coverfire",
			"provide_support",
			"shield"
		},
		FBI_tank = {
			"charge",
			"deathguard",
			"shield_cover",
			"smoke_grenade"
		},
		spooc = {
			"charge",
			"shield_cover",
			"smoke_grenade",
			"flash_grenade"
		}
	}
	self.enemy_spawn_groups = {}
	self.enemy_spawn_groups.CS_defend_a = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_b = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_defend_c = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_cops = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_stealth_a = {
		amount = {2, 3},
		spawn = {
			{
				unit = "CS_cop_stealth_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.CS_swats = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_swat_MP5",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_swat_R870",
				freq = 0.5,
				amount_max = 2,
				tactics = self._tactics.CS_swat_shotgun,
				rank = 1
			},
			{
				unit = "CS_swat_MP5",
				freq = 0.33,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_heavys = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_heavy_M4",
				freq = 1,
				tactics = self._tactics.CS_swat_rifle,
				rank = 2
			},
			{
				unit = "CS_heavy_M4",
				freq = 0.35,
				tactics = self._tactics.CS_swat_rifle_flank,
				rank = 3
			}
		}
	}
	self.enemy_spawn_groups.CS_shields = {
		amount = {3, 4},
		spawn = {
			{
				unit = "CS_shield",
				freq = 1,
				amount_min = 1,
				amount_max = 2,
				tactics = self._tactics.CS_shield,
				rank = 3
			},
			{
				unit = "CS_cop_stealth_MP5",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_cop_stealth,
				rank = 1
			},
			{
				unit = "CS_heavy_M4_w",
				freq = 0.75,
				amount_max = 1,
				tactics = self._tactics.CS_swat_heavy,
				rank = 2
			}
		}
	}
	if difficulty_index < 6 then
		self.enemy_spawn_groups.CS_tazers = {
			amount = {1, 3},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 1,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "CS_swat_MP5",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_cop_stealth,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.CS_tazers = {
			amount = {4, 4},
			spawn = {
				{
					unit = "CS_tazer",
					freq = 1,
					amount_min = 3,
					tactics_ = self._tactics.CS_tazer,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 2,
					amount_max = 3,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				}
			}
		}
	end
	self.enemy_spawn_groups.CS_tanks = {
		amount = {1, 2},
		spawn = {
			{
				unit = "FBI_tank",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_tank,
				rank = 2
			},
			{
				unit = "CS_tazer",
				freq = 0.5,
				amount_max = 1,
				tactics = self._tactics.CS_tazer,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_a = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_suit_C45_M4",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "CS_cop_C45_R870",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_b = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_suit_M4_MP5",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.FBI_suit,
				rank = 2
			},
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_c = {
		amount = {3, 3},
		spawn = {
			{
				unit = "FBI_swat_M4",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_defend_d = {
		amount = {2, 3},
		spawn = {
			{
				unit = "FBI_heavy_G36",
				freq = 1,
				tactics = self._tactics.FBI_suit,
				rank = 1
			}
		}
	}
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_a = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 1,
					amount_max = 2,
					tactics = self._tactics.CS_tazer,
					rank = 1
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit,
					rank = 2
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_stealth_b = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 0.75,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 2
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				},
				{
					unit = "FBI_swat_M4",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 3
				},
				{
					unit = "FBI_swat_R870",
					freq = 0.5,
					amount_max = 2,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_swats = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_suit_M4_MP5",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "FBI_swat_R870",
					amount_min = 2,
					freq = 1,
					tactics = self._tactics.FBI_swat_shotgun,
					rank = 3
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {2, 3},
			spawn = {
				{
					unit = "FBI_heavy_G36",
					freq = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.75,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 2
				},
				{
					unit = "CS_tazer",
					freq = 0.25,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 3
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_heavys = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_heavy_G36_w",
					freq = 1,
					amount_min = 4,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 1
				},
				{
					unit = "FBI_swat_M4",
					freq = 1,
					amount_min = 3,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 2
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_max = 1,
					tactics = self._tactics.CS_tazer,
					rank = 2
				},
				{
					unit = "FBI_heavy_G36",
					freq = 0.5,
					amount_max = 1,
					tactics = self._tactics.FBI_swat_rifle_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_shields = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 3,
					amount_max = 4,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "FBI_suit_stealth_MP5",
					freq = 1,
					amount_min = 1,
					tactics = self._tactics.FBI_suit_stealth,
					rank = 1
				},
				{
					unit = "spooc",
					freq = 0.15,
					amount_max = 2,
					tactics = self._tactics.spooc,
					rank = 1
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 2,
					tactics = self._tactics.CS_swat_heavy,
					rank = 2
				}
			}
		}
	end
	if difficulty_index < 6 then
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {3, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_max = 1,
					tactics = self._tactics.FBI_tank,
					rank = 1
				},
				{
					unit = "FBI_shield",
					freq = 0.5,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield_flank,
					rank = 3
				},
				{
					unit = "FBI_heavy_G36_w",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_heavy_flank,
					rank = 1
				}
			}
		}
	else
		self.enemy_spawn_groups.FBI_tanks = {
			amount = {4, 4},
			spawn = {
				{
					unit = "FBI_tank",
					freq = 1,
					amount_min = 2,
					tactics = self._tactics.FBI_tank,
					rank = 3
				},
				{
					unit = "FBI_shield",
					freq = 1,
					amount_min = 1,
					amount_max = 2,
					tactics = self._tactics.FBI_shield,
					rank = 3
				},
				{
					unit = "CS_tazer",
					freq = 0.75,
					amount_min = 1,
					tactics = self._tactics.FBI_swat_rifle,
					rank = 2
				}
			}
		}
	end
	self.enemy_spawn_groups.single_spooc = {
		amount = {1, 1},
		spawn = {
			{
				unit = "spooc",
				freq = 1,
				amount_min = 1,
				tactics = self._tactics.spooc,
				rank = 1
			}
		}
	}
	self.enemy_spawn_groups.FBI_spoocs = self.enemy_spawn_groups.single_spooc
end
function GroupAITweakData:_init_task_data(difficulty_index, difficulty)
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.max_nr_simultaneous_boss_types = 0
	self.difficulty_curve_points = {0.5}
	if difficulty_index < 6 then
		self.smoke_and_flash_grenade_timeout = {10, 20}
	else
		self.smoke_and_flash_grenade_timeout = {4, 6}
	end
	if difficulty_index < 6 then
		self.smoke_grenade_lifetime = 7.5
	else
		self.smoke_grenade_lifetime = 12
	end
	self.flash_grenade_lifetime = 7.5
	self.optimal_trade_distance = {0, 0}
	self.bain_assault_praise_limits = {1, 3}
	if difficulty_index <= 2 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {180, 300},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {60, 120},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {45, 60},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	end
	self.besiege.regroup.duration = {
		15,
		15,
		15
	}
	self.besiege.assault = {}
	self.besiege.assault.anticipation_duration = {
		{30, 1},
		{30, 1},
		{45, 0.5}
	}
	self.besiege.assault.build_duration = 35
	self.besiege.assault.sustain_duration_min = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_max = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_balance_mul = {
		1,
		1.1,
		1.2,
		1.3
	}
	self.besiege.assault.fade_duration = 5
	if difficulty_index <= 2 then
		self.besiege.assault.delay = {
			80,
			70,
			30
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.delay = {
			45,
			35,
			20
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.delay = {
			40,
			30,
			20
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.delay = {
			30,
			20,
			15
		}
	else
		self.besiege.assault.delay = {
			20,
			15,
			10
		}
	end
	if difficulty_index <= 5 then
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
	else
		self.besiege.assault.hostage_hesitation_delay = {
			10,
			10,
			10
		}
	end
	if is_console then
		self.besiege.assault.force = {
			0,
			4,
			7
		}
		self.besiege.assault.force_pool = {
			0,
			60,
			100
		}
	else
		self.besiege.assault.force = {
			0,
			5,
			7
		}
		self.besiege.assault.force_pool = {
			0,
			20,
			50
		}
	end
	if is_console then
		if difficulty_index <= 2 then
			self.besiege.assault.force_balance_mul = {
				1,
				1.1,
				1.2,
				1.3
			}
			self.besiege.assault.force_pool_balance_mul = {
				1,
				1.1,
				1.2,
				1.3
			}
		elseif difficulty_index == 3 then
			self.besiege.assault.force_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8
			}
		elseif difficulty_index == 4 then
			self.besiege.assault.force_balance_mul = {
				1.6,
				1.8,
				2,
				2.2
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.7,
				2,
				2.2,
				2.4
			}
		elseif difficulty_index == 5 then
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8
			}
		else
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8
			}
		end
	elseif difficulty_index <= 2 then
		self.besiege.assault.force_balance_mul = {
			0.9,
			1.5,
			2,
			2.25
		}
		self.besiege.assault.force_pool_balance_mul = {
			1,
			1.5,
			2,
			3
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.force_balance_mul = {
			1,
			1.4,
			1.6,
			1.9
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.2,
			1.4,
			1.6,
			1.9
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.force_balance_mul = {
			1.4,
			1.8,
			2,
			2.4
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.7,
			2,
			2.2,
			2.5
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.force_balance_mul = {
			2,
			2.5,
			2.9,
			3.2
		}
		self.besiege.assault.force_pool_balance_mul = {
			2.2,
			2.4,
			2.6,
			3
		}
	else
		self.besiege.assault.force_balance_mul = {
			4,
			4.2,
			4.5,
			4.9
		}
		self.besiege.assault.force_pool_balance_mul = {
			3,
			5,
			7,
			9
		}
	end
	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			CS_swats = {
				0,
				1,
				0.85
			},
			CS_shields = {
				0,
				0,
				0.15
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.groups = {
			CS_swats = {
				0,
				1,
				0
			},
			CS_heavys = {
				0,
				0.2,
				0.7
			},
			CS_shields = {
				0,
				0.02,
				0.2
			},
			CS_tazers = {
				0,
				0.05,
				0.15
			},
			CS_tanks = {
				0,
				0.01,
				0.05
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.1,
				1,
				1
			},
			FBI_heavys = {
				0.05,
				0.25,
				0.5
			},
			FBI_shields = {
				0.1,
				0.2,
				0.2
			},
			FBI_tanks = {
				0,
				0.1,
				0.15
			},
			FBI_spoocs = {
				0,
				0.1,
				0.2
			},
			CS_tazers = {
				0.05,
				0.15,
				0.2
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				1,
				1
			},
			FBI_heavys = {
				0.1,
				0.5,
				0.75
			},
			FBI_shields = {
				0.1,
				0.3,
				0.4
			},
			FBI_tanks = {
				0,
				0.25,
				0.3
			},
			CS_tazers = {
				0.1,
				0.25,
				0.25
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	else
		self.besiege.assault.groups = {
			FBI_swats = {
				0.2,
				0.8,
				0.8
			},
			FBI_heavys = {
				0.1,
				0.3,
				0.4
			},
			FBI_shields = {
				0.1,
				0.5,
				0.4
			},
			FBI_tanks = {
				0.1,
				0.5,
				0.5
			},
			CS_tazers = {
				0.1,
				0.5,
				0.45
			},
			FBI_spoocs = {
				0,
				0.45,
				0.45
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	end
	self.besiege.reenforce.interval = {
		10,
		20,
		30
	}
	if difficulty_index <= 2 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0.2,
				0
			},
			CS_defend_b = {
				0,
				1,
				1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0,
				0
			},
			CS_defend_b = {
				2,
				1,
				0
			},
			CS_defend_c = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				1,
				0,
				0
			},
			CS_defend_b = {
				2,
				1,
				0
			},
			CS_defend_c = {
				0,
				0,
				1
			},
			FBI_defend_a = {
				0,
				1,
				0
			},
			FBI_defend_b = {
				0,
				0,
				1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				1,
				1,
				0
			},
			FBI_defend_c = {
				0,
				1,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}
	else
		self.besiege.reenforce.groups = {
			CS_defend_a = {
				0.1,
				0,
				0
			},
			FBI_defend_b = {
				1,
				1,
				0
			},
			FBI_defend_c = {
				0,
				1,
				0
			},
			FBI_defend_d = {
				0,
				0,
				1
			}
		}
	end
	self.besiege.recon.interval = {
		5,
		5,
		5
	}
	self.besiege.recon.interval_variation = 40
	if difficulty_index < 6 then
		self.besiege.recon.force = {
			2,
			4,
			6
		}
	else
		self.besiege.recon.force = {
			3,
			4,
			6
		}
	end
	if difficulty_index <= 2 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				1,
				0
			},
			CS_swats = {
				0,
				1,
				1
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recon.groups = {
			CS_stealth_a = {
				1,
				0,
				0
			},
			CS_swats = {
				0,
				1,
				1
			},
			CS_tazers = {
				0,
				0.1,
				0.15
			},
			FBI_stealth_b = {
				0,
				0,
				0.1
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				1,
				0.5,
				0
			},
			FBI_stealth_b = {
				0,
				0,
				1
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.5,
				1,
				1
			},
			FBI_stealth_b = {
				0.25,
				0.5,
				1
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	else
		self.besiege.recon.groups = {
			FBI_stealth_a = {
				0.5,
				1,
				1
			},
			FBI_stealth_b = {
				0.25,
				0.5,
				1
			},
			single_spooc = {
				0,
				0,
				0
			}
		}
	end
	self.besiege.cloaker.groups = {
		single_spooc = {
			1,
			1,
			1
		}
	}
end
function GroupAITweakData:_read_mission_preset(tweak_data)
	if not Global.game_settings then
		return
	end
	local lvl_tweak_data = tweak_data.levels[Global.game_settings.level_id]
	self._mission_preset = lvl_tweak_data.group_ai_preset
end
function GroupAITweakData:_create_table_structure()
	self.enemy_spawn_groups = {}
	self.besiege = {
		regroup = {},
		assault = {
			force = {}
		},
		reenforce = {},
		recon = {},
		rescue = {},
		cloaker = {}
	}
	self.street = {
		blockade = {
			force = {}
		},
		assault = {
			force = {}
		},
		regroup = {},
		capture = {
			force = {}
		}
	}
end
