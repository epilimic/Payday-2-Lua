EquipmentsTweakData = EquipmentsTweakData or class()
function EquipmentsTweakData:init()
	self.trip_mine = {
		icon = "equipment_trip_mine",
		use_function_name = "use_trip_mine",
		quantity = 2,
		text_id = "debug_trip_mine",
		description_id = "des_trip_mine",
		dummy_unit = "units/payday2/equipment/gen_equipment_tripmine/gen_equipment_tripmine_dummy",
		deploy_time = 2,
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier"
		},
		visual_object = "g_toolbag"
	}
	self.ammo_bag = {
		icon = "equipment_ammo_bag",
		use_function_name = "use_ammo_bag",
		quantity = 1,
		text_id = "debug_ammo_bag",
		description_id = "des_ammo_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_ammobag/gen_equipment_ammobag_dummy_unit",
		deploy_time = 2,
		visual_object = "g_ammobag"
	}
	self.doctor_bag = {
		icon = "equipment_doctor_bag",
		use_function_name = "use_doctor_bag",
		quantity = 1,
		text_id = "debug_doctor_bag",
		description_id = "des_doctor_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_medicbag/gen_equipment_medicbag_dummy_unit",
		deploy_time = 2,
		visual_object = "g_medicbag"
	}
	self.flash_grenade = {
		icon = "equipment_ammo_bag",
		use_function_name = "use_flash_grenade",
		action_timer = 2
	}
	self.smoke_grenade = {
		icon = "equipment_ammo_bag",
		use_function_name = "use_smoke_grenade",
		action_timer = 2
	}
	self.frag_grenade = {
		icon = "equipment_ammo_bag",
		use_function_name = "use_frag_grenade",
		action_timer = 2
	}
	self.sentry_gun = {
		icon = "equipment_sentry",
		use_function_name = "use_sentry_gun",
		quantity = 1,
		text_id = "debug_sentry_gun",
		description_id = "des_sentry_gun",
		dummy_unit = "units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_dummy",
		deploy_time = 2,
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "sentry_gun_deploy_time_multiplier"
		},
		visual_object = "g_sentrybag"
	}
	self.ecm_jammer = {
		icon = "equipment_ecm_jammer",
		use_function_name = "use_ecm_jammer",
		quantity = 1,
		text_id = "debug_equipment_ecm_jammer",
		description_id = "des_ecm_jammer",
		dummy_unit = "units/payday2/equipment/gen_equipment_jammer/gen_equipment_jammer_dummy",
		deploy_time = 2,
		visual_object = "g_toolbag"
	}
	self.armor_kit = {
		icon = "equipment_armor_kit",
		quantity = 1,
		text_id = "debug_equipment_armor_kit",
		deploying_text_id = "hud_equipment_equipping_armor_kit",
		description_id = "des_armor_kit",
		use_function_name = "use_armor_kit",
		dropin_penalty_function_name = "use_armor_kit_dropin_penalty",
		action_timer = 2,
		deploy_time = 2,
		visual_object = "g_armorbag",
		limit_movement = true,
		sound_start = "bar_armor",
		sound_interupt = "bar_armor_cancel",
		sound_done = "bar_armor_finished"
	}
	self.first_aid_kit = {
		icon = "equipment_first_aid_kit",
		use_function_name = "use_first_aid_kit",
		quantity = 4,
		text_id = "debug_equipment_first_aid_kit",
		description_id = "des_first_aid_kit",
		dummy_unit = "units/pd2_dlc_old_hoxton/equipment/gen_equipment_first_aid_kit/gen_equipment_first_aid_kit_dummy",
		deploy_time = 1,
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "first_aid_kit_deploy_time_multiplier"
		},
		visual_object = "g_firstaidbag"
	}
	self.bodybags_bag = {
		icon = "equipment_bodybags_bag",
		use_function_name = "use_bodybags_bag",
		quantity = 1,
		text_id = "debug_equipment_bodybags_bag",
		description_id = "des_bodybags_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_bodybags_bag/gen_equipment_bodybags_bag_dummy",
		deploy_time = 2,
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "bodybags_bag_deploy_time_multiplier"
		},
		visual_object = "g_bodybagsbag"
	}
	self.specials = {}
	self.specials.cable_tie = {
		text_id = "debug_equipment_cable_tie",
		icon = "equipment_cable_ties",
		quantity = 2,
		extra_quantity = {
			equipped_upgrade = "extra_cable_tie",
			category = "extra_cable_tie",
			upgrade = "quantity"
		}
	}
	self.specials.extra_cable_tie = {
		text_id = "debug_equipment_extra_cable_tie",
		description_id = "des_extra_cable_tie",
		icon = "equipment_extra_cable_ties"
	}
	self.specials.body_armor = {
		text_id = "debug_body_armor",
		description_id = "des_body_armor",
		icon = "equipment_armor"
	}
	self.specials.thick_skin = {
		text_id = "debug_thick_skin",
		description_id = "des_thick_skin",
		icon = "equipment_thick_skin"
	}
	self.specials.bleed_out_increase = {
		text_id = "debug_equipment_bleed_out",
		description_id = "des_bleed_out_increase",
		icon = "equipment_bleed_out"
	}
	self.specials.intimidation = {
		text_id = "debug_equipment_initimidation",
		description_id = "des_intimidation",
		icon = "interaction_intimidate"
	}
	self.specials.extra_start_out_ammo = {
		text_id = "debug_equipment_extra_start_out_ammo",
		description_id = "des_extra_start_out_ammo",
		icon = "equipment_extra_start_out_ammo"
	}
	self.specials.toolset = {
		text_id = "debug_toolset",
		description_id = "des_toolset",
		icon = "equipment_toolset"
	}
	self.specials.bank_manager_key = {
		text_id = "hud_int_equipment_pickup_keycard",
		icon = "equipment_bank_manager_key",
		action_message = "bank_manager_key_obtained",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.c_keys = {
		text_id = "hud_int_equipment_c_keys",
		icon = "equipment_generic_key",
		sync_possession = true
	}
	self.specials.keychain = {
		text_id = "hud_int_equipment_pickup_keychain",
		icon = "equipment_generic_key",
		sync_possession = true
	}
	self.specials.chavez_key = {
		text_id = "debug_equipment_chavez_key",
		icon = "equipment_chavez_key",
		action_message = "chavez_key_obtained",
		sync_possession = true
	}
	self.specials.drill = {
		text_id = "debug_equipment_drill",
		icon = "equipment_drill",
		action_message = "drill_obtained",
		sync_possession = true
	}
	self.specials.lance = {
		text_id = "hud_equipment_lance",
		icon = "equipment_drill",
		sync_possession = true
	}
	self.specials.lance_part = {
		text_id = "hud_equipment_lance_part",
		icon = "equipment_drillfix",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.glass_cutter = {
		text_id = "debug_equipment_glass_cutter",
		icon = "equipment_cutter",
		sync_possession = true
	}
	self.specials.saw = {
		text_id = "hud_equipment_saw",
		icon = "pd2_generic_saw",
		sync_possession = true
	}
	self.specials.saw_blade = {
		text_id = "hud_equipment_saw_blade",
		icon = "equipment_saw",
		sync_possession = true
	}
	self.specials.money_bag = {
		text_id = "debug_equipment_money_bag",
		icon = "equipment_money_bag"
	}
	self.specials.server = {
		text_id = "debug_equipment_stash_server",
		icon = "equipment_stash_server",
		sync_possession = true
	}
	self.specials.planks = {
		text_id = "debug_equipment_stash_planks",
		icon = "equipment_planks",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.boards = {
		text_id = "hud_equipment_boards",
		icon = "equipment_planks",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.gold_bag_equip = {
		text_id = "debug_equipment_gold_bag",
		icon = "equipment_gold",
		sync_possession = true
	}
	self.specials.thermite = {
		text_id = "hud_equipment_thermite",
		icon = "equipment_thermite",
		action_message = "thermite_obtained",
		sync_possession = true
	}
	self.specials.thermite_paste = {
		text_id = "hud_equipment_thermite_paste",
		icon = "equipment_thermite",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.gas = {
		text_id = "debug_equipment_gas",
		icon = "equipment_gasoline",
		action_message = "gas_obtained",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.c4 = {
		text_id = "hud_equipment_pickup_c4",
		icon = "pd2_c4",
		action_message = "c4_obtained",
		quantity = 4,
		transfer_quantity = 8,
		sync_possession = true
	}
	self.specials.c4_x10 = {
		text_id = "hud_equipment_pickup_c4",
		icon = "pd2_c4",
		action_message = "c4_obtained",
		quantity = 10,
		max_quantity = 10,
		transfer_quantity = 10,
		sync_possession = true
	}
	self.specials.organs = {
		text_id = "debug_equipment_organs",
		icon = "equipment_thermite",
		action_message = "organs_obtained"
	}
	self.specials.crowbar = {
		text_id = "debug_equipment_crowbar",
		icon = "equipment_crowbar",
		sync_possession = true
	}
	self.specials.crowbar_stack = {
		text_id = "debug_equipment_crowbar",
		icon = "equipment_crowbar",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.fire_extinguisher = {
		text_id = "hud_int_equipment_fire_extinguisher",
		icon = "equipment_fire_extinguisher",
		sync_possession = true
	}
	self.specials.blood_sample = {
		text_id = "debug_equipment_blood_sample",
		icon = "equipment_vial",
		sync_possession = true
	}
	self.specials.acid = {
		text_id = "hud_int_equipment_acid",
		icon = "equipment_muriatic_acid",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.blood_sample_verified = {
		text_id = "debug_equipment_blood_sample_valid",
		icon = "equipment_vialOK",
		sync_possession = true
	}
	self.specials.caustic_soda = {
		text_id = "hud_int_equipment_caustic_soda",
		icon = "equipment_caustic_soda",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.hydrogen_chloride = {
		text_id = "hud_int_equipment_hydrogen_chloride",
		icon = "equipment_hydrogen_chloride",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.gold = {
		text_id = "debug_equipment_gold",
		icon = "equipment_gold",
		player_rule = "no_run"
	}
	self.specials.circle_cutter = {
		text_id = "hud_equipment_circle_cutter",
		icon = "equipment_glasscutter",
		quantity = 1,
		max_quantity = 3,
		transfer_quantity = 3,
		sync_possession = true
	}
	local barcodes = {
		"barcode_downtown",
		"barcode_brickell",
		"barcode_edgewater",
		"barcode_isles_beach",
		"barcode_opa_locka"
	}
	self.specials.barcode_downtown = {
		text_id = "hud_int_equipment_barcode_downtown",
		icon = "equipment_barcode",
		sync_possession = true,
		shares_pickup_with = barcodes,
		avoid_tranfer = true
	}
	self.specials.barcode_brickell = {
		text_id = "hud_int_equipment_barcode_brickell",
		icon = "equipment_barcode",
		sync_possession = true,
		shares_pickup_with = barcodes,
		avoid_tranfer = true
	}
	self.specials.barcode_edgewater = {
		text_id = "hud_int_equipment_barcode_edgewater",
		icon = "equipment_barcode",
		sync_possession = true,
		shares_pickup_with = barcodes,
		avoid_tranfer = true
	}
	self.specials.barcode_isles_beach = {
		text_id = "hud_int_equipment_barcode_isles_beach",
		icon = "equipment_barcode",
		sync_possession = true,
		shares_pickup_with = barcodes,
		avoid_tranfer = true
	}
	self.specials.barcode_opa_locka = {
		text_id = "hud_int_equipment_barcode_opa_locka",
		icon = "equipment_barcode",
		sync_possession = true,
		shares_pickup_with = barcodes,
		avoid_tranfer = true
	}
	self.specials.evidence = {
		text_id = "hud_equipment_evidence",
		icon = "equipment_evidence",
		sync_possession = true
	}
	self.specials.harddrive = {
		text_id = "hud_equipment_harddrive",
		icon = "equipment_harddrive",
		sync_possession = true
	}
	self.specials.files = {
		text_id = "hud_equipment_files",
		icon = "equipment_files",
		sync_possession = true
	}
	self.specials.ticket = {
		text_id = "hud_equipment_take_ticket",
		icon = "equipment_ticket",
		sync_possession = true
	}
	self.specials.bridge = {
		text_id = "hud_equipment_take_bridge",
		icon = "equipment_planks",
		sync_possession = true
	}
	self.specials.mus_glas_cutter = {
		text_id = "hud_equipment_mus_glass_cutter",
		icon = "equipment_glasscutter",
		sync_possession = true
	}
	self.specials.c4_x1 = {
		text_id = "hud_equipment_pickup_c4",
		icon = "pd2_c4",
		action_message = "c4_obtained",
		quantity = 1,
		sync_possession = true
	}
	self.specials.chainsaw = {
		text_id = "hud_equipment_chainsaw",
		icon = "equipment_chainsaw",
		sync_possession = true
	}
	self.specials.manifest = {
		text_id = "hud_equipment_manifest",
		icon = "equipment_manifest",
		sync_possession = true
	}
	self.specials.bottle = {
		text_id = "hud_equipment_bottle",
		icon = "equipment_bottle",
		sync_possession = true
	}
	self.specials.hotel_room_key = {
		text_id = "hud_equipment_hotel_room_keycard",
		icon = "equipment_bank_manager_key",
		sync_possession = true
	}
	self.specials.blueprints = {
		text_id = "hud_equipment_blueprints",
		icon = "equipment_files",
		sync_possession = true
	}
	self.specials.cas_usb_key = {
		text_id = "hud_equipment_usb_key",
		icon = "equipment_usb_no_data",
		sync_possession = true
	}
	self.specials.cas_data_usb_key = {
		text_id = "hud_equipment_data_usb_key",
		icon = "equipment_usb_with_data",
		sync_possession = true
	}
	self.specials.cas_sleeping_gas = {
		text_id = "hud_equipment_sleeping_gas",
		icon = "equipment_sleeping_gas",
		sync_possession = true
	}
	self.specials.cas_bfd_tool = {
		text_id = "hud_equipment_bfd_tool",
		icon = "equipment_bfd_tool",
		sync_possession = true,
		transfer_quantity = 4
	}
	self.specials.cas_elevator_key = {
		text_id = "hud_equipment_elevator_key",
		icon = "equipment_elevator_key",
		sync_possession = true
	}
	self.specials.cas_winch_hook = {
		text_id = "hud_equipment_winch_hook",
		icon = "equipment_winch_hook",
		sync_possession = true
	}
	self.max_amount = {
		ammo_bag = 2,
		doctor_bag = 2,
		ecm_jammer = 2,
		sentry_gun = 2,
		trip_mine = 6,
		first_aid_kit = 14,
		bodybags_bag = 2,
		grenades = 4,
		asset_ammo_bag = 4,
		asset_doctor_bag = 3,
		asset_grenade_crate = 3,
		asset_bodybags_bag = 3,
		asset_sentry_gun = 4
	}
	self.class_name_to_deployable_id = {
		AmmoBagBase = "ammo_bag",
		DoctorBagBase = "doctor_bag",
		FirstAidKitBase = "first_aid_kit",
		BodyBagsBagBase = "bodybags_bag"
	}
end
