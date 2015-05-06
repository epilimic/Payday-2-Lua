VehicleManager = VehicleManager or class()
function VehicleManager:init()
	self._vehicles = {}
	Application:debug("VehicleManager:init")
	self._listener_holder = EventListenerHolder:new()
end
function VehicleManager:on_simulation_started()
	for i = #self._vehicles, 1, -1 do
		if not alive(self._vehicles[i]) then
			table.remove(self._vehicles, i)
		end
	end
end
function VehicleManager:on_simulation_ended()
	for i, v in ipairs(self._vehicles) do
		v:vehicle_driving():stop_all_sound_events()
	end
	self._vehicles = {}
	self._listener_holder = EventListenerHolder:new()
end
function VehicleManager:_call_listeners(event, params)
	self._listener_holder:call(event, params)
end
function VehicleManager:add_listener(key, events, clbk)
	self._listener_holder:add(key, events, clbk)
end
function VehicleManager:remove_listener(key)
	self._listener_holder:remove(key)
end
function VehicleManager:add_vehicle(vehicle)
	table.insert(self._vehicles, vehicle)
end
function VehicleManager:remove_vehicle(vehicle)
	table.delete(vehicle)
end
function VehicleManager:get_all_vehicles()
	return self._vehicles
end
function VehicleManager:get_vehicle(animation_id)
	for i, v in ipairs(self._vehicles) do
		if v:vehicle_driving()._tweak_data.animations.vehicle_id == animation_id then
			return v
		end
	end
	return nil
end
function VehicleManager:on_player_entered_vehicle(vehicle_unit, player)
	self._listener_holder:call("player_entered_vehicle", player)
end
function VehicleManager:on_player_exited_vehicle(vehicle_unit, player)
	self._listener_holder:call("player_exited_vehicle", player)
end
function VehicleManager:remove_player_from_all_vehicles(player)
	Application:debug("[VehicleManager] Removing player from all vehicles")
	for i, v in ipairs(self._vehicles) do
		v:vehicle_driving():exit_vehicle(player)
	end
end
function VehicleManager:update_vehicles_data_to_peer(peer)
	if peer:ip_verified() then
		for i, v in ipairs(self._vehicles) do
			local v_ext = v:vehicle_driving()
			Application:debug("[VehicleManager] Syncing vehicle data for... " .. v_ext._unit:id())
			local driver, passenger_front, passenger_back_left, passenger_back_right
			if v_ext._seats.driver and alive(v_ext._seats.driver.occupant) then
				driver = v_ext._seats.driver.occupant
			end
			if v_ext._seats.passenger_front and alive(v_ext._seats.passenger_front.occupant) then
				passenger_front = v_ext._seats.passenger_front.occupant
			end
			if v_ext._seats.passenger_back_left and alive(v_ext._seats.passenger_back_left.occupant) then
				passenger_back_left = v_ext._seats.passenger_back_left.occupant
			end
			if v_ext._seats.passenger_back_right and alive(v_ext._seats.passenger_back_right.occupant) then
				passenger_back_right = v_ext._seats.passenger_back_right.occupant
			end
			peer:send_queued_sync("sync_vehicles_data", v_ext._unit, v_ext._state, driver, passenger_front, passenger_back_left, passenger_back_right)
		end
	end
end
function VehicleManager:sync_vehicles_data(vehicle_unit, state, occupant_driver, occupant_left, occupant_back_left, occupant_back_right)
	for i, v in ipairs(self._vehicles) do
		if v == vehicle_unit then
			local v_ext = v:vehicle_driving()
			local vehicle = vehicle_unit:vehicle()
			Application:debug("[VehicleManager] Syncing vehicle data for... " .. vehicle_unit:id())
			if v_ext._seats.driver then
				v_ext._seats.driver.occupant = occupant_driver
				if occupant_driver then
					vehicle_unit:link(Idstring(VehicleDrivingExt.SEAT_PREFIX .. v_ext._seats.driver.name), occupant_driver)
					local member = managers.network:game():member_from_unit(occupant_driver)
					if member then
						local peer_id = managers.network:game():member_from_unit(occupant_driver):peer():id()
						managers.player._global.synced_vehicle_data[peer_id] = {
							vehicle_unit = v,
							seat = v_ext._seats.driver.name
						}
					end
				end
			end
			if v_ext._seats.passenger_front then
				v_ext._seats.passenger_front.occupant = occupant_left
				if occupant_left then
					vehicle_unit:link(Idstring(VehicleDrivingExt.SEAT_PREFIX .. v_ext._seats.passenger_front.name), occupant_left)
					local member = managers.network:game():member_from_unit(occupant_left)
					if member then
						local peer_id = managers.network:game():member_from_unit(occupant_left):peer():id()
						managers.player._global.synced_vehicle_data[peer_id] = {
							vehicle_unit = v,
							seat = v_ext._seats.passenger_front.name
						}
					end
				end
			end
			if v_ext._seats.passenger_back_left then
				v_ext._seats.passenger_back_left.occupant = occupant_back_left
				if occupant_back_left then
					vehicle_unit:link(Idstring(VehicleDrivingExt.SEAT_PREFIX .. v_ext._seats.passenger_back_left.name), occupant_back_left)
					local member = managers.network:game():member_from_unit(occupant_back_left)
					if member then
						local peer_id = managers.network:game():member_from_unit(occupant_back_left):peer():id()
						managers.player._global.synced_vehicle_data[peer_id] = {
							vehicle_unit = v,
							seat = v_ext._seats.passenger_back_left.name
						}
					end
				end
			end
			if v_ext._seats.passenger_back_right then
				v_ext._seats.passenger_back_right.occupant = occupant_back_right
				if occupant_back_right then
					vehicle_unit:link(Idstring(VehicleDrivingExt.SEAT_PREFIX .. v_ext._seats.passenger_back_right.name), occupant_back_right)
					local member = managers.network:game():member_from_unit(occupant_back_right)
					if member then
						local peer_id = managers.network:game():member_from_unit(occupant_back_right):peer():id()
						managers.player._global.synced_vehicle_data[peer_id] = {
							vehicle_unit = v,
							seat = v_ext._seats.passenger_back_right.name
						}
					end
				end
			end
			Application:debug("[VehicleManager]", inspect(managers.player._global.synced_vehicle_data))
			if state ~= VehicleDrivingExt.STATE_INACTIVE then
				v:damage():run_sequence_simple("driving")
				v:vehicle():set_active(true)
				v_ext:set_state(state)
			end
		end
	end
end
function VehicleManager:find_active_vehicle_with_player()
	Application:debug("[VehicleManager] find_active_vehicle_with_player()")
	for i, v in ipairs(self._vehicles) do
		if v:vehicle_driving()._vehicle:is_active() then
			local v_ext = v:vehicle_driving()
			local has_free_seat = false
			local has_player = false
			for _, seat in pairs(v_ext._seats) do
				local occupant = seat.occupant
				Application:debug(inspect(seat))
				if occupant == nil then
					has_free_seat = true
				elseif alive(occupant) and occupant:brain() or not alive(occupant) then
					has_free_seat = true
				else
					has_player = true
				end
			end
			if has_free_seat and has_player then
				return v
			end
		end
	end
	return nil
end
