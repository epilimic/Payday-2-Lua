NpcVehicleStatePlayerProximity = NpcVehicleStatePlayerProximity or class(NpcBaseVehicleState)
function NpcVehicleStatePlayerProximity:init(unit)
	NpcBaseVehicleState.init(self, unit)
end
function NpcVehicleStatePlayerProximity:on_enter(npc_driving_ext)
	print("Npc state change: ", self:name())
end
function NpcVehicleStatePlayerProximity:update(t, dt)
end
function NpcVehicleStatePlayerProximity:name()
	return NpcVehicleDrivingExt.STATE_PLAYER_PROXIMITY
end
function NpcVehicleStatePlayerProximity:change_state(npc_driving_ext)
	local player_unit = npc_driving_ext:_get_target_unit()
	if not player_unit then
		return
	end
	local player_position = player_unit:position()
	local cop_position = self._unit:position()
	local distance_to_player = math.abs(player_position - cop_position:length()) / 100
	local PLAYER_DISTANCE_THRESHOLD = 20
	if npc_driving_ext._debug.nav_paths then
		npc_driving_ext._debug.nav_paths.distance_to_player = distance_to_player
	end
	if distance_to_player >= PLAYER_DISTANCE_THRESHOLD then
		npc_driving_ext:set_state(NpcVehicleDrivingExt.STATE_PURSUIT)
	end
end
