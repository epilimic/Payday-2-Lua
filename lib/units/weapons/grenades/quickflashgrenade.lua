QuickFlashGrenade = QuickFlashGrenade or class(QuickSmokeGrenade)
function QuickFlashGrenade:preemptive_kill()
	self._unit:set_slot(0)
end
function QuickFlashGrenade:_play_sound_and_effects()
	if self._state == 1 then
		local sound_source = SoundDevice:create_source("grenade_fire_source")
		sound_source:set_position(self._shoot_position)
		sound_source:post_event("grenade_gas_npc_fire")
	elseif self._state == 2 then
		local bounce_point = Vector3()
		mvector3.lerp(bounce_point, self._shoot_position, self._unit:position(), 0.65)
		local sound_source = SoundDevice:create_source("grenade_bounce_source")
		sound_source:set_position(bounce_point)
		sound_source:post_event("flashbang_bounce", callback(self, self, "sound_playback_complete_clbk"), sound_source, "end_of_event")
	elseif self._state == 3 then
		self._unit:sound_source():post_event("flashbang_explosion")
		local detonate_pos = self._unit:position()
		self:make_flash(detonate_pos)
		managers.groupai:state():propagate_alert({
			"aggression",
			detonate_pos,
			10000,
			managers.groupai:state():get_unit_type_filter("civilians_enemies"),
			nil
		})
	end
end
function QuickFlashGrenade:make_flash(detonate_pos, range, ignore_units)
	local range = range or 1000
	local affected, line_of_sight, travel_dis, linear_dis = self:_chk_dazzle_local_player(detonate_pos, range, ignore_units)
	if affected then
		managers.environment_controller:set_flashbang(detonate_pos, line_of_sight, travel_dis, linear_dis, tweak_data.character.flashbang_multiplier)
		local sound_eff_mul = math.clamp(1 - (travel_dis or linear_dis) / range, 0.3, 1)
		managers.player:player_unit():character_damage():on_flashbanged(sound_eff_mul)
	end
end
function QuickFlashGrenade:_chk_dazzle_local_player(detonate_pos, range, ignore_units)
	local player = managers.player:player_unit()
	if not alive(player) then
		return
	end
	local detonate_pos = detonate_pos or self._unit:position() + math.UP * 150
	local m_pl_head_pos = player:movement():m_head_pos()
	local linear_dis = mvector3.distance(detonate_pos, m_pl_head_pos)
	if range < linear_dis then
		return
	end
	local slotmask = managers.slot:get_mask("bullet_impact_targets")
	local function _vis_ray_func(from, to, boolean)
		if ignore_units then
			return World:raycast("ray", from, to, "ignore_unit", ignore_units, "slot_mask", slotmask, boolean and "report" or nil)
		else
			return World:raycast("ray", from, to, "slot_mask", slotmask, boolean and "report" or nil)
		end
	end
	if not _vis_ray_func(m_pl_head_pos, detonate_pos, true) then
		return true, true, nil, linear_dis
	end
	local random_rotation = Rotation(360 * math.random(), 360 * math.random(), 360 * math.random())
	local raycast_dir = Vector3()
	local bounce_pos = Vector3()
	for _, axis in ipairs({
		"x",
		"y",
		"z"
	}) do
		for _, polarity in ipairs({1, -1}) do
			mvector3.set_zero(raycast_dir)
			mvector3["set_" .. axis](raycast_dir, polarity)
			mvector3.rotate_with(raycast_dir, random_rotation)
			mvector3.set(bounce_pos, raycast_dir)
			mvector3.multiply(bounce_pos, range)
			mvector3.add(bounce_pos, detonate_pos)
			local bounce_ray = _vis_ray_func(detonate_pos, bounce_pos)
			if bounce_ray then
				mvector3.set(bounce_pos, raycast_dir)
				mvector3.multiply(bounce_pos, -1 * math.min(bounce_ray.distance, 10))
				mvector3.add(bounce_pos, bounce_ray.position)
				local return_ray = _vis_ray_func(m_pl_head_pos, bounce_pos, true)
				if not return_ray then
					local travel_dis = bounce_ray.distance + mvector3.distance(m_pl_head_pos, bounce_pos)
					if range > travel_dis then
						return true, false, travel_dis, linear_dis
					end
				end
			end
		end
	end
end
function QuickFlashGrenade:sound_playback_complete_clbk(event_instance, sound_source, event_type, sound_source_again)
end
function QuickFlashGrenade:destroy()
end
