NpcVehicleStateBroken = NpcVehicleStateBroken or class(NpcBaseVehicleState)
function NpcVehicleStateBroken:init(unit)
	NpcBaseVehicleState.init(self, unit)
end
function NpcVehicleStateBroken:update(t, dt)
end
function NpcVehicleStateBroken:name()
	return NpcVehicleDrivingExt.STATE_BROKEN
end
function NpcVehicleStateBroken:on_enter()
	print("NpcVehicleStateBroken:on_enter()")
	self._unit:character_damage():spawn_broken_smoke_effect()
end
