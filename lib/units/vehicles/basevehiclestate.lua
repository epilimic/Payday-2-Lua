BaseVehicleState = BaseVehicleState or class()
function BaseVehicleState:init(unit)
	self._unit = unit
end
function BaseVehicleState:update(t, dt)
	self._unit:vehicle_driving():_wake_nearby_dynamics()
	self._unit:vehicle_driving():_detect_npc_collisions()
	self._unit:vehicle_driving():_detect_collisions(t, dt)
	self._unit:vehicle_driving():_detect_invalid_possition(t, dt)
	self._unit:vehicle_driving():_play_sound_events(t, dt)
	self._unit:vehicle_driving():_move_team_ai()
end
function BaseVehicleState:enter(state_data, enter_data)
end
function BaseVehicleState:exit(state_data)
end
function BaseVehicleState:get_action_for_interaction(pos, locator)
	local action = VehicleDrivingExt.INTERACT_INVALID
	local locator_name = locator:name()
	if locator_name == VehicleDrivingExt.LOCATOR_INTERACT_DRIVE then
		action = VehicleDrivingExt.INTERACT_DRIVE
	elseif locator_name == VehicleDrivingExt.LOCATOR_INTERACT_ENTER or locator_name == VehicleDrivingExt.LOCATOR_INTERACT_ENTER_FRONT or locator_name == VehicleDrivingExt.LOCATOR_INTERACT_ENTER_BACK_LEFT or locator_name == VehicleDrivingExt.LOCATOR_INTERACT_ENTER_BACK_RIGHT then
		action = VehicleDrivingExt.INTERACT_ENTER
	elseif locator_name == VehicleDrivingExt.LOCATOR_INTERACT_LOOT_LEFT or locator_name == VehicleDrivingExt.LOCATOR_INTERACT_LOOT_RIGHT or locator_name == VehicleDrivingExt.LOCATOR_INTERACT_LOOT and self._unit:vehicle_driving()._loot and #self._unit:vehicle_driving()._loot > 0 then
		action = VehicleDrivingExt.INTERACT_LOOT
	elseif locator_name == VehicleDrivingExt.LOCATOR_INTERACT_REPAIR then
		action = VehicleDrivingExt.INTERACT_REPAIR
	elseif locator_name == VehicleDrivingExt.LOCATOR_INTERACT_TRUNK then
		action = VehicleDrivingExt.INTERACT_TRUNK
	end
	return action
end
function BaseVehicleState:adjust_interactions()
	if not self._unit:vehicle_driving():is_interaction_allowed() then
		self:disable_interactions()
	end
end
function BaseVehicleState:disable_interactions()
	if self._unit:damage() and self._unit:damage():has_sequence(VehicleDrivingExt.INTERACT_ENTRY_ENABLED) then
		self._unit:damage():run_sequence_simple(VehicleDrivingExt.INTERACT_ENTRY_DISABLED)
		self._unit:damage():run_sequence_simple(VehicleDrivingExt.INTERACT_LOOT_DISABLED)
		self._unit:damage():run_sequence_simple(VehicleDrivingExt.INTERACT_REPAIR_DISABLED)
		self._unit:damage():run_sequence_simple(VehicleDrivingExt.INTERACT_INTERACTION_DISABLED)
		self._unit:vehicle_driving()._interaction_enter_vehicle = false
		self._unit:vehicle_driving()._interaction_loot = false
		self._unit:vehicle_driving()._interaction_trunk = false
		self._unit:vehicle_driving()._interaction_repair = false
	end
end
function BaseVehicleState:allow_exit()
	return true
end
function BaseVehicleState:is_vulnerable()
	return false
end
function BaseVehicleState:stop_vehicle()
	return false
end
