if not LootDropManager then
	LootDropManager = class()
end
LootDropManager.init = function(self)
	self:_setup()
end

LootDropManager._setup = function(self)
	self:add_qlvl_to_weapon_mods()
	if not Global.lootdrop_manager then
		Global.lootdrop_manager = {}
		self:_setup_items()
	end
	self._global = Global.lootdrop_manager
end

LootDropManager.add_qlvl_to_weapon_mods = function(self, override_tweak_data)
	if not override_tweak_data then
		local weapon_mods_tweak_data = tweak_data.blackmarket.weapon_mods
	end
	do
		local weapons_data = {}
		for weapon_id,data in pairs(Global.blackmarket_manager.weapons) do
			weapons_data[data.factory_id] = data.level
		end
		for part_id,data in pairs(tweak_data.weapon.factory.parts) do
			if not managers.weapon_factory:get_weapons_uses_part(part_id) then
				local weapon_uses_part = {}
			end
			local min_level = managers.experience:level_cap()
			for _,factory_id in ipairs(weapon_uses_part) do
				if not weapons_data[factory_id] then
					min_level = math.min(min_level, table.contains(tweak_data.weapon.factory[factory_id].default_blueprint, part_id) or 0)
				end
				weapon_mods_tweak_data[part_id].qlvl = min_level
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 59 
end

LootDropManager._setup_items = function(self)
	local pc_items = {}
	Global.lootdrop_manager.pc_items = pc_items
	local sort_pc = function(type, data)
		-- upvalues: pc_items
		for id,item_data in pairs(data) do
			if not item_data.dlcs then
				local dlcs = {}
			end
			local dlc = item_data.dlc
			if dlc then
				table.insert(dlcs, dlc)
			end
			local has_dlc = #dlcs == 0
			for _,dlc in pairs(dlcs) do
				if not has_dlc then
					has_dlc = managers.dlc:is_dlc_unlocked(dlc)
				end
			end
			if has_dlc then
				if item_data.pc then
					if not pc_items[item_data.pc] then
						pc_items[item_data.pc] = {}
					end
					if not pc_items[item_data.pc][type] then
						pc_items[item_data.pc][type] = {}
					end
					table.insert(pc_items[item_data.pc][type], id)
				end
			if item_data.pcs then
				end
				for _,pc in ipairs(item_data.pcs) do
					if not pc_items[pc] then
						pc_items[pc] = {}
					end
					if not pc_items[pc][type] then
						pc_items[pc][type] = {}
					end
					table.insert(pc_items[pc][type], id)
				end
			end
		end
  end
	for type,data in pairs(tweak_data.blackmarket) do
		sort_pc(type, data)
	end
end

LootDropManager.new_debug_drop = function(self, amount, add_to_inventory, stars)
	if not amount then
		amount = 10
	end
	if not add_to_inventory then
		add_to_inventory = false
	end
	local debug_infamous = 0
	local debug_max_pc = 0
	if stars == "random" then
		do return end
	end
	if not stars then
		stars = 5
	end
	self._debug_drop_result = {}
	for i = 1, amount do
		local s = stars == "random" and math.random(10) or stars
		local global_value, category, id, pc = self:_new_make_drop(true, add_to_inventory, s)
		if not self._debug_drop_result[global_value] then
			self._debug_drop_result[global_value] = {}
		end
		if not self._debug_drop_result[global_value][category] then
			self._debug_drop_result[global_value][category] = {}
		end
		self._debug_drop_result[global_value][category][id] = (self._debug_drop_result[global_value][category][id] or 0) + 1
		if global_value == "infamous" then
			debug_infamous = debug_infamous + 1
		end
		if pc == tweak_data.lootdrop.STARS[s].pcs[1] then
			debug_max_pc = debug_max_pc + 1
		end
	end
	if stars ~= "random" then
		Application:debug(debug_max_pc .. " dropped at PC " .. stars, "infamous items dropped: " .. debug_infamous)
	end
	Global.debug_drop_result = self._debug_drop_result
end

LootDropManager.droppable_items = function(self, item_pc, infamous_success, skip_types)
	local plvl = managers.experience:current_level()
	local xp_no_next_lv = managers.experience:next_level_data_points() - managers.experience:next_level_data_current_points()
	local pc_items = self._global.pc_items[item_pc]
	local droppable_items = {}
	do
		local maxed_inventory_items = {}
		for type,items in pairs(pc_items) do
			local type_tweak = tweak_data.blackmarket[type]
			droppable_items[type] = {}
			maxed_inventory_items[type] = {}
			if not skip_types or not skip_types[type] then
				for i,item in ipairs(items) do
					local item_tweak = type_tweak[item]
					local is_infamous = not item_tweak.infamous and ((item_tweak.global_value ~= "infamous" and false))
					local is_dlc = item_tweak.dlcs or item_tweak.dlc or false
					local got_qlvl = item_tweak.qlvl or false
					local fixed_global_value = item_tweak.global_value or false
					local pass_infamous = (is_infamous and infamous_success)
					local pass_dlc = true
					local pass_qlvl = not got_qlvl or got_qlvl <= plvl
					local pass_xp_card = not tweak_data:get_value("experience_manager", "loot_drop_value", item_tweak.value_id) and type ~= "xp" or 0 < xp_no_next_lv
					local global_value = fixed_global_value or "normal"
					if is_infamous then
						global_value = "infamous"
					elseif is_dlc then
						local dlcs = {}
						if item_tweak.dlcs then
							for _,dlc in ipairs(item_tweak.dlcs) do
								table.insert(dlcs, dlc)
							end
						end
						if item_tweak.dlc then
							table.insert(dlcs, item_tweak.dlc)
						end
						local dlc_global_values = {}
						for _,dlc in ipairs(dlcs) do
							if managers.dlc:is_dlc_unlocked(dlc) then
								table.insert(dlc_global_values, dlc)
							end
						end
					if #dlc_global_values > 0 then
						if not fixed_global_value then
							end
							global_value = dlc_global_values[math.random(#dlc_global_values)]
						else
							pass_dlc = false
						end
						local amount_in_inventory = managers.blackmarket:get_item_amount(global_value, type, item, true)
						if pass_infamous and pass_dlc and pass_qlvl and pass_xp_card then
							if not item_tweak.weight then
								local weight = tweak_data.lootdrop.DEFAULT_WEIGHT
							end
							local type_weight_mod_func = tweak_data.lootdrop.type_weight_mod_funcs[type]
							if type_weight_mod_func then
								weight = weight * type_weight_mod_func(global_value, type, item)
							end
							if not item_tweak.got_item_weight_mod and not tweak_data.lootdrop.got_item_weight_mod then
								weight = weight * (amount_in_inventory <= 0 or 0.5)
							end
							if not item_tweak.max_in_inventory or amount_in_inventory < item_tweak.max_in_inventory then
								table.insert(droppable_items[type], {entry = item, global_value = global_value, weight = weight})
							end
						else
							table.insert(maxed_inventory_items[type], {entry = item, global_value = global_value, weight = weight})
						end
					end
				end
				if #droppable_items[type] == 0 then
					droppable_items[type] = nil
				end
			end
			return droppable_items, maxed_inventory_items
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 154 
end

LootDropManager.infamous_chance = function(self, setup_data)
	local infamous_diff = 1
	do
		if not managers.job:current_difficulty_stars() then
			local difficulty_stars = setup_data and setup_data.disable_difficulty or 0
		end
		infamous_diff = tweak_data.lootdrop.risk_infamous_multiplier[difficulty_stars] or 1
	end
	local chance = tweak_data.lootdrop.global_values.infamous.chance
	local multiplier = managers.player:upgrade_value("player", "passive_loot_drop_multiplier", 1) * managers.player:upgrade_value("player", "loot_drop_multiplier", 1) * (infamous_diff) * (setup_data and setup_data.increase_infamous or 1)
	if managers.experience:current_rank() > 0 then
		for infamy,item in pairs(tweak_data.infamy.items) do
			if managers.infamy:owned(infamy) and item.upgrades and item.upgrades.infamous_lootdrop then
				multiplier = multiplier * item.upgrades.infamous_lootdrop
			end
		end
	end
	return chance * (multiplier), chance, multiplier
end

LootDropManager.new_make_drop = function(self, return_data, setup_data)
	if type(return_data) ~= "table" or not return_data then
		return_data = {}
	end
	self:_new_make_drop(false, true, nil, return_data, setup_data)
end

LootDropManager._new_make_drop = function(self, debug, add_to_inventory, debug_stars, return_data, setup_data)
	local plvl = managers.experience:current_level()
	local pstars = managers.experience:level_to_stars()
	local stars = debug_stars or pstars
	local pc = stars * 10
	if not debug then
		print("Player level", plvl)
		print("Player stars", pstars)
		print("Stars", stars)
		print("Pay class", pc)
		print("Difficulty stars", managers.job:current_difficulty_stars() or 0)
	end
	if not return_data then
		return_data = {}
	end
	return_data.job_stars = stars
	return_data.total_stars = stars
	return_data.player_level = plvl
	return_data.player_stars = pstars
	return_data.payclass = pc
	local pcs = tweak_data.lootdrop.STARS[stars].pcs
	local chance_curve = tweak_data.lootdrop.STARS_CURVES[stars]
	local start_chance = tweak_data.lootdrop.PC_CHANCE[stars]
	local no_pcs, item_pc = nil, nil
	if setup_data and setup_data.max_pcs then
		no_pcs = setup_data.max_pcs
	else
		no_pcs = #pcs
	end
	for i = 1, no_pcs do
		local chance = no_pcs > 1 and math.lerp(start_chance, 1, math.pow((i - 1) / (no_pcs - 1), chance_curve)) or 1
		if not debug then
			print("chance for", i, pcs[i], "is", chance)
		end
		local roll = math.rand(1)
		if not debug then
			print(" roll,", roll)
		end
		if roll <= chance then
			if not debug then
				print(" got it at", i, pcs[i])
			end
			item_pc = pcs[i]
			return_data.item_payclass = item_pc
			do break end
		end
	end
	local infamous_chance, infamous_base_chance, infamous_base_multiplier = self:infamous_chance(setup_data)
	local infamous_roll = math.rand(1)
	local infamous_success = infamous_roll < infamous_chance
	if not debug then
		print("infamous_success", infamous_success, "infamous_roll", infamous_roll, "infamous_chance", infamous_chance, "infamous_base_chance", infamous_base_chance, "infamous_base_multiplier", infamous_base_multiplier)
	end
	if setup_data then
		local droppable_items, maxed_inventory_items = self:droppable_items(item_pc, infamous_success, setup_data.skip_types)
	end
	local weighted_type_chance = {}
	local sum = 0
	for type,items in pairs(droppable_items) do
		weighted_type_chance[type] = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[pc][type]
		sum = sum + weighted_type_chance[type]
		if not debug then
			print("added", type, weighted_type_chance[type], "to sum", sum)
		end
	end
	if setup_data and setup_data.preferred_type and setup_data.preferred_chance then
		local increase = setup_data.preferred_chance * (sum)
		weighted_type_chance[setup_data.preferred_type] = (weighted_type_chance[setup_data.preferred_type] or 0) + increase
		sum = sum + increase
	end
	if not debug then
		print("sum", sum)
	end
	local normalized_chance = {}
	for type,items in pairs(droppable_items) do
		normalized_chance[type] = weighted_type_chance[type] > 0 and weighted_type_chance[type] / (sum) or 0
	end
	if not debug then
		print("normalized_chance: pc", inspect(normalized_chance))
	end
	if not setup_data or not setup_data.preferred_type_drop then
		local pc_type = self:_get_type_items(normalized_chance, debug)
	end
	if not droppable_items[pc_type] then
		local drop_table = maxed_inventory_items[pc_type]
	end
	local global_value, entry = nil, nil
	if drop_table then
		sum = 0
		for index,item_data in ipairs(drop_table) do
			sum = sum + item_data.weight
		end
		normalized_chance = {}
		for index,item_data in ipairs(drop_table) do
			normalized_chance[index] = item_data.weight / (sum)
		end
		if not debug then
			print("normalized_chance: item", inspect(normalized_chance))
		end
		local dropped_index = self:_get_type_items(normalized_chance, debug)
		local dropped_item = drop_table[dropped_index]
		if not debug then
			print("GOT: ", dropped_index, dropped_item.global_value, pc_type, dropped_item.entry)
		end
		if add_to_inventory then
			managers.blackmarket:add_to_inventory(dropped_item.global_value, pc_type, dropped_item.entry)
		end
		global_value = dropped_item.global_value
		entry = dropped_item.entry
	end
	return_data.global_value = global_value
	return_data.type_items = pc_type
	return_data.item_entry = entry
	return global_value, pc_type, entry, pc
end

LootDropManager.debug_drop = function(self, amount, add_to_inventory, stars)
	if not amount then
		amount = 10
	end
	if not add_to_inventory then
		add_to_inventory = false
	end
	local debug_infamous = 0
	local debug_max_pc = 0
	if stars == "random" then
		do return end
	end
	if not stars then
		stars = 5
	end
	self._debug_drop_result = {}
	for i = 1, amount do
		local s = stars == "random" and math.random(10) or stars
		local global_value, category, id, pc = self:_make_drop(true, add_to_inventory, s)
		if not self._debug_drop_result[global_value] then
			self._debug_drop_result[global_value] = {}
		end
		if not self._debug_drop_result[global_value][category] then
			self._debug_drop_result[global_value][category] = {}
		end
		self._debug_drop_result[global_value][category][id] = (self._debug_drop_result[global_value][category][id] or 0) + 1
		if global_value == "infamous" then
			debug_infamous = debug_infamous + 1
		end
		if pc == tweak_data.lootdrop.STARS[s].pcs[1] then
			debug_max_pc = debug_max_pc + 1
		end
	end
	if stars ~= "random" then
		Application:debug(debug_max_pc .. " dropped at PC " .. stars, "infamous items dropped: " .. debug_infamous)
	end
	Global.debug_drop_result = self._debug_drop_result
end

LootDropManager.make_drop = function(self, return_data)
	if type(return_data) ~= "table" or not return_data then
		return_data = {}
	end
	self:_make_drop(false, true, nil, return_data)
end

LootDropManager._make_drop = function(self, debug, add_to_inventory, debug_stars, return_data)
	local human_players = managers.network:session() and managers.network:session():amount_of_alive_players() or 1
	local all_humans = human_players == 4
	local plvl = managers.experience:current_level()
	if not debug_stars then
		local stars = managers.job:current_job_stars()
	end
	if not return_data then
		return_data = {}
	end
	return_data.job_stars = stars
	return_data.player_level = plvl
	local difficulty = Global.game_settings.difficulty or "easy"
	local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(difficulty) or 0) - 2)
	stars = stars + difficulty_id
	local player_stars = math.max(math.ceil(plvl / 10), 1)
	difficulty_id = math.min(difficulty_id, stars - return_data.job_stars)
	if not all_humans or not debug then
		print("Total stars", stars)
	end
	stars = player_stars
	return_data.player_stars = player_stars
	return_data.difficulty_stars = difficulty_id
	return_data.total_stars = stars
	local pc = math.lerp(0, 100, stars / 10)
	return_data.payclass = pc
	if not debug then
		print("Pay class", pc)
	end
	local drop_pc = stars * 10
	local pcs = tweak_data.lootdrop.STARS[stars].pcs
	if math.rand(1) <= tweak_data.lootdrop.joker_chance then
		pcs = deep_clone(pcs)
		for i = 1, #pcs do
			local new_value = pcs[i] + math.random(5) * 10 - 30
			if new_value >= 5 and new_value <= 100 then
				pcs[i] = new_value
			end
		end
		return_data.joker = true
	if not debug then
		end
		Application:debug("JOKER")
	end
	if not debug then
		print("num of pcs", #pcs)
	end
	local chance_risk_mod = tweak_data.lootdrop.risk_pc_multiplier[difficulty_id] or 0
	local chance_curve = tweak_data.lootdrop.STARS_CURVES[stars]
	local start_chance = tweak_data.lootdrop.PC_CHANCE[stars]
	if not debug then
		print("start_chance before skills: ", start_chance)
	end
	local no_pcs = #pcs
	local pc = nil
	for i = 1, no_pcs do
		local chance = math.lerp(start_chance, 1, math.pow((i - 1) / (no_pcs - 1), chance_curve))
		if not debug then
			print("chance for", i, pcs[i], "is", chance)
		end
		local roll = math.rand(1)
		if not debug then
			print(" roll,", roll)
		end
		if roll <= chance then
			if not debug then
				print(" got it at", i, pcs[i])
			end
			pc = pcs[i]
			return_data.item_payclass = pc
			do break end
		end
	end
	if not debug then
		print("Select from pc", pc)
	end
	local pc_items = self._global.pc_items[pc]
	local i_pc_items = {}
	if not debug then
		print(" Random from type:")
	end
	local weighted_type_chance = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[drop_pc]
	local sum = 0
	for type,items in pairs(pc_items) do
		sum = sum + weighted_type_chance[type]
		if not debug then
			print("added", type, weighted_type_chance[type], "to sum", sum)
		end
	end
	if not debug then
		print("sum", sum)
	end
	local normalized_chance = {}
	for type,items in pairs(pc_items) do
		normalized_chance[type] = weighted_type_chance[type] / (sum)
	end
	if not debug then
		print("normalized_chance", inspect(normalized_chance))
	end
	do
		while 1 do
			local has_result = nil
			while 1 do
				while 1 do
					while 1 do
						if not has_result then
							local type_items = self:_get_type_items(normalized_chance, debug)
							if not debug then
								print(" Type result", type_items)
							end
							local items = pc_items[type_items]
							local item_entry = items[math.random(#items)]
							local global_value = "normal"
							local block_item = false
							if not tweak_data.blackmarket[type_items][item_entry].qlvl or tweak_data.blackmarket[type_items][item_entry].qlvl <= plvl then
								local global_value_chance = math.rand(1)
								local quality_mul = managers.player:upgrade_value("player", "passive_loot_drop_multiplier", 1) * managers.player:upgrade_value("player", "loot_drop_multiplier", 1)
								if tweak_data.blackmarket[type_items][item_entry].infamous and global_value_chance < tweak_data.lootdrop.global_values.infamous.chance * quality_mul then
									global_value = "infamous"
								else
									if not tweak_data.blackmarket[type_items][item_entry].dlcs then
										local dlcs = {}
									end
									local dlc = tweak_data.blackmarket[type_items][item_entry].dlc
									if dlc then
										table.insert(dlcs, dlc)
									end
									local dlc_global_values = {}
									for _,dlc in pairs(dlcs) do
										if managers.dlc:is_dlc_unlocked(dlc) then
											table.insert(dlc_global_values, dlc)
										else
											block_item = true
										end
									end
								if #dlc_global_values > 0 then
									end
									global_value = dlc_global_values[math.random(#dlc_global_values)]
									block_item = false
								end
							if block_item and not debug then
								end
								print("Item drop got blocked!", "type_items", type_items, "item_entry", item_entry, "global_value", global_value)
							end
						end
						if tweak_data.blackmarket[type_items][item_entry].max_in_inventory and tweak_data.blackmarket[type_items][item_entry].max_in_inventory <= managers.blackmarket:get_item_amount(global_value, type_items, item_entry, true) and not debug then
							print("Already got max of this item", item_entry)
						end
					end
					if not tweak_data.blackmarket[type_items][item_entry].infamous or global_value == "infamous" then
						has_result = true
						if not debug then
							print("You got", item_entry, "of type", type_items, "with global value", global_value)
						end
						if add_to_inventory then
							if type_items == "cash" then
								managers.blackmarket:add_to_inventory(global_value, type_items, item_entry)
							else
								managers.blackmarket:add_to_inventory(global_value, type_items, item_entry)
							end
							return_data.global_value = global_value
							return_data.type_items = type_items
							return_data.item_entry = item_entry
						end
						if not debug then
							print(inspect(tweak_data.blackmarket[type_items][item_entry]))
						end
						if global_value == "infamous" then
							return global_value, type_items, item_entry, pc
						end
					end
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 495 
end

LootDropManager._get_type_items = function(self, normalized_chance, debug)
	local seed = math.rand(1)
	if not debug then
		print("seed", seed)
	end
	for type,weight in pairs(normalized_chance) do
		seed = seed - weight
		if not debug then
			print("   sub seed", type, weight, seed)
		end
		if seed <= 0 then
			if not debug then
				print("RETURN TYPE", type)
			end
			return type
		end
	end
	return next(normalized_chance)
end

LootDropManager.reset = function(self)
	Global.lootdrop_manager = nil
	self:_setup()
end

LootDropManager.can_drop_weapon_mods = function(self)
	local plvl = managers.experience:current_level()
	local dropable_items = {}
	for item,item_tweak in pairs(tweak_data.blackmarket.weapon_mods) do
		if not item_tweak.infamous then
			local is_infamous = not item_tweak.pc and not item_tweak.pcs or false
		end
		local is_dlc = item_tweak.dlcs or item_tweak.dlc or false
		local got_qlvl = item_tweak.qlvl or false
		local pass_infamous = true
		local pass_dlc = true
		local pass_qlvl = not got_qlvl or got_qlvl <= plvl
		local pass_max_in_inventory = nil
		local global_value = "normal"
		if is_infamous then
			global_value = "infamous"
		elseif is_dlc then
			if not item_tweak.dlcs then
				local dlcs = {}
			end
			if item_tweak.dlc then
				table.insert(dlcs, item_tweak.dlc)
			end
			local dlc_global_values = {}
			for _,dlc in pairs(dlcs) do
				if managers.dlc:is_dlc_unlocked(dlc) then
					table.insert(dlc_global_values, dlc)
				end
			end
			if #dlc_global_values > 0 then
				global_value = dlc_global_values[math.random(#dlc_global_values)]
			end
		else
			pass_dlc = false
		end
		local amount_in_inventory = managers.blackmarket:get_item_amount(global_value, "weapon_mods", item, true)
		pass_max_in_inventory = not item_tweak.max_in_inventory or amount_in_inventory < item_tweak.max_in_inventory
		if pass_infamous and pass_dlc and pass_qlvl and pass_max_in_inventory then
			table.insert(dropable_items, true)
		end
	end
	return #dropable_items > 0
end

LootDropManager.specific_fake_loot_pc = function(self, preferred)
	local to_drop = {masks = 1, weapon_mods = 2, cash = 3, xp = 4, materials = 5, colors = 6, textures = 7}
	return to_drop[preferred] or 1
end

LootDropManager.new_fake_loot_pc = function(self, debug_pc, skip_mods)
	local sum = 0
	local to_drop = {masks = 1, weapon_mods = 2, cash = 3, xp = 4, materials = 5, colors = 6, textures = 7}
	for skip,value in pairs(skip_mods) do
		if value then
			to_drop[skip] = nil
		end
	end
	if not debug_pc then
		local WEIGHTS = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[managers.experience:level_to_stars() * 10]
		for type in pairs(to_drop) do
			sum = sum + WEIGHTS[type]
		end
		do
			local variant = math.random(sum)
			for type,card in pairs(to_drop) do
				variant = variant - WEIGHTS[type]
				if variant <= 0 then
					return card
				end
			end
			return 1
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 28 
end

LootDropManager.debug_check_items = function(self, check_type)
	local t = {}
	for type,data in pairs(tweak_data.blackmarket) do
		if not check_type or type == check_type then
			for id,item_data in pairs(data) do
				print("id", id)
				if not item_data.pc and not item_data.pcs then
					print("Item", id, "of type", type, "hasn't been assigned a pay class")
					table.insert(t, id)
				elseif not item_data.pc and #item_data.pcs == 0 then
					print(id, "of type", type, "has no pay classes")
					table.insert(t, id)
				end
			end
		end
	end
	return t
end

LootDropManager.debug_loot_aquire_method = function(self, type)
	local no_pcs = managers.lootdrop:debug_check_items(type)
	local t = {
ach = {}, 
dlc = {}, 
non = {}}
	for _,id in ipairs(no_pcs) do
		if managers.dlc._achievement_locked_content[type] then
			local ach = managers.dlc._achievement_locked_content[type][id]
		end
		if managers.dlc._dlc_locked_content[type] then
			local dlc = managers.dlc._dlc_locked_content[type][id]
		end
		if ach then
			table.insert(t.ach, {id, ach})
		elseif dlc then
			table.insert(t.dlc, {id, dlc})
		else
			table.insert(t.non, {id})
		end
	end
	for _,data in ipairs(t.ach) do
		print("ach", data[1], data[2])
	end
	for _,data in ipairs(t.dlc) do
		print("dlc", data[1], data[2])
	end
	for _,data in ipairs(t.non) do
		print("non", data[1])
	end
	return t
end

LootDropManager.debug_print_pc_items = function(self, check_type)
	for type,data in pairs(tweak_data.blackmarket) do
		if not check_type or type == check_type then
			for id,item_data in pairs(data) do
				if not item_data.name_id or not managers.localization:text(item_data.name_id) then
					local name = check_type == "weapon_mods" and not item_data.pc and not item_data.pcs or "NO NAME"
				end
				local pcs = "" .. (item_data.pc or "")
				if item_data.pcs then
					for _,pc in ipairs(item_data.pcs) do
						pcs = pcs .. " " .. pc
					end
				end
				local infamous = item_data.infamous and "infamous" or ""
				print(name, id, pcs, infamous)
			end
		end
	end
end

LootDropManager.save = function(self, data)
	data.LootDropManager = self._global
end

LootDropManager.load = function(self, data)
	self._global = data.LootDropManager
end


