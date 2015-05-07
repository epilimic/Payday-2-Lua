NpcVehicleStateManeuver = NpcVehicleStateManeuver or class(NpcBaseVehicleState)
function NpcVehicleStateManeuver:init(unit)
	NpcBaseVehicleState.init(self, unit)
end
function NpcVehicleStateManeuver:on_enter(npc_driving_ext)
	print("Npc state change: ", self:name())
end
function NpcVehicleStateManeuver:update(npc_driving_ext, t, dt)
end
function NpcVehicleStateManeuver:name()
	return NpcVehicleDrivingExt.STATE_MANEUVER
end
function NpcVehicleStateManeuver:change_state(npc_driving_ext)
end
function NpcVehicleStateManeuver:is_maneuvering()
	return true
end
function NpcVehicleStateManeuver:put_vehicle_on_path(npc_driving_ext)
	local cop_position = self._unit:position()
	local closest_point = {point_id = 0, distance = 200000}
	local all_paths = managers.motion_path._paths
	for _, path in ipairs(all_paths) do
		for idx, current_point_data in ipairs(path.points) do
			local point_in_front = self:_is_point_in_front(current_point_data.point, cop_position)
			if point_in_front then
				local distance = cop_position - current_point_data.point:length()
				if distance <= closest_point.distance and distance > 500 then
					closest_point.path = path
					closest_point.point_id = idx
					closest_point.distance = distance
				end
			end
		end
	end
	local unit_direction = self:_choose_target_path_direction(cop_position, closest_point)
	self._cop_unit_and_pos.direction = unit_direction
	self._cop_unit_and_pos.target_checkpoint = closest_point.point_id
	print("NpcVehicleStateManeuver:put_vehicle_on_path: ", closest_point.point_id, inspect(closest_point.path), inspect(self._cop_unit_and_pos))
	managers.motion_path:_assign_unit_to_path(closest_point.path, self._cop_unit_and_pos, closest_point.point_id)
end
function NpcVehicleStateManeuver:_is_point_in_front(target_position, cop_position)
	local fov = 90
	local target_direction = target_position - cop_position
	local vehicle_fwd_vector = self._unit:rotation():y():normalized()
	local target_direction_360 = math.mod(360 + target_direction:to_polar().spin, 360)
	local vehicle_fwd_vector_360 = math.mod(360 + vehicle_fwd_vector:to_polar().spin, 360)
	local target_spin_relative_to_vehicle = math.mod(360 + (target_direction_360 - vehicle_fwd_vector_360), 360)
	local in_front = target_spin_relative_to_vehicle > 0 and fov > target_spin_relative_to_vehicle or target_spin_relative_to_vehicle > 360 - fov and target_spin_relative_to_vehicle < 360
	return in_front
end
function NpcVehicleStateManeuver:_choose_target_path_direction(cop_position, target_path_info)
	local target_point_bck_id = #target_path_info.path.points - target_path_info.point_id + 1
	local point_forward = target_path_info.path.points[target_path_info.point_id + 1]
	local point_backward = target_path_info.path.points_bck[target_point_bck_id + 1]
	if not point_forward then
		return "bck"
	elseif not point_backward then
		return "fwd"
	elseif not point_forward and not point_backward then
		Application:error("Unable to choose path direction.")
		return
	end
	local distance_forward = cop_position - point_forward.point:length()
	local distance_backward = cop_position - point_backward.point:length()
	local retval
	if distance_forward >= distance_backward then
		retval = "fwd"
	else
		retval = "bck"
	end
	return retval
end
