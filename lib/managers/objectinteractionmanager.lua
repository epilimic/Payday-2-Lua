ObjectInteractionManager = ObjectInteractionManager or class()
ObjectInteractionManager.FRAMES_TO_COMPLETE = 15
function ObjectInteractionManager:init()
	self._interactive_objects = {}
	self._interactive_count = 0
	self._update_index = 0
	self._close_objects = {}
	self._close_index = 0
	self._close_freq = 1
	self._active_object = nil
	self._slotmask_world_geometry = managers.slot:get_mask("world_geometry")
end
function ObjectInteractionManager:update(t, dt)
	local player_unit = managers.player:player_unit()
	if self._interactive_count > 0 and alive(player_unit) then
		local player_pos = player_unit:movement():m_head_pos()
		self:_update_targeted(player_pos, player_unit)
	end
end
function ObjectInteractionManager:interact(player)
	if alive(self._active_object) then
		local interacted, timer = self._active_object:interaction():interact_start(player)
		if timer then
			self._active_object_locked_data = true
		end
		return interacted or interacted == nil or false, timer, self._active_object
	end
	return false
end
function ObjectInteractionManager:end_action_interact(player)
	self._active_object_locked_data = nil
	if alive(self._active_object) then
		self._active_object:interaction():interact(player)
	end
end
function ObjectInteractionManager:interupt_action_interact()
	self._active_object_locked_data = nil
end
function ObjectInteractionManager:active_object()
	return self._active_object
end
function ObjectInteractionManager:add_object(obj)
	table.insert(self._interactive_objects, obj)
	self._interactive_count = self._interactive_count + 1
	self._close_freq = math.max(1, math.floor(#self._interactive_objects / self.FRAMES_TO_COMPLETE))
end
function ObjectInteractionManager:remove_object(obj)
	for k, v in pairs(self._interactive_objects) do
		if v == obj then
			table.remove(self._interactive_objects, k)
			self._interactive_count = self._interactive_count - 1
			self._close_freq = math.max(1, math.floor(#self._interactive_objects / self.FRAMES_TO_COMPLETE))
			if self._interactive_count == 0 then
				self._close_objects = {}
				if alive(self._active_object) then
					self._active_object:interaction():remove_interact()
				end
				self._active_object = nil
			end
			return
		end
	end
end
local mvec1 = Vector3()
local index_table = {}
function ObjectInteractionManager:_update_targeted(player_pos, player_unit)
	local mvec3_dis = mvector3.distance
	if #self._close_objects > 0 then
		for k, v in pairs(self._close_objects) do
			if alive(v) and v:interaction():active() then
				if mvec3_dis(player_pos, v:interaction():interact_position()) > v:interaction():interact_distance() then
					table.remove(self._close_objects, k)
				end
			else
				table.remove(self._close_objects, k)
			end
		end
	end
	for i = 1, self._close_freq do
		if self._close_index >= self._interactive_count then
			self._close_index = 1
		else
			self._close_index = self._close_index + 1
		end
		local obj = self._interactive_objects[self._close_index]
		if alive(obj) and obj:interaction():active() and not self:_in_close_list(obj) and mvec3_dis(player_pos, obj:interaction():interact_position()) <= obj:interaction():interact_distance() then
			table.insert(self._close_objects, obj)
		end
	end
	local locked = false
	if self._active_object_locked_data then
		if not alive(self._active_object) or not self._active_object:interaction():active() then
			self._active_object_locked_data = nil
		else
			locked = self._active_object:interaction():interact_dont_interupt_on_distance() or mvec3_dis(player_pos, self._active_object:interaction():interact_position()) <= self._active_object:interaction():interact_distance()
		end
	end
	if locked then
		return
	end
	local optimized = true
	local last_active = self._active_object
	local last_dot = optimized and last_active and self._current_dot or nil
	local blocked = player_unit:movement():object_interaction_blocked()
	if #self._close_objects > 0 and not blocked then
		local active_obj
		local current_dot = last_dot or 0.9
		local player_fwd = player_unit:camera():forward()
		local camera_pos = player_unit:camera():position()
		self._close_test_index = self._close_test_index or 0
		self._close_test_index = self._close_test_index + 1
		if self._close_test_index > #self._close_objects then
			self._close_test_index = 1
		end
		local contains = table.contains(self._close_objects, last_active)
		if optimized then
		else
		end
		for k, v in pairs({
			contains and last_active,
			self._close_objects[self._close_test_index]
		} or self._close_objects) do
			if alive(v) and v:interaction():can_select(player_unit) then
				mvector3.set(mvec1, v:interaction():interact_position())
				mvector3.subtract(mvec1, camera_pos)
				mvector3.normalize(mvec1)
				local dot = mvector3.dot(player_fwd, mvec1)
				if current_dot < dot or optimized and alive(last_active) and v == last_active and dot > 0.9 then
					local interact_axis = v:interaction():interact_axis()
					if (not interact_axis or 0 > mvector3.dot(mvec1, interact_axis)) and self:_raycheck_ok(v, camera_pos) then
						current_dot = dot
						active_obj = v
					end
				end
			end
		end
		if active_obj and self._active_object ~= active_obj then
			if alive(self._active_object) then
				self._active_object:interaction():unselect()
			end
			if not active_obj:interaction():selected(player_unit) then
				active_obj = nil
			end
		elseif alive(self._active_object) and self._active_object:interaction():dirty() then
			self._active_object:interaction():set_dirty(false)
			self._active_object:interaction():unselect()
			if not self._active_object:interaction():selected(player_unit) then
				active_obj = nil
			end
		end
		self._active_object = active_obj
		self._current_dot = current_dot
	else
		self._active_object = nil
	end
	if alive(last_active) and not self._active_object then
		self._active_object = nil
		last_active:interaction():unselect()
	end
end
local m_obj_pos = Vector3()
function ObjectInteractionManager:_raycheck_ok(obj, camera_pos)
	local check_objects = obj:interaction():ray_objects()
	if not check_objects then
		return true
	end
	for _, object in ipairs(check_objects) do
		object:m_position(m_obj_pos)
		local obstructed = obj:raycast("ray", m_obj_pos, camera_pos, "ray_type", "bag body", "slot_mask", self._slotmask_world_geometry, "report")
		if not obstructed then
			return true
		end
	end
	return false
end
function ObjectInteractionManager:_in_close_list(obj)
	if #self._close_objects > 0 then
		for k, v in pairs(self._close_objects) do
			if v == obj then
				return true
			end
		end
	end
	return false
end
