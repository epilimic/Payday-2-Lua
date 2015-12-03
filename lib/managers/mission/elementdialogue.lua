core:import("CoreMissionScriptElement")
ElementDialogue = ElementDialogue or class(CoreMissionScriptElement.MissionScriptElement)
function ElementDialogue:init(...)
	ElementDialogue.super.init(self, ...)
end
function ElementDialogue:client_on_executed(...)
	self:on_executed(...)
end
function ElementDialogue:on_executed(instigator)
	if not self._values.enabled then
		return
	end
	if self._values.dialogue ~= "none" then
		if self._values.force_quit_current then
			managers.dialog:quit_dialog()
		end
		local done_cbk = self._values.execute_on_executed_when_done and callback(self, self, "_done_callback", instigator) or nil
		managers.dialog:queue_dialog(self._values.dialogue, {
			case = managers.criminals:character_name_by_unit(instigator),
			done_cbk = done_cbk,
			position = self._values.position,
			skip_idle_check = Application:editor()
		})
	elseif Application:editor() then
		managers.editor:output_error("Cant start dialogue " .. self._values.dialogue .. " in element " .. self._editor_name .. ".")
	end
	ElementDialogue.super.on_executed(self, instigator, nil, self._values.execute_on_executed_when_done)
end
function ElementDialogue:_done_callback(instigator, reason)
	ElementDialogue.super._trigger_execute_on_executed(self, instigator)
end
