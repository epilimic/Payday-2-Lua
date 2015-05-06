TeamAIInventory = TeamAIInventory or class(CopInventory)
function TeamAIInventory:preload_mask()
	local character_name = managers.criminals:character_name_by_unit(self._unit)
	local mask_unit_name = managers.criminals:character_data_by_name(character_name).mask_obj
	mask_unit_name = mask_unit_name[Global.level_data.level_id] or mask_unit_name.default or mask_unit_name
	self._mask_unit_name = mask_unit_name
	managers.dyn_resource:load(Idstring("unit"), Idstring(mask_unit_name), managers.dyn_resource.DYN_RESOURCES_PACKAGE, callback(self, self, "clbk_mask_unit_loaded"))
end
function TeamAIInventory:clbk_mask_unit_loaded(status, asset_type, asset_name)
	self._mask_unit_loaded = status
	self:_reset_mask_visibility()
end
function TeamAIInventory:is_mask_unit_loaded()
	return self._mask_unit_loaded
end
function TeamAIInventory:add_unit_by_name(new_unit_name, equip)
	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = false
	setup_data.hit_slotmask = managers.slot:get_mask("bullet_impact_targets")
	setup_data.user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice
	setup_data.alert_AI = true
	setup_data.alert_filter = self._unit:brain():SO_access()
	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip)
end
function TeamAIInventory:_unload_mask()
	if self._mask_unit_name then
		managers.dyn_resource:unload(Idstring("unit"), Idstring(self._mask_unit_name), DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)
		self._mask_unit_name = nil
	end
end
function TeamAIInventory:_reset_mask_visibility()
	self:set_mask_visibility(self._mask_visibility and true or false)
end
function TeamAIInventory:pre_destroy(unit)
	TeamAIInventory.super.pre_destroy(self, unit)
	self:_unload_mask()
end
