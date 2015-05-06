core:import("CoreEditorUtils")
SpawnEnemyUnitElement = SpawnEnemyUnitElement or class(MissionElement)
SpawnEnemyUnitElement.USES_POINT_ORIENTATION = true
SpawnEnemyUnitElement.INSTANCE_VAR_NAMES = {
	{type = "enemy", value = "enemy"},
	{
		type = "enemy_spawn_action",
		value = "spawn_action"
	}
}
SpawnEnemyUnitElement._options = {
	"units/test/payday2/previs/previs_npc_chains/previs_npc_chains",
	"units/test/payday2/previs/previs_npc_dallas/previs_npc_dallas",
	"units/test/payday2/previs/previs_npc_wolf/previs_npc_wolf",
	"units/payday2/characters/ene_biker_1/ene_biker_1",
	"units/payday2/characters/ene_biker_2/ene_biker_2",
	"units/payday2/characters/ene_biker_3/ene_biker_3",
	"units/payday2/characters/ene_biker_4/ene_biker_4",
	"units/payday2/characters/ene_bulldozer_1/ene_bulldozer_1",
	"units/payday2/characters/ene_bulldozer_2/ene_bulldozer_2",
	"units/payday2/characters/ene_bulldozer_3/ene_bulldozer_3",
	"units/payday2/characters/ene_bulldozer_4/ene_bulldozer_4",
	"units/payday2/characters/ene_city_swat_1/ene_city_swat_1",
	"units/payday2/characters/ene_city_swat_2/ene_city_swat_2",
	"units/payday2/characters/ene_city_swat_3/ene_city_swat_3",
	"units/payday2/characters/ene_cop_1/ene_cop_1",
	"units/payday2/characters/ene_cop_2/ene_cop_2",
	"units/payday2/characters/ene_cop_3/ene_cop_3",
	"units/payday2/characters/ene_cop_4/ene_cop_4",
	"units/payday2/characters/ene_fbi_1/ene_fbi_1",
	"units/payday2/characters/ene_fbi_2/ene_fbi_2",
	"units/payday2/characters/ene_fbi_3/ene_fbi_3",
	"units/payday2/characters/ene_fbi_boss_1/ene_fbi_boss_1",
	"units/payday2/characters/ene_fbi_female_1/ene_fbi_female_1",
	"units/payday2/characters/ene_fbi_female_2/ene_fbi_female_2",
	"units/payday2/characters/ene_fbi_female_3/ene_fbi_female_3",
	"units/payday2/characters/ene_fbi_female_4/ene_fbi_female_4",
	"units/payday2/characters/ene_fbi_heavy_1/ene_fbi_heavy_1",
	"units/payday2/characters/ene_fbi_office_1/ene_fbi_office_1",
	"units/payday2/characters/ene_fbi_office_2/ene_fbi_office_2",
	"units/payday2/characters/ene_fbi_office_3/ene_fbi_office_3",
	"units/payday2/characters/ene_fbi_office_4/ene_fbi_office_4",
	"units/payday2/characters/ene_fbi_swat_1/ene_fbi_swat_1",
	"units/payday2/characters/ene_fbi_swat_2/ene_fbi_swat_2",
	"units/payday2/characters/ene_gang_black_1/ene_gang_black_1",
	"units/payday2/characters/ene_gang_black_2/ene_gang_black_2",
	"units/payday2/characters/ene_gang_black_3/ene_gang_black_3",
	"units/payday2/characters/ene_gang_black_4/ene_gang_black_4",
	"units/payday2/characters/ene_gang_mexican_1/ene_gang_mexican_1",
	"units/payday2/characters/ene_gang_mexican_2/ene_gang_mexican_2",
	"units/payday2/characters/ene_gang_mexican_3/ene_gang_mexican_3",
	"units/payday2/characters/ene_gang_mexican_4/ene_gang_mexican_4",
	"units/payday2/characters/ene_gang_russian_1/ene_gang_russian_1",
	"units/payday2/characters/ene_gang_russian_2/ene_gang_russian_2",
	"units/payday2/characters/ene_gang_russian_3/ene_gang_russian_3",
	"units/payday2/characters/ene_gang_russian_4/ene_gang_russian_4",
	"units/payday2/characters/ene_gang_russian_5/ene_gang_russian_5",
	"units/payday2/characters/ene_gang_mobster_1/ene_gang_mobster_1",
	"units/payday2/characters/ene_gang_mobster_2/ene_gang_mobster_2",
	"units/payday2/characters/ene_gang_mobster_3/ene_gang_mobster_3",
	"units/payday2/characters/ene_gang_mobster_4/ene_gang_mobster_4",
	"units/payday2/characters/ene_gang_mobster_boss/ene_gang_mobster_boss",
	"units/payday2/characters/ene_male_tgt_1/ene_male_tgt_1",
	"units/payday2/characters/ene_prisonguard_female_1/ene_prisonguard_female_1",
	"units/payday2/characters/ene_prisonguard_male_1/ene_prisonguard_male_1",
	"units/payday2/characters/ene_secret_service_1/ene_secret_service_1",
	"units/payday2/characters/ene_secret_service_2/ene_secret_service_2",
	"units/payday2/characters/ene_security_1/ene_security_1",
	"units/payday2/characters/ene_security_2/ene_security_2",
	"units/payday2/characters/ene_security_3/ene_security_3",
	"units/payday2/characters/ene_shield_1/ene_shield_1",
	"units/payday2/characters/ene_shield_2/ene_shield_2",
	"units/payday2/characters/ene_sniper_1/ene_sniper_1",
	"units/payday2/characters/ene_sniper_2/ene_sniper_2",
	"units/payday2/characters/ene_spook_1/ene_spook_1",
	"units/payday2/characters/ene_swat_1/ene_swat_1",
	"units/payday2/characters/ene_swat_2/ene_swat_2",
	"units/payday2/characters/ene_swat_heavy_1/ene_swat_heavy_1",
	"units/payday2/characters/ene_tazer_1/ene_tazer_1",
	"units/payday2/characters/ene_veteran_cop_1/ene_veteran_cop_1",
	"units/payday2/characters/ene_biker_escape/ene_biker_escape",
	"units/pd2_dlc1/characters/ene_security_gensec_1/ene_security_gensec_1",
	"units/pd2_dlc1/characters/ene_security_gensec_2/ene_security_gensec_2",
	"units/payday2/characters/npc_old_hoxton_prisonsuit_1/npc_old_hoxton_prisonsuit_1",
	"units/payday2/characters/npc_old_hoxton_prisonsuit_2/npc_old_hoxton_prisonsuit_2",
	"units/payday2/characters/ene_guard_national_1/ene_guard_national_1",
	"units/payday2/characters/ene_murkywater_1/ene_murkywater_1",
	"units/payday2/characters/ene_murkywater_2/ene_murkywater_2",
	"units/payday2/characters/ene_security_4/ene_security_4",
	"units/payday2/characters/ene_security_5/ene_security_5",
	"units/payday2/characters/ene_security_6/ene_security_6",
	"units/payday2/characters/ene_security_7/ene_security_7",
	"units/payday2/characters/ene_security_8/ene_security_8",
	"units/pd2_mcmansion/characters/ene_male_hector_1/ene_male_hector_1",
	"units/pd2_mcmansion/characters/ene_male_hector_2/ene_male_hector_2",
	"units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_1/ene_hoxton_breakout_guard_1",
	"units/pd2_mcmansion/characters/ene_hoxton_breakout_guard_2/ene_hoxton_breakout_guard_2"
}
function SpawnEnemyUnitElement:init(unit)
	SpawnEnemyUnitElement.super.init(self, unit)
	self._enemies = {}
	self._hed.enemy = "units/payday2/characters/ene_swat_1/ene_swat_1"
	self._hed.force_pickup = "none"
	self._hed.spawn_action = "none"
	self._hed.participate_to_group_ai = true
	self._hed.interval = 5
	self._hed.amount = 0
	self._hed.accessibility = "any"
	self._hed.voice = 0
	self._hed.team = "default"
	table.insert(self._save_values, "enemy")
	table.insert(self._save_values, "force_pickup")
	table.insert(self._save_values, "team")
	table.insert(self._save_values, "spawn_action")
	table.insert(self._save_values, "participate_to_group_ai")
	table.insert(self._save_values, "interval")
	table.insert(self._save_values, "amount")
	table.insert(self._save_values, "accessibility")
	table.insert(self._save_values, "voice")
end
function SpawnEnemyUnitElement:post_init(...)
	SpawnEnemyUnitElement.super.post_init(self, ...)
	self:_load_pickup()
end
function SpawnEnemyUnitElement:test_element()
	if not managers.navigation:is_data_ready() then
		EWS:message_box(Global.frame_panel, "Can't test spawn unit without ready navigation data (AI-graph)", "Spawn", "OK,ICON_ERROR", Vector3(-1, -1, 0))
		return
	end
	if self._hed.enemy ~= "none" and managers.groupai:state():is_AI_enabled() then
		local unit = safe_spawn_unit(Idstring(self._hed.enemy), self._unit:position(), self._unit:rotation())
		table.insert(self._enemies, unit)
		unit:brain():set_logic("inactive", nil)
		local team_id = self:_resolve_team(unit)
		managers.groupai:state():set_char_team(unit, team_id)
		local action_desc = ElementSpawnEnemyDummy._create_action_data(self:get_spawn_anim())
		unit:movement():action_request(action_desc)
		unit:movement():set_position(unit:position())
	end
end
function SpawnEnemyUnitElement:get_spawn_anim()
	return self._hed.spawn_action
end
function SpawnEnemyUnitElement:stop_test_element()
	for _, enemy in ipairs(self._enemies) do
		enemy:set_slot(0)
	end
	self._enemies = {}
end
function SpawnEnemyUnitElement:set_element_data(params, ...)
	SpawnEnemyUnitElement.super.set_element_data(self, params, ...)
	if params.value == "force_pickup" then
		self:_load_pickup()
	end
end
function SpawnEnemyUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_combobox(panel, panel_sizer, "enemy", self._options)
	local participate_to_group_ai = EWS:CheckBox(panel, "Participate to group ai", "")
	participate_to_group_ai:set_value(self._hed.participate_to_group_ai)
	participate_to_group_ai:connect("EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, "set_element_data"), {
		ctrlr = participate_to_group_ai,
		value = "participate_to_group_ai"
	})
	panel_sizer:add(participate_to_group_ai, 0, 0, "EXPAND")
	local spawn_action_options = clone(CopActionAct._act_redirects.enemy_spawn)
	table.insert(spawn_action_options, "none")
	self:_build_value_combobox(panel, panel_sizer, "spawn_action", spawn_action_options)
	self:_build_value_number(panel, panel_sizer, "interval", {floats = 2, min = 0}, "Used to specify how often this spawn can be used. 0 means no interval")
	self:_build_value_number(panel, panel_sizer, "voice", {
		floats = 0,
		min = 0,
		max = 5
	}, "Voice variant. 1-5. 0 for random.")
	self:_build_value_combobox(panel, panel_sizer, "accessibility", ElementSpawnEnemyDummy.ACCESSIBILITIES, "Only units with this movement type will be spawned from this element.")
	local pickups = table.map_keys(tweak_data.pickups)
	table.insert(pickups, "none")
	self:_build_value_combobox(panel, panel_sizer, "force_pickup", pickups)
	self:_build_value_combobox(panel, panel_sizer, "team", table.list_add({"default"}, tweak_data.levels:get_team_names_indexed()), "Select the character's team.")
end
function SpawnEnemyUnitElement:_load_pickup()
	if self._hed.force_pickup ~= "none" then
		local unit_name = tweak_data.pickups[self._hed.force_pickup].unit
		CoreUnit.editor_load_unit(unit_name)
	end
end
function SpawnEnemyUnitElement:add_to_mission_package()
	if self._hed.force_pickup ~= "none" then
		local unit_name = tweak_data.pickups[self._hed.force_pickup].unit
		managers.editor:add_to_world_package({
			category = "units",
			name = unit_name:s(),
			continent = self._unit:unit_data().continent
		})
		local sequence_files = {}
		CoreEditorUtils.get_sequence_files_by_unit_name(unit_name, sequence_files)
		for _, file in ipairs(sequence_files) do
			managers.editor:add_to_world_package({
				category = "script_data",
				name = file:s() .. ".sequence_manager",
				continent = self._unit:unit_data().continent,
				init = true
			})
		end
	end
end
function SpawnEnemyUnitElement:_resolve_team(unit)
	if self._hed.team == "default" then
		return tweak_data.levels:get_default_team_ID(unit:base():char_tweak().access == "gangster" and "gangster" or "combatant")
	else
		return self._hed.team
	end
end
function SpawnEnemyUnitElement:destroy(...)
	SpawnEnemyUnitElement.super.destroy(self, ...)
	self:stop_test_element()
end
