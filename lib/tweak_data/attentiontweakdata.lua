AttentionTweakData = AttentionTweakData or class()
function AttentionTweakData:init()
	self.settings = {}
	self.indexes = {}
	self:_init_player()
	self:_init_team_AI()
	self:_init_civilian()
	self:_init_enemy()
	self:_init_drill()
	self:_init_sentry_gun()
	self:_init_prop()
	self:_init_custom()
	self:_post_init()
end
function AttentionTweakData:_init_player()
	self.settings.pl_civilian = {
		reaction = "REACT_IDLE",
		filter = "none",
		max_range = 1,
		notice_delay_mul = 1,
		verification_interval = 4,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.pl_mask_off_friend_combatant = {
		reaction = "REACT_IDLE",
		filter = "combatant",
		relation = "friend",
		max_range = 1000,
		notice_delay_mul = 1,
		verification_interval = 4,
		release_delay = 3,
		duration = {2, 5},
		pause = {15, 25},
		notice_requires_FOV = false
	}
	self.settings.pl_mask_off_foe_combatant = {
		reaction = "REACT_SUSPICIOUS",
		filter = "combatant",
		relation = "foe",
		max_range = 600,
		suspicion_range = 500,
		suspicion_duration = 4,
		turn_around_range = 250,
		uncover_range = 150,
		notice_delay_mul = 0.3,
		verification_interval = 0.02,
		release_delay = 2,
		notice_requires_FOV = true
	}
	self.settings.pl_mask_off_foe_non_combatant = {
		reaction = "REACT_IDLE",
		filter = "non_combatant",
		max_range = 600,
		notice_delay_mul = 0,
		notice_interval = 0.5,
		attract_chance = 0.5,
		verification_interval = 2,
		release_delay = 3,
		duration = {2, 15},
		pause = {10, 60},
		notice_requires_FOV = true
	}
	self.settings.pl_mask_off_friend_non_combatant = {
		reaction = "REACT_IDLE",
		filter = "non_combatant",
		relation = "friend",
		max_range = 600,
		notice_delay_mul = 0,
		notice_interval = 0.5,
		attract_chance = 0.5,
		verification_interval = 2,
		release_delay = 3,
		duration = {2, 15},
		pause = {10, 60},
		notice_requires_FOV = true
	}
	self.settings.pl_mask_on_friend_combatant_whisper_mode = {
		reaction = "REACT_CHECK",
		filter = "combatant",
		relation = "friend",
		max_range = 2000,
		notice_delay_mul = 1,
		verification_interval = 4,
		release_delay = 3,
		duration = {2, 5},
		pause = {25, 50},
		notice_requires_FOV = true
	}
	self.settings.pl_mask_on_friend_non_combatant_whisper_mode = self.settings.pl_mask_off_friend_non_combatant
	self.settings.pl_mask_on_foe_combatant_whisper_mode_stand = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 0.1,
		uncover_range = 200,
		release_delay = 1,
		notice_delay_mul = 2,
		max_range = 2000,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_stand = {
		reaction = "REACT_COMBAT",
		filter = "non_combatant",
		verification_interval = 0.1,
		uncover_range = 550,
		release_delay = 1,
		notice_delay_mul = 1.5,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_mask_on_foe_combatant_whisper_mode_crouch = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 0.1,
		uncover_range = 200,
		release_delay = 1,
		notice_delay_mul = 2,
		max_range = 1200,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_crouch = {
		reaction = "REACT_COMBAT",
		filter = "non_combatant",
		verification_interval = 0.1,
		uncover_range = 200,
		release_delay = 1,
		notice_delay_mul = 3,
		max_range = 1500,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_friend_combatant_cbt = {
		reaction = "REACT_CHECK",
		filter = "combatant",
		relation = "friend",
		max_range = 3000,
		notice_delay_mul = 1,
		verification_interval = 4,
		release_delay = 3,
		duration = {2, 3},
		pause = {45, 60},
		notice_requires_FOV = false
	}
	self.settings.pl_friend_non_combatant_cbt = {
		reaction = "REACT_SCARED",
		filter = "non_combatant",
		relation = "friend",
		verification_interval = 0.1,
		uncover_range = 550,
		release_delay = 1,
		notice_delay_mul = 1.5,
		notice_requires_FOV = true
	}
	self.settings.pl_foe_combatant_cbt_crouch = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 0.1,
		uncover_range = 350,
		release_delay = 1,
		notice_delay_mul = 2,
		notice_requires_FOV = true
	}
	self.settings.pl_foe_combatant_cbt_stand = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 1,
		notice_interval = 0.1,
		uncover_range = 550,
		release_delay = 1,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_foe_non_combatant_cbt_crouch = {
		reaction = "REACT_COMBAT",
		filter = "non_combatant",
		verification_interval = 0.1,
		uncover_range = 200,
		release_delay = 1,
		notice_delay_mul = 2.5,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.pl_foe_non_combatant_cbt_stand = deep_clone(self.settings.pl_foe_combatant_cbt_stand)
	self.settings.pl_foe_non_combatant_cbt_stand.filter = "non_combatant"
end
function AttentionTweakData:_init_team_AI()
	self.settings.team_team_idle = {
		reaction = "REACT_IDLE",
		filter = "all",
		relation = "friend",
		max_range = 1000,
		verification_interval = 3,
		release_delay = 2,
		duration = {1.5, 4},
		pause = {25, 40},
		notice_requires_FOV = false
	}
	self.settings.team_enemy_idle = {
		reaction = "REACT_IDLE",
		filter = "combatant",
		relation = "foe",
		max_range = 550,
		verification_interval = 3,
		release_delay = 1,
		duration = {1.5, 3},
		pause = {35, 60},
		notice_requires_FOV = false
	}
	self.settings.team_enemy_cbt = {
		reaction = "REACT_COMBAT",
		filter = "all",
		relation = "foe",
		max_range = 20000,
		notice_interval = 1,
		verification_interval = 1.5,
		uncover_range = 400,
		release_delay = 1,
		notice_requires_FOV = true,
		weight_mul = 0.5
	}
end
function AttentionTweakData:_init_civilian()
	self.settings.civ_all_peaceful = {
		reaction = "REACT_IDLE",
		filter = "all",
		max_range = 2000,
		verification_interval = 3,
		release_delay = 2,
		duration = {1.5, 6},
		pause = {35, 60},
		notice_requires_FOV = true
	}
	self.settings.civ_enemy_cbt = {
		reaction = "REACT_SCARED",
		filter = "all",
		max_range = 8000,
		uncover_range = 300,
		notice_delay_mul = 1,
		verification_interval = 0.1,
		release_delay = 6,
		duration = {3, 6},
		notice_clbk = "clbk_attention_notice_corpse",
		notice_requires_FOV = true
	}
	self.settings.civ_murderer_cbt = {
		reaction = "REACT_SHOOT",
		filter = "murderer",
		relation = "foe",
		max_range = 20000,
		notice_interval = 1,
		verification_interval = 1.5,
		uncover_range = 300,
		release_delay = 1,
		notice_requires_FOV = true,
		weight_mul = 0.75
	}
	self.settings.civ_enemy_corpse_sneak = {
		reaction = "REACT_SCARED",
		filter = "all",
		max_range = 2500,
		uncover_range = 300,
		notice_delay_mul = 0.05,
		verification_interval = 0.1,
		release_delay = 6,
		notice_requires_FOV = true
	}
	self.settings.civ_civ_cbt = {
		reaction = "REACT_SCARED",
		filter = "all",
		uncover_range = 300,
		notice_delay_mul = 0.05,
		verification_interval = 0.1,
		release_delay = 6,
		duration = {3, 6},
		notice_requires_FOV = true
	}
end
function AttentionTweakData:_init_enemy()
	self.settings.enemy_team_idle = {
		reaction = "REACT_IDLE",
		filter = "combatant",
		relation = "foe",
		max_range = 2000,
		verification_interval = 3,
		release_delay = 1,
		duration = {2, 4},
		pause = {9, 40},
		notice_requires_FOV = false
	}
	self.settings.enemy_team_cbt = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		max_range = 20000,
		notice_delay_mul = 0,
		notice_interval = 0.2,
		verification_interval = 0.75,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.enemy_law_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_team_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_combatant_corpse_cbt = {
		reaction = "REACT_CHECK",
		filter = "combatant",
		max_range = 800,
		notice_delay_mul = 0.1,
		verification_interval = 1.5,
		release_delay = 1,
		duration = {2, 3},
		notice_requires_FOV = true
	}
	self.settings.enemy_enemy_cbt = {
		reaction = "REACT_SCARED",
		filter = "combatant",
		relation = "friend",
		max_range = 3900,
		uncover_range = 300,
		notice_delay_mul = 0.5,
		verification_interval = 0.5,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.enemy_civ_cbt = {
		reaction = "REACT_SCARED",
		filter = "non_combatant",
		max_range = 8000,
		uncover_range = 300,
		notice_delay_mul = 0.2,
		verification_interval = 0.5,
		release_delay = 6,
		duration = {1.5, 3},
		notice_requires_FOV = true
	}
end
function AttentionTweakData:_init_custom()
	self.settings.custom_void = {
		reaction = "REACT_IDLE",
		filter = "none",
		max_range = 2000,
		verification_interval = 10,
		release_delay = 10
	}
	self.settings.custom_team_idle = {
		reaction = "REACT_IDLE",
		filter = "criminal",
		max_range = 2000,
		verification_interval = 3,
		release_delay = 1,
		duration = {2, 4},
		pause = {9, 40},
		notice_requires_FOV = false
	}
	self.settings.custom_team_cbt = {
		reaction = "REACT_COMBAT",
		filter = "criminal",
		max_range = 20000,
		verification_interval = 1.5,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_team_shoot_const = {
		reaction = "REACT_SHOOT",
		filter = "criminal",
		max_range = 10000,
		verification_interval = 1.5,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_team_shoot_burst = {
		reaction = "REACT_SHOOT",
		filter = "criminal",
		max_range = 10000,
		verification_interval = 1.5,
		release_delay = 2,
		duration = {2, 4},
		notice_requires_FOV = false
	}
	self.settings.custom_team_aim_const = {
		reaction = "REACT_AIM",
		filter = "criminal",
		max_range = 10000,
		verification_interval = 1.5,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_enemy_forest_survive_kruka = {
		reaction = "REACT_COMBAT",
		filter = "all_enemy",
		max_range = 20000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_enemy_suburbia_shootout = {
		reaction = "REACT_SHOOT",
		filter = "all_enemy",
		max_range = 12000,
		verification_interval = 2,
		release_delay = 5,
		turn_around_range = 15000,
		notice_requires_FOV = true,
		weight_mul = 0.5
	}
	self.settings.custom_enemy_suburbia_shootout_cops = {
		reaction = "REACT_SHOOT",
		filter = "all_enemy",
		max_range = 2000,
		verification_interval = 2,
		release_delay = 5,
		turn_around_range = 15000,
		notice_requires_FOV = true
	}
	self.settings.custom_enemy_china_store_vase_shoot = {
		reaction = "REACT_COMBAT",
		filter = "all_enemy",
		max_range = 1200,
		verification_interval = 2,
		release_delay = 3,
		turn_around_range = 500,
		notice_requires_FOV = true
	}
	self.settings.custom_enemy_china_store_vase_melee = {
		reaction = "REACT_MELEE",
		filter = "all_enemy",
		max_range = 500,
		verification_interval = 5,
		release_delay = 10,
		pause = 10,
		turn_around_range = 250,
		notice_requires_FOV = true
	}
	self.settings.custom_enemy_china_store_vase_aim = {
		reaction = "REACT_COMBAT",
		filter = "all_enemy",
		max_range = 500,
		verification_interval = 5,
		release_delay = 10,
		pause = 10,
		notice_requires_FOV = false
	}
	self.settings.custom_enemy_shoot_const = {
		reaction = "REACT_SHOOT",
		filter = "all_enemy",
		max_range = 10000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = true
	}
	self.settings.custom_gangster_shoot_const = {
		reaction = "REACT_SHOOT",
		filter = "gangster",
		max_range = 10000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = true
	}
	self.settings.custom_law_shoot_const = {
		reaction = "REACT_SHOOT",
		filter = "law_enforcer",
		max_range = 100000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_law_look_in_container = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		max_range = 100000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_law_shoot_const_escape_vehicle = {
		reaction = "REACT_COMBAT",
		filter = "law_enforcer",
		max_range = 4500,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_law_shoot_const_container = {
		reaction = "REACT_SHOOT",
		filter = "law_enforcer",
		max_range = 2000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_gangsters_shoot_warehouse = {
		reaction = "REACT_COMBAT",
		filter = "gangster",
		max_range = 2000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_gangster_sniper_apartment_suspicous = {
		reaction = "REACT_SCARED",
		filter = "law_enforcer",
		max_range = 850,
		verification_interval = 1,
		release_delay = 6,
		notice_requires_FOV = true,
		uncover_range = 350,
		notice_delay_mul = 0.1
	}
	self.settings.custom_gangster_docks_idle = {
		reaction = "REACT_CURIOUS",
		filter = "gangster",
		max_range = 10000,
		verification_interval = 1,
		release_delay = 6,
		notice_requires_FOV = true
	}
	self.settings.custom_enemy_civ_scared = {
		reaction = "REACT_SCARED",
		filter = "civilians_enemies",
		verification_interval = 5,
		release_delay = 2,
		duration = {2, 4},
		notice_requires_FOV = true
	}
	self.settings.custom_boat_gangster = {
		reaction = "REACT_COMBAT",
		filter = "gangster",
		max_range = 4000,
		verification_interval = 1,
		release_delay = 2,
		notice_requires_FOV = false
	}
	self.settings.custom_law_cbt = {
		reaction = "REACT_COMBAT",
		filter = "law_enforcer",
		verification_interval = 1,
		uncover_range = 350,
		release_delay = 1,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true
	}
	self.settings.custom_airport_window = {
		reaction = "REACT_CURIOUS",
		filter = "all_enemy",
		max_range = 1500,
		uncover_range = 100,
		notice_delay_mul = 0.2,
		verification_interval = 1.5,
		release_delay = 6,
		duration = {3, 6},
		notice_requires_FOV = true
	}
	self.settings.custom_look_at = {
		reaction = "REACT_IDLE",
		filter = "all_enemy",
		max_range = 15000,
		notice_delay_mul = 0.2,
		verification_interval = 1,
		release_delay = 3,
		notice_requires_FOV = false
	}
	self.settings.custom_look_at_FOV = {
		reaction = "REACT_CURIOUS",
		filter = "all_enemy",
		max_range = 1500,
		notice_delay_mul = 0.2,
		verification_interval = 1.5,
		release_delay = 6,
		duration = {3, 6},
		notice_requires_FOV = true
	}
	self.settings.custom_server_room = {
		reaction = "REACT_SCARED",
		filter = "all_enemy",
		max_range = 350,
		uncover_range = 100,
		notice_delay_mul = 0.2,
		verification_interval = 1.5,
		release_delay = 6,
		duration = {3, 6},
		notice_requires_FOV = true
	}
end
function AttentionTweakData:_init_drill()
	self.settings.drill_civ_ene_ntl = {
		reaction = "REACT_SCARED",
		filter = "civilians_enemies",
		verification_interval = 0.4,
		suspicion_range = 1100,
		max_range = 2300,
		uncover_range = 200,
		release_delay = 1,
		notice_requires_FOV = false
	}
	self.settings.drill_silent_civ_ene_ntl = {
		reaction = "REACT_SCARED",
		filter = "civilians_enemies",
		verification_interval = 0.4,
		suspicion_range = 1000,
		max_range = 2200,
		uncover_range = 200,
		release_delay = 1,
		notice_requires_FOV = true
	}
end
function AttentionTweakData:_init_sentry_gun()
	self.settings.sentry_gun_enemy_cbt = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 1.5,
		uncover_range = 300,
		release_delay = 1
	}
	self.settings.sentry_gun_enemy_cbt_hacked = {
		reaction = "REACT_COMBAT",
		filter = "combatant",
		relation = "foe",
		verification_interval = 1.5,
		uncover_range = 300,
		release_delay = 1,
		weight_mul = 0.2
	}
end
function AttentionTweakData:_init_prop()
	self.settings.prop_carry_bag = {
		reaction = "REACT_SCARED",
		filter = "law_enforcer",
		suspicion_range = 800,
		max_range = 1800,
		verification_interval = 0.4,
		uncover_range = 200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.prop_carry_bodybag = {
		reaction = "REACT_SCARED",
		filter = "civilians_enemies",
		suspicion_range = 800,
		max_range = 1900,
		verification_interval = 0.4,
		uncover_range = 200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.prop_civ_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "civilians_enemies",
		verification_interval = 0.4,
		uncover_range = 500,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.prop_ene_ntl_edaycrate = {
		reaction = "REACT_AIM",
		filter = "all_enemy",
		verification_interval = 0.4,
		uncover_range = 300,
		release_delay = 1,
		notice_requires_FOV = true,
		max_range = 700
	}
	self.settings.prop_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "all_enemy",
		verification_interval = 0.4,
		uncover_range = 500,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.broken_cam_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 100,
		suspicion_range = 1000,
		max_range = 1200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.prop_law_scary = {
		reaction = "REACT_SCARED",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 300,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.prop_state_civ_ene_ntl = {
		reaction = "REACT_CURIOUS",
		filter = "civilians_enemies",
		verification_interval = 0.4,
		uncover_range = 200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.no_staff_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 100,
		suspicion_range = 1000,
		max_range = 1200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.timelock_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 100,
		suspicion_range = 1000,
		max_range = 1200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.open_security_gate_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 100,
		suspicion_range = 1000,
		max_range = 1200,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.open_vault_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "law_enforcer",
		verification_interval = 0.4,
		uncover_range = 100,
		suspicion_range = 500,
		max_range = 600,
		release_delay = 1,
		notice_requires_FOV = true
	}
	self.settings.vehicle_enemy_cbt = {
		reaction = "REACT_SHOOT",
		filter = "all",
		relation = "foe",
		max_range = 20000,
		notice_interval = 1,
		verification_interval = 1.5,
		uncover_range = 1200,
		release_delay = 1,
		notice_requires_FOV = true,
		weight_mul = 0.4
	}
	self.settings.open_elevator_ene_ntl = {
		reaction = "REACT_AIM",
		filter = "civilians_enemies",
		verification_interval = 0.4,
		uncover_range = 800,
		suspicion_range = 1200,
		max_range = 1500,
		release_delay = 1,
		notice_requires_FOV = true
	}
end
function AttentionTweakData:get_attention_index(setting_name)
	for i_setting, test_setting_name in ipairs(self.indexes) do
		if setting_name == test_setting_name then
			return i_setting
		end
	end
end
function AttentionTweakData:get_attention_name(index)
	return self.indexes[index]
end
function AttentionTweakData:_post_init()
	for setting_name, setting in pairs(self.settings) do
		local i_insert = 1
		while self.indexes[i_insert] and setting_name >= self.indexes[i_insert] do
			i_insert = i_insert + 1
		end
		table.insert(self.indexes, i_insert, setting_name)
	end
end
