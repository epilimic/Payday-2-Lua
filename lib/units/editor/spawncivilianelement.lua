core:import("CoreEditorUtils")
core:import("CoreUnit")
SpawnCivilianUnitElement = SpawnCivilianUnitElement or class(MissionElement)
SpawnCivilianUnitElement.USES_POINT_ORIENTATION = true
SpawnCivilianUnitElement.INSTANCE_VAR_NAMES = {
	{type = "civilian", value = "enemy"},
	{
		type = "civilian_spawn_state",
		value = "state"
	}
}
SpawnCivilianUnitElement._options = {
	"units/payday2/characters/civ_female_bank_1/civ_female_bank_1",
	"units/pd2_dlc_cage/characters/civ_female_bank_2/civ_female_bank_2",
	"units/payday2/characters/civ_female_bank_manager_1/civ_female_bank_manager_1",
	"units/payday2/characters/civ_female_bikini_1/civ_female_bikini_1",
	"units/payday2/characters/civ_female_bikini_2/civ_female_bikini_2",
	"units/payday2/characters/civ_female_casual_1/civ_female_casual_1",
	"units/payday2/characters/civ_female_casual_2/civ_female_casual_2",
	"units/payday2/characters/civ_female_casual_3/civ_female_casual_3",
	"units/payday2/characters/civ_female_casual_4/civ_female_casual_4",
	"units/payday2/characters/civ_female_casual_5/civ_female_casual_5",
	"units/payday2/characters/civ_female_casual_6/civ_female_casual_6",
	"units/payday2/characters/civ_female_casual_7/civ_female_casual_7",
	"units/payday2/characters/civ_female_casual_8/civ_female_casual_8",
	"units/payday2/characters/civ_female_casual_9/civ_female_casual_9",
	"units/payday2/characters/civ_female_casual_10/civ_female_casual_10",
	"units/payday2/characters/civ_female_crackwhore_1/civ_female_crackwhore_1",
	"units/payday2/characters/civ_female_curator_1/civ_female_curator_1",
	"units/payday2/characters/civ_female_curator_2/civ_female_curator_2",
	"units/payday2/characters/civ_female_hostess_apron_1/civ_female_hostess_apron_1",
	"units/payday2/characters/civ_female_hostess_jacket_1/civ_female_hostess_jacket_1",
	"units/payday2/characters/civ_female_hostess_shirt_1/civ_female_hostess_shirt_1",
	"units/payday2/characters/civ_female_party_1/civ_female_party_1",
	"units/payday2/characters/civ_female_party_2/civ_female_party_2",
	"units/payday2/characters/civ_female_party_3/civ_female_party_3",
	"units/payday2/characters/civ_female_party_4/civ_female_party_4",
	"units/payday2/characters/civ_female_waitress_1/civ_female_waitress_1",
	"units/payday2/characters/civ_female_waitress_2/civ_female_waitress_2",
	"units/payday2/characters/civ_female_waitress_3/civ_female_waitress_3",
	"units/payday2/characters/civ_female_waitress_4/civ_female_waitress_4",
	"units/payday2/characters/civ_female_wife_trophy_1/civ_female_wife_trophy_1",
	"units/payday2/characters/civ_female_wife_trophy_2/civ_female_wife_trophy_2",
	"units/payday2/characters/civ_male_bank_1/civ_male_bank_1",
	"units/payday2/characters/civ_male_bank_2/civ_male_bank_2",
	"units/payday2/characters/civ_male_bank_manager_1/civ_male_bank_manager_1",
	"units/payday2/characters/civ_male_bank_manager_3/civ_male_bank_manager_3",
	"units/payday2/characters/civ_male_bank_manager_4/civ_male_bank_manager_4",
	"units/payday2/characters/civ_male_bartender_1/civ_male_bartender_1",
	"units/payday2/characters/civ_male_bartender_2/civ_male_bartender_2",
	"units/payday2/characters/civ_male_business_1/civ_male_business_1",
	"units/payday2/characters/civ_male_business_2/civ_male_business_2",
	"units/payday2/characters/civ_male_casual_1/civ_male_casual_1",
	"units/payday2/characters/civ_male_casual_2/civ_male_casual_2",
	"units/payday2/characters/civ_male_casual_3/civ_male_casual_3",
	"units/payday2/characters/civ_male_casual_4/civ_male_casual_4",
	"units/payday2/characters/civ_male_casual_5/civ_male_casual_5",
	"units/payday2/characters/civ_male_casual_6/civ_male_casual_6",
	"units/payday2/characters/civ_male_casual_7/civ_male_casual_7",
	"units/payday2/characters/civ_male_casual_8/civ_male_casual_8",
	"units/payday2/characters/civ_male_casual_9/civ_male_casual_9",
	"units/payday2/characters/civ_male_casual_12/civ_male_casual_12",
	"units/payday2/characters/civ_male_casual_13/civ_male_casual_13",
	"units/payday2/characters/civ_male_casual_14/civ_male_casual_14",
	"units/payday2/characters/civ_male_curator_1/civ_male_curator_1",
	"units/payday2/characters/civ_male_curator_2/civ_male_curator_2",
	"units/payday2/characters/civ_male_curator_3/civ_male_curator_3",
	"units/payday2/characters/civ_male_dj_1/civ_male_dj_1",
	"units/payday2/characters/civ_male_italian_robe_1/civ_male_italian_robe_1",
	"units/payday2/characters/civ_male_janitor_1/civ_male_janitor_1",
	"units/payday2/characters/civ_male_janitor_2/civ_male_janitor_2",
	"units/payday2/characters/civ_male_janitor_3/civ_male_janitor_3",
	"units/payday2/characters/civ_male_meth_cook_1/civ_male_meth_cook_1",
	"units/payday2/characters/civ_male_party_1/civ_male_party_1",
	"units/payday2/characters/civ_male_party_2/civ_male_party_2",
	"units/payday2/characters/civ_male_party_3/civ_male_party_3",
	"units/payday2/characters/civ_male_pilot_1/civ_male_pilot_1",
	"units/payday2/characters/civ_male_scientist_1/civ_male_scientist_1",
	"units/payday2/characters/civ_male_taxman/civ_male_taxman",
	"units/payday2/characters/civ_male_taxman/civ_male_taxman_civ",
	"units/payday2/characters/civ_male_miami_store_clerk_1/civ_male_miami_store_clerk_1",
	"units/payday2/characters/civ_male_trucker_1/civ_male_trucker_1",
	"units/payday2/characters/civ_male_worker_docks_1/civ_male_worker_docks_1",
	"units/payday2/characters/civ_male_worker_docks_2/civ_male_worker_docks_2",
	"units/payday2/characters/civ_male_worker_docks_3/civ_male_worker_docks_3",
	"units/payday2/characters/civ_male_worker_1/civ_male_worker_1",
	"units/payday2/characters/civ_male_worker_2/civ_male_worker_2",
	"units/payday2/characters/civ_male_worker_3/civ_male_worker_3",
	"units/payday2/characters/npc_getaway_driver_1/npc_getaway_driver_1",
	"units/pd2_dlc1/characters/civ_male_paramedic_1/civ_male_paramedic_1",
	"units/pd2_dlc1/characters/civ_male_paramedic_2/civ_male_paramedic_2",
	"units/pd2_dlc1/characters/civ_male_firefighter_1/civ_male_firefighter_1",
	"units/pd2_dlc1/characters/civ_male_casual_10/civ_male_casual_10",
	"units/pd2_dlc1/characters/civ_male_casual_11/civ_male_casual_11",
	"units/pd2_dlc1/characters/civ_male_bank_manager_2/civ_male_bank_manager_2",
	"units/pd2_dlc2/characters/civ_female_bank_assistant_1/civ_female_bank_assistant_1",
	"units/pd2_dlc2/characters/civ_female_bank_assistant_2/civ_female_bank_assistant_2",
	"units/pd2_dlc3/characters/civ_female_casino_1/civ_female_casino_1",
	"units/pd2_dlc3/characters/civ_female_casino_2/civ_female_casino_2",
	"units/pd2_dlc3/characters/civ_female_casino_3/civ_female_casino_3",
	"units/pd2_dlc_casino/characters/civ_male_casino_1/civ_male_casino_1",
	"units/pd2_dlc_casino/characters/civ_male_casino_2/civ_male_casino_2",
	"units/pd2_dlc_casino/characters/civ_male_casino_3/civ_male_casino_3",
	"units/pd2_dlc_casino/characters/civ_male_casino_4/civ_male_casino_4",
	"units/pd2_dlc_casino/characters/civ_male_impersonator/civ_male_impersonator"
}
function SpawnCivilianUnitElement:init(unit)
	SpawnCivilianUnitElement.super.init(self, unit)
	self._enemies = {}
	self._states = CopActionAct._act_redirects.civilian_spawn
	self._hed.state = "none"
	self._hed.enemy = "units/payday2/characters/civ_male_casual_1/civ_male_casual_1"
	self._hed.force_pickup = "none"
	self._hed.team = "default"
	table.insert(self._save_values, "enemy")
	table.insert(self._save_values, "state")
	table.insert(self._save_values, "force_pickup")
	table.insert(self._save_values, "team")
end
function SpawnCivilianUnitElement:post_init(...)
	SpawnCivilianUnitElement.super.post_init(self, ...)
	self:_load_pickup()
end
function SpawnCivilianUnitElement:test_element()
	SpawnEnemyUnitElement.test_element(self)
end
function SpawnCivilianUnitElement:get_spawn_anim()
	return self._hed.state
end
function SpawnCivilianUnitElement:stop_test_element()
	for _, enemy in ipairs(self._enemies) do
		if enemy:base() and enemy:base().set_slot then
			enemy:base():set_slot(enemy, 0)
		else
			enemy:set_slot(0)
		end
	end
	self._enemies = {}
end
function SpawnCivilianUnitElement:set_element_data(params, ...)
	SpawnCivilianUnitElement.super.set_element_data(self, params, ...)
	if params.value == "force_pickup" then
		self:_load_pickup()
	end
end
function SpawnCivilianUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()
	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	self:_build_value_combobox(panel, panel_sizer, "enemy", self._options)
	self:_build_value_combobox(panel, panel_sizer, "state", table.list_add(self._states, {"none"}))
	local pickups = table.map_keys(tweak_data.pickups)
	table.insert(pickups, "none")
	self:_build_value_combobox(panel, panel_sizer, "force_pickup", pickups)
	self:_build_value_combobox(panel, panel_sizer, "team", table.list_add({"default"}, tweak_data.levels:get_team_names_indexed()), "Select the character's team.")
end
function SpawnCivilianUnitElement:_load_pickup()
	if self._hed.force_pickup ~= "none" then
		local unit_name = tweak_data.pickups[self._hed.force_pickup].unit
		CoreUnit.editor_load_unit(unit_name)
	end
end
function SpawnCivilianUnitElement:add_to_mission_package()
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
function SpawnCivilianUnitElement:_resolve_team(unit)
	if self._hed.team == "default" then
		return tweak_data.levels:get_default_team_ID("non_combatant")
	else
		return self._hed.team
	end
end
function SpawnCivilianUnitElement:destroy(...)
	SpawnCivilianUnitElement.super.destroy(self, ...)
	self:stop_test_element()
end
