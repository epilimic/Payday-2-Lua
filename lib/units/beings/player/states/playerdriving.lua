PlayerDriving = PlayerDriving or class(PlayerStandard)
PlayerDriving.IDS_STEER_LEFT_REDIRECT = Idstring("steering_wheel_left")
PlayerDriving.IDS_STEER_LEFT_STATE = Idstring("fps/wheel_turn_left")
PlayerDriving.IDS_STEER_RIGHT_REDIRECT = Idstring("steering_wheel_right")
PlayerDriving.IDS_STEER_RIGHT_STATE = Idstring("fps/wheel_turn_right")
PlayerDriving.IDS_STEER_IDLE_REDIRECT = Idstring("steering_wheel_idle")
function PlayerDriving:init(unit)
	PlayerDriving.super.init(self, unit)
	self._vehicle = nil
	self._dt = 0
	self._move_x = 0
end
function PlayerDriving:enter(state_data, enter_data)
	print("PlayerDriving:enter( enter_data )")
	PlayerDriving.super.enter(self, state_data, enter_data)
end
function PlayerDriving:_enter(enter_data)
	self:_get_vehicle()
	if self._vehicle == nil then
		print("[DRIVING] No vehicle found")
		return
	end
	if self._vehicle_ext:get_view() == nil then
		print("[DRIVING] No vehicle view point found")
		return
	end
	self._seat = self._vehicle_ext:find_seat_for_player(self._unit)
	local rot = self._seat.object:rotation()
	self._unit:set_rotation(rot)
	local pos = self._seat.object:position()
	self._unit:set_position(pos)
	self._unit:camera():set_rotation(rot)
	self._unit:camera():set_position(pos)
	self._unit:camera():camera_unit():base():set_spin(0)
	self._unit:camera():camera_unit():base():set_pitch(0)
	if self._seat.driving then
		self._camera_unit:base():set_limits(30, 20)
		self._unit:inventory():hide_equipped_unit()
		if self._vehicle_unit:damage():has_sequence("local_driving_enter") then
			self._vehicle_unit:damage():run_sequence("local_driving_enter")
		end
		self._camera_unit:anim_state_machine():set_global(self._vehicle_ext._tweak_data.animations.vehicle_id, 1)
	else
		self._camera_unit:base():set_limits(80, 30)
	end
	self._unit:camera():set_shaker_parameter("breathing", "amplitude", 0)
	self:_setup_controller()
	self._unit:camera()._camera_unit:base():animate_fov(self._vehicle_ext._tweak_data.fov, 0.33)
end
function PlayerDriving:exit(state_data, new_state_name)
	print("[DRIVING] PlayerDriving: Exiting vehicle")
	PlayerDriving.super.exit(self, state_data, new_state_name)
	self:_clear_controller()
	local exit_position = self._vehicle_ext:find_exit_position(self._unit)
	local exit_rot = exit_position:rotation()
	self._unit:set_rotation(exit_rot)
	self._unit:camera():set_rotation(exit_rot)
	local pos = exit_position:position() + Vector3(0, 0, 30)
	self._unit:set_position(pos)
	self._unit:camera():set_position(pos)
	self._unit:camera():camera_unit():base():set_spin(exit_rot:y():to_polar().spin)
	self._unit:camera():camera_unit():base():set_pitch(0)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	self._unit:camera():camera_unit():base().bipod_location = nil
	self._unit:camera():camera_unit():base():remove_limits()
	if self._vehicle_unit:damage():has_sequence("local_driving_exit") then
		self._vehicle_unit:damage():run_sequence("local_driving_exit")
	end
	if self._seat.driving then
		self._unit:inventory():show_equipped_unit()
	end
	managers.player:exit_vehicle()
	self._dye_risk = nil
	self._state_data.in_air = false
	local exit_data = {}
	exit_data.skip_equip = true
	local velocity = self._unit:mover():velocity()
	self:_activate_mover(PlayerStandard.MOVER_STAND, velocity)
	self._ext_network:send("set_pose", 1)
	self:_upd_attention()
	self._unit:camera()._camera_unit:base():animate_fov(75, 0.33)
	return exit_data
end
function PlayerDriving:update(t, dt)
	if self._vehicle == nil or not self._vehicle:is_active() then
		print("[DRIVING] No vehicle present or active")
		return
	end
	if self._controller == nil then
		print("[DRIVING] No controller available")
		return
	end
	self:_update_input(dt)
	if self._seat.driving then
		self:_update_check_actions_driver(t, dt)
	else
		self:_update_check_actions(t, dt)
	end
end
function PlayerDriving:set_tweak_data(name)
end
function PlayerDriving:_update_check_actions_driver(t, dt)
	local input = self:_get_input()
	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end
	self:_update_foley(t, input)
end
function PlayerDriving:_check_action_run(...)
end
function PlayerDriving:pre_destroy(unit)
end
function PlayerDriving:destroy()
end
function PlayerDriving:_get_vehicle()
	self._vehicle_unit = managers.player:get_vehicle().vehicle_unit
	if self._vehicle_unit == nil then
		print("[DRIVING] no vehicles found in the scene")
		return
	end
	self._vehicle_ext = self._vehicle_unit:vehicle_driving()
	self._vehicle = self._vehicle_unit:vehicle()
end
function PlayerDriving:_setup_controller()
	self._controller = self._unit:base():controller()
	self._leave_cb = callback(self, self, "cb_leave")
	self._controller:add_trigger("interact", self._leave_cb)
end
function PlayerDriving:_clear_controller()
	if self._controller then
		self._controller:remove_trigger("interact", self._leave_cb)
	end
end
function PlayerDriving:set_controller_enabled(enabled)
	if self._controller then
		self._controller:set_enabled(enabled)
	end
end
function PlayerDriving:cb_leave()
	local exit_position = self._vehicle_ext:find_exit_position(self._unit)
	if exit_position == nil then
		print("[DRIVING] PlayerDriving: Could not found valid exit position, aborting exit.")
		managers.hint:show_hint("cant_exit_vehicle", 3)
		return
	end
	local vehicle_state = self._vehicle:get_state()
	local speed = vehicle_state:get_speed() * 3.6
	local player = managers.player:player_unit()
	self._unit:camera():play_redirect(self.IDS_IDLE)
	managers.player:set_player_state("standard")
end
function PlayerDriving:_update_input(dt)
	if self._seat.driving then
		local move_d = self._controller:get_input_axis("move")
		local direction = 1
		local forced_gear = -1
		local vehicle_state = self._vehicle:get_state()
		local steer = self._vehicle:get_steer()
		if steer == 0 then
			self._unit:camera():play_redirect(self.IDS_STEER_IDLE_REDIRECT)
			self._vehicle_unit:anim_stop(Idstring("anim_steering_wheel_left"))
			self._vehicle_unit:anim_stop(Idstring("anim_steering_wheel_right"))
		end
		if steer > 0 then
			self._vehicle_unit:anim_stop(Idstring("anim_steering_wheel_right"))
			local anim_length = self._vehicle_unit:anim_length(Idstring("anim_steering_wheel_left"))
			self._vehicle_unit:anim_set_time(Idstring("anim_steering_wheel_left"), math.abs(steer) * anim_length)
			self._vehicle_unit:anim_play(Idstring("anim_steering_wheel_left"))
			self._unit:camera():play_redirect_timeblend(self.IDS_STEER_LEFT_STATE, self.IDS_STEER_LEFT_REDIRECT, 0, math.abs(steer))
		end
		if steer < 0 then
			self._vehicle_unit:anim_stop(Idstring("anim_steering_wheel_left"))
			local anim_length = self._vehicle_unit:anim_length(Idstring("anim_steering_wheel_right"))
			self._vehicle_unit:anim_set_time(Idstring("anim_steering_wheel_right"), math.abs(steer) * anim_length)
			self._vehicle_unit:anim_play(Idstring("anim_steering_wheel_right"))
			self._unit:camera():play_redirect_timeblend(self.IDS_STEER_RIGHT_STATE, self.IDS_STEER_RIGHT_REDIRECT, 0, math.abs(steer))
		end
		local speed_anim_length = self._vehicle_unit:anim_length(Idstring("ag_speedometer"))
		local rpm_anim_length = self._vehicle_unit:anim_length(Idstring("ag_rpm_meter"))
		local speed = vehicle_state:get_speed() * 3.6
		speed = speed * 1.25
		local rpm = vehicle_state:get_rpm()
		local max_speed = self._vehicle_ext._tweak_data.max_speed
		local max_rpm = self._vehicle:get_max_rpm()
		local relative_speed = speed / max_speed
		if relative_speed > 1 then
			relative_speed = 1
		end
		relative_speed = relative_speed * speed_anim_length
		local relative_rpm = rpm / max_rpm
		if relative_rpm > 1 then
			relative_rpm = 1
		end
		relative_rpm = relative_rpm * rpm_anim_length
		self._vehicle_unit:anim_set_time(Idstring("ag_speedometer"), relative_speed)
		self._vehicle_unit:anim_play(Idstring("ag_speedometer"))
		self._vehicle_unit:anim_set_time(Idstring("ag_rpm_meter"), relative_rpm)
		self._vehicle_unit:anim_play(Idstring("ag_rpm_meter"))
		if vehicle_state:get_speed() < 0.5 and 0 > move_d.y and vehicle_state:get_gear() ~= 0 then
			forced_gear = 0
		end
		if vehicle_state:get_speed() < 0.5 and 0 < move_d.y and vehicle_state:get_gear() ~= 2 then
			forced_gear = 2
		end
		if vehicle_state:get_gear() == 0 and move_d.y ~= 0 then
			direction = -1
		end
		local accelerate = 0
		local brake = 0
		if direction > 0 then
			if 0 < move_d.y then
				accelerate = move_d.y
			else
				brake = -move_d.y
			end
		elseif 0 < move_d.y then
			brake = move_d.y
		else
			accelerate = -move_d.y
		end
		local input_held = self._controller:get_any_input()
		local btn_handbrake_held = input_held and self._controller:get_input_bool("jump")
		local handbrake = 0
		if btn_handbrake_held then
			handbrake = 1
		end
		if move_d.x == 0 and 0 < math.abs(self._move_x) then
			self._dt = dt
			self._max_steer = math.abs(steer)
		else
			self._max_steer = 0
		end
		if math.abs(move_d.x) > math.abs(self._move_x) then
		end
		if 0 < self._dt and self._dt < self._max_steer then
			self._move_x = self:smoothstep(0, self._max_steer, self._dt, self._max_steer) * math.sign(self._move_x)
			self._dt = self._dt + dt
		elseif math.abs(move_d.x) == 1 and math.abs(self._move_x) < 0.99 then
			self._move_x = self:smoothstep(math.abs(move_d.x), 0, self._dt, math.abs(move_d.x)) * math.sign(move_d.x)
			self._dt = self._dt + dt
		else
			self._move_x = move_d.x
			self._dt = 0
		end
		local back_light = self._vehicle_unit:get_object(Idstring("light_back"))
		local back_light_effect = self._vehicle_unit:get_object(Idstring("g_lights_rear_effect"))
		if back_light and brake > 0 then
			back_light:set_enable(true)
		elseif back_light then
			back_light:set_enable(false)
		end
		if back_light_effect and brake > 0 then
			back_light_effect:set_visibility(true)
		elseif back_light_effect then
			back_light_effect:set_visibility(false)
		end
		self._vehicle_ext:set_input(accelerate, self._move_x * -1, brake, handbrake, false, false, forced_gear)
	else
	end
end
function PlayerDriving:smoothstep(a, b, step, n)
	local v = step / n
	v = 1 - (1 - v) * (1 - v)
	local x = a * v + b * (1 - v)
	return x
end
