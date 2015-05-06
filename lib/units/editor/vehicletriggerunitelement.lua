VehicleTriggerUnitElement = VehicleTriggerUnitElement or class(MissionElement)
function VehicleTriggerUnitElement:init(unit)
	Application:debug("VehicleTriggerUnitElement:init")
	VehicleTriggerUnitElement.super.init(self, unit)
	self._hed.trigger_times = 1
	self._hed.state = managers.player:default_player_state()
	table.insert(self._save_values, "state")
end
function VehicleTriggerUnitElement:_build_panel(panel, panel_sizer)
	Application:debug("VehicleTriggerUnitElement:_build_panel")
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_combobox(panel, panel_sizer, "state", managers.player:player_states(), "Select a state from the combobox")
	self:_add_help_text("Set the player state the element should trigger on.")
end
