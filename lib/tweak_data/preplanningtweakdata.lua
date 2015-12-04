PrePlanningTweakData = PrePlanningTweakData or class()
function PrePlanningTweakData:get_custom_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 48,
		y * 48,
		48,
		48
	}
end
function PrePlanningTweakData:get_category_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 64,
		y * 64,
		64,
		64
	}
end
function PrePlanningTweakData:get_type_texture_rect(num)
	if not num then
		return
	end
	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1
	return {
		x * 48,
		y * 48,
		48,
		48
	}
end
function PrePlanningTweakData:init(tweak_data)
	self:_create_locations(tweak_data)
	self.plans = {}
	self.plans.escape_plan = {}
	self.plans.escape_plan.category = "escape_plan"
	self.plans.vault_plan = {}
	self.plans.vault_plan.category = "vault_plan"
	self.plans.plan_of_action = {}
	self.plans.plan_of_action.category = "plan_of_action"
	self.plans.entry_plan = {}
	self.plans.entry_plan.category = "entry_plan"
	self.gui = {}
	self.gui.custom_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.type_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.category_icons_path = "guis/dlcs/big_bank/textures/pd2/pre_planning/preplan_icon_frames"
	self.gui.category_icons_bg = 42
	self.gui.MAX_DRAW_POINTS = 1000
	self.categories = {}
	self.categories.default = {}
	self.categories.default.name_id = "menu_pp_cat_default"
	self.categories.default.desc_id = "menu_pp_cat_default_desc"
	self.categories.default.icon = 32
	self.categories.default.prio = 0
	self.categories.dead_drop = {}
	self.categories.dead_drop.name_id = "menu_pp_cat_dead_drop"
	self.categories.dead_drop.desc_id = "menu_pp_cat_dead_drop_desc"
	self.categories.dead_drop.icon = 22
	self.categories.dead_drop.prio = 5
	self.categories.mission_equipment = {}
	self.categories.mission_equipment.name_id = "menu_pp_cat_mission_equipment"
	self.categories.mission_equipment.desc_id = "menu_pp_cat_mission_equipment_desc"
	self.categories.mission_equipment.icon = 11
	self.categories.mission_equipment.prio = 0
	self.categories.insider_help = {}
	self.categories.insider_help.name_id = "menu_pp_cat_insider_help"
	self.categories.insider_help.desc_id = "menu_pp_cat_insider_help_desc"
	self.categories.insider_help.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.categories.insider_help.icon = 21
	self.categories.insider_help.prio = 2
	self.categories.data_hacking = {}
	self.categories.data_hacking.name_id = "menu_pp_cat_data_hacking"
	self.categories.data_hacking.desc_id = "menu_pp_cat_data_hacking_desc"
	self.categories.data_hacking.icon = 31
	self.categories.data_hacking.prio = 3
	self.categories.hired_help = {}
	self.categories.hired_help.name_id = "menu_pp_cat_hired_help"
	self.categories.hired_help.desc_id = "menu_pp_cat_hired_help_desc"
	self.categories.hired_help.icon = 41
	self.categories.hired_help.prio = 1
	self.categories.surveillance = {}
	self.categories.surveillance.name_id = "menu_pp_cat_surveillance"
	self.categories.surveillance.desc_id = "menu_pp_cat_surveillance_desc"
	self.categories.surveillance.icon = 41
	self.categories.surveillance.prio = 4
	self.categories.vault_plan = {}
	self.categories.vault_plan.name_id = "menu_pp_cat_vault_plan"
	self.categories.vault_plan.desc_id = "menu_pp_cat_vault_plan_desc"
	self.categories.vault_plan.plan = "vault_plan"
	self.categories.vault_plan.icon = 11
	self.categories.vault_plan.prio = 2
	self.categories.escape_plan = {}
	self.categories.escape_plan.name_id = "menu_pp_cat_escape_plan"
	self.categories.escape_plan.desc_id = "menu_pp_cat_escape_plan_desc"
	self.categories.escape_plan.plan = "escape_plan"
	self.categories.escape_plan.icon = 12
	self.categories.escape_plan.total = 1
	self.categories.escape_plan.prio = 1
	self.categories.plan_of_action = {}
	self.categories.plan_of_action.name_id = "menu_pp_cat_plan_of_action"
	self.categories.plan_of_action.desc_id = "menu_pp_cat_plan_of_action_desc"
	self.categories.plan_of_action.plan = "plan_of_action"
	self.categories.plan_of_action.icon = 12
	self.categories.plan_of_action.total = 1
	self.categories.plan_of_action.prio = 1
	self.categories.entry_plan = {}
	self.categories.entry_plan.name_id = "menu_pp_cat_entry_plan"
	self.categories.entry_plan.desc_id = "menu_pp_cat_entry_plan_desc"
	self.categories.entry_plan.plan = "entry_plan"
	self.categories.entry_plan.icon = 12
	self.categories.entry_plan.total = 1
	self.categories.entry_plan.prio = 1
	self.categories.BFD_upgrades = {}
	self.categories.BFD_upgrades.name_id = "menu_pp_cat_BFD_upgrades"
	self.categories.BFD_upgrades.desc_id = "menu_pp_cat_BFD_upgrades_desc"
	self.categories.BFD_upgrades.icon = 12
	self.categories.BFD_upgrades.prio = 1
	self.categories.BFD_attachments = {}
	self.categories.BFD_attachments.name_id = "menu_pp_cat_BFD_attachments"
	self.categories.BFD_attachments.desc_id = "menu_pp_cat_BFD_attachments_desc"
	self.categories.BFD_attachments.icon = 12
	self.categories.BFD_attachments.prio = 1
	self.types = {}
	self.types.ammo_bag = {}
	self.types.ammo_bag.name_id = "menu_pp_asset_ammo"
	self.types.ammo_bag.desc_id = "menu_pp_asset_ammo_desc"
	self.types.ammo_bag.deployable_id = "ammo_bag"
	self.types.ammo_bag.icon = 52
	self.types.ammo_bag.category = "dead_drop"
	self.types.ammo_bag.total = 2
	self.types.ammo_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.ammo_bag.budget_cost = 2
	self.types.ammo_bag.post_event = "gus_preplan_05"
	self.types.ammo_bag.prio = 5
	self.types.health_bag = {}
	self.types.health_bag.name_id = "menu_pp_asset_health"
	self.types.health_bag.desc_id = "menu_pp_asset_health_desc"
	self.types.health_bag.deployable_id = "doctor_bag"
	self.types.health_bag.icon = 31
	self.types.health_bag.category = "dead_drop"
	self.types.health_bag.total = 2
	self.types.health_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.health_bag.budget_cost = 2
	self.types.health_bag.post_event = "gus_preplan_06"
	self.types.health_bag.prio = 6
	self.types.bodybags_bag = {}
	self.types.bodybags_bag.name_id = "menu_pp_asset_bodybags_bag"
	self.types.bodybags_bag.desc_id = "menu_pp_asset_bodybags_bag_desc"
	self.types.bodybags_bag.deployable_id = "bodybags_bag"
	self.types.bodybags_bag.icon = 13
	self.types.bodybags_bag.category = "dead_drop"
	self.types.bodybags_bag.upgrade_lock = {
		category = "player",
		upgrade = "buy_bodybags_asset"
	}
	self.types.bodybags_bag.total = 2
	self.types.bodybags_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.bodybags_bag.budget_cost = 2
	self.types.bodybags_bag.post_event = "gus_preplan_15"
	self.types.bodybags_bag.prio = 3
	self.types.grenade_crate = {}
	self.types.grenade_crate.name_id = "menu_pp_asset_grenade_crate"
	self.types.grenade_crate.desc_id = "menu_pp_asset_grenade_crate_desc"
	self.types.grenade_crate.deployable_id = "grenade_crate"
	self.types.grenade_crate.icon = 21
	self.types.grenade_crate.category = "dead_drop"
	self.types.grenade_crate.dlc_lock = "gage_pack"
	self.types.grenade_crate.total = 2
	self.types.grenade_crate.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.grenade_crate.budget_cost = 2
	self.types.grenade_crate.post_event = "gus_preplan_15"
	self.types.grenade_crate.prio = 4
	self.types.grenade_crate.progress_stat = "gage_10_stats"
	self.types.car = {}
	self.types.car.name_id = "menu_asset_car"
	self.types.car.total = 1
	self.types.drill_parts = {}
	self.types.drill_parts.name_id = "menu_pp_asset_drill_parts"
	self.types.drill_parts.desc_id = "menu_pp_asset_drill_parts_desc"
	self.types.drill_parts.category = "dead_drop"
	self.types.drill_parts.icon = 12
	self.types.drill_parts.total = 1
	self.types.drill_parts.post_event = "gus_preplan_16"
	self.types.drill_parts.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.drill_parts.budget_cost = 3
	self.types.drill_parts.prio = 2
	self.types.zipline = {}
	self.types.zipline.name_id = "menu_pp_asset_zipline"
	self.types.zipline.desc_id = "menu_pp_asset_zipline_desc"
	self.types.zipline.category = "mission_equipment"
	self.types.zipline.icon = 23
	self.types.zipline.total = 1
	self.types.zipline.post_event = "gus_preplan_07"
	self.types.zipline.prio = 1
	self.types.zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.zipline.budget_cost = 2
	self.types.zipline_generic = deep_clone(self.types.zipline)
	self.types.zipline_generic.desc_id = "menu_pp_asset_zipline_generic_desc"
	self.types.unlocked_door = {}
	self.types.unlocked_door.name_id = "menu_pp_asset_unlocked_door"
	self.types.unlocked_door.desc_id = "menu_pp_asset_unlocked_door_desc"
	self.types.unlocked_door.category = "mission_equipment"
	self.types.unlocked_door.icon = 41
	self.types.unlocked_door.total = 1
	self.types.unlocked_door.post_event = "gus_preplan_07"
	self.types.unlocked_door.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.unlocked_door.budget_cost = 1
	self.types.unlocked_door.prio = 2
	self.types.unlocked_window = {}
	self.types.unlocked_window.name_id = "menu_pp_asset_unlocked_window"
	self.types.unlocked_window.desc_id = "menu_pp_asset_unlocked_window_desc"
	self.types.unlocked_window.category = "mission_equipment"
	self.types.unlocked_window.icon = 41
	self.types.unlocked_window.total = 5
	self.types.unlocked_window.post_event = "gus_preplan_07"
	self.types.unlocked_window.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_window")
	self.types.unlocked_window.budget_cost = 1
	self.types.unlocked_window.prio = 2
	self.types.highlight_keybox = {}
	self.types.highlight_keybox.name_id = "menu_pp_asset_highlight_keybox"
	self.types.highlight_keybox.desc_id = "menu_pp_asset_highlight_keybox_desc"
	self.types.highlight_keybox.category = "mission_equipment"
	self.types.highlight_keybox.icon = 43
	self.types.highlight_keybox.total = 1
	self.types.highlight_keybox.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_highlight_keybox")
	self.types.highlight_keybox.budget_cost = 2
	self.types.highlight_keybox.post_event = "gus_preplan_16"
	self.types.highlight_keybox.prio = 2
	self.types.ladder = {}
	self.types.ladder.name_id = "menu_pp_asset_ladder"
	self.types.ladder.category = "mission_equipment"
	self.types.ladder.total = 1
	self.types.ladder.post_event = "gus_preplan_07"
	self.types.ladder.prio = 2
	self.types.disable_camera = {}
	self.types.disable_camera.name_id = "menu_pp_asset_disable_camera"
	self.types.disable_camera.category = "surveillance"
	self.types.disable_camera.total = 1
	self.types.disable_camera.post_event = "gus_preplan_08"
	self.types.disable_camera.prio = 2
	self.types.disable_metal_detector = {}
	self.types.disable_metal_detector.name_id = "menu_pp_asset_disable_metal_detector"
	self.types.disable_metal_detector.category = "insider_help"
	self.types.disable_metal_detector.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_metal_detector.total = 1
	self.types.disable_metal_detector.post_event = "gus_preplan_10"
	self.types.disable_metal_detector.prio = 3
	self.types.disable_guards_cake = {}
	self.types.disable_guards_cake.name_id = "menu_pp_asset_disable_guards_cake"
	self.types.disable_guards_cake.desc_id = "menu_pp_asset_disable_guards_cake_desc"
	self.types.disable_guards_cake.category = "insider_help"
	self.types.disable_guards_cake.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_guards_cake.icon = 25
	self.types.disable_guards_cake.total = 1
	self.types.disable_guards_cake.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_cake")
	self.types.disable_guards_cake.budget_cost = 3
	self.types.disable_guards_cake.post_event = "gus_preplan_09"
	self.types.disable_guards_cake.prio = 1
	self.types.extra_cameras = {}
	self.types.extra_cameras.name_id = "menu_pp_asset_extra_cameras"
	self.types.extra_cameras.desc_id = "menu_pp_asset_extra_cameras_desc"
	self.types.extra_cameras.category = "surveillance"
	self.types.extra_cameras.look_angle = {
		angle = 80,
		color = Color(192, 255, 170, 0) / 255,
		length = 0.3
	}
	self.types.extra_cameras.icon = 11
	self.types.extra_cameras.total = 9
	self.types.extra_cameras.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_extracameras")
	self.types.extra_cameras.budget_cost = 1
	self.types.extra_cameras.post_event = "gus_preplan_16"
	self.types.extra_cameras.prio = 2
	self.types.keycard = {}
	self.types.keycard.name_id = "menu_pp_asset_keycard"
	self.types.keycard.desc_id = "menu_pp_asset_keycard_desc"
	self.types.keycard.category = "insider_help"
	self.types.keycard.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.keycard.icon = 53
	self.types.keycard.total = 1
	self.types.keycard.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_keycard")
	self.types.keycard.budget_cost = 2
	self.types.keycard.post_event = "gus_preplan_16"
	self.types.keycard.prio = 2
	self.types.camera_access = {}
	self.types.camera_access.name_id = "menu_pp_camera_access"
	self.types.camera_access.desc_id = "menu_pp_camera_access_desc"
	self.types.camera_access.category = "surveillance"
	self.types.camera_access.icon = 24
	self.types.camera_access.total = 1
	self.types.camera_access.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_accesscameras")
	self.types.camera_access.budget_cost = 2
	self.types.camera_access.post_event = "gus_preplan_16"
	self.types.camera_access.prio = 8
	self.types.delay_police_10 = {}
	self.types.delay_police_10.name_id = "menu_pp_asset_delay_police_10"
	self.types.delay_police_10.desc_id = "menu_pp_asset_delay_police_10_desc"
	self.types.delay_police_10.delay_weapons_hot_t = 10
	self.types.delay_police_10.icon = 42
	self.types.delay_police_10.category = "data_hacking"
	self.types.delay_police_10.total = 1
	self.types.delay_police_10.post_event = "gus_preplan_04"
	self.types.delay_police_10.prio = 7
	self.types.delay_police_10_no_pos = deep_clone(self.types.delay_police_10)
	self.types.delay_police_10_no_pos.budget_cost = 1
	self.types.delay_police_10_no_pos.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay10")
	self.types.delay_police_10_no_pos.pos_not_important = true
	self.types.delay_police_20 = {}
	self.types.delay_police_20.name_id = "menu_pp_asset_delay_police_20"
	self.types.delay_police_20.desc_id = "menu_pp_asset_delay_police_20_desc"
	self.types.delay_police_20.delay_weapons_hot_t = 20
	self.types.delay_police_20.icon = 42
	self.types.delay_police_20.category = "data_hacking"
	self.types.delay_police_20.total = 1
	self.types.delay_police_20.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay20")
	self.types.delay_police_20.budget_cost = 1
	self.types.delay_police_20.post_event = "gus_preplan_04"
	self.types.delay_police_20.prio = 6
	self.types.delay_police_30 = {}
	self.types.delay_police_30.name_id = "menu_pp_asset_delay_police_30"
	self.types.delay_police_30.desc_id = "menu_pp_asset_delay_police_30_desc"
	self.types.delay_police_30.delay_weapons_hot_t = 30
	self.types.delay_police_30.icon = 42
	self.types.delay_police_30.category = "data_hacking"
	self.types.delay_police_30.total = 1
	self.types.delay_police_30.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay30")
	self.types.delay_police_30.budget_cost = 2
	self.types.delay_police_30.post_event = "gus_preplan_10"
	self.types.delay_police_30.prio = 5
	self.types.delay_police_30_no_pos = deep_clone(self.types.delay_police_30)
	self.types.delay_police_30_no_pos.pos_not_important = true
	self.types.delay_police_60 = {}
	self.types.delay_police_60.name_id = "menu_pp_asset_delay_police_60"
	self.types.delay_police_60.desc_id = "menu_pp_asset_delay_police_60_desc"
	self.types.delay_police_60.delay_weapons_hot_t = 60
	self.types.delay_police_60.icon = 42
	self.types.delay_police_60.category = "data_hacking"
	self.types.delay_police_60.total = 1
	self.types.delay_police_60.budget_cost = 4
	self.types.delay_police_60.post_event = "gus_preplan_04"
	self.types.delay_police_60.prio = 4
	self.types.reduce_timelock_60 = {}
	self.types.reduce_timelock_60.name_id = "menu_pp_asset_reduce_timelock_60"
	self.types.reduce_timelock_60.desc_id = "menu_pp_asset_reduce_timelock_60_desc"
	self.types.reduce_timelock_60.reduce_timelock_t = 60
	self.types.reduce_timelock_60.icon = 15
	self.types.reduce_timelock_60.category = "data_hacking"
	self.types.reduce_timelock_60.total = 1
	self.types.reduce_timelock_60.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_timelock60")
	self.types.reduce_timelock_60.budget_cost = 2
	self.types.reduce_timelock_60.post_event = "gus_preplan_10"
	self.types.reduce_timelock_60.prio = 3
	self.types.reduce_timelock_120 = {}
	self.types.reduce_timelock_120.name_id = "menu_pp_asset_reduce_timelock_120"
	self.types.reduce_timelock_120.desc_id = "menu_pp_asset_reduce_timelock_120_desc"
	self.types.reduce_timelock_120.reduce_timelock_t = 120
	self.types.reduce_timelock_120.icon = 15
	self.types.reduce_timelock_120.category = "data_hacking"
	self.types.reduce_timelock_120.total = 1
	self.types.reduce_timelock_120.budget_cost = 4
	self.types.reduce_timelock_120.post_event = "gus_preplan_10"
	self.types.reduce_timelock_120.prio = 2
	self.types.reduce_timelock_240 = {}
	self.types.reduce_timelock_240.name_id = "menu_pp_asset_reduce_timelock_240"
	self.types.reduce_timelock_240.desc_id = "menu_pp_asset_reduce_timelock_240_desc"
	self.types.reduce_timelock_240.reduce_timelock_t = 240
	self.types.reduce_timelock_240.icon = 15
	self.types.reduce_timelock_240.category = "data_hacking"
	self.types.reduce_timelock_240.total = 1
	self.types.reduce_timelock_240.budget_cost = 6
	self.types.reduce_timelock_240.post_event = "gus_preplan_10"
	self.types.reduce_timelock_240.prio = 1
	self.types.spycam = {}
	self.types.spycam.name_id = "menu_asset_spycam"
	self.types.spycam.desc_id = "menu_asset_spycam_desc"
	self.types.spycam.category = "surveillance"
	self.types.spycam.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spycam.look_angle = {
		angle = 80,
		color = Color(192, 255, 51, 51) / 255,
		length = 0.5
	}
	self.types.spycam.icon = 35
	self.types.spycam.total = 3
	self.types.spycam.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_spycam")
	self.types.spycam.budget_cost = 2
	self.types.spycam.post_event = "gus_preplan_14"
	self.types.spycam.prio = 3
	self.types.spotter = {}
	self.types.spotter.name_id = "menu_asset_spotter"
	self.types.spotter.category = "hired_help"
	self.types.spotter.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spotter.look_angle = {
		angle = 80,
		color = Color(192, 255, 51, 51) / 255,
		length = 0.5
	}
	self.types.spotter.icon = 33
	self.types.spotter.total = 1
	self.types.spotter.budget_cost = 2
	self.types.spotter.post_event = "gus_preplan_13"
	self.types.spotter.prio = 4
	self.types.spotter_des = deep_clone(self.types.spotter)
	self.types.spotter_des.budget_cost = 3
	self.types.spotter_des.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_spotter")
	self.types.spotter_des.desc_id = "menu_pp_asset_spotter_desc"
	self.types.sniper = {}
	self.types.sniper.name_id = "menu_pp_asset_sniper"
	self.types.sniper.desc_id = "menu_pp_asset_sniper_desc"
	self.types.sniper.category = "hired_help"
	self.types.sniper.icon = 55
	self.types.sniper.total = 1
	self.types.sniper.post_event = "gus_preplan_13"
	self.types.sniper.prio = 1
	self.types.sniper.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_sniper")
	self.types.sniper.budget_cost = 1
	self.types.delayed_police = {}
	self.types.delayed_police.name_id = "menu_pp_asset_delayed_police"
	self.types.delayed_police.desc_id = "menu_pp_asset_delayed_police_desc"
	self.types.delayed_police.category = "hired_help"
	self.types.delayed_police.icon = 15
	self.types.delayed_police.total = 1
	self.types.delayed_police.post_event = "gus_preplan_13"
	self.types.delayed_police.prio = 1
	self.types.delayed_police.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_delayed_police")
	self.types.delayed_police.budget_cost = 1
	self.types.reduce_mobsters = {}
	self.types.reduce_mobsters.name_id = "menu_pp_asset_reduce_mobsters"
	self.types.reduce_mobsters.desc_id = "menu_pp_asset_reduce_mobsters_desc"
	self.types.reduce_mobsters.category = "hired_help"
	self.types.reduce_mobsters.icon = 61
	self.types.reduce_mobsters.total = 1
	self.types.reduce_mobsters.post_event = "gus_preplan_13"
	self.types.reduce_mobsters.prio = 1
	self.types.reduce_mobsters.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_reduce_mobsters")
	self.types.reduce_mobsters.budget_cost = 1
	self.types.escape_van_loud = {}
	self.types.escape_van_loud.name_id = "menu_pp_escape_van_loud"
	self.types.escape_van_loud.desc_id = "menu_pp_escape_van_loud_desc"
	self.types.escape_van_loud.plan = "escape_plan"
	self.types.escape_van_loud.pos_not_important = false
	self.types.escape_van_loud.category = "escape_plan"
	self.types.escape_van_loud.total = 1
	self.types.escape_van_loud.cost = 0
	self.types.escape_van_loud.budget_cost = 0
	self.types.escape_van_loud.post_event = "gus_preplan_17"
	self.types.escape_van_loud.prio = 6
	self.types.escape_bus_loud = {}
	self.types.escape_bus_loud.name_id = "menu_pp_escape_bus_loud"
	self.types.escape_bus_loud.desc_id = "menu_pp_escape_bus_loud_desc"
	self.types.escape_bus_loud.plan = "escape_plan"
	self.types.escape_bus_loud.pos_not_important = false
	self.types.escape_bus_loud.category = "escape_plan"
	self.types.escape_bus_loud.icon = 54
	self.types.escape_bus_loud.total = 1
	self.types.escape_bus_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_bus_loud.budget_cost = 6
	self.types.escape_bus_loud.post_event = "gus_preplan_17"
	self.types.escape_bus_loud.prio = 1
	self.types.escape_c4_loud = {}
	self.types.escape_c4_loud.name_id = "menu_pp_escape_c4_loud"
	self.types.escape_c4_loud.desc_id = "menu_pp_escape_c4_loud_desc"
	self.types.escape_c4_loud.plan = "escape_plan"
	self.types.escape_c4_loud.pos_not_important = false
	self.types.escape_c4_loud.category = "escape_plan"
	self.types.escape_c4_loud.icon = 54
	self.types.escape_c4_loud.total = 1
	self.types.escape_c4_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_c4_loud.budget_cost = 6
	self.types.escape_c4_loud.post_event = "gus_preplan_17"
	self.types.escape_c4_loud.prio = 2
	self.types.escape_elevator_loud = {}
	self.types.escape_elevator_loud.name_id = "menu_pp_escape_elevator_loud"
	self.types.escape_elevator_loud.desc_id = "menu_pp_escape_elevator_loud_desc"
	self.types.escape_elevator_loud.plan = "escape_plan"
	self.types.escape_elevator_loud.pos_not_important = false
	self.types.escape_elevator_loud.category = "escape_plan"
	self.types.escape_elevator_loud.icon = 54
	self.types.escape_elevator_loud.total = 1
	self.types.escape_elevator_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_elevator_loud.budget_cost = 6
	self.types.escape_elevator_loud.post_event = "gus_preplan_17"
	self.types.escape_elevator_loud.prio = 3
	self.types.escape_zipline_loud = {}
	self.types.escape_zipline_loud.name_id = "menu_pp_escape_zipline_loud"
	self.types.escape_zipline_loud.desc_id = "menu_pp_escape_zipline_loud_desc"
	self.types.escape_zipline_loud.plan = "escape_plan"
	self.types.escape_zipline_loud.pos_not_important = false
	self.types.escape_zipline_loud.category = "escape_plan"
	self.types.escape_zipline_loud.icon = 54
	self.types.escape_zipline_loud.total = 1
	self.types.escape_zipline_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.escape_zipline_loud.budget_cost = 3
	self.types.escape_zipline_loud.post_event = "gus_preplan_17"
	self.types.escape_zipline_loud.prio = 2
	self.types.escape_helicopter_loud = {}
	self.types.escape_helicopter_loud.name_id = "menu_pp_escape_helicopter_loud"
	self.types.escape_helicopter_loud.desc_id = "menu_pp_escape_helicopter_loud_desc"
	self.types.escape_helicopter_loud.plan = "escape_plan"
	self.types.escape_helicopter_loud.pos_not_important = false
	self.types.escape_helicopter_loud.category = "escape_plan"
	self.types.escape_helicopter_loud.icon = 54
	self.types.escape_helicopter_loud.total = 1
	self.types.escape_helicopter_loud.cost = 0
	self.types.escape_helicopter_loud.budget_cost = 0
	self.types.escape_helicopter_loud.post_event = "gus_preplan_17"
	self.types.escape_helicopter_loud.prio = 3
	self.types.escape_aliens_loud = {}
	self.types.escape_aliens_loud.name_id = "menu_pp_escape_aliens_loud"
	self.types.escape_aliens_loud.desc_id = "menu_pp_escape_aliens_loud_desc"
	self.types.escape_aliens_loud.plan = "escape_plan"
	self.types.escape_aliens_loud.pos_not_important = false
	self.types.escape_aliens_loud.deployable_id = "ammo_bag"
	self.types.escape_aliens_loud.category = "escape_plan"
	self.types.escape_aliens_loud.total = 1
	self.types.escape_aliens_loud.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.escape_aliens_loud.budget_cost = 10
	self.types.escape_aliens_loud.post_event = "gus_preplan_17"
	self.types.escape_aliens_loud.prio = 99
	self.types.vault_drill = {}
	self.types.vault_drill.name_id = "menu_pp_vault_drill"
	self.types.vault_drill.plan = "vault_plan"
	self.types.vault_drill.pos_not_important = false
	self.types.vault_drill.category = "vault_plan"
	self.types.vault_drill.total = 1
	self.types.vault_drill.cost = 0
	self.types.vault_drill.budget_cost = 0
	self.types.vault_drill.post_event = "gus_preplan_17"
	self.types.vault_drill.prio = 2
	self.types.vault_drill.prio = 5
	self.types.vault_c4 = {}
	self.types.vault_c4.name_id = "menu_pp_vault_c4"
	self.types.vault_c4.plan = "vault_plan"
	self.types.vault_c4.pos_not_important = false
	self.types.vault_c4.category = "vault_plan"
	self.types.vault_c4.total = 1
	self.types.vault_c4.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 1)
	self.types.vault_c4.budget_cost = 4
	self.types.vault_c4.post_event = "gus_preplan_17"
	self.types.vault_c4.prio = 2
	self.types.vault_lance = {}
	self.types.vault_lance.name_id = "menu_pp_vault_lance"
	self.types.vault_lance.plan = "vault_plan"
	self.types.vault_lance.pos_not_important = false
	self.types.vault_lance.category = "vault_plan"
	self.types.vault_lance.icon = 12
	self.types.vault_lance.total = 1
	self.types.vault_lance.cost = 0
	self.types.vault_lance.budget_cost = 0
	self.types.vault_lance.post_event = "gus_preplan_17"
	self.types.vault_lance.prio = 5
	self.types.vault_big_drill = {}
	self.types.vault_big_drill.name_id = "menu_pp_vault_big_drill"
	self.types.vault_big_drill.desc_id = "menu_pp_vault_big_drill_desc"
	self.types.vault_big_drill.plan = "vault_plan"
	self.types.vault_big_drill.pos_not_important = false
	self.types.vault_big_drill.category = "vault_plan"
	self.types.vault_big_drill.icon = 12
	self.types.vault_big_drill.total = 1
	self.types.vault_big_drill.cost = 0
	self.types.vault_big_drill.budget_cost = 0
	self.types.vault_big_drill.post_event = "gus_preplan_17"
	self.types.vault_big_drill.prio = 5
	self.types.vault_thermite = {}
	self.types.vault_thermite.name_id = "menu_pp_vault_thermite"
	self.types.vault_thermite.desc_id = "menu_pp_vault_thermite_desc"
	self.types.vault_thermite.plan = "vault_plan"
	self.types.vault_thermite.pos_not_important = false
	self.types.vault_thermite.category = "vault_plan"
	self.types.vault_thermite.icon = 51
	self.types.vault_thermite.total = 1
	self.types.vault_thermite.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermite")
	self.types.vault_thermite.budget_cost = 8
	self.types.vault_thermite.post_event = "gus_preplan_02"
	self.types.vault_thermite.prio = 1
	self.types.vault_singularity = {}
	self.types.vault_singularity.name_id = "menu_pp_vault_singularity"
	self.types.vault_singularity.plan = "vault_plan"
	self.types.vault_singularity.pos_not_important = false
	self.types.vault_singularity.category = "vault_plan"
	self.types.vault_singularity.total = 1
	self.types.vault_singularity.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.vault_singularity.budget_cost = 10
	self.types.vault_singularity.post_event = "gus_preplan_17"
	self.types.vault_singularity.prio = 99
	self.types.disable_alarm_button = {}
	self.types.disable_alarm_button.name_id = "menu_pp_asset_disable_alarm_button"
	self.types.disable_alarm_button.desc_id = "menu_pp_asset_disable_alarm_button_desc"
	self.types.disable_alarm_button.category = "data_hacking"
	self.types.disable_alarm_button.icon = 42
	self.types.disable_alarm_button.total = 1
	self.types.disable_alarm_button.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_disable_alarm_button")
	self.types.disable_alarm_button.budget_cost = 3
	self.types.disable_alarm_button.post_event = "gus_preplan_16"
	self.types.disable_alarm_button.prio = 1
	self.types.safe_escape = {}
	self.types.safe_escape.name_id = "menu_pp_asset_safe_escape"
	self.types.safe_escape.desc_id = "menu_pp_asset_safe_escape_desc"
	self.types.safe_escape.category = "insider_help"
	self.types.safe_escape.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.safe_escape.icon = 54
	self.types.safe_escape.total = 1
	self.types.safe_escape.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_safe_escape")
	self.types.safe_escape.budget_cost = 3
	self.types.safe_escape.post_event = "gus_preplan_16"
	self.types.safe_escape.prio = 1
	self.types.sniper_spot = {}
	self.types.sniper_spot.name_id = "menu_pp_asset_sniper_spot"
	self.types.sniper_spot.desc_id = "menu_pp_asset_sniper_spot_desc"
	self.types.sniper_spot.category = "hired_help"
	self.types.sniper_spot.icon = 55
	self.types.sniper_spot.total = 1
	self.types.sniper_spot.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_sniper_spot")
	self.types.sniper_spot.budget_cost = 3
	self.types.sniper_spot.post_event = "gus_preplan_16"
	self.types.sniper_spot.prio = 1
	self.types.bag_shortcut = {}
	self.types.bag_shortcut.name_id = "menu_pp_asset_bag_shortcut"
	self.types.bag_shortcut.desc_id = "menu_pp_asset_bag_shortcut_desc"
	self.types.bag_shortcut.category = "mission_equipment"
	self.types.bag_shortcut.icon = 34
	self.types.bag_shortcut.total = 1
	self.types.bag_shortcut.post_event = "gus_preplan_16"
	self.types.bag_shortcut.prio = 1
	self.types.bag_shortcut.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_shortcut")
	self.types.bag_shortcut.budget_cost = 2
	self.types.bag_zipline = {}
	self.types.bag_zipline.name_id = "menu_pp_asset_bag_zipline"
	self.types.bag_zipline.desc_id = "menu_pp_asset_bag_zipline_desc"
	self.types.bag_zipline.category = "mission_equipment"
	self.types.bag_zipline.icon = 34
	self.types.bag_zipline.total = 1
	self.types.bag_zipline.post_event = "gus_preplan_16"
	self.types.bag_zipline.prio = 1
	self.types.bag_zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_zipline")
	self.types.bag_zipline.budget_cost = 2
	self.types.bag_zipline_stealth_only = {}
	self.types.bag_zipline_stealth_only.name_id = "menu_pp_asset_bag_zipline_stealth_only"
	self.types.bag_zipline_stealth_only.desc_id = "menu_pp_asset_bag_zipline_stealth_only_desc"
	self.types.bag_zipline_stealth_only.category = "mission_equipment"
	self.types.bag_zipline_stealth_only.icon = 34
	self.types.bag_zipline_stealth_only.total = 1
	self.types.bag_zipline_stealth_only.post_event = "gus_preplan_16"
	self.types.bag_zipline_stealth_only.prio = 1
	self.types.bag_zipline_stealth_only.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_zipline")
	self.types.bag_zipline_stealth_only.budget_cost = 2
	self.types.loot_drop_off = {}
	self.types.loot_drop_off.name_id = "menu_pp_asset_loot_drop_off"
	self.types.loot_drop_off.desc_id = "menu_pp_asset_loot_drop_off_desc"
	self.types.loot_drop_off.category = "hired_help"
	self.types.loot_drop_off.icon = 34
	self.types.loot_drop_off.total = 1
	self.types.loot_drop_off.post_event = "gus_preplan_16"
	self.types.loot_drop_off.prio = 1
	self.types.loot_drop_off.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_loot_drop_off")
	self.types.loot_drop_off.budget_cost = 2
	self.types.loot_drop_off_stealth_only = {}
	self.types.loot_drop_off_stealth_only.name_id = "menu_pp_asset_loot_drop_off_stealth_only"
	self.types.loot_drop_off_stealth_only.desc_id = "menu_pp_asset_loot_drop_off_stealth_only_desc"
	self.types.loot_drop_off_stealth_only.category = "hired_help"
	self.types.loot_drop_off_stealth_only.icon = 34
	self.types.loot_drop_off_stealth_only.total = 1
	self.types.loot_drop_off_stealth_only.post_event = "gus_preplan_16"
	self.types.loot_drop_off_stealth_only.prio = 1
	self.types.loot_drop_off_stealth_only.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_loot_drop_off")
	self.types.loot_drop_off_stealth_only.budget_cost = 2
	self.types.loot_drop_off_generic = deep_clone(self.types.loot_drop_off)
	self.types.loot_drop_off_generic.desc_id = "menu_pp_asset_loot_drop_off_generic_desc"
	self.types.thermal_paste = {}
	self.types.thermal_paste.name_id = "menu_pp_asset_thermal_paste"
	self.types.thermal_paste.desc_id = "menu_pp_asset_thermal_paste_desc"
	self.types.thermal_paste.category = "dead_drop"
	self.types.thermal_paste.icon = 51
	self.types.thermal_paste.total = 1
	self.types.thermal_paste.post_event = "gus_preplan_16"
	self.types.thermal_paste.prio = 1
	self.types.thermal_paste.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermal_paste")
	self.types.thermal_paste.budget_cost = 3
	self.types.thermal_paste.spawn_unit = "units/payday2/equipment/gen_equipment_thermal_paste_crate/gen_equipment_thermal_paste_crate"
	self.types.framing_frame_1_truck = {}
	self.types.framing_frame_1_truck.name_id = "menu_pp_asset_framing_frame_1_truck"
	self.types.framing_frame_1_truck.desc_id = "menu_pp_asset_framing_frame_1_truck_desc"
	self.types.framing_frame_1_truck.category = "mission_equipment"
	self.types.framing_frame_1_truck.icon = 63
	self.types.framing_frame_1_truck.total = 1
	self.types.framing_frame_1_truck.post_event = "gus_preplan_07"
	self.types.framing_frame_1_truck.prio = 1
	self.types.framing_frame_1_truck.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_framing_frame_1_truck")
	self.types.framing_frame_1_truck.budget_cost = 2
	self.types.framing_frame_1_entry_point = {}
	self.types.framing_frame_1_entry_point.name_id = "menu_pp_asset_framing_frame_1_entry_point"
	self.types.framing_frame_1_entry_point.desc_id = "menu_pp_asset_framing_frame_1_entry_point_desc"
	self.types.framing_frame_1_entry_point.category = "mission_equipment"
	self.types.framing_frame_1_entry_point.icon = 41
	self.types.framing_frame_1_entry_point.total = 1
	self.types.framing_frame_1_entry_point.post_event = "gus_preplan_07"
	self.types.framing_frame_1_entry_point.prio = 1
	self.types.framing_frame_1_entry_point.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_framing_frame_1_entry_point")
	self.types.framing_frame_1_entry_point.budget_cost = 2
	self.types.branchbank_lance = {}
	self.types.branchbank_lance.name_id = "menu_pp_branchbank_lance"
	self.types.branchbank_lance.desc_id = "menu_pp_branchbank_lance_desc"
	self.types.branchbank_lance.plan = "vault_plan"
	self.types.branchbank_lance.pos_not_important = false
	self.types.branchbank_lance.category = "vault_plan"
	self.types.branchbank_lance.icon = 12
	self.types.branchbank_lance.total = 1
	self.types.branchbank_lance.cost = 0
	self.types.branchbank_lance.budget_cost = 0
	self.types.branchbank_lance.post_event = "gus_preplan_17"
	self.types.branchbank_lance.prio = 5
	self.types.branchbank_vault_key = {}
	self.types.branchbank_vault_key.name_id = "menu_pp_asset_branchbank_vault_key"
	self.types.branchbank_vault_key.desc_id = "menu_pp_asset_branchbank_vault_key_desc"
	self.types.branchbank_vault_key.category = "mission_equipment"
	self.types.branchbank_vault_key.icon = 43
	self.types.branchbank_vault_key.total = 1
	self.types.branchbank_vault_key.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_branchbank_vault_key")
	self.types.branchbank_vault_key.budget_cost = 3
	self.types.branchbank_vault_key.post_event = "gus_preplan_16"
	self.types.branchbank_vault_key.prio = 2
	self.types.crojob_stealth = {}
	self.types.crojob_stealth.name_id = "menu_pp_crojob_stealth"
	self.types.crojob_stealth.desc_id = "menu_pp_crojob_stealth_desc"
	self.types.crojob_stealth.plan = "plan_of_action"
	self.types.crojob_stealth.pos_not_important = true
	self.types.crojob_stealth.category = "plan_of_action"
	self.types.crojob_stealth.icon = 54
	self.types.crojob_stealth.total = 0
	self.types.crojob_stealth.cost = 0
	self.types.crojob_stealth.budget_cost = 0
	self.types.crojob_stealth.post_event = ""
	self.types.crojob_stealth.prio = 3
	self.types.crojob_loud = {}
	self.types.crojob_loud.name_id = "menu_pp_crojob_loud"
	self.types.crojob_loud.desc_id = "menu_pp_crojob_loud_desc"
	self.types.crojob_loud.plan = "plan_of_action"
	self.types.crojob_loud.pos_not_important = true
	self.types.crojob_loud.category = "plan_of_action"
	self.types.crojob_loud.icon = 54
	self.types.crojob_loud.total = 0
	self.types.crojob_loud.cost = 0
	self.types.crojob_loud.budget_cost = 0
	self.types.crojob_loud.post_event = ""
	self.types.crojob_loud.prio = 3
	self.types.crojob2_escape_van = {}
	self.types.crojob2_escape_van.name_id = "menu_pp_crojob2_escape_van"
	self.types.crojob2_escape_van.desc_id = "menu_pp_crojob2_escape_van_desc"
	self.types.crojob2_escape_van.plan = "escape_plan"
	self.types.crojob2_escape_van.pos_not_important = false
	self.types.crojob2_escape_van.category = "escape_plan"
	self.types.crojob2_escape_van.icon = 54
	self.types.crojob2_escape_van.total = 1
	self.types.crojob2_escape_van.cost = 0
	self.types.crojob2_escape_van.budget_cost = 0
	self.types.crojob2_escape_van.post_event = "gus_preplan_12"
	self.types.crojob2_escape_van.prio = 3
	self.types.crojob2_escape_helicopter = {}
	self.types.crojob2_escape_helicopter.name_id = "menu_pp_crojob2_escape_helicopter"
	self.types.crojob2_escape_helicopter.desc_id = "menu_pp_crojob2_escape_helicopter_desc"
	self.types.crojob2_escape_helicopter.plan = "escape_plan"
	self.types.crojob2_escape_helicopter.pos_not_important = false
	self.types.crojob2_escape_helicopter.category = "escape_plan"
	self.types.crojob2_escape_helicopter.icon = 54
	self.types.crojob2_escape_helicopter.total = 1
	self.types.crojob2_escape_helicopter.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_mid")
	self.types.crojob2_escape_helicopter.budget_cost = 4
	self.types.crojob2_escape_helicopter.post_event = "gus_preplan_17"
	self.types.crojob2_escape_helicopter.prio = 3
	self.types.crojob2_escape_boat = {}
	self.types.crojob2_escape_boat.name_id = "menu_pp_crojob2_escape_boat"
	self.types.crojob2_escape_boat.desc_id = "menu_pp_crojob2_escape_boat_desc"
	self.types.crojob2_escape_boat.plan = "escape_plan"
	self.types.crojob2_escape_boat.pos_not_important = false
	self.types.crojob2_escape_boat.category = "escape_plan"
	self.types.crojob2_escape_boat.icon = 54
	self.types.crojob2_escape_boat.total = 1
	self.types.crojob2_escape_boat.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_close")
	self.types.crojob2_escape_boat.budget_cost = 8
	self.types.crojob2_escape_boat.post_event = "gus_preplan_13"
	self.types.crojob2_escape_boat.prio = 3
	self.types.crojob2_better_hacker = {}
	self.types.crojob2_better_hacker.name_id = "menu_pp_asset_crojob2_better_hacker"
	self.types.crojob2_better_hacker.desc_id = "menu_pp_asset_crojob2_better_hacker_desc"
	self.types.crojob2_better_hacker.icon = 15
	self.types.crojob2_better_hacker.pos_not_important = true
	self.types.crojob2_better_hacker.category = "hired_help"
	self.types.crojob2_better_hacker.total = 1
	self.types.crojob2_better_hacker.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.crojob2_better_hacker.budget_cost = 3
	self.types.crojob2_better_hacker.post_event = "gus_preplan_10"
	self.types.crojob2_better_hacker.prio = 3
	self.types.crojob2_better_pilot = {}
	self.types.crojob2_better_pilot.name_id = "menu_pp_asset_crojob2_better_pilot"
	self.types.crojob2_better_pilot.desc_id = "menu_pp_asset_crojob2_better_pilot_desc"
	self.types.crojob2_better_pilot.icon = 73
	self.types.crojob2_better_pilot.pos_not_important = true
	self.types.crojob2_better_pilot.category = "hired_help"
	self.types.crojob2_better_pilot.total = 1
	self.types.crojob2_better_pilot.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_pilot")
	self.types.crojob2_better_pilot.budget_cost = 3
	self.types.crojob2_better_pilot.post_event = "gus_preplan_17"
	self.types.crojob2_better_pilot.prio = 3
	self.types.crojob2_manifest = {}
	self.types.crojob2_manifest.name_id = "menu_pp_asset_crojob2_manifest"
	self.types.crojob2_manifest.desc_id = "menu_pp_asset_crojob2_manifest_desc"
	self.types.crojob2_manifest.icon = 71
	self.types.crojob2_manifest.pos_not_important = true
	self.types.crojob2_manifest.category = "mission_equipment"
	self.types.crojob2_manifest.total = 1
	self.types.crojob2_manifest.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_manifest")
	self.types.crojob2_manifest.budget_cost = 2
	self.types.crojob2_manifest.post_event = "gus_preplan_14"
	self.types.crojob2_manifest.prio = 3
	self.types.crojob3_escape_boat = {}
	self.types.crojob3_escape_boat.name_id = "menu_pp_crojob3_escape_boat"
	self.types.crojob3_escape_boat.desc_id = "menu_pp_crojob3_escape_boat_desc"
	self.types.crojob3_escape_boat.plan = "escape_plan"
	self.types.crojob3_escape_boat.pos_not_important = false
	self.types.crojob3_escape_boat.category = "escape_plan"
	self.types.crojob3_escape_boat.icon = 54
	self.types.crojob3_escape_boat.total = 1
	self.types.crojob3_escape_boat.cost = 0
	self.types.crojob3_escape_boat.budget_cost = 0
	self.types.crojob3_escape_boat.post_event = "gus_preplan_16"
	self.types.crojob3_escape_boat.prio = 3
	self.types.crojob3_escape_plane = {}
	self.types.crojob3_escape_plane.name_id = "menu_pp_crojob3_escape_plane"
	self.types.crojob3_escape_plane.desc_id = "menu_pp_crojob3_escape_plane_desc"
	self.types.crojob3_escape_plane.plan = "escape_plan"
	self.types.crojob3_escape_plane.pos_not_important = false
	self.types.crojob3_escape_plane.category = "escape_plan"
	self.types.crojob3_escape_plane.icon = 54
	self.types.crojob3_escape_plane.total = 1
	self.types.crojob3_escape_plane.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_mid")
	self.types.crojob3_escape_plane.budget_cost = 4
	self.types.crojob3_escape_plane.post_event = "gus_preplan_13"
	self.types.crojob3_escape_plane.prio = 3
	self.types.crojob3_escape_helicopter = {}
	self.types.crojob3_escape_helicopter.name_id = "menu_pp_crojob3_escape_helicopter"
	self.types.crojob3_escape_helicopter.desc_id = "menu_pp_crojob3_escape_helicopter_desc"
	self.types.crojob3_escape_helicopter.plan = "escape_plan"
	self.types.crojob3_escape_helicopter.pos_not_important = false
	self.types.crojob3_escape_helicopter.category = "escape_plan"
	self.types.crojob3_escape_helicopter.icon = 54
	self.types.crojob3_escape_helicopter.total = 1
	self.types.crojob3_escape_helicopter.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_close")
	self.types.crojob3_escape_helicopter.budget_cost = 8
	self.types.crojob3_escape_helicopter.post_event = "gus_preplan_14"
	self.types.crojob3_escape_helicopter.prio = 3
	self.types.crojob3_demolition_expert = {}
	self.types.crojob3_demolition_expert.name_id = "menu_pp_asset_crojob3_demolition_expert"
	self.types.crojob3_demolition_expert.desc_id = "menu_pp_asset_crojob3_demolition_expert_desc"
	self.types.crojob3_demolition_expert.pos_not_important = false
	self.types.crojob3_demolition_expert.icon = 65
	self.types.crojob3_demolition_expert.category = "hired_help"
	self.types.crojob3_demolition_expert.total = 3
	self.types.crojob3_demolition_expert.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_demolition")
	self.types.crojob3_demolition_expert.budget_cost = 1
	self.types.crojob3_demolition_expert.post_event = "gus_preplan_14"
	self.types.crojob3_demolition_expert.prio = 3
	self.types.crojob3_better_pilot = {}
	self.types.crojob3_better_pilot.name_id = "menu_pp_asset_crojob3_better_pilot"
	self.types.crojob3_better_pilot.desc_id = "menu_pp_asset_crojob3_better_pilot_desc"
	self.types.crojob3_better_pilot.pos_not_important = true
	self.types.crojob3_better_pilot.icon = 73
	self.types.crojob3_better_pilot.category = "hired_help"
	self.types.crojob3_better_pilot.total = 1
	self.types.crojob3_better_pilot.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_pilot")
	self.types.crojob3_better_pilot.budget_cost = 4
	self.types.crojob3_better_pilot.post_event = "gus_preplan_17"
	self.types.crojob3_better_pilot.prio = 3
	self.types.crojob3_sniper = {}
	self.types.crojob3_sniper.name_id = "menu_pp_asset_sniper"
	self.types.crojob3_sniper.desc_id = "menu_pp_asset_sniper_desc"
	self.types.crojob3_sniper.pos_not_important = false
	self.types.crojob3_sniper.icon = 55
	self.types.crojob3_sniper.category = "hired_help"
	self.types.crojob3_sniper.total = 1
	self.types.crojob3_sniper.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_sniper")
	self.types.crojob3_sniper.budget_cost = 4
	self.types.crojob3_sniper.post_event = "gus_preplan_13"
	self.types.crojob3_sniper.prio = 3
	self.types.crojob3_ladder = {}
	self.types.crojob3_ladder.name_id = "menu_pp_asset_crojob3_ladder"
	self.types.crojob3_ladder.desc_id = "menu_pp_asset_crojob3_ladder_desc"
	self.types.crojob3_ladder.pos_not_important = false
	self.types.crojob3_ladder.icon = 63
	self.types.crojob3_ladder.category = "mission_equipment"
	self.types.crojob3_ladder.total = 1
	self.types.crojob3_ladder.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_ladder")
	self.types.crojob3_ladder.budget_cost = 1
	self.types.crojob3_ladder.post_event = "gus_preplan_15"
	self.types.crojob3_ladder.prio = 5
	self.types.crojob3_crowbar = {}
	self.types.crojob3_crowbar.name_id = "menu_pp_asset_crojob3_crowbar"
	self.types.crojob3_crowbar.desc_id = "menu_pp_asset_crojob3_crowbar_desc"
	self.types.crojob3_crowbar.pos_not_important = false
	self.types.crojob3_crowbar.icon = 72
	self.types.crojob3_crowbar.category = "mission_equipment"
	self.types.crojob3_crowbar.total = 1
	self.types.crojob3_crowbar.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_crowbar")
	self.types.crojob3_crowbar.budget_cost = 1
	self.types.crojob3_crowbar.post_event = "gus_preplan_15"
	self.types.crojob3_crowbar.prio = 5
	self.types.glass_cutter = {}
	self.types.glass_cutter.name_id = "menu_pp_asset_glass_cutter"
	self.types.glass_cutter.desc_id = "menu_pp_asset_glass_cutter_desc"
	self.types.glass_cutter.category = "mission_equipment"
	self.types.glass_cutter.icon = 64
	self.types.glass_cutter.total = 1
	self.types.glass_cutter.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_glass_cutter")
	self.types.glass_cutter.budget_cost = 1
	self.types.glass_cutter.post_event = "gus_preplan_16"
	self.types.glass_cutter.prio = 2
	self.types.kenaz_silent_entry = {}
	self.types.kenaz_silent_entry.name_id = "menu_pp_asset_kenaz_silent_entry"
	self.types.kenaz_silent_entry.desc_id = "menu_pp_asset_kenaz_silent_entry_desc"
	self.types.kenaz_silent_entry.plan = "entry_plan"
	self.types.kenaz_silent_entry.pos_not_important = false
	self.types.kenaz_silent_entry.category = "entry_plan"
	self.types.kenaz_silent_entry.icon = 94
	self.types.kenaz_silent_entry.cost = 0
	self.types.kenaz_silent_entry.budget_cost = 0
	self.types.kenaz_silent_entry.post_event = ""
	self.types.kenaz_silent_entry.prio = 3
	self.types.kenaz_loud_entry = {}
	self.types.kenaz_loud_entry.name_id = "menu_pp_asset_kenaz_loud_entry"
	self.types.kenaz_loud_entry.desc_id = "menu_pp_asset_kenaz_loud_entry_desc"
	self.types.kenaz_loud_entry.plan = "entry_plan"
	self.types.kenaz_loud_entry.pos_not_important = false
	self.types.kenaz_loud_entry.category = "entry_plan"
	self.types.kenaz_loud_entry.icon = 95
	self.types.kenaz_loud_entry.cost = 0
	self.types.kenaz_loud_entry.budget_cost = 0
	self.types.kenaz_loud_entry.post_event = ""
	self.types.kenaz_loud_entry.prio = 3
	self.types.kenaz_loud_entry_with_c4 = {}
	self.types.kenaz_loud_entry_with_c4.name_id = "menu_pp_asset_kenaz_loud_entry_with_c4"
	self.types.kenaz_loud_entry_with_c4.desc_id = "menu_pp_asset_kenaz_loud_entry_with_c4_desc"
	self.types.kenaz_loud_entry_with_c4.plan = "entry_plan"
	self.types.kenaz_loud_entry_with_c4.pos_not_important = false
	self.types.kenaz_loud_entry_with_c4.category = "entry_plan"
	self.types.kenaz_loud_entry_with_c4.icon = 95
	self.types.kenaz_loud_entry_with_c4.cost = 0
	self.types.kenaz_loud_entry_with_c4.budget_cost = 6
	self.types.kenaz_loud_entry_with_c4.post_event = ""
	self.types.kenaz_loud_entry_with_c4.prio = 3
	self.types.kenaz_limo_escape = {}
	self.types.kenaz_limo_escape.name_id = "menu_pp_asset_kenaz_limo_escape"
	self.types.kenaz_limo_escape.desc_id = "menu_pp_asset_kenaz_limo_escape_desc"
	self.types.kenaz_limo_escape.plan = "escape_plan"
	self.types.kenaz_limo_escape.pos_not_important = false
	self.types.kenaz_limo_escape.category = "escape_plan"
	self.types.kenaz_limo_escape.icon = 54
	self.types.kenaz_limo_escape.total = 1
	self.types.kenaz_limo_escape.cost = 0
	self.types.kenaz_limo_escape.budget_cost = 0
	self.types.kenaz_limo_escape.post_event = "gus_preplan_12"
	self.types.kenaz_limo_escape.prio = 3
	self.types.kenaz_zeppelin_escape = {}
	self.types.kenaz_zeppelin_escape.name_id = "menu_pp_asset_kenaz_zeppelin_escape"
	self.types.kenaz_zeppelin_escape.desc_id = "menu_pp_asset_kenaz_zeppelin_escape_desc"
	self.types.kenaz_zeppelin_escape.plan = "escape_plan"
	self.types.kenaz_zeppelin_escape.pos_not_important = false
	self.types.kenaz_zeppelin_escape.category = "escape_plan"
	self.types.kenaz_zeppelin_escape.icon = 54
	self.types.kenaz_zeppelin_escape.total = 1
	self.types.kenaz_zeppelin_escape.cost = 0
	self.types.kenaz_zeppelin_escape.budget_cost = 4
	self.types.kenaz_zeppelin_escape.post_event = "gus_preplan_12"
	self.types.kenaz_zeppelin_escape.prio = 3
	self.types.kenaz_van_escape = {}
	self.types.kenaz_van_escape.name_id = "menu_pp_asset_kenaz_van_escape"
	self.types.kenaz_van_escape.desc_id = "menu_pp_asset_kenaz_van_escape_desc"
	self.types.kenaz_van_escape.plan = "escape_plan"
	self.types.kenaz_van_escape.pos_not_important = false
	self.types.kenaz_van_escape.category = "escape_plan"
	self.types.kenaz_van_escape.icon = 54
	self.types.kenaz_van_escape.total = 1
	self.types.kenaz_van_escape.cost = 0
	self.types.kenaz_van_escape.budget_cost = 8
	self.types.kenaz_van_escape.post_event = "gus_preplan_12"
	self.types.kenaz_van_escape.prio = 3
	self.types.kenaz_wrecking_ball_escape = {}
	self.types.kenaz_wrecking_ball_escape.name_id = "menu_pp_asset_kenaz_wrecking_ball_escape"
	self.types.kenaz_wrecking_ball_escape.desc_id = "menu_pp_asset_kenaz_wrecking_ball_escape_desc"
	self.types.kenaz_wrecking_ball_escape.plan = "escape_plan"
	self.types.kenaz_wrecking_ball_escape.pos_not_important = false
	self.types.kenaz_wrecking_ball_escape.category = "escape_plan"
	self.types.kenaz_wrecking_ball_escape.icon = 54
	self.types.kenaz_wrecking_ball_escape.total = 1
	self.types.kenaz_wrecking_ball_escape.cost = 0
	self.types.kenaz_wrecking_ball_escape.budget_cost = 10
	self.types.kenaz_wrecking_ball_escape.post_event = "gus_preplan_12"
	self.types.kenaz_wrecking_ball_escape.prio = 3
	self.types.sentry_gun = {}
	self.types.sentry_gun.name_id = "menu_pp_asset_sentry_gun"
	self.types.sentry_gun.desc_id = "menu_pp_asset_sentry_gun_desc"
	self.types.sentry_gun.icon = 75
	self.types.sentry_gun.category = "dead_drop"
	self.types.sentry_gun.total = 2
	self.types.sentry_gun.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.sentry_gun.budget_cost = 1
	self.types.sentry_gun.post_event = ""
	self.types.sentry_gun.prio = 5
	self.types.kenaz_drill_better_plasma_cutter = {}
	self.types.kenaz_drill_better_plasma_cutter.name_id = "menu_pp_asset_kenaz_drill_better_plasma_cutter"
	self.types.kenaz_drill_better_plasma_cutter.desc_id = "menu_pp_asset_kenaz_drill_better_plasma_cutter_desc"
	self.types.kenaz_drill_better_plasma_cutter.pos_not_important = false
	self.types.kenaz_drill_better_plasma_cutter.category = "BFD_upgrades"
	self.types.kenaz_drill_better_plasma_cutter.icon = 64
	self.types.kenaz_drill_better_plasma_cutter.cost = 0
	self.types.kenaz_drill_better_plasma_cutter.budget_cost = 2
	self.types.kenaz_drill_better_plasma_cutter.post_event = ""
	self.types.kenaz_drill_better_plasma_cutter.prio = 3
	self.types.kenaz_drill_improved_cooling_system = {}
	self.types.kenaz_drill_improved_cooling_system.name_id = "menu_pp_asset_kenaz_drill_improved_cooling_system"
	self.types.kenaz_drill_improved_cooling_system.desc_id = "menu_pp_asset_kenaz_drill_improved_cooling_system_desc"
	self.types.kenaz_drill_improved_cooling_system.pos_not_important = false
	self.types.kenaz_drill_improved_cooling_system.category = "BFD_upgrades"
	self.types.kenaz_drill_improved_cooling_system.icon = 92
	self.types.kenaz_drill_improved_cooling_system.cost = 0
	self.types.kenaz_drill_improved_cooling_system.budget_cost = 3
	self.types.kenaz_drill_improved_cooling_system.post_event = ""
	self.types.kenaz_drill_improved_cooling_system.prio = 3
	self.types.kenaz_drill_engine_optimization = {}
	self.types.kenaz_drill_engine_optimization.name_id = "menu_pp_asset_kenaz_drill_engine_optimization"
	self.types.kenaz_drill_engine_optimization.desc_id = "menu_pp_asset_kenaz_drill_engine_optimization_desc"
	self.types.kenaz_drill_engine_optimization.pos_not_important = false
	self.types.kenaz_drill_engine_optimization.category = "BFD_upgrades"
	self.types.kenaz_drill_engine_optimization.icon = 15
	self.types.kenaz_drill_engine_optimization.cost = 0
	self.types.kenaz_drill_engine_optimization.budget_cost = 2
	self.types.kenaz_drill_engine_optimization.post_event = ""
	self.types.kenaz_drill_engine_optimization.prio = 3
	self.types.kenaz_drill_engine_additional_power = {}
	self.types.kenaz_drill_engine_additional_power.name_id = "menu_pp_asset_kenaz_drill_engine_additional_power"
	self.types.kenaz_drill_engine_additional_power.desc_id = "menu_pp_asset_kenaz_drill_engine_additional_power_desc"
	self.types.kenaz_drill_engine_additional_power.pos_not_important = false
	self.types.kenaz_drill_engine_additional_power.category = "BFD_upgrades"
	self.types.kenaz_drill_engine_additional_power.icon = 44
	self.types.kenaz_drill_engine_additional_power.cost = 0
	self.types.kenaz_drill_engine_additional_power.budget_cost = 3
	self.types.kenaz_drill_engine_additional_power.post_event = ""
	self.types.kenaz_drill_engine_additional_power.prio = 3
	self.types.kenaz_drill_sentry = {}
	self.types.kenaz_drill_sentry.name_id = "menu_pp_asset_kenaz_drill_sentry"
	self.types.kenaz_drill_sentry.desc_id = "menu_pp_asset_kenaz_drill_sentry_desc"
	self.types.kenaz_drill_sentry.pos_not_important = false
	self.types.kenaz_drill_sentry.category = "BFD_attachments"
	self.types.kenaz_drill_sentry.icon = 75
	self.types.kenaz_drill_sentry.total = 2
	self.types.kenaz_drill_sentry.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.kenaz_drill_sentry.budget_cost = 1
	self.types.kenaz_drill_sentry.post_event = ""
	self.types.kenaz_drill_sentry.prio = 3
	self.types.kenaz_drill_extra_battery = {}
	self.types.kenaz_drill_extra_battery.name_id = "menu_pp_asset_kenaz_drill_extra_battery"
	self.types.kenaz_drill_extra_battery.desc_id = "menu_pp_asset_kenaz_drill_extra_battery_desc"
	self.types.kenaz_drill_extra_battery.pos_not_important = false
	self.types.kenaz_drill_extra_battery.category = "BFD_attachments"
	self.types.kenaz_drill_extra_battery.icon = 44
	self.types.kenaz_drill_extra_battery.cost = 0
	self.types.kenaz_drill_extra_battery.budget_cost = 3
	self.types.kenaz_drill_extra_battery.post_event = ""
	self.types.kenaz_drill_extra_battery.prio = 3
	self.types.kenaz_drill_water_level_indicator = {}
	self.types.kenaz_drill_water_level_indicator.name_id = "menu_pp_asset_kenaz_drill_water_level_indicator"
	self.types.kenaz_drill_water_level_indicator.desc_id = "menu_pp_asset_kenaz_drill_water_level_indicator_desc"
	self.types.kenaz_drill_water_level_indicator.pos_not_important = false
	self.types.kenaz_drill_water_level_indicator.category = "BFD_attachments"
	self.types.kenaz_drill_water_level_indicator.icon = 92
	self.types.kenaz_drill_water_level_indicator.cost = 0
	self.types.kenaz_drill_water_level_indicator.budget_cost = 1
	self.types.kenaz_drill_water_level_indicator.post_event = ""
	self.types.kenaz_drill_water_level_indicator.prio = 3
	self.types.kenaz_drill_timer_addon = {}
	self.types.kenaz_drill_timer_addon.name_id = "menu_pp_asset_kenaz_drill_timer_addon"
	self.types.kenaz_drill_timer_addon.desc_id = "menu_pp_asset_kenaz_drill_timer_addon_desc"
	self.types.kenaz_drill_timer_addon.pos_not_important = false
	self.types.kenaz_drill_timer_addon.category = "BFD_attachments"
	self.types.kenaz_drill_timer_addon.icon = 15
	self.types.kenaz_drill_timer_addon.cost = 0
	self.types.kenaz_drill_timer_addon.budget_cost = 1
	self.types.kenaz_drill_timer_addon.post_event = ""
	self.types.kenaz_drill_timer_addon.prio = 3
	self.types.kenaz_drill_toolbox = {}
	self.types.kenaz_drill_toolbox.name_id = "menu_pp_asset_kenaz_drill_toolbox"
	self.types.kenaz_drill_toolbox.desc_id = "menu_pp_asset_kenaz_drill_toolbox_desc"
	self.types.kenaz_drill_toolbox.pos_not_important = false
	self.types.kenaz_drill_toolbox.category = "BFD_attachments"
	self.types.kenaz_drill_toolbox.icon = 93
	self.types.kenaz_drill_toolbox.cost = 0
	self.types.kenaz_drill_toolbox.budget_cost = 1
	self.types.kenaz_drill_toolbox.post_event = ""
	self.types.kenaz_drill_toolbox.prio = 3
	self.types.kenaz_drill_medkit = {}
	self.types.kenaz_drill_medkit.name_id = "menu_pp_asset_kenaz_drill_medkit"
	self.types.kenaz_drill_medkit.desc_id = "menu_pp_asset_kenaz_drill_medkit_desc"
	self.types.kenaz_drill_medkit.pos_not_important = false
	self.types.kenaz_drill_medkit.category = "BFD_attachments"
	self.types.kenaz_drill_medkit.icon = 31
	self.types.kenaz_drill_medkit.cost = 0
	self.types.kenaz_drill_medkit.budget_cost = 2
	self.types.kenaz_drill_medkit.post_event = ""
	self.types.kenaz_drill_medkit.prio = 3
	self.types.kenaz_drill_ammobox = {}
	self.types.kenaz_drill_ammobox.name_id = "menu_pp_asset_kenaz_drill_ammobox"
	self.types.kenaz_drill_ammobox.desc_id = "menu_pp_asset_kenaz_drill_ammobox_desc"
	self.types.kenaz_drill_ammobox.pos_not_important = false
	self.types.kenaz_drill_ammobox.category = "BFD_attachments"
	self.types.kenaz_drill_ammobox.icon = 52
	self.types.kenaz_drill_ammobox.cost = 0
	self.types.kenaz_drill_ammobox.budget_cost = 2
	self.types.kenaz_drill_ammobox.post_event = ""
	self.types.kenaz_drill_ammobox.prio = 3
	self.types.kenaz_ace_pilot = {}
	self.types.kenaz_ace_pilot.name_id = "menu_pp_asset_kenaz_ace_pilot"
	self.types.kenaz_ace_pilot.desc_id = "menu_pp_asset_kenaz_ace_pilot_desc"
	self.types.kenaz_ace_pilot.pos_not_important = true
	self.types.kenaz_ace_pilot.category = "hired_help"
	self.types.kenaz_ace_pilot.icon = 73
	self.types.kenaz_ace_pilot.cost = 0
	self.types.kenaz_ace_pilot.budget_cost = 1
	self.types.kenaz_ace_pilot.post_event = ""
	self.types.kenaz_ace_pilot.prio = 3
	self.types.kenaz_faster_blimp = {}
	self.types.kenaz_faster_blimp.name_id = "menu_pp_asset_kenaz_faster_blimp"
	self.types.kenaz_faster_blimp.desc_id = "menu_pp_asset_kenaz_faster_blimp_desc"
	self.types.kenaz_faster_blimp.pos_not_important = true
	self.types.kenaz_faster_blimp.category = "hired_help"
	self.types.kenaz_faster_blimp.icon = 74
	self.types.kenaz_faster_blimp.cost = 0
	self.types.kenaz_faster_blimp.budget_cost = 2
	self.types.kenaz_faster_blimp.post_event = ""
	self.types.kenaz_faster_blimp.prio = 3
	self.types.kenaz_rig_slotmachine = {}
	self.types.kenaz_rig_slotmachine.name_id = "menu_pp_asset_kenaz_rig_slotmachine"
	self.types.kenaz_rig_slotmachine.desc_id = "menu_pp_asset_kenaz_rig_slotmachine_desc"
	self.types.kenaz_rig_slotmachine.pos_not_important = true
	self.types.kenaz_rig_slotmachine.category = "data_hacking"
	self.types.kenaz_rig_slotmachine.icon = 45
	self.types.kenaz_rig_slotmachine.total = 1
	self.types.kenaz_rig_slotmachine.cost = 0
	self.types.kenaz_rig_slotmachine.budget_cost = 4
	self.types.kenaz_rig_slotmachine.post_event = ""
	self.types.kenaz_rig_slotmachine.prio = 3
	self.types.kenaz_sabotage_skylight_barrier = {}
	self.types.kenaz_sabotage_skylight_barrier.name_id = "menu_pp_asset_kenaz_sabotage_skylight_barrier"
	self.types.kenaz_sabotage_skylight_barrier.desc_id = "menu_pp_asset_kenaz_sabotage_skylight_barrier_desc"
	self.types.kenaz_sabotage_skylight_barrier.pos_not_important = false
	self.types.kenaz_sabotage_skylight_barrier.category = "data_hacking"
	self.types.kenaz_sabotage_skylight_barrier.icon = 42
	self.types.kenaz_sabotage_skylight_barrier.total = 1
	self.types.kenaz_sabotage_skylight_barrier.cost = 0
	self.types.kenaz_sabotage_skylight_barrier.budget_cost = 3
	self.types.kenaz_sabotage_skylight_barrier.post_event = ""
	self.types.kenaz_sabotage_skylight_barrier.prio = 3
	self.types.kenaz_customer_data_USB = {}
	self.types.kenaz_customer_data_USB.name_id = "menu_pp_asset_kenaz_customer_data_USB"
	self.types.kenaz_customer_data_USB.desc_id = "menu_pp_asset_kenaz_customer_data_USB_desc"
	self.types.kenaz_customer_data_USB.pos_not_important = true
	self.types.kenaz_customer_data_USB.category = "mission_equipment"
	self.types.kenaz_customer_data_USB.icon = 85
	self.types.kenaz_customer_data_USB.total = 1
	self.types.kenaz_customer_data_USB.cost = 0
	self.types.kenaz_customer_data_USB.budget_cost = 3
	self.types.kenaz_customer_data_USB.post_event = ""
	self.types.kenaz_customer_data_USB.prio = 3
	self.types.kenaz_unlocked_cages = {}
	self.types.kenaz_unlocked_cages.name_id = "menu_pp_asset_kenaz_unlocked_cages"
	self.types.kenaz_unlocked_cages.desc_id = "menu_pp_asset_kenaz_unlocked_cages_desc"
	self.types.kenaz_unlocked_cages.pos_not_important = false
	self.types.kenaz_unlocked_cages.category = "insider_help"
	self.types.kenaz_unlocked_cages.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_unlocked_cages.icon = 41
	self.types.kenaz_unlocked_cages.total = 1
	self.types.kenaz_unlocked_cages.cost = 0
	self.types.kenaz_unlocked_cages.budget_cost = 3
	self.types.kenaz_unlocked_cages.post_event = ""
	self.types.kenaz_unlocked_cages.prio = 3
	self.types.kenaz_unlocked_doors = {}
	self.types.kenaz_unlocked_doors.name_id = "menu_pp_asset_kenaz_unlocked_doors"
	self.types.kenaz_unlocked_doors.desc_id = "menu_pp_asset_kenaz_unlocked_doors_desc"
	self.types.kenaz_unlocked_doors.pos_not_important = false
	self.types.kenaz_unlocked_doors.category = "insider_help"
	self.types.kenaz_unlocked_doors.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_unlocked_doors.icon = 41
	self.types.kenaz_unlocked_doors.total = 1
	self.types.kenaz_unlocked_doors.cost = 0
	self.types.kenaz_unlocked_doors.budget_cost = 2
	self.types.kenaz_unlocked_doors.post_event = ""
	self.types.kenaz_unlocked_doors.prio = 3
	self.types.kenaz_guitar_case_position = {}
	self.types.kenaz_guitar_case_position.name_id = "menu_pp_asset_kenaz_guitar_case_position"
	self.types.kenaz_guitar_case_position.desc_id = "menu_pp_asset_kenaz_guitar_case_position_desc"
	self.types.kenaz_guitar_case_position.pos_not_important = false
	self.types.kenaz_guitar_case_position.category = "insider_help"
	self.types.kenaz_guitar_case_position.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_guitar_case_position.icon = 83
	self.types.kenaz_guitar_case_position.total = 1
	self.types.kenaz_guitar_case_position.cost = 0
	self.types.kenaz_guitar_case_position.budget_cost = 1
	self.types.kenaz_guitar_case_position.post_event = ""
	self.types.kenaz_guitar_case_position.prio = 3
	self.types.kenaz_disable_metal_detectors = {}
	self.types.kenaz_disable_metal_detectors.name_id = "menu_pp_asset_kenaz_disable_metal_detectors"
	self.types.kenaz_disable_metal_detectors.desc_id = "menu_pp_asset_kenaz_disable_metal_detectors_desc"
	self.types.kenaz_disable_metal_detectors.pos_not_important = true
	self.types.kenaz_disable_metal_detectors.category = "insider_help"
	self.types.kenaz_disable_metal_detectors.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_disable_metal_detectors.icon = 42
	self.types.kenaz_disable_metal_detectors.total = 1
	self.types.kenaz_disable_metal_detectors.cost = 0
	self.types.kenaz_disable_metal_detectors.budget_cost = 1
	self.types.kenaz_disable_metal_detectors.post_event = ""
	self.types.kenaz_disable_metal_detectors.prio = 3
	self.types.kenaz_celebrity_visit = {}
	self.types.kenaz_celebrity_visit.name_id = "menu_pp_asset_kenaz_celebrity_visit"
	self.types.kenaz_celebrity_visit.desc_id = "menu_pp_asset_kenaz_celebrity_visit_desc"
	self.types.kenaz_celebrity_visit.pos_not_important = false
	self.types.kenaz_celebrity_visit.category = "hired_help"
	self.types.kenaz_celebrity_visit.icon = 91
	self.types.kenaz_celebrity_visit.total = 1
	self.types.kenaz_celebrity_visit.cost = 0
	self.types.kenaz_celebrity_visit.budget_cost = 2
	self.types.kenaz_celebrity_visit.post_event = ""
	self.types.kenaz_celebrity_visit.prio = 3
	self.types.kenaz_vault_gate_key = {}
	self.types.kenaz_vault_gate_key.name_id = "menu_pp_asset_kenaz_vault_gate_key"
	self.types.kenaz_vault_gate_key.desc_id = "menu_pp_asset_kenaz_vault_gate_key_desc"
	self.types.kenaz_vault_gate_key.pos_not_important = true
	self.types.kenaz_vault_gate_key.category = "mission_equipment"
	self.types.kenaz_vault_gate_key.icon = 43
	self.types.kenaz_vault_gate_key.total = 1
	self.types.kenaz_vault_gate_key.cost = 0
	self.types.kenaz_vault_gate_key.budget_cost = 2
	self.types.kenaz_vault_gate_key.post_event = ""
	self.types.kenaz_vault_gate_key.prio = 3
end
function PrePlanningTweakData:_create_locations(tweak_data)
	self.upgrade_locks = {
		"none",
		"additional_assets"
	}
	self.dlc_locks = {"none", "big_bank"}
	self.location_groups = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f"
	}
	self.locations = {}
	self.locations.big = {
		default_plans = {
			escape_plan = "escape_helicopter_loud",
			vault_plan = "vault_big_drill"
		},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_big",
		start_location = {
			group = "a",
			x = 1500,
			y = 1025,
			zoom = 1.5
		},
		{
			name_id = "menu_pp_big_loc_a",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_lobby",
			map_x = -1.1,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1500,
					y = 1025,
					text_id = "menu_pp_info_frontdoor",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_a"
				},
				{
					x = 800,
					y = 480,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_c"
				},
				{
					x = 1300,
					y = 1690,
					text_id = "menu_pp_info_garage",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_l"
				},
				{
					x = 1000,
					y = 1025,
					text_id = "menu_pp_info_mainhall",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_n"
				},
				{
					x = 1950,
					y = 350,
					text_id = "menu_pp_info_entrypoint",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_o"
				},
				{
					x = 90,
					y = 1024,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_d"
				},
				{
					x = 348,
					y = 590,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				},
				{
					x = 574,
					y = 1742,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_b",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_2",
			map_x = 0,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 190,
					y = 1700,
					text_id = "menu_pp_info_mgroffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_k"
				},
				{
					x = 800,
					y = 480,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_c"
				},
				{
					x = 90,
					y = 1024,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_d"
				},
				{
					x = 870,
					y = 1625,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_b"
				},
				{
					x = 164,
					y = 1437,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_i"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_c",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_roof",
			map_x = 1.1,
			map_y = 0.5,
			map_size = 1,
			x1 = -250,
			y1 = -3000,
			x2 = 5750,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 869,
					y = 1629,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_b"
				},
				{
					x = 1356,
					y = 1164,
					text_id = "menu_pp_info_zipline",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_m"
				},
				{
					x = 782,
					y = 1458,
					text_id = "menu_pp_info_roof",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_h"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_d",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault_2",
			map_x = 0,
			map_y = -0.6,
			map_size = 1,
			x1 = -5771,
			y1 = -3000,
			x2 = 229,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1152,
					y = 1298,
					text_id = "menu_pp_info_vaultsecurity1",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_g"
				},
				{
					x = 1152,
					y = 746,
					text_id = "menu_pp_info_vaultsecurity2",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_g"
				},
				{
					x = 465,
					y = 1365,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_f"
				}
			}
		},
		{
			name_id = "menu_pp_big_loc_e",
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault",
			map_x = -1.1,
			map_y = -0.6,
			map_size = 1,
			x1 = -5771,
			y1 = -3000,
			x2 = 229,
			y2 = 3000,
			rotation = 90,
			custom_points = {
				{
					x = 1154,
					y = 1015,
					text_id = "menu_pp_info_moneycounting",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_e"
				},
				{
					x = 465,
					y = 1365,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "pln_pp_bb1_f"
				}
			}
		}
	}
	self.locations.mia_1 = {
		default_plans = {},
		total_budget = 6,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm1",
		start_location = {
			group = "a",
			x = 1024,
			y = 512,
			zoom = 1
		},
		grid_width_mul = 0.5,
		grid_height_mul = 1.4,
		{
			name_id = "menu_pp_mia_1_loc_a",
			texture = "guis/textures/pd2/pre_planning/hlm_01",
			map_x = -0.55,
			map_y = 0,
			map_width = 2,
			map_height = 1,
			x1 = -5524,
			y1 = -5358,
			x2 = 7476,
			y2 = 1142,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_1_loc_b",
			texture = "guis/textures/pd2/pre_planning/hlm_02",
			map_x = 1.05,
			map_y = -0.25,
			map_width = 1,
			map_height = 0.5,
			x1 = -1018,
			y1 = -4672,
			x2 = 7782,
			y2 = -272,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_1_loc_c",
			texture = "guis/textures/pd2/pre_planning/hlm_03",
			map_x = 1.05,
			map_y = 0.25,
			map_width = 1,
			map_height = 0.5,
			x1 = -1018,
			y1 = -4672,
			x2 = 7782,
			y2 = -272,
			rotation = 0,
			custom_points = {}
		}
	}
	self.locations.mia_2 = {
		default_plans = {},
		total_budget = 6,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm2",
		grid_width_mul = 0.5,
		grid_height_mul = 0.5,
		start_location = {
			group = "a",
			x = 290,
			y = 835,
			zoom = 1.25
		},
		{
			name_id = "menu_pp_mia_2_loc_a",
			texture = "guis/textures/pd2/pre_planning/hlm2_01",
			map_x = 0,
			map_y = 1,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {
				{
					x = 290,
					y = 840,
					text_id = "menu_pp_info_the_box",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_01"
				},
				{
					x = 423,
					y = 507,
					text_id = "menu_pp_info_bombstrapped",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_04"
				}
			}
		},
		{
			name_id = "menu_pp_mia_2_loc_b",
			texture = "guis/textures/pd2/pre_planning/hlm2_02",
			map_x = -1,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_c",
			texture = "guis/textures/pd2/pre_planning/hlm2_03",
			map_x = 0,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_d",
			texture = "guis/textures/pd2/pre_planning/hlm2_04",
			map_x = 1,
			map_y = 0,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mia_2_loc_e",
			texture = "guis/textures/pd2/pre_planning/hlm2_05",
			map_x = 0,
			map_y = -1,
			map_width = 1,
			map_height = 1,
			x1 = -3050,
			y1 = -3275,
			x2 = 3850,
			y2 = 3625,
			rotation = 0,
			custom_points = {
				{
					x = 300,
					y = 143,
					text_id = "menu_pp_info_vault_comm",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_02"
				},
				{
					x = 546,
					y = 143,
					text_id = "menu_pp_info_cocaine_mountain",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_pp_hm2_03"
				}
			}
		}
	}
	self.locations.framing_frame_1 = {
		default_plans = {},
		total_budget = 8,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_framingframe1",
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_framing_frame_1_loc_a",
			texture = "guis/textures/pd2/pre_planning/framing_frame_1_1",
			map_x = -0.6,
			map_y = 0,
			map_size = 1,
			x1 = -2750,
			y1 = -2750,
			x2 = 2750,
			y2 = 2750,
			rotation = 90,
			custom_points = {}
		},
		{
			name_id = "menu_pp_framing_frame_1_loc_b",
			texture = "guis/textures/pd2/pre_planning/framing_frame_1_2",
			map_x = 0.6,
			map_y = 0,
			map_size = 1,
			x1 = -2700,
			y1 = -5300,
			x2 = 6300,
			y2 = 3700,
			rotation = 90,
			custom_points = {}
		}
	}
	self.locations.gallery = deep_clone(self.locations.framing_frame_1)
	self.locations.branchbank = {
		default_plans = {
			vault_plan = "branchbank_lance"
		},
		total_budget = 8,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_big",
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_branchbank_loc_a",
			texture = "guis/textures/pd2/pre_planning/branchbank_1",
			map_x = -0.6,
			map_y = 0,
			map_size = 1,
			x1 = -3500,
			y1 = -300,
			x2 = 500,
			y2 = 3700,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_branchbank_loc_b",
			texture = "guis/textures/pd2/pre_planning/branchbank_2",
			map_x = 0.6,
			map_y = 0,
			map_size = 1,
			x1 = -5500,
			y1 = -3200,
			x2 = 2500,
			y2 = 4800,
			rotation = 0,
			custom_points = {}
		}
	}
	self.locations.framing_frame_3 = {
		default_plans = {},
		total_budget = 8,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_framingframe3",
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		grid_width_mul = 2.2,
		grid_height_mul = 1.5,
		min_zoom = 0.7,
		{
			name_id = "menu_pp_framing_frame_3_loc_b",
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_1",
			map_x = -1.1,
			map_y = 0,
			map_size = 1,
			x1 = -6600,
			y1 = 600,
			x2 = -1400,
			y2 = 5800,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_framing_frame_3_loc_a",
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_2",
			map_x = 0,
			map_y = 0,
			map_size = 1,
			x1 = -6600,
			y1 = 700,
			x2 = -1400,
			y2 = 5900,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_framing_frame_3_loc_c",
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_3",
			map_x = 1.1,
			map_y = 0,
			map_size = 1,
			x1 = -7325,
			y1 = 625,
			x2 = -1325,
			y2 = 6625,
			rotation = 0,
			custom_points = {}
		}
	}
	self.locations.kosugi = {
		default_plans = {},
		total_budget = 8,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_shadowraid",
		start_location = {
			group = "a",
			x = 2048,
			y = 1024,
			zoom = 0.8
		},
		min_zoom = 0.4,
		{
			name_id = "menu_pp_shadow_raid_loc_a",
			texture = "guis/textures/pd2/pre_planning/shadow_raid_1",
			map_x = -0.59999996,
			map_y = -0.59999996,
			map_size = 2,
			x1 = -5650,
			y1 = -7850,
			x2 = 6850,
			y2 = 4650,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_shadow_raid_loc_b",
			texture = "guis/textures/pd2/pre_planning/shadow_raid_2",
			map_x = 1.1,
			map_y = -1.1000001,
			map_size = 1,
			x1 = -3950,
			y1 = -6150,
			x2 = 1550,
			y2 = -650,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_shadow_raid_loc_c",
			texture = "guis/textures/pd2/pre_planning/shadow_raid_3",
			map_x = 1.1,
			map_y = 0,
			map_size = 1,
			x1 = -3950,
			y1 = -6150,
			x2 = 1550,
			y2 = -650,
			rotation = 0,
			custom_points = {}
		},
		{
			name_id = "menu_pp_shadow_raid_loc_d",
			texture = "guis/textures/pd2/pre_planning/shadow_raid_4",
			map_x = 1.1,
			map_y = 1.1,
			map_size = 1,
			x1 = -3950,
			y1 = -6150,
			x2 = 1550,
			y2 = -650,
			rotation = 0,
			custom_points = {}
		}
	}
	self.locations.mus = {
		default_plans = {},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_museum",
		start_location = {
			group = "a",
			x = 1024,
			y = 521,
			zoom = 1.5
		},
		{
			name_id = "menu_pp_mus_loc_a",
			texture = "guis/textures/pd2/pre_planning/mus_1",
			map_x = -1.05,
			map_y = 0,
			map_width = 1,
			map_height = 2,
			x1 = -10000,
			y1 = -5000,
			x2 = 10000,
			y2 = 5000,
			rotation = -90,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mus_loc_b",
			texture = "guis/textures/pd2/pre_planning/mus_2",
			map_x = 0,
			map_y = 0,
			map_width = 1,
			map_height = 2,
			x1 = -10000,
			y1 = -5000,
			x2 = 10000,
			y2 = 5000,
			rotation = -90,
			custom_points = {}
		},
		{
			name_id = "menu_pp_mus_loc_c",
			texture = "guis/textures/pd2/pre_planning/mus_3",
			map_x = 1.05,
			map_y = 0,
			map_width = 1,
			map_height = 2,
			x1 = -10000,
			y1 = -5000,
			x2 = 10000,
			y2 = 5000,
			rotation = -90,
			custom_points = {}
		}
	}
	self.locations.crojob2 = {
		default_plans = {
			escape_plan = "crojob2_escape_van"
		},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_stealth",
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1.5
		},
		{
			name_id = "menu_pp_crojob_stage_2_loc_a",
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_2_a",
			map_x = 0,
			map_y = 0,
			map_size = 1,
			x1 = -9500,
			y1 = -8500,
			x2 = 10500,
			y2 = 11500,
			rotation = 0,
			custom_points = {
				{
					x = 964,
					y = 1134,
					text_id = "menu_pp_info_crojob2_ship",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_14"
				},
				{
					x = 454,
					y = 538,
					text_id = "menu_pp_info_crojob2_loading_dock_3B",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_105"
				},
				{
					x = 964,
					y = 770,
					text_id = "menu_pp_info_crojob2_dock_gate",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_106"
				},
				{
					x = 1134,
					y = 768,
					text_id = "menu_pp_info_crojob2_control_room_right",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_107"
				},
				{
					x = 798,
					y = 768,
					text_id = "menu_pp_info_crojob2_control_room_left",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_108"
				},
				{
					x = 82,
					y = 702,
					text_id = "menu_pp_info_crojob2_fence_gate",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_109"
				},
				{
					x = 1524,
					y = 1508,
					text_id = "menu_pp_info_crojob2_locker_room",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_110"
				},
				{
					x = 1526,
					y = 1336,
					text_id = "menu_pp_info_crojob2_office",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_111"
				},
				{
					x = 348,
					y = 1122,
					text_id = "menu_pp_info_crojob2_storage_room",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_112"
				},
				{
					x = 350,
					y = 1420,
					text_id = "menu_pp_info_crojob2_ship_control_room_left",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_113"
				},
				{
					x = 1424,
					y = 1118,
					text_id = "menu_pp_info_crojob2_ship_control_room_right",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr2_114"
				}
			}
		}
	}
	self.locations.crojob3 = {
		default_plans = {
			escape_plan = "crojob3_escape_boat"
		},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_loud",
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_crojob_stage_3_loc_a",
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_a",
			map_x = 0,
			map_y = -0.5,
			map_size = 1,
			x1 = -50,
			y1 = -4225,
			x2 = 14950,
			y2 = 10775,
			rotation = 0,
			custom_points = {
				{
					x = 512,
					y = 550,
					text_id = "menu_pp_info_crojob3_vault",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_48"
				},
				{
					x = 846,
					y = 584,
					text_id = "menu_pp_info_crojob3_water_pump",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_50"
				}
			}
		},
		{
			name_id = "menu_pp_crojob_stage_3_loc_b",
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_b",
			map_x = 0,
			map_y = 0.5,
			map_size = 1,
			x1 = -50,
			y1 = -19225,
			x2 = 13250,
			y2 = -4225,
			rotation = 0,
			custom_points = {
				{
					x = 533,
					y = 566,
					text_id = "menu_pp_info_crojob3_thermite",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_49"
				}
			}
		}
	}
	self.locations.crojob3_night = {
		default_plans = {
			escape_plan = "crojob3_escape_boat"
		},
		total_budget = 10,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_loud",
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_crojob_stage_3_loc_a",
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_a",
			map_x = 0,
			map_y = -0.5,
			map_size = 1,
			x1 = -50,
			y1 = -4225,
			x2 = 14950,
			y2 = 10775,
			rotation = 0,
			custom_points = {
				{
					x = 512,
					y = 550,
					text_id = "menu_pp_info_crojob3_vault",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_48"
				},
				{
					x = 846,
					y = 584,
					text_id = "menu_pp_info_crojob3_water_pump",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_50"
				}
			}
		},
		{
			name_id = "menu_pp_crojob_stage_3_loc_b",
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_b",
			map_x = 0,
			map_y = 0.5,
			map_size = 1,
			x1 = -50,
			y1 = -19225,
			x2 = 13250,
			y2 = -4225,
			rotation = 0,
			custom_points = {
				{
					x = 533,
					y = 566,
					text_id = "menu_pp_info_crojob3_thermite",
					to_upper = true,
					icon = 45,
					rotation = 0,
					post_event = "Play_pln_cr3_49"
				}
			}
		}
	}
	self.locations.kenaz = {
		default_plans = {
			entry_plan = "kenaz_silent_entry",
			escape_plan = "kenaz_limo_escape"
		},
		total_budget = 15,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_casino",
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1
		},
		{
			name_id = "menu_pp_kenaz_loc_a",
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_a_df",
			map_x = -1.1,
			map_y = 0,
			map_width = 1,
			map_height = 2,
			x1 = -6175,
			y1 = -14450,
			x2 = 4975,
			y2 = 7850,
			rotation = 0
		},
		start_location = {
			group = "b",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_kenaz_loc_b",
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_b_df",
			map_x = 0,
			map_y = 0,
			map_width = 1,
			map_height = 2,
			x1 = -6175,
			y1 = -14450,
			x2 = 5475,
			y2 = 8350,
			rotation = 0,
			custom_points = {
				{
					x = 544,
					y = 1181,
					text_id = "menu_pp_info_kenaz_reception",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_140"
				},
				{
					x = 546,
					y = 1223,
					text_id = "menu_pp_info_kenaz_lobby",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_141"
				},
				{
					x = 229,
					y = 1020,
					text_id = "menu_pp_info_kenaz_pool_area",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_142"
				},
				{
					x = 812,
					y = 971,
					text_id = "menu_pp_info_kenaz_outside_lounge",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_143"
				},
				{
					x = 551,
					y = 924,
					text_id = "menu_pp_info_kenaz_gambling_hall",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_144"
				},
				{
					x = 550,
					y = 566,
					text_id = "menu_pp_info_kenaz_employees_only",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_146"
				},
				{
					x = 546,
					y = 625,
					text_id = "menu_pp_info_kenaz_security_center",
					to_upper = true,
					icon = 45,
					rotation = -90,
					post_event = "Play_pln_ca1_147"
				}
			}
		},
		start_location = {
			group = "c",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			name_id = "menu_pp_kenaz_loc_c",
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_c_df",
			map_x = 0.85,
			map_y = -0.5,
			map_width = 0.5,
			map_height = 1,
			x1 = -200,
			y1 = -400,
			x2 = 200,
			y2 = 400,
			rotation = 0
		}
	}
	self.locations.pbr = {
		default_plans = {},
		total_budget = 6,
		mission_briefing_texture = "guis/dlcs/berry/textures/pd2/pre_planning/mission_briefing_pbr",
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1
		},
		{
			name_id = "menu_pp_berry_bpr_loc_a",
			texture = "guis/dlcs/berry/textures/pd2/pre_planning/base_01",
			map_x = -0.55,
			map_y = 0,
			map_size = 1,
			x1 = -15000,
			y1 = -7600,
			x2 = -5000,
			y2 = 2400,
			rotation = 90,
			custom_points = {}
		},
		{
			name_id = "menu_pp_berry_bpr_loc_b",
			texture = "guis/dlcs/berry/textures/pd2/pre_planning/base_02",
			map_x = 0.55,
			map_y = 0,
			map_size = 1,
			x1 = -15100,
			y1 = -8000,
			x2 = -5100,
			y2 = 2000,
			rotation = 0,
			custom_points = {}
		}
	}
end
function PrePlanningTweakData:get_level_data(level_id)
	return self.locations[level_id] or {}
end
