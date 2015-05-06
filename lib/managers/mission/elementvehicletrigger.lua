ElementVehicleTrigger = ElementVehicleTrigger or class(CoreMissionScriptElement.MissionScriptElement)
function ElementVehicleTrigger:init(...)
	ElementVehicleTrigger.super.init(self, ...)
	Application:debug("ElementVehicleTrigger:init")
end
function ElementVehicleTrigger:on_script_activated()
	Application:debug("ElementVehicleTrigger:on_script_activated")
	managers.vehicle:add_listener(self._id, {
		"player_entered_vehicle",
		"player_exited_vehicle"
	}, callback(self, self, Network:is_client() and "send_to_host" or "on_executed"))
end
function ElementVehicleTrigger:on_player_entered_vehicle(instigator)
	Application:debug("ElementVehicleTrigger:on_player_entered_vehicle")
	self:on_executed(instigator)
end
function ElementVehicleTrigger:on_player_exited_vehicle(instigator)
	Application:debug("ElementVehicleTrigger:on_player_exited_vehicle")
	self:on_executed(instigator)
end
function ElementVehicleTrigger:send_to_host(instigator)
	if instigator then
		managers.network:session():send_to_host("to_server_mission_element_trigger", self._id, nil)
	end
end
function ElementVehicleTrigger:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	Application:debug("ElementVehicleTrigger:on_executed")
	ElementVehicleTrigger.super.on_executed(self, self._unit or instigator)
end
