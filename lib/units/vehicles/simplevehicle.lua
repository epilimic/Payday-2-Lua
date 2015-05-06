SimpleVehicle = SimpleVehicle or class()
function SimpleVehicle:init(unit)
	self._unit = unit
	print(self.ANIM_GROUP_NAME)
	self.ANIM_GROUP = Idstring(self.ANIM_GROUP_NAME or "drive")
	print(self.ANIM_GROUP_NAME)
	self._max_time_speed = 0.001
	self._target_anim_time = 0
	self._current_time_speed = 0
	self._target_time_speed = self._current_time_speed
	self._current_anim_speed = 0
	self._target_anim_speed = self._current_anim_speed
end
function SimpleVehicle:update(unit, t, dt)
	if not self._stopped then
		self._current_time_speed = math.step(self._current_time_speed, self._target_time_speed, 0.001 * dt)
		self:_set_anim_time(self._unit:anim_time(self.ANIM_GROUP) + self._current_time_speed)
	end
	self:_check_reached_target_anim_time()
end
function SimpleVehicle:_check_reached_target_anim_time()
	if self._unit:anim_time(self.ANIM_GROUP) >= self._target_anim_time then
	end
end
function SimpleVehicle:stop()
	self:deaccelerate_to(0)
end
function SimpleVehicle:anim_set_time(anim_time)
	self._unit:anim_set_time(self.ANIM_GROUP, anim_time)
end
function SimpleVehicle:set_target_anim_time(anim_time)
	self._target_anim_time = anim_time
end
function SimpleVehicle:set_target_time_speed(time_speed)
	self._target_time_speed = time_speed
end
function SimpleVehicle:accelerate_to(anim_speed)
	self._target_anim_speed = anim_speed
	self._stopped = false
end
function SimpleVehicle:deaccelerate_to(anim_speed)
	self._target_anim_speed = anim_speed
	self._stopped = false
end
function SimpleVehicle:_anim_stop()
	print("SimpleVehicle:_anim_stop()")
	self._stopped = true
end
function SimpleVehicle:_set_anim_time(anim_time)
	self._unit:anim_set_time(self.ANIM_GROUP, anim_time)
end
function SimpleVehicle:_set_anim_speed(anim_speed)
end
function SimpleVehicle:save(data)
	local state = {}
	data.SimpleVehicle = state
end
function SimpleVehicle:load(data)
	state = data.SimpleVehicle
end
function SimpleVehicle:destroy()
end
