local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_len = mvector3.length
local math_clamp = math.clamp
local math_lerp = math.lerp
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
NewRaycastWeaponBase = NewRaycastWeaponBase or class(RaycastWeaponBase)
require("lib/units/weapons/CosmeticsWeaponBase")
function NewRaycastWeaponBase:init(unit)
	NewRaycastWeaponBase.super.init(self, unit)
	self._has_gadget = false
	self._armor_piercing_chance = self:weapon_tweak_data().armor_piercing_chance or 0
	self._use_shotgun_reload = self:weapon_tweak_data().use_shotgun_reload
	self._movement_penalty = tweak_data.upgrades.weapon_movement_penalty[self:weapon_tweak_data().category] or 1
	self._textures = {}
	self._cosmetics_data = nil
	self._materials = nil
end
function NewRaycastWeaponBase:is_npc()
	return false
end
function NewRaycastWeaponBase:skip_queue()
	return false
end
function NewRaycastWeaponBase:use_thq()
	return false
end
function NewRaycastWeaponBase:skip_thq_parts()
	return tweak_data.weapon.factory[self._factory_id].skip_thq_parts
end
function NewRaycastWeaponBase:set_texture_switches(texture_switches)
	self._texture_switches = texture_switches
end
function NewRaycastWeaponBase:set_factory_data(factory_id)
	self._factory_id = factory_id
end
function NewRaycastWeaponBase:_check_thq_align_anim()
	if not self:is_npc() then
		return
	end
	if not self:use_thq() then
		return
	end
	local thq_anim_name = self:weapon_tweak_data().animations and self:weapon_tweak_data().animations.thq_align_anim
	if thq_anim_name then
		self._unit:anim_set_time(Idstring(thq_anim_name), self._unit:anim_length(Idstring(thq_anim_name)))
	end
end
function NewRaycastWeaponBase:_third_person()
	if not self:is_npc() then
		return false
	end
	if not self:use_thq() then
		return true
	end
	return self:skip_thq_parts() and true or false
end
function NewRaycastWeaponBase:assemble(factory_id)
	local third_person = self:_third_person()
	local skip_queue = self:skip_queue()
	self._parts, self._blueprint = managers.weapon_factory:assemble_default(factory_id, self._unit, third_person, callback(self, self, "clbk_assembly_complete", function()
	end), skip_queue)
	self:_check_thq_align_anim()
	self:_update_stats_values()
	do return end
	local third_person = self:is_npc()
	self._parts, self._blueprint = managers.weapon_factory:assemble_default(factory_id, self._unit, third_person)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:assemble_from_blueprint(factory_id, blueprint, clbk)
	local third_person = self:_third_person()
	local skip_queue = self:skip_queue()
	self._parts, self._blueprint = managers.weapon_factory:assemble_from_blueprint(factory_id, self._unit, blueprint, third_person, callback(self, self, "clbk_assembly_complete", clbk or function()
	end), skip_queue)
	self:_check_thq_align_anim()
	self:_update_stats_values()
	do return end
	local third_person = self:is_npc()
	self._parts, self._blueprint = managers.weapon_factory:assemble_from_blueprint(factory_id, self._unit, blueprint, third_person)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:clbk_assembly_complete(clbk, parts, blueprint)
	self._assembly_complete = true
	self._parts = parts
	self._blueprint = blueprint
	self:_update_fire_object()
	self:_update_stats_values()
	if self._setup and self._setup.timer then
		self:set_timer(self._setup.timer)
	end
	local magazine = managers.weapon_factory:get_part_from_weapon_by_type("magazine", self._parts)
	if magazine then
		local bullet_objects = managers.weapon_factory:get_part_data_type_from_weapon_by_type("magazine", "bullet_objects", self._parts)
		if bullet_objects then
			self._bullet_objects = {}
			local prefix = bullet_objects.prefix
			for i = 1, bullet_objects.amount do
				local object = magazine.unit:get_object(Idstring(prefix .. i))
				if object then
					self._bullet_objects[i] = self._bullet_objects[i] or {}
					table.insert(self._bullet_objects[i], object)
				end
			end
		end
	end
	if not self._bullet_objects or #self._bullet_objects == 0 then
		local ammo = managers.weapon_factory:get_part_from_weapon_by_type("ammo", self._parts)
		if ammo then
			local bullet_objects = managers.weapon_factory:get_part_data_type_from_weapon_by_type("ammo", "bullet_objects", self._parts)
			if bullet_objects then
				self._bullet_objects = {}
				local prefix = bullet_objects.prefix
				for i = 1, bullet_objects.amount do
					local object = ammo.unit:get_object(Idstring(prefix .. i))
					if object then
						self._bullet_objects[i] = self._bullet_objects[i] or {}
						table.insert(self._bullet_objects[i], object)
					end
				end
			end
		end
	end
	self:_apply_cosmetics(clbk or function()
	end)
	self:apply_texture_switches()
	self:check_npc()
	self:_set_parts_enabled(self._enabled)
	if self._second_sight_data then
		self._second_sight_data.unit = self._parts[self._second_sight_data.part_id].unit
	end
	clbk()
end
function NewRaycastWeaponBase:apply_texture_switches()
	local parts_tweak = tweak_data.weapon.factory.parts
	self._parts_texture_switches = self._parts_texture_switches or {}
	if self._texture_switches then
		local texture_switch, part_data, unit, material_ids, material_config, switch_material
		for part_id, texture_data in pairs(self._texture_switches) do
			if self._parts_texture_switches[part_id] ~= texture_data then
				switch_material = nil
				texture_switch = parts_tweak[part_id] and parts_tweak[part_id].texture_switch
				part_data = self._parts and self._parts[part_id]
				if texture_switch and part_data then
					unit = part_data.unit
					material_ids = Idstring(texture_switch.material)
					material_config = unit:get_objects_by_type(Idstring("material"))
					for _, material in ipairs(material_config) do
						if material:name() == material_ids then
							switch_material = material
						else
						end
					end
					if switch_material then
						local texture_id = managers.blackmarket:get_texture_switch_from_data(texture_data, part_id)
						if texture_id and DB:has(Idstring("texture"), texture_id) then
							local retrieved_texture = TextureCache:retrieve(texture_id, "normal")
							Application:set_material_texture(switch_material, Idstring(texture_switch.channel), retrieved_texture)
							if self._parts_texture_switches[part_id] then
								TextureCache:unretrieve(Idstring(self._parts_texture_switches[part_id]))
							end
							self._parts_texture_switches[part_id] = Idstring(texture_id)
						else
							Application:error("[NewRaycastWeaponBase:apply_texture_switches] Switch texture do not exists", texture_id)
						end
					end
				end
			end
		end
	end
end
function NewRaycastWeaponBase:check_npc()
end
function NewRaycastWeaponBase:has_range_distance_scope()
	if not self._scopes or not self._parts then
		return false
	end
	if not self._assembly_complete then
		return false
	end
	local part
	for i, part_id in ipairs(self._scopes) do
		part = self._parts[part_id]
		if part and (part.unit:digital_gui() or part.unit:digital_gui_upper()) then
			return true
		end
	end
	return false
end
function NewRaycastWeaponBase:set_scope_range_distance(distance)
	if not self._assembly_complete then
		return
	end
	if self._scopes and self._parts then
		local part
		for i, part_id in ipairs(self._scopes) do
			part = self._parts[part_id]
			if part and part.unit:digital_gui() then
				part.unit:digital_gui():number_set((not distance or not math.round(distance)) and false, false)
			end
			if part and part.unit:digital_gui_upper() then
				part.unit:digital_gui_upper():number_set((not distance or not math.round(distance)) and false, false)
			end
		end
	end
end
function NewRaycastWeaponBase:check_highlight_unit(unit)
	if not self._can_highlight then
		return
	end
	if self:is_second_sight_on() then
		return
	end
	unit = unit:in_slot(8) and alive(unit:parent()) and unit:parent() or unit
	if not unit:in_slot(managers.slot:get_mask("enemies")) then
		return
	end
	if unit:base()._tweak_table and (managers.groupai:state():whisper_mode() and tweak_data.character[unit:base()._tweak_table].silent_priority_shout or tweak_data.character[unit:base()._tweak_table].priority_shout) then
		managers.game_play_central:auto_highlight_enemy(unit, true)
	end
end
function NewRaycastWeaponBase:change_part(part_id)
	self._parts = managers.weapon_factory:change_part(self._unit, self._factory_id, part_id or "wpn_fps_m4_uupg_b_sd", self._parts, self._blueprint)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:remove_part(part_id)
	self._parts = managers.weapon_factory:remove_part(self._unit, self._factory_id, part_id, self._parts, self._blueprint)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:remove_part_by_type(type)
	self._parts = managers.weapon_factory:remove_part_by_type(self._unit, self._factory_id, type, self._parts, self._blueprint)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:change_blueprint(blueprint)
	self._blueprint = blueprint
	self._parts = managers.weapon_factory:change_blueprint(self._unit, self._factory_id, self._parts, blueprint)
	self:_update_fire_object()
	self:_update_stats_values()
end
function NewRaycastWeaponBase:blueprint_to_string()
	local s = managers.weapon_factory:blueprint_to_string(self._factory_id, self._blueprint)
	return s
end
function NewRaycastWeaponBase:_update_fire_object()
	local fire = managers.weapon_factory:get_part_from_weapon_by_type("barrel_ext", self._parts) or managers.weapon_factory:get_part_from_weapon_by_type("slide", self._parts) or managers.weapon_factory:get_part_from_weapon_by_type("barrel", self._parts)
	if not fire then
		debug_pause("[NewRaycastWeaponBase:_update_fire_object] Weapon \"" .. tostring(self._factory_id) .. "\" is missing fire object !")
	elseif not fire.unit:get_object(Idstring("fire")) then
		debug_pause("[NewRaycastWeaponBase:_update_fire_object] Weapon \"" .. tostring(self._factory_id) .. "\" is missing fire object for part \"" .. tostring(fire.unit) .. "\"!")
	else
		self:change_fire_object(fire.unit:get_object(Idstring("fire")))
	end
end
function NewRaycastWeaponBase:got_silencer()
	return self._silencer
end
local ids_single = Idstring("single")
local ids_auto = Idstring("auto")
function NewRaycastWeaponBase:_update_stats_values()
	self:_check_sound_switch()
	self._silencer = managers.weapon_factory:has_perk("silencer", self._factory_id, self._blueprint)
	self._locked_fire_mode = (not managers.weapon_factory:has_perk("fire_mode_auto", self._factory_id, self._blueprint) or not ids_auto) and managers.weapon_factory:has_perk("fire_mode_single", self._factory_id, self._blueprint) and ids_single
	self._fire_mode = self._locked_fire_mode or Idstring(self:weapon_tweak_data().FIRE_MODE or "single")
	self._ammo_data = managers.weapon_factory:get_ammo_data_from_weapon(self._factory_id, self._blueprint) or {}
	self._can_shoot_through_shield = tweak_data.weapon[self._name_id].can_shoot_through_shield
	self._can_shoot_through_enemy = tweak_data.weapon[self._name_id].can_shoot_through_enemy
	self._can_shoot_through_wall = tweak_data.weapon[self._name_id].can_shoot_through_wall
	self._armor_piercing_chance = self:weapon_tweak_data().armor_piercing_chance or 0
	self._movement_penalty = tweak_data.upgrades.weapon_movement_penalty[self:weapon_tweak_data().category] or 1
	local custom_stats = managers.weapon_factory:get_custom_stats_from_weapon(self._factory_id, self._blueprint)
	for part_id, stats in pairs(custom_stats) do
		if stats.movement_speed then
			self._movement_penalty = self._movement_penalty * stats.movement_speed
		end
		if tweak_data.weapon.factory.parts[part_id].type ~= "ammo" then
			if stats.ammo_pickup_min_mul then
				self._ammo_data.ammo_pickup_min_mul = self._ammo_data.ammo_pickup_min_mul and self._ammo_data.ammo_pickup_min_mul * stats.ammo_pickup_min_mul or stats.ammo_pickup_min_mul
			end
			if stats.ammo_pickup_max_mul then
				self._ammo_data.ammo_pickup_max_mul = self._ammo_data.ammo_pickup_max_mul and self._ammo_data.ammo_pickup_max_mul * stats.ammo_pickup_max_mul or stats.ammo_pickup_max_mul
			end
		end
	end
	if self._ammo_data then
		if self._ammo_data.can_shoot_through_shield ~= nil then
			self._can_shoot_through_shield = self._ammo_data.can_shoot_through_shield
		end
		if self._ammo_data.can_shoot_through_enemy ~= nil then
			self._can_shoot_through_enemy = self._ammo_data.can_shoot_through_enemy
		end
		if self._ammo_data.can_shoot_through_wall ~= nil then
			self._can_shoot_through_wall = self._ammo_data.can_shoot_through_wall
		end
		if self._ammo_data.bullet_class ~= nil then
			self._bullet_class = CoreSerialize.string_to_classtable(self._ammo_data.bullet_class)
			self._bullet_slotmask = self._bullet_class:bullet_slotmask()
			self._blank_slotmask = self._bullet_class:blank_slotmask()
		end
		if self._ammo_data.armor_piercing_add ~= nil then
			self._armor_piercing_chance = math.clamp(self._armor_piercing_chance + self._ammo_data.armor_piercing_add, 0, 1)
		end
		if self._ammo_data.armor_piercing_mul ~= nil then
			self._armor_piercing_chance = math.clamp(self._armor_piercing_chance * self._ammo_data.armor_piercing_mul, 0, 1)
		end
	end
	if self._silencer then
		self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash_silenced or "effects/payday2/particles/weapons/9mm_auto_silence_fps")
	elseif self._ammo_data and self._ammo_data.muzzleflash ~= nil then
		self._muzzle_effect = Idstring(self._ammo_data.muzzleflash)
	else
		self._muzzle_effect = Idstring(self:weapon_tweak_data().muzzleflash or "effects/particles/test/muzzleflash_maingun")
	end
	self._muzzle_effect_table = {
		effect = self._muzzle_effect,
		parent = self._obj_fire,
		force_synch = self._muzzle_effect_table.force_synch or false
	}
	local base_stats = self:weapon_tweak_data().stats
	if not base_stats then
		return
	end
	local parts_stats = managers.weapon_factory:get_stats(self._factory_id, self._blueprint)
	local stats = deep_clone(base_stats)
	local stats_tweak_data = tweak_data.weapon.stats
	local modifier_stats = self:weapon_tweak_data().stats_modifiers
	local bonus_stats = self._cosmetics_bonus and self._cosmetics_data and self._cosmetics_data.bonus and tweak_data.economy.bonuses[self._cosmetics_data.bonus] and tweak_data.economy.bonuses[self._cosmetics_data.bonus].stats or {}
	if managers.job:is_current_job_competitive() or managers.weapon_factory:has_perk("bonus", self._factory_id, self._blueprint) then
		bonus_stats = {}
	end
	if stats.zoom then
		stats.zoom = math.min(stats.zoom + managers.player:upgrade_value(self:weapon_tweak_data().category, "zoom_increase", 0), #stats_tweak_data.zoom)
	end
	for stat, _ in pairs(stats) do
		if stats[stat] < 1 or stats[stat] > #stats_tweak_data[stat] then
			Application:error("[NewRaycastWeaponBase] Base weapon stat is out of bound!", "stat: " .. stat, "index: " .. stats[stat], "max_index: " .. #stats_tweak_data[stat], "This stat will be clamped!")
		end
		if parts_stats[stat] then
			stats[stat] = stats[stat] + parts_stats[stat]
		end
		if bonus_stats[stat] then
			stats[stat] = stats[stat] + bonus_stats[stat]
		end
		stats[stat] = math_clamp(stats[stat], 1, #stats_tweak_data[stat])
	end
	self._current_stats_indices = stats
	self._current_stats = {}
	for stat, i in pairs(stats) do
		self._current_stats[stat] = stats_tweak_data[stat][i]
		if modifier_stats and modifier_stats[stat] then
			self._current_stats[stat] = self._current_stats[stat] * modifier_stats[stat]
		end
	end
	self._current_stats.alert_size = stats_tweak_data.alert_size[math_clamp(stats.alert_size, 1, #stats_tweak_data.alert_size)]
	if modifier_stats and modifier_stats.alert_size then
		self._current_stats.alert_size = self._current_stats.alert_size * modifier_stats.alert_size
	end
	if stats.concealment then
		stats.suspicion = math.clamp(#stats_tweak_data.concealment - base_stats.concealment - (parts_stats.concealment or 0), 1, #stats_tweak_data.concealment)
		self._current_stats.suspicion = stats_tweak_data.concealment[stats.suspicion]
	end
	self._alert_size = self._current_stats.alert_size or self._alert_size
	self._suppression = self._current_stats.suppression or self._suppression
	self._zoom = self._current_stats.zoom or self._zoom
	self._spread = self._current_stats.spread or self._spread
	self._recoil = self._current_stats.recoil or self._recoil
	self._spread_moving = self._current_stats.spread_moving or self._spread_moving
	self._extra_ammo = self._current_stats.extra_ammo or self._extra_ammo
	self._total_ammo_mod = self._current_stats.total_ammo_mod or self._total_ammo_mod
	self._has_gadget = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	self._scopes = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("scope", self._factory_id, self._blueprint)
	self._can_highlight = managers.weapon_factory:has_perk("highlight", self._factory_id, self._blueprint)
	self:_check_second_sight()
	self:_check_reticle_obj()
	self:replenish()
end
function NewRaycastWeaponBase:_check_reticle_obj()
	self._reticle_obj = nil
	local part = managers.weapon_factory:get_part_from_weapon_by_type("sight", self._parts)
	if part then
		local part_id = managers.weapon_factory:get_part_id_from_weapon_by_type("sight", self._blueprint)
		local part_tweak = tweak_data.weapon.factory.parts[part_id]
		if part_tweak and part_tweak.reticle_obj then
			self._reticle_obj = part.unit:get_object(Idstring(part_tweak.reticle_obj))
		end
	end
end
function NewRaycastWeaponBase:_check_second_sight()
	self._second_sight_data = nil
	if self._has_gadget then
		local factory = tweak_data.weapon.factory
		for _, part_id in ipairs(self._has_gadget) do
			if factory.parts[part_id].sub_type == "second_sight" then
				self._second_sight_data = {}
				self._second_sight_data.part_id = part_id
				self._second_sight_data.unit = self._parts and self._parts[part_id] and alive(self._parts[part_id].unit) and self._parts[part_id].unit
			else
			end
		end
	end
end
function NewRaycastWeaponBase:zoom()
	if self:is_second_sight_on() then
		local gadget_zoom_stats = tweak_data.weapon.factory.parts[self._second_sight_data.part_id].stats.gadget_zoom
		return tweak_data.weapon.stats.zoom[gadget_zoom_stats]
	end
	return NewRaycastWeaponBase.super.zoom(self)
end
function NewRaycastWeaponBase:is_second_sight_on()
	if not self._second_sight_data or not self._second_sight_data.unit then
		return false
	end
	return self._second_sight_data.unit:base():is_on()
end
function NewRaycastWeaponBase:_check_sound_switch()
	local suppressed_switch = managers.weapon_factory:get_sound_switch("suppressed", self._factory_id, self._blueprint)
	self._sound_fire:set_switch("suppressed", suppressed_switch or "regular")
end
function NewRaycastWeaponBase:stance_id()
	return "new_m4"
end
function NewRaycastWeaponBase:weapon_hold()
	return self:weapon_tweak_data().weapon_hold
end
function NewRaycastWeaponBase:replenish()
	local ammo_max_multiplier = managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)
	ammo_max_multiplier = ammo_max_multiplier * managers.player:upgrade_value(self:weapon_tweak_data().category, "extra_ammo_multiplier", 1)
	ammo_max_multiplier = ammo_max_multiplier + ammo_max_multiplier * (self._total_ammo_mod or 0)
	if managers.player:has_category_upgrade("player", "add_armor_stat_skill_ammo_mul") then
		ammo_max_multiplier = ammo_max_multiplier * managers.player:body_armor_value("skill_ammo_mul", nil, 1)
	end
	local ammo_max_per_clip = self:calculate_ammo_max_per_clip()
	local ammo_max = math.round((tweak_data.weapon[self._name_id].AMMO_MAX + managers.player:upgrade_value(self._name_id, "clip_amount_increase") * ammo_max_per_clip) * ammo_max_multiplier)
	ammo_max_per_clip = math.min(ammo_max_per_clip, ammo_max)
	self:set_ammo_max_per_clip(ammo_max_per_clip)
	self:set_ammo_max(ammo_max)
	self:set_ammo_total(ammo_max)
	self:set_ammo_remaining_in_clip(ammo_max_per_clip)
	self._ammo_pickup = tweak_data.weapon[self._name_id].AMMO_PICKUP
	self:update_damage()
end
function NewRaycastWeaponBase:update_damage()
	self._damage = ((self._current_stats and self._current_stats.damage or 0) + self:damage_addend()) * self:damage_multiplier()
end
function NewRaycastWeaponBase:calculate_ammo_max_per_clip()
	local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX
	ammo = ammo + managers.player:upgrade_value(self._name_id, "clip_ammo_increase")
	if not self:upgrade_blocked("weapon", "clip_ammo_increase") then
		ammo = ammo + managers.player:upgrade_value("weapon", "clip_ammo_increase", 0)
	end
	if not self:upgrade_blocked(tweak_data.weapon[self._name_id].category, "clip_ammo_increase") then
		ammo = ammo + managers.player:upgrade_value(tweak_data.weapon[self._name_id].category, "clip_ammo_increase", 0)
	end
	ammo = ammo + (self._extra_ammo or 0)
	return ammo
end
function NewRaycastWeaponBase:movement_penalty()
	return self._movement_penalty or 1
end
function NewRaycastWeaponBase:armor_piercing_chance()
	return self._armor_piercing_chance or 0
end
function NewRaycastWeaponBase:get_reticle_obj()
	return self._reticle_obj
end
function NewRaycastWeaponBase:stance_mod()
	if not self._blueprint or not self._factory_id then
		return nil
	end
	local using_second_sight = self:is_second_sight_on()
	return managers.weapon_factory:get_stance_mod(self._factory_id, self._blueprint, self:is_second_sight_on())
end
function NewRaycastWeaponBase:tweak_data_anim_play(anim, speed_multiplier)
	local data = tweak_data.weapon.factory[self._factory_id]
	if data.animations and data.animations[anim] then
		local anim_name = data.animations[anim]
		local length = self._unit:anim_length(Idstring(anim_name))
		speed_multiplier = speed_multiplier or 1
		self._unit:anim_stop(Idstring(anim_name))
		self._unit:anim_play_to(Idstring(anim_name), length, speed_multiplier)
	end
	for part_id, data in pairs(self._parts) do
		if data.animations and data.animations[anim] then
			local anim_name = data.animations[anim]
			local length = data.unit:anim_length(Idstring(anim_name))
			speed_multiplier = speed_multiplier or 1
			data.unit:anim_stop(Idstring(anim_name))
			data.unit:anim_play_to(Idstring(anim_name), length, speed_multiplier)
		end
	end
	NewRaycastWeaponBase.super.tweak_data_anim_play(self, anim, speed_multiplier)
	return true
end
function NewRaycastWeaponBase:tweak_data_anim_stop(anim)
	local data = tweak_data.weapon.factory[self._factory_id]
	if data.animations and data.animations[anim] then
		local anim_name = data.animations[anim]
		self._unit:anim_stop(Idstring(anim_name))
	end
	for part_id, data in pairs(self._parts) do
		if data.unit and data.animations and data.animations[anim] then
			local anim_name = data.animations[anim]
			data.unit:anim_stop(Idstring(anim_name))
		end
	end
	NewRaycastWeaponBase.super.tweak_data_anim_stop(self, anim)
end
function NewRaycastWeaponBase:_set_parts_enabled(enabled)
	if self._parts then
		local anim_groups
		local empty_s = Idstring("")
		for part_id, data in pairs(self._parts) do
			if alive(data.unit) then
				if not enabled then
					anim_groups = data.unit:anim_groups()
					for _, anim in ipairs(anim_groups) do
						if anim ~= empty_s then
							data.unit:anim_play_to(anim, 0)
							data.unit:anim_stop()
						end
					end
				end
				data.unit:set_enabled(enabled)
				if data.unit:digital_gui() then
					data.unit:digital_gui():set_visible(enabled)
				end
				if data.unit:digital_gui_upper() then
					data.unit:digital_gui_upper():set_visible(enabled)
				end
			end
		end
	end
end
function NewRaycastWeaponBase:on_enabled(...)
	NewRaycastWeaponBase.super.on_enabled(self, ...)
	self:_set_parts_enabled(true)
end
function NewRaycastWeaponBase:on_disabled(...)
	NewRaycastWeaponBase.super.on_disabled(self, ...)
	self:gadget_off()
	self:_set_parts_enabled(false)
end
function NewRaycastWeaponBase:fire_mode()
	self._fire_mode = self._locked_fire_mode or self._fire_mode or Idstring(tweak_data.weapon[self._name_id].FIRE_MODE or "single")
	return self._fire_mode == ids_single and "single" or "auto"
end
function NewRaycastWeaponBase:recoil_wait()
	local tweak_is_auto = tweak_data.weapon[self._name_id].FIRE_MODE == "auto"
	local weapon_is_auto = self:fire_mode() == "auto"
	if not tweak_is_auto then
		return nil
	end
	local multiplier = tweak_is_auto == weapon_is_auto and 1 or 2
	return self:weapon_tweak_data().fire_mode_data.fire_rate * multiplier
end
function NewRaycastWeaponBase:can_toggle_firemode()
	return tweak_data.weapon[self._name_id].CAN_TOGGLE_FIREMODE
end
function NewRaycastWeaponBase:toggle_firemode()
	local can_toggle = not self._locked_fire_mode and self:can_toggle_firemode()
	if can_toggle then
		if self._fire_mode == ids_single then
			self._fire_mode = ids_auto
			self._sound_fire:post_event("wp_auto_switch_on")
		else
			self._fire_mode = ids_single
			self._sound_fire:post_event("wp_auto_switch_off")
		end
		return true
	end
	return false
end
function NewRaycastWeaponBase:set_ammo_remaining_in_clip(...)
	NewRaycastWeaponBase.super.set_ammo_remaining_in_clip(self, ...)
	self:check_bullet_objects()
end
function NewRaycastWeaponBase:check_bullet_objects()
	if self._bullet_objects then
		self:_update_bullet_objects(self:get_ammo_remaining_in_clip())
	end
end
function NewRaycastWeaponBase:predict_bullet_objects()
	self:_update_bullet_objects(self:get_ammo_total())
end
function NewRaycastWeaponBase:_update_bullet_objects(ammo)
	if self._bullet_objects then
		for i, objects in pairs(self._bullet_objects) do
			for _, object in ipairs(objects) do
				object:set_visibility(i <= ammo)
			end
		end
	end
end
function NewRaycastWeaponBase:has_part(part_id)
	return self._blueprint and table.contains(self._blueprint, part_id)
end
function NewRaycastWeaponBase:has_gadget()
	return self._has_gadget
end
function NewRaycastWeaponBase:is_gadget_on()
	return self._gadget_on and self._gadget_on > 0 and self._gadget_on or false
end
function NewRaycastWeaponBase:gadget_on()
	self:set_gadget_on(1, true)
end
function NewRaycastWeaponBase:gadget_off()
	self:set_gadget_on(0, true, nil, true)
end
function NewRaycastWeaponBase:set_gadget_on(gadget_on, ignore_enable, gadgets, ignore_bipod)
	if not ignore_enable and not self._enabled then
		return
	end
	if not self._assembly_complete then
		return
	end
	self._gadget_on = gadget_on or self._gadget_on
	gadgets = gadgets or managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	if gadgets then
		do
			local xd, yd
			local part_factory = tweak_data.weapon.factory.parts
			table.sort(gadgets, function(x, y)
				xd = self._parts[x]
				yd = self._parts[y]
				if not xd then
					return false
				end
				if not yd then
					return true
				end
				return xd.unit:base().GADGET_TYPE > yd.unit:base().GADGET_TYPE
			end)
			local gadget
			for i, id in ipairs(gadgets) do
				gadget = self._parts[id]
				if gadget then
					local is_bipod = ignore_bipod and gadget.unit:base():is_bipod()
					if not is_bipod then
						gadget.unit:base():set_state(self._gadget_on == i, self._sound_fire)
					end
					if gadget.unit:base():is_bipod() then
						if gadget.unit:base():bipod_state() then
							self._gadget_on = i
						else
							self._gadget_on = 0
						end
					end
				end
			end
		end
	end
end
function NewRaycastWeaponBase:toggle_gadget()
	if not self._enabled then
		return false
	end
	local gadget_on = self._gadget_on or 0
	local gadgets = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	if gadgets then
		gadget_on = (gadget_on + 1) % (#gadgets + 1)
		self:set_gadget_on(gadget_on, false, gadgets)
		return true
	end
	do return false end
	if not self._enabled then
		return
	end
	self._gadget_on = self._gadget_on or 0
	local gadgets = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	if gadgets then
		self._gadget_on = ((self._gadget_on or 0) + 1) % (#gadgets + 1)
		local gadget
		for _, i in ipairs(gadgets) do
			gadget = self._parts[i]
			gadget.unit:base():set_state(self._gadget_on == i, self._sound_fire)
		end
	end
end
function NewRaycastWeaponBase:gadget_update()
	self:set_gadget_on(false, true)
end
function NewRaycastWeaponBase:is_bipod_usable()
	local retval = false
	local bipod_part = managers.weapon_factory:get_parts_from_weapon_by_perk("bipod", self._parts)
	local bipod_unit
	if bipod_part and bipod_part[1] then
		bipod_unit = bipod_part[1].unit:base()
	end
	if bipod_unit then
		retval = bipod_unit:is_usable()
	end
	return retval
end
function NewRaycastWeaponBase:gadget_toggle_requires_stance_update()
	if not self._enabled then
		return false
	end
	if not self._has_gadget then
		return false
	end
	for _, part_id in ipairs(self._has_gadget) do
		if self._parts[part_id].unit:base():toggle_requires_stance_update() then
			return true
		end
	end
	return false
end
function NewRaycastWeaponBase:check_stats()
	local base_stats = self:weapon_tweak_data().stats
	if not base_stats then
		print("no stats")
		return
	end
	local parts_stats = managers.weapon_factory:get_stats(self._factory_id, self._blueprint)
	local stats = deep_clone(base_stats)
	local tweak_data = tweak_data.weapon.stats
	local modifier_stats = self:weapon_tweak_data().stats_modifiers
	stats.zoom = math.min(stats.zoom + managers.player:upgrade_value(self:weapon_tweak_data().category, "zoom_increase", 0), #tweak_data.zoom)
	for stat, _ in pairs(stats) do
		if parts_stats[stat] then
			stats[stat] = math_clamp(stats[stat] + parts_stats[stat], 1, #tweak_data[stat])
		end
	end
	self._current_stats = {}
	for stat, i in pairs(stats) do
		self._current_stats[stat] = tweak_data[stat][i]
		if modifier_stats and modifier_stats[stat] then
			self._current_stats[stat] = self._current_stats[stat] * modifier_stats[stat]
		end
	end
	self._current_stats.alert_size = tweak_data.alert_size[math_clamp(stats.alert_size, 1, #tweak_data.alert_size)]
	if modifier_stats and modifier_stats.alert_size then
		self._current_stats.alert_size = self._current_stats.alert_size * modifier_stats.alert_size
	end
	return stats
end
function NewRaycastWeaponBase:_convert_add_to_mul(value)
	if value > 1 then
		return 1 / value
	elseif value < 1 then
		return math.abs(value - 1) + 1
	else
		return 1
	end
end
function NewRaycastWeaponBase:_get_spread(user_unit)
	local current_state = user_unit:movement()._current_state
	local spread = self._spread
	if current_state and current_state._unit_deploy_position then
		spread = tweak_data.weapon.stats.spread[20]
	end
	local spread_multiplier = self:spread_multiplier(current_state)
	local spread_addend = self:spread_addend(current_state)
	return math.max((spread + spread_addend) * spread_multiplier, 0)
end
function NewRaycastWeaponBase:fire_rate_multiplier()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	return managers.blackmarket:fire_rate_multiplier(self._name_id, self:weapon_tweak_data().category, self._silencer, nil, current_state, self._blueprint)
end
function NewRaycastWeaponBase:damage_addend()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	return managers.blackmarket:damage_addend(self._name_id, self:weapon_tweak_data().category, self._silencer, nil, current_state, self._blueprint)
end
function NewRaycastWeaponBase:damage_multiplier()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state
	return managers.blackmarket:damage_multiplier(self._name_id, self:weapon_tweak_data().category, self._silencer, nil, current_state, self._blueprint)
end
function NewRaycastWeaponBase:melee_damage_multiplier()
	return managers.player:upgrade_value(self._name_id, "melee_multiplier", 1)
end
function NewRaycastWeaponBase:spread_addend(current_state)
	return managers.blackmarket:accuracy_addend(self._name_id, self:weapon_tweak_data().category, self._current_stats_indices and self._current_stats_indices.spread, self._silencer, current_state, self:fire_mode(), self._blueprint)
end
function NewRaycastWeaponBase:spread_multiplier(current_state)
	return managers.blackmarket:accuracy_multiplier(self._name_id, self:weapon_tweak_data().category, self._silencer, current_state, self._spread_moving, self:fire_mode(), self._blueprint)
end
function NewRaycastWeaponBase:recoil_addend()
	return managers.blackmarket:recoil_addend(self._name_id, self:weapon_tweak_data().category, self._current_stats_indices and self._current_stats_indices.recoil, self._silencer, self._blueprint)
end
function NewRaycastWeaponBase:recoil_multiplier()
	return managers.blackmarket:recoil_multiplier(self._name_id, self:weapon_tweak_data().category, self._silencer, self._blueprint)
end
function NewRaycastWeaponBase:enter_steelsight_speed_multiplier()
	local multiplier = 1
	multiplier = multiplier + (1 - managers.player:upgrade_value(self:weapon_tweak_data().category, "enter_steelsight_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1))
	if self._silencer then
		multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "silencer_enter_steelsight_speed_multiplier", 1))
		multiplier = multiplier + (1 - managers.player:upgrade_value(self:weapon_tweak_data().category, "silencer_enter_steelsight_speed_multiplier", 1))
	end
	return self:_convert_add_to_mul(multiplier)
end
function NewRaycastWeaponBase:fire_rate_multiplier()
	local multiplier = 1
	multiplier = multiplier + (1 - managers.player:upgrade_value(self:weapon_tweak_data().category, "fire_rate_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value(self._name_id, "fire_rate_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "fire_rate_multiplier", 1))
	return self:_convert_add_to_mul(multiplier)
end
function NewRaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1
	multiplier = multiplier + (1 - managers.player:upgrade_value(self:weapon_tweak_data().category, "reload_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1))
	multiplier = multiplier + (1 - managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1))
	if self._setup and alive(self._setup.user_unit) and self._setup.user_unit:movement() then
		local morale_boost_bonus = self._setup.user_unit:movement():morale_boost()
		if morale_boost_bonus then
			multiplier = multiplier + (1 - morale_boost_bonus.reload_speed_bonus)
		end
	end
	return self:_convert_add_to_mul(multiplier)
end
function NewRaycastWeaponBase:_debug_bipod()
	local gadgets = managers.weapon_factory:get_parts_from_weapon_by_type_or_perk("gadget", self._factory_id, self._blueprint)
	if gadgets then
		do
			local xd, yd
			local part_factory = tweak_data.weapon.factory.parts
			table.sort(gadgets, function(x, y)
				xd = self._parts[x]
				yd = self._parts[y]
				if not xd then
					return false
				end
				if not yd then
					return true
				end
				return xd.unit:base().GADGET_TYPE > yd.unit:base().GADGET_TYPE
			end)
			local gadget
			for i, id in ipairs(gadgets) do
				gadget = self._parts[id]
				if gadget then
					local is_bipod = gadget.unit:base():is_bipod()
					if is_bipod then
						gadget.unit:base():_shoot_bipod_rays(true)
					end
				end
			end
		end
	end
end
function NewRaycastWeaponBase:reload_expire_t()
	if self._use_shotgun_reload then
		local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()
		return math.min(self:get_ammo_total() - ammo_remaining_in_clip, self:get_ammo_max_per_clip() - ammo_remaining_in_clip) * self:reload_shell_expire_t()
	end
	return nil
end
function NewRaycastWeaponBase:reload_enter_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_enter or 0.3
	end
	return nil
end
function NewRaycastWeaponBase:reload_exit_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_exit_empty or 0.7
	end
	return nil
end
function NewRaycastWeaponBase:reload_not_empty_exit_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_exit_not_empty or 0.3
	end
	return nil
end
function NewRaycastWeaponBase:reload_shell_expire_t()
	if self._use_shotgun_reload then
		return self:weapon_tweak_data().timers.shotgun_reload_shell or 0.56666666
	end
	return nil
end
function NewRaycastWeaponBase:_first_shell_reload_expire_t()
	if self._use_shotgun_reload then
		return self:reload_shell_expire_t() - (self:weapon_tweak_data().timers.shotgun_reload_first_shell_offset or 0.33)
	end
	return nil
end
function NewRaycastWeaponBase:start_reload(...)
	NewRaycastWeaponBase.super.start_reload(self, ...)
	if self._use_shotgun_reload then
		self._started_reload_empty = self:clip_empty()
		local speed_multiplier = self:reload_speed_multiplier()
		self._next_shell_reloded_t = managers.player:player_timer():time() + self:_first_shell_reload_expire_t() / speed_multiplier
	end
end
function NewRaycastWeaponBase:started_reload_empty()
	if self._use_shotgun_reload then
		return self._started_reload_empty
	end
	return nil
end
function NewRaycastWeaponBase:update_reloading(t, dt, time_left)
	if self._use_shotgun_reload and t > self._next_shell_reloded_t then
		local speed_multiplier = self:reload_speed_multiplier()
		self._next_shell_reloded_t = self._next_shell_reloded_t + self:reload_shell_expire_t() / speed_multiplier
		self:set_ammo_remaining_in_clip(math.min(self:get_ammo_max_per_clip(), self:get_ammo_remaining_in_clip() + 1))
		managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)
		return true
	end
end
function NewRaycastWeaponBase:reload_interuptable()
	if self._use_shotgun_reload then
		return true
	end
	return false
end
function NewRaycastWeaponBase:shotgun_shell_data()
	if self._use_shotgun_reload then
		local reload_shell_data = self:weapon_tweak_data().animations.reload_shell_data
		local unit_name = reload_shell_data and reload_shell_data.unit_name or "units/payday2/weapons/wpn_fps_shell/wpn_fps_shell"
		local align = reload_shell_data and reload_shell_data.align or nil
		return {unit_name = unit_name, align = align}
	end
	return nil
end
function NewRaycastWeaponBase:set_timer(timer, ...)
	NewRaycastWeaponBase.super.set_timer(self, timer)
	if self._assembly_complete then
		for id, data in pairs(self._parts) do
			if not alive(data.unit) then
				Application:error("[NewRaycastWeaponBase:set_timer] Missing unit in weapon parts!", "weapon id", self._name_id, "part id", id, "part", inspect(data), "parts", inspect(self._parts), "blueprint", inspect(self._blueprint), "assembly_complete", self._assembly_complete, "self", inspect(self))
			end
			data.unit:set_timer(timer)
			data.unit:set_animation_timer(timer)
		end
	end
end
function NewRaycastWeaponBase:destroy(unit)
	NewRaycastWeaponBase.super.destroy(self, unit)
	if self._parts_texture_switches then
		for part_id, texture_ids in pairs(self._parts_texture_switches) do
			TextureCache:unretrieve(texture_ids)
		end
	end
	if self._textures then
		for tex_id, texture_data in pairs(self._textures) do
			if not texture_data.applied then
				texture_data.applied = true
				TextureCache:unretrieve(texture_data.name)
			end
		end
	end
	managers.weapon_factory:disassemble(self._parts)
end
