CharacterSequenceElement = SequenceCharacterElement or class(MissionElement)
CharacterSequenceElement.SAVE_UNIT_POSITION = false
CharacterSequenceElement.SAVE_UNIT_ROTATION = false
function CharacterSequenceElement:init(unit)
	CharacterSequenceElement.super.init(self, unit)
	self._hed.elements = {}
	self._hed.sequence = ""
	table.insert(self._save_values, "use_instigator")
	table.insert(self._save_values, "elements")
	table.insert(self._save_values, "sequence")
	self._element_units = {}
end
function CharacterSequenceElement:layer_finished()
	CharacterSequenceElement.super.layer_finished(self)
	for _, element_u_id in ipairs(self._hed.elements) do
		local unit = managers.worlddefinition:get_unit_on_load(element_u_id, callback(self, self, "load_element_unit"))
		if unit then
			self._element_units[unit:unit_data().unit_id] = unit
		end
	end
end
function CharacterSequenceElement:load_element_unit(unit)
	self._element_units[unit:unit_data().unit_id] = unit
end
function CharacterSequenceElement:_build_panel(panel, panel_sizer)
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_checkbox(panel, panel_sizer, "use_instigator")
	local text = EWS:TextCtrl(panel, self._hed.sequence, "", "TE_PROCESS_ENTER")
	text:connect("EVT_COMMAND_TEXT_ENTER", callback(self, self, "set_element_data"), {ctrlr = text, value = "sequence"})
	text:connect("EVT_KILL_FOCUS", callback(self, self, "set_element_data"), {ctrlr = text, value = "sequence"})
	panel_sizer:add(text, 0, 0, "EXPAND")
end
function CharacterSequenceElement:draw_links(t, dt, selected_unit, all_units)
	CharacterSequenceElement.super.draw_links(self, t, dt, selected_unit)
	self:_chk_units_alive()
	self:_draw_links(selected_unit)
end
function CharacterSequenceElement:_draw_links(selected_unit)
	if not selected_unit or self._unit == selected_unit then
		for element_u_id, unit in pairs(self._element_units) do
			self:_draw_link({
				from_unit = self._unit,
				to_unit = unit,
				r = 0,
				g = 0.75,
				b = 0
			})
		end
		return
	end
	if self._element_units[selected_unit:unit_data().unit_id] then
		self:_draw_link({
			from_unit = self._unit,
			to_unit = selected_unit,
			r = 0,
			g = 0.75,
			b = 0
		})
		return
	end
end
function CharacterSequenceElement:on_lmb()
	print("[CharacterSequenceElement:on_lmb]")
	local ray = managers.editor:unit_by_raycast({mask = 10, ray_type = "editor"})
	if ray and ray.unit and (string.find(ray.unit:name():s(), "ai_spawn_enemy", 1, true) or string.find(ray.unit:name():s(), "ai_spawn_civilian", 1, true)) then
		local id = ray.unit:unit_data().unit_id
		if self._element_units[id] then
			table.delete(self._hed.elements, id)
			self._element_units[id] = nil
		else
			table.insert(self._hed.elements, id)
			self._element_units[id] = ray.unit
		end
	end
end
function CharacterSequenceElement:_chk_units_alive()
	local rem_ids
	for element_u_id, unit in pairs(self._element_units) do
		if not alive(unit) then
			rem_ids = rem_ids or {}
			table.insert(rem_ids, element_u_id)
		end
	end
	if rem_ids then
		for _, u_id in ipairs(rem_ids) do
			self._element_units[u_id] = nil
			table.delete(self._hed.elements, u_id)
		end
	end
end
function CharacterSequenceElement:add_triggers(vc)
	vc:add_trigger(Idstring("lmb"), callback(self, self, "on_lmb"))
end
function CharacterSequenceElement:selected()
	CharacterSequenceElement.super.selected(self)
	self:_chk_units_alive()
end
function CharacterSequenceElement:update_unselected(...)
	CharacterSequenceElement.super.update_unselected(self, ...)
	self:_chk_units_alive()
end
function CharacterSequenceElement:update_editing()
end
