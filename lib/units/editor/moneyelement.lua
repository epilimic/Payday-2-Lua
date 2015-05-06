MoneyUnitElement = MoneyUnitElement or class(MissionElement)
function MoneyUnitElement:init(unit)
	MoneyUnitElement.super.init(self, unit)
	self._hed.action = "none"
	table.insert(self._save_values, "action")
end
function MoneyUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_combobox(panel, panel_sizer, "action", {"none"})
end
