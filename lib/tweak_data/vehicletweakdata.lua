VehicleTweakData = VehicleTweakData or class()
function VehicleTweakData:init(tweak_data)
	self:_init_data_falcogini()
	self:_init_data_muscle()
	self:_init_data_forklift()
	self:_init_data_forklift_2()
	self:_init_data_box_truck_1()
	self:_init_data_mower_1()
	self:_init_data_boat_rib_1()
	self:_init_data_blackhawk_1()
end
function VehicleTweakData:_init_data_falcogini()
	self.falcogini = {}
	self.falcogini.name = "Falcogini"
	self.falcogini.hud_label_offset = 140
	self.falcogini.animations = {
		vehicle_id = "falcogini",
		driver = "drive_falcogini_driver",
		passenger_front = "drive_falcogini_passanger"
	}
	self.falcogini.sound = {
		bump_treshold = 5,
		lateral_slip_treshold = 0.25,
		longitudal_slip_treshold = 0.8,
		engine_sound_event = "falcogini",
		engine_start = "falcogini_engine_start",
		broken_engine = "falcogini_engine_broken_loop",
		fix_engine_loop = "falcogini_engine_fix_loop",
		fix_engine_stop = "falcogini_engine_fix_stop",
		door_close = "car_door_open",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.falcogini.seats = {
		driver = {name = "driver", driving = true},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = true,
			shooting_pos = Vector3(50, -20, 50)
		}
	}
	self.falcogini.loot_points = {
		loot = {name = "loot"}
	}
	self.falcogini.damage = {max_health = 100000}
	self.falcogini.max_speed = 200
	self.falcogini.max_rpm = 9000
	self.falcogini.loot_drop_point = "v_repair_engine"
	self.falcogini.max_loot_bags = 2
	self.falcogini.interact_distance = 350
	self.falcogini.driver_camera_offset = Vector3(0, 0, 2.5)
	self.falcogini.fov = 75
end
function VehicleTweakData:_init_data_muscle()
	self.muscle = {}
	self.muscle.name = "Longfellow"
	self.muscle.hud_label_offset = 150
	self.muscle.animations = {
		vehicle_id = "muscle",
		driver = "drive_muscle_driver",
		passenger_front = "drive_muscle_passanger",
		passenger_back_left = "drive_muscle_back_left",
		passenger_back_right = "drive_muscle_back_right"
	}
	self.muscle.sound = {
		bump_treshold = 8,
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.8,
		engine_sound_event = "muscle",
		broken_engine = "falcogini_engine_broken_loop",
		door_close = "car_door_open",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.muscle.seats = {
		driver = {name = "driver", driving = true},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = true,
			shooting_pos = Vector3(50, -20, 50)
		},
		passenger_back_left = {
			name = "passenger_back_left",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = true
		},
		passenger_back_right = {
			name = "passenger_back_right",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = true
		}
	}
	self.muscle.loot_points = {
		loot_left = {name = "loot_left"},
		loot_right = {name = "loot_right"},
		loot = {name = "loot"}
	}
	self.muscle.trunk_point = "trunk"
	self.muscle.damage = {max_health = 9000000}
	self.muscle.max_speed = 160
	self.muscle.max_rpm = 8000
	self.muscle.loot_drop_point = "v_repair_engine"
	self.muscle.max_loot_bags = 4
	self.muscle.interact_distance = 350
	self.muscle.driver_camera_offset = Vector3(0, 0.2, 2.5)
	self.muscle.fov = 75
end
function VehicleTweakData:_init_data_forklift()
	self.forklift = {}
	self.forklift.name = "Forklift"
	self.forklift.hud_label_offset = 220
	self.forklift.animations = {
		vehicle_id = "forklift",
		driver = "drive_forklift_driver",
		passenger_front = "drive_forklift_passanger"
	}
	self.forklift.sound = {
		bump_treshold = 5,
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		engine_sound_event = "forklift",
		engine_start = "forklift_start",
		door_close = "sit_down_in_forklift",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.forklift.seats = {
		driver = {name = "driver", driving = true},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = false
		}
	}
	self.forklift.loot_points = {
		loot_left = {name = "loot"}
	}
	self.forklift.damage = {max_health = 9000000}
	self.forklift.max_speed = 20
	self.forklift.max_rpm = 1600
	self.forklift.loot_drop_point = "v_repair_engine"
	self.forklift.max_loot_bags = 3
	self.forklift.interact_distance = 350
	self.forklift.driver_camera_offset = Vector3(0, 0, 7.5)
	self.forklift.fov = 70
end
function VehicleTweakData:_init_data_forklift_2()
	self.forklift_2 = {}
	self.forklift_2.name = "Forklift"
	self.forklift_2.hud_label_offset = 220
	self.forklift_2.animations = {
		vehicle_id = "forklift",
		driver = "drive_forklift_driver"
	}
	self.forklift_2.sound = {
		bump_treshold = 5,
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		engine_sound_event = "forklift",
		engine_start = "forklift_start",
		door_close = "sit_down_in_forklift",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.forklift_2.seats = {
		driver = {name = "driver", driving = true}
	}
	self.forklift_2.loot_points = {
		loot_left = {name = "loot"}
	}
	self.forklift_2.damage = {max_health = 100000}
	self.forklift_2.max_speed = 20
	self.forklift_2.max_rpm = 1600
	self.forklift_2.loot_drop_point = "v_repair_engine"
	self.forklift_2.max_loot_bags = 0
	self.forklift_2.interact_distance = 350
	self.forklift_2.driver_camera_offset = Vector3(0, 0, 7.5)
	self.forklift_2.fov = 70
end
function VehicleTweakData:_init_data_box_truck_1()
	self.box_truck_1 = {}
	self.box_truck_1.name = "Truck"
	self.box_truck_1.hud_label_offset = 325
	self.box_truck_1.animations = {
		vehicle_id = "truck",
		driver = "drive_truck_driver",
		passenger_front = "drive_truck_passanger",
		passenger_back_left = "drive_truck_back_left",
		passenger_back_right = "drive_truck_back_right"
	}
	self.box_truck_1.sound = {
		bump_treshold = 8,
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.98,
		engine_sound_event = "drive_truck",
		broken_engine = "falcogini_engine_broken_loop",
		door_close = "car_door_open",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.box_truck_1.seats = {
		driver = {name = "driver", driving = true},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = true,
			shooting_pos = Vector3(50, 0, 50)
		},
		passenger_back_left = {
			name = "passenger_back_left",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = true
		},
		passenger_back_right = {
			name = "passenger_back_right",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = true
		}
	}
	self.box_truck_1.loot_points = {
		loot_left = {name = "loot_left"},
		loot_right = {name = "loot_right"}
	}
	self.box_truck_1.damage = {max_health = 900000}
	self.box_truck_1.max_speed = 160
	self.box_truck_1.max_rpm = 8000
	self.box_truck_1.loot_drop_point = "v_repair_engine"
	self.box_truck_1.max_loot_bags = 50
	self.box_truck_1.interact_distance = 350
	self.box_truck_1.driver_camera_offset = Vector3(0, 0.2, 2.5)
	self.box_truck_1.fov = 75
end
function VehicleTweakData:_init_data_mower_1()
	self.mower_1 = {}
	self.mower_1.name = "Lawn Mower"
	self.mower_1.hud_label_offset = 80
	self.mower_1.animations = {
		vehicle_id = "mower_1",
		driver = "drive_mower_1_driver"
	}
	self.mower_1.sound = {
		bump_treshold = 5,
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		engine_sound_event = "forklift",
		engine_start = "forklift_start",
		door_close = "sit_down_in_forklift",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.mower_1.seats = {
		driver = {name = "driver", driving = true}
	}
	self.mower_1.loot_points = {
		loot_left = {name = "loot"}
	}
	self.mower_1.damage = {max_health = 9000000}
	self.mower_1.max_speed = 20
	self.mower_1.max_rpm = 1600
	self.mower_1.loot_drop_point = "v_repair_engine"
	self.mower_1.max_loot_bags = 1
	self.mower_1.interact_distance = 350
	self.mower_1.driver_camera_offset = Vector3(0, 0, 3.5)
	self.mower_1.fov = 70
end
function VehicleTweakData:_init_data_boat_rib_1()
	self.boat_rib_1 = {}
	self.boat_rib_1.name = "Rib Boat"
	self.boat_rib_1.hud_label_offset = 1
	self.boat_rib_1.animations = {
		vehicle_id = "boat_rib_1",
		driver = "drive_boat_rib_1_driver",
		passenger_front = "drive_boat_rib_1_passanger",
		passenger_back_left = "drive_boat_rib_1_back_left",
		passenger_back_right = "drive_boat_rib_1_back_right"
	}
	self.boat_rib_1.sound = {
		bump_treshold = 0.3,
		lateral_slip_treshold = 0.2,
		longitudal_slip_treshold = 0.2,
		engine_sound_event = "drive_rubber_boat",
		engine_start = "car_silence",
		door_close = "car_silence",
		going_reverse = "car_silence",
		going_reverse_stop = "car_silence",
		slip = "water_splash_skid",
		slip_stop = "car_silence",
		bump = "water_splash_bump",
		bump_rtpc = "car_bump_vel",
		hit = "water_splash_skid",
		hit_rtpc = "car_hit_vel",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_rpm_rtpc = "car_falcogini_rpm"
	}
	self.boat_rib_1.seats = {
		driver = {name = "driver", driving = true},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = false
		},
		passenger_back_left = {
			name = "passenger_back_left",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = false
		},
		passenger_back_right = {
			name = "passenger_back_right",
			driving = false,
			allow_shooting = true,
			has_shooting_mode = false
		}
	}
	self.boat_rib_1.loot_points = {
		loot_left = {name = "loot"}
	}
	self.boat_rib_1.damage = {max_health = 9000000}
	self.boat_rib_1.max_speed = 20
	self.boat_rib_1.max_rpm = 1600
	self.boat_rib_1.loot_drop_point = "v_repair_engine"
	self.boat_rib_1.max_loot_bags = 1
	self.boat_rib_1.interact_distance = 350
	self.boat_rib_1.driver_camera_offset = Vector3(0, 0, 3.5)
	self.boat_rib_1.fov = 70
end
function VehicleTweakData:_init_data_blackhawk_1()
	self.blackhawk_1 = {}
	self.blackhawk_1.name = "Blackhawk"
	self.blackhawk_1.hud_label_offset = 150
	self.blackhawk_1.animations = {
		vehicle_id = "blackhawk_1",
		driver = "drive_blackhawk_1_driver",
		passenger_front = "drive_blackhawk_1_passanger",
		passenger_back_left = "drive_blackhawk_1_back_left",
		passenger_back_right = "drive_blackhawk_1_back_right"
	}
	self.blackhawk_1.sound = {
		bump_treshold = 8,
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.8,
		engine_sound_event = "heli_silence",
		broken_engine = "heli_silence",
		engine_start = "heli_silence",
		door_close = "heli_silence",
		slip = "heli_silence",
		slip_stop = "heli_silence",
		bump = "heli_silence",
		bump_rtpc = "heli_silence",
		hit = "heli_silence",
		hit_rtpc = "heli_silence",
		engine_speed_rtpc = "heli_silence",
		engine_rpm_rtpc = "heli_silence"
	}
	self.blackhawk_1.seats = {
		driver = {
			name = "driver",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = false
		},
		passenger_front = {
			name = "passenger_front",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = false
		},
		passenger_back_left = {
			name = "passenger_back_left",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = false
		},
		passenger_back_right = {
			name = "passenger_back_right",
			driving = false,
			allow_shooting = false,
			has_shooting_mode = false
		}
	}
	self.blackhawk_1.loot_points = {
		loot_left = {name = "loot_left"},
		loot_right = {name = "loot_right"}
	}
	self.blackhawk_1.damage = {max_health = 9000000}
	self.blackhawk_1.max_speed = 160
	self.blackhawk_1.max_rpm = 8000
	self.blackhawk_1.loot_drop_point = "v_repair_engine"
	self.blackhawk_1.max_loot_bags = 4
	self.blackhawk_1.interact_distance = 350
	self.blackhawk_1.driver_camera_offset = Vector3(0, 0, 0)
	self.blackhawk_1.fov = 75
end
