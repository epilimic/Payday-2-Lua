UpgradesTweakData = UpgradesTweakData or class()
function UpgradesTweakData:_init_pd2_values()
	self:_init_value_tables()
	self.values.rep_upgrades = {}
	self.values.rep_upgrades.classes = {
		"rep_upgrade"
	}
	self.values.rep_upgrades.values = {2}
	self.values.player.body_armor = {}
	self.values.player.body_armor.armor = {
		0,
		1,
		2,
		3,
		5,
		7,
		15
	}
	self.values.player.body_armor.movement = {
		1.05,
		1.025,
		1,
		0.95,
		0.75,
		0.65,
		0.575
	}
	self.values.player.body_armor.concealment = {
		30,
		26,
		23,
		21,
		18,
		12,
		1
	}
	self.values.player.body_armor.dodge = {
		0.1,
		-0.2,
		-0.25,
		-0.3,
		-0.35,
		-0.4,
		-0.5
	}
	self.values.player.body_armor.damage_shake = {
		1,
		0.96,
		0.92,
		0.85,
		0.8,
		0.7,
		0.5
	}
	self.values.player.body_armor.stamina = {
		1.025,
		1,
		0.95,
		0.9,
		0.85,
		0.8,
		0.7
	}
	self.values.player.body_armor.skill_ammo_mul = {
		1,
		1.02,
		1.04,
		1.06,
		1.8,
		1.1,
		1.12
	}
	self.values.player.special_enemy_highlight = {true}
	self.values.player.hostage_trade = {true}
	self.values.player.sec_camera_highlight = {true}
	self.values.player.sec_camera_highlight_mask_off = {true}
	self.values.player.special_enemy_highlight_mask_off = {true}
	self.ammo_bag_base = 3
	self.ecm_jammer_base_battery_life = 20
	self.ecm_jammer_base_low_battery_life = 8
	self.ecm_jammer_base_range = 2500
	self.ecm_feedback_min_duration = 15
	self.ecm_feedback_max_duration = 20
	self.ecm_feedback_interval = 1.5
	self.sentry_gun_base_ammo = 150
	self.sentry_gun_base_armor = 10
	self.doctor_bag_base = 2
	self.grenade_crate_base = 3
	self.max_grenade_amount = 3
	self.bodybag_crate_base = 3
	self.cop_hurt_alert_radius_whisper = 600
	self.cop_hurt_alert_radius = 400
	self.drill_alert_radius = 2500
	self.taser_malfunction_min = 1
	self.taser_malfunction_max = 3
	self.counter_taser_damage = 0.5
	self.morale_boost_speed_bonus = 1.2
	self.morale_boost_suppression_resistance = 1
	self.morale_boost_time = 10
	self.morale_boost_reload_speed_bonus = 1.2
	self.morale_boost_base_cooldown = 3.5
	self.max_weapon_dmg_mul_stacks = 4
	self.max_melee_weapon_dmg_mul_stacks = 4
	self.hostage_near_player_radius = 1000
	self.hostage_near_player_check_t = 0.5
	self.hostage_near_player_multiplier = 1.25
	self.hostage_max_num = {
		health_regen = 1,
		health = 10,
		stamina = 10,
		damage_dampener = 1
	}
	self.on_headshot_dealt_cooldown = 2
	self.on_killshot_cooldown = 2
	self.on_damage_dealt_cooldown = 2
	self.close_combat_distance = 1800
	self.killshot_close_panic_range = 900
	self.berserker_movement_speed_multiplier = 0.4
	self.weapon_cost_multiplier = {}
	self.weapon_cost_multiplier.akimbo = 1.4
	self.weapon_movement_penalty = {}
	self.weapon_movement_penalty.lmg = 1
	self.weapon_movement_penalty.minigun = 1
	self.explosive_bullet = {}
	self.explosive_bullet.curve_pow = 0.5
	self.explosive_bullet.player_dmg_mul = 0.1
	self.explosive_bullet.range = 200
	self.explosive_bullet.feedback_range = self.explosive_bullet.range
	self.explosive_bullet.camera_shake_max_mul = 2
	self.values.player.crime_net_deal = {0.9, 0.8}
	self.values.player.corpse_alarm_pager_bluff = {true}
	self.values.player.marked_enemy_extra_damage = {true}
	self.values.player.marked_enemy_damage_mul = 1.15
	self.values.cable_tie.interact_speed_multiplier = {0.25}
	self.values.cable_tie.quantity_1 = {4}
	self.values.cable_tie.can_cable_tie_doors = {true}
	self.values.temporary.combat_medic_damage_multiplier = {
		{1.25, 10},
		{1.25, 15}
	}
	self.values.player.revive_health_boost = {1}
	self.revive_health_multiplier = {1.3}
	self.values.player.civ_harmless_bullets = {true}
	self.values.player.civ_harmless_melee = {true}
	self.values.player.civ_calming_alerts = {true}
	self.values.player.civ_intimidation_mul = {1.5}
	self.values.team.pistol.recoil_multiplier = {0.75}
	self.values.team.akimbo.recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.weapon.recoil_multiplier = {0.5}
	self.values.team.pistol.suppression_recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.akimbo.suppression_recoil_multiplier = self.values.team.akimbo.recoil_multiplier
	self.values.team.weapon.suppression_recoil_multiplier = self.values.team.weapon.recoil_multiplier
	self.values.player.assets_cost_multiplier = {0.5}
	self.values.player.additional_assets = {true}
	self.values.player.stamina_multiplier = {2}
	self.values.team.stamina.multiplier = {1.5}
	self.values.player.intimidate_enemies = {true}
	self.values.player.intimidate_range_mul = {1.5}
	self.values.player.intimidate_aura = {700}
	self.values.player.civilian_reviver = {true}
	self.values.player.civilian_gives_ammo = {true}
	self.values.player.buy_cost_multiplier = {0.9, 0.7}
	self.values.player.sell_cost_multiplier = {1.25}
	self.values.doctor_bag.quantity = {1}
	self.values.doctor_bag.amount_increase = {2}
	self.values.player.convert_enemies = {true}
	self.values.player.convert_enemies_max_minions = {1, 2}
	self.values.player.convert_enemies_health_multiplier = {0.65}
	self.values.player.convert_enemies_damage_multiplier = {1.45}
	self.values.player.xp_multiplier = {1.15}
	self.values.team.xp.multiplier = {1.3}
	self.values.pistol.reload_speed_multiplier = {1.5}
	self.values.akimbo.reload_speed_multiplier = self.values.pistol.reload_speed_multiplier
	self.values.pistol.damage_addend = {1.5}
	self.values.akimbo.damage_addend = {0.75}
	self.values.pistol.damage_multiplier = {1.5}
	self.values.assault_rifle.reload_speed_multiplier = {1.25}
	self.values.assault_rifle.move_spread_multiplier = {0.5}
	self.values.player.pistol_revive_from_bleed_out = {1, 3}
	self.values.pistol.spread_multiplier = {0.9}
	self.values.akimbo.spread_multiplier = self.values.pistol.spread_multiplier
	self.values.pistol.swap_speed_multiplier = {1.5}
	self.values.akimbo.swap_speed_multiplier = self.values.pistol.swap_speed_multiplier
	self.values.pistol.fire_rate_multiplier = {2}
	self.values.akimbo.fire_rate_multiplier = self.values.pistol.fire_rate_multiplier
	self.values.player.revive_interaction_speed_multiplier = {0.5}
	self.values.player.long_dis_revive = {0.75, 1}
	self.values.doctor_bag.interaction_speed_multiplier = {0.8}
	self.values.team.stamina.passive_multiplier = {1.5, 1.3}
	self.values.player.passive_intimidate_range_mul = {1.25}
	self.values.team.health.passive_multiplier = {1.1}
	self.values.player.passive_convert_enemies_health_multiplier = {0.25}
	self.values.player.passive_convert_enemies_damage_multiplier = {1.15}
	self.values.player.convert_enemies_interaction_speed_multiplier = {0.35}
	self.values.player.empowered_intimidation_mul = {3}
	self.values.player.passive_assets_cost_multiplier = {0.5}
	self.values.player.suppression_multiplier = {1.25, 1.75}
	self.values.carry.movement_speed_multiplier = {1.5}
	self.values.carry.throw_distance_multiplier = {1.5}
	self.values.temporary.no_ammo_cost = {
		{true, 5},
		{true, 15}
	}
	self.values.player.non_special_melee_multiplier = {1.5}
	self.values.player.melee_damage_multiplier = {1.5}
	self.values.player.primary_weapon_when_downed = {true}
	self.values.player.armor_regen_timer_multiplier = {0.85}
	self.values.temporary.dmg_multiplier_outnumbered = {
		{1.15, 7}
	}
	self.values.temporary.dmg_dampener_outnumbered = {
		{0.85, 7}
	}
	self.values.player.extra_ammo_multiplier = {1.25}
	self.values.player.pick_up_ammo_multiplier = {1.35, 1.75}
	self.values.player.damage_shake_multiplier = {0.5}
	self.values.player.bleed_out_health_multiplier = {1.25}
	self.values.shotgun.recoil_multiplier = {0.75}
	self.values.shotgun.damage_multiplier = {1.35}
	self.values.ammo_bag.quantity = {1}
	self.values.ammo_bag.ammo_increase = {2}
	self.values.shotgun.reload_speed_multiplier = {1.5}
	self.values.shotgun.enter_steelsight_speed_multiplier = {2.25}
	self.values.saw.extra_ammo_multiplier = {1.5}
	self.values.player.flashbang_multiplier = {0.75, 0.25}
	self.values.shotgun.hip_fire_spread_multiplier = {0.8}
	self.values.pistol.hip_fire_spread_multiplier = {0.8}
	self.values.assault_rifle.hip_fire_spread_multiplier = {0.8}
	self.values.smg.hip_fire_spread_multiplier = {0.8}
	self.values.saw.hip_fire_spread_multiplier = {0.8}
	self.values.player.saw_speed_multiplier = {0.95, 0.65}
	self.values.saw.lock_damage_multiplier = {1.2, 1.4}
	self.values.saw.enemy_slicer = {true}
	self.values.player.melee_damage_health_ratio_multiplier = {2.5}
	self.values.player.damage_health_ratio_multiplier = {1}
	self.player_damage_health_ratio_threshold = 0.25
	self.values.player.shield_knock = {true}
	self.values.temporary.overkill_damage_multiplier = {
		{1.75, 5}
	}
	self.values.player.overkill_all_weapons = {true}
	self.values.player.passive_suppression_multiplier = {1.1, 1.2}
	self.values.player.passive_health_multiplier = {
		1.1,
		1.2,
		1.4,
		1.8
	}
	self.values.weapon.passive_damage_multiplier = {1.05}
	self.values.assault_rifle.enter_steelsight_speed_multiplier = {2}
	self.values.assault_rifle.zoom_increase = {2}
	self.values.player.crafting_weapon_multiplier = {0.9}
	self.values.player.crafting_mask_multiplier = {0.9}
	self.values.trip_mine.quantity_1 = {1}
	self.values.trip_mine.can_switch_on_off = {true}
	self.values.player.drill_speed_multiplier = {0.85, 0.7}
	self.values.player.trip_mine_deploy_time_multiplier = {0.8, 0.6}
	self.values.trip_mine.sensor_toggle = {true}
	self.values.player.drill_fix_interaction_speed_multiplier = {0.75}
	self.values.player.drill_autorepair = {0.3}
	self.values.player.sentry_gun_deploy_time_multiplier = {0.5}
	self.values.sentry_gun.armor_multiplier = {2.5}
	self.values.weapon.single_spread_multiplier = {0.8}
	self.values.assault_rifle.recoil_multiplier = {0.75}
	self.values.player.taser_malfunction = {true}
	self.values.player.taser_self_shock = {true}
	self.values.sentry_gun.spread_multiplier = {0.5}
	self.values.sentry_gun.rot_speed_multiplier = {2.5}
	self.values.player.interacting_damage_multiplier = {0.5}
	self.values.player.steelsight_when_downed = {true}
	self.values.player.drill_alert_rad = {900}
	self.values.player.silent_drill = {true}
	self.values.sentry_gun.extra_ammo_multiplier = {1.5, 2.5}
	self.values.sentry_gun.shield = {true}
	self.values.trip_mine.explosion_size_multiplier_1 = {1.3}
	self.values.trip_mine.explosion_size_multiplier_2 = {1.7}
	self.values.trip_mine.quantity_3 = {3}
	self.values.player.trip_mine_shaped_charge = {true}
	self.values.sentry_gun.quantity = {1}
	self.values.sentry_gun.damage_multiplier = {4}
	self.values.weapon.clip_ammo_increase = {5, 15}
	self.values.player.armor_multiplier = {1.5}
	self.values.team.armor.regen_time_multiplier = {0.75}
	self.values.player.passive_crafting_weapon_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.player.passive_crafting_mask_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.weapon.passive_recoil_multiplier = {0.95, 0.9}
	self.values.weapon.passive_headshot_damage_multiplier = {1.25}
	self.values.player.passive_armor_multiplier = {1.1, 1.25}
	self.values.team.armor.passive_regen_time_multiplier = {0.9}
	self.values.player.small_loot_multiplier = {1.1, 1.3}
	self.values.player.stamina_regen_timer_multiplier = {0.75}
	self.values.player.stamina_regen_multiplier = {1.25}
	self.values.player.run_dodge_chance = {0.25}
	self.values.player.run_speed_multiplier = {1.25}
	self.values.player.fall_damage_multiplier = {0.25}
	self.values.player.fall_health_damage_multiplier = {0}
	self.values.player.respawn_time_multiplier = {0.5}
	self.values.weapon.special_damage_taken_multiplier = {1.05}
	self.values.player.buy_bodybags_asset = {true}
	self.values.player.corpse_dispose = {true}
	self.values.player.corpse_dispose_amount = {1, 2}
	self.values.carry.interact_speed_multiplier = {0.75, 0.25}
	self.values.player.suspicion_multiplier = {0.75}
	self.values.player.camouflage_bonus = {0.85}
	self.values.player.walk_speed_multiplier = {1.25}
	self.values.player.crouch_speed_multiplier = {1.1}
	self.values.player.silent_kill = {25}
	self.values.player.melee_knockdown_mul = {1.5}
	self.values.player.damage_dampener = {0.95}
	self.values.player.melee_damage_dampener = {0.5}
	self.values.smg.reload_speed_multiplier = {1.35}
	self.values.smg.fire_rate_multiplier = {1.2}
	self.values.player.additional_lives = {1, 3}
	self.values.player.cheat_death_chance = {0.35}
	self.values.ecm_jammer.can_activate_feedback = {true}
	self.values.ecm_jammer.feedback_duration_boost = {1.25}
	self.values.ecm_jammer.interaction_speed_multiplier = {0}
	self.values.weapon.silencer_damage_multiplier = {1.15, 1.3}
	self.values.weapon.armor_piercing_chance_silencer = {0.2, 0.4}
	self.values.ecm_jammer.duration_multiplier = {1.25}
	self.values.ecm_jammer.can_open_sec_doors = {true}
	self.values.player.pick_lock_easy = {true}
	self.values.player.pick_lock_easy_speed_multiplier = {0.75, 0.5}
	self.values.player.pick_lock_hard = {true}
	self.values.weapon.silencer_recoil_multiplier = {0.5}
	self.values.weapon.silencer_spread_multiplier = {0.5}
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = {2}
	self.values.player.loot_drop_multiplier = {1.5, 3}
	self.values.ecm_jammer.quantity = {1, 3}
	self.values.ecm_jammer.duration_multiplier_2 = {1.25}
	self.values.ecm_jammer.feedback_duration_boost_2 = {1.25}
	self.values.ecm_jammer.affects_pagers = {true}
	self.values.player.can_strafe_run = {true}
	self.values.player.can_free_run = {true}
	self.values.ecm_jammer.affects_cameras = {true}
	self.values.player.passive_dodge_chance = {
		0.05,
		0.15,
		0.25
	}
	self.values.weapon.passive_swap_speed_multiplier = {1.8, 2}
	self.values.player.passive_concealment_modifier = {1}
	self.values.player.passive_armor_movement_penalty_multiplier = {0.75}
	self.values.player.passive_loot_drop_multiplier = {1.1}
	self.values.weapon.armor_piercing_chance = {0.25}
	self.values.lmg.recoil_multiplier = {0.75}
	self.values.lmg.enter_steelsight_speed_multiplier = {2}
	self.values.lmg.reload_speed_multiplier = {1.25}
	self.values.lmg.move_spread_multiplier = {0.5}
	self.values.lmg.hip_fire_spread_multiplier = {0.8}
	self.values.lmg.hip_fire_damage_multiplier = {1.2}
	self.values.lmg.zoom_increase = {2}
	self.values.snp.recoil_multiplier = {0.75}
	self.values.snp.enter_steelsight_speed_multiplier = {2}
	self.values.snp.reload_speed_multiplier = {1.25}
	self.values.snp.move_spread_multiplier = {0.5}
	self.values.snp.hip_fire_spread_multiplier = {0.8}
	self.values.snp.hip_fire_damage_multiplier = {1.2}
	self.values.snp.zoom_increase = {2}
	self.values.player.run_and_shoot = {true}
	self.values.player.run_and_reload = {true}
	self.values.player.morale_boost = {true}
	self.values.player.electrocution_resistance_multiplier = {0.25}
	self.values.player.concealment_modifier = {
		5,
		10,
		15
	}
	self.values.sentry_gun.armor_multiplier2 = {1.25}
	self.values.saw.armor_piercing_chance = {1}
	self.values.saw.swap_speed_multiplier = {1.5}
	self.values.saw.reload_speed_multiplier = {1.5}
	self.values.team.health.hostage_multiplier = {1.02}
	self.values.team.stamina.hostage_multiplier = {1.04}
	self.values.player.minion_master_speed_multiplier = {1.1}
	self.values.player.minion_master_health_multiplier = {1.2}
	self.values.player.mark_enemy_time_multiplier = {2}
	self.values.player.critical_hit_chance = {0.25, 0.5}
	self.values.player.melee_kill_snatch_pager_chance = {0.25}
	self.values.player.detection_risk_add_crit_chance = {
		{
			0.03,
			3,
			"below",
			35,
			0.3
		},
		{
			0.03,
			1,
			"below",
			35,
			0.3
		}
	}
	self.values.player.detection_risk_add_dodge_chance = {
		{
			0.01,
			3,
			"below",
			35,
			0.1
		},
		{
			0.01,
			1,
			"below",
			35,
			0.1
		}
	}
	self.values.player.detection_risk_damage_multiplier = {
		{
			0.05,
			7,
			"above",
			40
		}
	}
	self.values.player.overkill_health_to_damage_multiplier = {0.66}
	self.values.player.tased_recover_multiplier = {0.5}
	self.values.player.secured_bags_speed_multiplier = {1.02}
	self.values.temporary.no_ammo_cost_buff = {
		{true, 60}
	}
	self.values.player.secured_bags_money_multiplier = {1.02}
	self.values.pistol.stacking_hit_expire_t = {2, 8}
	self.values.carry.movement_penalty_nullifier = {true}
	self.values.temporary.berserker_damage_multiplier = {
		{1, 3},
		{1, 9}
	}
	self.values.player.berserker_no_ammo_cost = {true}
	self.values.player.hostage_health_regen_addend = {0.015, 0.045}
	self.values.player.carry_sentry_and_trip = {true}
	self.values.player.tier_armor_multiplier = {
		1.05,
		1.1,
		1.2,
		1.3,
		1.15,
		1.35
	}
	self.values.shotgun.hip_fire_damage_multiplier = {1.2}
	self.values.pistol.hip_fire_damage_multiplier = {1.2}
	self.values.assault_rifle.hip_fire_damage_multiplier = {1.2}
	self.values.smg.hip_fire_damage_multiplier = {1.2}
	self.values.saw.hip_fire_damage_multiplier = {1.2}
	self.values.shotgun.consume_no_ammo_chance = {0.01, 0.03}
	self.values.player.add_armor_stat_skill_ammo_mul = {true}
	self.values.saw.melee_knockdown_mul = {1.75}
	self.values.shotgun.melee_knockdown_mul = {1.75}
	self.values.player.assets_cost_multiplier_b = {0.5}
	self.values.player.premium_contract_cost_multiplier = {0.5}
	self.values.player.morale_boost_cooldown_multiplier = {0.5}
	self.values.player.level_interaction_timer_multiplier = {
		{0.01, 10}
	}
	self.values.team.player.clients_buy_assets = {true}
	self.values.player.steelsight_normal_movement_speed = {true}
	self.values.team.weapon.move_spread_multiplier = {1.1}
	self.values.team.player.civ_intimidation_mul = {1.15}
	self.values.sentry_gun.can_revive = {true}
	self.values.sentry_gun.can_reload = {true}
	self.sentry_gun_reload_ratio = 1
	self.values.weapon.modded_damage_multiplier = {1.1}
	self.values.weapon.modded_spread_multiplier = {0.9}
	self.values.weapon.modded_recoil_multiplier = {0.9}
	self.values.sentry_gun.armor_piercing_chance = {0.15}
	self.values.sentry_gun.armor_piercing_chance_2 = {0.05}
	self.values.weapon.armor_piercing_chance_2 = {0.05}
	self.values.player.resist_firing_tased = {true}
	self.values.player.crouch_dodge_chance = {0.05, 0.15}
	self.values.player.climb_speed_multiplier = {1.2, 1.75}
	self.values.team.xp.stealth_multiplier = {1.5}
	self.values.team.cash.stealth_money_multiplier = {1.5}
	self.values.team.cash.stealth_bags_multiplier = {1.5}
	self.values.player.tape_loop_duration = {10, 20}
	self.values.player.tape_loop_interact_distance_mul = {1.4}
	self.values.player.buy_spotter_asset = {true}
	self.values.player.close_to_hostage_boost = {true}
	self.values.trip_mine.sensor_highlight = {true}
	self.values.player.on_zipline_dodge_chance = {0.15}
	self.values.player.movement_speed_multiplier = {1.1}
	self.values.player.gangster_damage_dampener = {0.9, 0.65}
	self.values.player.level_2_armor_addend = {2}
	self.values.player.level_3_armor_addend = {2}
	self.values.player.level_4_armor_addend = {2}
	self.values.player.level_2_dodge_addend = {
		0.1,
		0.2,
		0.35
	}
	self.values.player.level_3_dodge_addend = {
		0.1,
		0.2,
		0.35
	}
	self.values.player.level_4_dodge_addend = {
		0.1,
		0.2,
		0.35
	}
	self.values.player.damage_shake_addend = {1}
	self.values.player.melee_concealment_modifier = {2}
	self.values.player.melee_sharp_damage_multiplier = {3}
	self.values.team.armor.multiplier = {1.05}
	self.values.player.armor_regen_timer_multiplier_passive = {0.9}
	self.values.player.armor_regen_timer_multiplier_tier = {0.9}
	self.values.player.camouflage_multiplier = {0.85}
	self.values.player.uncover_multiplier = {1.15}
	self.values.player.passive_xp_multiplier = {1.45}
	self.values.player.pick_up_ammo_multiplier_2 = {1.3}
	self.values.team.damage_dampener.hostage_multiplier = {0.92}
	self.values.player.level_2_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_3_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_4_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.passive_health_regen = {0.04}
	self.values.cable_tie.quantity_2 = {4}
	self.ecm_feedback_retrigger_interval = 240
	self.ecm_feedback_retrigger_chance = 1
	self.values.player.revive_damage_reduction_level = {1, 2}
	self.values.trip_mine.marked_enemy_extra_damage = {true}
	self.values.ecm_jammer.can_retrigger = {true}
	self.values.player.panic_suppression = {true}
	self.values.akimbo.extra_ammo_multiplier = {1.25, 1.5}
	self.values.akimbo.damage_multiplier = {1.5, 3}
	self.values.akimbo.recoil_multiplier = {
		2.5,
		2,
		1.5
	}
	self.values.akimbo.passive_recoil_multiplier = {2.5, 2}
	self.values.akimbo.clip_ammo_increase = self.values.weapon.clip_ammo_increase
	self.values.player.perk_armor_regen_timer_multiplier = {
		0.95,
		0.85,
		0.75,
		0.65,
		0.55
	}
	self.values.player.perk_armor_loss_multiplier = {
		0.95,
		0.9,
		0.85,
		0.8
	}
	self.values.player.headshot_regen_armor_bonus = {1.5, 4.5}
	self.values.pistol.stacking_hit_damage_multiplier = {0.1}
	self.values.bodybags_bag.quantity = {1}
	self.values.first_aid_kit.quantity = {3, 10}
	self.values.first_aid_kit.deploy_time_multiplier = {0.5}
	self.values.first_aid_kit.damage_reduction_upgrade = {true}
	self.values.first_aid_kit.downs_restore_chance = {0.1}
	self.values.temporary.first_aid_damage_reduction = {
		{0.8, 10}
	}
	self.values.player.extra_corpse_dispose_amount = {1}
	self.values.player.standstill_omniscience = {true}
	self.values.player.mask_off_pickup = {true}
	self.values.player.cleaner_cost_multiplier = {0.25}
	self.values.player.counter_strike_melee = {true}
	self.values.player.counter_strike_spooc = {true}
	self.values.temporary.passive_revive_damage_reduction = {
		{0.9, 5},
		{0.7, 5}
	}
	self.values.player.passive_convert_enemies_health_multiplier = {0.6, 0.2}
	self.values.player.armor_regen_timer_stand_still_multiplier = {0.8}
	self.values.player.tier_dodge_chance = {
		0.1,
		0.15,
		0.2
	}
	self.values.player.stand_still_crouch_camouflage_bonus = {
		0.9,
		0.85,
		0.8
	}
	self.values.player.corpse_dispose_speed_multiplier = {0.8}
	self.values.player.pick_lock_speed_multiplier = {0.8}
	self.values.player.alarm_pager_speed_multiplier = {0.9}
	self.values.temporary.melee_life_leech = {
		{0.2, 10}
	}
	self.values.temporary.dmg_dampener_outnumbered_strong = {
		{0.92, 7}
	}
	self.values.temporary.dmg_dampener_close_contact = {
		{0.92, 7},
		{0.84, 7},
		{0.76, 7}
	}
	self.values.melee.stacking_hit_damage_multiplier = {0.1, 0.2}
	self.values.melee.stacking_hit_expire_t = {7}
	self.values.player.melee_kill_life_leech = {0.1}
	self.values.player.killshot_regen_armor_bonus = {3}
	self.values.player.killshot_close_regen_armor_bonus = {3}
	self.values.player.killshot_close_panic_chance = {0.75}
	self.loose_ammo_restore_health_values = {
		base = 4,
		cd = 4,
		multiplier = 0.2,
		{0, 2},
		{2, 4},
		{4, 6}
	}
	self.loose_ammo_give_team_ratio = 0.5
	self.loose_ammo_give_team_health_ratio = 1
	self.values.temporary.loose_ammo_restore_health = {}
	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		local base = self.loose_ammo_restore_health_values.base
		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				base + data[1],
				base + data[2]
			},
			self.loose_ammo_restore_health_values.cd
		})
	end
	self.values.temporary.loose_ammo_give_team = {
		{true, 5}
	}
	self.values.player.loose_ammo_restore_health_give_team = {true}
	self.damage_to_hot_data = {
		armors_allowed = {"level_1", "level_2"},
		works_with_armor_kit = true,
		tick_time = 0.5,
		total_ticks = 10,
		max_stacks = false,
		stacking_cooldown = 1.5,
		add_stack_sources = {
			bullet = true,
			explosion = true,
			melee = true,
			taser_tased = true,
			poison = true,
			fire = true,
			swat_van = true,
			civilian = false
		}
	}
	self.values.player.damage_to_hot = {
		0.1,
		0.2,
		0.3,
		0.4
	}
	self.values.player.damage_to_hot_extra_ticks = {2}
	self.values.player.armor_piercing_chance = {0.1, 0.3}
	self.values.player.armor_regen_damage_health_ratio_multiplier = {
		0.2,
		0.4,
		0.6
	}
	self.values.player.movement_speed_damage_health_ratio_multiplier = {0.2}
	self.values.player.armor_regen_damage_health_ratio_threshold_multiplier = {2}
	self.values.player.movement_speed_damage_health_ratio_threshold_multiplier = {2}
	self.values.assault_rifle.move_spread_index_addend = {2}
	self.values.snp.move_spread_index_addend = {2}
	self.values.pistol.spread_index_addend = {1}
	self.values.akimbo.spread_index_addend = self.values.pistol.spread_index_addend
	self.values.shotgun.hip_fire_spread_index_addend = {1}
	self.values.weapon.hip_fire_spread_index_addend = {1}
	self.values.weapon.single_spread_index_addend = {1}
	self.values.weapon.silencer_spread_index_addend = {2}
	self.values.team.pistol.recoil_index_addend = {1}
	self.values.team.akimbo.recoil_index_addend = self.values.team.pistol.recoil_index_addend
	self.values.team.weapon.recoil_index_addend = {2}
	self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
	self.values.team.akimbo.suppression_recoil_index_addend = self.values.team.akimbo.recoil_index_addend
	self.values.team.weapon.suppression_recoil_index_addend = self.values.team.weapon.recoil_index_addend
	self.values.shotgun.recoil_index_addend = {1}
	self.values.assault_rifle.recoil_index_addend = {1}
	self.values.weapon.silencer_recoil_index_addend = {2}
	self.values.lmg.recoil_index_addend = {1}
	self.values.snp.recoil_index_addend = {1}
	self.values.akimbo.recoil_index_addend = {
		-6,
		-4,
		-2
	}
	local editable_skill_descs = {
		ammo_2x = {
			{"2"},
			{"200%"}
		},
		ammo_reservoir = {
			{"5"},
			{"10"}
		},
		assassin = {
			{"25%", "10%"},
			{"95%"}
		},
		bandoliers = {
			{"25%"},
			{"175%"}
		},
		black_marketeer = {
			{"1.5%", "5"},
			{"4.5%", "5"}
		},
		blast_radius = {
			{"70%"},
			{}
		},
		cable_guy = {
			{"75%"},
			{"4"}
		},
		carbon_blade = {
			{"20%"},
			{"50%", "20%"}
		},
		cat_burglar = {
			{"75%"},
			{"50%"}
		},
		chameleon = {
			{"25%"},
			{"15%"}
		},
		cleaner = {
			{"5%", "3"},
			{"1"}
		},
		combat_medic = {
			{"25%", "10"},
			{"30%"}
		},
		control_freak = {
			{"10%", "40%"},
			{"20%", "40%"}
		},
		discipline = {
			{"50%"},
			{}
		},
		dominator = {
			{},
			{"50%"}
		},
		drill_expert = {
			{"15%"},
			{"15%"}
		},
		ecm_2x = {
			{"2"},
			{"25%", "25%"}
		},
		ecm_booster = {
			{"25%"},
			{}
		},
		ecm_feedback = {
			{
				"50%-100%",
				"25",
				"1.5",
				"15-20"
			},
			{
				"25%",
				"100%",
				"4"
			}
		},
		enforcer = {
			{"400%"},
			{}
		},
		equilibrium = {
			{"4", "50%"},
			{"100%"}
		},
		fast_learner = {
			{"10%", "5"},
			{"20%"}
		},
		from_the_hip = {
			{"4"},
			{"4"}
		},
		ghost = {
			{"1", "20"},
			{}
		},
		good_luck_charm = {
			{"10", "1"},
			{"10"}
		},
		gun_fighter = {
			{"50%"},
			{"15"}
		},
		hardware_expert = {
			{"25%", "20%"},
			{"30%", "50%"}
		},
		hitman = {
			{"15%"},
			{"15%", "20%"}
		},
		inside_man = {
			{"50%"},
			{}
		},
		inspire = {
			{
				"50%",
				"20%",
				"10"
			},
			{"75%"}
		},
		insulation = {
			{},
			{"50%"}
		},
		iron_man = {
			{"50%"},
			{"25%"}
		},
		joker = {
			{},
			{
				"55%",
				"45%",
				"65%"
			}
		},
		juggernaut = {
			{},
			{}
		},
		kilmer = {
			{"25%"},
			{"8"}
		},
		leadership = {
			{"4"},
			{"8"}
		},
		mag_plus = {
			{"5"},
			{"10"}
		},
		magic_touch = {
			{"25%"},
			{"25%"}
		},
		martial_arts = {
			{"50%"},
			{"50%"}
		},
		master_craftsman = {
			{"30%"},
			{"15%"}
		},
		mastermind = {
			{"2"},
			{}
		},
		medic_2x = {
			{"2"},
			{"2"}
		},
		nine_lives = {
			{"1"},
			{"35%"}
		},
		oppressor = {
			{"25%"},
			{"50%"}
		},
		overkill = {
			{"75%", "5"},
			{}
		},
		pack_mule = {
			{"50%"},
			{"50%"}
		},
		pistol_messiah = {
			{"1"},
			{"2"}
		},
		portable_saw = {
			{},
			{"1"}
		},
		rifleman = {
			{"100%"},
			{"25%"}
		},
		scavenger = {
			{"10%"},
			{"20%"}
		},
		sentry_2_0 = {
			{},
			{}
		},
		sentry_gun = {
			{},
			{"150%"}
		},
		sentry_gun_2x = {
			{"2"},
			{"300%"}
		},
		sentry_targeting_package = {
			{"100%"},
			{"150%", "50%"}
		},
		shades = {
			{"25%"},
			{"50%"}
		},
		shaped_charge = {
			{"3"},
			{}
		},
		sharpshooter = {
			{"4"},
			{"8"}
		},
		shotgun_cqb = {
			{"50%"},
			{"125%"}
		},
		shotgun_impact = {
			{"4"},
			{"35%"}
		},
		show_of_force = {
			{},
			{"15%"}
		},
		silence = {
			{},
			{}
		},
		silence_expert = {
			{"8", "100%"},
			{"8", "20%"}
		},
		silent_drilling = {
			{"65%"},
			{}
		},
		smg_master = {
			{"35%"},
			{"20%"}
		},
		smg_training = {
			{},
			{}
		},
		sprinter = {
			{"25%", "25%"},
			{"25%", "25%"}
		},
		steroids = {
			{"50%"},
			{"50%"}
		},
		stockholm_syndrome = {
			{},
			{}
		},
		tactician = {
			{"15%"},
			{}
		},
		target_mark = {
			{},
			{}
		},
		technician = {
			{"2"},
			{}
		},
		tough_guy = {
			{"50%"},
			{"25%"}
		},
		transporter = {
			{"25%"},
			{"50%"}
		},
		triathlete = {
			{"100%"},
			{"50%"}
		},
		trip_mine_expert = {
			{},
			{}
		},
		trip_miner = {
			{"1"},
			{"20%"}
		},
		underdog = {
			{"15%"},
			{"15%"}
		},
		wolverine = {
			{"25%", "250%"},
			{"25%", "100%"}
		},
		hoxton = {
			{"4"},
			{}
		},
		freedom_call = {
			{"20%"},
			{"15%"}
		},
		hidden_blade = {
			{"2"},
			{"95%"}
		},
		tea_time = {
			{"50%"},
			{"20%", "10"}
		},
		awareness = {
			{"10%"},
			{}
		},
		alpha_dog = {
			{"5%"},
			{"10%"}
		},
		tea_cookies = {
			{"3"},
			{"7"}
		},
		cell_mates = {
			{"10%"},
			{"25%"}
		},
		thug_life = {
			{"1"},
			{"75%"}
		},
		thick_skin = {
			{"10"},
			{"20"}
		},
		backstab = {
			{
				"3%",
				"3",
				"35",
				"30%"
			},
			{
				"3%",
				"1",
				"35",
				"30%"
			}
		},
		drop_soap = {
			{},
			{}
		},
		second_chances = {
			{},
			{"2"}
		},
		trigger_happy = {
			{
				"10%",
				"2",
				"4"
			},
			{"8"}
		},
		perseverance = {
			{
				"0",
				"3",
				"60%"
			},
			{"6"}
		},
		jail_workout = {
			{"3.5", "10"},
			{}
		},
		akimbo = {
			{"-16"},
			{"-8", "150%"}
		},
		jail_diet = {
			{
				"1%",
				"3",
				"35",
				"10%"
			},
			{
				"1%",
				"1",
				"35",
				"10%"
			}
		},
		prison_wife = {
			{"15", "2"},
			{"30", "2"}
		},
		mastermind_tier1 = {
			{"20%"}
		},
		mastermind_tier2 = {
			{"15%"}
		},
		mastermind_tier3 = {
			{"25%"}
		},
		mastermind_tier4 = {
			{"10%"}
		},
		mastermind_tier5 = {
			{"65%"}
		},
		mastermind_tier6 = {
			{"200%", "50%"}
		},
		enforcer_tier1 = {
			{"10%"}
		},
		enforcer_tier2 = {
			{"10%"}
		},
		enforcer_tier3 = {
			{"10%"}
		},
		enforcer_tier4 = {
			{"10%"}
		},
		enforcer_tier5 = {
			{"5%"}
		},
		enforcer_tier6 = {
			{"30%"}
		},
		technician_tier1 = {
			{"1%"}
		},
		technician_tier2 = {
			{"5%"}
		},
		technician_tier3 = {
			{"3%"}
		},
		technician_tier4 = {
			{"25%"}
		},
		technician_tier5 = {
			{"5%"}
		},
		technician_tier6 = {
			{
				"5%",
				"10%",
				"10%"
			}
		},
		ghost_tier1 = {
			{"5%"}
		},
		ghost_tier2 = {
			{"20%"}
		},
		ghost_tier3 = {
			{"10%"}
		},
		ghost_tier4 = {
			{"+5", "25%"}
		},
		ghost_tier5 = {
			{"80%"}
		},
		ghost_tier6 = {
			{"10%", "15%"}
		},
		hoxton_tier1 = {
			{}
		},
		hoxton_tier2 = {
			{}
		},
		hoxton_tier3 = {
			{}
		},
		hoxton_tier4 = {
			{}
		},
		hoxton_tier5 = {
			{}
		},
		hoxton_tier6 = {
			{}
		}
	}
	self.skill_descs = {}
	for skill_id, skill_desc in pairs(editable_skill_descs) do
		self.skill_descs[skill_id] = {}
		for index, skill_version in ipairs(skill_desc) do
			local version = index == 1 and "multibasic" or "multipro"
			self.skill_descs[skill_id][index] = #skill_version
			for i, desc in ipairs(skill_version) do
				if i ~= 1 or not "" then
				end
				self.skill_descs[skill_id][version .. tostring(i)] = desc
			end
		end
	end
	local editable_specialization_descs = {
		{
			{"10%"},
			{"25%"},
			{"50%", "25%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%"},
			{"135%"},
			{"10%", "5%"},
			{"5%", "20%"},
			{
				"2%",
				"4%",
				"10",
				"8%",
				"10%"
			}
		},
		{
			{"10%"},
			{"25%"},
			{"15%", "10%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"20%"},
			{"135%"},
			{},
			{"5%", "20%"},
			{
				"40%",
				"4%",
				"5",
				"10%"
			}
		},
		{
			{"10%"},
			{"25%"},
			{"10%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%"},
			{"135%"},
			{"10%"},
			{"5%", "20%"},
			{
				"5%",
				"10%",
				"10%"
			}
		},
		{
			{"5%"},
			{"25%"},
			{"15%", "45%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%", "135%"},
			{"135%"},
			{"10%"},
			{"5%", "20%"},
			{
				"25%",
				"80%",
				"10%"
			}
		},
		{
			{"5%"},
			{"25%"},
			{
				"10%",
				"5%",
				"-24"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%", "5%"},
			{"135%"},
			{"10%", "5%"},
			{"5%", "20%"},
			{
				"10%",
				"5%",
				"-16",
				"125%",
				"10%"
			}
		},
		{
			{"5%"},
			{"25%"},
			{"10%", "20%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%", "20%"},
			{"135%"},
			{"15%", "25%"},
			{"5%", "20%"},
			{"10%", "10%"}
		},
		{
			{"10%"},
			{"25%"},
			{"10%", "20%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"5%",
				"5%",
				"20%"
			},
			{"135%"},
			{
				"5%",
				"5%",
				"10%"
			},
			{"5%", "20%"},
			{"20%", "10%"}
		},
		{
			{"8%"},
			{"25%"},
			{"8%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"8%",
				"10%",
				"7",
				"4"
			},
			{"135%"},
			{
				"8%",
				"10%",
				"7",
				"4"
			},
			{"5%", "20%"},
			{
				"20%",
				"10",
				"10%"
			}
		},
		{
			{"8%"},
			{"25%"},
			{"30", "2"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"10%", "2"},
			{"135%"},
			{"30", "2"},
			{"5%", "20%"},
			{
				"75%",
				"2",
				"10%"
			}
		},
		{
			{
				"8",
				"12",
				"4"
			},
			{"25%"},
			{"50%", "5"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"100%"},
			{"135%"},
			{"4"},
			{"5%", "20%"},
			{"4", "10%"}
		},
		{
			{
				"1",
				"0.5",
				"5",
				"1.5"
			},
			{"25%"},
			{
				"2",
				"0.5",
				"5",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"3",
				"0.5",
				"5",
				"10%"
			},
			{"135%"},
			{
				"4",
				"0.5",
				"5",
				"20%"
			},
			{"5%", "20%"},
			{
				"4",
				"0.5",
				"6",
				"20%",
				"10%"
			}
		},
		{
			{"25%", "20%"},
			{"25%"},
			{"25%", "20%"},
			{
				"+1",
				"15%",
				"45%"
			},
			{"25%", "20%"},
			{"135%"},
			{"25%", "20%"},
			{"5%", "20%"},
			{
				"50%",
				"25%",
				"10%"
			}
		}
	}
	self.specialization_descs = {}
	for tree, data in pairs(editable_specialization_descs) do
		self.specialization_descs[tree] = {}
		for tier, tier_data in ipairs(data) do
			self.specialization_descs[tree][tier] = {}
			for i, desc in ipairs(tier_data) do
				if i ~= 1 or not "" then
				end
				self.specialization_descs[tree][tier]["multiperk" .. tostring(i)] = desc
			end
		end
	end
end
function UpgradesTweakData:init()
	self.level_tree = {}
	self.level_tree[1] = {
		name_id = "body_armor",
		upgrades = {
			"body_armor2",
			"ak74"
		}
	}
	self.level_tree[2] = {
		name_id = "weapons",
		upgrades = {"colt_1911", "mac10"}
	}
	self.level_tree[3] = {
		name_id = "weapons",
		upgrades = {"spatula", "fork"}
	}
	self.level_tree[4] = {
		name_id = "weapons",
		upgrades = {"new_m4", "shovel"}
	}
	self.level_tree[6] = {
		name_id = "weapons",
		upgrades = {
			"new_raging_bull",
			"b92fs"
		}
	}
	self.level_tree[7] = {
		name_id = "body_armor",
		upgrades = {
			"body_armor1",
			"moneybundle"
		}
	}
	self.level_tree[8] = {
		name_id = "weapons",
		upgrades = {
			"r870",
			"aug",
			"fight"
		}
	}
	self.level_tree[10] = {
		name_id = "lvl_10",
		upgrades = {
			"rep_upgrade1"
		}
	}
	self.level_tree[12] = {
		name_id = "body_armor3",
		upgrades = {
			"body_armor3",
			"cobray"
		}
	}
	self.level_tree[13] = {
		name_id = "weapons",
		upgrades = {
			"new_mp5",
			"serbu",
			"microphone"
		}
	}
	self.level_tree[14] = {
		name_id = "weapons",
		upgrades = {"bayonet", "m1928"}
	}
	self.level_tree[15] = {
		name_id = "weapons",
		upgrades = {
			"msr",
			"benelli",
			"plainsrider",
			"sub2000"
		}
	}
	self.level_tree[16] = {
		name_id = "weapons",
		upgrades = {
			"akm",
			"g36",
			"hunter"
		}
	}
	self.level_tree[17] = {
		name_id = "weapons",
		upgrades = {
			"akm_gold",
			"baton",
			"slot_lever",
			"frankish"
		}
	}
	self.level_tree[18] = {
		name_id = "weapons",
		upgrades = {
			"baseballbat",
			"scorpion",
			"oldbaton",
			"hockey"
		}
	}
	self.level_tree[19] = {
		name_id = "weapons",
		upgrades = {
			"olympic",
			"mp9",
			"baka"
		}
	}
	self.level_tree[20] = {
		name_id = "lvl_20",
		upgrades = {
			"rep_upgrade2"
		}
	}
	self.level_tree[21] = {
		name_id = "body_armor4",
		upgrades = {
			"body_armor4",
			"kampfmesser",
			"buck"
		}
	}
	self.level_tree[22] = {
		name_id = "community_item",
		upgrades = {
			"g22c",
			"ksg",
			"branding_iron",
			"detector",
			"croupier_rake"
		}
	}
	self.level_tree[23] = {
		name_id = "weapons",
		upgrades = {"bullseye", "c96"}
	}
	self.level_tree[24] = {
		name_id = "weapons",
		upgrades = {
			"model24",
			"l85a2",
			"scalper",
			"switchblade"
		}
	}
	self.level_tree[25] = {
		name_id = "weapons",
		upgrades = {
			"boxing_gloves",
			"meat_cleaver",
			"wpn_prj_four"
		}
	}
	self.level_tree[26] = {
		name_id = "weapons",
		upgrades = {
			"new_m14",
			"saiga",
			"sandsteel"
		}
	}
	self.level_tree[27] = {
		name_id = "weapons",
		upgrades = {
			"famas",
			"g26",
			"twins"
		}
	}
	self.level_tree[28] = {
		name_id = "weapons",
		upgrades = {
			"hs2000",
			"vhs",
			"bowie",
			"micstand"
		}
	}
	self.level_tree[29] = {
		name_id = "weapons",
		upgrades = {
			"akmsu",
			"glock_18c",
			"asval",
			"long"
		}
	}
	self.level_tree[30] = {
		name_id = "lvl_30",
		upgrades = {
			"rep_upgrade3"
		}
	}
	self.level_tree[31] = {
		name_id = "body_armor5",
		upgrades = {
			"body_armor5",
			"chef",
			"peacemaker",
			"wpn_prj_ace"
		}
	}
	self.level_tree[32] = {
		name_id = "weapons",
		upgrades = {
			"x46",
			"tec9",
			"tiger"
		}
	}
	self.level_tree[33] = {
		name_id = "weapons",
		upgrades = {
			"ak5",
			"striker",
			"wa2000",
			"beardy"
		}
	}
	self.level_tree[34] = {
		name_id = "weapons",
		upgrades = {
			"galil",
			"cleaver",
			"mateba",
			"taser"
		}
	}
	self.level_tree[35] = {
		name_id = "weapons",
		upgrades = {
			"r93",
			"judge",
			"mining_pick"
		}
	}
	self.level_tree[36] = {
		name_id = "weapons",
		upgrades = {
			"p90",
			"deagle",
			"winchester1874"
		}
	}
	self.level_tree[37] = {
		name_id = "weapons",
		upgrades = {"shillelagh", "hammer"}
	}
	self.level_tree[38] = {
		name_id = "weapons",
		upgrades = {
			"m134",
			"rpg7",
			"arblast"
		}
	}
	self.level_tree[39] = {
		name_id = "weapons",
		upgrades = {
			"m16",
			"huntsman",
			"polymer"
		}
	}
	self.level_tree[40] = {
		name_id = "lvl_40",
		upgrades = {
			"rep_upgrade4"
		}
	}
	self.level_tree[41] = {
		name_id = "weapons",
		upgrades = {
			"gerber",
			"fairbair",
			"wpn_prj_jav"
		}
	}
	self.level_tree[42] = {
		name_id = "weapons",
		upgrades = {"fal", "tomahawk"}
	}
	self.level_tree[43] = {
		name_id = "weapons",
		upgrades = {
			"b682",
			"m32",
			"morning"
		}
	}
	self.level_tree[44] = {
		name_id = "weapons",
		upgrades = {
			"flamethrower_mk2",
			"poker"
		}
	}
	self.level_tree[45] = {
		name_id = "weapons",
		upgrades = {"m249", "barbedwire"}
	}
	self.level_tree[46] = {
		name_id = "weapons",
		upgrades = {"gre_m79", "great"}
	}
	self.level_tree[47] = {
		name_id = "weapons",
		upgrades = {"freedom", "whiskey"}
	}
	self.level_tree[48] = {
		name_id = "weapons",
		upgrades = {"dingdong", "tenderizer"}
	}
	self.level_tree[50] = {
		name_id = "lvl_50",
		upgrades = {
			"rep_upgrade5"
		}
	}
	self.level_tree[51] = {
		name_id = "weapons",
		upgrades = {"machete", "sterling"}
	}
	self.level_tree[52] = {
		name_id = "weapons",
		upgrades = {"g3", "aa12"}
	}
	self.level_tree[54] = {
		name_id = "weapons",
		upgrades = {
			"becker",
			"mosin",
			"cqc"
		}
	}
	self.level_tree[55] = {
		name_id = "weapons",
		upgrades = {"uzi"}
	}
	self.level_tree[60] = {
		name_id = "lvl_60",
		upgrades = {
			"rep_upgrade6"
		}
	}
	self.level_tree[61] = {
		name_id = "weapons",
		upgrades = {"rambo"}
	}
	self.level_tree[65] = {
		name_id = "weapons",
		upgrades = {"m95"}
	}
	self.level_tree[70] = {
		name_id = "lvl_70",
		upgrades = {
			"rep_upgrade7"
		}
	}
	self.level_tree[71] = {
		name_id = "weapons",
		upgrades = {"fireaxe", "mg42"}
	}
	self.level_tree[75] = {
		name_id = "weapons",
		upgrades = {"hk21"}
	}
	self.level_tree[80] = {
		name_id = "lvl_80",
		upgrades = {
			"rep_upgrade8"
		}
	}
	self.level_tree[90] = {
		name_id = "lvl_90",
		upgrades = {
			"rep_upgrade9"
		}
	}
	self.level_tree[100] = {
		name_id = "lvl_100",
		upgrades = {
			"rep_upgrade10"
		}
	}
	self:_init_pd2_values()
	self:_init_values()
	self.steps = {}
	self.values.player = self.values.player or {}
	self.values.player.thick_skin = {
		2,
		4,
		6,
		8,
		10
	}
	self.values.player.primary_weapon_when_carrying = {true}
	self.values.player.health_multiplier = {1.1}
	self.values.player.dye_pack_chance_multiplier = {0.5}
	self.values.player.dye_pack_cash_loss_multiplier = {0.4}
	self.values.player.toolset = {
		0.95,
		0.9,
		0.85,
		0.8
	}
	self.values.player.uncover_progress_mul = {0.5}
	self.values.player.uncover_progress_decay_mul = {1.5}
	self.values.player.suppressed_multiplier = {0.5}
	self.values.player.intimidate_specials = {true}
	self.values.player.intimidation_multiplier = {1.25}
	self.steps.player = {}
	self.steps.player.thick_skin = {
		nil,
		8,
		18,
		27,
		39
	}
	self.steps.player.extra_ammo_multiplier = {
		nil,
		7,
		16,
		24,
		38
	}
	self.steps.player.toolset = {
		nil,
		7,
		16,
		38
	}
	self.values.trip_mine = self.values.trip_mine or {}
	self.values.trip_mine.quantity = {
		1,
		2,
		3,
		4,
		5,
		8
	}
	self.values.trip_mine.quantity_2 = {2}
	self.values.trip_mine.quantity_increase = {2}
	self.values.trip_mine.explode_timer_delay = {2}
	self.steps.trip_mine = {}
	self.steps.trip_mine.quantity = {
		14,
		22,
		29,
		36,
		42,
		47
	}
	self.steps.trip_mine.damage_multiplier = {6, 32}
	self.values.ammo_bag = self.values.ammo_bag or {}
	self.steps.ammo_bag = {}
	self.steps.ammo_bag.ammo_increase = {
		10,
		19,
		30
	}
	self.values.ecm_jammer = self.values.ecm_jammer or {}
	self.values.first_aid_kit = self.values.first_aid_kit or {}
	self.values.sentry_gun = self.values.sentry_gun or {}
	self.steps.sentry_gun = {}
	self.values.doctor_bag = self.values.doctor_bag or {}
	self.steps.doctor_bag = {}
	self.steps.doctor_bag.amount_increase = {
		11,
		19,
		33
	}
	self.values.extra_cable_tie = {}
	self.values.extra_cable_tie.quantity = {
		1,
		2,
		3,
		4
	}
	self.steps.extra_cable_tie = {}
	self.steps.extra_cable_tie.quantity = {
		nil,
		12,
		23,
		33
	}
	self.values.striker = {}
	self.values.striker.reload_speed_multiplier = {1.15}
	self.definitions = {}
	self:_player_definitions()
	self:_trip_mine_definitions()
	self:_ecm_jammer_definitions()
	self:_ammo_bag_definitions()
	self:_doctor_bag_definitions()
	self:_cable_tie_definitions()
	self:_sentry_gun_definitions()
	self:_armor_kit_definitions()
	self:_first_aid_kit_definitions()
	self:_bodybags_bag_definitions()
	self:_rep_definitions()
	self:_jowi_definitions()
	self:_x_1911_definitions()
	self:_x_b92fs_definitions()
	self:_x_deagle_definitions()
	self:_g26_definitions()
	self:_akimbo_definitions()
	self:_kabartanto_definitions()
	self:_toothbrush_definitions()
	self:_chef_definitions()
	self:_olympic_definitions()
	self:_amcar_definitions()
	self:_m16_definitions()
	self:_new_m4_definitions()
	self:_glock_18c_definitions()
	self:_saiga_definitions()
	self:_akmsu_definitions()
	self:_ak74_definitions()
	self:_akm_definitions()
	self:_akm_gold_definitions()
	self:_ak5_definitions()
	self:_aug_definitions()
	self:_g36_definitions()
	self:_p90_definitions()
	self:_new_m14_definitions()
	self:_mp9_definitions()
	self:_deagle_definitions()
	self:_new_mp5_definitions()
	self:_colt_1911_definitions()
	self:_mac10_definitions()
	self:_glock_17_definitions()
	self:_b92fs_definitions()
	self:_huntsman_definitions()
	self:_r870_definitions()
	self:_serbu_definitions()
	self:_new_raging_bull_definitions()
	self:_saw_definitions()
	self:_usp_definitions()
	self:_g22c_definitions()
	self:_judge_definitions()
	self:_m45_definitions()
	self:_s552_definitions()
	self:_ppk_definitions()
	self:_mp7_definitions()
	self:_scar_definitions()
	self:_p226_definitions()
	self:_hk21_definitions()
	self:_m249_definitions()
	self:_rpk_definitions()
	self:_m95_definitions()
	self:_msr_definitions()
	self:_r93_definitions()
	self:_fal_definitions()
	self:_benelli_definitions()
	self:_striker_definitions()
	self:_ksg_definitions()
	self:_scorpion_definitions()
	self:_tec9_definitions()
	self:_uzi_definitions()
	self:_gre_m79_definitions()
	self:_g3_definitions()
	self:_galil_definitions()
	self:_famas_definitions()
	self:_spas12_definitions()
	self:_mg42_definitions()
	self:_c96_definitions()
	self:_sterling_definitions()
	self:_mosin_definitions()
	self:_m1928_definitions()
	self:_l85a2_definitions()
	self:_vhs_definitions()
	self:_hs2000_definitions()
	self:_m134_weapon_definitions()
	self:_rpg7_weapon_definitions()
	self:_cobray_definitions()
	self:_b682_weapon_definitions()
	self:_x_g22c_definitions()
	self:_x_g17_definitions()
	self:_x_usp_definitions()
	self:_weapon_definitions()
	self:_pistol_definitions()
	self:_assault_rifle_definitions()
	self:_smg_definitions()
	self:_shotgun_definitions()
	self:_lmg_definitions()
	self:_snp_definitions()
	self:_flamethrower_mk2_definitions()
	self:_m32_definitions()
	self:_aa12_definitions()
	self:_bbq_weapon_definitions()
	self:_peacemaker_definitions()
	self:_winchester1874_definitions()
	self:_plainsrider_definitions()
	self:_mateba_definitions()
	self:_asval_definitions()
	self:_sub2000_definitions()
	self:_wa2000_definitions()
	self:_polymer_definitions()
	self:_hunter_definitions()
	self:_baka_definitions()
	self:_arblast_weapon_definitions()
	self:_frankish_weapon_definitions()
	self:_long_weapon_definitions()
	self:_melee_weapon_definitions()
	self:_grenades_definitions()
	self:_carry_definitions()
	self:_team_definitions()
	self:_temporary_definitions()
	self:_shape_charge_definitions()
	self.definitions.lucky_charm = {
		category = "what_is_this",
		name_id = "menu_lucky_charm"
	}
	self.levels = {}
	for name, upgrade in pairs(self.definitions) do
		local unlock_lvl = upgrade.unlock_lvl or 1
		self.levels[unlock_lvl] = self.levels[unlock_lvl] or {}
		if upgrade.prio and upgrade.prio == "high" then
			table.insert(self.levels[unlock_lvl], 1, name)
		else
			table.insert(self.levels[unlock_lvl], name)
		end
	end
	self.progress = {
		{},
		{},
		{},
		{}
	}
	for name, upgrade in pairs(self.definitions) do
		if upgrade.tree then
			if upgrade.step then
				if self.progress[upgrade.tree][upgrade.step] then
					Application:error("upgrade collision", upgrade.tree, upgrade.step, self.progress[upgrade.tree][upgrade.step], name)
				end
				self.progress[upgrade.tree][upgrade.step] = name
			else
				print(name, upgrade.tree, "is in no step")
			end
		end
	end
	self.progress[1][49] = "mr_nice_guy"
	self.progress[2][49] = "mr_nice_guy"
	self.progress[3][49] = "mr_nice_guy"
	self.progress[4][49] = "mr_nice_guy"
end
function UpgradesTweakData:_init_value_tables()
	self.values = {}
	self.values.player = {}
	self.values.carry = {}
	self.values.trip_mine = {}
	self.values.ammo_bag = {}
	self.values.ecm_jammer = {}
	self.values.sentry_gun = {}
	self.values.doctor_bag = {}
	self.values.cable_tie = {}
	self.values.bodybags_bag = {}
	self.values.first_aid_kit = {}
	self.values.weapon = {}
	self.values.pistol = {}
	self.values.assault_rifle = {}
	self.values.smg = {}
	self.values.shotgun = {}
	self.values.saw = {}
	self.values.lmg = {}
	self.values.snp = {}
	self.values.akimbo = {}
	self.values.minigun = {}
	self.values.melee = {}
	self.values.temporary = {}
	self.values.team = {}
	self.values.team.player = {}
	self.values.team.weapon = {}
	self.values.team.pistol = {}
	self.values.team.akimbo = {}
	self.values.team.xp = {}
	self.values.team.armor = {}
	self.values.team.stamina = {}
	self.values.team.health = {}
	self.values.team.cash = {}
	self.values.team.damage_dampener = {}
end
function UpgradesTweakData:_init_values()
	self.values.weapon = self.values.weapon or {}
	self.values.weapon.reload_speed_multiplier = {1}
	self.values.weapon.damage_multiplier = {1}
	self.values.weapon.swap_speed_multiplier = {1.25}
	self.values.weapon.passive_reload_speed_multiplier = {1.1}
	self.values.weapon.auto_spread_multiplier = {1}
	self.values.weapon.spread_multiplier = {0.9}
	self.values.weapon.fire_rate_multiplier = {2}
	self.values.pistol = self.values.pistol or {}
	self.values.pistol.exit_run_speed_multiplier = {1.25}
	self.values.assault_rifle = self.values.assault_rifle or {}
	self.values.smg = self.values.smg or {}
	self.values.shotgun = self.values.shotgun or {}
	self.values.carry = self.values.carry or {}
	self.values.carry.catch_interaction_speed = {0.6, 0.1}
	self.values.cable_tie = self.values.cable_tie or {}
	self.values.cable_tie.quantity_unlimited = {true}
	self.values.temporary = self.values.temporary or {}
	self.values.temporary.combat_medic_enter_steelsight_speed_multiplier = {
		{1.2, 15}
	}
	self.values.temporary.wolverine_health_regen = {
		{0.002, 1}
	}
	self.values.temporary.pistol_revive_from_bleed_out = {
		{true, 3}
	}
	self.values.temporary.revive_health_boost = {
		{true, 10}
	}
	self.values.team = self.values.team or {}
	self.values.team.player = self.values.team.player or {}
	self.values.team.pistol = self.values.team.pistol or {}
	self.values.team.weapon = self.values.team.weapon or {}
	self.values.team.xp = self.values.team.xp or {}
	self.values.team.armor = self.values.team.armor or {}
	self.values.team.stamina = self.values.team.stamina or {}
	self.values.saw = self.values.saw or {}
	self.values.saw.recoil_multiplier = {0.75}
	self.values.saw.fire_rate_multiplier = {1.25, 1.5}
end
function UpgradesTweakData:_player_definitions()
	self.definitions.body_armor1 = {
		category = "armor",
		armor_id = "level_2",
		name_id = "bm_armor_level_2"
	}
	self.definitions.body_armor2 = {
		category = "armor",
		armor_id = "level_3",
		name_id = "bm_armor_level_3"
	}
	self.definitions.body_armor3 = {
		category = "armor",
		armor_id = "level_4",
		name_id = "bm_armor_level_4"
	}
	self.definitions.body_armor4 = {
		category = "armor",
		armor_id = "level_5",
		name_id = "bm_armor_level_5"
	}
	self.definitions.body_armor5 = {
		category = "armor",
		armor_id = "level_6",
		name_id = "bm_armor_level_6"
	}
	self.definitions.body_armor6 = {
		category = "armor",
		armor_id = "level_7",
		name_id = "bm_armor_level_7"
	}
	self.definitions.thick_skin = {
		tree = 2,
		step = 2,
		category = "equipment",
		equipment_id = "thick_skin",
		title_id = "debug_upgrade_player_upgrade",
		subtitle_id = "debug_upgrade_thick_skin1",
		name_id = "debug_upgrade_thick_skin1",
		icon = "equipment_armor",
		image = "upgrades_thugskin",
		image_slice = "upgrades_thugskin_slice",
		description_text_id = "thick_skin",
		unlock_lvl = 0,
		aquire = {
			upgrade = "thick_skin1"
		},
		slot = 2
	}
	for i, _ in ipairs(self.values.player.thick_skin) do
		local depends_on = 0 < i - 1 and "thick_skin" .. i - 1
		local unlock_lvl = 3
		local prio = i == 1 and "high"
		self.definitions["thick_skin" .. i] = {
			tree = 2,
			step = self.steps.player.thick_skin[i],
			category = "feature",
			title_id = "debug_upgrade_player_upgrade",
			subtitle_id = "debug_upgrade_thick_skin" .. i,
			name_id = "debug_upgrade_thick_skin" .. i,
			icon = "equipment_thick_skin",
			image = "upgrades_thugskin",
			image_slice = "upgrades_thugskin_slice",
			description_text_id = "thick_skin",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "thick_skin",
				value = i
			}
		}
	end
	self.definitions.extra_start_out_ammo = {
		tree = 3,
		step = 2,
		category = "equipment",
		equipment_id = "extra_start_out_ammo",
		name_id = "debug_upgrade_extra_start_out_ammo1",
		title_id = "debug_upgrade_player_upgrade",
		subtitle_id = "debug_upgrade_extra_start_out_ammo1",
		icon = "equipment_extra_start_out_ammo",
		image = "upgrades_extrastartammo",
		image_slice = "upgrades_extrastartammo_slice",
		description_text_id = "extra_ammo_multiplier",
		unlock_lvl = 13,
		prio = "high",
		aquire = {
			upgrade = "extra_ammo_multiplier1"
		},
		slot = 2
	}
	for i, _ in ipairs(self.values.player.extra_ammo_multiplier) do
		local depends_on = 0 < i - 1 and "extra_ammo_multiplier" .. i - 1
		local unlock_lvl = 14
		local prio = i == 1 and "high"
		self.definitions["extra_ammo_multiplier" .. i] = {
			tree = 3,
			step = self.steps.player.extra_ammo_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_extra_start_out_ammo" .. i,
			title_id = "debug_upgrade_player_upgrade",
			subtitle_id = "debug_upgrade_extra_start_out_ammo" .. i,
			icon = "equipment_extra_start_out_ammo",
			image = "upgrades_extrastartammo",
			image_slice = "upgrades_extrastartammo_slice",
			description_text_id = "extra_ammo_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "extra_ammo_multiplier",
				value = i
			}
		}
	end
	self.definitions.player_add_armor_stat_skill_ammo_mul = {
		category = "feature",
		name_id = "menu_player_add_armor_stat_skill_ammo_mul",
		upgrade = {
			category = "player",
			upgrade = "add_armor_stat_skill_ammo_mul",
			value = 1
		}
	}
	self.definitions.player_overkill_health_to_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_overkill_health_to_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "overkill_health_to_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_crit_chance_1 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_crit_chance",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_crit_chance_2 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_crit_chance",
			value = 2
		}
	}
	self.definitions.player_detection_risk_add_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_detection_risk_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_detection_risk_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_kill_snatch_pager_chance = {
		category = "feature",
		name_id = "menu_player_melee_kill_snatch_pager_chance",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_snatch_pager_chance",
			value = 1
		}
	}
	self.definitions.player_critical_hit_chance_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_critical_hit_chance",
		upgrade = {
			category = "player",
			upgrade = "critical_hit_chance",
			value = 1
		}
	}
	self.definitions.player_critical_hit_chance_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_critical_hit_chance",
		upgrade = {
			category = "player",
			upgrade = "critical_hit_chance",
			value = 1
		}
	}
	self.definitions.player_mark_enemy_time_multiplier = {
		category = "feature",
		name_id = "menu_player_mark_enemy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "mark_enemy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_minion_master_health_multiplier = {
		category = "feature",
		name_id = "menu_player_minion_master_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "minion_master_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_minion_master_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_minion_master_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "minion_master_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_flashbang_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_flashbang_multiplier",
		upgrade = {
			category = "player",
			upgrade = "flashbang_multiplier",
			value = 1
		}
	}
	self.definitions.player_flashbang_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_flashbang_multiplier",
		upgrade = {
			category = "player",
			upgrade = "flashbang_multiplier",
			value = 2
		}
	}
	self.definitions.player_revive_damage_reduction_level_1 = {
		category = "feature",
		name_id = "menu_player_revive_damage_reduction_level",
		upgrade = {
			category = "player",
			upgrade = "revive_damage_reduction_level",
			value = 1
		}
	}
	self.definitions.player_revive_damage_reduction_level_2 = {
		category = "feature",
		name_id = "menu_player_revive_damage_reduction_level",
		upgrade = {
			category = "player",
			upgrade = "revive_damage_reduction_level",
			value = 2
		}
	}
	self.definitions.player_passive_health_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 4
		}
	}
	self.definitions.player_tier_armor_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 4
		}
	}
	self.definitions.player_tier_armor_multiplier_5 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 5
		}
	}
	self.definitions.player_tier_armor_multiplier_6 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 6
		}
	}
	self.definitions.player_pick_up_ammo_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_up_ammo_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_up_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.player_pick_up_ammo_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_pick_up_ammo_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "pick_up_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.player_panic_suppression = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "panic_suppression",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_multiplier_passive = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier_passive",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier_passive",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend_1 = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend_2 = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 2
		}
	}
	self.definitions.player_passive_dodge_chance_3 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 3
		}
	}
	self.definitions.player_passive_dodge_chance_4 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 4
		}
	}
	self.definitions.team_passive_armor_multiplier = {
		category = "team",
		name_id = "menu_team_passive_armor_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.player_camouflage_multiplier = {
		category = "feature",
		name_id = "menu_player_camouflage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "camouflage_multiplier",
			value = 1
		}
	}
	self.definitions.player_uncover_multiplier = {
		category = "feature",
		name_id = "menu_player_uncover_multiplier",
		upgrade = {
			category = "player",
			upgrade = "uncover_multiplier",
			value = 1
		}
	}
	self.definitions.player_primary_weapon_when_downed = {
		category = "feature",
		name_id = "menu_player_primary_weapon_when_downed",
		upgrade = {
			category = "player",
			upgrade = "primary_weapon_when_downed",
			value = 1
		}
	}
	self.definitions.player_primary_weapon_when_carrying = {
		category = "feature",
		name_id = "menu_player_primary_weapon_when_carrying",
		upgrade = {
			category = "player",
			upgrade = "primary_weapon_when_carrying",
			value = 1
		}
	}
	self.definitions.player_pistol_revive_from_bleed_out_1 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "pistol_revive_from_bleed_out",
			value = 1
		}
	}
	self.definitions.player_pistol_revive_from_bleed_out_2 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "pistol_revive_from_bleed_out",
			value = 2
		}
	}
	self.definitions.player_pistol_revive_from_bleed_out_timer = {
		category = "temporary",
		name_id = "menu_player_pistol_revive_from_bleed_out_timer",
		upgrade = {
			category = "temporary",
			upgrade = "pistol_revive_from_bleed_out",
			value = 1
		}
	}
	self.definitions.player_can_strafe_run = {
		category = "feature",
		name_id = "menu_player_can_strafe_run",
		upgrade = {
			category = "player",
			upgrade = "can_strafe_run",
			value = 1
		}
	}
	self.definitions.player_can_free_run = {
		category = "feature",
		name_id = "menu_player_can_free_run",
		upgrade = {
			category = "player",
			upgrade = "can_free_run",
			value = 1
		}
	}
	self.definitions.player_damage_shake_multiplier = {
		category = "feature",
		name_id = "menu_player_damage_shake_multiplier",
		upgrade = {
			category = "player",
			upgrade = "damage_shake_multiplier",
			value = 1
		}
	}
	self.definitions.player_health_multiplier = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_health_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 3
		}
	}
	self.definitions.player_bleed_out_health_multiplier = {
		category = "feature",
		name_id = "menu_player_bleed_out_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "bleed_out_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_revive_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_revive_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "revive_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_shield_knock = {
		category = "feature",
		name_id = "menu_player_shield_knock",
		upgrade = {
			category = "player",
			upgrade = "shield_knock",
			value = 1
		}
	}
	self.definitions.player_steelsight_when_downed = {
		category = "feature",
		name_id = "menu_player_steelsight_when_downed",
		upgrade = {
			category = "player",
			upgrade = "steelsight_when_downed",
			value = 1
		}
	}
	self.definitions.player_armor_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 2
		}
	}
	self.definitions.player_tier_armor_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 3
		}
	}
	self.definitions.player_passive_convert_enemies_health_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_convert_enemies_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_convert_enemies_health_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_convert_enemies_health_multiplier",
			value = 2
		}
	}
	self.definitions.player_counter_strike_melee = {
		category = "feature",
		name_id = "menu_player_counter_strike_melee",
		upgrade = {
			category = "player",
			upgrade = "counter_strike_melee",
			value = 1
		}
	}
	self.definitions.player_counter_strike_spooc = {
		category = "feature",
		name_id = "menu_player_counter_strike_spooc",
		upgrade = {
			category = "player",
			upgrade = "counter_strike_spooc",
			value = 1
		}
	}
	self.definitions.player_extra_corpse_dispose_amount = {
		category = "feature",
		name_id = "menu_player_extra_corpse_dispose_amount",
		upgrade = {
			category = "player",
			upgrade = "extra_corpse_dispose_amount",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_multiplier_tier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier_tier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier_tier",
			value = 1
		}
	}
	self.definitions.player_standstill_omniscience = {
		category = "feature",
		name_id = "menu_player_standstill_omniscience",
		upgrade = {
			category = "player",
			upgrade = "standstill_omniscience",
			value = 1
		}
	}
	self.definitions.player_mask_off_pickup = {
		category = "feature",
		name_id = "menu_player_mask_off_pickup",
		upgrade = {
			category = "player",
			upgrade = "mask_off_pickup",
			value = 1
		}
	}
	self.definitions.player_cleaner_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_cleaner_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "cleaner_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_2_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_3_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_4_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_3_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_4_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_3_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_4_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_2_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_3_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_4_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_damage_shake_addend = {
		category = "feature",
		name_id = "menu_player_damage_shake_addend",
		upgrade = {
			category = "player",
			upgrade = "damage_shake_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_tier_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_tier_dodge_chance_3 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 3
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_1 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 1
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_2 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 2
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_3 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 3
		}
	}
	self.definitions.player_pick_lock_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_lock_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_corpse_dispose_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_alarm_pager_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_alarm_pager_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "alarm_pager_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_life_leech = {
		category = "temporary",
		name_id = "menu_player_melee_life_leech",
		upgrade = {
			category = "temporary",
			upgrade = "melee_life_leech",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_outnumbered_strong = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_outnumbered_strong",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_outnumbered_strong",
			value = 1
		}
	}
	self.definitions.player_melee_kill_life_leech = {
		category = "feature",
		name_id = "menu_player_melee_kill_life_leech",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_life_leech",
			value = 1
		}
	}
	self.definitions.player_killshot_regen_armor_bonus = {
		category = "feature",
		name_id = "menu_player_killshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "killshot_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_killshot_close_regen_armor_bonus = {
		category = "feature",
		name_id = "menu_player_killshot_close_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "killshot_close_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_killshot_close_panic_chance = {
		category = "feature",
		name_id = "menu_player_killshot_close_panic_chance",
		upgrade = {
			category = "player",
			upgrade = "killshot_close_panic_chance",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_close_contact_1 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_close_contact_2 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 2
		}
	}
	self.definitions.player_damage_dampener_close_contact_3 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 3
		}
	}
	self.definitions.melee_stacking_hit_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_damage_multiplier",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_damage_multiplier",
			value = 1
		}
	}
	self.definitions.melee_stacking_hit_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_damage_multiplier",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_damage_multiplier",
			value = 2
		}
	}
	self.definitions.melee_stacking_hit_expire_t = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_expire_t",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_expire_t",
			value = 1
		}
	}
	for i, value in ipairs(self.values.player.perk_armor_regen_timer_multiplier) do
		self.definitions["player_perk_armor_regen_timer_multiplier_" .. tostring(i)] = {
			category = "feature",
			name_id = "menu_player_perk_armor_regen_timer_multiplier",
			upgrade = {
				category = "player",
				upgrade = "perk_armor_regen_timer_multiplier",
				value = i
			}
		}
	end
	for i, value in ipairs(self.values.player.perk_armor_loss_multiplier) do
		self.definitions["player_perk_armor_loss_multiplier_" .. tostring(i)] = {
			category = "feature",
			name_id = "menu_player_perk_armor_loss_multiplier",
			upgrade = {
				category = "player",
				upgrade = "perk_armor_loss_multiplier",
				value = i
			}
		}
	end
	self.definitions.player_passive_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_passive_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_passive_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_multiplier",
			value = 2
		}
	}
	self.definitions.player_armor_regen_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_stand_still_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_stand_still_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_stand_still_multiplier",
			value = 1
		}
	}
	self.definitions.player_wolverine_health_regen = {
		category = "temporary",
		name_id = "menu_player_wolverine_health_regen",
		upgrade = {
			category = "temporary",
			upgrade = "wolverine_health_regen",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 1
		}
	}
	self.definitions.player_passive_health_regen = {
		category = "temporary",
		name_id = "menu_player_passive_health_regen",
		upgrade = {
			category = "player",
			upgrade = "passive_health_regen",
			value = 1
		}
	}
	self.definitions.player_close_to_hostage_boost = {
		category = "temporary",
		name_id = "menu_player_close_to_hostage_boost",
		upgrade = {
			category = "player",
			upgrade = "close_to_hostage_boost",
			value = 1
		}
	}
	self.definitions.player_stamina_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_multiplier",
			value = 1
		}
	}
	self.definitions.player_stamina_regen_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_regen_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_regen_multiplier",
			value = 1
		}
	}
	self.definitions.player_stamina_regen_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_regen_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_regen_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_run_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_run_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "run_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_passive_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_run_dodge_chance = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "run_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_walk_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_walk_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "walk_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_crouch_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_crouch_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "crouch_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_fall_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_fall_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "fall_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_fall_health_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_fall_health_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "fall_health_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_interacting_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_interacting_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "interacting_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_melee_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_respawn_time_multiplier = {
		category = "feature",
		name_id = "menu_player_respawn_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "respawn_time_multiplier",
			value = 1
		}
	}
	self.definitions.passive_player_xp_multiplier = {
		category = "feature",
		name_id = "menu_player_xp_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_xp_multiplier",
			value = 1
		}
	}
	self.definitions.player_xp_multiplier = {
		category = "feature",
		name_id = "menu_player_xp_multiplier",
		upgrade = {
			category = "player",
			upgrade = "xp_multiplier",
			value = 1
		}
	}
	self.definitions.player_non_special_melee_multiplier = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suspicion_bonus = {
		category = "feature",
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "passive_concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_melee_concealment_modifier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_melee_concealment_modifier",
		upgrade = {
			category = "player",
			upgrade = "melee_concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_melee_sharp_damage_multiplier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_melee_sharp_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_sharp_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_suspicion_bonus = {
		category = "feature",
		name_id = "menu_player_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "suspicion_multiplier",
			value = 1
		}
	}
	self.definitions.player_loose_ammo_restore_health_give_team = {
		category = "temporary",
		name_id = "menu_player_loose_ammo_restore_health_give_team",
		upgrade = {
			category = "player",
			upgrade = "loose_ammo_restore_health_give_team",
			value = 1
		}
	}
	self.definitions.player_uncover_progress_mul = {
		category = "feature",
		name_id = "player_uncover_progress_mul",
		upgrade = {
			category = "player",
			upgrade = "uncover_progress_mul",
			value = 1
		}
	}
	self.definitions.player_uncover_progress_decay_mul = {
		category = "feature",
		name_id = "menu_player_uncover_progress_decay_mul",
		upgrade = {
			category = "player",
			upgrade = "uncover_progress_decay_mul",
			value = 1
		}
	}
	self.definitions.player_camouflage_bonus = {
		category = "feature",
		name_id = "menu_player_camouflage_bonus",
		upgrade = {
			category = "player",
			upgrade = "camouflage_bonus",
			value = 1
		}
	}
	self.definitions.player_suppressed_bonus = {
		category = "feature",
		name_id = "menu_player_suppressed_bonus",
		upgrade = {
			category = "player",
			upgrade = "suppressed_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suppression_bonus_1 = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "passive_suppression_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suppression_bonus_2 = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "passive_suppression_multiplier",
			value = 2
		}
	}
	self.definitions.player_suppression_bonus = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "suppression_multiplier",
			value = 1
		}
	}
	self.definitions.player_civilian_reviver = {
		category = "feature",
		name_id = "menu_player_civilian_reviver",
		upgrade = {
			category = "player",
			upgrade = "civilian_reviver",
			value = 1
		}
	}
	self.definitions.player_overkill_damage_multiplier = {
		category = "temporary",
		name_id = "menu_player_overkill_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "overkill_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_overkill_all_weapons = {
		category = "feature",
		name_id = "menu_player_overkill_all_weapons",
		upgrade = {
			category = "player",
			upgrade = "overkill_all_weapons",
			value = 1
		}
	}
	self.definitions.player_berserker_no_ammo_cost = {
		category = "feature",
		name_id = "menu_player_berserker_no_ammo_cost",
		upgrade = {
			category = "player",
			upgrade = "berserker_no_ammo_cost",
			value = 1
		}
	}
	self.definitions.player_damage_multiplier_outnumbered = {
		category = "temporary",
		name_id = "menu_player_dmg_mul_outnumbered",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_multiplier_outnumbered",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_outnumbered = {
		category = "temporary",
		name_id = "menu_player_dmg_damp_outnumbered",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_outnumbered",
			value = 1
		}
	}
	self.definitions.player_corpse_alarm_pager_bluff = {
		category = "feature",
		name_id = "menu_player_pager_dis",
		upgrade = {
			category = "player",
			upgrade = "corpse_alarm_pager_bluff",
			value = 1
		}
	}
	self.definitions.player_buy_bodybags_asset = {
		category = "feature",
		name_id = "menu_player_buy_bodybags_asset",
		upgrade = {
			category = "player",
			upgrade = "buy_bodybags_asset",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose = {
		category = "feature",
		name_id = "menu_player_corpse_disp",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_amount_1 = {
		category = "feature",
		name_id = "menu_player_corpse_disp_amount_1",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_amount",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_amount_2 = {
		category = "feature",
		name_id = "menu_player_corpse_disp_amount_2",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_amount",
			value = 2
		}
	}
	self.definitions.player_taser_malfunction = {
		category = "feature",
		name_id = "menu_player_taser_malf",
		upgrade = {
			category = "player",
			upgrade = "taser_malfunction",
			value = 1
		}
	}
	self.definitions.player_taser_self_shock = {
		category = "feature",
		name_id = "menu_player_taser_shock",
		upgrade = {
			category = "player",
			upgrade = "taser_self_shock",
			value = 1
		}
	}
	self.definitions.player_electrocution_resistance = {
		category = "feature",
		name_id = "menu_player_electrocution_resistance",
		upgrade = {
			category = "player",
			upgrade = "electrocution_resistance_multiplier",
			value = 1
		}
	}
	self.definitions.player_tased_recover_multiplier = {
		category = "feature",
		name_id = "menu_player_tased_recover_multiplier",
		upgrade = {
			category = "player",
			upgrade = "tased_recover_multiplier",
			value = 1
		}
	}
	self.definitions.player_secured_bags_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_secured_bags_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "secured_bags_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_secured_bags_money_multiplier = {
		category = "feature",
		name_id = "menu_secured_bags_money_multiplier",
		upgrade = {
			category = "player",
			upgrade = "secured_bags_money_multiplier",
			value = 1
		}
	}
	self.definitions.player_silent_kill = {
		category = "feature",
		name_id = "menu_player_silent_kill",
		upgrade = {
			category = "player",
			upgrade = "silent_kill",
			value = 1
		}
	}
	self.definitions.player_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_player_melee_knockdown_mul",
		upgrade = {
			category = "player",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
	self.definitions.player_suppression_mul_2 = {
		category = "feature",
		name_id = "menu_player_suppression_mul_2",
		upgrade = {
			category = "player",
			upgrade = "suppression_multiplier",
			value = 2
		}
	}
	self.definitions.player_damage_dampener = {
		category = "feature",
		name_id = "menu_player_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "damage_dampener",
			value = 1
		}
	}
	self.definitions.player_melee_damage_dampener = {
		category = "feature",
		name_id = "menu_player_melee_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_dampener",
			value = 1
		}
	}
	self.definitions.player_marked_enemy_extra_damage = {
		category = "feature",
		name_id = "menu_player_marked_enemy_extra_damage",
		upgrade = {
			category = "player",
			upgrade = "marked_enemy_extra_damage",
			value = 1
		}
	}
	self.definitions.player_civ_intimidation_mul = {
		category = "feature",
		name_id = "menu_player_civ_intimidation_mul",
		upgrade = {
			category = "player",
			upgrade = "civ_intimidation_mul",
			value = 1
		}
	}
	self.definitions.player_civ_harmless_bullets = {
		category = "feature",
		name_id = "menu_player_civ_harmless_bullets",
		upgrade = {
			category = "player",
			upgrade = "civ_harmless_bullets",
			value = 1
		}
	}
	self.definitions.player_civ_harmless_melee = {
		category = "feature",
		name_id = "menu_player_civ_harmless_melee",
		upgrade = {
			category = "player",
			upgrade = "civ_harmless_melee",
			value = 1
		}
	}
	self.definitions.player_civ_calming_alerts = {
		category = "feature",
		name_id = "menu_player_civ_calming_alerts",
		upgrade = {
			category = "player",
			upgrade = "civ_calming_alerts",
			value = 1
		}
	}
	self.definitions.player_special_enemy_highlight = {
		category = "feature",
		name_id = "menu_player_special_enemy_highlight",
		upgrade = {
			category = "player",
			upgrade = "special_enemy_highlight",
			value = 1
		}
	}
	self.definitions.player_drill_alert = {
		category = "feature",
		name_id = "menu_player_drill_alert",
		upgrade = {
			category = "player",
			upgrade = "drill_alert_rad",
			value = 1
		}
	}
	self.definitions.player_silent_drill = {
		category = "feature",
		name_id = "menu_player_silent_drill",
		upgrade = {
			category = "player",
			upgrade = "silent_drill",
			value = 1
		}
	}
	self.definitions.player_drill_speed_multiplier1 = {
		category = "feature",
		name_id = "menu_player_drill_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "drill_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_drill_speed_multiplier2 = {
		category = "feature",
		name_id = "menu_player_drill_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "drill_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_saw_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_saw_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "saw_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_saw_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_saw_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "saw_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_drill_fix_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "drill_fix_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_dye_pack_chance_multiplier = {
		category = "feature",
		name_id = "menu_player_dye_pack_chance_multiplier",
		upgrade = {
			category = "player",
			upgrade = "dye_pack_chance_multiplier",
			value = 1
		}
	}
	self.definitions.player_dye_pack_cash_loss_multiplier = {
		category = "feature",
		name_id = "menu_player_dye_pack_cash_loss_multiplier",
		upgrade = {
			category = "player",
			upgrade = "dye_pack_cash_loss_multiplier",
			value = 1
		}
	}
	self.definitions.player_cheat_death_chance = {
		category = "feature",
		name_id = "menu_player_cheat_death_chance",
		upgrade = {
			category = "player",
			upgrade = "cheat_death_chance",
			value = 1
		}
	}
	self.definitions.player_additional_lives_1 = {
		category = "feature",
		name_id = "menu_player_additional_lives_1",
		upgrade = {
			category = "player",
			upgrade = "additional_lives",
			value = 1
		}
	}
	self.definitions.player_additional_lives_2 = {
		category = "feature",
		name_id = "menu_player_additional_lives_2",
		upgrade = {
			category = "player",
			upgrade = "additional_lives",
			value = 2
		}
	}
	self.definitions.player_trip_mine_shaped_charge = {
		category = "feature",
		name_id = "menu_player_trip_mine_shaped_charge",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_shaped_charge",
			value = 1
		}
	}
	self.definitions.player_small_loot_multiplier1 = {
		category = "feature",
		name_id = "menu_player_small_loot_multiplier",
		upgrade = {
			category = "player",
			upgrade = "small_loot_multiplier",
			value = 1
		}
	}
	self.definitions.player_small_loot_multiplier2 = {
		category = "feature",
		name_id = "menu_player_small_loot_multiplier",
		upgrade = {
			category = "player",
			upgrade = "small_loot_multiplier",
			value = 2
		}
	}
	self.definitions.player_intimidate_enemies = {
		category = "feature",
		name_id = "menu_player_intimidate_enemies",
		upgrade = {
			category = "player",
			upgrade = "intimidate_enemies",
			value = 1
		}
	}
	self.definitions.player_intimidate_specials = {
		category = "feature",
		name_id = "menu_player_intimidate_specials",
		upgrade = {
			category = "player",
			upgrade = "intimidate_specials",
			value = 1
		}
	}
	self.definitions.player_passive_empowered_intimidation = {
		category = "feature",
		name_id = "menu_player_passive_empowered_intimidation",
		upgrade = {
			category = "player",
			upgrade = "empowered_intimidation_mul",
			value = 1
		}
	}
	self.definitions.player_intimidation_multiplier = {
		category = "feature",
		name_id = "menu_player_intimidation_multiplier",
		upgrade = {
			category = "player",
			upgrade = "intimidation_multiplier",
			value = 1
		}
	}
	self.definitions.player_sentry_gun_deploy_time_multiplier = {
		category = "feature",
		name_id = "menu_player_sentry_gun_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "sentry_gun_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_trip_mine_deploy_time_multiplier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_trip_mine_deploy_time_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies = {
		category = "feature",
		name_id = "menu_player_convert_enemies",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_max_minions_1 = {
		category = "feature",
		name_id = "menu_player_convert_enemies_max_minions",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_max_minions",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_max_minions_2 = {
		category = "feature",
		name_id = "menu_player_convert_enemies_max_minions",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_max_minions",
			value = 2
		}
	}
	self.definitions.player_convert_enemies_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_convert_enemies_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_health_multiplier = {
		category = "feature",
		name_id = "menu_player_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_convert_enemies_health_multiplier = {
		category = "feature",
		name_id = "menu_player_passive_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_convert_enemies_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_convert_enemies_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_convert_enemies_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_passive_convert_enemies_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_convert_enemies_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_intimidate_range_mul = {
		category = "feature",
		name_id = "menu_player_intimidate_range_mul",
		upgrade = {
			category = "player",
			upgrade = "passive_intimidate_range_mul",
			value = 1
		}
	}
	self.definitions.player_intimidate_range_mul = {
		category = "feature",
		name_id = "menu_player_intimidate_range_mul",
		upgrade = {
			category = "player",
			upgrade = "intimidate_range_mul",
			value = 1
		}
	}
	self.definitions.player_intimidate_aura = {
		category = "feature",
		name_id = "menu_player_intimidate_aura",
		upgrade = {
			category = "player",
			upgrade = "intimidate_aura",
			value = 1
		}
	}
	self.definitions.player_civilian_gives_ammo = {
		category = "feature",
		name_id = "menu_player_civilian_gives_ammo",
		upgrade = {
			category = "player",
			upgrade = "civilian_gives_ammo",
			value = 1
		}
	}
	self.definitions.player_drill_autorepair = {
		category = "feature",
		name_id = "menu_player_drill_autorepair",
		upgrade = {
			category = "player",
			upgrade = "drill_autorepair",
			value = 1
		}
	}
	self.definitions.player_hostage_trade = {
		category = "feature",
		name_id = "menu_player_hostage_trade",
		upgrade = {
			category = "player",
			upgrade = "hostage_trade",
			value = 1
		}
	}
	self.definitions.player_sec_camera_highlight = {
		category = "feature",
		name_id = "menu_player_sec_camera_highlight",
		upgrade = {
			category = "player",
			upgrade = "sec_camera_highlight",
			value = 1
		}
	}
	self.definitions.player_sec_camera_highlight_mask_off = {
		category = "feature",
		name_id = "menu_player_sec_camera_highlight_mask_off",
		upgrade = {
			category = "player",
			upgrade = "sec_camera_highlight_mask_off",
			value = 1
		}
	}
	self.definitions.player_special_enemy_highlight_mask_off = {
		category = "feature",
		name_id = "menu_player_special_enemy_highlight_mask_off",
		upgrade = {
			category = "player",
			upgrade = "special_enemy_highlight_mask_off",
			value = 1
		}
	}
	self.definitions.player_morale_boost = {
		category = "feature",
		name_id = "menu_player_morale_boost",
		upgrade = {
			category = "player",
			upgrade = "morale_boost",
			value = 1
		}
	}
	self.definitions.player_morale_boost_cooldown_multiplier = {
		category = "feature",
		name_id = "menu_player_morale_boost_cooldown_multiplier",
		upgrade = {
			category = "player",
			upgrade = "morale_boost_cooldown_multiplier",
			value = 1
		}
	}
	self.definitions.player_long_dis_revive = {
		category = "feature",
		name_id = "menu_player_long_dis_revive",
		upgrade = {
			category = "player",
			upgrade = "long_dis_revive",
			value = 1
		}
	}
	self.definitions.player_long_dis_revive_2 = {
		category = "feature",
		name_id = "menu_player_long_dis_revive",
		upgrade = {
			category = "player",
			upgrade = "long_dis_revive",
			value = 2
		}
	}
	self.definitions.player_pick_lock_easy = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy",
			value = 1
		}
	}
	self.definitions.player_pick_lock_hard = {
		category = "feature",
		name_id = "menu_player_pick_lock_hard",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_hard",
			value = 1
		}
	}
	self.definitions.player_pick_lock_easy_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_pick_lock_easy_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_loot_drop_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "loot_drop_multiplier",
			value = 1
		}
	}
	self.definitions.player_loot_drop_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "loot_drop_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_loot_drop_multiplier = {
		category = "feature",
		name_id = "menu_player_passive_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_loot_drop_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_weapon_passive_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.weapon_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_weapon_armor_piercing_chance_2",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_2",
			value = 1
		}
	}
	self.definitions.weapon_silencer_armor_piercing_chance_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_weapon_silencer_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_silencer",
			value = 1
		}
	}
	self.definitions.weapon_silencer_armor_piercing_chance_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_weapon_silencer_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_silencer",
			value = 1
		}
	}
	self.definitions.player_passive_armor_movement_penalty_multiplier = {
		category = "feature",
		name_id = "menu_passive_armor_movement_penalty_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_movement_penalty_multiplier",
			value = 1
		}
	}
	self.definitions.player_buy_cost_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_buy_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "buy_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_buy_cost_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_buy_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "buy_cost_multiplier",
			value = 2
		}
	}
	self.definitions.player_crime_net_deal = {
		category = "feature",
		name_id = "menu_player_crime_net_deal",
		upgrade = {
			category = "player",
			upgrade = "crime_net_deal",
			value = 1
		}
	}
	self.definitions.player_crime_net_deal_2 = {
		category = "feature",
		name_id = "menu_player_crime_net_deal",
		upgrade = {
			category = "player",
			upgrade = "crime_net_deal",
			value = 2
		}
	}
	self.definitions.player_sell_cost_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_sell_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "sell_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_crafting_weapon_multiplier = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier",
		upgrade = {
			category = "player",
			upgrade = "crafting_weapon_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 3
		}
	}
	self.definitions.player_crafting_mask_multiplier = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "crafting_mask_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 3
		}
	}
	self.definitions.player_additional_assets = {
		category = "feature",
		name_id = "menu_player_additional_assets",
		upgrade = {
			category = "player",
			upgrade = "additional_assets",
			value = 1
		}
	}
	self.definitions.player_assets_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_assets_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "assets_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_assets_cost_multiplier_b = {
		category = "feature",
		name_id = "menu_player_assets_cost_multiplier_b",
		upgrade = {
			category = "player",
			upgrade = "assets_cost_multiplier_b",
			value = 1
		}
	}
	self.definitions.player_premium_contract_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_premium_contract_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "premium_contract_cost_multiplier",
			value = 1
		}
	}
	self.definitions.passive_player_assets_cost_multiplier = {
		category = "feature",
		name_id = "menu_passive_player_assets_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_assets_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_revive_health_boost = {
		category = "feature",
		name_id = "menu_player_revive_health_boost",
		upgrade = {
			category = "player",
			upgrade = "revive_health_boost",
			value = 1
		}
	}
	self.definitions.player_run_and_shoot = {
		category = "feature",
		name_id = "menu_player_run_and_shoot",
		upgrade = {
			category = "player",
			upgrade = "run_and_shoot",
			value = 1
		}
	}
	self.definitions.player_carry_sentry_and_trip = {
		category = "feature",
		name_id = "menu_player_carry_sentry_and_trip",
		upgrade = {
			category = "player",
			upgrade = "carry_sentry_and_trip",
			value = 1
		}
	}
	self.definitions.player_run_and_reload = {
		category = "feature",
		name_id = "menu_player_run_and_reload",
		upgrade = {
			category = "player",
			upgrade = "run_and_reload",
			value = 1
		}
	}
	self.definitions.player_level_interaction_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_level_interaction_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_interaction_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_steelsight_normal_movement_speed = {
		category = "feature",
		name_id = "menu_player_steelsight_normal_movement_speed",
		upgrade = {
			category = "player",
			upgrade = "steelsight_normal_movement_speed",
			value = 1
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_1 = {
		category = "feature",
		name_id = "menu_player_headshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "headshot_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_2 = {
		category = "feature",
		name_id = "menu_player_headshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "headshot_regen_armor_bonus",
			value = 2
		}
	}
	self.definitions.player_resist_firing_tased = {
		category = "feature",
		name_id = "menu_player_resist_firing_tased",
		upgrade = {
			category = "player",
			upgrade = "resist_firing_tased",
			value = 1
		}
	}
	self.definitions.player_crouch_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_crouch_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "crouch_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_crouch_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_crouch_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "crouch_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_on_zipline_dodge_chance = {
		category = "feature",
		name_id = "menu_player_on_zipline_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "on_zipline_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_movement_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_climb_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_climb_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "climb_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_climb_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_climb_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "climb_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_tape_loop_duration_1 = {
		category = "feature",
		name_id = "menu_player_tape_loop_duration",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_duration",
			value = 1
		}
	}
	self.definitions.player_tape_loop_duration_2 = {
		category = "feature",
		name_id = "menu_player_tape_loop_duration",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_duration",
			value = 2
		}
	}
	self.definitions.player_tape_loop_interact_distance_mul_1 = {
		category = "feature",
		name_id = "menu_player_tape_loop_interact_distance_mul",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_interact_distance_mul",
			value = 1
		}
	}
	self.definitions.player_buy_spotter_asset = {
		category = "feature",
		name_id = "menu_player_buy_spotter_asset",
		upgrade = {
			category = "player",
			upgrade = "buy_spotter_asset",
			value = 1
		}
	}
	self.definitions.player_gangster_damage_dampener_1 = {
		category = "feature",
		name_id = "menu_player_gangster_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "gangster_damage_dampener",
			value = 1
		}
	}
	self.definitions.player_gangster_damage_dampener_2 = {
		category = "feature",
		name_id = "menu_player_gangster_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "gangster_damage_dampener",
			value = 2
		}
	}
	self.definitions.player_damage_to_hot_1 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 1
		}
	}
	self.definitions.player_damage_to_hot_2 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 2
		}
	}
	self.definitions.player_damage_to_hot_3 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 3
		}
	}
	self.definitions.player_damage_to_hot_4 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 4
		}
	}
	self.definitions.player_damage_to_hot_extra_ticks = {
		category = "feature",
		name_id = "menu_player_damage_to_hot_extra_ticks",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot_extra_ticks",
			value = 1
		}
	}
	self.definitions.player_armor_piercing_chance_1 = {
		category = "feature",
		name_id = "menu_player_armor_piercing_chance",
		upgrade = {
			category = "player",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.player_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_player_armor_piercing_chance",
		upgrade = {
			category = "player",
			upgrade = "armor_piercing_chance",
			value = 2
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 2
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 3
		}
	}
	self.definitions.player_movement_speed_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_threshold_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_threshold_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_threshold_multiplier",
			value = 1
		}
	}
	self.definitions.player_movement_speed_damage_health_ratio_threshold_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_damage_health_ratio_threshold_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_damage_health_ratio_threshold_multiplier",
			value = 1
		}
	}
	self.definitions.toolset = {
		tree = 4,
		step = 1,
		category = "equipment",
		equipment_id = "toolset",
		title_id = "debug_upgrade_player_upgrade",
		subtitle_id = "debug_upgrade_toolset1",
		name_id = "debug_upgrade_toolset1",
		icon = "equipment_toolset",
		image = "upgrades_toolset",
		image_slice = "upgrades_toolset_slice",
		description_text_id = "toolset",
		unlock_lvl = 0,
		aquire = {upgrade = "toolset1"},
		slot = 2
	}
	for i, _ in ipairs(self.values.player.toolset) do
		local depends_on = i - 1 > 0 and "toolset" .. i - 1
		local unlock_lvl = 3
		local prio = i == 1 and "high"
		self.definitions["toolset" .. i] = {
			tree = 4,
			step = self.steps.player.toolset[i],
			category = "feature",
			title_id = "debug_upgrade_player_upgrade",
			subtitle_id = "debug_upgrade_toolset" .. i,
			name_id = "debug_upgrade_toolset" .. i,
			icon = "equipment_toolset",
			image = "upgrades_toolset",
			image_slice = "upgrades_toolset_slice",
			description_text_id = "toolset",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "toolset",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_trip_mine_definitions()
	self.definitions.trip_mine = {
		tree = 2,
		step = 4,
		category = "equipment",
		equipment_id = "trip_mine",
		name_id = "debug_trip_mine",
		title_id = "debug_upgrade_new_equipment",
		subtitle_id = "debug_trip_mine",
		icon = "equipment_trip_mine",
		image = "upgrades_tripmines",
		image_slice = "upgrades_tripmines_slice",
		description_text_id = "trip_mine",
		unlock_lvl = 0,
		prio = "high",
		slot = 1
	}
	self.definitions.trip_mine_can_switch_on_off = {
		category = "feature",
		name_id = "menu_trip_mine_can_switch_on_off",
		upgrade = {
			category = "trip_mine",
			upgrade = "can_switch_on_off",
			value = 1
		}
	}
	self.definitions.trip_mine_sensor_toggle = {
		category = "feature",
		name_id = "menu_trip_mine_sensor_toggle",
		upgrade = {
			category = "trip_mine",
			upgrade = "sensor_toggle",
			value = 1
		}
	}
	self.definitions.trip_mine_sensor_highlight = {
		category = "feature",
		name_id = "menu_trip_mine_sensor_toggle",
		upgrade = {
			category = "trip_mine",
			upgrade = "sensor_highlight",
			value = 1
		}
	}
	self.definitions.trip_mine_quantity_increase_1 = {
		category = "feature",
		name_id = "menu_trip_mine_quantity_increase_1",
		upgrade = {
			category = "trip_mine",
			upgrade = "quantity_1",
			value = 1
		}
	}
	self.definitions.trip_mine_quantity_increase_2 = {
		category = "feature",
		name_id = "menu_trip_mine_quantity_increase_1",
		upgrade = {
			category = "trip_mine",
			upgrade = "quantity_2",
			value = 1
		}
	}
	self.definitions.trip_mine_quantity_increase_3 = {
		category = "feature",
		name_id = "menu_trip_mine_quantity_increase_1",
		upgrade = {
			category = "trip_mine",
			upgrade = "quantity_3",
			value = 1
		}
	}
	self.definitions.trip_mine_explosion_size_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explosion_size_multiplier",
		upgrade = {
			category = "trip_mine",
			upgrade = "explosion_size_multiplier_1",
			value = 1
		}
	}
	self.definitions.trip_mine_explosion_size_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explosion_size_multiplier",
		upgrade = {
			category = "trip_mine",
			upgrade = "explosion_size_multiplier_2",
			value = 1
		}
	}
	self.definitions.trip_mine_explode_timer_delay = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explode_timer_delay",
		upgrade = {
			category = "trip_mine",
			upgrade = "explode_timer_delay",
			value = 1
		}
	}
	self.definitions.trip_mine_marked_enemy_extra_damage = {
		category = "feature",
		name_id = "menu_trip_mine_marked_enemy_extra_damage",
		upgrade = {
			category = "trip_mine",
			upgrade = "marked_enemy_extra_damage",
			value = 1
		}
	}
end
function UpgradesTweakData:_ecm_jammer_definitions()
	self.definitions.ecm_jammer = {
		category = "equipment",
		equipment_id = "ecm_jammer",
		name_id = "menu_equipment_ecm_jammer",
		slot = 1
	}
	self.definitions.ecm_jammer_can_activate_feedback = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_activate_feedback",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "can_activate_feedback",
			value = 1
		}
	}
	self.definitions.ecm_jammer_can_open_sec_doors = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_open_sec_doors",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "can_open_sec_doors",
			value = 1
		}
	}
	self.definitions.ecm_jammer_quantity_increase_1 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_quantity_1",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.ecm_jammer_quantity_increase_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_quantity_2",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "quantity",
			value = 2
		}
	}
	self.definitions.ecm_jammer_duration_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_duration_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "duration_multiplier",
			value = 1
		}
	}
	self.definitions.ecm_jammer_duration_multiplier_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_duration_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "duration_multiplier_2",
			value = 1
		}
	}
	self.definitions.ecm_jammer_affects_cameras = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_affects_cameras",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "affects_cameras",
			value = 1
		}
	}
	self.definitions.ecm_jammer_affects_pagers = {
		category = "equipment_upgrade",
		name_id = "",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "affects_pagers",
			value = 1
		}
	}
	self.definitions.ecm_jammer_feedback_duration_boost = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_feedback_duration_boost",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "feedback_duration_boost",
			value = 1
		}
	}
	self.definitions.ecm_jammer_feedback_duration_boost_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_feedback_duration_boost_2",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "feedback_duration_boost_2",
			value = 1
		}
	}
	self.definitions.ecm_jammer_interaction_speed_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_interaction_speed_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.ecm_jammer_can_retrigger = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_retrigger",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "can_retrigger",
			value = 1
		}
	}
end
function UpgradesTweakData:_ammo_bag_definitions()
	self.definitions.ammo_bag = {
		tree = 1,
		step = 2,
		category = "equipment",
		equipment_id = "ammo_bag",
		name_id = "debug_ammo_bag",
		title_id = "debug_upgrade_new_equipment",
		subtitle_id = "debug_ammo_bag",
		icon = "equipment_ammo_bag",
		image = "upgrades_ammobag",
		image_slice = "upgrades_ammobag_slice",
		description_text_id = "ammo_bag",
		unlock_lvl = 0,
		prio = "high",
		slot = 1
	}
	for i, _ in ipairs(self.values.ammo_bag.ammo_increase) do
		local depends_on = i - 1 > 0 and "ammo_bag_ammo_increase" .. i - 1 or "ammo_bag"
		local unlock_lvl = 11
		local prio = i == 1 and "high"
		self.definitions["ammo_bag_ammo_increase" .. i] = {
			tree = 1,
			step = self.steps.ammo_bag.ammo_increase[i],
			category = "equipment_upgrade",
			name_id = "debug_upgrade_ammo_bag_ammo_increase" .. i,
			title_id = "debug_ammo_bag",
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			icon = "equipment_ammo_bag",
			image = "upgrades_ammobag",
			image_slice = "upgrades_ammobag_slice",
			description_text_id = "ammo_bag_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ammo_bag",
				upgrade = "ammo_increase",
				value = i
			}
		}
	end
	self.definitions.ammo_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_ammo_bag_quantity",
		upgrade = {
			category = "ammo_bag",
			upgrade = "quantity",
			value = 1
		}
	}
end
function UpgradesTweakData:_doctor_bag_definitions()
	self.definitions.doctor_bag = {
		tree = 3,
		step = 5,
		category = "equipment",
		equipment_id = "doctor_bag",
		name_id = "debug_doctor_bag",
		title_id = "debug_upgrade_new_equipment",
		subtitle_id = "debug_doctor_bag",
		icon = "equipment_doctor_bag",
		image = "upgrades_doctorbag",
		image_slice = "upgrades_doctorbag_slice",
		description_text_id = "doctor_bag",
		unlock_lvl = 2,
		prio = "high",
		slot = 1
	}
	for i, _ in ipairs(self.values.doctor_bag.amount_increase) do
		local depends_on = i - 1 > 0 and "doctor_bag_amount_increase" .. i - 1 or "doctor_bag"
		local unlock_lvl = 3
		local prio = i == 1 and "high"
		self.definitions["doctor_bag_amount_increase" .. i] = {
			tree = 3,
			step = self.steps.doctor_bag.amount_increase[i],
			category = "equipment_upgrade",
			name_id = "debug_upgrade_doctor_bag_amount_increase" .. i,
			title_id = "debug_doctor_bag",
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			icon = "equipment_doctor_bag",
			image = "upgrades_doctorbag",
			image_slice = "upgrades_doctorbag_slice",
			description_text_id = "doctor_bag_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "doctor_bag",
				upgrade = "amount_increase",
				value = i
			}
		}
	end
	self.definitions.doctor_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_doctor_bag_quantity",
		upgrade = {
			category = "doctor_bag",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.passive_doctor_bag_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_passive_doctor_bag_interaction_speed_multiplier",
		upgrade = {
			category = "doctor_bag",
			upgrade = "interaction_speed_multiplier",
			value = 1
		}
	}
end
function UpgradesTweakData:_cable_tie_definitions()
	self.definitions.cable_tie = {
		category = "equipment",
		equipment_id = "cable_tie",
		name_id = "debug_equipment_cable_tie",
		title_id = "debug_equipment_cable_tie",
		icon = "equipment_cable_ties",
		image = "upgrades_extracableties",
		image_slice = "upgrades_extracableties_slice",
		unlock_lvl = 0,
		prio = "high"
	}
	self.definitions.extra_cable_tie = {
		tree = 1,
		step = 4,
		category = "equipment",
		equipment_id = "extra_cable_tie",
		name_id = "debug_upgrade_extra_cable_tie_quantity1",
		title_id = "debug_equipment_cable_tie",
		subtitle_id = "debug_upgrade_amount_increase1",
		icon = "equipment_extra_cable_ties",
		image = "upgrades_extracableties",
		image_slice = "upgrades_extracableties_slice",
		description_text_id = "extra_cable_tie",
		unlock_lvl = 3,
		prio = "high",
		aquire = {
			upgrade = "extra_cable_tie_quantity1"
		},
		slot = 2
	}
	for i, _ in ipairs(self.values.extra_cable_tie.quantity) do
		local depends_on = 0 < i - 1 and "extra_cable_tie_quantity" .. i - 1 or "extra_cable_tie"
		local unlock_lvl = 4
		local prio = i == 1 and "high"
		self.definitions["extra_cable_tie_quantity" .. i] = {
			tree = 1,
			step = self.steps.extra_cable_tie.quantity[i],
			category = "equipment_upgrade",
			name_id = "debug_upgrade_extra_cable_tie_quantity" .. i,
			title_id = "debug_equipment_cable_tie",
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			icon = "equipment_extra_cable_ties",
			image = "upgrades_extracableties",
			image_slice = "upgrades_extracableties_slice",
			description_text_id = "extra_cable_tie",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "extra_cable_tie",
				upgrade = "quantity",
				value = i
			}
		}
	end
	self.definitions.cable_tie_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_1",
			value = 1
		}
	}
	self.definitions.cable_tie_quantity_2 = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity_2",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_2",
			value = 1
		}
	}
	self.definitions.cable_tie_interact_speed_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_interact_speed_multiplier",
		upgrade = {
			category = "cable_tie",
			upgrade = "interact_speed_multiplier",
			value = 1
		}
	}
	self.definitions.cable_tie_can_cable_tie_doors = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_can_cable_tie_doors",
		upgrade = {
			category = "cable_tie",
			upgrade = "can_cable_tie_doors",
			value = 1
		}
	}
	self.definitions.cable_tie_quantity_unlimited = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity_unlimited",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_unlimited",
			value = 1
		}
	}
end
function UpgradesTweakData:_armor_kit_definitions()
	self.definitions.armor_kit = {
		category = "equipment",
		equipment_id = "armor_kit",
		name_id = "menu_equipment_armor_kit",
		slot = 1
	}
end
function UpgradesTweakData:_sentry_gun_definitions()
	self.definitions.sentry_gun = {
		tree = 4,
		step = 5,
		category = "equipment",
		equipment_id = "sentry_gun",
		name_id = "debug_sentry_gun",
		title_id = "debug_upgrade_new_equipment",
		subtitle_id = "debug_sentry_gun",
		icon = "equipment_sentry",
		image = "upgrades_sentry",
		image_slice = "upgrades_sentry_slice",
		description_text_id = "sentry_gun",
		unlock_lvl = 0,
		prio = "high",
		slot = 1
	}
	self.definitions.sentry_gun_quantity_increase = {
		category = "feature",
		name_id = "menu_sentry_gun_quantity_increase",
		upgrade = {
			category = "sentry_gun",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.sentry_gun_damage_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_damage_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_extra_ammo_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_sentry_gun_extra_ammo_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_extra_ammo_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_sentry_gun_extra_ammo_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "extra_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.sentry_gun_armor_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "armor_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_multiplier2 = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "armor_multiplier2",
			value = 1
		}
	}
	self.definitions.sentry_gun_spread_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_spread_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_rot_speed_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_rot_speed_multiplier",
		upgrade = {
			category = "sentry_gun",
			upgrade = "rot_speed_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_shield = {
		category = "feature",
		name_id = "menu_sentry_gun_shield",
		upgrade = {
			category = "sentry_gun",
			upgrade = "shield",
			value = 1
		}
	}
	self.definitions.sentry_gun_can_revive = {
		category = "feature",
		name_id = "menu_sentry_gun_can_revive",
		upgrade = {
			category = "sentry_gun",
			upgrade = "can_revive",
			value = 1
		}
	}
	self.definitions.sentry_gun_can_reload = {
		category = "feature",
		name_id = "menu_sentry_gun_can_reload",
		upgrade = {
			category = "sentry_gun",
			upgrade = "can_reload",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_piercing_chance",
		upgrade = {
			category = "sentry_gun",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_piercing_chance_2",
		upgrade = {
			category = "sentry_gun",
			upgrade = "armor_piercing_chance_2",
			value = 1
		}
	}
end
function UpgradesTweakData:_rep_definitions()
	local rep_upgrades = self.values.rep_upgrades
	for index, rep_class in ipairs(rep_upgrades.classes) do
		for i = 1, 10 do
			self.definitions[rep_class .. i] = {
				category = "rep_upgrade",
				value = rep_upgrades.values[index]
			}
		end
	end
end
function UpgradesTweakData:_c45_definitions()
	self.definitions.c45 = {
		tree = 1,
		step = 13,
		category = "weapon",
		unit_name = Idstring("units/weapons/c45/c45"),
		name_id = "debug_c45",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_c45_short",
		icon = "c45",
		image = "upgrades_45",
		image_slice = "upgrades_45_slice",
		unlock_lvl = 30,
		prio = "high",
		description_text_id = "des_c45"
	}
	for i, _ in ipairs(self.values.c45.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "c45_mag" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"
		self.definitions["c45_mag" .. i] = {
			tree = 1,
			step = self.steps.c45.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_c45_mag" .. i,
			title_id = "debug_c45_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.c45.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "c45_recoil" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"
		self.definitions["c45_recoil" .. i] = {
			tree = 1,
			step = self.steps.c45.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_c45_recoil" .. i,
			title_id = "debug_c45_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.c45.damage_multiplier) do
		local depends_on = i - 1 > 0 and "c45_damage" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"
		self.definitions["c45_damage" .. i] = {
			tree = 1,
			step = self.steps.c45.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_c45_damage" .. i,
			title_id = "debug_c45_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_beretta92_definitions()
	self.definitions.beretta92 = {
		category = "weapon",
		weapon_id = "beretta92",
		unit_name = Idstring("units/weapons/beretta92/beretta92"),
		name_id = "debug_beretta92",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_beretta92_short",
		icon = "beretta92",
		image = "upgrades_m9sd",
		image_slice = "upgrades_m9sd_slice",
		unlock_lvl = 0,
		prio = "high",
		description_text_id = "des_beretta92"
	}
	for i, _ in ipairs(self.values.beretta92.clip_ammo_increase) do
		local depends_on = 0 < i - 1 and "beretta_mag" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"
		self.definitions["beretta_mag" .. i] = {
			tree = 1,
			step = self.steps.beretta92.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_beretta_mag" .. i,
			title_id = "debug_beretta92_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.beretta92.recoil_multiplier) do
		local depends_on = 0 < i - 1 and "beretta_recoil" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"
		self.definitions["beretta_recoil" .. i] = {
			tree = 2,
			step = self.steps.beretta92.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_beretta_recoil" .. i,
			title_id = "debug_beretta92_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.beretta92.spread_multiplier) do
		local depends_on = 0 < i - 1 and "beretta_spread" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"
		self.definitions["beretta_spread" .. i] = {
			tree = 3,
			step = self.steps.beretta92.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_beretta_spread" .. i,
			title_id = "debug_beretta92_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_raging_bull_definitions()
	self.definitions.raging_bull = {
		tree = 3,
		step = 6,
		category = "weapon",
		weapon_id = "raging_bull",
		unit_name = Idstring("units/weapons/raging_bull/raging_bull"),
		name_id = "debug_raging_bull",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_raging_bull_short",
		icon = "raging_bull",
		image = "upgrades_ragingbull",
		image_slice = "upgrades_ragingbull_slice",
		unlock_lvl = 60,
		prio = "high",
		description_text_id = "des_raging_bull"
	}
	for i, _ in ipairs(self.values.raging_bull.spread_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_spread" .. i - 1
		local unlock_lvl = 61
		local prio = i == 1 and "high"
		self.definitions["raging_bull_spread" .. i] = {
			tree = 3,
			step = self.steps.raging_bull.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_raging_bull_spread" .. i,
			title_id = "debug_raging_bull_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.raging_bull.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_reload_speed" .. i - 1 or "raging_bull"
		local unlock_lvl = 61
		local prio = i == 1 and "high"
		self.definitions["raging_bull_reload_speed" .. i] = {
			tree = 3,
			step = self.steps.raging_bull.reload_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_raging_bull_reload_speed" .. i,
			title_id = "debug_raging_bull_short",
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			description_text_id = "reload_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.raging_bull.damage_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_damage" .. i - 1 or "raging_bull"
		local unlock_lvl = 61
		local prio = i == 1 and "high"
		self.definitions["raging_bull_damage" .. i] = {
			tree = 3,
			step = self.steps.raging_bull.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_raging_bull_damage" .. i,
			title_id = "debug_raging_bull_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_olympic_definitions()
	self.definitions.olympic = {
		category = "weapon",
		weapon_id = "olympic",
		factory_id = "wpn_fps_smg_olympic"
	}
	self.definitions.olympic_primary = {
		category = "weapon",
		weapon_id = "olympic_primary",
		factory_id = "wpn_fps_smg_olympic_primary"
	}
end
function UpgradesTweakData:_amcar_definitions()
	self.definitions.amcar = {
		category = "weapon",
		weapon_id = "amcar",
		factory_id = "wpn_fps_ass_amcar",
		free = true
	}
end
function UpgradesTweakData:_m16_definitions()
	self.definitions.m16 = {
		category = "weapon",
		weapon_id = "m16",
		factory_id = "wpn_fps_ass_m16"
	}
end
function UpgradesTweakData:_new_m4_definitions()
	self.definitions.new_m4 = {
		category = "weapon",
		weapon_id = "new_m4",
		factory_id = "wpn_fps_ass_m4"
	}
	self.definitions.m4_secondary = {
		category = "weapon",
		weapon_id = "m4_secondary",
		factory_id = "wpn_fps_ass_m4_secondary"
	}
end
function UpgradesTweakData:_glock_18c_definitions()
	self.definitions.glock_18c = {
		category = "weapon",
		weapon_id = "glock_18c",
		factory_id = "wpn_fps_pis_g18c"
	}
	self.definitions.glock_18c_primary = {
		category = "weapon",
		weapon_id = "glock_18c_primary",
		factory_id = "wpn_fps_pis_g18c_primary"
	}
end
function UpgradesTweakData:_saiga_definitions()
	self.definitions.saiga = {
		category = "weapon",
		weapon_id = "saiga",
		factory_id = "wpn_fps_shot_saiga"
	}
end
function UpgradesTweakData:_akmsu_definitions()
	self.definitions.akmsu = {
		category = "weapon",
		weapon_id = "akmsu",
		factory_id = "wpn_fps_smg_akmsu"
	}
	self.definitions.akmsu_primary = {
		category = "weapon",
		weapon_id = "akmsu_primary",
		factory_id = "wpn_fps_smg_akmsu_primary"
	}
end
function UpgradesTweakData:_ak74_definitions()
	self.definitions.ak74 = {
		category = "weapon",
		weapon_id = "ak74",
		factory_id = "wpn_fps_ass_74"
	}
	self.definitions.ak74_secondary = {
		category = "weapon",
		weapon_id = "ak74_secondary",
		factory_id = "wpn_fps_ass_74_secondary"
	}
end
function UpgradesTweakData:_akm_definitions()
	self.definitions.akm = {
		category = "weapon",
		weapon_id = "akm",
		factory_id = "wpn_fps_ass_akm"
	}
end
function UpgradesTweakData:_akm_gold_definitions()
	self.definitions.akm_gold = {
		category = "weapon",
		weapon_id = "akm_gold",
		factory_id = "wpn_fps_ass_akm_gold",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_ak5_definitions()
	self.definitions.ak5 = {
		category = "weapon",
		weapon_id = "ak5",
		factory_id = "wpn_fps_ass_ak5"
	}
end
function UpgradesTweakData:_aug_definitions()
	self.definitions.aug = {
		category = "weapon",
		weapon_id = "aug",
		factory_id = "wpn_fps_ass_aug"
	}
	self.definitions.aug_secondary = {
		category = "weapon",
		weapon_id = "aug_secondary",
		factory_id = "wpn_fps_ass_aug_secondary"
	}
end
function UpgradesTweakData:_g36_definitions()
	self.definitions.g36 = {
		category = "weapon",
		weapon_id = "g36",
		factory_id = "wpn_fps_ass_g36"
	}
end
function UpgradesTweakData:_p90_definitions()
	self.definitions.p90 = {
		category = "weapon",
		weapon_id = "p90",
		factory_id = "wpn_fps_smg_p90"
	}
end
function UpgradesTweakData:_new_m14_definitions()
	self.definitions.new_m14 = {
		category = "weapon",
		weapon_id = "new_m14",
		factory_id = "wpn_fps_ass_m14"
	}
end
function UpgradesTweakData:_mp9_definitions()
	self.definitions.mp9 = {
		category = "weapon",
		weapon_id = "mp9",
		factory_id = "wpn_fps_smg_mp9"
	}
end
function UpgradesTweakData:_deagle_definitions()
	self.definitions.deagle = {
		category = "weapon",
		weapon_id = "deagle",
		factory_id = "wpn_fps_pis_deagle"
	}
	self.definitions.deagle_primary = {
		category = "weapon",
		weapon_id = "deagle_primary",
		factory_id = "wpn_fps_pis_deagle_primary"
	}
end
function UpgradesTweakData:_new_mp5_definitions()
	self.definitions.new_mp5 = {
		category = "weapon",
		weapon_id = "new_mp5",
		factory_id = "wpn_fps_smg_mp5"
	}
end
function UpgradesTweakData:_colt_1911_definitions()
	self.definitions.colt_1911 = {
		category = "weapon",
		weapon_id = "colt_1911",
		factory_id = "wpn_fps_pis_1911"
	}
	self.definitions.colt_1911_primary = {
		category = "weapon",
		weapon_id = "colt_1911_primary",
		factory_id = "wpn_fps_pis_1911_primary"
	}
end
function UpgradesTweakData:_mac10_definitions()
	self.definitions.mac10 = {
		category = "weapon",
		weapon_id = "mac10",
		factory_id = "wpn_fps_smg_mac10"
	}
end
function UpgradesTweakData:_glock_17_definitions()
	self.definitions.glock_17 = {
		category = "weapon",
		weapon_id = "glock_17",
		factory_id = "wpn_fps_pis_g17",
		free = true
	}
end
function UpgradesTweakData:_b92fs_definitions()
	self.definitions.b92fs = {
		category = "weapon",
		weapon_id = "b92fs",
		factory_id = "wpn_fps_pis_beretta"
	}
	self.definitions.b92fs_primary = {
		category = "weapon",
		weapon_id = "b92fs_primary",
		factory_id = "wpn_fps_pis_beretta_primary"
	}
end
function UpgradesTweakData:_huntsman_definitions()
	self.definitions.huntsman = {
		category = "weapon",
		weapon_id = "huntsman",
		factory_id = "wpn_fps_shot_huntsman"
	}
end
function UpgradesTweakData:_r870_definitions()
	self.definitions.r870 = {
		category = "weapon",
		weapon_id = "r870",
		factory_id = "wpn_fps_shot_r870"
	}
end
function UpgradesTweakData:_serbu_definitions()
	self.definitions.serbu = {
		category = "weapon",
		weapon_id = "serbu",
		factory_id = "wpn_fps_shot_serbu"
	}
end
function UpgradesTweakData:_new_raging_bull_definitions()
	self.definitions.new_raging_bull = {
		category = "weapon",
		weapon_id = "new_raging_bull",
		factory_id = "wpn_fps_pis_rage"
	}
	self.definitions.raging_bull_primary = {
		category = "weapon",
		weapon_id = "raging_bull_primary",
		factory_id = "wpn_fps_pis_rage_primary"
	}
end
function UpgradesTweakData:_saw_definitions()
	self.definitions.saw = {
		category = "weapon",
		weapon_id = "saw",
		factory_id = "wpn_fps_saw"
	}
	self.definitions.saw_secondary = {
		category = "weapon",
		weapon_id = "saw_secondary",
		factory_id = "wpn_fps_saw_secondary"
	}
	self.definitions.saw_extra_ammo_multiplier = {
		category = "feature",
		name_id = "menu_saw_extra_ammo_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.saw_enemy_slicer = {
		category = "feature",
		name_id = "menu_saw_enemy_slicer",
		upgrade = {
			category = "saw",
			upgrade = "enemy_slicer",
			value = 1
		}
	}
	self.definitions.saw_recoil_multiplier = {
		category = "feature",
		name_id = "menu_saw_recoil_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_1 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_2 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 2
		}
	}
	self.definitions.saw_lock_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_lock_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 2
		}
	}
	self.definitions.saw_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_spread_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.saw_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_saw_armor_piercing_chance",
		upgrade = {
			category = "saw",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.saw_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_swap_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_reload_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_saw_melee_knockdown_mul",
		upgrade = {
			category = "saw",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
end
function UpgradesTweakData:_usp_definitions()
	self.definitions.usp = {
		category = "weapon",
		weapon_id = "usp",
		factory_id = "wpn_fps_pis_usp",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_g22c_definitions()
	self.definitions.g22c = {
		category = "weapon",
		weapon_id = "g22c",
		factory_id = "wpn_fps_pis_g22c",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_judge_definitions()
	self.definitions.judge = {
		category = "weapon",
		weapon_id = "judge",
		factory_id = "wpn_fps_pis_judge",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_m45_definitions()
	self.definitions.m45 = {
		category = "weapon",
		weapon_id = "m45",
		factory_id = "wpn_fps_smg_m45",
		dlc = "armored_transport"
	}
end
function UpgradesTweakData:_s552_definitions()
	self.definitions.s552 = {
		category = "weapon",
		weapon_id = "s552",
		factory_id = "wpn_fps_ass_s552",
		dlc = "armored_transport"
	}
	self.definitions.s552_secondary = {
		category = "weapon",
		weapon_id = "s552_secondary",
		factory_id = "wpn_fps_ass_s552_secondary",
		dlc = "armored_transport"
	}
end
function UpgradesTweakData:_ppk_definitions()
	self.definitions.ppk = {
		category = "weapon",
		weapon_id = "ppk",
		factory_id = "wpn_fps_pis_ppk",
		dlc = "armored_transport"
	}
end
function UpgradesTweakData:_mp7_definitions()
	self.definitions.mp7 = {
		category = "weapon",
		weapon_id = "mp7",
		factory_id = "wpn_fps_smg_mp7",
		dlc = "gage_pack"
	}
end
function UpgradesTweakData:_scar_definitions()
	self.definitions.scar = {
		category = "weapon",
		weapon_id = "scar",
		factory_id = "wpn_fps_ass_scar",
		dlc = "gage_pack"
	}
end
function UpgradesTweakData:_p226_definitions()
	self.definitions.p226 = {
		category = "weapon",
		weapon_id = "p226",
		factory_id = "wpn_fps_pis_p226",
		dlc = "gage_pack"
	}
end
function UpgradesTweakData:_hk21_definitions()
	self.definitions.hk21 = {
		category = "weapon",
		weapon_id = "hk21",
		factory_id = "wpn_fps_lmg_hk21",
		dlc = "gage_pack_lmg"
	}
end
function UpgradesTweakData:_m249_definitions()
	self.definitions.m249 = {
		category = "weapon",
		weapon_id = "m249",
		factory_id = "wpn_fps_lmg_m249",
		dlc = "gage_pack_lmg"
	}
end
function UpgradesTweakData:_rpk_definitions()
	self.definitions.rpk = {
		category = "weapon",
		weapon_id = "rpk",
		factory_id = "wpn_fps_lmg_rpk",
		dlc = "gage_pack_lmg"
	}
end
function UpgradesTweakData:_m95_definitions()
	self.definitions.m95 = {
		category = "weapon",
		weapon_id = "m95",
		factory_id = "wpn_fps_snp_m95",
		dlc = "gage_pack_snp"
	}
end
function UpgradesTweakData:_msr_definitions()
	self.definitions.msr = {
		category = "weapon",
		weapon_id = "msr",
		factory_id = "wpn_fps_snp_msr",
		dlc = "gage_pack_snp"
	}
end
function UpgradesTweakData:_r93_definitions()
	self.definitions.r93 = {
		category = "weapon",
		weapon_id = "r93",
		factory_id = "wpn_fps_snp_r93",
		dlc = "gage_pack_snp"
	}
end
function UpgradesTweakData:_fal_definitions()
	self.definitions.fal = {
		category = "weapon",
		weapon_id = "fal",
		factory_id = "wpn_fps_ass_fal",
		dlc = "big_bank"
	}
end
function UpgradesTweakData:_benelli_definitions()
	self.definitions.benelli = {
		category = "weapon",
		weapon_id = "benelli",
		factory_id = "wpn_fps_sho_ben",
		dlc = "gage_pack_shotgun"
	}
end
function UpgradesTweakData:_striker_definitions()
	self.definitions.striker = {
		category = "weapon",
		weapon_id = "striker",
		factory_id = "wpn_fps_sho_striker",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.striker_reload_speed_default = {
		category = "feature",
		name_id = "menu_reload_speed_multiplierr",
		upgrade = {
			category = "striker",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
end
function UpgradesTweakData:_ksg_definitions()
	self.definitions.ksg = {
		category = "weapon",
		weapon_id = "ksg",
		factory_id = "wpn_fps_sho_ksg",
		dlc = "gage_pack_shotgun"
	}
end
function UpgradesTweakData:_scorpion_definitions()
	self.definitions.scorpion = {
		category = "weapon",
		weapon_id = "scorpion",
		factory_id = "wpn_fps_smg_scorpion",
		dlc = "hl_miami"
	}
end
function UpgradesTweakData:_tec9_definitions()
	self.definitions.tec9 = {
		category = "weapon",
		weapon_id = "tec9",
		factory_id = "wpn_fps_smg_tec9",
		dlc = "hl_miami"
	}
end
function UpgradesTweakData:_uzi_definitions()
	self.definitions.uzi = {
		category = "weapon",
		weapon_id = "uzi",
		factory_id = "wpn_fps_smg_uzi",
		dlc = "hl_miami"
	}
end
function UpgradesTweakData:_gre_m79_definitions()
	self.definitions.gre_m79 = {
		category = "weapon",
		weapon_id = "gre_m79",
		factory_id = "wpn_fps_gre_m79",
		dlc = "gage_pack_assault"
	}
end
function UpgradesTweakData:_g3_definitions()
	self.definitions.g3 = {
		category = "weapon",
		weapon_id = "g3",
		factory_id = "wpn_fps_ass_g3",
		dlc = "gage_pack_assault"
	}
end
function UpgradesTweakData:_galil_definitions()
	self.definitions.galil = {
		category = "weapon",
		weapon_id = "galil",
		factory_id = "wpn_fps_ass_galil",
		dlc = "gage_pack_assault"
	}
end
function UpgradesTweakData:_famas_definitions()
	self.definitions.famas = {
		category = "weapon",
		weapon_id = "famas",
		factory_id = "wpn_fps_ass_famas",
		dlc = "gage_pack_assault"
	}
end
function UpgradesTweakData:_spas12_definitions()
	self.definitions.spas12 = {
		category = "weapon",
		weapon_id = "spas12",
		factory_id = "wpn_fps_sho_spas12",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_mg42_definitions()
	self.definitions.mg42 = {
		category = "weapon",
		weapon_id = "mg42",
		factory_id = "wpn_fps_lmg_mg42",
		dlc = "gage_pack_historical"
	}
end
function UpgradesTweakData:_c96_definitions()
	self.definitions.c96 = {
		category = "weapon",
		weapon_id = "c96",
		factory_id = "wpn_fps_pis_c96",
		dlc = "gage_pack_historical"
	}
end
function UpgradesTweakData:_sterling_definitions()
	self.definitions.sterling = {
		category = "weapon",
		weapon_id = "sterling",
		factory_id = "wpn_fps_smg_sterling",
		dlc = "gage_pack_historical"
	}
end
function UpgradesTweakData:_mosin_definitions()
	self.definitions.mosin = {
		category = "weapon",
		weapon_id = "mosin",
		factory_id = "wpn_fps_snp_mosin",
		dlc = "gage_pack_historical"
	}
end
function UpgradesTweakData:_m1928_definitions()
	self.definitions.m1928 = {
		category = "weapon",
		weapon_id = "m1928",
		factory_id = "wpn_fps_smg_thompson",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_l85a2_definitions()
	self.definitions.l85a2 = {
		category = "weapon",
		weapon_id = "l85a2",
		factory_id = "wpn_fps_ass_l85a2",
		dlc = "character_pack_clover"
	}
end
function UpgradesTweakData:_vhs_definitions()
	self.definitions.vhs = {
		category = "weapon",
		weapon_id = "vhs",
		factory_id = "wpn_fps_ass_vhs",
		dlc = "character_pack_dragan"
	}
end
function UpgradesTweakData:_hs2000_definitions()
	self.definitions.hs2000 = {
		category = "weapon",
		weapon_id = "hs2000",
		factory_id = "wpn_fps_pis_hs2000",
		dlc = "the_bomb"
	}
end
function UpgradesTweakData:_m134_weapon_definitions()
	self.definitions.m134 = {
		category = "weapon",
		weapon_id = "m134",
		factory_id = "wpn_fps_lmg_m134",
		dlc = "overkill_pack"
	}
end
function UpgradesTweakData:_rpg7_weapon_definitions()
	self.definitions.rpg7 = {
		category = "weapon",
		weapon_id = "rpg7",
		factory_id = "wpn_fps_rpg7",
		dlc = "overkill_pack"
	}
end
function UpgradesTweakData:_cobray_definitions()
	self.definitions.cobray = {
		category = "weapon",
		weapon_id = "cobray",
		factory_id = "wpn_fps_smg_cobray",
		dlc = "hlm2_deluxe"
	}
end
function UpgradesTweakData:_b682_weapon_definitions()
	self.definitions.b682 = {
		category = "weapon",
		weapon_id = "b682",
		factory_id = "wpn_fps_shot_b682",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_melee_weapon_definitions()
	self.definitions.weapon = {
		category = "melee_weapon"
	}
	self.definitions.fists = {
		category = "melee_weapon"
	}
	self.definitions.kabar = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.rambo = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.gerber = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.kampfmesser = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.brass_knuckles = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.tomahawk = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.baton = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.shovel = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.becker = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.moneybundle = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.barbedwire = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.x46 = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.dingdong = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.bayonet = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.bullseye = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.baseballbat = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.cleaver = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.fireaxe = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.machete = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.briefcase = {
		category = "melee_weapon",
		dlc = "hlm_game"
	}
	self.definitions.fairbair = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.freedom = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.model24 = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.swagger = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.alien_maul = {
		category = "melee_weapon",
		dlc = "alienware_alpha_promo"
	}
	self.definitions.shillelagh = {
		category = "melee_weapon",
		dlc = "character_pack_clover"
	}
	self.definitions.boxing_gloves = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.meat_cleaver = {
		category = "melee_weapon",
		dlc = "character_pack_dragan"
	}
	self.definitions.hammer = {
		category = "melee_weapon",
		dlc = "hlm2_deluxe"
	}
	self.definitions.whiskey = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.scalper = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.mining_pick = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.branding_iron = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.bowie = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.microphone = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.detector = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.micstand = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.oldbaton = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.switchblade = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.taser = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.slot_lever = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.croupier_rake = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.hockey = {
		category = "melee_weapon",
		dlc = "character_pack_sokol"
	}
	self.definitions.twins = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.cqc = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.tiger = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.fight = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.sandsteel = {
		category = "melee_weapon",
		dlc = "dragon"
	}
	self.definitions.great = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.beardy = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.buck = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.morning = {
		category = "melee_weapon",
		dlc = "steel"
	}
end
function UpgradesTweakData:_grenades_definitions()
	self.definitions.molotov = {category = "grenade", dlc = "bbq"}
	self.definitions.frag = {category = "grenade", dlc = "gage_pack"}
	self.definitions.dynamite = {category = "grenade", dlc = "west"}
	self.definitions.wpn_prj_four = {category = "grenade", dlc = "turtles"}
	self.definitions.wpn_prj_ace = {category = "grenade", dlc = "pd2_clan"}
	self.definitions.wpn_prj_jav = {category = "grenade", dlc = "steel"}
end
function UpgradesTweakData:_weapon_definitions()
	self.definitions.assault_rifle_move_spread_index_addend = {
		category = "feature",
		name_id = "menu_assault_rifle_move_spread_index_addend",
		upgrade = {
			category = "assault_rifle",
			upgrade = "move_spread_index_addend",
			value = 1
		}
	}
	self.definitions.snp_move_spread_index_addend = {
		category = "feature",
		name_id = "menu_snp_move_spread_index_addend",
		upgrade = {
			category = "snp",
			upgrade = "move_spread_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_silencer_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_silencer_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_spread_index_addend",
			value = 1
		}
	}
	self.definitions.pistol_spread_index_addend = {
		category = "feature",
		name_id = "menu_pistol_spread_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "spread_index_addend",
			value = 1
		}
	}
	self.definitions.akimbo_spread_index_addend = {
		category = "feature",
		name_id = "menu_akimbo_spread_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "spread_index_addend",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_spread_index_addend = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_spread_index_addend",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_spread_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_hip_fire_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_hip_fire_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "hip_fire_spread_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_single_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_single_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "single_spread_index_addend",
			value = 1
		}
	}
	self.definitions.shotgun_recoil_index_addend = {
		category = "feature",
		name_id = "menu_shotgun_recoil_index_addend",
		upgrade = {
			category = "shotgun",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.assault_rifle_recoil_index_addend = {
		category = "feature",
		name_id = "menu_assault_rifle_recoil_index_addend",
		upgrade = {
			category = "assault_rifle",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.lmg_recoil_index_addend = {
		category = "feature",
		name_id = "menu_lmg_recoil_index_addend",
		upgrade = {
			category = "lmg",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.snp_recoil_index_addend = {
		category = "feature",
		name_id = "menu_snp_recoil_index_addend",
		upgrade = {
			category = "snp",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_index_addend_1 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_index_addend_2 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_index_addend_3 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 3
		}
	}
	self.definitions.weapon_silencer_recoil_index_addend = {
		category = "feature",
		name_id = "menu_weapon_silencer_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_modded_damage_multiplier = {
		category = "feature",
		name_id = "menu_modded_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_modded_spread_multiplier = {
		category = "feature",
		name_id = "menu_modded_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_modded_recoil_multiplier = {
		category = "feature",
		name_id = "menu_modded_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_clip_ammo_increase_1 = {
		category = "feature",
		name_id = "menu_weapon_clip_ammo_increase_1",
		upgrade = {
			category = "weapon",
			upgrade = "clip_ammo_increase",
			value = 1
		}
	}
	self.definitions.weapon_clip_ammo_increase_2 = {
		category = "feature",
		name_id = "menu_weapon_clip_ammo_increase_2",
		upgrade = {
			category = "weapon",
			upgrade = "clip_ammo_increase",
			value = 2
		}
	}
	self.definitions.weapon_passive_swap_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_swap_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_swap_speed_multiplier",
			value = 2
		}
	}
	self.definitions.weapon_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_single_spread_multiplier = {
		category = "feature",
		name_id = "menu_weapon_single_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "single_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_silencer_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_spread_multiplier = {
		category = "feature",
		name_id = "menu_silencer_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_recoil_multiplier = {
		category = "feature",
		name_id = "menu_silencer_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_damage_multiplier_1 = {
		category = "feature",
		name_id = "silencer_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_damage_multiplier_2 = {
		category = "feature",
		name_id = "silencer_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_damage_multiplier",
			value = 2
		}
	}
	self.definitions.weapon_passive_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_reload_speed",
		upgrade = {
			category = "weapon",
			upgrade = "passive_reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_recoil_multiplier",
			value = 2
		}
	}
	self.definitions.weapon_passive_headshot_damage_multiplier = {
		category = "feature",
		name_id = "menu_weapon_headshot_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_headshot_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_damage_multiplier = {
		category = "feature",
		name_id = "menu_weapon_passive_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_special_damage_taken_multiplier = {
		category = "feature",
		name_id = "menu_weapon_special_damage_taken_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "special_damage_taken_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_spread_multiplier = {
		category = "feature",
		name_id = "menu_weapon_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_weapon_fire_rate_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
end
function UpgradesTweakData:_pistol_definitions()
	self.definitions.pistol_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_reload_speed",
		upgrade = {
			category = "pistol",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_spread_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_pistol_fire_rate_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_exit_run_speed_multiplier = {
		category = "feature",
		name_id = "menu_exit_run_speed_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "exit_run_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_hip_fire_spread_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_hip_fire_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_swap_speed_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_expire_t_1 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_expire_t",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_expire_t",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_expire_t_2 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_expire_t",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_expire_t",
			value = 2
		}
	}
	self.definitions.pistol_damage_addend = {
		category = "feature",
		name_id = "menu_pistol_damage_addend",
		upgrade = {
			category = "pistol",
			upgrade = "damage_addend",
			value = 1
		}
	}
end
function UpgradesTweakData:_assault_rifle_definitions()
	self.definitions.assault_rifle_recoil_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_recoil_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_reload_speed_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_move_spread_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_hip_fire_spread_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_hip_fire_damage_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_zoom_increase = {
		category = "feature",
		name_id = "menu_assault_rifle_zoom_increase",
		upgrade = {
			category = "assault_rifle",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end
function UpgradesTweakData:_lmg_definitions()
	self.definitions.lmg_recoil_multiplier = {
		category = "feature",
		name_id = "menu_lmg_recoil_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_lmg_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_lmg_reload_speed_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_lmg_move_spread_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_lmg_hip_fire_spread_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_lmg_hip_fire_damage_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_zoom_increase = {
		category = "feature",
		name_id = "menu_lmg_zoom_increase",
		upgrade = {
			category = "lmg",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end
function UpgradesTweakData:_snp_definitions()
	self.definitions.snp_recoil_multiplier = {
		category = "feature",
		name_id = "menu_snp_recoil_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.snp_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_snp_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.snp_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_snp_reload_speed_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.snp_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_snp_move_spread_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.snp_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_snp_hip_fire_spread_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.snp_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_snp_hip_fire_damage_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.snp_zoom_increase = {
		category = "feature",
		name_id = "menu_snp_zoom_increase",
		upgrade = {
			category = "snp",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end
function UpgradesTweakData:_smg_definitions()
	self.definitions.smg_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_reload_speed_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.smg_recoil_multiplier = {
		category = "feature",
		name_id = "menu_smg_recoil_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.smg_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_spread_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_damage_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
end
function UpgradesTweakData:_shotgun_definitions()
	self.definitions.shotgun_recoil_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_recoil_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_damage_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_damage_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_reload_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_spread_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_damage_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_consume_no_ammo_chance_1 = {
		category = "feature",
		name_id = "menu_shotgun_consume_no_ammo_chance",
		upgrade = {
			category = "shotgun",
			upgrade = "consume_no_ammo_chance",
			value = 1
		}
	}
	self.definitions.shotgun_consume_no_ammo_chance_2 = {
		category = "feature",
		name_id = "menu_shotgun_consume_no_ammo_chance",
		upgrade = {
			category = "shotgun",
			upgrade = "consume_no_ammo_chance",
			value = 2
		}
	}
	self.definitions.shotgun_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_shotgun_melee_knockdown_mul",
		upgrade = {
			category = "shotgun",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
end
function UpgradesTweakData:_carry_definitions()
	self.definitions.carry_movement_penalty_nullifier = {
		category = "feature",
		name_id = "menu_carry_movement_penalty_nullifier",
		upgrade = {
			category = "carry",
			upgrade = "movement_penalty_nullifier",
			value = 1
		}
	}
	self.definitions.carry_movement_speed_multiplier = {
		category = "feature",
		name_id = "menu_carry_movement_speed_multiplier",
		upgrade = {
			category = "carry",
			upgrade = "movement_speed_multiplier",
			value = 1
		}
	}
	self.definitions.carry_throw_distance_multiplier = {
		category = "feature",
		name_id = "menu_carry_throw_distance_multiplier",
		upgrade = {
			category = "carry",
			upgrade = "throw_distance_multiplier",
			value = 1
		}
	}
	self.definitions.carry_interact_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_carry_interact_speed_multiplierr",
		upgrade = {
			category = "carry",
			upgrade = "interact_speed_multiplier",
			value = 1
		}
	}
	self.definitions.carry_catch_interaction_speed_1 = {
		category = "feature",
		name_id = "menu_carry_catch_interaction_speed",
		upgrade = {
			category = "carry",
			upgrade = "catch_interaction_speed",
			value = 1
		}
	}
	self.definitions.carry_interact_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_carry_interact_speed_multiplierr",
		upgrade = {
			category = "carry",
			upgrade = "interact_speed_multiplier",
			value = 2
		}
	}
	self.definitions.carry_catch_interaction_speed_2 = {
		category = "feature",
		name_id = "menu_carry_catch_interaction_speed",
		upgrade = {
			category = "carry",
			upgrade = "catch_interaction_speed",
			value = 2
		}
	}
end
function UpgradesTweakData:_team_definitions()
	self.definitions.team_pistol_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_pistol_recoil_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_akimbo_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_weapon_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_weapon_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_pistol_suppression_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_pistol_suppression_recoil_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "suppression_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_akimbo_suppression_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_akimbo_suppression_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "suppression_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_weapon_suppression_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_weapon_suppression_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "suppression_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_pistol_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_pistol_suppression_recoil_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_akimbo_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_akimbo_suppression_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_pistol_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_pistol_recoil_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_akimbo_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_weapon_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_weapon_suppression_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_weapon_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_xp_multiplier = {
		category = "team",
		name_id = "menu_team_xp_multiplier",
		upgrade = {
			category = "xp",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.team_armor_regen_time_multiplier = {
		category = "team",
		name_id = "menu_team_armor_regen_time_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "regen_time_multiplier",
			value = 1
		}
	}
	self.definitions.team_passive_armor_regen_time_multiplier = {
		category = "team",
		name_id = "menu_team_armor_regen_time_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "passive_regen_time_multiplier",
			value = 1
		}
	}
	self.definitions.team_stamina_multiplier = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.team_passive_stamina_multiplier_1 = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "passive_multiplier",
			value = 1
		}
	}
	self.definitions.team_passive_stamina_multiplier_2 = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "passive_multiplier",
			value = 2
		}
	}
	self.definitions.team_passive_health_multiplier = {
		category = "team",
		name_id = "menu_team_health_multiplier",
		upgrade = {
			category = "health",
			upgrade = "passive_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_health_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_health_multiplier",
		upgrade = {
			category = "health",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_stamina_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
	self.definitions.team_clients_buy_assets = {
		category = "team",
		name_id = "menu_team_clients_buy_assets",
		upgrade = {
			category = "player",
			upgrade = "clients_buy_assets",
			value = 1
		}
	}
	self.definitions.team_move_spread_multiplier = {
		category = "team",
		name_id = "menu_team_move_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.team_civ_intimidation_mul = {
		category = "team",
		name_id = "menu_team_civ_intimidation_mul",
		upgrade = {
			category = "player",
			upgrade = "civ_intimidation_mul",
			value = 1
		}
	}
	self.definitions.team_xp_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_xp_stealth_multiplier",
		upgrade = {
			category = "xp",
			upgrade = "stealth_multiplier",
			value = 1
		}
	}
	self.definitions.team_cash_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_cash_stealth_multiplier",
		upgrade = {
			category = "cash",
			upgrade = "stealth_money_multiplier",
			value = 1
		}
	}
	self.definitions.team_bags_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_bags_stealth_multiplier",
		upgrade = {
			category = "cash",
			upgrade = "stealth_bags_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_damage_dampener_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_damage_dampener_multiplier",
		upgrade = {
			category = "damage_dampener",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
end
function UpgradesTweakData:_temporary_definitions()
	self.definitions.temporary_combat_medic_damage_multiplier1 = {
		incremental = true,
		category = "temporary",
		name_id = "menu_temporary_combat_medic_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_damage_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_combat_medic_damage_multiplier2 = {
		incremental = true,
		category = "temporary",
		name_id = "menu_temporary_combat_medic_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_damage_multiplier",
			value = 2
		}
	}
	self.definitions.temporary_combat_medic_enter_steelsight_speed_multiplier = {
		category = "temporary",
		name_id = "menu_temporary_combat_medic_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_revive_health_boost = {
		category = "temporary",
		name_id = "menu_temporary_revive_health_boost",
		upgrade = {
			category = "temporary",
			upgrade = "revive_health_boost",
			value = 1
		}
	}
	self.definitions.temporary_berserker_damage_multiplier_1 = {
		category = "temporary",
		name_id = "menu_temporary_berserker_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "berserker_damage_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_berserker_damage_multiplier_2 = {
		category = "temporary",
		name_id = "menu_temporary_berserker_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "berserker_damage_multiplier",
			value = 2
		}
	}
	self.definitions.temporary_no_ammo_cost_buff = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_buff",
		upgrade = {
			category = "temporary",
			upgrade = "no_ammo_cost_buff",
			value = 1
		}
	}
	self.definitions.temporary_no_ammo_cost_1 = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_1",
		upgrade = {
			category = "temporary",
			upgrade = "no_ammo_cost",
			value = 1
		}
	}
	self.definitions.temporary_no_ammo_cost_2 = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_2",
		upgrade = {
			category = "temporary",
			upgrade = "no_ammo_cost",
			value = 2
		}
	}
	self.definitions.temporary_first_aid_damage_reduction = {
		category = "temporary",
		name_id = "menu_temporary_first_aid_damage_reduction",
		upgrade = {
			category = "temporary",
			upgrade = "first_aid_damage_reduction",
			value = 1
		}
	}
	self.definitions.temporary_passive_revive_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_passive_revive_damage_reduction_1",
		upgrade = {
			category = "temporary",
			upgrade = "passive_revive_damage_reduction_1",
			value = 1
		}
	}
	self.definitions.temporary_passive_revive_damage_reduction_2 = {
		category = "feature",
		name_id = "menu_passive_revive_damage_reduction",
		upgrade = {
			category = "temporary",
			upgrade = "passive_revive_damage_reduction",
			value = 2
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_1 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 1
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_2 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 2
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_3 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 3
		}
	}
	self.definitions.temporary_loose_ammo_give_team = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_give_team",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_give_team",
			value = 1
		}
	}
end
function UpgradesTweakData:_shape_charge_definitions()
	self.definitions.shape_charge = {
		category = "equipment",
		equipment_id = "shape_charge",
		name_id = "menu_shape_charge"
	}
end
function UpgradesTweakData:_m4_definitions()
	self.definitions.m4 = {
		category = "weapon",
		weapon_id = "m4",
		unit_name = Idstring("units/weapons/m4_rifle/m4_rifle"),
		name_id = "debug_m4_rifle",
		title_id = "debug_m4_rifle_short",
		icon = "m4",
		image = "upgrades_m4",
		image_slice = "upgrades_m4_slice",
		unlock_lvl = 0,
		prio = "high",
		description_text_id = "des_m4"
	}
	for i, _ in ipairs(self.values.m4.clip_ammo_increase) do
		local depends_on = 0 < i - 1 and "m4_mag" .. i - 1 or "m4"
		local unlock_lvl = 3
		local prio = i == 1 and "high"
		self.definitions["m4_mag" .. i] = {
			tree = 3,
			step = self.steps.m4.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_m4_mag" .. i,
			title_id = "debug_m4_rifle_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m4.spread_multiplier) do
		local depends_on = 0 < i - 1 and "m4_spread" .. i - 1 or "m4"
		local unlock_lvl = 4
		local prio = i == 1 and "high"
		self.definitions["m4_spread" .. i] = {
			tree = 2,
			step = self.steps.m4.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m4_spread" .. i,
			title_id = "debug_m4_rifle_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m4.damage_multiplier) do
		local depends_on = 0 < i - 1 and "m4_damage" .. i - 1 or "m4"
		local unlock_lvl = 5
		local prio = i == 1 and "high"
		self.definitions["m4_damage" .. i] = {
			tree = 1,
			step = self.steps.m4.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m4_damage" .. i,
			title_id = "debug_m4_rifle_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_m14_definitions()
	self.definitions.m14 = {
		tree = 2,
		step = 17,
		category = "weapon",
		weapon_id = "m14",
		unit_name = Idstring("units/weapons/m14/m14"),
		name_id = "debug_m14",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_m14_short",
		icon = "m14",
		image = "upgrades_m14",
		image_slice = "upgrades_m14_slice",
		unlock_lvl = 101,
		prio = "high",
		description_text_id = "des_m14"
	}
	for i, _ in ipairs(self.values.m14.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "m14_mag" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"
		self.definitions["m14_mag" .. i] = {
			tree = 2,
			step = self.steps.m14.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_m14_mag" .. i,
			title_id = "debug_m14_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m14.spread_multiplier) do
		local depends_on = i - 1 > 0 and "m14_spread" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"
		self.definitions["m14_spread" .. i] = {
			tree = 2,
			step = self.steps.m14.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m14_spread" .. i,
			title_id = "debug_m14_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m14.damage_multiplier) do
		local depends_on = i - 1 > 0 and "m14_damage" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"
		self.definitions["m14_damage" .. i] = {
			tree = 2,
			step = self.steps.m14.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m14_damage" .. i,
			title_id = "debug_m14_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m14.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "m14_recoil" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"
		self.definitions["m14_recoil" .. i] = {
			tree = 2,
			step = self.steps.m14.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m14_recoil" .. i,
			title_id = "debug_m14_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_mp5_definitions()
	self.definitions.mp5 = {
		tree = 3,
		step = 21,
		category = "weapon",
		weapon_id = "mp5",
		unit_name = Idstring("units/weapons/mp5/mp5"),
		name_id = "debug_mp5",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_mp5_short",
		icon = "mp5",
		image = "upgrades_mp5",
		image_slice = "upgrades_mp5_slice",
		unlock_lvl = 6,
		prio = "high",
		description_text_id = "des_mp5"
	}
	for i, _ in ipairs(self.values.mp5.spread_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_spread" .. i - 1 or "mp5"
		local unlock_lvl = 7
		local prio = i == 1 and "high"
		self.definitions["mp5_spread" .. i] = {
			tree = 3,
			step = self.steps.mp5.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mp5_spread" .. i,
			title_id = "debug_mp5_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mp5.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_recoil" .. i - 1 or "mp5"
		local unlock_lvl = 8
		local prio = i == 1 and "high"
		self.definitions["mp5_recoil" .. i] = {
			tree = 3,
			step = self.steps.mp5.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mp5_recoil" .. i,
			title_id = "debug_mp5_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mp5.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_reload_speed" .. i - 1 or "mp5"
		local unlock_lvl = 9
		local prio = i == 1 and "high"
		self.definitions["mp5_reload_speed" .. i] = {
			tree = 3,
			step = self.steps.mp5.reload_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mp5_reload_speed" .. i,
			title_id = "debug_mp5_short",
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			description_text_id = "reload_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mp5.enter_steelsight_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_enter_steelsight_speed" .. i - 1 or "mp5"
		local unlock_lvl = 10
		local prio = i == 1 and "high"
		self.definitions["mp5_enter_steelsight_speed" .. i] = {
			tree = 3,
			step = self.steps.mp5.enter_steelsight_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mp5_enter_steelsight_speed" .. i,
			title_id = "debug_mp5_short",
			subtitle_id = "debug_upgrade_enter_steelsight_speed" .. i,
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			description_text_id = "enter_steelsight_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "enter_steelsight_speed_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_mac11_definitions()
	self.definitions.mac11 = {
		tree = 1,
		step = 5,
		category = "weapon",
		weapon_id = "mac11",
		unit_name = Idstring("units/weapons/mac11/mac11"),
		name_id = "debug_mac11",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_mac11_short",
		icon = "mac11",
		image = "upgrades_mac10",
		image_slice = "upgrades_mac10_slice",
		unlock_lvl = 81,
		prio = "high",
		description_text_id = "des_mac11"
	}
	for i, _ in ipairs(self.values.mac11.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mac11_recoil" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"
		self.definitions["mac11_recoil" .. i] = {
			tree = 1,
			step = self.steps.mac11.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mac11_recoil" .. i,
			title_id = "debug_mac11_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mac11.enter_steelsight_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mac11_enter_steelsight_speed" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"
		self.definitions["mac11_enter_steelsight_speed" .. i] = {
			tree = 1,
			step = self.steps.mac11.enter_steelsight_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mac11_enter_steelsight_speed" .. i,
			title_id = "debug_mac11_short",
			subtitle_id = "debug_upgrade_enter_steelsight_speed" .. i,
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			description_text_id = "enter_steelsight_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "enter_steelsight_speed_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mac11.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "mac11_mag" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"
		self.definitions["mac11_mag" .. i] = {
			tree = 1,
			step = self.steps.mac11.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_mac11_mag" .. i,
			title_id = "debug_mac11_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_remington_definitions()
	self.definitions.r870_shotgun = {
		tree = 3,
		step = 13,
		category = "weapon",
		weapon_id = "r870_shotgun",
		unit_name = Idstring("units/weapons/r870_shotgun/r870_shotgun"),
		name_id = "debug_r870_shotgun",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_r870_shotgun_short",
		icon = "r870_shotgun",
		image = "upgrades_remington",
		image_slice = "upgrades_remington_slice",
		unlock_lvl = 1,
		prio = "high",
		description_text_id = "des_r870_shotgun"
	}
	for i, _ in ipairs(self.values.r870_shotgun.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "remington_mag" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 2
		local prio = i == 1 and "high"
		self.definitions["remington_mag" .. i] = {
			tree = 3,
			step = self.steps.r870_shotgun.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_remington_mag" .. i,
			title_id = "debug_r870_shotgun_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.r870_shotgun.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "remington_recoil" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 3
		local prio = i == 1 and "high"
		self.definitions["remington_recoil" .. i] = {
			tree = 3,
			step = self.steps.r870_shotgun.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_remington_recoil" .. i,
			title_id = "debug_r870_shotgun_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.r870_shotgun.damage_multiplier) do
		local depends_on = i - 1 > 0 and "remington_damage" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 4
		local prio = i == 1 and "high"
		self.definitions["remington_damage" .. i] = {
			tree = 3,
			step = self.steps.r870_shotgun.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_remington_damage" .. i,
			title_id = "debug_r870_shotgun_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_mossberg_definitions()
	self.definitions.mossberg = {
		tree = 2,
		step = 7,
		category = "weapon",
		weapon_id = "mossberg",
		unit_name = Idstring("units/weapons/mossberg/mossberg"),
		name_id = "debug_mossberg",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_mossberg_short",
		icon = "mossberg",
		image = "upgrades_mossberg",
		image_slice = "upgrades_mossberg_slice",
		unlock_lvl = 120,
		prio = "high",
		description_text_id = "des_mossberg"
	}
	for i, _ in ipairs(self.values.mossberg.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "mossberg_mag" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"
		self.definitions["mossberg_mag" .. i] = {
			tree = 2,
			step = self.steps.mossberg.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_mossberg_mag" .. i,
			title_id = "debug_mossberg_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mossberg.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_reload_speed" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"
		self.definitions["mossberg_reload_speed" .. i] = {
			tree = 2,
			step = self.steps.mossberg.reload_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mossberg_reload_speed" .. i,
			title_id = "debug_mossberg_short",
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			description_text_id = "reload_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mossberg.fire_rate_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_fire_rate_multiplier" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"
		self.definitions["mossberg_fire_rate_multiplier" .. i] = {
			tree = 2,
			step = self.steps.mossberg.fire_rate_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mossberg_fire_rate" .. i,
			title_id = "debug_mossberg_short",
			subtitle_id = "debug_upgrade_fire_rate" .. i,
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			description_text_id = "fire_rate_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "fire_rate_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.mossberg.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_recoil_multiplier" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"
		self.definitions["mossberg_recoil_multiplier" .. i] = {
			tree = 2,
			step = self.steps.mossberg.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_mossberg_recoil_multiplier" .. i,
			title_id = "debug_mossberg_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_ak47_definitions()
	self.definitions.ak47 = {
		tree = 4,
		step = 9,
		category = "weapon",
		weapon_id = "ak47",
		unit_name = Idstring("units/weapons/ak47/ak"),
		name_id = "debug_ak47",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_ak47_short",
		icon = "ak",
		image = "upgrades_ak",
		image_slice = "upgrades_ak_slice",
		unlock_lvl = 0,
		prio = "high",
		description_text_id = "des_ak47"
	}
	for i, _ in ipairs(self.values.ak47.damage_multiplier) do
		local depends_on = 0 < i - 1 and "ak47_damage" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["ak47_damage" .. i] = {
			tree = 4,
			step = self.steps.ak47.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_ak47_damage" .. i,
			title_id = "debug_ak47_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.ak47.recoil_multiplier) do
		local depends_on = 0 < i - 1 and "ak47_recoil" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["ak47_recoil" .. i] = {
			tree = 4,
			step = self.steps.ak47.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_ak47_recoil" .. i,
			title_id = "debug_ak47_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.ak47.spread_multiplier) do
		local depends_on = 0 < i - 1 and "ak47_spread" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["ak47_spread" .. i] = {
			tree = 4,
			step = self.steps.ak47.spread_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_ak47_spread" .. i,
			title_id = "debug_ak47_short",
			subtitle_id = "debug_upgrade_spread" .. i,
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			description_text_id = "spread_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.ak47.clip_ammo_increase) do
		local depends_on = 0 < i - 1 and "ak47_mag" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["ak47_mag" .. i] = {
			tree = 4,
			step = self.steps.ak47.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_ak47_mag" .. i,
			title_id = "debug_ak47_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_glock_definitions()
	self.definitions.glock = {
		tree = 4,
		step = 2,
		category = "weapon",
		weapon_id = "glock",
		unit_name = Idstring("units/weapons/glock/glock"),
		name_id = "debug_glock",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_glock_short",
		icon = "glock",
		image = "upgrades_glock",
		image_slice = "upgrades_glock_slice",
		unlock_lvl = 0,
		prio = "high",
		description_text_id = "des_glock"
	}
	for i, _ in ipairs(self.values.glock.damage_multiplier) do
		local depends_on = 0 < i - 1 and "glock_damage" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["glock_damage" .. i] = {
			tree = 4,
			step = self.steps.glock.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_glock_damage" .. i,
			title_id = "debug_glock_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.glock.recoil_multiplier) do
		local depends_on = 0 < i - 1 and "glock_recoil" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["glock_recoil" .. i] = {
			tree = 4,
			step = self.steps.glock.recoil_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_glock_recoil" .. i,
			title_id = "debug_glock_short",
			subtitle_id = "debug_upgrade_recoil" .. i,
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			description_text_id = "recoil_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.glock.clip_ammo_increase) do
		local depends_on = 0 < i - 1 and "glock_mag" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["glock_mag" .. i] = {
			tree = 4,
			step = self.steps.glock.clip_ammo_increase[i],
			category = "feature",
			name_id = "debug_upgrade_glock_mag" .. i,
			title_id = "debug_glock_short",
			subtitle_id = "debug_upgrade_mag" .. i,
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			description_text_id = "clip_ammo_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.glock.reload_speed_multiplier) do
		local depends_on = 0 < i - 1 and "glock_reload_speed" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["glock_reload_speed" .. i] = {
			tree = 4,
			step = self.steps.glock.reload_speed_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_glock_reload_speed" .. i,
			title_id = "debug_glock_short",
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			description_text_id = "reload_speed_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_m79_definitions()
	self.definitions.m79 = {
		tree = 4,
		step = 21,
		category = "weapon",
		weapon_id = "m79",
		unit_name = Idstring("units/weapons/m79/m79"),
		name_id = "debug_m79",
		title_id = "debug_upgrade_new_weapon",
		subtitle_id = "debug_m79_short",
		icon = "m79",
		image = "upgrades_grenade",
		image_slice = "upgrades_grenade_slice",
		unlock_lvl = 0,
		prio = "high",
		description_text_id = "des_m79"
	}
	for i, _ in ipairs(self.values.m79.damage_multiplier) do
		local depends_on = 0 < i - 1 and "m79_damage" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["m79_damage" .. i] = {
			tree = 4,
			step = self.steps.m79.damage_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m79_damage" .. i,
			title_id = "debug_m79_short",
			subtitle_id = "debug_upgrade_damage" .. i,
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			description_text_id = "damage_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m79.explosion_range_multiplier) do
		local depends_on = 0 < i - 1 and "m79_expl_range" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["m79_expl_range" .. i] = {
			tree = 4,
			step = self.steps.m79.explosion_range_multiplier[i],
			category = "feature",
			name_id = "debug_upgrade_m79_expl_range" .. i,
			title_id = "debug_m79_short",
			subtitle_id = "debug_upgrade_expl_range" .. i,
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			description_text_id = "explosion_range_multiplier",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "explosion_range_multiplier",
				value = i
			}
		}
	end
	for i, _ in ipairs(self.values.m79.clip_amount_increase) do
		local depends_on = 0 < i - 1 and "m79_clip_num" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"
		self.definitions["m79_clip_num" .. i] = {
			tree = 4,
			step = self.steps.m79.clip_amount_increase[i],
			category = "feature",
			name_id = "debug_upgrade_m79_clip_num" .. i,
			title_id = "debug_m79_short",
			subtitle_id = "debug_upgrade_clip_num" .. i,
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			description_text_id = "clip_amount_increase",
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "clip_amount_increase",
				value = i
			}
		}
	end
end
function UpgradesTweakData:_akimbo_definitions()
	self.definitions.akimbo_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_damage_multiplier",
		incremental = true,
		upgrade = {
			category = "akimbo",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_damage_multiplier",
		incremental = true,
		upgrade = {
			category = "akimbo",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_extra_ammo_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_extra_ammo_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_extra_ammo_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_extra_ammo_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "extra_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_multiplier_3 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 3
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_3 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 3
		}
	}
	self.definitions.akimbo_clip_ammo_increase_1 = {
		category = "feature",
		name_id = "menu_akimbo_clip_ammo_increase_1",
		upgrade = {
			category = "akimbo",
			upgrade = "clip_ammo_increase",
			value = 1
		}
	}
	self.definitions.akimbo_clip_ammo_increase_2 = {
		category = "feature",
		name_id = "menu_akimbo_clip_ammo_increase_2",
		upgrade = {
			category = "akimbo",
			upgrade = "clip_ammo_increase",
			value = 2
		}
	}
	self.definitions.akimbo_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_reload_speed",
		upgrade = {
			category = "akimbo",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_spread_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_swap_speed_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_pistol_fire_rate_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_damage_addend = {
		category = "feature",
		name_id = "menu_akimbo_damage_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "damage_addend",
			value = 1
		}
	}
end
function UpgradesTweakData:_first_aid_kit_definitions()
	self.definitions.first_aid_kit = {
		category = "equipment",
		equipment_id = "first_aid_kit",
		name_id = "menu_equipment_first_aid_kit",
		slot = 1
	}
	self.definitions.first_aid_kit_quantity_increase_1 = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_quantity_1",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.first_aid_kit_quantity_increase_2 = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_quantity_2",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.first_aid_kit_deploy_time_multiplier = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_deploy_time_multiplier",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.first_aid_kit_damage_reduction_upgrade = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_damage_reduction_upgrade",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "damage_reduction_upgrade",
			value = 1
		}
	}
	self.definitions.first_aid_kit_downs_restore_chance = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_downs_restore_chance",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "downs_restore_chance",
			value = 1
		}
	}
end
function UpgradesTweakData:_bodybags_bag_definitions()
	self.definitions.bodybags_bag = {
		category = "equipment",
		equipment_id = "bodybags_bag",
		name_id = "menu_equipment_bodybags_bag",
		slot = 1
	}
	self.definitions.bodybags_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_bodybags_bag_quantity",
		upgrade = {
			category = "bodybags_bag",
			upgrade = "quantity",
			value = 1
		}
	}
end
function UpgradesTweakData:_jowi_definitions()
	self.definitions.jowi = {
		category = "weapon",
		weapon_id = "jowi",
		factory_id = "wpn_fps_jowi"
	}
end
function UpgradesTweakData:_x_1911_definitions()
	self.definitions.x_1911 = {
		category = "weapon",
		weapon_id = "x_1911",
		factory_id = "wpn_fps_x_1911"
	}
end
function UpgradesTweakData:_x_b92fs_definitions()
	self.definitions.x_b92fs = {
		category = "weapon",
		weapon_id = "x_b92fs",
		factory_id = "wpn_fps_x_b92fs"
	}
end
function UpgradesTweakData:_x_deagle_definitions()
	self.definitions.x_deagle = {
		category = "weapon",
		weapon_id = "x_deagle",
		factory_id = "wpn_fps_x_deagle"
	}
end
function UpgradesTweakData:_g26_definitions()
	self.definitions.g26 = {
		category = "weapon",
		weapon_id = "g26",
		factory_id = "wpn_fps_pis_g26",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_kabartanto_definitions()
	self.definitions.kabartanto = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_toothbrush_definitions()
	self.definitions.toothbrush = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_chef_definitions()
	self.definitions.chef = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
end
function UpgradesTweakData:_x_g22c_definitions()
	self.definitions.x_g22c = {
		category = "weapon",
		weapon_id = "x_g22c",
		factory_id = "wpn_fps_pis_x_g22c"
	}
end
function UpgradesTweakData:_x_g17_definitions()
	self.definitions.x_g17 = {
		category = "weapon",
		weapon_id = "x_g17",
		factory_id = "wpn_fps_pis_x_g17"
	}
end
function UpgradesTweakData:_x_usp_definitions()
	self.definitions.x_usp = {
		category = "weapon",
		weapon_id = "x_usp",
		factory_id = "wpn_fps_pis_x_usp"
	}
end
function UpgradesTweakData:_flamethrower_mk2_definitions()
	self.definitions.flamethrower_mk2 = {
		category = "weapon",
		weapon_id = "flamethrower_mk2",
		factory_id = "wpn_fps_fla_mk2",
		dlc = "bbq"
	}
end
function UpgradesTweakData:_m32_definitions()
	self.definitions.m32 = {
		category = "weapon",
		weapon_id = "m32",
		factory_id = "wpn_fps_gre_m32",
		dlc = "bbq"
	}
end
function UpgradesTweakData:_aa12_definitions()
	self.definitions.aa12 = {
		category = "weapon",
		weapon_id = "aa12",
		factory_id = "wpn_fps_sho_aa12",
		dlc = "bbq"
	}
end
function UpgradesTweakData:_bbq_weapon_definitions()
	self.definitions.fork = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.spatula = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.poker = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.tenderizer = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.flame_bullet = {}
	self.flame_bullet.show_blood_hits = false
end
function UpgradesTweakData:_peacemaker_definitions()
	self.definitions.peacemaker = {
		category = "weapon",
		weapon_id = "peacemaker",
		factory_id = "wpn_fps_pis_peacemaker",
		dlc = "west"
	}
end
function UpgradesTweakData:_winchester1874_definitions()
	self.definitions.winchester1874 = {
		category = "weapon",
		weapon_id = "winchester1874",
		factory_id = "wpn_fps_snp_winchester",
		dlc = "west"
	}
end
function UpgradesTweakData:_plainsrider_definitions()
	self.definitions.plainsrider = {
		category = "weapon",
		weapon_id = "plainsrider",
		factory_id = "wpn_fps_bow_plainsrider",
		dlc = "west"
	}
end
function UpgradesTweakData:_mateba_definitions()
	self.definitions.mateba = {
		category = "weapon",
		weapon_id = "mateba",
		factory_id = "wpn_fps_pis_2006m",
		dlc = "arena"
	}
end
function UpgradesTweakData:_asval_definitions()
	self.definitions.asval = {
		category = "weapon",
		weapon_id = "asval",
		factory_id = "wpn_fps_ass_asval",
		dlc = "character_pack_sokol"
	}
end
function UpgradesTweakData:_sub2000_definitions()
	self.definitions.sub2000 = {
		category = "weapon",
		weapon_id = "sub2000",
		factory_id = "wpn_fps_ass_sub2000",
		dlc = "kenaz"
	}
end
function UpgradesTweakData:_wa2000_definitions()
	self.definitions.wa2000 = {
		category = "weapon",
		weapon_id = "wa2000",
		factory_id = "wpn_fps_snp_wa2000",
		dlc = "turtles"
	}
end
function UpgradesTweakData:_polymer_definitions()
	self.definitions.polymer = {
		category = "weapon",
		weapon_id = "polymer",
		factory_id = "wpn_fps_smg_polymer",
		dlc = "turtles"
	}
end
function UpgradesTweakData:_hunter_definitions()
	self.definitions.hunter = {
		category = "weapon",
		weapon_id = "hunter",
		factory_id = "wpn_fps_bow_hunter",
		dlc = "turtles"
	}
end
function UpgradesTweakData:_baka_definitions()
	self.definitions.baka = {
		category = "weapon",
		weapon_id = "baka",
		factory_id = "wpn_fps_smg_baka",
		dlc = "dragon"
	}
end
function UpgradesTweakData:_arblast_weapon_definitions()
	self.definitions.arblast = {
		category = "weapon",
		weapon_id = "arblast",
		factory_id = "wpn_fps_bow_arblast",
		dlc = "steel"
	}
end
function UpgradesTweakData:_frankish_weapon_definitions()
	self.definitions.frankish = {
		category = "weapon",
		weapon_id = "frankish",
		factory_id = "wpn_fps_bow_frankish",
		dlc = "steel"
	}
end
function UpgradesTweakData:_long_weapon_definitions()
	self.definitions.long = {
		category = "weapon",
		weapon_id = "long",
		factory_id = "wpn_fps_bow_long",
		dlc = "steel"
	}
end
