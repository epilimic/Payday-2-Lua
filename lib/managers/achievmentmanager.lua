AchievmentManager = AchievmentManager or class()
AchievmentManager.PATH = "gamedata/achievments"
AchievmentManager.FILE_EXTENSION = "achievment"
function AchievmentManager:init()
	self.exp_awards = {
		none = 0,
		a = 500,
		b = 1500,
		c = 5000
	}
	self.script_data = {}
	if SystemInfo:platform() == Idstring("WIN32") then
		AchievmentManager.do_award = AchievmentManager.award_steam
		if not Global.achievment_manager then
			self:_parse_achievments("Steam")
			self.handler = Steam:sa_handler()
			self.handler:initialized_callback(AchievmentManager.fetch_achievments)
			self.handler:init()
			Global.achievment_manager = {
				handler = self.handler,
				achievments = self.achievments
			}
		else
			self.handler = Global.achievment_manager.handler
			self.achievments = Global.achievment_manager.achievments
		end
	elseif SystemInfo:platform() == Idstring("PS3") then
		if not Global.achievment_manager then
			Global.achievment_manager = {
				trophy_requests = {}
			}
		end
		self:_parse_achievments("PSN")
		AchievmentManager.do_award = AchievmentManager.award_psn
	elseif SystemInfo:platform() == Idstring("PS4") then
		if not Global.achievment_manager then
			self:_parse_achievments("PS4")
			Global.achievment_manager = {
				trophy_requests = {},
				achievments = self.achievments
			}
		else
			self.achievments = Global.achievment_manager.achievments
		end
		AchievmentManager.do_award = AchievmentManager.award_psn
	elseif SystemInfo:platform() == Idstring("X360") then
		self:_parse_achievments("X360")
		AchievmentManager.do_award = AchievmentManager.award_x360
	elseif SystemInfo:platform() == Idstring("XB1") then
		if not Global.achievment_manager then
			self:_parse_achievments("XB1")
			Global.achievment_manager = {
				achievments = self.achievments
			}
		else
			self.achievments = Global.achievment_manager.achievments
		end
		AchievmentManager.do_award = AchievmentManager.award_x360
	else
		Application:error("[AchievmentManager:init] Unsupported platform")
	end
end
function AchievmentManager:init_finalize()
	managers.savefile:add_load_sequence_done_callback_handler(callback(self, self, "_load_done"))
end
function AchievmentManager:fetch_trophies()
	if SystemInfo:platform() == Idstring("PS3") or SystemInfo:platform() == Idstring("PS4") then
		Trophies:get_unlockstate(AchievmentManager.unlockstate_result)
	end
end
function AchievmentManager.unlockstate_result(error_str, table)
	if table then
		for i, data in ipairs(table) do
			local psn_id = data.index
			local unlocked = data.unlocked
			if unlocked then
				for id, ach in pairs(managers.achievment.achievments) do
					if ach.id == psn_id then
						ach.awarded = true
					end
				end
			end
		end
	end
	managers.network.account:achievements_fetched()
end
function AchievmentManager.fetch_achievments(error_str)
	print("[AchievmentManager.fetch_achievments]", error_str)
	if error_str == "success" then
		for id, ach in pairs(managers.achievment.achievments) do
			if managers.achievment.handler:has_achievement(ach.id) then
				print("Achievment awarded", ach.id)
				ach.awarded = true
			end
		end
	end
	managers.network.account:achievements_fetched()
end
function AchievmentManager:_load_done()
	if SystemInfo:platform() == Idstring("XB1") then
		print("[AchievmentManager] _load_done()")
		self._is_fetching_achievments = XboxLive:achievements(0, 1000, true, callback(self, self, "_achievments_loaded"))
	end
end
function AchievmentManager:_achievments_loaded(achievment_list)
	print("[AchievmentManager] Achievment loaded: " .. tostring(achievment_list and #achievment_list))
	if not self._is_fetching_achievments then
		print("[AchievmentManager] Achievment loading aborted.")
		return
	end
	for _, achievment in ipairs(achievment_list) do
		if achievment.type == "achieved" then
			for _, achievment2 in pairs(managers.achievment.achievments) do
				if achievment.id == tostring(achievment2.id) then
					print("[AchievmentManager] Awarded by load: " .. tostring(achievment.id))
					achievment2.awarded = true
				else
				end
			end
		end
	end
end
function AchievmentManager:on_user_signout()
	if SystemInfo:platform() == Idstring("XB1") then
		print("[AchievmentManager] on_user_signout()")
		self._is_fetching_achievments = nil
		for id, ach in pairs(managers.achievment.achievments) do
			ach.awarded = false
		end
	end
end
function AchievmentManager:_parse_achievments(platform)
	local list = PackageManager:script_data(self.FILE_EXTENSION:id(), self.PATH:id())
	self.achievments = {}
	for _, ach in ipairs(list) do
		if ach._meta == "achievment" then
			for _, reward in ipairs(ach) do
				if reward._meta == "reward" and (Application:editor() or platform == reward.platform) then
					self.achievments[ach.id] = {
						id = reward.id,
						name = ach.name,
						exp = self.exp_awards[ach.awards_exp],
						awarded = false,
						dlc_loot = reward.dlc_loot or false
					}
				end
			end
		end
	end
end
function AchievmentManager:get_script_data(id)
	return self.script_data[id]
end
function AchievmentManager:set_script_data(id, data)
	self.script_data[id] = data
end
function AchievmentManager:exists(id)
	return self.achievments[id] ~= nil
end
function AchievmentManager:get_info(id)
	return self.achievments[id]
end
function AchievmentManager:total_amount()
	return table.size(self.achievments)
end
function AchievmentManager:total_unlocked()
	local i = 0
	for _, ach in pairs(self.achievments) do
		if ach.awarded then
			i = i + 1
		end
	end
	return i
end
function AchievmentManager:award(id)
	print("[AchievmentManager:award] ", id)
	if not self:exists(id) then
		Application:debug("[AchievmentManager:award] Awarding non-existing achievement", "id", id)
		return
	end
	managers.challenge:on_achievement_awarded(id)
	if self:get_info(id).awarded then
		return
	end
	if id == "christmas_present" then
		managers.network.account._masks.santa = true
	elseif id == "golden_boy" then
		managers.network.account._masks.gold = true
	end
	self:do_award(id)
end
function AchievmentManager:_give_reward(id, skip_exp)
	print("[AchievmentManager:_give_reward] ", id)
	local data = self:get_info(id)
	data.awarded = true
	if data.dlc_loot then
		managers.dlc:on_achievement_award_loot()
	end
end
function AchievmentManager:award_progress(stat, value)
	if Application:editor() then
		return
	end
	print("[AchievmentManager:award_progress]: ", stat .. " increased by " .. tostring(value or 1))
	managers.challenge:on_achievement_progressed(stat)
	if SystemInfo:platform() == Idstring("WIN32") then
		self.handler:achievement_store_callback(AchievmentManager.steam_unlock_result)
	end
	local stats = {}
	stats[stat] = {
		type = "int",
		value = value or 1
	}
	managers.network.account:publish_statistics(stats, true)
end
function AchievmentManager:get_stat(stat)
	if SystemInfo:platform() == Idstring("WIN32") then
		return managers.network.account:get_stat(stat)
	end
	return false
end
function AchievmentManager:award_steam(id)
	Application:debug("[AchievmentManager:award_steam] Awarded Steam achievment", id)
	self.handler:achievement_store_callback(AchievmentManager.steam_unlock_result)
	self.handler:set_achievement(self:get_info(id).id)
	self.handler:store_data()
	if tweak_data.achievement.inventory[id] then
		for category, category_data in pairs(tweak_data.achievement.inventory[id].rewards) do
			for id, entry in pairs(category_data) do
				managers.blackmarket:tradable_achievement(category, entry)
			end
		end
	end
end
function AchievmentManager:clear_steam(id)
	print("[AchievmentManager:clear_steam]", id)
	if not self.handler:initialized() then
		print("[AchievmentManager:clear_steam] Achievments are not initialized. Cannot clear achievment:", id)
		return
	end
	self.handler:clear_achievement(self:get_info(id).id)
	self.handler:store_data()
end
function AchievmentManager:clear_all_steam()
	print("[AchievmentManager:clear_all_steam]")
	if not self.handler:initialized() then
		print("[AchievmentManager:clear_steam] Achievments are not initialized. Cannot clear steam:")
		return
	end
	self.handler:clear_all_stats(true)
	self.handler:store_data()
end
function AchievmentManager.steam_unlock_result(achievment)
	print("[AchievmentManager:steam_unlock_result] Awarded Steam achievment", achievment)
	for id, ach in pairs(managers.achievment.achievments) do
		if ach.id == achievment then
			managers.achievment:_give_reward(id)
			return
		end
	end
end
function AchievmentManager:award_x360(id)
	print("[AchievmentManager:award_x360] Awarded X360 achievment", id)
	local function x360_unlock_result(result)
		print("result", result)
		if result then
			managers.achievment:_give_reward(id)
		end
	end
	XboxLive:award_achievement(managers.user:get_platform_id(), self:get_info(id).id, x360_unlock_result)
end
function AchievmentManager:award_psn(id)
	print("[AchievmentManager:award] Awarded PSN achievment", id, self:get_info(id).id)
	if not self._trophies_installed then
		print("[AchievmentManager:award] Trophies are not installed. Cannot award trophy:", id)
		return
	end
	local request = Trophies:unlock_id(self:get_info(id).id, AchievmentManager.psn_unlock_result)
	Global.achievment_manager.trophy_requests[request] = id
end
function AchievmentManager.psn_unlock_result(request, error_str)
	print("[AchievmentManager:psn_unlock_result] Awarded PSN achievment", request, error_str)
	local id = Global.achievment_manager.trophy_requests[request]
	if error_str == "success" then
		Global.achievment_manager.trophy_requests[request] = nil
		managers.achievment:_give_reward(id)
	end
end
function AchievmentManager:chk_install_trophies()
	if Trophies:is_installed() then
		print("[AchievmentManager:chk_install_trophies] Already installed")
		self._trophies_installed = true
		Trophies:get_unlockstate(self.unlockstate_result)
		self:fetch_trophies()
	elseif managers.dlc:has_full_game() then
		print("[AchievmentManager:chk_install_trophies] Installing")
		Trophies:install(callback(self, self, "clbk_install_trophies"))
	end
end
function AchievmentManager:clbk_install_trophies(result)
	print("[AchievmentManager:clbk_install_trophies]", result)
	if result then
		self._trophies_installed = true
		self:fetch_trophies()
	end
end
