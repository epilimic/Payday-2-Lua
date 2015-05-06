CoreOperatorUnitElement = CoreOperatorUnitElement or class(MissionElement)
CoreOperatorUnitElement.SAVE_UNIT_POSITION = false
CoreOperatorUnitElement.SAVE_UNIT_ROTATION = false
OperatorUnitElement = OperatorUnitElement or class(CoreOperatorUnitElement)
function OperatorUnitElement:init(...)
	OperatorUnitElement.super.init(self, ...)
end
function CoreOperatorUnitElement:init(unit)
	CoreOperatorUnitElement.super.init(self, unit)
	self._hed.operation = "none"
	self._hed.elements = {}
	table.insert(self._save_values, "operation")
	table.insert(self._save_values, "elements")
end
function CoreOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	CoreOperatorUnitElement.super.draw_links(self, t, dt, selected_unit)
	for _, id in ipairs(self._hed.elements) do
		local unit = all_units[id]
		if not alive(unit) then
			table.delete(self._hed.elements, id)
		else
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit
			if draw then
				self:_draw_link({
					from_unit = self._unit,
					to_unit = unit,
					r = 0.75,
					g = 0.75,
					b = 0.25
				})
			end
		end
	end
end
function CoreOperatorUnitElement:get_links_to_unit(...)
	CoreOperatorUnitElement.super.get_links_to_unit(self, ...)
	self:_get_links_of_type_from_elements(self._hed.elements, "operator", ...)
end
function CoreOperatorUnitElement:update_editing()
end
function CoreOperatorUnitElement:add_element()
	local ray = managers.editor:unit_by_raycast({mask = 10, ray_type = "editor"})
	if ray and ray.unit then
		local id = ray.unit:unit_data().unit_id
		if table.contains(self._hed.elements, id) then
			table.delete(self._hed.elements, id)
		else
			table.insert(self._hed.elements, id)
		end
	end
end
function CoreOperatorUnitElement:remove_links(unit)
	for _, id in ipairs(self._hed.elements) do
		if id == unit:unit_data().unit_id then
			table.delete(self._hed.elements, id)
		end
	end
end
function CoreOperatorUnitElement:add_triggers(vc)
	vc:add_trigger(Idstring("lmb"), callback(self, self, "add_element"))
end
function CoreOperatorUnitElement:add_unit_list_btn()
	local script = self._unit:mission_element_data().script
	local function f(unit)
		if not unit:mission_element_data() or unit:mission_element_data().script ~= script then
			return
		end
		local id = unit:unit_data().unit_id
		if table.contains(self._hed.elements, id) then
			return false
		end
		return managers.editor:layer("Mission"):category_map()[unit:type():s()]
	end
	local dialog = SelectUnitByNameModal:new("Add Unit", f)
	for _, unit in ipairs(dialog:selected_units()) do
		local id = unit:unit_data().unit_id
		table.insert(self._hed.elements, id)
	end
end
function CoreOperatorUnitElement:remove_unit_list_btn()
	local function f(unit)
		return table.contains(self._hed.elements, unit:unit_data().unit_id)
	end
	local dialog = SelectUnitByNameModal:new("Remove Unit", f)
	for _, unit in ipairs(dialog:selected_units()) do
		local id = unit:unit_data().unit_id
		table.delete(self._hed.elements, id)
	end
end
function CoreOperatorUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_combobox(panel, panel_sizer, "operation", {
		"none",
		"add",
		"remove"
	}, "Select an operation for the selected elements")
	local toolbar = EWS:ToolBar(panel, "", "TB_FLAT,TB_NODIVIDER")
	toolbar:add_tool("ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path("world_editor\\unit_by_name_list.png"), nil)
	toolbar:connect("ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(self, self, "add_unit_list_btn"), nil)
	toolbar:add_tool("REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path("toolbar\\delete_16x16.png"), nil)
	toolbar:connect("REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(self, self, "remove_unit_list_btn"), nil)
	toolbar:realize()
	panel_sizer:add(toolbar, 0, 1, "EXPAND,LEFT")
	self:_add_help_text("Choose an operation to perform on the selected elements. An element might not have the selected operation implemented and will then generate error when executed.")
end
