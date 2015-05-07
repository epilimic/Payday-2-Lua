core:import("CoreMissionScriptElement")
ElementEnableUnit = ElementEnableUnit or class(CoreMissionScriptElement.MissionScriptElement)
function ElementEnableUnit:init(...)
	ElementEnableUnit.super.init(self, ...)
	self._units = {}
end
function ElementEnableUnit:on_script_activated()
	for _, id in ipairs(self._values.unit_ids) do
		if Global.running_simulation then
			table.insert(self._units, managers.editor:unit_with_id(id))
		else
			local unit = managers.worlddefinition:get_unit_on_load(id, callback(self, self, "_load_unit"))
			if unit then
				table.insert(self._units, unit)
			end
		end
	end
	self._has_fetched_units = true
	self._mission_script:add_save_state_cb(self._id)
end
function ElementEnableUnit:_load_unit(unit)
	table.insert(self._units, unit)
end
function ElementEnableUnit:client_on_executed(...)
	self:on_executed(...)
end
function ElementEnableUnit:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	for _, unit in ipairs(self._units) do
		managers.game_play_central:mission_enable_unit(unit)
	end
	ElementEnableUnit.super.on_executed(self, instigator)
end
function ElementEnableUnit:save(data)
	data.save_me = true
	data.enabled = self._values.enabled
end
function ElementEnableUnit:load(data)
	if not self._has_fetched_units then
		self:on_script_activated()
	end
	self:set_enabled(data.enabled)
end
