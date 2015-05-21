CopDamage = CopDamage or class()
CopDamage._all_event_types = {
	"dmg_rcv",
	"light_hurt",
	"hurt",
	"heavy_hurt",
	"death",
	"shield_knock",
	"stun",
	"counter_tased",
	"taser_tased"
}
CopDamage._ATTACK_VARIANTS = {
	"explosion",
	"stun",
	"fire"
}
CopDamage._HEALTH_GRANULARITY = 512
CopDamage.WEAPON_TYPE_GRANADE = 1
CopDamage.WEAPON_TYPE_BULLET = 2
CopDamage.WEAPON_TYPE_FLAMER = 3
CopDamage._hurt_severities = {
	none = false,
	light = "light_hurt",
	moderate = "hurt",
	heavy = "heavy_hurt",
	explode = "expl_hurt",
	fire = "fire_hurt"
}
CopDamage._impact_bones = {}
local impact_bones_tmp = {
	"Hips",
	"Spine",
	"Spine1",
	"Spine2",
	"Neck",
	"Head",
	"LeftShoulder",
	"LeftArm",
	"LeftForeArm",
	"RightShoulder",
	"RightArm",
	"RightForeArm",
	"LeftUpLeg",
	"LeftLeg",
	"LeftFoot",
	"RightUpLeg",
	"RightLeg",
	"RightFoot"
}
for i, k in ipairs(impact_bones_tmp) do
	local name_ids = Idstring(impact_bones_tmp[i])
	CopDamage._impact_bones[name_ids:key()] = name_ids
end
impact_bones_tmp = nil
local mvec_1 = Vector3()
local mvec_2 = Vector3()
function CopDamage:init(unit)
	self._unit = unit
	local char_tweak = tweak_data.character[unit:base()._tweak_table]
	self._HEALTH_INIT = char_tweak.HEALTH_INIT
	self._health = self._HEALTH_INIT
	self._health_ratio = 1
	self._HEALTH_INIT_PRECENT = self._HEALTH_INIT / self._HEALTH_GRANULARITY
	self._autotarget_data = {
		fast = unit:get_object(Idstring("Spine1"))
	}
	self._pickup = "ammo"
	self._listener_holder = EventListenerHolder:new()
	if char_tweak.permanently_invulnerable or self.immortal then
		self:set_invulnerable(true)
	end
	self._char_tweak = char_tweak
	self._spine2_obj = unit:get_object(Idstring("Spine2"))
	if self._head_body_name then
		self._ids_head_body_name = Idstring(self._head_body_name)
		self._head_body_key = self._unit:body(self._head_body_name):key()
	end
	self._ids_plate_name = Idstring("body_plate")
	self._has_plate = true
	local body = self._unit:body("mover_blocker")
	if body then
		body:add_ray_type(Idstring("trip_mine"))
	end
	self._last_time_unit_got_fire_damage = nil
	self._last_time_unit_got_fire_effect = nil
	self._temp_flame_redir_res = nil
	self._active_fire_bone_effects = {}
end
function CopDamage:get_last_time_unit_got_fire_damage()
	return self._last_time_unit_got_fire_damage
end
function CopDamage:set_last_time_unit_got_fire_damage(time)
	self._last_time_unit_got_fire_damage = time
end
function CopDamage:get_temp_flame_redir_res()
	return self._temp_flame_redir_res
end
function CopDamage:set_temp_flame_redir_res(value)
	self._temp_flame_redir_res = value
end
function CopDamage:get_damage_type(damage_percent, category)
	local hurt_table = self._char_tweak.damage.hurt_severity[category or "bullet"]
	local dmg = damage_percent / self._HEALTH_GRANULARITY
	if hurt_table.health_reference == "full" then
	elseif hurt_table.health_reference == "current" then
		dmg = math.min(1, self._HEALTH_INIT * dmg / self._health)
	else
		dmg = math.min(1, self._HEALTH_INIT * dmg / hurt_table.health_reference)
	end
	local zone
	for i_zone, test_zone in ipairs(hurt_table.zones) do
		if i_zone == #hurt_table.zones or dmg < test_zone.health_limit then
			zone = test_zone
		else
		end
	end
	local rand_nr = math.random()
	local total_w = 0
	for sev_name, hurt_type in pairs(self._hurt_severities) do
		local weight = zone[sev_name]
		if weight and weight > 0 then
			total_w = total_w + weight
			if rand_nr <= total_w then
				return hurt_type or "dmg_rcv"
			end
		end
	end
	return "dmg_rcv"
end
function CopDamage:is_head(body)
	local head = self._head_body_name and body and body:name() == self._ids_head_body_name
	return head
end
function CopDamage:damage_bullet(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	if self._has_plate and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_plate_name then
		local armor_pierce_roll = math.rand(1)
		local armor_pierce_value = 0
		if attack_data.attacker_unit == managers.player:player_unit() then
			armor_pierce_value = armor_pierce_value + attack_data.weapon_unit:base():armor_piercing_chance()
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("player", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_2", 0)
			armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("weapon", "armor_piercing_chance_silencer", 0)
			local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
			if weapon_category == "saw" then
				armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("saw", "armor_piercing_chance", 0)
			end
		elseif attack_data.attacker_unit:base() and attack_data.attacker_unit:base().sentry_gun then
			local owner = attack_data.attacker_unit:base():get_owner()
			if alive(owner) then
				if owner == managers.player:player_unit() then
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance", 0)
					armor_pierce_value = armor_pierce_value + managers.player:upgrade_value("sentry_gun", "armor_piercing_chance_2", 0)
				else
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance") or 0)
					armor_pierce_value = armor_pierce_value + (owner:base():upgrade_value("sentry_gun", "armor_piercing_chance_2") or 0)
				end
			end
		end
		if armor_pierce_roll >= armor_pierce_value then
			return
		end
	end
	local result
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end
	damage = damage * (self._marked_dmg_mul or 1)
	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
		end
	end
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end
	local damage_percent = math.ceil(math.clamp(damage / self._HEALTH_INIT_PRECENT, 1, self._HEALTH_GRANULARITY))
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	if damage >= self._health then
		if head and damage > math.random(10) then
			self:_spawn_head_gadget({
				position = attack_data.col_ray.body:position(),
				rotation = attack_data.col_ray.body:rotation(),
				dir = attack_data.col_ray.ray
			})
		end
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
		self:chk_killshot(attack_data.attacker_unit, attack_data.variant)
	else
		attack_data.damage = damage
		local result_type = self:get_damage_type(damage_percent, "bullet")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant
		}
		if managers.groupai:state():all_criminals()[attack_data.attacker_unit:key()] then
			managers.statistics:killed_by_anyone(data)
		end
		if attack_data.attacker_unit == managers.player:player_unit() then
			self:_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
			self:_show_death_hint(self._unit:base()._tweak_table)
			local attacker_state = managers.player:current_state()
			data.attacker_state = attacker_state
			managers.statistics:killed(data)
			if attack_data.attacker_unit:character_damage():bleed_out() and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
				local messiah_revive = false
				if managers.player:has_category_upgrade("player", "pistol_revive_from_bleed_out") then
					local weapon_category = data.weapon_unit:base():weapon_tweak_data().category
					if (weapon_category == "pistol" or weapon_category == "akimbo") and attack_data.attacker_unit:character_damage():consume_messiah_charge() then
						messiah_revive = true
					end
				end
				if messiah_revive then
					attack_data.attacker_unit:character_damage():revive(true)
				end
			end
			self:_check_damage_achievements(attack_data, head)
			if not CopDamage.is_civilian(self._unit:base()._tweak_table) and managers.player:has_category_upgrade("temporary", "overkill_damage_multiplier") then
				local weapon_category = attack_data.weapon_unit:base():weapon_tweak_data().category
				if weapon_category == "shotgun" or weapon_category == "saw" then
					managers.player:activate_temporary_upgrade("temporary", "overkill_damage_multiplier")
				end
			end
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
		elseif attack_data.attacker_unit:in_slot(managers.slot:get_mask("criminals_no_deployables")) then
			self:_AI_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
		elseif attack_data.attacker_unit:base().sentry_gun and Network:is_server() then
			local server_info = attack_data.weapon_unit:base():server_information()
			if server_info and server_info.owner_peer_id ~= managers.network:session():local_peer():id() then
				local owner_peer = managers.network:session():peer(server_info.owner_peer_id)
				if owner_peer then
					owner_peer:send_queued_sync("sync_player_kill_statistic", data.name, data.head_shot and true or false, data.weapon_unit, data.variant)
				end
			else
				data.attacker_state = managers.player:current_state()
				managers.statistics:killed(data)
			end
		end
	end
	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local attacker = attack_data.attacker_unit
	if attacker:id() == -1 then
		attacker = self._unit
	end
	if alive(attack_data.weapon_unit) and attack_data.weapon_unit:base() and attack_data.weapon_unit:base().add_damage_result then
		attack_data.weapon_unit:base():add_damage_result(self._unit, attacker, result.type == "death", damage_percent)
	end
	self:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	self:_on_damage_received(attack_data)
	return result
end
function CopDamage:_check_damage_achievements(attack_data, head)
	local attack_weapon = attack_data.weapon_unit
	if alive(attack_weapon) and attack_weapon:base() and attack_weapon:base().weapon_tweak_data and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
		if managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.pump_action.mask and attack_weapon:base():weapon_tweak_data().category == "shotgun" then
			managers.achievment:award_progress(tweak_data.achievement.pump_action.stat)
		end
		local unit_type = self._unit:base()._tweak_table
		local unit_weapon = self._unit:base()._default_weapon_id
		local unit_anim = self._unit.anim_data and self._unit:anim_data()
		local achievements = tweak_data.achievement.enemy_kill_achievements or {}
		local current_mask_id = managers.blackmarket:equipped_mask().mask_id
		local weapons_pass, weapon_pass, fire_mode_pass, ammo_pass, enemy_pass, enemy_weapon_pass, mask_pass, hiding_pass, head_pass, steelsight_pass, distance_pass, zipline_pass, rope_pass, one_shot_pass, weapon_type_pass, level_pass, part_pass, parts_pass, timer_pass, cop_pass, gangster_pass, civilian_pass, all_pass, memory
		local is_cop = CopDamage.is_cop(self._unit:base()._tweak_table)
		for achievement, achievement_data in pairs(achievements) do
			weapon_type_pass = not achievement_data.weapon_type or attack_weapon:base():weapon_tweak_data().category == achievement_data.weapon_type
			weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, attack_weapon:base().name_id)
			weapon_pass = not achievement_data.weapon or attack_weapon:base().name_id == achievement_data.weapon
			fire_mode_pass = not achievement_data.fire_mode or attack_weapon:base():fire_mode() == achievement_data.fire_mode
			ammo_pass = not achievement_data.total_ammo or attack_weapon:base():get_ammo_total() == achievement_data.total_ammo
			one_shot_pass = not achievement_data.one_shot or attack_data.damage == self._HEALTH_INIT
			enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
			enemy_weapon_pass = not achievement_data.enemy_weapon or unit_weapon == achievement_data.enemy_weapon
			mask_pass = not achievement_data.mask or current_mask_id == achievement_data.mask
			hiding_pass = not achievement_data.hiding or unit_anim and unit_anim.hide
			head_pass = not achievement_data.in_head or head
			distance_pass = not achievement_data.distance or attack_data.col_ray and attack_data.col_ray.distance and attack_data.col_ray.distance >= achievement_data.distance
			zipline_pass = not achievement_data.on_zipline or attack_data.attacker_unit and attack_data.attacker_unit:movement():zipline_unit()
			rope_pass = not achievement_data.on_rope or self._unit:movement() and self._unit:movement():rope_unit()
			if achievement_data.level_id then
				level_pass = (managers.job:current_level_id() or "") == achievement_data.level_id
			end
			steelsight_pass = achievement_data.in_steelsight == nil or attack_data.attacker_unit and attack_data.attacker_unit:movement() and not not attack_data.attacker_unit:movement():current_state():in_steelsight() == not not achievement_data.in_steelsight
			cop_pass = not achievement_data.is_cop or is_cop
			part_pass = not achievement_data.part_id or attack_weapon:base():has_part(achievement_data.part_id)
			parts_pass = not achievement_data.parts
			if achievement_data.parts then
				for _, part_id in ipairs(achievement_data.parts) do
					if attack_weapon:base():has_part(part_id) then
						parts_pass = true
					else
					end
				end
			end
			all_pass = weapon_type_pass and weapons_pass and weapon_pass and fire_mode_pass and ammo_pass and one_shot_pass and enemy_pass and enemy_weapon_pass and mask_pass and hiding_pass and head_pass and distance_pass and zipline_pass and rope_pass and level_pass and part_pass and steelsight_pass and cop_pass
			timer_pass = not achievement_data.timer
			if all_pass and achievement_data.timer then
				memory = managers.job:get_memory(achievement)
				local t = TimerManager:game():time()
				if memory then
					table.insert(memory, t)
					for i = #memory, 1, -1 do
						if t - memory[i] >= achievement_data.timer then
							table.remove(memory, i)
						end
					end
					timer_pass = #memory >= achievement_data.count
					managers.job:set_memory(achievement, memory)
				else
					managers.job:set_memory(achievement, {t})
				end
			end
			all_pass = all_pass and timer_pass
			if all_pass then
				if achievement_data.stat then
					managers.achievment:award_progress(achievement_data.stat)
				elseif achievement_data.award then
					managers.achievment:award(achievement_data.award)
				elseif achievement_data.challenge_stat then
					managers.challenge:award_progress(achievement_data.challenge_stat)
				elseif achievement_data.challenge_award then
					managers.challenge:award(achievement_data.challenge_award)
				end
			end
		end
		if unit_type == "spooc" then
			local spooc_action = self._unit:movement()._active_actions[1]
			if spooc_action and spooc_action:type() == "spooc" then
				if spooc_action:is_flying_strike() then
					if attack_weapon:base():weapon_tweak_data().category == tweak_data.achievement.in_town_you_are_law.weapon_type then
						managers.achievment:award(tweak_data.achievement.in_town_you_are_law.award)
					end
				elseif not spooc_action:has_striken() and attack_weapon:base().name_id == tweak_data.achievement.dont_push_it.weapon then
					managers.achievment:award(tweak_data.achievement.dont_push_it.award)
				end
			end
		end
	end
end
function CopDamage.is_civilian(type)
	return type == "civilian" or type == "civilian_female" or type == "bank_manager"
end
function CopDamage.is_gangster(type)
	return type == "gangster" or type == "biker_escape" or type == "mobster" or type == "mobster_boss"
end
function CopDamage.is_cop(type)
	return not CopDamage.is_civilian(type) and not CopDamage.is_gangster(type)
end
function CopDamage:_show_death_hint(type)
	if not CopDamage.is_civilian(type) or not self._unit:base().enemy then
	end
end
function CopDamage:_comment_death(unit, type)
	if type == "tank" then
		PlayerStandard.say_line(unit:sound(), "g30x_any")
	elseif type == "spooc" then
		PlayerStandard.say_line(unit:sound(), "g33x_any")
	elseif type == "taser" then
		PlayerStandard.say_line(unit:sound(), "g32x_any")
	elseif type == "shield" then
		PlayerStandard.say_line(unit:sound(), "g31x_any")
	elseif type == "sniper" then
		PlayerStandard.say_line(unit:sound(), "g35x_any")
	end
end
function CopDamage:_AI_comment_death(unit, type)
	if type == "tank" then
		unit:sound():say("g30x_any", true)
	elseif type == "spooc" then
		unit:sound():say("g33x_any", true)
	elseif type == "taser" then
		unit:sound():say("g32x_any", true)
	elseif type == "shield" then
		unit:sound():say("g31x_any", true)
	elseif type == "sniper" then
		unit:sound():say("g35x_any", true)
	end
end
function CopDamage:damage_fire(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	local result
	local damage = attack_data.damage
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		damage = crit_damage
		if attack_data.weapon_unit and attack_data.variant ~= "stun" and not attack_data.is_fire_dot_damage then
			if critical_hit then
				managers.hud:on_crit_confirmed()
			else
				managers.hud:on_hit_confirmed()
			end
		end
	end
	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	if damage >= self._health then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
		self:chk_killshot(attack_data.attacker_unit, attack_data.variant)
	else
		attack_data.damage = damage
		local result_type = attack_data.variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "fire")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			damage = crit_damage
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
		end
	end
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end
	if self._head_body_name and attack_data.variant ~= "stun" then
		head = attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
		local body = self._unit:body(self._head_body_name)
	end
	local attacker = attack_data.attacker_unit
	if not attacker or attacker:id() == -1 then
		attacker = self._unit
	end
	local attacker_unit = attack_data.attacker_unit
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant,
			head_shot = head
		}
		if not attack_data.is_fire_dot_damage then
			managers.statistics:killed_by_anyone(data)
		end
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit:base()._tweak_table)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			if not attack_data.is_fire_dot_damage then
				managers.statistics:killed(data)
			end
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
			self:_check_damage_achievements(attack_data, false)
		end
	end
	if alive(attacker) and attacker:base() and attacker:base().add_damage_result then
		attacker:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	if not attack_data.is_fire_dot_damage then
		local fire_dot_data = attack_data.fire_dot_data
		local flammable
		local char_tweak = tweak_data.character[self._unit:base()._tweak_table]
		if char_tweak.flammable == nil then
			flammable = true
		else
			flammable = char_tweak.flammable
		end
		local distance = 1000
		local hit_loc = attack_data.col_ray.hit_position
		if hit_loc and attacker_unit and attacker_unit.position then
			distance = mvector3.distance(hit_loc, attacker_unit:position())
		end
		local fire_dot_max_distance = 3000
		local fire_dot_trigger_chance = 30
		if fire_dot_data then
			fire_dot_max_distance = tonumber(fire_dot_data.dot_trigger_max_distance)
			fire_dot_trigger_chance = tonumber(fire_dot_data.dot_trigger_chance)
		end
		local start_dot_damage_roll = math.random(1, 100)
		local start_dot_dance_antimation = false
		if flammable and not attack_data.is_fire_dot_damage and distance < fire_dot_max_distance and fire_dot_trigger_chance >= start_dot_damage_roll then
			managers.fire:add_doted_enemy(self._unit, TimerManager:game():time(), attack_data.weapon_unit, fire_dot_data.dot_length, fire_dot_data.dot_damage)
			start_dot_dance_antimation = true
		end
		if fire_dot_data then
			fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
			attack_data.fire_dot_data = fire_dot_data
		end
	else
	end
	self:_send_fire_attack_result(attack_data, attacker, damage_percent, attack_data.is_fire_dot_damage, attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
end
function CopDamage:damage_explosion(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	local result
	local damage = attack_data.damage
	if self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_EXPLOSION)
	end
	damage = damage * (self._char_tweak.damage.explosion_damage_mul or 1)
	damage = damage * (self._marked_dmg_mul or 1)
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		damage = crit_damage
		if attack_data.weapon_unit and attack_data.variant ~= "stun" then
			if critical_hit then
				managers.hud:on_crit_confirmed()
			else
				managers.hud:on_hit_confirmed()
			end
		end
	end
	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	if damage >= self._health then
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
	else
		attack_data.damage = damage
		local result_type = attack_data.variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "explosion")
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local head
	if self._head_body_name and attack_data.variant ~= "stun" then
		head = attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
		local body = self._unit:body(self._head_body_name)
		self:_spawn_head_gadget({
			position = body:position(),
			rotation = body:rotation(),
			dir = -attack_data.col_ray.ray
		})
	end
	local attacker = attack_data.attacker_unit
	if not attacker or attacker:id() == -1 then
		attacker = self._unit
	end
	result.ignite_character = attack_data.ignite_character
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant,
			head_shot = head
		}
		managers.statistics:killed_by_anyone(data)
		local attacker_unit = attack_data.attacker_unit
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		self:chk_killshot(attacker_unit, attack_data.variant)
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit:base()._tweak_table)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
			self:_check_damage_achievements(attack_data, false)
		end
	end
	if alive(attacker) and attacker:base() and attacker:base().add_damage_result then
		attacker:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(attack_data.pos, attack_data.col_ray.ray)
	end
	self:_send_explosion_attack_result(attack_data, attacker, damage_percent, self:_get_attack_variant_index(attack_data.result.variant), attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
	return result
end
function CopDamage:roll_critical_hit(damage)
	local critical_hits = not self._char_tweak.critical_hits and {}
	local critical_hit = false
	local critical_value = (critical_hits.base_chance or 0) + managers.player:critical_hit_chance() * (critical_hits.player_chance_multiplier or 1)
	if critical_value > 0 then
		local critical_roll = math.rand(1)
		critical_hit = critical_value > critical_roll
	end
	if critical_hit then
		local critical_damage_mul = critical_hits.damage_mul or self._char_tweak.headshot_dmg_mul
		if critical_damage_mul then
			damage = damage * critical_damage_mul
		else
			damage = self._health * 10
		end
	end
	return critical_hit, damage
end
function CopDamage:damage_melee(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	local result
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		if tweak_data.achievement.cavity.melee_type == attack_data.name_id and not CopDamage.is_civilian(self._unit:base()._tweak_table) then
			managers.achievment:award(tweak_data.achievement.cavity.award)
		end
	end
	damage = damage * (self._marked_dmg_mul or 1)
	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	end
	local damage_effect = attack_data.damage_effect
	local damage_effect_percent
	damage = math.clamp(damage, self._HEALTH_INIT_PRECENT, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	if damage >= self._health then
		damage_effect_percent = 1
		attack_data.damage = self._health
		result = {
			type = "death",
			variant = attack_data.variant
		}
		self:die(attack_data.variant)
		self:chk_killshot(attack_data.attacker_unit, attack_data.variant)
	else
		attack_data.damage = damage
		damage_effect = math.clamp(damage_effect, self._HEALTH_INIT_PRECENT, self._HEALTH_INIT)
		damage_effect_percent = math.ceil(damage_effect / self._HEALTH_INIT_PRECENT)
		damage_effect_percent = math.clamp(damage_effect_percent, 1, self._HEALTH_GRANULARITY)
		local result_type = attack_data.shield_knock and self._char_tweak.damage.shield_knocked and "shield_knock" or attack_data.variant == "counter_tased" and "counter_tased" or attack_data.variant == "taser_tased" and "taser_tased" or attack_data.variant == "counter_spooc" and "expl_hurt" or self:get_damage_type(damage_effect_percent, "melee") or "fire_hurt"
		result = {
			type = result_type,
			variant = attack_data.variant
		}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local snatch_pager = false
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = head,
			weapon_unit = attack_data.weapon_unit,
			name_id = attack_data.name_id,
			variant = attack_data.variant
		}
		managers.statistics:killed_by_anyone(data)
		if attack_data.attacker_unit == managers.player:player_unit() then
			self:_comment_death(attack_data.attacker_unit, self._unit:base()._tweak_table)
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			local is_civlian = CopDamage.is_civilian(self._unit:base()._tweak_table)
			local is_gangster = CopDamage.is_gangster(self._unit:base()._tweak_table)
			local is_cop = not is_civlian and not is_gangster
			if not is_civlian and managers.groupai:state():whisper_mode() and managers.blackmarket:equipped_mask().mask_id == tweak_data.achievement.cant_hear_you_scream.mask then
				managers.achievment:award_progress(tweak_data.achievement.cant_hear_you_scream.stat)
			end
			mvector3.set(mvec_1, self._unit:position())
			mvector3.subtract(mvec_1, attack_data.attacker_unit:position())
			mvector3.normalize(mvec_1)
			mvector3.set(mvec_2, self._unit:rotation():y())
			local from_behind = mvector3.dot(mvec_1, mvec_2) >= 0
			if tweak_data.blackmarket.melee_weapons[attack_data.name_id] then
				local achievements = tweak_data.achievement.enemy_melee_kill_achievements or {}
				local melee_type = tweak_data.blackmarket.melee_weapons[attack_data.name_id].type
				local enemy_type = self._unit:base()._tweak_table
				local health_ratio = managers.player:player_unit():character_damage():health_ratio() * 100
				local melee_pass, type_pass, enemy_pass, diff_pass, health_pass, level_pass, job_pass, jobs_pass, all_pass, cop_pass, gangster_pass, civilian_pass, stealth_pass, on_fire_pass, behind_pass
				for achievement, achievement_data in pairs(achievements) do
					melee_pass = not achievement_data.melee_id or achievement_data.melee_id == attack_data.name_id
					type_pass = not achievement_data.melee_type or melee_type == achievement_data.melee_type
					enemy_pass = not achievement_data.enemy or enemy_type == achievement_data.enemy
					behind_pass = not achievement_data.from_behind or from_behind
					diff_pass = not achievement_data.difficulty or table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
					health_pass = not achievement_data.health or health_ratio <= achievement_data.health
					if achievement_data.level_id then
						level_pass = (managers.job:current_level_id() or "") == achievement_data.level_id
					end
					job_pass = not achievement_data.job or managers.job:current_real_job_id() == achievement_data.job
					jobs_pass = not achievement_data.jobs or table.contains(achievement_data.jobs, managers.job:current_real_job_id())
					cop_pass = not achievement_data.is_cop or is_cop
					gangster_pass = not achievement_data.is_gangster or is_gangster
					civilian_pass = not achievement_data.is_not_civilian or not is_civlian
					stealth_pass = not achievement_data.is_stealth or managers.groupai:state():whisper_mode()
					on_fire_pass = not achievement_data.is_on_fire or managers.fire:is_set_on_fire(self._unit)
					if achievement_data.enemies then
						enemy_pass = false
						for _, enemy in pairs(achievement_data.enemies) do
							if enemy == enemy_type then
								enemy_pass = true
							else
							end
						end
					end
					all_pass = melee_pass and type_pass and enemy_pass and behind_pass and diff_pass and health_pass and level_pass and job_pass and jobs_pass and cop_pass and gangster_pass and civilian_pass and stealth_pass and on_fire_pass
					if all_pass then
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						elseif achievement_data.award then
							managers.achievment:award(achievement_data.award)
						elseif achievement_data.challenge_stat then
							managers.challenge:award_progress(achievement_data.challenge_stat)
						elseif achievement_data.challenge_award then
							managers.challenge:award(achievement_data.challenge_award)
						end
					end
				end
			end
			if is_cop and Global.game_settings.level_id == "nightclub" and attack_data.name_id and attack_data.name_id == "fists" then
				managers.achievment:award_progress(tweak_data.achievement.final_rule.stat)
			end
			if is_civlian then
				managers.money:civilian_killed()
			elseif managers.player:upgrade_value("player", "melee_kill_snatch_pager_chance", 0) > math.rand(1) then
				snatch_pager = true
				self._unit:unit_data().has_alarm_pager = false
			end
		end
	end
	local hit_offset_height = math.clamp(attack_data.col_ray.position.z - self._unit:movement():m_pos().z, 0, 300)
	local variant
	if result.type == "shield_knock" then
		variant = 1
	elseif result.type == "counter_tased" then
		variant = 2
	elseif result.type == "expl_hurt" then
		variant = 4
	elseif snatch_pager then
		variant = 3
	elseif result.type == "taser_tased" then
		variant = 5
	else
		variant = 0
	end
	self:_send_melee_attack_result(attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant)
	self:_on_damage_received(attack_data)
	return result
end
function CopDamage:damage_mission(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	local result
	local damage_percent = self._HEALTH_GRANULARITY
	attack_data.damage = self._health
	result = {
		type = "death",
		variant = attack_data.variant
	}
	self:die(attack_data.variant)
	attack_data.result = result
	attack_data.attack_dir = self._unit:rotation():y()
	attack_data.pos = self._unit:position()
	if attack_data.attacker_unit == managers.player:local_player() and CopDamage.is_civilian(self._unit:base()._tweak_table) then
		managers.money:civilian_killed()
	end
	self:_send_explosion_attack_result(attack_data, self._unit, damage_percent, self:_get_attack_variant_index("explosion"), attack_data.col_ray and attack_data.col_ray.ray)
	self:_on_damage_received(attack_data)
	return result
end
function CopDamage:get_ranged_attack_autotarget_data_fast()
	return {
		object = self._autotarget_data.fast
	}
end
function CopDamage:get_ranged_attack_autotarget_data(shoot_from_pos, aim_vec)
	local autotarget_data
	autotarget_data = {
		body = self._unit:body("b_spine1")
	}
	local dis = mvector3.distance(shoot_from_pos, self._unit:position())
	if dis > 3500 then
		autotarget_data = {
			body = self._unit:body("b_spine1")
		}
	else
		self._aim_bodies = {}
		table.insert(self._aim_bodies, self._unit:body("b_right_thigh"))
		table.insert(self._aim_bodies, self._unit:body("b_left_thigh"))
		table.insert(self._aim_bodies, self._unit:body("b_head"))
		table.insert(self._aim_bodies, self._unit:body("b_left_lower_arm"))
		table.insert(self._aim_bodies, self._unit:body("b_right_lower_arm"))
		local uncovered_body, best_angle
		for i, body in ipairs(self._aim_bodies) do
			local body_pos = body:center_of_mass()
			local body_vec = body_pos - shoot_from_pos
			local body_angle = body_vec:angle(aim_vec)
			if not best_angle or best_angle > body_angle then
				local aim_ray = World:raycast("ray", shoot_from_pos, body_pos, "sphere_cast_radius", 30, "bundle", 4, "slot_mask", managers.slot:get_mask("melee_equipment"))
				if not aim_ray then
					uncovered_body = body
					best_angle = body_angle
				end
			else
			end
		end
		if uncovered_body then
			autotarget_data = {body = uncovered_body}
		else
			autotarget_data = {
				body = self._unit:body("b_spine1")
			}
		end
	end
	return autotarget_data
end
function CopDamage:get_impact_segment(position)
	local closest_dist_sq, closest_bone
	for _, bone_name in pairs(self._impact_bones) do
		local bone_obj = self._unit:get_object(bone_name)
		local bone_dist_sq = mvector3.distance_sq(position, bone_obj:position())
		if not closest_bone or closest_dist_sq > bone_dist_sq then
			closest_bone = bone_obj
			closest_dist_sq = bone_dist_sq
		end
	end
	print("CopDamage:get_impact_segment(): closest_bone is:", closest_bone and closest_bone:name())
	local parent_bone, child_bone, closest_child
	closest_dist_sq = nil
	for _, bone_obj in ipairs(closest_bone:children()) do
		if self._impact_bones[bone_obj:name():key()] then
			local bone_dist_sq = mvector3.distance_sq(position, bone_obj:position())
			if not closest_dist_sq or closest_dist_sq > bone_dist_sq then
				closest_child = bone_obj
				closest_dist_sq = bone_dist_sq
			end
		end
	end
	print("CopDamage:get_impact_segment(): closest_child is:", closest_child and closest_child:name())
	local bone_obj = closest_bone:parent()
	if bone_obj and self._impact_bones[bone_obj:name():key()] then
		local bone_dist_sq = mvector3.distance_sq(position, bone_obj:position())
		if not closest_dist_sq or closest_dist_sq > bone_dist_sq then
			parent_bone = bone_obj
			child_bone = closest_bone
		end
	end
	if not parent_bone then
		parent_bone = closest_bone
		child_bone = closest_child
	end
	print("CopDamage:get_impact_segment(): parent, child:", parent_bone and parent_bone:name(), child_bone and child_bone:name())
	return parent_bone, child_bone
end
function CopDamage:_spawn_head_gadget(params)
	if not self._head_gear then
		return
	end
	if self._head_gear_object then
		if self._nr_head_gear_objects then
			for i = 1, self._nr_head_gear_objects do
				local head_gear_obj_name = self._head_gear_object .. tostring(i)
				self._unit:get_object(Idstring(head_gear_obj_name)):set_visibility(false)
			end
		else
			self._unit:get_object(Idstring(self._head_gear_object)):set_visibility(false)
		end
		if self._head_gear_decal_mesh then
			local mesh_name_idstr = Idstring(self._head_gear_decal_mesh)
			self._unit:decal_surface(mesh_name_idstr):set_mesh_material(mesh_name_idstr, Idstring("flesh"))
		end
	end
	local unit = World:spawn_unit(Idstring(self._head_gear), params.position, params.rotation)
	if not params.skip_push then
		local dir = math.UP - params.dir / 2
		dir = dir:spread(25)
		local body = unit:body(0)
		body:push_at(body:mass(), dir * math.lerp(300, 650, math.random()), unit:position() + Vector3(math.rand(1), math.rand(1), math.rand(1)))
	end
	self._head_gear = false
end
function CopDamage:dead()
	return self._dead
end
function CopDamage:die(variant)
	self._unit:base():set_slot(self._unit, 17)
	if alive(managers.interaction:active_unit()) then
		managers.interaction:active_unit():interaction():selected()
	end
	self:drop_pickup()
	self._unit:inventory():drop_shield()
	if self._unit:unit_data().mission_element then
		self._unit:unit_data().mission_element:event("death", self._unit)
		if not self._unit:unit_data().alerted_event_called then
			self._unit:unit_data().alerted_event_called = true
			self._unit:unit_data().mission_element:event("alerted", self._unit)
		end
	end
	if self._unit:movement() then
		self._unit:movement():remove_giveaway()
	end
	variant = variant or "bullet"
	self._health = 0
	self._health_ratio = 0
	self._dead = true
	self:set_mover_collision_state(false)
	if self._death_sequence then
		if self._unit:damage() and self._unit:damage():has_sequence(self._death_sequence) then
			self._unit:damage():run_sequence_simple(self._death_sequence)
		else
			debug_pause_unit(self._unit, "[CopDamage:die] does not have death sequence", self._death_sequence, self._unit)
		end
	end
	if self._unit:base():char_tweak().die_sound_event then
		self._unit:sound():play(self._unit:base():char_tweak().die_sound_event, nil, nil)
	end
end
function CopDamage:set_mover_collision_state(state)
	local change_state
	if state then
		if self._mover_collision_state then
			if self._mover_collision_state == -1 then
				self._mover_collision_state = nil
				change_state = true
			else
				self._mover_collision_state = self._mover_collision_state + 1
			end
		end
	elseif self._mover_collision_state then
		self._mover_collision_state = self._mover_collision_state - 1
	else
		self._mover_collision_state = -1
		change_state = true
	end
	if change_state then
		local body = self._unit:body("mover_blocker")
		if body then
			body:set_enabled(state)
		end
	end
end
function CopDamage:anim_clbk_mover_collision_state(unit, state)
	state = state == "true" and true or false
	self:set_mover_collision_state(state)
end
function CopDamage:drop_pickup()
	if self._pickup then
		local tracker = self._unit:movement():nav_tracker()
		local position = tracker:lost() and tracker:field_position() or tracker:position()
		local rotation = self._unit:rotation()
		managers.game_play_central:spawn_pickup({
			name = self._pickup,
			position = position,
			rotation = rotation
		})
	end
end
function CopDamage:sync_damage_bullet(attacker_unit, damage_percent, i_body, hit_offset_height, death)
	if self._dead then
		return
	end
	local body = self._unit:body(i_body)
	local head = self._head_body_name and body and body:name() == self._ids_head_body_name
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	local hit_pos = mvector3.copy(self._unit:movement():m_pos())
	mvector3.set_z(hit_pos, hit_pos.z + hit_offset_height)
	attack_data.pos = hit_pos
	local attack_dir, distance
	if attacker_unit then
		attack_dir = hit_pos - attacker_unit:movement():m_head_pos()
		distance = mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	local shotgun_push, result
	if death then
		if head and damage > math.random(10) then
			self:_spawn_head_gadget({
				position = body:position(),
				rotation = body:rotation(),
				dir = attack_dir
			})
		end
		result = {type = "death", variant = "bullet"}
		self:die(attack_data.variant)
		self:chk_killshot(attacker_unit, attack_data.variant)
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = head,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = attack_data.variant
		}
		if data.weapon_unit then
			managers.statistics:killed_by_anyone(data)
			if data.weapon_unit:base():weapon_tweak_data().is_shotgun and distance and distance < 500 then
				shotgun_push = true
			end
		end
	else
		local result_type = self:get_damage_type(damage_percent, "bullet")
		result = {type = result_type, variant = "bullet"}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.variant = "bullet"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end
	self:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
	self:_on_damage_received(attack_data)
	if shotgun_push then
		managers.game_play_central:do_shotgun_push(self._unit, hit_pos, attack_dir, distance)
	end
end
function CopDamage:chk_killshot(attacker_unit, variant)
	if attacker_unit and attacker_unit == managers.player:player_unit() then
		managers.player:on_killshot(self._unit, variant)
	end
end
function CopDamage:sync_damage_explosion(attacker_unit, damage_percent, i_attack_variant, death, direction)
	if self._dead then
		return
	end
	local variant = CopDamage._ATTACK_VARIANTS[i_attack_variant]
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {variant = variant}
	local result
	if death then
		result = {type = "death", variant = variant}
		self:die(attack_data.variant)
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = false,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = "explosion"
		}
		managers.statistics:killed_by_anyone(data)
	else
		local result_type = variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "explosion")
		result = {type = result_type, variant = variant}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir
	if direction then
		attack_dir = direction
	elseif attacker_unit then
		attack_dir = self._unit:position() - attacker_unit:position()
		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	if self._head_body_name then
		local body = self._unit:body(self._head_body_name)
		self:_spawn_head_gadget({
			position = body:position(),
			rotation = body:rotation(),
			dir = Vector3(),
			skip_push = true
		})
	end
	if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
		managers.hud:on_hit_confirmed()
	end
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = false,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = "explosion"
		}
		local attacker_unit = attack_data.attacker_unit
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		self:chk_killshot(attacker_unit, variant)
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit:base()._tweak_table)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
		end
	end
	if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().add_damage_result then
		attacker_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	if not self._no_blood then
		local hit_pos = mvector3.copy(self._unit:movement():m_pos())
		mvector3.set_z(hit_pos, hit_pos.z + 100)
		managers.game_play_central:sync_play_impact_flesh(hit_pos, attack_dir)
	end
	attack_data.pos = self._unit:position()
	mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
	self:_send_sync_explosion_attack_result(attack_data)
	self:_on_damage_received(attack_data)
end
function CopDamage:sync_damage_fire(attacker_unit, damage_percent, start_dot_dance_antimation, death, direction, weapon_type, weapon_id)
	if self._dead then
		return
	end
	local variant = "fire"
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local is_fire_dot_damage = false
	local attack_data = {variant = variant}
	local result
	if weapon_type then
		local fire_dot
		if weapon_type == CopDamage.WEAPON_TYPE_GRANADE then
			fire_dot = tweak_data.grenades[weapon_id].fire_dot_data
		elseif weapon_type == CopDamage.WEAPON_TYPE_BULLET then
			if tweak_data.weapon.factory.parts[weapon_id].custom_stats then
				fire_dot = tweak_data.weapon.factory.parts[weapon_id].custom_stats.fire_dot_data
			end
		elseif weapon_type == CopDamage.WEAPON_TYPE_FLAMER and tweak_data.weapon[weapon_id].fire_dot_data then
			fire_dot = tweak_data.weapon[weapon_id].fire_dot_data
		end
		attack_data.fire_dot_data = fire_dot
		if attack_data.fire_dot_data then
			attack_data.fire_dot_data.start_dot_dance_antimation = start_dot_dance_antimation
		end
	end
	if death then
		result = {type = "death", variant = variant}
		self:die(attack_data.variant)
		self:chk_killshot(attacker_unit, variant)
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = false,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = "fire"
		}
		managers.statistics:killed_by_anyone(data)
	else
		local result_type = variant == "stun" and "hurt_sick" or self:get_damage_type(damage_percent, "fire")
		result = {type = result_type, variant = variant}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	attack_data.ignite_character = true
	attack_data.is_fire_dot_damage = is_fire_dot_damage
	local attack_dir
	if direction then
		attack_dir = direction
	elseif attacker_unit then
		attack_dir = self._unit:position() - attacker_unit:position()
		mvector3.normalize(attack_dir)
	else
		attack_dir = self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	if self._head_body_name then
		local body = self._unit:body(self._head_body_name)
		self:_spawn_head_gadget({
			position = body:position(),
			rotation = body:rotation(),
			dir = Vector3(),
			skip_push = true
		})
	end
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = false,
			weapon_unit = attacker_unit and attacker_unit:inventory() and attacker_unit:inventory():equipped_unit(),
			variant = "fire"
		}
		local attacker_unit = attack_data.attacker_unit
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit:base()._tweak_table)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
		end
	end
	if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().add_damage_result then
		attacker_unit:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	attack_data.pos = self._unit:position()
	mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
	self:_send_sync_fire_attack_result(attack_data)
	self:_on_damage_received(attack_data)
end
function CopDamage:sync_damage_melee(attacker_unit, damage_percent, damage_effect_percent, i_body, hit_offset_height, variant, death)
	if self._dead then
		return
	end
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	local result
	if death then
		result = {type = "death", variant = "melee"}
		self:die(attack_data.variant)
		self:chk_killshot(attacker_unit, variant)
		local data = {
			name = self._unit:base()._tweak_table,
			head_shot = false,
			variant = "melee"
		}
		managers.statistics:killed_by_anyone(data)
	else
		local result_type = variant == 1 and "shield_knock" or variant == 2 and "counter_tased" or variant == 5 and "taser_tased" or variant == 4 and "expl_hurt" or self:get_damage_type(damage_effect_percent, "bullet") or "fire_hurt"
		result = {type = result_type, variant = "melee"}
		self._health = self._health - damage
		self._health_ratio = self._health / self._HEALTH_INIT
		attack_data.variant = result_type
	end
	attack_data.variant = "melee"
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir
	if attacker_unit then
		attack_dir = self._unit:position() - attacker_unit:position()
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	if variant == 3 then
		self._unit:unit_data().has_alarm_pager = false
	end
	attack_data.pos = self._unit:position()
	mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
	if not self._no_blood then
		managers.game_play_central:sync_play_impact_flesh(self._unit:movement():m_pos() + Vector3(0, 0, hit_offset_height), attack_dir)
	end
	self:_send_sync_melee_attack_result(attack_data, hit_offset_height)
	self:_on_damage_received(attack_data)
end
function CopDamage:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	self._unit:network():send("damage_bullet", attacker, damage_percent, body_index, hit_offset_height, self._dead and true or false)
end
function CopDamage:_send_explosion_attack_result(attack_data, attacker, damage_percent, i_attack_variant, direction)
	self._unit:network():send("damage_explosion_fire", attacker, damage_percent, i_attack_variant, self._dead and true or false, direction)
end
function CopDamage:_send_fire_attack_result(attack_data, attacker, damage_percent, is_fire_dot_damage, direction)
	local weapon_type, weapon_unit
	if attack_data.attacker_unit and attack_data.attacker_unit:base()._grenade_entry == "molotov" then
		weapon_type = CopDamage.WEAPON_TYPE_GRANADE
		weapon_unit = "molotov"
	elseif alive(attack_data.weapon_unit) and attack_data.weapon_unit:base()._name_id ~= nil and tweak_data.weapon[attack_data.weapon_unit:base()._name_id] ~= nil and tweak_data.weapon[attack_data.weapon_unit:base()._name_id].fire_dot_data ~= nil then
		weapon_type = CopDamage.WEAPON_TYPE_FLAMER
		weapon_unit = attack_data.weapon_unit:base()._name_id
	elseif alive(attack_data.weapon_unit) and attack_data.weapon_unit:base()._parts then
		for part_id, part in pairs(attack_data.weapon_unit:base()._parts) do
			if tweak_data.weapon.factory.parts[part_id].custom_stats and tweak_data.weapon.factory.parts[part_id].custom_stats.fire_dot_data then
				weapon_type = CopDamage.WEAPON_TYPE_BULLET
				weapon_unit = part_id
			end
		end
	end
	local start_dot_dance_antimation = attack_data.fire_dot_data and attack_data.fire_dot_data.start_dot_dance_antimation
	self._unit:network():send("damage_fire", attacker, damage_percent, start_dot_dance_antimation, self._dead and true or false, direction, weapon_type, weapon_unit)
end
function CopDamage:_send_melee_attack_result(attack_data, damage_percent, damage_effect_percent, hit_offset_height, variant)
	self._unit:network():send("damage_melee", attack_data.attacker_unit, damage_percent, damage_effect_percent, 1, hit_offset_height, variant, self._dead and true or false)
end
function CopDamage:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
end
function CopDamage:_send_sync_explosion_attack_result(attack_data)
end
function CopDamage:_send_sync_melee_attack_result(attack_data, hit_offset_height)
end
function CopDamage:_send_sync_fire_attack_result(attack_data)
end
function CopDamage:sync_death(damage)
	if self._dead then
		return
	end
end
function CopDamage:_on_damage_received(damage_info)
	self:build_suppression("max", nil)
	self:_call_listeners(damage_info)
	if damage_info.result.type == "death" then
		managers.enemy:on_enemy_died(self._unit, damage_info)
		for c_key, c_data in pairs(managers.groupai:state():all_char_criminals()) do
			if c_data.engaged[self._unit:key()] then
				debug_pause_unit(self._unit:key(), "dead AI engaging player", self._unit, c_data.unit)
			end
		end
	end
	if self._dead and self._unit:movement():attention() then
		debug_pause_unit(self._unit, "[CopDamage:_on_damage_received] dead AI", self._unit, inspect(self._unit:movement():attention()))
	end
	local attacker_unit = damage_info and damage_info.attacker_unit
	if alive(attacker_unit) and attacker_unit:base() and attacker_unit:base().thrower_unit then
		attacker_unit = attacker_unit:base():thrower_unit()
	end
	if attacker_unit == managers.player:player_unit() and damage_info then
		managers.player:on_damage_dealt(self._unit, damage_info)
	end
end
function CopDamage:_call_listeners(damage_info)
	self._listener_holder:call(damage_info.result.type, self._unit, damage_info)
end
function CopDamage:add_listener(key, events, clbk)
	events = events or self._all_event_types
	self._listener_holder:add(key, events, clbk)
end
function CopDamage:remove_listener(key)
	self._listener_holder:remove(key)
end
function CopDamage:set_pickup(pickup)
	self._pickup = pickup
end
function CopDamage:pickup()
	return self._pickup
end
function CopDamage:health_ratio()
	return self._health_ratio
end
function CopDamage:convert_to_criminal(health_multiplier)
	self:set_mover_collision_state(false)
	self._health = self._HEALTH_INIT
	self._health_ratio = 1
	self._damage_reduction_multiplier = health_multiplier
	self._unit:set_slot(16)
end
function CopDamage:set_invulnerable(state)
	if state then
		self._invulnerable = (self._invulnerable or 0) + 1
	elseif self._invulnerable then
		if self._invulnerable == 1 then
			self._invulnerable = nil
		else
			self._invulnerable = self._invulnerable - 1
		end
	end
end
function CopDamage:build_suppression(amount, panic_chance)
	if self._dead or not self._char_tweak.suppression then
		return
	end
	local t = TimerManager:game():time()
	local sup_tweak = self._char_tweak.suppression
	if panic_chance and (panic_chance == -1 or panic_chance > 0 and 0 < sup_tweak.panic_chance_mul and math.random() < panic_chance * sup_tweak.panic_chance_mul) then
		amount = "panic"
	end
	local amount_val
	if amount == "max" or amount == "panic" then
		amount_val = sup_tweak.brown_point or sup_tweak.react_point[2]
	elseif Network:is_server() and self._suppression_hardness_t and t < self._suppression_hardness_t then
		amount_val = amount * 0.5
	else
		amount_val = amount
	end
	if not Network:is_server() then
		local sync_amount
		if amount == "panic" then
			sync_amount = 16
		elseif amount == "max" then
			sync_amount = 15
		else
			local sync_amount_ratio
			if sup_tweak.brown_point then
				if 0 >= sup_tweak.brown_point[2] then
					sync_amount_ratio = 1
				else
					sync_amount_ratio = amount_val / sup_tweak.brown_point[2]
				end
			elseif 0 >= sup_tweak.react_point[2] then
				sync_amount_ratio = 1
			else
				sync_amount_ratio = amount_val / sup_tweak.react_point[2]
			end
			sync_amount = math.clamp(math.ceil(sync_amount_ratio * 15), 1, 15)
		end
		managers.network:session():send_to_host("suppression", self._unit, sync_amount)
		return
	end
	if self._suppression_data then
		self._suppression_data.value = math.min(self._suppression_data.brown_point or self._suppression_data.react_point, self._suppression_data.value + amount_val)
		self._suppression_data.last_build_t = t
		self._suppression_data.decay_t = t + self._suppression_data.duration
		managers.enemy:reschedule_delayed_clbk(self._suppression_data.decay_clbk_id, self._suppression_data.decay_t)
	else
		local duration = math.lerp(sup_tweak.duration[1], sup_tweak.duration[2], math.random())
		local decay_t = t + duration
		self._suppression_data = {
			value = amount_val,
			last_build_t = t,
			decay_t = decay_t,
			duration = duration,
			react_point = sup_tweak.react_point and math.lerp(sup_tweak.react_point[1], sup_tweak.react_point[2], math.random()),
			brown_point = sup_tweak.brown_point and math.lerp(sup_tweak.brown_point[1], sup_tweak.brown_point[2], math.random()),
			decay_clbk_id = "CopDamage_suppression" .. tostring(self._unit:key())
		}
		managers.enemy:add_delayed_clbk(self._suppression_data.decay_clbk_id, callback(self, self, "clbk_suppression_decay"), decay_t)
	end
	if not self._suppression_data.brown_zone and self._suppression_data.brown_point and self._suppression_data.value >= self._suppression_data.brown_point then
		self._suppression_data.brown_zone = true
		self._unit:brain():on_suppressed(amount ~= "panic" or "panic" or true)
	elseif amount == "panic" then
		self._unit:brain():on_suppressed("panic")
	end
	if not self._suppression_data.react_zone and self._suppression_data.react_point and self._suppression_data.value >= self._suppression_data.react_point then
		self._suppression_data.react_zone = true
		self._unit:movement():on_suppressed(amount ~= "panic" or "panic" or true)
	elseif amount == "panic" then
		self._unit:movement():on_suppressed("panic")
	end
end
function CopDamage:clbk_suppression_decay()
	local sup_data = self._suppression_data
	self._suppression_data = nil
	if not alive(self._unit) or self._dead then
		return
	end
	if sup_data.react_zone then
		self._unit:movement():on_suppressed(false)
	end
	if sup_data.brown_zone then
		self._unit:brain():on_suppressed(false)
	end
	self._suppression_hardness_t = TimerManager:game():time() + 30
end
function CopDamage:last_suppression_t()
	return self._suppression_data and self._suppression_data.last_build_t
end
function CopDamage:focus_delay_mul()
	return 1
end
function CopDamage:shoot_pos_mid(m_pos)
	self._spine2_obj:m_position(m_pos)
end
function CopDamage:on_marked_state(state)
	if state then
		self._marked_dmg_mul = self._marked_dmg_mul or tweak_data.upgrades.values.player.marked_enemy_damage_mul
	else
		self._marked_dmg_mul = nil
	end
end
function CopDamage:_get_attack_variant_index(variant)
	for i, test_variant in ipairs(self._ATTACK_VARIANTS) do
		if variant == test_variant then
			return i
		end
	end
	debug_pause("variant not found!", variant, inspect(self._ATTACK_VARIANTS))
	return 1
end
function CopDamage:save(data)
	if self._health ~= self._HEALTH_INIT then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.health = self._health
	end
	if self._invulnerable then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.invulnerable = self._invulnerable
	end
	if self._unit:in_slot(16) then
		data.char_dmg = data.char_dmg or {}
		data.char_dmg.is_converted = true
	end
end
function CopDamage:load(data)
	if not data.char_dmg then
		return
	end
	if data.char_dmg.health then
		self._health = data.char_dmg.health
		self._health_ratio = self._health / self._HEALTH_INIT
	end
	if data.char_dmg.invulnerable then
		self._invulnerable = data.char_dmg.invulnerable
	end
	if data.char_dmg.is_converted then
		self._unit:set_slot(16)
		managers.groupai:state():sync_converted_enemy(self._unit)
		self._unit:contour():add("friendly", false)
	end
end
