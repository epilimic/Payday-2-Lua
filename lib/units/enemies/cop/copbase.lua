local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")
CopBase = CopBase or class(UnitBase)
CopBase._anim_lods = {
	{
		2,
		500,
		100,
		5000
	},
	{
		2,
		0,
		100,
		1
	},
	{
		3,
		0,
		100,
		1
	}
}
CopBase._material_translation_map = {}
do
	local payday2_characters_map = {
		"civ_female_bank_1",
		"civ_female_bank_manager_1",
		"civ_female_bikini_1",
		"civ_female_bikini_2",
		"civ_female_casual_1",
		"civ_female_casual_2",
		"civ_female_casual_3",
		"civ_female_casual_4",
		"civ_female_casual_5",
		"civ_female_casual_6",
		"civ_female_casual_7",
		"civ_female_casual_8",
		"civ_female_casual_9",
		"civ_female_casual_10",
		"civ_female_crackwhore_1",
		"civ_female_curator_1",
		"civ_female_curator_2",
		"civ_female_hostess_apron_1",
		"civ_female_hostess_jacket_1",
		"civ_female_hostess_shirt_1",
		"civ_female_party_1",
		"civ_female_party_2",
		"civ_female_party_3",
		"civ_female_party_4",
		"civ_female_waitress_1",
		"civ_female_waitress_2",
		"civ_female_waitress_3",
		"civ_female_waitress_4",
		"civ_female_wife_trophy_1",
		"civ_female_wife_trophy_2",
		"civ_male_bank_1",
		"civ_male_bank_2",
		"civ_male_bank_manager_1",
		"civ_male_bank_manager_3",
		"civ_male_bank_manager_4",
		"civ_male_bartender_1",
		"civ_male_bartender_2",
		"civ_male_business_1",
		"civ_male_business_2",
		"civ_male_casual_1",
		"civ_male_casual_2",
		"civ_male_casual_3",
		"civ_male_casual_4",
		"civ_male_casual_5",
		"civ_male_casual_6",
		"civ_male_casual_7",
		"civ_male_casual_8",
		"civ_male_casual_9",
		"civ_male_casual_12",
		"civ_male_casual_13",
		"civ_male_casual_14",
		"civ_male_curator_1",
		"civ_male_curator_2",
		"civ_male_curator_3",
		"civ_male_dj_1",
		"civ_male_italian_robe_1",
		"civ_male_janitor_1",
		"civ_male_janitor_2",
		"civ_male_janitor_3",
		"civ_male_meth_cook_1",
		"civ_male_party_1",
		"civ_male_party_2",
		"civ_male_party_3",
		"civ_male_pilot_1",
		"civ_male_scientist_1",
		"civ_male_miami_store_clerk_1",
		"civ_male_taxman",
		"civ_male_trucker_1",
		"civ_male_worker_1",
		"civ_male_worker_2",
		"civ_male_worker_3",
		"civ_male_worker_docks_1",
		"civ_male_worker_docks_2",
		"civ_male_worker_docks_3",
		"ene_biker_1",
		"ene_biker_2",
		"ene_biker_3",
		"ene_biker_4",
		"ene_bulldozer_1",
		"ene_bulldozer_2",
		"ene_bulldozer_3",
		"ene_bulldozer_4",
		"ene_city_swat_1",
		"ene_city_swat_2",
		"ene_city_swat_3",
		"ene_murkywater_1",
		"ene_murkywater_2",
		"ene_cop_1",
		"ene_cop_2",
		"ene_cop_3",
		"ene_cop_4",
		"ene_fbi_1",
		"ene_fbi_2",
		"ene_fbi_3",
		"ene_fbi_boss_1",
		"ene_fbi_female_1",
		"ene_fbi_female_2",
		"ene_fbi_female_3",
		"ene_fbi_female_4",
		"ene_fbi_heavy_1",
		"ene_fbi_office_1",
		"ene_fbi_office_2",
		"ene_fbi_office_3",
		"ene_fbi_office_4",
		"ene_fbi_swat_1",
		"ene_fbi_swat_2",
		"ene_gang_black_1",
		"ene_gang_black_2",
		"ene_gang_black_3",
		"ene_gang_black_4",
		"ene_gang_mexican_1",
		"ene_gang_mexican_2",
		"ene_gang_mexican_3",
		"ene_gang_mexican_4",
		"ene_gang_russian_1",
		"ene_gang_russian_2",
		"ene_gang_russian_3",
		"ene_gang_russian_4",
		"ene_gang_russian_5",
		"ene_gang_mobster_1",
		"ene_gang_mobster_2",
		"ene_gang_mobster_3",
		"ene_gang_mobster_4",
		"ene_gang_mobster_boss",
		"ene_guard_national_1",
		"ene_hoxton_breakout_guard_1",
		"ene_hoxton_breakout_guard_2",
		"ene_male_tgt_1",
		"ene_murkywater_1",
		"ene_murkywater_2",
		"ene_prisonguard_female_1",
		"ene_prisonguard_male_1",
		"ene_secret_service_1",
		"ene_secret_service_2",
		"ene_security_1",
		"ene_security_2",
		"ene_security_3",
		"ene_security_4",
		"ene_security_5",
		"ene_security_6",
		"ene_security_7",
		"ene_security_8",
		"ene_shield_1",
		"ene_shield_2",
		"ene_sniper_1",
		"ene_sniper_2",
		"ene_spook_1",
		"ene_swat_1",
		"ene_swat_2",
		"ene_swat_heavy_1",
		"ene_tazer_1",
		"ene_veteran_cop_1",
		"npc_old_hoxton_prisonsuit_1",
		"npc_old_hoxton_prisonsuit_2"
	}
	local path_string = "units/payday2/characters/"
	local character_path = ""
	for _, character in ipairs(payday2_characters_map) do
		character_path = path_string .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
	local pd2_dlc1_characters_map = {
		"civ_male_bank_manager_2",
		"civ_male_casual_10",
		"civ_male_casual_11",
		"civ_male_firefighter_1",
		"civ_male_paramedic_1",
		"civ_male_paramedic_2",
		"ene_security_gensec_1",
		"ene_security_gensec_2"
	}
	local path_string = "units/pd2_dlc1/characters/"
	local character_path = ""
	for _, character in ipairs(pd2_dlc1_characters_map) do
		character_path = path_string .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
	local pd2_dlc2_characters_map = {
		"civ_female_bank_assistant_1",
		"civ_female_bank_assistant_2"
	}
	local path_string = "units/pd2_dlc2/characters/"
	local character_path = ""
	for _, character in ipairs(pd2_dlc2_characters_map) do
		character_path = path_string .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
	local pd2_dlc_mansion_characters_map = {
		"ene_male_hector_1",
		"ene_male_hector_2",
		"ene_hoxton_breakout_guard_1",
		"ene_hoxton_breakout_guard_2"
	}
	local path_string = "units/pd2_mcmansion/characters/"
	local character_path = ""
	for _, character in ipairs(pd2_dlc_mansion_characters_map) do
		character_path = path_string .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
	local pd2_dlc_kenaz_characters_map = {
		"civ_female_bank_2"
	}
	local path_string = "units/pd2_dlc_cage/characters/"
	local character_path = ""
	for _, character in ipairs(pd2_dlc_kenaz_characters_map) do
		character_path = path_string .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
end
function CopBase:init(unit)
	UnitBase.init(self, unit, false)
	self._char_tweak = tweak_data.character[self._tweak_table]
	self._unit = unit
	self._visibility_state = true
	self._foot_obj_map = {}
	self._foot_obj_map.right = self._unit:get_object(Idstring("RightToeBase"))
	self._foot_obj_map.left = self._unit:get_object(Idstring("LeftToeBase"))
	self._is_in_original_material = true
end
function CopBase:post_init()
	self._ext_movement = self._unit:movement()
	self._ext_anim = self._unit:anim_data()
	self:set_anim_lod(1)
	self._lod_stage = 1
	self._ext_movement:post_init(true)
	self._unit:brain():post_init()
	managers.enemy:register_enemy(self._unit)
	self._allow_invisible = true
	self:_chk_spawn_gear()
end
function CopBase:_chk_spawn_gear()
	if Global.level_data.level_id == "pines" and self._tweak_table == "spooc" then
		local align_obj_name = Idstring("Head")
		local align_obj = self._unit:get_object(align_obj_name)
		self._headwear_unit = World:spawn_unit(Idstring("units/payday2/characters/ene_acc_spook_santa_hat/ene_acc_spook_santa_hat"), Vector3(), Rotation())
		self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
	end
end
function CopBase:default_weapon_name()
	local default_weapon_id = self._default_weapon_id
	local weap_ids = tweak_data.character.weap_ids
	for i_weap_id, weap_id in ipairs(weap_ids) do
		if default_weapon_id == weap_id then
			return tweak_data.character.weap_unit_names[i_weap_id]
		end
	end
end
function CopBase:visibility_state()
	return self._visibility_state
end
function CopBase:lod_stage()
	return self._lod_stage
end
function CopBase:set_allow_invisible(allow)
	self._allow_invisible = allow
end
function CopBase:set_visibility_state(stage)
	local state = stage and true
	if not state and not self._allow_invisible then
		state = true
		stage = 1
	end
	if self._lod_stage == stage then
		return
	end
	local inventory = self._unit:inventory()
	local weapon = inventory and inventory.get_weapon and inventory:get_weapon()
	if weapon then
		weapon:base():set_flashlight_light_lod_enabled(stage ~= 2 and not not stage)
	end
	if self._visibility_state ~= state then
		local unit = self._unit
		if inventory then
			inventory:set_visibility_state(state)
		end
		unit:set_visible(state)
		if self._headwear_unit then
			self._headwear_unit:set_visible(state)
		end
		if state or self._ext_anim.can_freeze and self._ext_anim.upper_body_empty then
			unit:set_animatable_enabled(ids_lod, state)
			unit:set_animatable_enabled(ids_ik_aim, state)
		end
		self._visibility_state = state
	end
	if state then
		self:set_anim_lod(stage)
		self._unit:movement():enable_update(true)
		if stage == 1 then
			self._unit:set_animatable_enabled(ids_lod1, true)
		elseif self._lod_stage == 1 then
			self._unit:set_animatable_enabled(ids_lod1, false)
		end
	end
	self._lod_stage = stage
	self:chk_freeze_anims()
end
function CopBase:set_anim_lod(stage)
	self._unit:set_animation_lod(unpack(self._anim_lods[stage]))
end
function CopBase:on_death_exit()
	self._unit:set_animations_enabled(false)
end
function CopBase:chk_freeze_anims()
	if (not self._lod_stage or self._lod_stage > 1) and self._ext_anim.can_freeze and self._ext_anim.upper_body_empty then
		if not self._anims_frozen then
			self._anims_frozen = true
			self._unit:set_animations_enabled(false)
			self._ext_movement:on_anim_freeze(true)
		end
	elseif self._anims_frozen then
		self._anims_frozen = nil
		self._unit:set_animations_enabled(true)
		self._ext_movement:on_anim_freeze(false)
	end
end
function CopBase:anim_act_clbk(unit, anim_act, send_to_action)
	if send_to_action then
		unit:movement():on_anim_act_clbk(anim_act)
	elseif unit:unit_data().mission_element then
		unit:unit_data().mission_element:event(anim_act, unit)
	end
end
function CopBase:save(data)
	if self._unit:interaction() and self._unit:interaction().tweak_data == "hostage_trade" then
		data.is_hostage_trade = true
	elseif self._unit:interaction() and self._unit:interaction().tweak_data == "hostage_convert" then
		data.is_hostage_convert = true
	end
end
function CopBase:load(data)
	if data.is_hostage_trade then
		CopLogicTrade.hostage_trade(self._unit, true, false)
	elseif data.is_hostage_convert then
		self._unit:interaction():set_tweak_data("hostage_convert")
	end
end
function CopBase:swap_material_config(material_applied_clbk)
	local new_material = self._material_translation_map[tostring(self._unit:material_config():key())]
	if new_material then
		self._is_in_original_material = not self._is_in_original_material
		self._unit:set_material_config(new_material, true, material_applied_clbk and callback(self, self, "on_material_applied", material_applied_clbk), 100)
		if not material_applied_clbk then
			self:on_material_applied()
		end
	else
		print("[CopBase:swap_material_config] fail", self._unit:material_config(), self._unit)
		Application:stack_dump()
	end
end
function CopBase:on_material_applied(material_applied_clbk)
	if not alive(self._unit) then
		return
	end
	if self._unit:interaction() then
		self._unit:interaction():refresh_material()
	end
	if material_applied_clbk then
		material_applied_clbk()
	end
end
function CopBase:is_in_original_material()
	return self._is_in_original_material
end
function CopBase:set_material_state(original)
	if original and not self._is_in_original_material or not original and self._is_in_original_material then
		self:swap_material_config()
	end
end
function CopBase:char_tweak()
	return self._char_tweak
end
function CopBase:melee_weapon()
	return self._melee_weapon_table or self._char_tweak.melee_weapon or "weapon"
end
function CopBase:pre_destroy(unit)
	if alive(self._headwear_unit) then
		self._headwear_unit:set_slot(0)
	end
	unit:brain():pre_destroy(unit)
	self._ext_movement:pre_destroy()
	self._unit:inventory():pre_destroy()
	UnitBase.pre_destroy(self, unit)
end
