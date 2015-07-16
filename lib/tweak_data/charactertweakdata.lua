CharacterTweakData = CharacterTweakData or class()
function CharacterTweakData:init(tweak_data)
	self:_create_table_structure()
	self.flashbang_multiplier = 1
	local presets = self:_presets(tweak_data)
	self.presets = presets
	self:_init_security(presets)
	self:_init_gensec(presets)
	self:_init_cop(presets)
	self:_init_fbi(presets)
	self:_init_swat(presets)
	self:_init_heavy_swat(presets)
	self:_init_fbi_swat(presets)
	self:_init_fbi_heavy_swat(presets)
	self:_init_city_swat(presets)
	self:_init_sniper(presets)
	self:_init_gangster(presets)
	self:_init_biker_escape(presets)
	self:_init_mobster(presets)
	self:_init_mobster_boss(presets)
	self:_init_hector_boss(presets)
	self:_init_hector_boss_no_armor(presets)
	self:_init_tank(presets)
	self:_init_spooc(presets)
	self:_init_shield(presets)
	self:_init_taser(presets)
	self:_init_civilian(presets)
	self:_init_bank_manager(presets)
	self:_init_drunk_pilot(presets)
	self:_init_escort(presets)
	self:_init_russian(presets)
	self:_init_german(presets)
	self:_init_spanish(presets)
	self:_init_american(presets)
	self:_init_jowi(presets)
	self:_init_old_hoxton(presets)
	self:_init_clover(presets)
	self:_init_dragan(presets)
	self:_init_jacket(presets)
	self:_init_bonnie(presets)
	self:_init_sokol(presets)
	self:_init_old_hoxton_mission(presets)
end
function CharacterTweakData:_init_security(presets)
	self.security = deep_clone(presets.base)
	self.security.experience = {}
	self.security.weapon = presets.weapon.normal
	self.security.detection = presets.detection.guard
	self.security.HEALTH_INIT = 3
	self.security.headshot_dmg_mul = self.security.HEALTH_INIT / 1
	self.security.move_speed = presets.move_speed.normal
	self.security.crouch_move = nil
	self.security.surrender_break_time = {20, 30}
	self.security.suppression = presets.suppression.easy
	self.security.surrender = presets.surrender.easy
	self.security.ecm_vulnerability = 1
	self.security.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.security.weapon_voice = "3"
	self.security.experience.cable_tie = "tie_swat"
	self.security.speech_prefix_p1 = "l"
	self.security.speech_prefix_p2 = "n"
	self.security.speech_prefix_count = 4
	self.security.access = "security"
	self.security.rescue_hostages = false
	self.security.use_radio = nil
	self.security.silent_priority_shout = "f37"
	self.security.dodge = presets.dodge.poor
	self.security.deathguard = false
	self.security.chatter = presets.enemy_chatter.cop
	self.security.has_alarm_pager = true
	self.security.melee_weapon = "baton"
	self.security.steal_loot = nil
end
function CharacterTweakData:_init_gensec(presets)
	self.gensec = deep_clone(presets.base)
	self.gensec.experience = {}
	self.gensec.weapon = presets.weapon.normal
	self.gensec.detection = presets.detection.guard
	self.gensec.HEALTH_INIT = 6
	self.gensec.headshot_dmg_mul = self.gensec.HEALTH_INIT / 1
	self.gensec.move_speed = presets.move_speed.normal
	self.gensec.crouch_move = nil
	self.gensec.surrender_break_time = {20, 30}
	self.gensec.suppression = presets.suppression.hard
	self.gensec.surrender = presets.surrender.hard
	self.gensec.ecm_vulnerability = 1
	self.gensec.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.gensec.weapon_voice = "3"
	self.gensec.experience.cable_tie = "tie_swat"
	self.gensec.speech_prefix_p1 = "l"
	self.gensec.speech_prefix_p2 = "n"
	self.gensec.speech_prefix_count = 4
	self.gensec.access = "security"
	self.gensec.rescue_hostages = false
	self.gensec.use_radio = nil
	self.gensec.silent_priority_shout = "f37"
	self.gensec.dodge = presets.dodge.athletic
	self.gensec.deathguard = false
	self.gensec.chatter = presets.enemy_chatter.cop
	self.gensec.has_alarm_pager = true
	self.gensec.melee_weapon = "baton"
	self.gensec.steal_loot = nil
end
function CharacterTweakData:_init_cop(presets)
	self.cop = deep_clone(presets.base)
	self.cop.experience = {}
	self.cop.weapon = presets.weapon.normal
	self.cop.detection = presets.detection.normal
	self.cop.HEALTH_INIT = 3
	self.cop.headshot_dmg_mul = self.cop.HEALTH_INIT / 1
	self.cop.move_speed = presets.move_speed.normal
	self.cop.surrender_break_time = {10, 15}
	self.cop.suppression = presets.suppression.easy
	self.cop.surrender = presets.surrender.normal
	self.cop.ecm_vulnerability = 1
	self.cop.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.cop.weapon_voice = "1"
	self.cop.experience.cable_tie = "tie_swat"
	self.cop.speech_prefix_p1 = "l"
	self.cop.speech_prefix_p2 = "n"
	self.cop.speech_prefix_count = 4
	self.cop.access = "cop"
	self.cop.silent_priority_shout = "f37"
	self.cop.dodge = presets.dodge.average
	self.cop.deathguard = true
	self.cop.chatter = presets.enemy_chatter.cop
	self.cop.melee_weapon = "baton"
	self.cop.steal_loot = true
end
function CharacterTweakData:_init_fbi(presets)
	self.fbi = deep_clone(presets.base)
	self.fbi.experience = {}
	self.fbi.weapon = presets.weapon.normal
	self.fbi.detection = presets.detection.normal
	self.fbi.HEALTH_INIT = 5
	self.fbi.headshot_dmg_mul = self.fbi.HEALTH_INIT / 1
	self.fbi.move_speed = presets.move_speed.very_fast
	self.fbi.surrender_break_time = {7, 12}
	self.fbi.suppression = presets.suppression.hard_def
	self.fbi.surrender = presets.surrender.normal
	self.fbi.ecm_vulnerability = 1
	self.fbi.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi.weapon_voice = "2"
	self.fbi.experience.cable_tie = "tie_swat"
	self.fbi.speech_prefix_p1 = "l"
	self.fbi.speech_prefix_p2 = "n"
	self.fbi.speech_prefix_count = 4
	self.fbi.access = "fbi"
	self.fbi.dodge = presets.dodge.athletic
	self.fbi.deathguard = true
	self.fbi.no_arrest = true
	self.fbi.chatter = presets.enemy_chatter.cop
	self.fbi.steal_loot = true
end
function CharacterTweakData:_init_swat(presets)
	self.swat = deep_clone(presets.base)
	self.swat.experience = {}
	self.swat.weapon = presets.weapon.normal
	self.swat.detection = presets.detection.normal
	self.swat.HEALTH_INIT = 8
	self.swat.headshot_dmg_mul = self.swat.HEALTH_INIT / 2
	self.swat.move_speed = presets.move_speed.fast
	self.swat.surrender_break_time = {6, 10}
	self.swat.suppression = presets.suppression.hard_agg
	self.swat.surrender = presets.surrender.hard
	self.swat.ecm_vulnerability = 1
	self.swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.swat.weapon_voice = "2"
	self.swat.experience.cable_tie = "tie_swat"
	self.swat.speech_prefix_p1 = "l"
	self.swat.speech_prefix_p2 = "n"
	self.swat.speech_prefix_count = 4
	self.swat.access = "swat"
	self.swat.dodge = presets.dodge.athletic
	self.swat.no_arrest = true
	self.swat.chatter = presets.enemy_chatter.swat
	self.swat.melee_weapon = "knife_1"
	self.swat.melee_weapon_dmg_multiplier = 1
	self.swat.steal_loot = true
end
function CharacterTweakData:_init_heavy_swat(presets)
	self.heavy_swat = deep_clone(presets.base)
	self.heavy_swat.experience = {}
	self.heavy_swat.weapon = presets.weapon.normal
	self.heavy_swat.detection = presets.detection.normal
	self.heavy_swat.HEALTH_INIT = 10
	self.heavy_swat.headshot_dmg_mul = self.heavy_swat.HEALTH_INIT / 6
	self.heavy_swat.damage.explosion_damage_mul = 0.9
	self.heavy_swat.move_speed = presets.move_speed.fast
	self.heavy_swat.surrender_break_time = {6, 8}
	self.heavy_swat.suppression = presets.suppression.hard_agg
	self.heavy_swat.surrender = presets.surrender.hard
	self.heavy_swat.ecm_vulnerability = 1
	self.heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.heavy_swat.weapon_voice = "2"
	self.heavy_swat.experience.cable_tie = "tie_swat"
	self.heavy_swat.speech_prefix_p1 = "l"
	self.heavy_swat.speech_prefix_p2 = "n"
	self.heavy_swat.speech_prefix_count = 4
	self.heavy_swat.access = "swat"
	self.heavy_swat.dodge = presets.dodge.heavy
	self.heavy_swat.no_arrest = true
	self.heavy_swat.chatter = presets.enemy_chatter.swat
	self.heavy_swat.steal_loot = true
end
function CharacterTweakData:_init_fbi_swat(presets)
	self.fbi_swat = deep_clone(presets.base)
	self.fbi_swat.experience = {}
	self.fbi_swat.weapon = presets.weapon.good
	self.fbi_swat.detection = presets.detection.normal
	self.fbi_swat.HEALTH_INIT = 13
	self.fbi_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 4
	self.fbi_swat.move_speed = presets.move_speed.very_fast
	self.fbi_swat.surrender_break_time = {6, 10}
	self.fbi_swat.suppression = presets.suppression.hard_def
	self.fbi_swat.surrender = presets.surrender.hard
	self.fbi_swat.ecm_vulnerability = 1
	self.fbi_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_swat.weapon_voice = "2"
	self.fbi_swat.experience.cable_tie = "tie_swat"
	self.fbi_swat.speech_prefix_p1 = "l"
	self.fbi_swat.speech_prefix_p2 = "n"
	self.fbi_swat.speech_prefix_count = 4
	self.fbi_swat.access = "swat"
	self.fbi_swat.dodge = presets.dodge.athletic
	self.fbi_swat.no_arrest = true
	self.fbi_swat.chatter = presets.enemy_chatter.swat
	self.fbi_swat.melee_weapon = "knife_1"
	self.fbi_swat.steal_loot = true
end
function CharacterTweakData:_init_fbi_heavy_swat(presets)
	self.fbi_heavy_swat = deep_clone(presets.base)
	self.fbi_heavy_swat.experience = {}
	self.fbi_heavy_swat.weapon = presets.weapon.good
	self.fbi_heavy_swat.detection = presets.detection.normal
	self.fbi_heavy_swat.HEALTH_INIT = 20
	self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.HEALTH_INIT / 10
	self.fbi_heavy_swat.damage.explosion_damage_mul = 0.9
	self.fbi_heavy_swat.move_speed = presets.move_speed.fast
	self.fbi_heavy_swat.surrender_break_time = {6, 8}
	self.fbi_heavy_swat.suppression = presets.suppression.hard_agg
	self.fbi_heavy_swat.surrender = presets.surrender.hard
	self.fbi_heavy_swat.ecm_vulnerability = 1
	self.fbi_heavy_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.fbi_heavy_swat.weapon_voice = "2"
	self.fbi_heavy_swat.experience.cable_tie = "tie_swat"
	self.fbi_heavy_swat.speech_prefix_p1 = "l"
	self.fbi_heavy_swat.speech_prefix_p2 = "n"
	self.fbi_heavy_swat.speech_prefix_count = 4
	self.fbi_heavy_swat.access = "swat"
	self.fbi_heavy_swat.dodge = presets.dodge.heavy
	self.fbi_heavy_swat.no_arrest = true
	self.fbi_heavy_swat.chatter = presets.enemy_chatter.swat
	self.fbi_heavy_swat.steal_loot = true
end
function CharacterTweakData:_init_city_swat(presets)
	self.city_swat = deep_clone(presets.base)
	self.city_swat.experience = {}
	self.city_swat.weapon = presets.weapon.good
	self.city_swat.detection = presets.detection.normal
	self.city_swat.HEALTH_INIT = 13
	self.city_swat.headshot_dmg_mul = self.city_swat.HEALTH_INIT / 4
	self.city_swat.move_speed = presets.move_speed.very_fast
	self.city_swat.surrender_break_time = {6, 10}
	self.city_swat.suppression = presets.suppression.hard_def
	self.city_swat.surrender = presets.surrender.hard
	self.city_swat.ecm_vulnerability = 1
	self.city_swat.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.city_swat.weapon_voice = "2"
	self.city_swat.experience.cable_tie = "tie_swat"
	self.city_swat.silent_priority_shout = "f37"
	self.city_swat.speech_prefix_p1 = "l"
	self.city_swat.speech_prefix_p2 = "n"
	self.city_swat.speech_prefix_count = 4
	self.city_swat.access = "swat"
	self.city_swat.dodge = presets.dodge.athletic
	self.city_swat.chatter = presets.enemy_chatter.swat
	self.city_swat.melee_weapon = "knife_1"
	self.city_swat.steal_loot = true
	self.city_swat.has_alarm_pager = true
end
function CharacterTweakData:_init_sniper(presets)
	self.sniper = deep_clone(presets.base)
	self.sniper.experience = {}
	self.sniper.weapon = presets.weapon.sniper
	self.sniper.detection = presets.detection.sniper
	self.sniper.HEALTH_INIT = 4
	self.sniper.headshot_dmg_mul = self.sniper.HEALTH_INIT / 2
	self.sniper.move_speed = presets.move_speed.normal
	self.sniper.shooting_death = false
	self.sniper.suppression = presets.suppression.easy
	self.sniper.ecm_vulnerability = 1
	self.sniper.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.sniper.weapon_voice = "1"
	self.sniper.experience.cable_tie = "tie_swat"
	self.sniper.speech_prefix_p1 = "l"
	self.sniper.speech_prefix_p2 = "n"
	self.sniper.speech_prefix_count = 4
	self.sniper.priority_shout = "f34"
	self.sniper.access = "sniper"
	self.sniper.no_retreat = true
	self.sniper.no_arrest = true
	self.sniper.chatter = presets.enemy_chatter.no_chatter
	self.sniper.steal_loot = nil
end
function CharacterTweakData:_init_gangster(presets)
	self.gangster = deep_clone(presets.base)
	self.gangster.experience = {}
	self.gangster.weapon = presets.weapon.good
	self.gangster.detection = presets.detection.normal
	self.gangster.HEALTH_INIT = 4
	self.gangster.headshot_dmg_mul = self.gangster.HEALTH_INIT / 1
	self.gangster.move_speed = presets.move_speed.fast
	self.gangster.suspicious = nil
	self.gangster.suppression = presets.suppression.easy
	self.gangster.surrender = nil
	self.gangster.ecm_vulnerability = 1
	self.gangster.ecm_hurts = {
		ears = {min_duration = 8, max_duration = 10}
	}
	self.gangster.no_arrest = true
	self.gangster.no_retreat = true
	self.gangster.weapon_voice = "3"
	self.gangster.experience.cable_tie = "tie_swat"
	self.gangster.speech_prefix_p1 = "l"
	self.gangster.speech_prefix_p2 = "n"
	self.gangster.speech_prefix_count = 4
	self.gangster.silent_priority_shout = "f37"
	self.gangster.access = "gangster"
	self.gangster.rescue_hostages = false
	self.gangster.use_radio = nil
	self.gangster.dodge = presets.dodge.average
	self.gangster.challenges = {type = "gangster"}
	self.gangster.chatter = presets.enemy_chatter.no_chatter
	self.gangster.melee_weapon = "fists"
	self.gangster.steal_loot = nil
end
function CharacterTweakData:_init_biker_escape(presets)
	self.biker_escape = deep_clone(self.gangster)
	self.biker_escape.melee_weapon = "knife_1"
	self.biker_escape.move_speed = presets.move_speed.very_fast
	self.biker_escape.HEALTH_INIT = 8
	self.biker_escape.suppression = nil
end
function CharacterTweakData:_init_mobster(presets)
	self.mobster = deep_clone(self.gangster)
	self.mobster.calls_in = nil
end
function CharacterTweakData:_init_mobster_boss(presets)
	self.mobster_boss = deep_clone(presets.base)
	self.mobster_boss.experience = {}
	self.mobster_boss.weapon = deep_clone(presets.weapon.good)
	self.mobster_boss.weapon.ak47 = {}
	self.mobster_boss.weapon.ak47.aim_delay = {0.1, 0.2}
	self.mobster_boss.weapon.ak47.focus_delay = 4
	self.mobster_boss.weapon.ak47.focus_dis = 200
	self.mobster_boss.weapon.ak47.spread = 20
	self.mobster_boss.weapon.ak47.miss_dis = 40
	self.mobster_boss.weapon.ak47.RELOAD_SPEED = 1
	self.mobster_boss.weapon.ak47.melee_speed = 1
	self.mobster_boss.weapon.ak47.melee_dmg = 25
	self.mobster_boss.weapon.ak47.melee_retry_delay = {1, 2}
	self.mobster_boss.weapon.ak47.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	self.mobster_boss.weapon.ak47.autofire_rounds = {20, 30}
	self.mobster_boss.weapon.ak47.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 4,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 3.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 3,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	self:_process_weapon_usage_table(self.mobster_boss.weapon)
	self.mobster_boss.detection = presets.detection.normal
	self.mobster_boss.HEALTH_INIT = 350
	self.mobster_boss.headshot_dmg_mul = 2
	self.mobster_boss.damage.explosion_damage_mul = 1
	self.mobster_boss.damage.hurt_severity = presets.hurt_severities.base_no_poison
	self.mobster_boss.move_speed = presets.move_speed.very_slow
	self.mobster_boss.allowed_poses = {stand = true}
	self.mobster_boss.no_retreat = true
	self.mobster_boss.no_arrest = true
	self.mobster_boss.surrender = nil
	self.mobster_boss.ecm_vulnerability = 0.85
	self.mobster_boss.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.mobster_boss.weapon_voice = "3"
	self.mobster_boss.experience.cable_tie = "tie_swat"
	self.mobster_boss.access = "gangster"
	self.mobster_boss.speech_prefix_p1 = "l"
	self.mobster_boss.speech_prefix_p2 = "n"
	self.mobster_boss.speech_prefix_count = 4
	self.mobster_boss.rescue_hostages = false
	self.mobster_boss.melee_weapon = "fists"
	self.mobster_boss.melee_weapon_dmg_multiplier = 2.5
	self.mobster_boss.steal_loot = nil
	self.mobster_boss.calls_in = nil
	self.mobster_boss.chatter = presets.enemy_chatter.no_chatter
	self.mobster_boss.use_radio = nil
	self.mobster_boss.can_be_tased = false
end
function CharacterTweakData:_init_hector_boss(presets)
	self.hector_boss = deep_clone(self.mobster_boss)
	self.hector_boss.DAMAGE_CLAMP_BULLET = 320
	self.hector_boss.DAMAGE_CLAMP_EXPLOSION = 550
	self.hector_boss.melee_weapon_dmg_multiplier = 2.5
	self.hector_boss.HEALTH_INIT = 900
	self.hector_boss.weapon.saiga = {}
	self.hector_boss.weapon.saiga.aim_delay = {0.1, 0.1}
	self.hector_boss.weapon.saiga.focus_delay = 4
	self.hector_boss.weapon.saiga.focus_dis = 200
	self.hector_boss.weapon.saiga.spread = 20
	self.hector_boss.weapon.saiga.miss_dis = 40
	self.hector_boss.weapon.saiga.RELOAD_SPEED = 0.5
	self.hector_boss.weapon.saiga.melee_speed = 1
	self.hector_boss.weapon.saiga.melee_dmg = 25
	self.hector_boss.weapon.saiga.melee_retry_delay = {1, 2}
	self.hector_boss.weapon.saiga.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	self.hector_boss.weapon.saiga.autofire_rounds = presets.weapon.deathwish.m4.autofire_rounds
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 2.2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 1.75,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.can_be_tased = false
	self:_process_weapon_usage_table(self.hector_boss.weapon)
end
function CharacterTweakData:_init_hector_boss_no_armor(presets)
	self.hector_boss_no_armor = deep_clone(self.fbi)
	self.hector_boss_no_armor.damage.hurt_severity = presets.hurt_severities.base_no_poison
	self.hector_boss_no_armor.no_retreat = true
	self.hector_boss_no_armor.no_arrest = true
	self.hector_boss_no_armor.surrender = nil
	self.hector_boss_no_armor.access = "gangster"
	self.hector_boss_no_armor.rescue_hostages = false
	self.hector_boss_no_armor.steal_loot = nil
	self.hector_boss_no_armor.calls_in = nil
	self.hector_boss_no_armor.chatter = presets.enemy_chatter.no_chatter
	self.hector_boss_no_armor.use_radio = nil
	self.hector_boss_no_armor.can_be_tased = false
end
function CharacterTweakData:_init_tank(presets)
	self.tank = deep_clone(presets.base)
	self.tank.experience = {}
	self.tank.weapon = deep_clone(presets.weapon.good)
	self.tank.weapon.r870.FALLOFF[1].dmg_mul = 6.5
	self.tank.weapon.r870.FALLOFF[2].dmg_mul = 4.5
	self.tank.weapon.r870.FALLOFF[3].dmg_mul = 2
	self.tank.weapon.r870.RELOAD_SPEED = 1
	self.tank.weapon.saiga = {}
	self.tank.weapon.saiga.aim_delay = {0.1, 0.1}
	self.tank.weapon.saiga.focus_delay = 4
	self.tank.weapon.saiga.focus_dis = 200
	self.tank.weapon.saiga.spread = 20
	self.tank.weapon.saiga.miss_dis = 40
	self.tank.weapon.saiga.RELOAD_SPEED = 0.5
	self.tank.weapon.saiga.melee_speed = 1
	self.tank.weapon.saiga.melee_dmg = 25
	self.tank.weapon.saiga.melee_retry_delay = {1, 2}
	self.tank.weapon.saiga.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	self.tank.weapon.saiga.autofire_rounds = presets.weapon.deathwish.m4.autofire_rounds
	self.tank.weapon.saiga.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 1.75,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.ak47 = {}
	self.tank.weapon.ak47.aim_delay = {0.1, 0.2}
	self.tank.weapon.ak47.focus_delay = 4
	self.tank.weapon.ak47.focus_dis = 800
	self.tank.weapon.ak47.spread = 20
	self.tank.weapon.ak47.miss_dis = 40
	self.tank.weapon.ak47.RELOAD_SPEED = 0.5
	self.tank.weapon.ak47.melee_speed = 1
	self.tank.weapon.ak47.melee_dmg = 25
	self.tank.weapon.ak47.melee_retry_delay = {1, 2}
	self.tank.weapon.ak47.range = {
		close = 1000,
		optimal = 2500,
		far = 5000
	}
	self.tank.weapon.ak47.autofire_rounds = {20, 40}
	self.tank.weapon.ak47.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.7},
			dmg_mul = 4,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				8
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 3.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				3,
				6,
				6
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				1
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 3,
			recoil = {1, 1.2},
			mode = {
				4,
				2,
				1,
				0
			}
		}
	}
	self:_process_weapon_usage_table(self.tank.weapon)
	self.tank.detection = presets.detection.normal
	self.tank.HEALTH_INIT = 550
	self.tank.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank.damage.explosion_damage_mul = 1
	self.tank.move_speed = presets.move_speed.very_slow
	self.tank.allowed_stances = {cbt = true}
	self.tank.allowed_poses = {stand = true}
	self.tank.crouch_move = false
	self.tank.no_run_start = true
	self.tank.no_run_stop = true
	self.tank.no_retreat = true
	self.tank.no_arrest = true
	self.tank.surrender = nil
	self.tank.ecm_vulnerability = 0.85
	self.tank.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.tank.weapon_voice = "3"
	self.tank.experience.cable_tie = "tie_swat"
	self.tank.access = "tank"
	self.tank.speech_prefix_p1 = "bdz"
	self.tank.speech_prefix_p2 = nil
	self.tank.speech_prefix_count = nil
	self.tank.priority_shout = "f30"
	self.tank.rescue_hostages = false
	self.tank.deathguard = true
	self.tank.melee_weapon = "fists"
	self.tank.melee_weapon_dmg_multiplier = 2.5
	self.tank.critical_hits = {
		damage_mul = self.tank.headshot_dmg_mul * 0.5
	}
	self.tank.damage.hurt_severity = presets.hurt_severities.only_light_hurt_and_fire
	self.tank.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.tank.announce_incomming = "incomming_tank"
	self.tank.steal_loot = nil
	self.tank.calls_in = nil
	self.tank.use_animation_on_fire_damage = false
	self.tank.flammable = true
	self.tank.can_be_tased = false
	self.tank_hw = deep_clone(self.tank)
	self.tank_hw.move_speed = {
		stand = {
			walk = {
				ntl = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 70,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		},
		crouch = {
			walk = {
				hos = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 60,
					bwd = 56
				}
			},
			run = {
				hos = {
					fwd = 72,
					strafe = 65,
					bwd = 56
				},
				cbt = {
					fwd = 72,
					strafe = 50,
					bwd = 60
				}
			}
		}
	}
	self.tank_hw.HEALTH_INIT = 1100
	self.tank_hw.headshot_dmg_mul = self.tank.HEALTH_INIT / 24
	self.tank_hw.damage.explosion_damage_mul = 1
	self.tank_hw.use_animation_on_fire_damage = false
	self.tank_hw.flammable = true
	self.tank_hw.can_be_tased = false
end
function CharacterTweakData:_init_spooc(presets)
	self.spooc = deep_clone(presets.base)
	self.spooc.experience = {}
	self.spooc.weapon = deep_clone(presets.weapon.good)
	self.spooc.detection = presets.detection.normal
	self.spooc.HEALTH_INIT = 60
	self.spooc.headshot_dmg_mul = self.spooc.HEALTH_INIT / 14
	self.spooc.move_speed = presets.move_speed.lightning
	self.spooc.no_retreat = true
	self.spooc.no_arrest = true
	self.spooc.damage.hurt_severity = presets.hurt_severities.only_fire_and_poison_hurts
	self.spooc.surrender_break_time = {4, 6}
	self.spooc.suppression = nil
	self.spooc.surrender = presets.surrender.special
	self.spooc.priority_shout = "f33"
	self.spooc.priority_shout_max_dis = 700
	self.spooc.rescue_hostages = false
	self.spooc.spooc_attack_timeout = {10, 10}
	self.spooc.spooc_attack_beating_time = {3, 3}
	self.spooc.spooc_attack_use_smoke_chance = 1
	self.spooc.weapon_voice = "3"
	self.spooc.experience.cable_tie = "tie_swat"
	self.spooc.speech_prefix_p1 = "clk"
	self.spooc.speech_prefix_count = nil
	self.spooc.access = "spooc"
	self.spooc.use_animation_on_fire_damage = false
	self.spooc.flammable = true
	self.spooc.dodge = presets.dodge.ninja
	self.spooc.dodge_with_grenade = {
		smoke = {
			duration = {10, 20}
		}
	}
	function self.spooc.dodge_with_grenade.check(t, nr_grenades_used)
		local delay_till_next_use = math.lerp(17, 45, math.min(1, (nr_grenades_used or 0) / 4))
		local chance = math.lerp(1, 0.5, math.min(1, (nr_grenades_used or 0) / 10))
		if chance > math.random() then
			return true, t + delay_till_next_use
		end
		return false, t + delay_till_next_use
	end
	self.spooc.chatter = presets.enemy_chatter.no_chatter
	self.spooc.steal_loot = nil
	self.spooc.spawn_sound_event = "cloaker_presence_loop"
	self.spooc.die_sound_event = "cloaker_presence_stop"
end
function CharacterTweakData:_init_shield(presets)
	self.shield = deep_clone(presets.base)
	self.shield.experience = {}
	self.shield.weapon = deep_clone(presets.weapon.normal)
	self.shield.detection = presets.detection.normal
	self.shield.HEALTH_INIT = 10
	self.shield.headshot_dmg_mul = self.shield.HEALTH_INIT / 6
	self.shield.allowed_stances = {cbt = true}
	self.shield.allowed_poses = {crouch = true}
	self.shield.always_face_enemy = true
	self.shield.move_speed = presets.move_speed.fast
	self.shield.no_run_start = true
	self.shield.no_run_stop = true
	self.shield.no_retreat = true
	self.shield.no_arrest = true
	self.shield.surrender = nil
	self.shield.ecm_vulnerability = 0.9
	self.shield.ecm_hurts = {
		ears = {min_duration = 7, max_duration = 9}
	}
	self.shield.priority_shout = "f31"
	self.shield.rescue_hostages = false
	self.shield.deathguard = false
	self.shield.no_equip_anim = true
	self.shield.wall_fwd_offset = 100
	self.shield.damage.explosion_damage_mul = 0.8
	self.shield.calls_in = nil
	self.shield.damage.hurt_severity = presets.hurt_severities.only_explosion_hurts
	self.shield.damage.shield_knocked = true
	self.shield.use_animation_on_fire_damage = false
	self.shield.flammable = true
	self.shield.weapon.mp9 = {}
	self.shield.weapon.mp9.aim_delay = {0, 0.1}
	self.shield.weapon.mp9.focus_delay = 2
	self.shield.weapon.mp9.focus_dis = 250
	self.shield.weapon.mp9.spread = 60
	self.shield.weapon.mp9.miss_dis = 15
	self.shield.weapon.mp9.RELOAD_SPEED = 1
	self.shield.weapon.mp9.melee_speed = nil
	self.shield.weapon.mp9.melee_dmg = nil
	self.shield.weapon.mp9.melee_retry_delay = nil
	self.shield.weapon.mp9.range = {
		close = 500,
		optimal = 1200,
		far = 3000
	}
	self.shield.weapon.mp9.autofire_rounds = presets.weapon.normal.mp5.autofire_rounds
	self.shield.weapon.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 4,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 700,
			acc = {0.5, 0.75},
			dmg_mul = 3,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.45, 0.65},
			dmg_mul = 2,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 2,
			recoil = {0.35, 1.2},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 1,
			recoil = {0.35, 1.5},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.c45 = {}
	self.shield.weapon.c45.aim_delay = {0, 0.2}
	self.shield.weapon.c45.focus_delay = 2
	self.shield.weapon.c45.focus_dis = 250
	self.shield.weapon.c45.spread = 60
	self.shield.weapon.c45.miss_dis = 15
	self.shield.weapon.c45.RELOAD_SPEED = 1
	self.shield.weapon.c45.melee_speed = nil
	self.shield.weapon.c45.melee_dmg = nil
	self.shield.weapon.c45.melee_retry_delay = nil
	self.shield.weapon.c45.range = {
		close = 500,
		optimal = 900,
		far = 3000
	}
	self.shield.weapon.c45.FALLOFF = {
		{
			r = 0,
			acc = {0.5, 0.9},
			dmg_mul = 4,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.5, 0.8},
			dmg_mul = 1.5,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.6},
			dmg_mul = 1.25,
			recoil = {0.35, 0.55},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.5},
			dmg_mul = 1,
			recoil = {0.35, 0.75},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.25},
			dmg_mul = 1,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self:_process_weapon_usage_table(self.shield.weapon)
	self.shield.weapon_voice = "3"
	self.shield.experience.cable_tie = "tie_swat"
	self.shield.speech_prefix_p1 = "l"
	self.shield.speech_prefix_p2 = "n"
	self.shield.speech_prefix_count = 4
	self.shield.access = "shield"
	self.shield.chatter = presets.enemy_chatter.shield
	self.shield.announce_incomming = "incomming_shield"
	self.shield.steal_loot = nil
	self.shield.use_animation_on_fire_damage = false
end
function CharacterTweakData:_init_taser(presets)
	self.taser = deep_clone(presets.base)
	self.taser.experience = {}
	self.taser.weapon = {
		m4 = {
			aim_delay = {0.1, 0.1},
			focus_delay = 4,
			focus_dis = 200,
			spread = 20,
			miss_dis = 40,
			RELOAD_SPEED = 0.66,
			melee_speed = 0.5,
			melee_dmg = 10,
			melee_retry_delay = {1, 2},
			tase_distance = 1500,
			aim_delay_tase = {0, 0},
			range = {
				close = 1000,
				optimal = 2000,
				far = 5000
			},
			autofire_rounds = presets.weapon.normal.m4.autofire_rounds,
			FALLOFF = {
				{
					r = 100,
					acc = {0.6, 0.9},
					dmg_mul = 3,
					recoil = {0.4, 0.7},
					mode = {
						0,
						3,
						3,
						1
					}
				},
				{
					r = 500,
					acc = {0.75, 0.95},
					dmg_mul = 2.5,
					recoil = {0.35, 0.7},
					mode = {
						0,
						3,
						3,
						1
					}
				},
				{
					r = 1000,
					acc = {0.65, 0.95},
					dmg_mul = 2,
					recoil = {0.35, 0.75},
					mode = {
						1,
						2,
						2,
						0
					}
				},
				{
					r = 2000,
					acc = {0.65, 0.8},
					dmg_mul = 1.25,
					recoil = {0.4, 1.2},
					mode = {
						3,
						2,
						2,
						0
					}
				},
				{
					r = 3000,
					acc = {0.45, 0.6},
					dmg_mul = 1,
					recoil = {1.5, 3},
					mode = {
						3,
						1,
						1,
						0
					}
				}
			}
		}
	}
	self.taser.detection = presets.detection.normal
	self.taser.HEALTH_INIT = 36
	self.taser.headshot_dmg_mul = self.taser.HEALTH_INIT / 20
	self.taser.move_speed = presets.move_speed.fast
	self.taser.no_retreat = true
	self.taser.no_arrest = true
	self.taser.surrender = presets.surrender.special
	self.taser.ecm_vulnerability = 0.9
	self.taser.ecm_hurts = {
		ears = {min_duration = 6, max_duration = 8}
	}
	self.taser.surrender_break_time = {4, 6}
	self.taser.suppression = nil
	self.taser.weapon_voice = "3"
	self.taser.experience.cable_tie = "tie_swat"
	self.taser.speech_prefix_p1 = "tsr"
	self.taser.speech_prefix_p2 = nil
	self.taser.speech_prefix_count = nil
	self.taser.access = "taser"
	self.taser.dodge = presets.dodge.athletic
	self.taser.priority_shout = "f32"
	self.taser.rescue_hostages = false
	self.taser.deathguard = true
	self.taser.chatter = {
		aggressive = true,
		retreat = true,
		go_go = true,
		contact = true,
		entrance = true
	}
	self.taser.announce_incomming = "incomming_taser"
	self.taser.steal_loot = nil
end
function CharacterTweakData:_init_civilian(presets)
	self.civilian = {
		experience = {}
	}
	self.civilian.detection = presets.detection.civilian
	self.civilian.HEALTH_INIT = 0.9
	self.civilian.headshot_dmg_mul = 1
	self.civilian.move_speed = presets.move_speed.civ_fast
	self.civilian.flee_type = "escape"
	self.civilian.scare_max = {10, 20}
	self.civilian.scare_shot = 1
	self.civilian.scare_intimidate = -5
	self.civilian.submission_max = {60, 120}
	self.civilian.submission_intimidate = 120
	self.civilian.run_away_delay = {5, 20}
	self.civilian.damage = presets.hurt_severities.no_hurts
	self.civilian.ecm_hurts = {}
	self.civilian.experience.cable_tie = "tie_civ"
	self.civilian.speech_prefix_p1 = "cm"
	self.civilian.speech_prefix_count = 2
	self.civilian.access = "civ_male"
	self.civilian.intimidateable = true
	self.civilian.challenges = {type = "civilians"}
	self.civilian.calls_in = true
	self.civilian_female = deep_clone(self.civilian)
	self.civilian_female.speech_prefix_p1 = "cf"
	self.civilian_female.speech_prefix_count = 5
	self.civilian_female.female = true
	self.civilian_female.access = "civ_female"
end
function CharacterTweakData:_init_bank_manager(presets)
	self.bank_manager = {
		experience = {},
		escort = {}
	}
	self.bank_manager.detection = presets.detection.civilian
	self.bank_manager.HEALTH_INIT = self.civilian.HEALTH_INIT
	self.bank_manager.headshot_dmg_mul = self.civilian.headshot_dmg_mul
	self.bank_manager.move_speed = presets.move_speed.normal
	self.bank_manager.flee_type = "hide"
	self.bank_manager.scare_max = {10, 20}
	self.bank_manager.scare_shot = 1
	self.bank_manager.scare_intimidate = -2
	self.bank_manager.submission_max = {60, 120}
	self.bank_manager.submission_intimidate = 60
	self.bank_manager.damage = presets.hurt_severities.no_hurts
	self.bank_manager.ecm_vulnerability = 0.8
	self.bank_manager.ecm_hurts = {
		ears = {min_duration = 1, max_duration = 5}
	}
	self.bank_manager.experience.cable_tie = "tie_civ"
	self.bank_manager.speech_prefix_p1 = "cm"
	self.bank_manager.speech_prefix_count = 2
	self.bank_manager.escort.scared_duration = 45
	self.bank_manager.escort.shot_scare = 25
	self.bank_manager.escort.yell_scare = -25
	self.bank_manager.escort.yell_timeout = 2
	self.bank_manager.access = "civ_male"
	self.bank_manager.intimidateable = true
	self.bank_manager.challenges = {type = "civilians"}
	self.bank_manager.calls_in = true
	self.bank_manager.outline_on_discover = true
end
function CharacterTweakData:_init_drunk_pilot(presets)
	self.drunk_pilot = deep_clone(self.civilian)
	self.drunk_pilot.move_speed = presets.move_speed.civ_fast
	self.drunk_pilot.flee_type = "hide"
	self.drunk_pilot.access = "civ_male"
	self.drunk_pilot.intimidateable = nil
	self.drunk_pilot.challenges = {type = "civilians"}
	self.drunk_pilot.calls_in = nil
	self.drunk_pilot.ignores_aggression = true
end
function CharacterTweakData:_init_escort(presets)
	self.escort = {
		experience = {},
		escort = {}
	}
	self.escort.detection = presets.detection.civilian
	self.escort.HEALTH_INIT = 0.9
	self.escort.headshot_dmg_mul = 1
	self.escort.move_speed = presets.move_speed.civ_fast
	self.escort.flee_type = "hide"
	self.escort.scare_max = {10, 20}
	self.escort.scare_shot = 1
	self.escort.scare_intimidate = -5
	self.escort.submission_max = {60, 120}
	self.escort.submission_intimidate = 120
	self.escort.run_away_delay = {5, 20}
	self.escort.damage = presets.hurt_severities.no_hurts
	self.escort.ecm_hurts = {}
	self.escort.experience.cable_tie = "tie_civ"
	self.escort.speech_prefix_p1 = "cm"
	self.escort.speech_prefix_count = 2
	self.escort.access = "civ_male"
	self.escort.intimidateable = false
	self.escort.challenges = {type = "civilians"}
	self.escort.calls_in = nil
	self.escort.is_escort = true
	self.escort.escort_idle_talk = true
	self.escort.escort_scared_dist = 600
end
function CharacterTweakData:_init_old_hoxton_mission(presets)
	self.old_hoxton_mission = deep_clone(presets.base)
	self.old_hoxton_mission.experience = {}
	self.old_hoxton_mission.weapon = presets.weapon.normal
	self.old_hoxton_mission.detection = presets.detection.normal
	self.old_hoxton_mission.HEALTH_INIT = 8
	self.old_hoxton_mission.headshot_dmg_mul = self.old_hoxton_mission.HEALTH_INIT / 2
	self.old_hoxton_mission.move_speed = presets.move_speed.fast
	self.old_hoxton_mission.surrender_break_time = {6, 10}
	self.old_hoxton_mission.suppression = presets.suppression.hard_def
	self.old_hoxton_mission.surrender = false
	self.old_hoxton_mission.weapon_voice = "1"
	self.old_hoxton_mission.experience.cable_tie = "tie_swat"
	self.old_hoxton_mission.speech_prefix_p1 = "rb2"
	self.old_hoxton_mission.access = "teamAI4"
	self.old_hoxton_mission.dodge = presets.dodge.athletic
	self.old_hoxton_mission.no_arrest = true
	self.old_hoxton_mission.chatter = presets.enemy_chatter.no_chatter
	self.old_hoxton_mission.melee_weapon = "fists"
	self.old_hoxton_mission.melee_weapon_dmg_multiplier = 3
	self.old_hoxton_mission.steal_loot = false
	self.old_hoxton_mission.rescue_hostages = false
end
function CharacterTweakData:_init_russian(presets)
	self.russian = {}
	self.russian.damage = presets.gang_member_damage
	self.russian.weapon = deep_clone(presets.weapon.gang_member)
	self.russian.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92")
	}
	self.russian.detection = presets.detection.gang_member
	self.russian.move_speed = presets.move_speed.fast
	self.russian.crouch_move = false
	self.russian.speech_prefix = "rb2"
	self.russian.weapon_voice = "1"
	self.russian.access = "teamAI1"
	self.russian.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_german(presets)
	self.german = {}
	self.german.damage = presets.gang_member_damage
	self.german.weapon = deep_clone(presets.weapon.gang_member)
	self.german.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5")
	}
	self.german.detection = presets.detection.gang_member
	self.german.move_speed = presets.move_speed.fast
	self.german.crouch_move = false
	self.german.speech_prefix = "rb2"
	self.german.weapon_voice = "2"
	self.german.access = "teamAI1"
	self.german.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_spanish(presets)
	self.spanish = {}
	self.spanish.damage = presets.gang_member_damage
	self.spanish.weapon = deep_clone(presets.weapon.gang_member)
	self.spanish.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
	}
	self.spanish.detection = presets.detection.gang_member
	self.spanish.move_speed = presets.move_speed.fast
	self.spanish.crouch_move = false
	self.spanish.speech_prefix = "rb2"
	self.spanish.weapon_voice = "3"
	self.spanish.access = "teamAI1"
	self.spanish.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_american(presets)
	self.american = {}
	self.american.damage = presets.gang_member_damage
	self.american.weapon = deep_clone(presets.weapon.gang_member)
	self.american.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.american.detection = presets.detection.gang_member
	self.american.move_speed = presets.move_speed.fast
	self.american.crouch_move = false
	self.american.speech_prefix = "rb2"
	self.american.weapon_voice = "3"
	self.american.access = "teamAI1"
	self.american.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_jowi(presets)
	self.jowi = {}
	self.jowi.damage = presets.gang_member_damage
	self.jowi.weapon = deep_clone(presets.weapon.gang_member)
	self.jowi.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.jowi.detection = presets.detection.gang_member
	self.jowi.move_speed = presets.move_speed.fast
	self.jowi.crouch_move = false
	self.jowi.speech_prefix = "rb2"
	self.jowi.weapon_voice = "3"
	self.jowi.access = "teamAI1"
	self.jowi.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_old_hoxton(presets)
	self.old_hoxton = {}
	self.old_hoxton.damage = presets.gang_member_damage
	self.old_hoxton.weapon = deep_clone(presets.weapon.gang_member)
	self.old_hoxton.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
	}
	self.old_hoxton.detection = presets.detection.gang_member
	self.old_hoxton.move_speed = presets.move_speed.fast
	self.old_hoxton.crouch_move = false
	self.old_hoxton.speech_prefix = "rb2"
	self.old_hoxton.weapon_voice = "3"
	self.old_hoxton.access = "teamAI1"
	self.old_hoxton.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_clover(presets)
	self.female_1 = {}
	self.female_1.damage = presets.gang_member_damage
	self.female_1.weapon = deep_clone(presets.weapon.gang_member)
	self.female_1.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
	}
	self.female_1.detection = presets.detection.gang_member
	self.female_1.move_speed = presets.move_speed.fast
	self.female_1.crouch_move = false
	self.female_1.speech_prefix = "rb7"
	self.female_1.weapon_voice = "3"
	self.female_1.access = "teamAI1"
	self.female_1.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_dragan(presets)
	self.dragan = {}
	self.dragan.damage = presets.gang_member_damage
	self.dragan.weapon = deep_clone(presets.weapon.gang_member)
	self.dragan.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.dragan.detection = presets.detection.gang_member
	self.dragan.move_speed = presets.move_speed.fast
	self.dragan.crouch_move = false
	self.dragan.speech_prefix = "rb8"
	self.dragan.weapon_voice = "3"
	self.dragan.access = "teamAI1"
	self.dragan.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_jacket(presets)
	self.jacket = {}
	self.jacket.damage = presets.gang_member_damage
	self.jacket.weapon = deep_clone(presets.weapon.gang_member)
	self.jacket.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45")
	}
	self.jacket.detection = presets.detection.gang_member
	self.jacket.move_speed = presets.move_speed.fast
	self.jacket.crouch_move = false
	self.jacket.speech_prefix = "rb9"
	self.jacket.weapon_voice = "3"
	self.jacket.access = "teamAI1"
	self.jacket.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_bonnie(presets)
	self.bonnie = {}
	self.bonnie.damage = presets.gang_member_damage
	self.bonnie.weapon = deep_clone(presets.weapon.gang_member)
	self.bonnie.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
	}
	self.bonnie.detection = presets.detection.gang_member
	self.bonnie.move_speed = presets.move_speed.fast
	self.bonnie.crouch_move = false
	self.bonnie.speech_prefix = "rb10"
	self.bonnie.weapon_voice = "3"
	self.bonnie.access = "teamAI1"
	self.bonnie.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_init_sokol(presets)
	self.sokol = {}
	self.sokol.damage = presets.gang_member_damage
	self.sokol.weapon = deep_clone(presets.weapon.gang_member)
	self.sokol.weapon.weapons_of_choice = {
		primary = Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		secondary = Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11")
	}
	self.sokol.detection = presets.detection.gang_member
	self.sokol.move_speed = presets.move_speed.fast
	self.sokol.crouch_move = false
	self.sokol.speech_prefix = "rb11"
	self.sokol.weapon_voice = "3"
	self.sokol.access = "teamAI1"
	self.sokol.arrest = {
		timeout = 240,
		aggression_timeout = 6,
		arrest_timeout = 240
	}
end
function CharacterTweakData:_presets(tweak_data)
	local presets = {}
	presets.hurt_severities = {}
	presets.hurt_severities.no_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		}
	}
	presets.hurt_severities.only_light_hurt = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		}
	}
	presets.hurt_severities.only_light_hurt_and_fire = {
		bullet = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{light = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		}
	}
	presets.hurt_severities.light_hurt_fire_poison = deep_clone(presets.hurt_severities.only_light_hurt_and_fire)
	presets.hurt_severities.light_hurt_fire_poison.poison = {
		health_reference = 1,
		zones = {
			{poison = 1}
		}
	}
	presets.hurt_severities.only_explosion_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{explode = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		}
	}
	presets.hurt_severities.only_fire_and_poison_hurts = {
		bullet = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		explosion = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		melee = {
			health_reference = 1,
			zones = {
				{none = 1}
			}
		},
		fire = {
			health_reference = 1,
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = 1,
			zones = {
				{poison = 1}
			}
		}
	}
	presets.hurt_severities.base = {
		bullet = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.2,
					light = 0.7,
					moderate = 0.05,
					heavy = 0.05
				},
				{
					health_limit = 0.6,
					light = 0.4,
					moderate = 0.4,
					heavy = 0.2
				},
				{
					health_limit = 0.9,
					light = 0.2,
					moderate = 0.2,
					heavy = 0.6
				},
				{
					light = 0,
					moderate = 0,
					heavy = 1
				}
			}
		},
		explosion = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.2,
					none = 0.6,
					heavy = 0.4
				},
				{
					health_limit = 0.5,
					heavy = 0.6,
					explode = 0.4
				},
				{heavy = 0.2, explode = 0.8}
			}
		},
		melee = {
			health_reference = "current",
			zones = {
				{
					health_limit = 0.3,
					none = 0.3,
					light = 0.7,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.8,
					light = 1,
					moderate = 0,
					heavy = 0
				},
				{
					health_limit = 0.9,
					light = 0.6,
					moderate = 0.2,
					heavy = 0.2
				},
				{
					light = 0,
					moderate = 0,
					heavy = 9
				}
			}
		},
		fire = {
			health_reference = "current",
			zones = {
				{fire = 1}
			}
		},
		poison = {
			health_reference = "current",
			zones = {
				{none = 0, poison = 1}
			}
		}
	}
	presets.hurt_severities.base_no_poison = deep_clone(presets.hurt_severities.base)
	presets.hurt_severities.base_no_poison.poison = {
		health_reference = 1,
		zones = {
			{none = 1}
		}
	}
	presets.base = {}
	presets.base.HEALTH_INIT = 2.5
	presets.base.headshot_dmg_mul = 2
	presets.base.SPEED_WALK = {
		ntl = 120,
		hos = 180,
		cbt = 160,
		pnc = 160
	}
	presets.base.SPEED_RUN = 370
	presets.base.crouch_move = true
	presets.base.shooting_death = true
	presets.base.suspicious = true
	presets.base.surrender_break_time = {20, 30}
	presets.base.submission_max = {45, 60}
	presets.base.submission_intimidate = 15
	presets.base.speech_prefix = "po"
	presets.base.speech_prefix_count = 1
	presets.base.rescue_hostages = true
	presets.base.use_radio = "dispatch_generic_message"
	presets.base.dodge = nil
	presets.base.challenges = {type = "law"}
	presets.base.calls_in = true
	presets.base.experience = {}
	presets.base.experience.cable_tie = "tie_swat"
	presets.base.damage = {}
	presets.base.damage.hurt_severity = presets.hurt_severities.base
	presets.base.damage.death_severity = 0.5
	presets.base.damage.explosion_damage_mul = 1
	presets.gang_member_damage = {}
	presets.gang_member_damage.HEALTH_INIT = 75
	presets.gang_member_damage.REGENERATE_TIME = 2
	presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	presets.gang_member_damage.DOWNED_TIME = tweak_data.player.damage.DOWNED_TIME
	presets.gang_member_damage.TASED_TIME = tweak_data.player.damage.TASED_TIME
	presets.gang_member_damage.BLEED_OUT_HEALTH_INIT = tweak_data.player.damage.BLEED_OUT_HEALTH_INIT
	presets.gang_member_damage.ARRESTED_TIME = tweak_data.player.damage.ARRESTED_TIME
	presets.gang_member_damage.INCAPACITATED_TIME = tweak_data.player.damage.INCAPACITATED_TIME
	presets.gang_member_damage.hurt_severity = deep_clone(presets.hurt_severities.base)
	presets.gang_member_damage.hurt_severity.bullet = {
		health_reference = "current",
		zones = {
			{
				health_limit = 0.4,
				none = 0.3,
				light = 0.6,
				moderate = 0.1
			},
			{
				health_limit = 0.7,
				none = 0.1,
				light = 0.7,
				moderate = 0.2
			},
			{
				none = 0.1,
				light = 0.5,
				moderate = 0.3,
				heavy = 0.1
			}
		}
	}
	presets.gang_member_damage.MIN_DAMAGE_INTERVAL = 0
	presets.gang_member_damage.respawn_time_penalty = 0
	presets.gang_member_damage.base_respawn_time_penalty = 5
	presets.weapon = {}
	presets.weapon.normal = {
		beretta92 = {},
		c45 = {},
		raging_bull = {},
		m4 = {},
		ak47 = {},
		r870 = {},
		mossberg = {},
		mp5 = {},
		mac11 = {},
		raging_bull = {}
	}
	presets.weapon.normal.beretta92.aim_delay = {0.1, 0.1}
	presets.weapon.normal.beretta92.focus_delay = 10
	presets.weapon.normal.beretta92.focus_dis = 200
	presets.weapon.normal.beretta92.spread = 25
	presets.weapon.normal.beretta92.miss_dis = 30
	presets.weapon.normal.beretta92.RELOAD_SPEED = 0.9
	presets.weapon.normal.beretta92.melee_speed = 1
	presets.weapon.normal.beretta92.melee_dmg = 8
	presets.weapon.normal.beretta92.melee_retry_delay = {1, 2}
	presets.weapon.normal.beretta92.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.beretta92.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.85},
			dmg_mul = 1.5,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.c45.aim_delay = {0.1, 0.1}
	presets.weapon.normal.c45.focus_delay = 10
	presets.weapon.normal.c45.focus_dis = 200
	presets.weapon.normal.c45.spread = 20
	presets.weapon.normal.c45.miss_dis = 50
	presets.weapon.normal.c45.RELOAD_SPEED = 0.9
	presets.weapon.normal.c45.melee_speed = 1
	presets.weapon.normal.c45.melee_dmg = 8
	presets.weapon.normal.c45.melee_retry_delay = {1, 2}
	presets.weapon.normal.c45.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.c45.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.85},
			dmg_mul = 1.5,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.m4.aim_delay = {0.1, 0.1}
	presets.weapon.normal.m4.focus_delay = 10
	presets.weapon.normal.m4.focus_dis = 200
	presets.weapon.normal.m4.spread = 20
	presets.weapon.normal.m4.miss_dis = 40
	presets.weapon.normal.m4.RELOAD_SPEED = 0.9
	presets.weapon.normal.m4.melee_speed = 1
	presets.weapon.normal.m4.melee_dmg = 8
	presets.weapon.normal.m4.melee_retry_delay = {1, 2}
	presets.weapon.normal.m4.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.m4.autofire_rounds = {6, 11}
	presets.weapon.normal.m4.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 1,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.normal.r870.aim_delay = {0.1, 0.1}
	presets.weapon.normal.r870.focus_delay = 10
	presets.weapon.normal.r870.focus_dis = 200
	presets.weapon.normal.r870.spread = 15
	presets.weapon.normal.r870.miss_dis = 20
	presets.weapon.normal.r870.RELOAD_SPEED = 0.9
	presets.weapon.normal.r870.melee_speed = 1
	presets.weapon.normal.r870.melee_dmg = 8
	presets.weapon.normal.r870.melee_retry_delay = {1, 2}
	presets.weapon.normal.r870.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.r870.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 0.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.mp5.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mp5.focus_delay = 10
	presets.weapon.normal.mp5.focus_dis = 200
	presets.weapon.normal.mp5.spread = 15
	presets.weapon.normal.mp5.miss_dis = 20
	presets.weapon.normal.mp5.RELOAD_SPEED = 0.9
	presets.weapon.normal.mp5.melee_speed = 1
	presets.weapon.normal.mp5.melee_dmg = 8
	presets.weapon.normal.mp5.melee_retry_delay = {1, 2}
	presets.weapon.normal.mp5.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.mp5.autofire_rounds = {6, 11}
	presets.weapon.normal.mp5.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 1,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.normal.mac11.aim_delay = {0.1, 0.1}
	presets.weapon.normal.mac11.focus_delay = 10
	presets.weapon.normal.mac11.focus_dis = 200
	presets.weapon.normal.mac11.spread = 20
	presets.weapon.normal.mac11.miss_dis = 25
	presets.weapon.normal.mac11.RELOAD_SPEED = 0.9
	presets.weapon.normal.mac11.melee_speed = 1
	presets.weapon.normal.mac11.melee_dmg = 8
	presets.weapon.normal.mac11.melee_retry_delay = {1, 2}
	presets.weapon.normal.mac11.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.mac11.autofire_rounds = {6, 11}
	presets.weapon.normal.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.5, 0.65},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.1, 0.85},
			dmg_mul = 2,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.5},
			dmg_mul = 1,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.05, 0.4},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.3},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		}
	}
	presets.weapon.normal.raging_bull.aim_delay = {0.1, 0.1}
	presets.weapon.normal.raging_bull.focus_delay = 10
	presets.weapon.normal.raging_bull.focus_dis = 200
	presets.weapon.normal.raging_bull.spread = 20
	presets.weapon.normal.raging_bull.miss_dis = 50
	presets.weapon.normal.raging_bull.RELOAD_SPEED = 0.9
	presets.weapon.normal.raging_bull.melee_speed = 1
	presets.weapon.normal.raging_bull.melee_dmg = 8
	presets.weapon.normal.raging_bull.melee_retry_delay = {1, 2}
	presets.weapon.normal.raging_bull.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.normal.raging_bull.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 1.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 0.75,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.normal.ak47 = presets.weapon.normal.m4
	presets.weapon.normal.mossberg = presets.weapon.normal.r870
	presets.weapon.good = {
		beretta92 = {},
		c45 = {},
		raging_bull = {},
		m4 = {},
		ak47 = {},
		r870 = {},
		mossberg = {},
		mp5 = {},
		mac11 = {}
	}
	presets.weapon.good.beretta92.aim_delay = {0.1, 0.1}
	presets.weapon.good.beretta92.focus_delay = 2
	presets.weapon.good.beretta92.focus_dis = 200
	presets.weapon.good.beretta92.spread = 25
	presets.weapon.good.beretta92.miss_dis = 30
	presets.weapon.good.beretta92.RELOAD_SPEED = 1
	presets.weapon.good.beretta92.melee_speed = presets.weapon.normal.beretta92.melee_speed
	presets.weapon.good.beretta92.melee_dmg = presets.weapon.normal.beretta92.melee_dmg
	presets.weapon.good.beretta92.melee_retry_delay = presets.weapon.normal.beretta92.melee_retry_delay
	presets.weapon.good.beretta92.range = presets.weapon.normal.beretta92.range
	presets.weapon.good.beretta92.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 2,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.15, 0.45},
			dmg_mul = 1,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.c45.aim_delay = {0.1, 0.1}
	presets.weapon.good.c45.focus_delay = 2
	presets.weapon.good.c45.focus_dis = 200
	presets.weapon.good.c45.spread = 20
	presets.weapon.good.c45.miss_dis = 50
	presets.weapon.good.c45.RELOAD_SPEED = 1
	presets.weapon.good.c45.melee_speed = presets.weapon.normal.c45.melee_speed
	presets.weapon.good.c45.melee_dmg = presets.weapon.normal.c45.melee_dmg
	presets.weapon.good.c45.melee_retry_delay = presets.weapon.normal.c45.melee_retry_delay
	presets.weapon.good.c45.range = presets.weapon.normal.c45.range
	presets.weapon.good.c45.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 4,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2,
			recoil = {0.15, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1.5,
			recoil = {0.15, 0.4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1.25,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.m4.aim_delay = {0.1, 0.1}
	presets.weapon.good.m4.focus_delay = 3
	presets.weapon.good.m4.focus_dis = 200
	presets.weapon.good.m4.spread = 20
	presets.weapon.good.m4.miss_dis = 40
	presets.weapon.good.m4.RELOAD_SPEED = 1
	presets.weapon.good.m4.melee_speed = 1
	presets.weapon.good.m4.melee_dmg = 15
	presets.weapon.good.m4.melee_retry_delay = presets.weapon.normal.m4.melee_retry_delay
	presets.weapon.good.m4.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.m4.autofire_rounds = presets.weapon.normal.m4.autofire_rounds
	presets.weapon.good.m4.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.9},
			dmg_mul = 2,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.8},
			dmg_mul = 1.5,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.2, 0.5},
			dmg_mul = 1.25,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.good.r870.aim_delay = {0.1, 0.1}
	presets.weapon.good.r870.focus_delay = 5
	presets.weapon.good.r870.focus_dis = 200
	presets.weapon.good.r870.spread = 15
	presets.weapon.good.r870.miss_dis = 20
	presets.weapon.good.r870.RELOAD_SPEED = 1
	presets.weapon.good.r870.melee_speed = 1
	presets.weapon.good.r870.melee_dmg = 15
	presets.weapon.good.r870.melee_retry_delay = presets.weapon.normal.r870.melee_retry_delay
	presets.weapon.good.r870.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.r870.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 2,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 1.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.01, 0.25},
			dmg_mul = 1,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.05, 0.35},
			dmg_mul = 0.4,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.mp5.aim_delay = {0, 0.2}
	presets.weapon.good.mp5.focus_delay = 3
	presets.weapon.good.mp5.focus_dis = 200
	presets.weapon.good.mp5.spread = 15
	presets.weapon.good.mp5.miss_dis = 10
	presets.weapon.good.mp5.RELOAD_SPEED = 1
	presets.weapon.good.mp5.melee_speed = presets.weapon.normal.mp5.melee_speed
	presets.weapon.good.mp5.melee_dmg = 15
	presets.weapon.good.mp5.melee_retry_delay = presets.weapon.normal.mp5.melee_retry_delay
	presets.weapon.good.mp5.range = presets.weapon.normal.mp5.range
	presets.weapon.good.mp5.autofire_rounds = presets.weapon.normal.mp5.autofire_rounds
	presets.weapon.good.mp5.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.4, 0.95},
			dmg_mul = 2,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.75},
			dmg_mul = 1.75,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.45},
			dmg_mul = 1.25,
			recoil = {0.35, 0.6},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {0.5, 0.6},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.good.mac11.aim_delay = {0.1, 0.1}
	presets.weapon.good.mac11.focus_delay = 3
	presets.weapon.good.mac11.focus_dis = 200
	presets.weapon.good.mac11.spread = 15
	presets.weapon.good.mac11.miss_dis = 10
	presets.weapon.good.mac11.RELOAD_SPEED = 1
	presets.weapon.good.mac11.melee_speed = presets.weapon.normal.mac11.melee_speed
	presets.weapon.good.mac11.melee_dmg = 15
	presets.weapon.good.mac11.melee_retry_delay = presets.weapon.normal.mac11.melee_retry_delay
	presets.weapon.good.mac11.range = presets.weapon.normal.mac11.range
	presets.weapon.good.mac11.autofire_rounds = presets.weapon.normal.mac11.autofire_rounds
	presets.weapon.good.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 3,
			recoil = {0.3, 0.35},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.1, 0.7},
			dmg_mul = 2,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.2, 0.55},
			dmg_mul = 1.25,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.05, 0.4},
			dmg_mul = 1,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.2},
			dmg_mul = 1,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.good.raging_bull.aim_delay = {0.1, 0.1}
	presets.weapon.good.raging_bull.focus_delay = 10
	presets.weapon.good.raging_bull.focus_dis = 200
	presets.weapon.good.raging_bull.spread = 20
	presets.weapon.good.raging_bull.miss_dis = 50
	presets.weapon.good.raging_bull.RELOAD_SPEED = 0.9
	presets.weapon.good.raging_bull.melee_speed = 1
	presets.weapon.good.raging_bull.melee_dmg = 8
	presets.weapon.good.raging_bull.melee_retry_delay = {1, 2}
	presets.weapon.good.raging_bull.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.good.raging_bull.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 4,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 2,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 1.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 1,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 0.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.good.ak47 = presets.weapon.good.m4
	presets.weapon.good.mossberg = presets.weapon.good.r870
	presets.weapon.expert = {
		beretta92 = {},
		c45 = {},
		raging_bull = {},
		m4 = {},
		ak47 = {},
		r870 = {},
		mossberg = {},
		mp5 = {},
		mac11 = {}
	}
	presets.weapon.expert.beretta92.aim_delay = {0.1, 0.1}
	presets.weapon.expert.beretta92.focus_delay = 1
	presets.weapon.expert.beretta92.focus_dis = 300
	presets.weapon.expert.beretta92.spread = 25
	presets.weapon.expert.beretta92.miss_dis = 30
	presets.weapon.expert.beretta92.RELOAD_SPEED = 1.1
	presets.weapon.expert.beretta92.melee_speed = presets.weapon.normal.beretta92.melee_speed
	presets.weapon.expert.beretta92.melee_dmg = presets.weapon.normal.beretta92.melee_dmg
	presets.weapon.expert.beretta92.melee_retry_delay = presets.weapon.normal.beretta92.melee_retry_delay
	presets.weapon.expert.beretta92.range = presets.weapon.normal.beretta92.range
	presets.weapon.expert.beretta92.FALLOFF = {
		{
			r = 0,
			acc = {0.5, 0.95},
			dmg_mul = 4,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.05, 0.5},
			dmg_mul = 2,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 3000,
			acc = {0, 0.3},
			dmg_mul = 2,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.c45.aim_delay = {0.1, 0.1}
	presets.weapon.expert.c45.focus_delay = 1
	presets.weapon.expert.c45.focus_dis = 300
	presets.weapon.expert.c45.spread = 20
	presets.weapon.expert.c45.miss_dis = 50
	presets.weapon.expert.c45.RELOAD_SPEED = 1.2
	presets.weapon.expert.c45.melee_speed = presets.weapon.normal.c45.melee_speed
	presets.weapon.expert.c45.melee_dmg = 20
	presets.weapon.expert.c45.melee_retry_delay = presets.weapon.normal.c45.melee_retry_delay
	presets.weapon.expert.c45.range = presets.weapon.normal.c45.range
	presets.weapon.expert.c45.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 4,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 3.5,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.3, 0.5},
			dmg_mul = 3,
			recoil = {0.4, 0.9},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.25},
			dmg_mul = 2.5,
			recoil = {0.4, 1.4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.m4.aim_delay = {0.1, 0.1}
	presets.weapon.expert.m4.focus_delay = 2
	presets.weapon.expert.m4.focus_dis = 300
	presets.weapon.expert.m4.spread = 20
	presets.weapon.expert.m4.miss_dis = 40
	presets.weapon.expert.m4.RELOAD_SPEED = 1.2
	presets.weapon.expert.m4.melee_speed = 1
	presets.weapon.expert.m4.melee_dmg = 20
	presets.weapon.expert.m4.melee_retry_delay = presets.weapon.normal.m4.melee_retry_delay
	presets.weapon.expert.m4.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.m4.autofire_rounds = presets.weapon.normal.m4.autofire_rounds
	presets.weapon.expert.m4.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 6,
			recoil = {0.4, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.55, 0.95},
			dmg_mul = 5.75,
			recoil = {0.45, 0.8},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.525, 0.8},
			dmg_mul = 5.75,
			recoil = {0.35, 0.75},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 5.5,
			recoil = {0.4, 1.2},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.4},
			dmg_mul = 5.25,
			recoil = {1.5, 3},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.expert.r870.aim_delay = {0.1, 0.1}
	presets.weapon.expert.r870.focus_delay = 2
	presets.weapon.expert.r870.focus_dis = 200
	presets.weapon.expert.r870.spread = 15
	presets.weapon.expert.r870.miss_dis = 20
	presets.weapon.expert.r870.RELOAD_SPEED = 1.2
	presets.weapon.expert.r870.melee_speed = 1
	presets.weapon.expert.r870.melee_dmg = 20
	presets.weapon.expert.r870.melee_retry_delay = presets.weapon.normal.r870.melee_retry_delay
	presets.weapon.expert.r870.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.r870.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 6.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.9},
			dmg_mul = 5.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.75},
			dmg_mul = 4,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.55},
			dmg_mul = 3.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 2.5,
			recoil = {1.5, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.mp5.aim_delay = {0, 0.1}
	presets.weapon.expert.mp5.focus_delay = 1
	presets.weapon.expert.mp5.focus_dis = 200
	presets.weapon.expert.mp5.spread = 15
	presets.weapon.expert.mp5.miss_dis = 10
	presets.weapon.expert.mp5.RELOAD_SPEED = 1.2
	presets.weapon.expert.mp5.melee_speed = presets.weapon.normal.mp5.melee_speed
	presets.weapon.expert.mp5.melee_dmg = presets.weapon.normal.mp5.melee_dmg
	presets.weapon.expert.mp5.melee_retry_delay = presets.weapon.normal.mp5.melee_retry_delay
	presets.weapon.expert.mp5.range = presets.weapon.normal.mp5.range
	presets.weapon.expert.mp5.autofire_rounds = presets.weapon.normal.mp5.autofire_rounds
	presets.weapon.expert.mp5.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.95},
			dmg_mul = 5,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 4.5,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.65},
			dmg_mul = 4,
			recoil = {0.35, 0.5},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 3,
			recoil = {0.35, 0.7},
			mode = {
				0,
				3,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 2,
			recoil = {0.5, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.expert.mac11.aim_delay = {0.1, 0.1}
	presets.weapon.expert.mac11.focus_delay = 1
	presets.weapon.expert.mac11.focus_dis = 200
	presets.weapon.expert.mac11.spread = 15
	presets.weapon.expert.mac11.miss_dis = 10
	presets.weapon.expert.mac11.RELOAD_SPEED = 1.2
	presets.weapon.expert.mac11.melee_speed = presets.weapon.normal.mac11.melee_speed
	presets.weapon.expert.mac11.melee_dmg = presets.weapon.normal.mac11.melee_dmg
	presets.weapon.expert.mac11.melee_retry_delay = presets.weapon.normal.mac11.melee_retry_delay
	presets.weapon.expert.mac11.range = presets.weapon.normal.mac11.range
	presets.weapon.expert.mac11.autofire_rounds = presets.weapon.normal.mac11.autofire_rounds
	presets.weapon.expert.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.5, 0.6},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 4,
			recoil = {0.5, 0.65},
			mode = {
				0,
				1,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.65},
			dmg_mul = 3.5,
			recoil = {0.55, 0.85},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.35, 0.55},
			dmg_mul = 3,
			recoil = {0.65, 1},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.2, 0.35},
			dmg_mul = 2.5,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.expert.raging_bull.aim_delay = {0.1, 0.1}
	presets.weapon.expert.raging_bull.focus_delay = 10
	presets.weapon.expert.raging_bull.focus_dis = 200
	presets.weapon.expert.raging_bull.spread = 20
	presets.weapon.expert.raging_bull.miss_dis = 50
	presets.weapon.expert.raging_bull.RELOAD_SPEED = 0.9
	presets.weapon.expert.raging_bull.melee_speed = 1
	presets.weapon.expert.raging_bull.melee_dmg = 8
	presets.weapon.expert.raging_bull.melee_retry_delay = {1, 2}
	presets.weapon.expert.raging_bull.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.expert.raging_bull.FALLOFF = {
		{
			r = 100,
			acc = {0.6, 0.9},
			dmg_mul = 5,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.5, 0.85},
			dmg_mul = 4,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.375, 0.55},
			dmg_mul = 2.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.45},
			dmg_mul = 2,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.01, 0.35},
			dmg_mul = 1.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.expert.ak47 = presets.weapon.expert.m4
	presets.weapon.expert.mossberg = presets.weapon.expert.r870
	presets.weapon.sniper = {
		m4 = {}
	}
	presets.weapon.sniper.m4.aim_delay = {0, 0.1}
	presets.weapon.sniper.m4.focus_delay = 7
	presets.weapon.sniper.m4.focus_dis = 200
	presets.weapon.sniper.m4.spread = 30
	presets.weapon.sniper.m4.miss_dis = 250
	presets.weapon.sniper.m4.RELOAD_SPEED = 1.25
	presets.weapon.sniper.m4.melee_speed = presets.weapon.normal.m4.melee_speed
	presets.weapon.sniper.m4.melee_dmg = presets.weapon.normal.m4.melee_dmg
	presets.weapon.expert.m4.melee_retry_delay = presets.weapon.normal.m4.melee_retry_delay
	presets.weapon.sniper.m4.range = {
		close = 15000,
		optimal = 15000,
		far = 15000
	}
	presets.weapon.sniper.m4.autofire_rounds = presets.weapon.normal.m4.autofire_rounds
	presets.weapon.sniper.m4.use_laser = true
	presets.weapon.sniper.m4.FALLOFF = {
		{
			r = 700,
			acc = {0.4, 0.95},
			dmg_mul = 5,
			recoil = {2, 4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3500,
			acc = {0.1, 0.75},
			dmg_mul = 5,
			recoil = {3, 4},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.25},
			dmg_mul = 2.5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish = {
		beretta92 = {},
		c45 = {},
		raging_bull = {},
		m4 = {},
		ak47 = {},
		r870 = {},
		mossberg = {},
		mp5 = {},
		mac11 = {}
	}
	presets.weapon.deathwish.raging_bull.aim_delay = {0, 0}
	presets.weapon.deathwish.raging_bull.focus_delay = 10
	presets.weapon.deathwish.raging_bull.focus_dis = 200
	presets.weapon.deathwish.raging_bull.spread = 20
	presets.weapon.deathwish.raging_bull.miss_dis = 50
	presets.weapon.deathwish.raging_bull.RELOAD_SPEED = 0.9
	presets.weapon.deathwish.raging_bull.melee_speed = 1
	presets.weapon.deathwish.raging_bull.melee_dmg = 8
	presets.weapon.deathwish.raging_bull.melee_retry_delay = {1, 2}
	presets.weapon.deathwish.raging_bull.range = {
		close = 1000,
		optimal = 2000,
		far = 5000
	}
	presets.weapon.deathwish.raging_bull.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 5,
			recoil = {0.8, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.6, 0.85},
			dmg_mul = 4,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.5, 0.75},
			dmg_mul = 3.5,
			recoil = {0.8, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 3,
			recoil = {1, 1.3},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 2.5,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.beretta92.aim_delay = {0, 0.1}
	presets.weapon.deathwish.beretta92.focus_delay = 0
	presets.weapon.deathwish.beretta92.focus_dis = 200
	presets.weapon.deathwish.beretta92.spread = 25
	presets.weapon.deathwish.beretta92.miss_dis = 30
	presets.weapon.deathwish.beretta92.RELOAD_SPEED = 1.1
	presets.weapon.deathwish.beretta92.melee_speed = presets.weapon.expert.beretta92.melee_speed
	presets.weapon.deathwish.beretta92.melee_dmg = presets.weapon.expert.beretta92.melee_dmg
	presets.weapon.deathwish.beretta92.melee_retry_delay = presets.weapon.expert.beretta92.melee_retry_delay
	presets.weapon.deathwish.beretta92.range = presets.weapon.normal.beretta92.range
	presets.weapon.deathwish.beretta92.FALLOFF = {
		{
			r = 0,
			acc = {0.7, 0.95},
			dmg_mul = 5,
			recoil = {0.1, 0.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.8, 0.99},
			dmg_mul = 3,
			recoil = {0.15, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.95},
			dmg_mul = 3,
			recoil = {0.3, 0.7},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 2,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 5000,
			acc = {0.1, 0.5},
			dmg_mul = 2,
			recoil = {0.4, 1},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.c45.aim_delay = {0, 0}
	presets.weapon.deathwish.c45.focus_delay = 0
	presets.weapon.deathwish.c45.focus_dis = 200
	presets.weapon.deathwish.c45.spread = 20
	presets.weapon.deathwish.c45.miss_dis = 50
	presets.weapon.deathwish.c45.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.c45.melee_speed = presets.weapon.expert.c45.melee_speed
	presets.weapon.deathwish.c45.melee_dmg = 20
	presets.weapon.deathwish.c45.melee_retry_delay = presets.weapon.expert.c45.melee_retry_delay
	presets.weapon.deathwish.c45.range = {
		close = 2000,
		optimal = 3200,
		far = 5000
	}
	presets.weapon.deathwish.c45.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 6.5,
			recoil = {0.15, 0.25},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.9, 0.95},
			dmg_mul = 6.5,
			recoil = {0.15, 0.3},
			mode = {
				0,
				0,
				1,
				0
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.8},
			dmg_mul = 6.5,
			recoil = {0.25, 0.3},
			mode = {
				1,
				0,
				1,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 6.5,
			recoil = {0.4, 0.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.6, 0.65},
			dmg_mul = 6,
			recoil = {0.6, 0.8},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.2, 0.65},
			dmg_mul = 6,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.m4.aim_delay = {0, 0}
	presets.weapon.deathwish.m4.focus_delay = 0
	presets.weapon.deathwish.m4.focus_dis = 200
	presets.weapon.deathwish.m4.spread = 20
	presets.weapon.deathwish.m4.miss_dis = 40
	presets.weapon.deathwish.m4.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.m4.melee_speed = 1
	presets.weapon.deathwish.m4.melee_dmg = 20
	presets.weapon.deathwish.m4.melee_retry_delay = presets.weapon.expert.m4.melee_retry_delay
	presets.weapon.deathwish.m4.range = {
		close = 2000,
		optimal = 3500,
		far = 6000
	}
	presets.weapon.deathwish.m4.autofire_rounds = {4, 9}
	presets.weapon.deathwish.m4.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.975},
			dmg_mul = 7.5,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.875, 0.95},
			dmg_mul = 7.5,
			recoil = {0.25, 0.3},
			mode = {
				0,
				3,
				8,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 7.5,
			recoil = {0.35, 0.55},
			mode = {
				0,
				2,
				5,
				1
			}
		},
		{
			r = 2000,
			acc = {0.7, 0.85},
			dmg_mul = 7.5,
			recoil = {0.4, 0.7},
			mode = {
				3,
				2,
				5,
				1
			}
		},
		{
			r = 3000,
			acc = {0.65, 0.75},
			dmg_mul = 7.5,
			recoil = {0.7, 1.1},
			mode = {
				3,
				1,
				5,
				0.5
			}
		},
		{
			r = 6000,
			acc = {0.25, 0.7},
			dmg_mul = 7.5,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	presets.weapon.deathwish.r870.aim_delay = {0, 0}
	presets.weapon.deathwish.r870.focus_delay = 0
	presets.weapon.deathwish.r870.focus_dis = 200
	presets.weapon.deathwish.r870.spread = 15
	presets.weapon.deathwish.r870.miss_dis = 20
	presets.weapon.deathwish.r870.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.r870.melee_speed = 1
	presets.weapon.deathwish.r870.melee_dmg = 20
	presets.weapon.deathwish.r870.melee_retry_delay = presets.weapon.expert.r870.melee_retry_delay
	presets.weapon.deathwish.r870.range = {
		close = 2000,
		optimal = 3000,
		far = 5000
	}
	presets.weapon.deathwish.r870.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 8,
			recoil = {1, 1.1},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 500,
			acc = {0.7, 0.95},
			dmg_mul = 7.5,
			recoil = {1, 1.25},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {
				0,
				5,
				0.8
			},
			dmg_mul = 7,
			recoil = {1, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.45, 0.65},
			dmg_mul = 5,
			recoil = {1.25, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 3,
			recoil = {1.5, 1.75},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.mp5.aim_delay = {0, 0}
	presets.weapon.deathwish.mp5.focus_delay = 0
	presets.weapon.deathwish.mp5.focus_dis = 200
	presets.weapon.deathwish.mp5.spread = 15
	presets.weapon.deathwish.mp5.miss_dis = 10
	presets.weapon.deathwish.mp5.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.mp5.melee_speed = presets.weapon.expert.mp5.melee_speed
	presets.weapon.deathwish.mp5.melee_dmg = presets.weapon.expert.mp5.melee_dmg
	presets.weapon.deathwish.mp5.melee_retry_delay = presets.weapon.expert.mp5.melee_retry_delay
	presets.weapon.deathwish.mp5.range = {
		close = 2000,
		optimal = 3200,
		far = 6000
	}
	presets.weapon.deathwish.mp5.autofire_rounds = {8, 16}
	presets.weapon.deathwish.mp5.FALLOFF = {
		{
			r = 100,
			acc = {0.95, 0.95},
			dmg_mul = 6.75,
			recoil = {0.1, 0.25},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 6.75,
			recoil = {0.1, 0.3},
			mode = {
				0,
				3,
				3,
				4
			}
		},
		{
			r = 1000,
			acc = {0.65, 0.65},
			dmg_mul = 6.75,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				3
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.7},
			dmg_mul = 6.75,
			recoil = {0.35, 0.5},
			mode = {
				0,
				6,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.6},
			dmg_mul = 6.75,
			recoil = {0.5, 1.5},
			mode = {
				1,
				6,
				2,
				0
			}
		},
		{
			r = 4500,
			acc = {0.3, 0.6},
			dmg_mul = 6.75,
			recoil = {1, 1.5},
			mode = {
				1,
				3,
				2,
				0
			}
		}
	}
	presets.weapon.deathwish.mac11.aim_delay = {0, 0}
	presets.weapon.deathwish.mac11.focus_delay = 0
	presets.weapon.deathwish.mac11.focus_dis = 200
	presets.weapon.deathwish.mac11.spread = 15
	presets.weapon.deathwish.mac11.miss_dis = 10
	presets.weapon.deathwish.mac11.RELOAD_SPEED = 1.4
	presets.weapon.deathwish.mac11.melee_speed = presets.weapon.expert.mac11.melee_speed
	presets.weapon.deathwish.mac11.melee_dmg = presets.weapon.expert.mac11.melee_dmg
	presets.weapon.deathwish.mac11.melee_retry_delay = presets.weapon.expert.mac11.melee_retry_delay
	presets.weapon.deathwish.mac11.range = {
		close = 2000,
		optimal = 2700,
		far = 6000
	}
	presets.weapon.deathwish.mac11.autofire_rounds = {20, 30}
	presets.weapon.deathwish.mac11.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.9},
			dmg_mul = 7,
			recoil = {0.3, 0.4},
			mode = {
				0,
				3,
				3,
				3
			}
		},
		{
			r = 500,
			acc = {0.75, 0.75},
			dmg_mul = 7,
			recoil = {0.3, 0.4},
			mode = {
				0,
				1,
				3,
				3
			}
		},
		{
			r = 1000,
			acc = {0.625, 0.625},
			dmg_mul = 7,
			recoil = {0.3, 0.4},
			mode = {
				2,
				1,
				3,
				1
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.6},
			dmg_mul = 7,
			recoil = {0.65, 8},
			mode = {
				2,
				1,
				3,
				0
			}
		},
		{
			r = 3000,
			acc = {0.4, 0.55},
			dmg_mul = 7,
			recoil = {0.65, 1.2},
			mode = {
				4,
				1,
				0,
				0
			}
		}
	}
	presets.weapon.deathwish.ak47 = presets.weapon.deathwish.m4
	presets.weapon.deathwish.mossberg = presets.weapon.deathwish.r870
	presets.weapon.gang_member = {
		beretta92 = {},
		c45 = {},
		raging_bull = {},
		m4 = {},
		ak47 = {},
		r870 = {},
		mossberg = {},
		mp5 = {},
		mac11 = {}
	}
	presets.weapon.gang_member.beretta92.aim_delay = {0, 1}
	presets.weapon.gang_member.beretta92.focus_delay = 1
	presets.weapon.gang_member.beretta92.focus_dis = 2000
	presets.weapon.gang_member.beretta92.spread = 25
	presets.weapon.gang_member.beretta92.miss_dis = 20
	presets.weapon.gang_member.beretta92.RELOAD_SPEED = 1.5
	presets.weapon.gang_member.beretta92.melee_speed = 3
	presets.weapon.gang_member.beretta92.melee_dmg = 3
	presets.weapon.gang_member.beretta92.melee_retry_delay = presets.weapon.normal.beretta92.melee_retry_delay
	presets.weapon.gang_member.beretta92.range = presets.weapon.normal.beretta92.range
	presets.weapon.gang_member.beretta92.FALLOFF = {
		{
			r = 300,
			acc = {0.7, 1},
			dmg_mul = 3.5,
			recoil = {0.25, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.6},
			dmg_mul = 1,
			recoil = {0.25, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.15},
			dmg_mul = 1,
			recoil = {2, 3},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.m4.aim_delay = {0, 1}
	presets.weapon.gang_member.m4.focus_delay = 1
	presets.weapon.gang_member.m4.focus_dis = 3000
	presets.weapon.gang_member.m4.spread = 25
	presets.weapon.gang_member.m4.miss_dis = 10
	presets.weapon.gang_member.m4.RELOAD_SPEED = 1
	presets.weapon.gang_member.m4.melee_speed = 2
	presets.weapon.gang_member.m4.melee_dmg = 3
	presets.weapon.gang_member.m4.melee_retry_delay = presets.weapon.normal.m4.melee_retry_delay
	presets.weapon.gang_member.m4.range = {
		close = 1500,
		optimal = 2500,
		far = 6000
	}
	presets.weapon.gang_member.m4.autofire_rounds = presets.weapon.normal.m4.autofire_rounds
	presets.weapon.gang_member.m4.FALLOFF = {
		{
			r = 300,
			acc = {0.7, 1},
			dmg_mul = 3.5,
			recoil = {0.25, 0.45},
			mode = {
				0.1,
				0.3,
				4,
				7
			}
		},
		{
			r = 2000,
			acc = {0.1, 0.6},
			dmg_mul = 0.5,
			recoil = {0.25, 2},
			mode = {
				2,
				2,
				5,
				8
			}
		},
		{
			r = 10000,
			acc = {0, 0.15},
			dmg_mul = 0.5,
			recoil = {2, 3},
			mode = {
				2,
				1,
				1,
				0.01
			}
		}
	}
	presets.weapon.gang_member.r870.aim_delay = {0, 0.02}
	presets.weapon.gang_member.r870.focus_delay = 1
	presets.weapon.gang_member.r870.focus_dis = 2000
	presets.weapon.gang_member.r870.spread = 15
	presets.weapon.gang_member.r870.miss_dis = 10
	presets.weapon.gang_member.r870.RELOAD_SPEED = 2
	presets.weapon.gang_member.r870.melee_speed = 2
	presets.weapon.gang_member.r870.melee_dmg = 3
	presets.weapon.gang_member.r870.melee_retry_delay = presets.weapon.normal.r870.melee_retry_delay
	presets.weapon.gang_member.r870.range = presets.weapon.normal.r870.range
	presets.weapon.gang_member.r870.FALLOFF = {
		{
			r = 300,
			acc = {0.7, 1},
			dmg_mul = 3.5,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.1, 0.6},
			dmg_mul = 1,
			recoil = {2, 2},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0, 0.15},
			dmg_mul = 0.1,
			recoil = {2, 4},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	presets.weapon.gang_member.mp5 = presets.weapon.gang_member.m4
	presets.weapon.gang_member.c45 = presets.weapon.gang_member.beretta92
	presets.weapon.gang_member.raging_bull = presets.weapon.gang_member.beretta92
	presets.weapon.gang_member.ak47 = presets.weapon.gang_member.m4
	presets.weapon.gang_member.mossberg = presets.weapon.gang_member.r870
	presets.weapon.gang_member.mac11 = presets.weapon.gang_member.mp5
	presets.detection = {}
	presets.detection.normal = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.normal.idle.dis_max = 10000
	presets.detection.normal.idle.angle_max = 120
	presets.detection.normal.idle.delay = {0, 0}
	presets.detection.normal.idle.use_uncover_range = true
	presets.detection.normal.combat.dis_max = 10000
	presets.detection.normal.combat.angle_max = 120
	presets.detection.normal.combat.delay = {0, 0}
	presets.detection.normal.combat.use_uncover_range = true
	presets.detection.normal.recon.dis_max = 10000
	presets.detection.normal.recon.angle_max = 120
	presets.detection.normal.recon.delay = {0, 0}
	presets.detection.normal.recon.use_uncover_range = true
	presets.detection.normal.guard.dis_max = 10000
	presets.detection.normal.guard.angle_max = 120
	presets.detection.normal.guard.delay = {0, 0}
	presets.detection.normal.ntl.dis_max = 4000
	presets.detection.normal.ntl.angle_max = 60
	presets.detection.normal.ntl.delay = {0.2, 2}
	presets.detection.guard = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.guard.idle.dis_max = 10000
	presets.detection.guard.idle.angle_max = 120
	presets.detection.guard.idle.delay = {0, 0}
	presets.detection.guard.idle.use_uncover_range = true
	presets.detection.guard.combat.dis_max = 10000
	presets.detection.guard.combat.angle_max = 120
	presets.detection.guard.combat.delay = {0, 0}
	presets.detection.guard.combat.use_uncover_range = true
	presets.detection.guard.recon.dis_max = 10000
	presets.detection.guard.recon.angle_max = 120
	presets.detection.guard.recon.delay = {0, 0}
	presets.detection.guard.recon.use_uncover_range = true
	presets.detection.guard.guard.dis_max = 10000
	presets.detection.guard.guard.angle_max = 120
	presets.detection.guard.guard.delay = {0, 0}
	presets.detection.guard.ntl = presets.detection.normal.ntl
	presets.detection.sniper = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.sniper.idle.dis_max = 10000
	presets.detection.sniper.idle.angle_max = 180
	presets.detection.sniper.idle.delay = {0.5, 1}
	presets.detection.sniper.idle.use_uncover_range = true
	presets.detection.sniper.combat.dis_max = 10000
	presets.detection.sniper.combat.angle_max = 120
	presets.detection.sniper.combat.delay = {0.5, 1}
	presets.detection.sniper.combat.use_uncover_range = true
	presets.detection.sniper.recon.dis_max = 10000
	presets.detection.sniper.recon.angle_max = 120
	presets.detection.sniper.recon.delay = {0.5, 1}
	presets.detection.sniper.recon.use_uncover_range = true
	presets.detection.sniper.guard.dis_max = 10000
	presets.detection.sniper.guard.angle_max = 150
	presets.detection.sniper.guard.delay = {0.3, 1}
	presets.detection.sniper.ntl = presets.detection.normal.ntl
	presets.detection.gang_member = {
		idle = {},
		combat = {},
		recon = {},
		guard = {},
		ntl = {}
	}
	presets.detection.gang_member.idle.dis_max = 10000
	presets.detection.gang_member.idle.angle_max = 120
	presets.detection.gang_member.idle.delay = {0, 0}
	presets.detection.gang_member.idle.use_uncover_range = true
	presets.detection.gang_member.combat.dis_max = 10000
	presets.detection.gang_member.combat.angle_max = 120
	presets.detection.gang_member.combat.delay = {0, 0}
	presets.detection.gang_member.combat.use_uncover_range = true
	presets.detection.gang_member.recon.dis_max = 10000
	presets.detection.gang_member.recon.angle_max = 120
	presets.detection.gang_member.recon.delay = {0, 0}
	presets.detection.gang_member.recon.use_uncover_range = true
	presets.detection.gang_member.guard.dis_max = 10000
	presets.detection.gang_member.guard.angle_max = 120
	presets.detection.gang_member.guard.delay = {0, 0}
	presets.detection.gang_member.ntl = presets.detection.normal.ntl
	self:_process_weapon_usage_table(presets.weapon.normal)
	self:_process_weapon_usage_table(presets.weapon.good)
	self:_process_weapon_usage_table(presets.weapon.expert)
	self:_process_weapon_usage_table(presets.weapon.gang_member)
	presets.detection.civilian = {
		cbt = {},
		ntl = {}
	}
	presets.detection.civilian.cbt.dis_max = 700
	presets.detection.civilian.cbt.angle_max = 120
	presets.detection.civilian.cbt.delay = {0, 0}
	presets.detection.civilian.cbt.use_uncover_range = true
	presets.detection.civilian.ntl.dis_max = 2000
	presets.detection.civilian.ntl.angle_max = 60
	presets.detection.civilian.ntl.delay = {0.2, 3}
	presets.dodge = {
		poor = {
			speed = 0.9,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.5,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				}
			}
		},
		average = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.35,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 1,
							timeout = {2, 3}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {4, 7},
					variations = {
						dive = {
							chance = 1,
							timeout = {5, 8}
						}
					}
				}
			}
		},
		heavy = {
			speed = 1,
			occasions = {
				hit = {
					chance = 0.75,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 9,
							timeout = {0, 7},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						}
					}
				},
				preemptive = {
					chance = 0.1,
					check_timeout = {1, 7},
					variations = {
						side_step = {
							chance = 1,
							timeout = {1, 7},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						}
					}
				},
				scared = {
					chance = 0.8,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 1,
							timeout = {8, 10}
						},
						dive = {
							chance = 2,
							timeout = {8, 10}
						}
					}
				}
			}
		},
		athletic = {
			speed = 1.3,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 0},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 3},
							shoot_chance = 0.8,
							shoot_accuracy = 0.5
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				preemptive = {
					chance = 0.35,
					check_timeout = {2, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {3, 4}
						}
					}
				},
				scared = {
					chance = 0.4,
					check_timeout = {1, 2},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.5,
							shoot_accuracy = 0.4
						},
						roll = {
							chance = 3,
							timeout = {3, 5}
						},
						dive = {
							chance = 1,
							timeout = {3, 5}
						}
					}
				}
			}
		},
		ninja = {
			speed = 1.6,
			occasions = {
				hit = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.7
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				preemptive = {
					chance = 0.6,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 3,
							timeout = {1, 2},
							shoot_chance = 1,
							shoot_accuracy = 0.8
						},
						roll = {
							chance = 1,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 2,
							timeout = {1.2, 2}
						}
					}
				},
				scared = {
					chance = 0.9,
					check_timeout = {0, 3},
					variations = {
						side_step = {
							chance = 5,
							timeout = {1, 2},
							shoot_chance = 0.8,
							shoot_accuracy = 0.6
						},
						roll = {
							chance = 3,
							timeout = {1.2, 2}
						},
						wheel = {
							chance = 3,
							timeout = {1.2, 2}
						},
						dive = {
							chance = 1,
							timeout = {1.2, 2}
						}
					}
				}
			}
		}
	}
	for preset_name, preset_data in pairs(presets.dodge) do
		for reason_name, reason_data in pairs(preset_data.occasions) do
			local total_w = 0
			for variation_name, variation_data in pairs(reason_data.variations) do
				total_w = total_w + variation_data.chance
			end
			if total_w > 0 then
				for variation_name, variation_data in pairs(reason_data.variations) do
					variation_data.chance = variation_data.chance / total_w
				end
			end
		end
	end
	presets.move_speed = {
		civ_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 210,
						strafe = 190,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 175,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 500,
						strafe = 192,
						bwd = 230
					},
					cbt = {
						fwd = 500,
						strafe = 250,
						bwd = 230
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					},
					cbt = {
						fwd = 174,
						strafe = 160,
						bwd = 163
					}
				},
				run = {
					hos = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					},
					cbt = {
						fwd = 312,
						strafe = 245,
						bwd = 260
					}
				}
			}
		},
		lightning = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 800,
						strafe = 400,
						bwd = 350
					},
					cbt = {
						fwd = 750,
						strafe = 380,
						bwd = 320
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 420,
						strafe = 300,
						bwd = 250
					},
					cbt = {
						fwd = 412,
						strafe = 300,
						bwd = 280
					}
				}
			}
		},
		very_slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 140,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 144,
						strafe = 130,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 100,
						bwd = 125
					}
				}
			}
		},
		slow = {
			stand = {
				walk = {
					ntl = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 150,
						bwd = 135
					},
					cbt = {
						fwd = 360,
						strafe = 150,
						bwd = 155
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					},
					cbt = {
						fwd = 144,
						strafe = 120,
						bwd = 113
					}
				},
				run = {
					hos = {
						fwd = 360,
						strafe = 140,
						bwd = 150
					},
					cbt = {
						fwd = 360,
						strafe = 140,
						bwd = 155
					}
				}
			}
		},
		normal = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 100
					},
					hos = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					},
					cbt = {
						fwd = 220,
						strafe = 190,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 450,
						strafe = 290,
						bwd = 255
					},
					cbt = {
						fwd = 400,
						strafe = 250,
						bwd = 255
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					},
					cbt = {
						fwd = 210,
						strafe = 170,
						bwd = 160
					}
				},
				run = {
					hos = {
						fwd = 310,
						strafe = 260,
						bwd = 235
					},
					cbt = {
						fwd = 350,
						strafe = 260,
						bwd = 235
					}
				}
			}
		},
		fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					},
					cbt = {
						fwd = 270,
						strafe = 215,
						bwd = 185
					}
				},
				run = {
					hos = {
						fwd = 625,
						strafe = 315,
						bwd = 280
					},
					cbt = {
						fwd = 450,
						strafe = 285,
						bwd = 280
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					},
					cbt = {
						fwd = 235,
						strafe = 180,
						bwd = 170
					}
				},
				run = {
					hos = {
						fwd = 330,
						strafe = 280,
						bwd = 255
					},
					cbt = {
						fwd = 312,
						strafe = 270,
						bwd = 255
					}
				}
			}
		},
		very_fast = {
			stand = {
				walk = {
					ntl = {
						fwd = 150,
						strafe = 120,
						bwd = 110
					},
					hos = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					},
					cbt = {
						fwd = 285,
						strafe = 225,
						bwd = 215
					}
				},
				run = {
					hos = {
						fwd = 670,
						strafe = 340,
						bwd = 325
					},
					cbt = {
						fwd = 475,
						strafe = 325,
						bwd = 300
					}
				}
			},
			crouch = {
				walk = {
					hos = {
						fwd = 245,
						strafe = 210,
						bwd = 190
					},
					cbt = {
						fwd = 255,
						strafe = 190,
						bwd = 190
					}
				},
				run = {
					hos = {
						fwd = 350,
						strafe = 282,
						bwd = 268
					},
					cbt = {
						fwd = 312,
						strafe = 282,
						bwd = 268
					}
				}
			}
		}
	}
	for speed_preset_name, poses in pairs(presets.move_speed) do
		for pose, hastes in pairs(poses) do
			hastes.run.ntl = hastes.run.hos
		end
		poses.crouch.walk.ntl = poses.crouch.walk.hos
		poses.crouch.run.ntl = poses.crouch.run.hos
		poses.stand.run.ntl = poses.stand.run.hos
		poses.panic = poses.stand
	end
	presets.surrender = {}
	presets.surrender.easy = {
		base_chance = 0.75,
		significant_chance = 0.1,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0.2,
				[0.3] = 1
			},
			weapon_down = 0.8,
			pants_down = 1,
			isolated = 0.1
		},
		factors = {
			flanked = 0.07,
			unaware_of_aggressor = 0.08,
			enemy_weap_cold = 0.15,
			aggressor_dis = {
				[1000] = 0.02,
				[300] = 0.15
			}
		}
	}
	presets.surrender.normal = {
		base_chance = 0.5,
		significant_chance = 0.2,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.5] = 0.5
			},
			weapon_down = 0.5,
			pants_down = 1,
			isolated = 0.08
		},
		factors = {
			flanked = 0.05,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.11,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.hard = {
		base_chance = 0.35,
		significant_chance = 0.25,
		violence_timeout = 2,
		reasons = {
			health = {
				[1] = 0,
				[0.35] = 0.5
			},
			weapon_down = 0.2,
			pants_down = 0.8
		},
		factors = {
			isolated = 0.1,
			flanked = 0.04,
			unaware_of_aggressor = 0.1,
			enemy_weap_cold = 0.05,
			aggressor_dis = {
				[1000] = 0,
				[300] = 0.1
			}
		}
	}
	presets.surrender.special = {
		base_chance = 0.25,
		significant_chance = 0.25,
		violence_timeout = 2,
		reasons = {
			health = {
				[0.5] = 0,
				[0.2] = 0.25
			},
			weapon_down = 0.02,
			pants_down = 0.6
		},
		factors = {
			isolated = 0.05,
			flanked = 0.015,
			unaware_of_aggressor = 0.02,
			enemy_weap_cold = 0.05
		}
	}
	presets.suppression = {
		easy = {
			duration = {10, 15},
			react_point = {0, 2},
			brown_point = {3, 5},
			panic_chance_mul = 1
		},
		hard_def = {
			duration = {5, 10},
			react_point = {0, 2},
			brown_point = {5, 6},
			panic_chance_mul = 0.7
		},
		hard_agg = {
			duration = {5, 8},
			react_point = {2, 5},
			brown_point = {5, 6},
			panic_chance_mul = 0.7
		},
		no_supress = {
			duration = {0.1, 0.15},
			react_point = {100, 200},
			brown_point = {400, 500},
			panic_chance_mul = 0
		}
	}
	presets.enemy_chatter = {
		no_chatter = {},
		cop = {
			aggressive = true,
			retreat = true,
			go_go = true,
			contact = true,
			suppress = true
		},
		swat = {
			aggressive = true,
			retreat = true,
			follow_me = true,
			clear = true,
			go_go = true,
			ready = true,
			smoke = true,
			contact = true,
			suppress = true
		},
		shield = {follow_me = true}
	}
	return presets
end
function CharacterTweakData:_create_table_structure()
	self.weap_ids = {
		"beretta92",
		"c45",
		"raging_bull",
		"m4",
		"ak47",
		"r870",
		"mossberg",
		"mp5",
		"mp5_tactical",
		"mp9",
		"mac11",
		"m14_sniper_npc",
		"saiga",
		"m249",
		"benelli",
		"g36",
		"ump",
		"scar_murky"
	}
	self.weap_unit_names = {
		Idstring("units/payday2/weapons/wpn_npc_beretta92/wpn_npc_beretta92"),
		Idstring("units/payday2/weapons/wpn_npc_c45/wpn_npc_c45"),
		Idstring("units/payday2/weapons/wpn_npc_raging_bull/wpn_npc_raging_bull"),
		Idstring("units/payday2/weapons/wpn_npc_m4/wpn_npc_m4"),
		Idstring("units/payday2/weapons/wpn_npc_ak47/wpn_npc_ak47"),
		Idstring("units/payday2/weapons/wpn_npc_r870/wpn_npc_r870"),
		Idstring("units/payday2/weapons/wpn_npc_sawnoff_shotgun/wpn_npc_sawnoff_shotgun"),
		Idstring("units/payday2/weapons/wpn_npc_mp5/wpn_npc_mp5"),
		Idstring("units/payday2/weapons/wpn_npc_mp5_tactical/wpn_npc_mp5_tactical"),
		Idstring("units/payday2/weapons/wpn_npc_smg_mp9/wpn_npc_smg_mp9"),
		Idstring("units/payday2/weapons/wpn_npc_mac11/wpn_npc_mac11"),
		Idstring("units/payday2/weapons/wpn_npc_sniper/wpn_npc_sniper"),
		Idstring("units/payday2/weapons/wpn_npc_saiga/wpn_npc_saiga"),
		Idstring("units/payday2/weapons/wpn_npc_lmg_m249/wpn_npc_lmg_m249"),
		Idstring("units/payday2/weapons/wpn_npc_benelli/wpn_npc_benelli"),
		Idstring("units/payday2/weapons/wpn_npc_g36/wpn_npc_g36"),
		Idstring("units/payday2/weapons/wpn_npc_ump/wpn_npc_ump"),
		Idstring("units/payday2/weapons/wpn_npc_scar_murkywater/wpn_npc_scar_murkywater")
	}
end
function CharacterTweakData:_process_weapon_usage_table(weap_usage_table)
	for _, weap_id in ipairs(self.weap_ids) do
		local usage_data = weap_usage_table[weap_id]
		if usage_data then
			for i_range, range_data in ipairs(usage_data.FALLOFF) do
				local modes = range_data.mode
				local total = 0
				for i_firemode, value in ipairs(modes) do
					total = total + value
				end
				local prev_value
				for i_firemode, value in ipairs(modes) do
					prev_value = (prev_value or 0) + value / total
					modes[i_firemode] = prev_value
				end
			end
		end
	end
end
function CharacterTweakData:_set_easy()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	self:_set_characters_weapon_preset("normal")
	self.flashbang_multiplier = 1
end
function CharacterTweakData:_set_normal()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 0.22,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.18,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.15,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.13,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.1,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.HEALTH_INIT = 50
	self.mobster_boss.HEALTH_INIT = 50
	self.presets.gang_member_damage.REGENERATE_TIME = 1.5
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.2
	self.presets.gang_member_damage.HEALTH_INIT = 125
	self:_set_characters_weapon_preset("normal")
	self.flashbang_multiplier = 1
end
function CharacterTweakData:_set_hard()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 0.44,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.35,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.3,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.2,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.HEALTH_INIT = 100
	self.mobster_boss.HEALTH_INIT = 100
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.4
	self:_set_characters_weapon_preset("normal")
	self.presets.gang_member_damage.HEALTH_INIT = 160
	self.flashbang_multiplier = 1.25
	self.spooc.spooc_attack_timeout = {8, 10}
	self.sniper.weapon.m4.FALLOFF = {
		{
			r = 700,
			acc = {0.6, 1},
			dmg_mul = 7,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.9},
			dmg_mul = 6,
			recoil = {4, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
end
function CharacterTweakData:_set_overkill()
	self:_multiply_all_hp(1, 1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 1.1,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 0.88,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 0.75,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 0.63,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 0.5,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.HEALTH_INIT = 300
	self.mobster_boss.HEALTH_INIT = 300
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 200
	self:_set_characters_weapon_preset("good")
	self:_set_characters_weapon_preset("good")
	self.spooc.spooc_attack_timeout = {6, 8}
	self.sniper.weapon.m4.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 8,
			recoil = {3, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.5, 0.95},
			dmg_mul = 6,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0, 0.3},
			dmg_mul = 3.5,
			recoil = {4, 6},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.5
end
function CharacterTweakData:_set_overkill_145()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1, 1)
	else
		self:_multiply_all_hp(1, 1)
	end
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 2.2,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 1.75,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 1.5,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 1.25,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.HEALTH_INIT = 600
	self.mobster_boss.HEALTH_INIT = 600
	self:_multiply_all_speeds(1.05, 1.05)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 2
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 250
	self:_set_characters_weapon_preset("expert")
	self.spooc.spooc_attack_timeout = {3.5, 5}
	self.sniper.weapon.m4.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 10,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.5},
			dmg_mul = 5,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.flashbang_multiplier = 1.75
end
function CharacterTweakData:_set_overkill_290()
	if SystemInfo:platform() == Idstring("PS3") then
		self:_multiply_all_hp(1.7, 0.75)
	else
		self:_multiply_all_hp(1.7, 0.75)
	end
	self.hector_boss.weapon.saiga.FALLOFF = {
		{
			r = 200,
			acc = {0.6, 0.9},
			dmg_mul = 3.14,
			recoil = {0.4, 0.7},
			mode = {
				0,
				1,
				2,
				1
			}
		},
		{
			r = 500,
			acc = {0.6, 0.9},
			dmg_mul = 2.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.4, 0.8},
			dmg_mul = 2.1,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.4, 0.55},
			dmg_mul = 1.8,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.1, 0.35},
			dmg_mul = 1.4,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.hector_boss.HEALTH_INIT = 900
	self.mobster_boss.HEALTH_INIT = 900
	self:_multiply_all_speeds(1.05, 1.1)
	self:_multiply_weapon_delay(self.presets.weapon.normal, 0)
	self:_multiply_weapon_delay(self.presets.weapon.good, 0)
	self:_multiply_weapon_delay(self.presets.weapon.expert, 0)
	self:_multiply_weapon_delay(self.presets.weapon.sniper, 3)
	self:_multiply_weapon_delay(self.presets.weapon.gang_member, 0)
	self.presets.gang_member_damage.REGENERATE_TIME = 1.8
	self.presets.gang_member_damage.REGENERATE_TIME_AWAY = 0.6
	self.presets.gang_member_damage.HEALTH_INIT = 300
	self:_set_characters_weapon_preset("deathwish")
	self.spooc.spooc_attack_timeout = {3, 4}
	self.sniper.weapon.m4.FALLOFF = {
		{
			r = 700,
			acc = {0.7, 1},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 4000,
			acc = {0.6, 0.95},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 10000,
			acc = {0.2, 0.8},
			dmg_mul = 12,
			recoil = {3, 5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.tank.weapon.saiga.aim_delay = {0, 0}
	self.tank.weapon.saiga.focus_delay = 0
	self.tank.weapon.saiga.FALLOFF = {
		{
			r = 100,
			acc = {0.75, 0.9},
			dmg_mul = 8,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.75, 0.9},
			dmg_mul = 7.5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.85},
			dmg_mul = 7,
			recoil = {0.45, 0.8},
			mode = {
				1,
				2,
				2,
				0
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.65},
			dmg_mul = 5,
			recoil = {0.45, 0.8},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.3, 0.5},
			dmg_mul = 3.5,
			recoil = {1, 1.2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.tank.weapon.r870.FALLOFF[1].dmg_mul = 9
	self.tank.weapon.r870.FALLOFF[2].dmg_mul = 8
	self.tank.weapon.r870.FALLOFF[3].dmg_mul = 7
	self.tank.weapon.ak47.FALLOFF = {
		{
			r = 100,
			acc = {0.7, 0.9},
			dmg_mul = 5,
			recoil = {0.4, 0.7},
			mode = {
				0,
				0,
				0,
				1
			}
		},
		{
			r = 500,
			acc = {0.5, 0.75},
			dmg_mul = 5,
			recoil = {0.5, 0.8},
			mode = {
				0,
				0,
				0,
				6
			}
		},
		{
			r = 1000,
			acc = {0.3, 0.6},
			dmg_mul = 5,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 2000,
			acc = {0.25, 0.55},
			dmg_mul = 5,
			recoil = {1, 1},
			mode = {
				0,
				0,
				2,
				6
			}
		},
		{
			r = 3000,
			acc = {0.15, 0.5},
			dmg_mul = 5,
			recoil = {1, 2},
			mode = {
				0,
				0,
				2,
				6
			}
		}
	}
	self.tank.weapon.ak47.aim_delay = {0, 0}
	self.tank.weapon.ak47.focus_delay = 0
	self.shield.weapon.mp9.aim_delay = {0, 0}
	self.shield.weapon.mp9.focus_delay = 0
	self.shield.weapon.mp9.FALLOFF = {
		{
			r = 0,
			acc = {0.9, 0.95},
			dmg_mul = 7,
			recoil = {0.35, 0.35},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 700,
			acc = {0.8, 0.8},
			dmg_mul = 7,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.65},
			dmg_mul = 7,
			recoil = {0.35, 0.55},
			mode = {
				0.2,
				2,
				4,
				10
			}
		},
		{
			r = 2000,
			acc = {0.5, 0.7},
			dmg_mul = 7,
			recoil = {0.35, 1},
			mode = {
				2,
				5,
				6,
				4
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.5},
			dmg_mul = 7,
			recoil = {0.5, 1.2},
			mode = {
				6,
				4,
				2,
				0
			}
		}
	}
	self.shield.weapon.c45.aim_delay = {0, 0}
	self.shield.weapon.c45.focus_delay = 0
	self.shield.weapon.c45.FALLOFF = {
		{
			r = 0,
			acc = {0.6, 0.9},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 700,
			acc = {0.6, 0.8},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 1000,
			acc = {0.6, 0.75},
			dmg_mul = 7.5,
			recoil = {0.35, 0.45},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 2000,
			acc = {0.6, 0.75},
			dmg_mul = 7.5,
			recoil = {0.35, 0.65},
			mode = {
				1,
				0,
				0,
				0
			}
		},
		{
			r = 3000,
			acc = {0.5, 0.6},
			dmg_mul = 7.5,
			recoil = {0.35, 1.5},
			mode = {
				1,
				0,
				0,
				0
			}
		}
	}
	self.taser.weapon.m4.FALLOFF = {
		{
			r = 100,
			acc = {0.9, 0.95},
			dmg_mul = 7,
			recoil = {0.4, 0.4},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 500,
			acc = {0.75, 0.95},
			dmg_mul = 7,
			recoil = {0.4, 0.5},
			mode = {
				0,
				3,
				3,
				1
			}
		},
		{
			r = 1000,
			acc = {0.7, 0.9},
			dmg_mul = 7,
			recoil = {0.4, 0.6},
			mode = {
				1,
				2,
				3,
				0
			}
		},
		{
			r = 2000,
			acc = {0.65, 0.8},
			dmg_mul = 7,
			recoil = {0.5, 1},
			mode = {
				3,
				2,
				2,
				0
			}
		},
		{
			r = 3000,
			acc = {0.55, 0.75},
			dmg_mul = 7,
			recoil = {1, 2},
			mode = {
				3,
				1,
				1,
				0
			}
		}
	}
	self.city_swat.HEALTH_INIT = 24
	self.city_swat.headshot_dmg_mul = self.fbi_swat.HEALTH_INIT / 8
	self.city_swat.damage.explosion_damage_mul = 0.8
	self.city_swat.damage.hurt_severity = self.presets.hurt_severities.light_hurt_fire_poison
	self.shield.weapon.mp9.focus_dis = 200
	self.tank.weapon.saiga.focus_dis = 200
	self.tank.weapon.r870.focus_dis = 200
	self.flashbang_multiplier = 2
end
function CharacterTweakData:_multiply_weapon_delay(weap_usage_table, mul)
	for _, weap_id in ipairs(self.weap_ids) do
		local usage_data = weap_usage_table[weap_id]
		if usage_data then
			usage_data.focus_delay = usage_data.focus_delay * mul
		end
	end
end
function CharacterTweakData:_multiply_all_hp(hp_mul, hs_mul)
	self.security.HEALTH_INIT = self.security.HEALTH_INIT * hp_mul
	self.cop.HEALTH_INIT = self.cop.HEALTH_INIT * hp_mul
	self.fbi.HEALTH_INIT = self.fbi.HEALTH_INIT * hp_mul
	self.swat.HEALTH_INIT = self.swat.HEALTH_INIT * hp_mul
	self.heavy_swat.HEALTH_INIT = self.heavy_swat.HEALTH_INIT * hp_mul
	self.fbi_heavy_swat.HEALTH_INIT = self.fbi_heavy_swat.HEALTH_INIT * hp_mul
	self.sniper.HEALTH_INIT = self.sniper.HEALTH_INIT * hp_mul
	self.gangster.HEALTH_INIT = self.gangster.HEALTH_INIT * hp_mul
	self.tank.HEALTH_INIT = self.tank.HEALTH_INIT * hp_mul
	self.spooc.HEALTH_INIT = self.spooc.HEALTH_INIT * hp_mul
	self.shield.HEALTH_INIT = self.shield.HEALTH_INIT * hp_mul
	self.taser.HEALTH_INIT = self.taser.HEALTH_INIT * hp_mul
	self.biker_escape.HEALTH_INIT = self.biker_escape.HEALTH_INIT * hp_mul
	if self.security.headshot_dmg_mul then
		self.security.headshot_dmg_mul = self.security.headshot_dmg_mul * hs_mul
	end
	if self.cop.headshot_dmg_mul then
		self.cop.headshot_dmg_mul = self.cop.headshot_dmg_mul * hs_mul
	end
	if self.fbi.headshot_dmg_mul then
		self.fbi.headshot_dmg_mul = self.fbi.headshot_dmg_mul * hs_mul
	end
	if self.swat.headshot_dmg_mul then
		self.swat.headshot_dmg_mul = self.swat.headshot_dmg_mul * hs_mul
	end
	if self.heavy_swat.headshot_dmg_mul then
		self.heavy_swat.headshot_dmg_mul = self.heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.fbi_heavy_swat.headshot_dmg_mul then
		self.fbi_heavy_swat.headshot_dmg_mul = self.fbi_heavy_swat.headshot_dmg_mul * hs_mul
	end
	if self.sniper.headshot_dmg_mul then
		self.sniper.headshot_dmg_mul = self.sniper.headshot_dmg_mul * hs_mul
	end
	if self.gangster.headshot_dmg_mul then
		self.gangster.headshot_dmg_mul = self.gangster.headshot_dmg_mul * hs_mul
	end
	if self.tank.headshot_dmg_mul then
		self.tank.headshot_dmg_mul = self.tank.headshot_dmg_mul * hs_mul
	end
	if self.spooc.headshot_dmg_mul then
		self.spooc.headshot_dmg_mul = self.spooc.headshot_dmg_mul * hs_mul
	end
	if self.shield.headshot_dmg_mul then
		self.shield.headshot_dmg_mul = self.shield.headshot_dmg_mul * hs_mul
	end
	if self.taser.headshot_dmg_mul then
		self.taser.headshot_dmg_mul = self.taser.headshot_dmg_mul * hs_mul
	end
	if self.biker_escape.headshot_dmg_mul then
		self.biker_escape.headshot_dmg_mul = self.biker_escape.headshot_dmg_mul * hs_mul
	end
end
function CharacterTweakData:_multiply_all_speeds(walk_mul, run_mul)
	local all_units = {
		"security",
		"cop",
		"fbi",
		"swat",
		"heavy_swat",
		"sniper",
		"gangster",
		"tank",
		"spooc",
		"shield",
		"taser"
	}
	for _, name in ipairs(all_units) do
		local speed_table = self[name].SPEED_WALK
		speed_table.hos = speed_table.hos * walk_mul
		speed_table.cbt = speed_table.cbt * walk_mul
	end
	self.security.SPEED_RUN = self.security.SPEED_RUN * run_mul
	self.cop.SPEED_RUN = self.cop.SPEED_RUN * run_mul
	self.fbi.SPEED_RUN = self.fbi.SPEED_RUN * run_mul
	self.swat.SPEED_RUN = self.swat.SPEED_RUN * run_mul
	self.heavy_swat.SPEED_RUN = self.heavy_swat.SPEED_RUN * run_mul
	self.fbi_heavy_swat.SPEED_RUN = self.fbi_heavy_swat.SPEED_RUN * run_mul
	self.sniper.SPEED_RUN = self.sniper.SPEED_RUN * run_mul
	self.gangster.SPEED_RUN = self.gangster.SPEED_RUN * run_mul
	self.tank.SPEED_RUN = self.tank.SPEED_RUN * run_mul
	self.spooc.SPEED_RUN = self.spooc.SPEED_RUN * run_mul
	self.shield.SPEED_RUN = self.shield.SPEED_RUN * run_mul
	self.taser.SPEED_RUN = self.taser.SPEED_RUN * run_mul
	self.biker_escape.SPEED_RUN = self.biker_escape.SPEED_RUN * run_mul
end
function CharacterTweakData:_set_characters_weapon_preset(preset)
	local all_units = {
		"security",
		"cop",
		"fbi",
		"swat",
		"heavy_swat",
		"gangster"
	}
	for _, name in ipairs(all_units) do
		self[name].weapon = self.presets.weapon[preset]
	end
end
function CharacterTweakData:character_map()
	local char_map = {
		basic = {
			path = "units/payday2/characters/",
			list = {
				"civ_female_bank_1",
				"civ_female_bank_manager_1",
				"civ_female_bikini_1",
				"civ_female_bikini_2",
				"civ_female_casual_1",
				"civ_female_casual_2",
				"civ_female_casual_3",
				"civ_female_casual_4",
				"civ_female_casual_5",
				"civ_female_casual_6",
				"civ_female_casual_7",
				"civ_female_casual_8",
				"civ_female_casual_9",
				"civ_female_casual_10",
				"civ_female_crackwhore_1",
				"civ_female_curator_1",
				"civ_female_curator_2",
				"civ_female_hostess_apron_1",
				"civ_female_hostess_jacket_1",
				"civ_female_hostess_shirt_1",
				"civ_female_party_1",
				"civ_female_party_2",
				"civ_female_party_3",
				"civ_female_party_4",
				"civ_female_waitress_1",
				"civ_female_waitress_2",
				"civ_female_waitress_3",
				"civ_female_waitress_4",
				"civ_female_wife_trophy_1",
				"civ_female_wife_trophy_2",
				"civ_male_bank_1",
				"civ_male_bank_2",
				"civ_male_bank_manager_1",
				"civ_male_bank_manager_3",
				"civ_male_bank_manager_4",
				"civ_male_bartender_1",
				"civ_male_bartender_2",
				"civ_male_business_1",
				"civ_male_business_2",
				"civ_male_casual_1",
				"civ_male_casual_2",
				"civ_male_casual_3",
				"civ_male_casual_4",
				"civ_male_casual_5",
				"civ_male_casual_6",
				"civ_male_casual_7",
				"civ_male_casual_8",
				"civ_male_casual_9",
				"civ_male_casual_12",
				"civ_male_casual_13",
				"civ_male_casual_14",
				"civ_male_curator_1",
				"civ_male_curator_2",
				"civ_male_curator_3",
				"civ_male_dj_1",
				"civ_male_italian_robe_1",
				"civ_male_janitor_1",
				"civ_male_janitor_2",
				"civ_male_janitor_3",
				"civ_male_meth_cook_1",
				"civ_male_party_1",
				"civ_male_party_2",
				"civ_male_party_3",
				"civ_male_pilot_1",
				"civ_male_scientist_1",
				"civ_male_miami_store_clerk_1",
				"civ_male_taxman",
				"civ_male_trucker_1",
				"civ_male_worker_1",
				"civ_male_worker_2",
				"civ_male_worker_3",
				"civ_male_worker_docks_1",
				"civ_male_worker_docks_2",
				"civ_male_worker_docks_3",
				"ene_biker_1",
				"ene_biker_2",
				"ene_biker_3",
				"ene_biker_4",
				"ene_bulldozer_1",
				"ene_bulldozer_2",
				"ene_bulldozer_3",
				"ene_bulldozer_4",
				"ene_city_swat_1",
				"ene_city_swat_2",
				"ene_city_swat_3",
				"ene_murkywater_1",
				"ene_murkywater_2",
				"ene_cop_1",
				"ene_cop_2",
				"ene_cop_3",
				"ene_cop_4",
				"ene_fbi_1",
				"ene_fbi_2",
				"ene_fbi_3",
				"ene_fbi_boss_1",
				"ene_fbi_female_1",
				"ene_fbi_female_2",
				"ene_fbi_female_3",
				"ene_fbi_female_4",
				"ene_fbi_heavy_1",
				"ene_fbi_office_1",
				"ene_fbi_office_2",
				"ene_fbi_office_3",
				"ene_fbi_office_4",
				"ene_fbi_swat_1",
				"ene_fbi_swat_2",
				"ene_gang_black_1",
				"ene_gang_black_2",
				"ene_gang_black_3",
				"ene_gang_black_4",
				"ene_gang_mexican_1",
				"ene_gang_mexican_2",
				"ene_gang_mexican_3",
				"ene_gang_mexican_4",
				"ene_gang_russian_1",
				"ene_gang_russian_2",
				"ene_gang_russian_3",
				"ene_gang_russian_4",
				"ene_gang_russian_5",
				"ene_gang_mobster_1",
				"ene_gang_mobster_2",
				"ene_gang_mobster_3",
				"ene_gang_mobster_4",
				"ene_gang_mobster_boss",
				"ene_guard_national_1",
				"ene_hoxton_breakout_guard_1",
				"ene_hoxton_breakout_guard_2",
				"ene_male_tgt_1",
				"ene_murkywater_1",
				"ene_murkywater_2",
				"ene_prisonguard_female_1",
				"ene_prisonguard_male_1",
				"ene_secret_service_1",
				"ene_secret_service_2",
				"ene_security_1",
				"ene_security_2",
				"ene_security_3",
				"ene_security_4",
				"ene_security_5",
				"ene_security_6",
				"ene_security_7",
				"ene_security_8",
				"ene_shield_1",
				"ene_shield_2",
				"ene_sniper_1",
				"ene_sniper_2",
				"ene_spook_1",
				"ene_swat_1",
				"ene_swat_2",
				"ene_swat_heavy_1",
				"ene_tazer_1",
				"ene_veteran_cop_1",
				"npc_old_hoxton_prisonsuit_1",
				"npc_old_hoxton_prisonsuit_2"
			}
		},
		dlc1 = {
			path = "units/pd2_dlc1/characters/",
			list = {
				"civ_male_bank_manager_2",
				"civ_male_casual_10",
				"civ_male_casual_11",
				"civ_male_firefighter_1",
				"civ_male_paramedic_1",
				"civ_male_paramedic_2",
				"ene_security_gensec_1",
				"ene_security_gensec_2"
			}
		},
		dlc2 = {
			path = "units/pd2_dlc2/characters/",
			list = {
				"civ_female_bank_assistant_1",
				"civ_female_bank_assistant_2"
			}
		},
		mansion = {
			path = "units/pd2_mcmansion/characters/",
			list = {
				"ene_male_hector_1",
				"ene_male_hector_2",
				"ene_hoxton_breakout_guard_1",
				"ene_hoxton_breakout_guard_2"
			}
		},
		cage = {
			path = "units/pd2_dlc_cage/characters/",
			list = {
				"civ_female_bank_2"
			}
		},
		arena = {
			path = "units/pd2_dlc_arena/characters/",
			list = {
				"civ_female_fastfood_1",
				"civ_female_party_alesso_1",
				"civ_female_party_alesso_2",
				"civ_female_party_alesso_3",
				"civ_female_party_alesso_4",
				"civ_female_party_alesso_5",
				"civ_female_party_alesso_6",
				"civ_male_party_alesso_1",
				"civ_male_party_alesso_2",
				"civ_male_alesso_booth",
				"civ_male_fastfood_1",
				"ene_guard_security_heavy_2",
				"ene_guard_security_heavy_1"
			}
		},
		kenaz = {
			path = "units/pd2_dlc_casino/characters/",
			list = {
				"civ_male_casino_1",
				"civ_male_casino_2",
				"civ_male_casino_3",
				"civ_male_casino_4",
				"ene_secret_service_1_casino",
				"civ_male_business_casino_1",
				"civ_male_business_casino_2",
				"civ_male_impersonator",
				"civ_female_casino_1",
				"civ_female_casino_2",
				"civ_female_casino_3",
				"civ_male_casino_pitboss"
			}
		}
	}
	if TweakData._init_wip_character_map then
		TweakData._init_wip_character_map(char_map)
	end
	return char_map
end
