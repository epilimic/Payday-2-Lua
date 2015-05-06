LootManager = LootManager or class()
function LootManager:init()
	self:_setup()
end
function LootManager:_setup()
	local distribute = {}
	local saved_secured = {}
	local saved_mandatory_bags = Global.loot_manager and Global.loot_manager.mandatory_bags
	local postponed_small_loot = Global.loot_manager and Global.loot_manager.postponed_small_loot
	if Global.loot_manager and Global.loot_manager.secured then
		saved_secured = deep_clone(Global.loot_manager.secured)
		for _, data in ipairs(Global.loot_manager.secured) do
			if not tweak_data.carry.small_loot[data.carry_id] then
				table.insert(distribute, data)
			end
		end
	end
	Global.loot_manager = {}
	Global.loot_manager.secured = {}
	Global.loot_manager.distribute = distribute
	Global.loot_manager.saved_secured = saved_secured
	Global.loot_manager.mandatory_bags = saved_mandatory_bags or {}
	Global.loot_manager.postponed_small_loot = postponed_small_loot
	self._global = Global.loot_manager
	self._triggers = {}
	self._respawns = {}
end
function LootManager:clear()
	Global.loot_manager = nil
end
function LootManager:reset()
	Global.loot_manager = nil
	self:_setup()
end
function LootManager:on_simulation_ended()
	self._respawns = {}
	self._global.mandatory_bags = {}
end
function LootManager:add_trigger(id, type, amount, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {amount = amount, callback = callback}
end
function LootManager:_check_triggers(type)
	print("LootManager:_check_triggers", type)
	if not self._triggers[type] then
		return
	end
	if type == "amount" then
		local bag_total_value = self:get_real_total_loot_value()
		for id, cb_data in pairs(self._triggers[type]) do
			if type ~= "amount" or bag_total_value >= cb_data.amount then
				cb_data.callback()
			end
		end
	elseif type == "total_amount" then
		local total_value = self:get_real_total_value()
		for id, cb_data in pairs(self._triggers[type]) do
			if total_value >= cb_data.amount then
				cb_data.callback()
			end
		end
	elseif type == "report_only" then
		for id, cb_data in pairs(self._triggers[type]) do
			cb_data.callback()
		end
	end
end
function LootManager:on_retry_job_stage()
	self._global.secured = self._global.saved_secured
end
function LootManager:get_secured()
	return table.remove(self._global.secured, 1)
end
function LootManager:get_secured_random()
	local entry = math.random(#self._global.secured)
	return table.remove(self._global.secured, entry)
end
function LootManager:get_distribute()
	return table.remove(self._global.distribute, 1)
end
function LootManager:get_respawn()
	return table.remove(self._respawns, 1)
end
function LootManager:add_to_respawn(carry_id, multiplier)
	table.insert(self._respawns, {carry_id = carry_id, multiplier = multiplier})
end
function LootManager:on_job_deactivated()
	self:clear()
end
function LootManager:secure(carry_id, multiplier_level, silent)
	if Network:is_server() then
		self:server_secure_loot(carry_id, multiplier_level, silent)
	else
		managers.network:session():send_to_host("server_secure_loot", carry_id, multiplier_level)
	end
end
function LootManager:server_secure_loot(carry_id, multiplier_level, silent)
	managers.network:session():send_to_peers_synched("sync_secure_loot", carry_id, multiplier_level, silent)
	self:sync_secure_loot(carry_id, multiplier_level, silent)
end
function LootManager:sync_secure_loot(carry_id, multiplier_level, silent)
	local multiplier = tweak_data.carry.small_loot[carry_id] and managers.player:upgrade_value_by_level("player", "small_loot_multiplier", multiplier_level, 1) or 1
	table.insert(self._global.secured, {carry_id = carry_id, multiplier = multiplier})
	managers.hud:loot_value_updated()
	self:_check_triggers("amount")
	self:_check_triggers("total_amount")
	if not tweak_data.carry.small_loot[carry_id] then
		self:_check_triggers("report_only")
		if not silent then
			self:_present(carry_id, multiplier)
		end
	else
	end
	self:check_achievements(carry_id, multiplier)
end
function LootManager:check_achievements(carry_id, multiplier)
	local real_total_value = self:get_real_total_value()
	local memory, total_memory_value, all_pass, total_value_pass, jobs_pass, difficulties_pass, total_time_pass
	for achievement, achievement_data in pairs(tweak_data.achievement.loot_cash_achievements or {}) do
		jobs_pass = not achievement_data.jobs or table.contains(achievement_data.jobs, managers.job:current_real_job_id())
		difficulties_pass = not achievement_data.difficulties or table.contains(achievement_data.difficulties, Global.game_settings.difficulty)
		total_time_pass = not achievement_data.total_time or managers.game_play_central and managers.game_play_central:get_heist_timer() <= achievement_data.total_time
		if not achievement_data.timer then
			total_value_pass = not achievement_data.total_value or real_total_value >= achievement_data.total_value
		else
			memory = managers.job:get_memory(achievement, achievement_data.is_shortterm)
			local t = Application:time()
			local new_memory = {
				time = t,
				value = self:get_real_value(carry_id, multiplier)
			}
			if memory then
				table.insert(memory, new_memory)
				for i = #memory, 1, -1 do
					if t - memory[i].time >= achievement_data.timer then
						table.remove(memory, i)
					end
				end
				managers.job:set_memory(achievement, memory, achievement_data.is_shortterm)
			else
				memory = {new_memory}
				managers.job:set_memory(achievement, memory, achievement_data.is_shortterm)
			end
			total_memory_value = 0
			for _, m_data in ipairs(memory) do
				total_memory_value = total_memory_value + m_data.value
			end
			total_value_pass = not achievement_data.total_value or total_memory_value >= achievement_data.total_value
		end
		all_pass = total_value_pass and jobs_pass and difficulties_pass and total_time_pass
		if all_pass then
			if achievement_data.stat then
				managers.achievment:award_progress(achievement_data.stat)
			end
			if achievement_data.award then
				managers.achievment:award(achievement_data.award)
			end
		end
	end
end
function LootManager:secure_small_loot(type, multiplier_level)
	self:secure(type, multiplier_level)
end
function LootManager:show_small_loot_taken_hint(type, multiplier)
	managers.hint:show_hint("grabbed_small_loot", 2, nil, {
		MONEY = managers.experience:cash_string(self:get_real_value(type, multiplier))
	})
end
function LootManager:set_mandatory_bags_data(carry_id, amount)
	self._global.mandatory_bags.carry_id = carry_id
	self._global.mandatory_bags.amount = amount
end
function LootManager:get_mandatory_bags_data()
	return self._global.mandatory_bags
end
function LootManager:check_secured_mandatory_bags()
	if not self._global.mandatory_bags.amount or self._global.mandatory_bags.amount == 0 then
		return true
	end
	local amount = self:get_secured_mandatory_bags_amount()
	print("mandatory amount", amount)
	return amount >= self._global.mandatory_bags.amount
end
function LootManager:get_secured_mandatory_bags_amount(is_vehicle)
	local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
	if mandatory_bags_amount == 0 then
		return 0
	end
	local amount = 0
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] and not tweak_data.carry[data.carry_id].is_vehicle == not is_vehicle and mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
			amount = amount + 1
			mandatory_bags_amount = mandatory_bags_amount - 1
		end
	end
	return amount
end
function LootManager:get_secured_bonus_bags_amount(is_vehicle)
	local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
	local secured_mandatory_bags_amount = self:get_secured_mandatory_bags_amount()
	local amount = 0
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] and not tweak_data.carry[data.carry_id].is_vehicle == not is_vehicle then
			if mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
				mandatory_bags_amount = mandatory_bags_amount - 1
			else
				amount = amount + 1
			end
		end
	end
	return amount
end
function LootManager:get_secured_bonus_bags_value(level_id, is_vehicle)
	local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
	local amount_bags = tweak_data.levels[level_id] and tweak_data.levels[level_id].max_bags or 20
	local value = 0
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] and not tweak_data.carry[data.carry_id].is_vehicle == not is_vehicle then
			if mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
				mandatory_bags_amount = mandatory_bags_amount - 1
			elseif amount_bags > 0 then
				value = value + managers.money:get_bag_value(data.carry_id, data.multiplier)
			end
			amount_bags = amount_bags - 1
		end
	end
	return value
end
function LootManager:get_secured_mandatory_bags_value(is_vehicle)
	local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
	local value = 0
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] and not tweak_data.carry[data.carry_id].is_vehicle == not is_vehicle and mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
			mandatory_bags_amount = mandatory_bags_amount - 1
			value = value + managers.money:get_bag_value(data.carry_id, data.multiplier)
		end
	end
	return value
end
function LootManager:is_bonus_bag(carry_id, is_vehicle)
	if self._global.mandatory_bags.carry_id ~= "none" and carry_id and carry_id ~= self._global.mandatory_bags.carry_id then
		return true
	end
	local mandatory_bags_amount = self._global.mandatory_bags.amount or 0
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] and not tweak_data.carry[data.carry_id].is_vehicle == not is_vehicle then
			if mandatory_bags_amount > 0 and (self._global.mandatory_bags.carry_id == "none" or self._global.mandatory_bags.carry_id == data.carry_id) then
				mandatory_bags_amount = mandatory_bags_amount - 1
			elseif mandatory_bags_amount == 0 then
				return true
			end
		end
	end
	return false
end
function LootManager:get_real_value(carry_id, multiplier)
	local mul_value = 1
	if not tweak_data.carry.small_loot[carry_id] then
		local has_active_job = managers.job:has_active_job()
		local job_stars = has_active_job and managers.job:current_job_stars() or 1
		mul_value = tweak_data:get_value("carry", "value_multiplier", job_stars)
	end
	return managers.money:get_bag_value(carry_id, multiplier) * mul_value
end
function LootManager:get_real_total_value()
	local value = 0
	for _, data in ipairs(self._global.secured) do
		value = value + self:get_real_value(data.carry_id, data.multiplier)
	end
	return value
end
function LootManager:get_real_total_loot_value()
	local value = 0
	local loot_value
	for _, data in ipairs(self._global.secured) do
		if not tweak_data.carry.small_loot[data.carry_id] then
			loot_value = self:get_real_value(data.carry_id, data.multiplier)
			if value + loot_value < tweak_data:get_value("money_manager", "max_small_loot_value") then
				value = value + loot_value
			else
				value = tweak_data:get_value("money_manager", "max_small_loot_value")
			end
		else
		end
	end
	return value
end
function LootManager:get_real_total_small_loot_value()
	local value = 0
	local loot_value
	for _, data in ipairs(self._global.secured) do
		if tweak_data.carry.small_loot[data.carry_id] then
			loot_value = self:get_real_value(data.carry_id, data.multiplier)
			if value + loot_value < tweak_data:get_value("money_manager", "max_small_loot_value") then
				value = value + loot_value
			else
				value = tweak_data:get_value("money_manager", "max_small_loot_value")
			end
		else
		end
	end
	return value
end
function LootManager:set_postponed_small_loot()
	self._global.postponed_small_loot = {}
	for _, data in ipairs(self._global.secured) do
		if tweak_data.carry.small_loot[data.carry_id] then
			table.insert(self._global.postponed_small_loot, deep_clone(data))
		end
	end
end
function LootManager:get_real_total_postponed_small_loot_value()
	if not self._global.postponed_small_loot then
		return 0
	end
	local value = 0
	for _, data in ipairs(self._global.postponed_small_loot) do
		value = value + self:get_real_value(data.carry_id, data.multiplier)
	end
	return value
end
function LootManager:clear_postponed_small_loot()
	self._global.postponed_small_loot = nil
end
function LootManager:total_value_by_carry_id(carry_id)
	local value = 0
	for _, data in ipairs(self._global.secured) do
		if data.carry_id == carry_id then
			value = value + data.value
		end
	end
	return value
end
function LootManager:total_small_loot_value()
	local value = 0
	for _, data in ipairs(self._global.secured) do
		if tweak_data.carry.small_loot[data.carry_id] then
			value = value + data.value
		end
	end
	return value
end
function LootManager:total_value_by_type(type)
	if not tweak_data.carry.types[type] then
		Application:error("Carry type", type, "doesn't exists!")
		return
	end
	local value = 0
	for _, data in ipairs(self._global.secured) do
		if tweak_data.carry[data.carry_id].type == type then
			value = value + data.value
		end
	end
	return value
end
function LootManager:_present(carry_id, multiplier)
	local real_value = 0
	local is_small_loot = not not tweak_data.carry.small_loot[carry_id]
	if is_small_loot then
		real_value = self:get_real_value(carry_id, multiplier)
	else
		real_value = managers.money:get_secured_bonus_bag_value(carry_id, multiplier)
	end
	local carry_data = tweak_data.carry[carry_id]
	local title = managers.localization:text("hud_loot_secured_title")
	local type_text = carry_data.name_id and managers.localization:text(carry_data.name_id)
	local text = managers.localization:text("hud_loot_secured", {
		CARRY_TYPE = type_text,
		AMOUNT = managers.experience:cash_string(real_value)
	})
	local icon
	managers.hud:present_mid_text({
		text = text,
		title = title,
		icon = icon,
		time = 4,
		event = "stinger_objectivecomplete"
	})
end
function LootManager:sync_save(data)
	data.LootManager = self._global
end
function LootManager:sync_load(data)
	self._global = data.LootManager
	for _, data in ipairs(self._global.secured) do
		if data.multiplier and data.multiplier > 2 then
			data.multiplier = 2
		end
	end
end
