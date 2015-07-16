SentryGunBase = SentryGunBase or class(UnitBase)
function SentryGunBase:init(unit)
	SentryGunBase.super.init(self, unit, false)
	self._unit = unit
	if self._place_snd_event then
		self._unit:sound_source():post_event(self._place_snd_event)
	end
	if Network:is_client() and not self._skip_authentication then
		self._validate_clbk_id = "sentry_gun_validate" .. tostring(unit:key())
		managers.enemy:add_delayed_clbk(self._validate_clbk_id, callback(self, self, "_clbk_validate"), Application:time() + 60)
	end
end
function SentryGunBase:_clbk_validate()
	self._validate_clbk_id = nil
	if not self._was_dropin then
		local peer = managers.network:session():server_peer()
		peer:mark_cheater(VoteManager.REASON.many_assets)
	end
end
function SentryGunBase:sync_setup(upgrade_lvl, peer_id)
	if self._validate_clbk_id then
		managers.enemy:remove_delayed_clbk(self._validate_clbk_id)
		self._validate_clbk_id = nil
	end
	managers.player:verify_equipment(peer_id, "sentry_gun")
	self:_setup_contour()
end
function SentryGunBase:set_owner_id(owner_id)
	self._owner_id = owner_id
	self:_setup_contour()
end
function SentryGunBase:is_owner()
	return self._owner_id and self._owner_id == managers.network:session():local_peer():id()
end
function SentryGunBase:_setup_contour()
	local turret_units = managers.groupai:state():turrets()
	if turret_units and table.contains(turret_units, self._unit) then
		return
	end
	if managers.player:has_category_upgrade("sentry_gun", "can_reload") then
		self._unit:contour():add("deployable_interactable")
	elseif self:is_owner() then
		self._unit:contour():add("deployable_active")
	end
end
function SentryGunBase:post_init()
	if self._difficulty_sequences then
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local difficulty_sequences_split = string.split(self._difficulty_sequences, ";")
		local difficulty_sequence = difficulty_sequences_split[difficulty_index]
		if difficulty_sequence and difficulty_sequence ~= "" then
			self._unit:damage():run_sequence_simple(difficulty_sequence)
		end
	end
	if Network:is_client() then
		self._unit:brain():set_active(true)
	end
end
function SentryGunBase.spawn(owner, pos, rot, ammo_multiplier, armor_multiplier, damage_multiplier, peer_id, verify_equipment)
	local attached_data = SentryGunBase._attach(pos, rot)
	if not attached_data then
		return
	end
	if verify_equipment and not managers.player:verify_equipment(peer_id, "sentry_gun") then
		return
	end
	local spread_multiplier, rot_speed_multiplier, has_shield
	if owner and owner:base().upgrade_value then
		spread_multiplier = owner:base():upgrade_value("sentry_gun", "spread_multiplier") or 1
		rot_speed_multiplier = owner:base():upgrade_value("sentry_gun", "rot_speed_multiplier") or 1
		has_shield = owner:base():upgrade_value("sentry_gun", "shield")
	else
		spread_multiplier = managers.player:upgrade_value("sentry_gun", "spread_multiplier", 1)
		rot_speed_multiplier = managers.player:upgrade_value("sentry_gun", "rot_speed_multiplier", 1)
		has_shield = managers.player:has_category_upgrade("sentry_gun", "shield")
	end
	local unit = World:spawn_unit(Idstring("units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry"), pos, rot)
	managers.network:session():send_to_peers_synched("sync_equipment_setup", unit, 0, peer_id or 0)
	unit:base():setup(owner, ammo_multiplier, armor_multiplier, damage_multiplier, spread_multiplier, rot_speed_multiplier, has_shield, attached_data)
	local team
	if owner then
		team = owner:movement():team()
	else
		team = managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("player"))
	end
	unit:movement():set_team(team)
	unit:brain():set_active(true)
	SentryGunBase.deployed = (SentryGunBase.deployed or 0) + 1
	return unit
end
function SentryGunBase:spawn_from_sequence(align_obj_name, module_id)
	if not Network:is_server() then
		return
	end
	local align_obj = self._unit:get_object(Idstring(align_obj_name))
	local pos = align_obj:position()
	local rot = align_obj:rotation()
	local attached_data = SentryGunBase._attach(pos, rot)
	if not attached_data then
		return
	end
	local unit
	unit = World:spawn_unit(Idstring("units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry"), pos, rot)
	unit:base():setup(managers.player:player_unit(), 1, 1, 1, 1, 1, false, attached_data)
	managers.network:session():send_to_peers_synched("sync_equipment_setup", unit, 0, 0)
	managers.network:session():send_to_peers_synched("from_server_sentry_gun_place_result", managers.network:session():local_peer():id(), 0, unit, unit:movement()._rot_speed_mul, unit:weapon()._setup.spread_mul, false)
	local team = managers.groupai:state():team_data(tweak_data.levels:get_default_team_ID("player"))
	unit:movement():set_team(team)
	unit:brain():set_active(true)
end
function SentryGunBase:activate_as_module(team_type, tweak_table_id)
	self._tweak_table_id = tweak_table_id
	local team_id = tweak_data.levels:get_default_team_ID(team_type)
	local team_data = managers.groupai:state():team_data(team_id)
	self._unit:movement():set_team(team_data)
	self._unit:movement():on_activated(tweak_table_id)
	local weapon_setup_data = {
		user_unit = nil,
		ignore_units = {
			self._unit
		},
		expend_ammo = true,
		autoaim = true,
		alert_AI = false,
		spread_mul = 1,
		auto_reload = true,
		bullet_slotmask = managers.slot:get_mask("bullet_impact_targets")
	}
	self._unit:weapon():setup(weapon_setup_data, 1)
	if Network:is_server() then
		self._unit:weapon():set_ammo(tweak_data.weapon[tweak_table_id].CLIP_SIZE)
	end
	self._unit:character_damage():set_health(tweak_data.weapon[tweak_table_id].HEALTH_INIT, tweak_data.weapon[tweak_table_id].SHIELD_HEALTH_INIT)
	self._unit:brain():setup(1)
	self._unit:brain():on_activated(tweak_table_id)
	self._unit:brain():set_active(true)
	self._is_module = true
	managers.groupai:state():register_turret(self._unit)
end
function SentryGunBase:get_name_id()
	return self._tweak_table_id
end
function SentryGunBase:set_server_information(peer_id)
	self._server_information = {owner_peer_id = peer_id}
	managers.network:session():peer(peer_id):set_used_deployable(true)
end
function SentryGunBase:server_information()
	return self._server_information
end
function SentryGunBase:setup(owner, ammo_multiplier, armor_multiplier, damage_multiplier, spread_multiplier, rot_speed_multiplier, has_shield, attached_data)
	if Network:is_client() and not self._skip_authentication then
		self._validate_clbk_id = "sentry_gun_validate" .. tostring(unit:key())
		managers.enemy:add_delayed_clbk(self._validate_clbk_id, callback(self, self, "_clbk_validate"), Application:time() + 60)
	end
	self._attached_data = attached_data
	self._ammo_multiplier = ammo_multiplier
	self._armor_multiplier = armor_multiplier
	self._damage_multiplier = damage_multiplier
	self._spread_multiplier = spread_multiplier
	self._rot_speed_multiplier = rot_speed_multiplier
	if has_shield then
		self:enable_shield()
	end
	local ammo_amount = tweak_data.upgrades.sentry_gun_base_ammo * ammo_multiplier
	self._unit:weapon():set_ammo(ammo_amount)
	local armor_amount = tweak_data.upgrades.sentry_gun_base_armor * armor_multiplier
	self._unit:character_damage():set_health(armor_amount, 0)
	self._owner = owner
	if owner then
		local peer = managers.network:session():peer_by_unit(owner)
		if peer then
			self._owner_id = peer:id()
		end
	end
	self._unit:movement():setup(rot_speed_multiplier)
	self._unit:brain():setup(1 / rot_speed_multiplier)
	self:register()
	self._unit:movement():set_team(owner:movement():team())
	local setup_data = {
		user_unit = self._owner,
		ignore_units = {
			self._unit,
			self._owner
		},
		expend_ammo = true,
		autoaim = true,
		alert_AI = true,
		alert_filter = self._owner:movement():SO_access(),
		spread_mul = spread_multiplier,
		creates_alerts = true
	}
	self._unit:weapon():setup(setup_data, damage_multiplier)
	self._unit:set_extension_update_enabled(Idstring("base"), true)
	self:_setup_contour()
	return true
end
function SentryGunBase:get_owner()
	return self._owner
end
function SentryGunBase:update(unit, t, dt)
	self:_check_body()
end
function SentryGunBase:_check_body()
	if self._attached_data.index == 1 then
		if not self._attached_data.body:enabled() then
			self._attached_data = self._attach(nil, nil, self._unit)
			if not self._attached_data then
				self:remove()
				return
			end
		end
	elseif self._attached_data.index == 2 then
		if not alive(self._attached_data.body) or not mrotation.equal(self._attached_data.rotation, self._attached_data.body:rotation()) then
			self._attached_data = self._attach(nil, nil, self._unit)
			if not self._attached_data then
				self:remove()
				return
			end
		end
	elseif self._attached_data.index == 3 and (not alive(self._attached_data.body) or mvector3.not_equal(self._attached_data.position, self._attached_data.body:position())) then
		self._attached_data = self._attach(nil, nil, self._unit)
		if not self._attached_data then
			self:remove()
			return
		end
	end
	self._attached_data.index = (self._attached_data.index < self._attached_data.max_index and self._attached_data.index or 0) + 1
end
function SentryGunBase:remove()
	self._removed = true
	self._unit:set_slot(0)
end
function SentryGunBase._attach(pos, rot, sentrygun_unit)
	pos = pos or sentrygun_unit:position()
	rot = rot or sentrygun_unit:rotation()
	local from_pos = pos + rot:z() * 10
	local to_pos = pos + rot:z() * -10
	local ray
	if sentrygun_unit then
		ray = sentrygun_unit:raycast("ray", from_pos, to_pos, "slot_mask", managers.slot:get_mask("world_geometry"))
	else
		ray = World:raycast("ray", from_pos, to_pos, "slot_mask", managers.slot:get_mask("world_geometry"))
	end
	if ray then
		local attached_data = {
			body = ray.body,
			position = ray.body:position(),
			rotation = ray.body:rotation(),
			index = 1,
			max_index = 3
		}
		return attached_data
	end
end
function SentryGunBase:set_visibility_state(stage)
	local state = stage and true
	if self._visibility_state ~= state then
		self._unit:set_visible(state)
		self._visibility_state = state
	end
	self._lod_stage = stage
end
function SentryGunBase:contour_selected()
	self._unit:contour():add("deployable_selected")
end
function SentryGunBase:contour_unselected()
	self._unit:contour():remove("deployable_selected")
end
function SentryGunBase:weapon_tweak_data()
	return tweak_data.weapon[self._unit:weapon()._name_id]
end
function SentryGunBase:check_interact_blocked(player)
	local result = not alive(self._unit) or self._unit:character_damage():dead() or self._unit:weapon():ammo_ratio() == 1 or not self:get_net_event_id(player) or false
	return result
end
function SentryGunBase:can_interact(player)
	return not self:check_interact_blocked(player)
end
function SentryGunBase:show_blocked_hint(interaction_tweak_data, player, skip_hint)
	print("SentryGunBase:show_blocked_hint", interaction_tweak_data, player, skip_hint)
	local event_id, wanted, possible = self:get_net_event_id(player)
	if self._unit:weapon():ammo_ratio() == 1 or not wanted then
		managers.hint:show_hint("hint_full_sentry_gun")
	else
		managers.hint:show_hint("hint_nea_sentry_gun")
	end
end
local refill_ratios = {
	1,
	0.9375,
	0.875,
	0.8125,
	0.75,
	0.6875,
	0.625,
	0.5625,
	0.5,
	0.4375,
	0.375,
	0.3125,
	0.25,
	0.1875,
	0.125,
	0.0625
}
function SentryGunBase:get_net_event_id(player)
	local sentry_gun_reload_ratio = tweak_data.upgrades.sentry_gun_reload_ratio or 1
	if sentry_gun_reload_ratio == 0 then
		return 1
	end
	local ammo_needed = 1 - self._unit:weapon():ammo_ratio()
	local ammo_got = 0
	local i = 0
	for id, weapon in pairs(player:inventory():available_selections()) do
		ammo_got = ammo_got + weapon.unit:base():get_ammo_ratio()
		i = i + 1
	end
	ammo_got = ammo_got / math.max(i, 1)
	local ammo_wanted = ammo_needed
	local wanted_event_id
	local index = 1
	repeat
		if not refill_ratios[index] then
			break
		elseif ammo_wanted >= refill_ratios[index] then
			wanted_event_id = index
		end
		index = index + 1
	until wanted_event_id
	local ammo_possible = ammo_got / sentry_gun_reload_ratio
	local possible_event_id
	local index = 1
	repeat
		if not refill_ratios[index] then
			break
		elseif ammo_possible >= refill_ratios[index] then
			possible_event_id = index
		end
		index = index + 1
	until possible_event_id
	local event_id = wanted_event_id and possible_event_id and math.max(wanted_event_id, possible_event_id)
	return event_id, wanted_event_id, possible_event_id
end
function SentryGunBase:interaction_text_id()
	return "debug_interact_sentry_gun_reload"
end
function SentryGunBase:add_string_macros(macroes)
	local event_id, wanted_event_id, possible_event_id = self:get_net_event_id(managers.player:local_player())
	macroes.AMMO = wanted_event_id and string.format("%2.f%%", (1 - refill_ratios[wanted_event_id]) * 100) or "100%"
end
function SentryGunBase:sync_net_event(event_id, peer)
	print("SentryGunBase:sync_net_event", event_id, inspect(peer), Network:is_server())
	local player = peer:unit()
	local ammo_ratio = refill_ratios[event_id]
	self:refill(ammo_ratio)
	if alive(player) and alive(managers.player:local_player()) and player:key() == managers.player:local_player():key() then
		local sentry_gun_reload_ratio = tweak_data.upgrades.sentry_gun_reload_ratio or 1
		if sentry_gun_reload_ratio > 0 then
			local ammo_reduction = ammo_ratio * sentry_gun_reload_ratio
			local leftover = 0
			local weapon_list = {}
			for id, weapon in pairs(player:inventory():available_selections()) do
				local ammo_ratio = weapon.unit:base():get_ammo_ratio()
				if ammo_reduction > ammo_ratio then
					leftover = leftover + ammo_reduction - ammo_ratio
					weapon_list[id] = {
						unit = weapon.unit,
						amount = ammo_ratio,
						total = ammo_ratio
					}
				else
					weapon_list[id] = {
						unit = weapon.unit,
						amount = ammo_reduction,
						total = ammo_ratio
					}
				end
			end
			for id, data in pairs(weapon_list) do
				local ammo_left = data.total - data.amount
				if leftover > 0 and ammo_left > 0 then
					local extra_ammo = leftover > ammo_left and ammo_left or leftover
					leftover = leftover - extra_ammo
					data.amount = data.amount + extra_ammo
				end
				if 0 < data.amount then
					data.unit:base():reduce_ammo_by_procentage_of_total(data.amount)
					managers.hud:set_ammo_amount(id, data.unit:base():ammo_info())
				end
			end
			if leftover > 0 then
				Application:error("[SentryGunBase:sync_net_event]: Not all ammo was reducted from the weapons")
			end
		end
	end
end
function SentryGunBase:refill(ammo_ratio)
	if self._unit:character_damage():dead() then
		return
	end
	if Network:is_server() then
		local ammo_total = self._unit:weapon():ammo_total()
		local ammo_max = self._unit:weapon():ammo_max()
		self._unit:weapon():change_ammo(math.ceil(ammo_max * ammo_ratio))
	else
		self:set_waiting_for_refill(true)
	end
	self._unit:brain():switch_on()
	self._unit:interaction():set_dirty(true)
	self:_setup_contour()
	self._unit:contour():remove("deployable_disabled")
end
function SentryGunBase:set_waiting_for_refill(state)
	self._waiting_for_refill = state and true or nil
end
function SentryGunBase:waiting_for_refill()
	return self._waiting_for_refill
end
function SentryGunBase:on_death()
	if self._unit:contour() then
		self._unit:contour():remove("deployable_active")
		self._unit:contour():remove("deployable_interactable")
	end
	self._unit:set_extension_update_enabled(Idstring("base"), false)
	self:unregister()
end
function SentryGunBase:enable_shield()
	self._has_shield = true
	self._unit:get_object(Idstring("g_shield")):set_visibility(true)
	self._unit:get_object(Idstring("s_shield")):set_visibility(true)
	self._unit:decal_surface():set_mesh_enabled(Idstring("dm_metal_shield"), true)
	self._unit:body("shield"):set_enabled(true)
end
function SentryGunBase:has_shield()
	return self._has_shield
end
function SentryGunBase:unregister()
	if self._registered then
		self._registered = nil
		managers.groupai:state():unregister_criminal(self._unit)
	end
end
function SentryGunBase:register()
	self._registered = true
	managers.groupai:state():register_criminal(self._unit)
end
function SentryGunBase:save(save_data)
	local my_save_data = {}
	save_data.base = my_save_data
	my_save_data.tweak_table_id = self._tweak_table_id
	my_save_data.is_module = self._is_module
end
function SentryGunBase:load(save_data)
	self._was_dropin = true
	local my_save_data = save_data.base
	self._tweak_table_id = my_save_data.tweak_table_id
	self._is_module = my_save_data.is_module
	if self._is_module then
		local turret_units = managers.groupai:state():turrets()
		if not turret_units or not table.contains(turret_units, self._unit) then
			managers.groupai:state():register_turret(self._unit)
		end
	end
end
function SentryGunBase:pre_destroy()
	SentryGunBase.super.pre_destroy(self, self._unit)
	self:unregister()
	self._removed = true
	if self._validate_clbk_id then
		managers.enemy:remove_delayed_clbk(self._validate_clbk_id)
		self._validate_clbk_id = nil
	end
end
