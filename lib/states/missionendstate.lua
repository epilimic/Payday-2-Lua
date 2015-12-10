require("lib/states/GameState")
if not MissionEndState then
	MissionEndState = class(GameState)
end
MissionEndState.GUI_ENDSCREEN = Idstring("guis/victoryscreen/stage_endscreen")
MissionEndState.init = function(self, name, game_state_machine, setup)
	GameState.init(self, name, game_state_machine)
	self._type = ""
	self._completion_bonus_done = false
	self._continue_cb = callback(self, self, "_continue")
	self._controller = nil
	self._continue_block_timer = 0
end

MissionEndState.setup_controller = function(self)
	if not self._controller then
		self._controller = managers.controller:create_controller("victoryscreen", managers.controller:get_default_wrapper_index(), false)
		if Network:is_server() then
			self._controller:set_enabled(true)
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 20 
end

MissionEndState.set_controller_enabled = function(self, enabled)
	if self._controller then
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 4 
end

MissionEndState.at_enter = function(self, old_state, params)
	local is_safe_house = not managers.job:current_job_data() or managers.job:current_job_id() == "safehouse"
	managers.platform:set_presence("Mission_end")
	managers.platform:set_rich_presence(is_safe_house or (Global.game_settings.single_player and "SPEnd") or "MPEnd")
	managers.platform:set_playing(false)
	managers.hud:remove_updator("point_of_no_return")
	managers.hud:hide_stats_screen()
	self._continue_block_timer = Application:time() + 1.5
	if Network:is_server() then
		managers.network.matchmake:set_server_joinable(false)
	if self._success then
		end
		for peer_id,data in pairs(managers.player:get_all_synced_carry()) do
			if not tweak_data.carry[data.carry_id].skip_exit_secure then
				managers.loot:secure(data.carry_id, data.multiplier)
			end
			if data.carry_id == "sandwich" then
				managers.mission:call_global_event("equipment_sandwich")
			end
		end
	end
	local player = managers.player:player_unit()
	if player then
		player:camera():remove_sound_listener()
		player:camera():play_redirect(Idstring("idle"))
		player:character_damage():disable_berserker()
	end
	managers.dialog:quit_dialog()
	Application:debug("1 second to managers.mission:pre_destroy()")
	self._mission_destroy_t = Application:time() + 1
	if not self._success then
		managers.job:set_stage_success(false)
	end
	if self._success then
		print("MissionEndState:at_enter", managers.job:on_last_stage())
		managers.job:set_stage_success(true)
	if self._type == "victory" then
		end
		managers.money:on_mission_completed(params.num_winners)
	end
	if SystemInfo:platform() == Idstring("WIN32") and managers.network.account:has_alienware() then
		LightFX:set_lamps(0, 255, 0, 255)
	end
	self._completion_bonus_done = self._completion_bonus_done or false
	self:setup_controller()
	if not self._setup then
		self._setup = true
		managers.hud:load_hud(self.GUI_ENDSCREEN, false, true, false, {}, nil, nil, true)
		managers.menu:open_menu("mission_end_menu", 1)
		self._mission_end_menu = managers.menu:get_menu("mission_end_menu")
	end
	self._old_state = old_state
	managers.menu_component:set_max_lines_game_chat(7)
	managers.hud:set_success_endscreen_hud(self._success, self._server_left)
	managers.hud:show_endscreen_hud()
	self:chk_complete_heist_achievements()
	managers.groupai:state():set_AI_enabled(false)
	local player = managers.player:player_unit()
	if player then
		player:sound():stop()
		player:character_damage():set_invulnerable(true)
		player:character_damage():stop_heartbeat()
		player:base():set_stats_screen_visible(false)
		if player:movement():current_state():shooting() then
			player:movement():current_state()._equipped_unit:base():stop_shooting()
		end
		if player:movement():tased() then
			player:sound():play("tasered_stop")
		end
	if player:movement():current_state()._interupt_action_interact then
		end
		player:movement():current_state():_interupt_action_interact()
	end
	self._sound_listener = SoundDevice:create_listener("lobby_menu")
	self._sound_listener:set_position(Vector3(0, -50000, 0))
	self._sound_listener:activate(true)
	local total_killed = managers.statistics:session_total_killed()
	self._criminals_completed = self._success and params.num_winners or 0
	managers.statistics:stop_session({success = self._success, type = self._type})
	managers.statistics:send_statistics()
	managers.hud:set_statistics_endscreen_hud(self._criminals_completed, self._success)
	if managers.statistics:started_session_from_beginning() then
		local job = nil
		for achievement,achievement_data in pairs(tweak_data.achievement.complete_heist_stats_achievements) do
			if Global.game_settings.difficulty == achievement_data.difficulty then
				local available_jobs = nil
				if achievement_data.contact == "all" then
					available_jobs = {}
					for _,list in pairs(tweak_data.achievement.job_list) do
						for _,job in pairs(list) do
							table.insert(available_jobs, job)
						end
					end
				else
					available_jobs = deep_clone(tweak_data.achievement.job_list[achievement_data.contact])
				end
				for id = #available_jobs, 1, -1 do
					job = available_jobs[id]
					if type(job) == "table" then
						for _,job_id in ipairs(job) do
							if managers.statistics:completed_job(job_id, achievement_data.difficulty) > 0 then
								table.remove(available_jobs, id)
						else
							end
						end
					else
						if managers.statistics:completed_job(job, achievement_data.difficulty) > 0 then
							table.remove(available_jobs, id)
						end
					end
				end
			if table.size(available_jobs) == 0 then
				end
				if achievement_data.stat then
					managers.achievment:award_progress(achievement_data.stat)
				end
			elseif achievement_data.award then
				managers.achievment:award(achievement_data.award)
			elseif achievement_data.challenge_stat then
				managers.challenge:award_progress(achievement_data.challenge_stat)
			elseif achievement_data.challenge_award then
				managers.challenge:award(achievement_data.challenge_award)
			end
		end
	end
	if not self._success or not managers.music:jukebox_menu_track("heistresult") then
		managers.music:post_event(managers.music:jukebox_menu_track("heistlost"))
	end
	local ghost_bonus = 0
	if self._type == "victory" or self._type == "gameover" then
		if not params or params then
			local total_xp_bonus, bonuses = self:_get_xp_dissected(self._success, params.num_winners, params.personal_win)
		end
		self._bonuses = bonuses
		self:completion_bonus_done(total_xp_bonus)
		managers.job:clear_saved_ghost_bonus()
		managers.experience:mission_xp_process(self._success, managers.job:on_last_stage())
		ghost_bonus = managers.job:accumulate_ghost_bonus(ghost_bonus)
	end
	local is_xb1 = SystemInfo:platform() == Idstring("XB1")
	if self._success then
		local gage_assignment_state = managers.gage_assignment:on_mission_completed()
		local hud_ghost_bonus = 0
		if managers.job:on_last_stage() then
			managers.job:check_add_heat_to_jobs()
			managers.job:activate_accumulated_ghost_bonus()
			hud_ghost_bonus = managers.job:get_saved_ghost_bonus()
			if is_xb1 and not is_safe_house then
				XboxLive:write_hero_stat("heists", 1)
			end
		else
			hud_ghost_bonus = ghost_bonus
		end
		managers.hud:set_special_packages_endscreen_hud({ghost_bonus = hud_ghost_bonus, gage_assignment = gage_assignment_state, challenge_completed = managers.challenge:any_challenge_completed()})
	end
	if is_xb1 then
		XboxLive:write_hero_stat("kills", total_killed.count)
		XboxLive:write_hero_stat("time", managers.statistics:get_session_time_seconds())
	end
	if Network:is_server() then
		managers.network:session():set_state("game_end")
	end
end

MissionEndState.is_success = function(self)
	return self._success
end

MissionEndState._get_xp_dissected = function(self, success, num_winners, personal_win)
	return managers.experience:get_xp_dissected(success, num_winners, personal_win)
end

MissionEndState._get_contract_xp = function(self, success)
	local has_active_job = managers.job:has_active_job()
	local job_and_difficulty_stars = has_active_job and managers.job:current_job_and_difficulty_stars() or 1
	local job_stars = has_active_job and managers.job:current_job_stars() or 1
	local difficulty_stars = has_active_job and managers.job:current_difficulty_stars() or 0
	local player_stars = managers.experience:level_to_stars()
	local total_stars = math.min(job_and_difficulty_stars, player_stars + 1)
	if total_stars < job_and_difficulty_stars then
		self._bonuses[5] = true
	end
	local total_difficulty_stars = math.max(0, total_stars - job_stars)
	local xp_multiplier = managers.experience:get_contract_difficulty_multiplier(total_difficulty_stars)
	self._bonuses[1] = difficulty_stars > 0 and difficulty_stars or false
	total_stars = math.min(job_stars, total_stars)
	self._bonuses[3] = has_active_job and managers.job:on_last_stage() or false
	local contract_xp = 0
	if success and has_active_job and managers.job:on_last_stage() then
		contract_xp = contract_xp + managers.experience:get_job_xp_by_stars(total_stars)
	else
		contract_xp = contract_xp + managers.experience:get_stage_xp_by_stars(total_stars)
	end
	contract_xp = contract_xp + (contract_xp) * xp_multiplier
	contract_xp = (contract_xp) * (not success and tweak_data:get_value("experience_manager", "stage_failed_multiplier") or 1)
	if not success then
		self._bonuses[4] = true
	end
	return contract_xp
end

MissionEndState.set_continue_button_text = function(self)
	if self._completion_bonus_done then
		self:_set_continue_button_text()
	end
end

MissionEndState._set_continue_button_text = function(self)
	local text_id = "failed_disconnected_continue"
	local not_clickable = false
	if self._continue_block_timer and Application:time() < self._continue_block_timer then
		text_id = "menu_es_calculating_experience"
		not_clickable = true
	else
		if managers.job:stage_success() and managers.job:on_last_stage() then
			text_id = "menu_victory_goto_payday"
		end
	end
	local continue_button = managers.menu:is_pc_controller() and "[ENTER]" or nil
	local text = utf8.to_upper(managers.localization:text(text_id, {CONTINUE = continue_button}))
	managers.menu_component:set_endscreen_continue_button_text(text, not_clickable)
end

MissionEndState.play_finishing_sound = function(self, success)
	if self._server_left then
		return 
	end
	if managers.groupai:state():bain_state() then
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 14 
end

MissionEndState.completion_bonus_done = function(self, total_xp_bonus)
	self._total_xp_bonus = total_xp_bonus
	self._completion_bonus_done = false
end

MissionEndState.at_exit = function(self, next_state)
	managers.briefing:stop_event(true)
	managers.hud:hide(self.GUI_ENDSCREEN)
	managers.menu_component:hide_game_chat_gui()
	self:_clear_controller()
	if not self._debug_continue and not Application:editor() then
		managers.savefile:save_progress()
		if Network:multiplayer() then
			self:_shut_down_network()
		end
		local player = managers.player:player_unit()
		if player then
			player:camera():remove_sound_listener()
		end
		if self._sound_listener then
			self._sound_listener:delete()
			self._sound_listener = nil
		end
		if next_state:name() ~= "disconnected" then
			self:_load_start_menu(next_state)
		end
	else
		self._debug_continue = nil
		managers.groupai:state():set_AI_enabled(true)
		local player = managers.player:player_unit()
	if player then
		end
		player:character_damage():set_invulnerable(false)
	end
	managers.menu:close_menu("mission_end_menu")
end

MissionEndState._shut_down_network = function(self)
	Network:set_multiplayer(false)
	managers.network:queue_stop_network()
	managers.network.matchmake:destroy_game()
	managers.network.voice_chat:destroy_voice()
end

MissionEndState._load_start_menu = function(self, next_state)
	if next_state:name() == "disconnected" then
		return 
	end
	if managers.dlc:is_trial() then
		Global.open_trial_buy = true
	end
	managers.job:deactivate_current_job()
	setup:load_start_menu()
end

MissionEndState.on_statistics_result = function(self, best_kills_peer_id, best_kills_score, best_special_kills_peer_id, best_special_kills_score, best_accuracy_peer_id, best_accuracy_score, most_downs_peer_id, most_downs_score, total_kills, total_specials_kills, total_head_shots, group_accuracy, group_downs)
	print("on_statistics_result begin")
	if managers.network and managers.network:session() then
		local best_kills_peer = managers.network:session():peer(best_kills_peer_id)
		local best_special_kills_peer = managers.network:session():peer(best_special_kills_peer_id)
		local best_accuracy_peer = managers.network:session():peer(best_accuracy_peer_id)
		local most_downs_peer = managers.network:session():peer(most_downs_peer_id)
		local best_kills = best_kills_peer and best_kills_peer:name() or "N/A"
		local best_special_kills = best_special_kills_peer and best_special_kills_peer:name() or "N/A"
		local best_accuracy = best_accuracy_peer and best_accuracy_peer:name() or "N/A"
		local most_downs = most_downs_peer and most_downs_peer:name() or "N/A"
		local stage_cash_summary_string = nil
		if self._success and managers.job._global.next_interupt_stage then
			local victory_cash_postponed_id = "victory_cash_postponed"
			if tweak_data.levels[managers.job._global.next_interupt_stage].bonus_escape then
				victory_cash_postponed_id = "victory_cash_postponed_bonus"
			end
			stage_cash_summary_string = managers.localization:text(victory_cash_postponed_id)
		elseif self._success then
			local payouts = managers.money:get_payouts()
			local stage_payout = payouts.stage_payout
			local job_payout = payouts.job_payout
			local bag_payout = payouts.bag_payout
			local vehicle_payout = payouts.vehicle_payout
			local small_loot_payout = payouts.small_loot_payout
			local crew_payout = payouts.crew_payout
			local bonus_bags = managers.loot:get_secured_bonus_bags_amount() + managers.loot:get_secured_mandatory_bags_amount()
			local bag_cash = bag_payout
			local vehicle_amount = managers.loot:get_secured_bonus_bags_amount(true) + managers.loot:get_secured_mandatory_bags_amount(true)
			local vehicle_cash = vehicle_payout
			local loose_cash = small_loot_payout or 0
			local cleaner_cost = 0
			local assets_cost = 0
			local current_total_money = managers.money:total()
			if job_payout > 0 then
				local job_string = managers.localization:text("victory_stage_cash_summary_name_job", {stage_cash = managers.experience:cash_string(stage_payout), job_cash = managers.experience:cash_string(job_payout)})
				stage_cash_summary_string = job_string
			else
				local stage_string = managers.localization:text("victory_stage_cash_summary_name", {stage_cash = managers.experience:cash_string(stage_payout)})
				stage_cash_summary_string = stage_string
			end
			if bonus_bags > 0 and bag_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_bags", {bag_cash = managers.experience:cash_string(bag_cash), bag_amount = bonus_bags, bonus_bags = bonus_bags})
			end
			if vehicle_amount and vehicle_payout > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_vehicles", {vehicle_cash = managers.experience:cash_string(vehicle_cash), vehicle_amount = vehicle_amount})
			end
			if self._criminals_completed and crew_payout > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_crew", {winners = tostring(self._criminals_completed), crew_cash = managers.experience:cash_string(crew_payout)})
			end
			if loose_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_loose", {loose_cash = managers.experience:cash_string(loose_cash)})
			end
			stage_cash_summary_string = stage_cash_summary_string .. "\n"
			if cleaner_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_civ_kill", {civ_killed_cash = managers.experience:cash_string(cleaner_cost)}) .. " "
			end
			if assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_assets", {asset_cash = managers.experience:cash_string(assets_cost)}) .. " "
			end
			if cleaner_cost > 0 or assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. "\n"
			end
			stage_cash_summary_string = stage_cash_summary_string .. "\n"
			local offshore_string = managers.localization:text("victory_stage_cash_summary_name_offshore", {offshore = managers.localization:text("hud_offshore_account"), cash = managers.experience:cash_string(managers.money:heist_offshore())})
			local spending_string = managers.localization:text("victory_stage_cash_summary_name_spending", {cash = "##" .. managers.experience:cash_string(managers.money:heist_spending()) .. "##"})
			stage_cash_summary_string = stage_cash_summary_string .. offshore_string .. "\n"
			stage_cash_summary_string = stage_cash_summary_string .. spending_string .. "\n"
		else
			stage_cash_summary_string = managers.localization:text("failed_summary_name")
		end
		self._statistics_data = {best_killer = managers.localization:text("victory_best_killer_name", {PLAYER_NAME = best_kills, SCORE = best_kills_score}), best_special = managers.localization:text("victory_best_special_name", {PLAYER_NAME = best_special_kills, SCORE = best_special_kills_score}), best_accuracy = managers.localization:text("victory_best_accuracy_name", {PLAYER_NAME = best_accuracy, SCORE = best_accuracy_score}), most_downs = managers.localization:text("victory_most_downs_name", {PLAYER_NAME = most_downs, SCORE = most_downs_score}), total_kills = total_kills, total_specials_kills = total_specials_kills, total_head_shots = total_head_shots, group_hit_accuracy = group_accuracy .. "%", group_total_downed = group_downs, stage_cash_summary = stage_cash_summary_string}
	end
	print("on_statistics_result end")
	local level_id, all_pass, total_kill_pass, total_accuracy_pass, total_downed_pass, level_pass, levels_pass, num_players_pass, diff_pass, is_dropin_pass = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
	if not tweak_data.achievement.complete_heist_statistics_achievements then
		for achievement,achievement_data in pairs({}) do
		end
		level_id = managers.job:has_active_job() and managers.job:current_level_id() or ""
		if achievement_data.difficulty then
			diff_pass = table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
			diff_pass = diff_pass
		end
		num_players_pass = not achievement_data.num_players or achievement_data.num_players <= managers.network:session():amount_of_players()
		level_pass = not achievement_data.level_id or achievement_data.level_id == level_id
		if achievement_data.levels then
			levels_pass = table.contains(achievement_data.levels, level_id)
			levels_pass = levels_pass
		end
		total_kill_pass = not achievement_data.total_kills or achievement_data.total_kills <= total_kills
		total_accuracy_pass = not achievement_data.total_accuracy or achievement_data.total_accuracy <= group_accuracy
		total_downed_pass = not achievement_data.total_downs or group_downs <= achievement_data.total_downs
		is_dropin_pass = achievement_data.is_dropin == nil or achievement_data.is_dropin == managers.statistics:is_dropin()
		all_pass = not diff_pass or not num_players_pass or not level_pass or not levels_pass or not total_kill_pass or not total_accuracy_pass or not total_downed_pass or is_dropin_pass
		if all_pass then
			if achievement_data.stat then
				managers.achievment:award_progress(achievement_data.stat)
			end
		elseif achievement_data.award then
			managers.achievment:award(achievement_data.award)
		elseif achievement_data.challenge_stat then
			managers.challenge:award_progress(achievement_data.challenge_stat)
		elseif achievement_data.challenge_award then
			managers.challenge:award(achievement_data.challenge_award)
		else
			Application:debug("[MissionEndState] complete_heist_achievements:", achievement)
		end
	end
end

MissionEndState._continue_blocked = function(self)
	local in_focus = managers.menu:active_menu() == self._mission_end_menu
	if not in_focus then
		return true
	end
	if managers.hud:showing_stats_screen() then
		return true
	end
	if managers.system_menu:is_active() then
		return true
	end
	if not self._completion_bonus_done then
		return true
	end
	if managers.menu_component:input_focus() == 1 then
		return true
	end
	if self._continue_block_timer and Application:time() < self._continue_block_timer then
		return true
	end
	return false
end

MissionEndState._continue = function(self)
	self:continue()
end

MissionEndState.continue = function(self)
	if self:_continue_blocked() then
		return 
	end
	if managers.job:stage_success() and managers.job:on_last_stage() then
		Application:debug(managers.job:stage_success(), managers.job:on_last_stage(), managers.job:is_job_finished())
		self:_clear_controller()
		managers.menu_component:close_stage_endscreen_gui()
		self:gsm():change_state_by_name("ingame_lobby_menu")
	elseif self._old_state then
		self:_clear_controller()
		self:gsm():change_state_by_name("empty")
	else
		Application:error("Trying to continue from victory screen, but I have no state to goto")
	end
end

MissionEndState._clear_controller = function(self)
	if not self._controller then
		return 
	end
	if Network:is_server() then
		self._controller:set_enabled(false)
		self._controller:destroy()
		self._controller = nil
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 10 
end

MissionEndState.debug_continue = function(self)
	if not self._success then
		return 
	end
	if not self._completion_bonus_done then
		return 
	end
	if self._old_state then
		self._debug_continue = true
		self:_clear_controller()
		self:gsm():change_state_by_name(self._old_state:name())
	end
end

MissionEndState.set_completion_bonus_done = function(self, done)
	self._completion_bonus_done = done
	self:_set_continue_button_text()
end

MissionEndState.update = function(self, t, dt)
	managers.hud:update_endscreen_hud(t, dt)
	if self._mission_destroy_t and self._mission_destroy_t <= Application:time() then
		Application:debug("managers.mission:pre_destroy()")
		managers.mission:pre_destroy()
		self._mission_destroy_t = nil
	end
	if self._total_xp_bonus then
		if self._total_xp_bonus >= 0 then
			local level = managers.experience:current_level()
			local data = managers.experience:give_experience(self._total_xp_bonus)
			data.bonuses = self._bonuses
			managers.hud:send_xp_data_endscreen_hud(data, callback(self, self, "set_completion_bonus_done"))
			if SystemInfo:platform() == Idstring("WIN32") and level ~= managers.experience:current_level() then
				managers.statistics:publish_level_to_steam()
			end
		else
			self:set_completion_bonus_done(true)
			self._total_xp_bonus = nil
		end
		if self._continue_block_timer and self._continue_block_timer <= t then
			self._continue_block_timer = nil
			self:_set_continue_button_text()
		end
		do
			local in_focus = managers.menu:active_menu() == self._mission_end_menu
			if in_focus and not self._in_focus then
				self:_set_continue_button_text()
				self._statistics_feeded = nil
			end
			if not self._statistics_feeded and self._statistics_data then
				self._statistics_data.success = self._success
				self._statistics_data.criminals_finished = self._criminals_completed
				managers.menu_component:feed_endscreen_statistics(self._statistics_data)
				self._statistics_feeded = true
			end
			self._in_focus = in_focus
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

MissionEndState.game_ended = function(self)
	return true
end

MissionEndState.on_server_left = function(self)
	IngameCleanState.on_server_left(self)
end

MissionEndState.on_kicked = function(self)
	IngameCleanState.on_kicked(self)
end

MissionEndState.on_disconnected = function(self)
	IngameCleanState.on_disconnected(self)
end

MissionEndState.chk_complete_heist_achievements = function(self)
	local player = managers.player:player_unit()
	local total_killed = managers.statistics:session_total_killed()
	if self._success then
		if not managers.statistics:is_dropin() then
			local jordan_4 = managers.job:get_memory("jordan_4")
			if not managers.game_play_central or not managers.game_play_central:get_heist_timer() then
				local t = not jordan_4 and jordan_4 ~= nil or 0
			end
			local last_jump_t = managers.job:get_memory("last_jump_t", true) or 0
			if last_jump_t and last_jump_t + tweak_data.achievement.complete_heist_achievements.jordan_4.jump_timer < t then
				print("[achievement] Failed Achievement " .. "brooklyn_4")
				managers.job:set_memory("jordan_4", false)
			end
			local ach_data = tweak_data.achievement.close_and_personal
			local session_killed = managers.statistics:session_killed()
			local has_type_stats = (ach_data.kill_type and not not total_killed[ach_data.kill_type])
			if has_type_stats then
				local total_kill_count = total_killed.count
				local total_kill_type_count = total_killed[ach_data.kill_type]
			if total_kill_count == total_kill_type_count then
				end
				local civilians = {"civilian", "civilian_female", "bank_manager"}
				local count = nil
				for i,name in ipairs(civilians) do
					count = session_killed[name]
					if count then
						total_kill_count = total_kill_count - count.count
						total_kill_type_count = total_kill_type_count - (count[ach_data.kill_type] or 0)
					end
				end
			if total_kill_count == total_kill_type_count then
				end
				local count_pass = not ach_data.count or ach_data.count <= total_kill_count
			if count_pass then
				end
				managers.achievment:award(ach_data.award)
			end
			local shotgun_one_o_one = tweak_data.achievement.shotgun_one_o_one
			if shotgun_one_o_one.count <= total_killed.count then
				local session_used_weapons = managers.statistics:session_used_weapons()
				local passed = true
				for _,weapon_id in ipairs(session_used_weapons) do
					if not tweak_data.weapon[weapon_id] or tweak_data.weapon[weapon_id].category ~= "shotgun" then
						passed = false
				else
					end
				end
			if passed then
				end
			if shotgun_one_o_one.accuracy <= managers.statistics:session_hit_accuracy() then
				end
				managers.achievment:award(shotgun_one_o_one.award)
			end
			local mask_pass, diff_pass, no_shots_pass, contract_pass, job_pass, jobs_pass, level_pass, levels_pass, stealth_pass, loud_pass, equipped_pass, job_value_pass, phalanx_vip_alive_pass, used_weapon_category_pass, equipped_team_pass, timer_pass, num_players_pass, pass_skills, killed_by_weapons_pass, killed_by_melee_pass, killed_by_grenade_pass, civilians_killed_pass, complete_job_pass, memory_pass, all_pass, weapon_data, memory, level_id, stage, num_skills = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
			local killed_by_weapons = managers.statistics:session_killed_by_weapons()
			local killed_by_melee = managers.statistics:session_killed_by_melee()
			local killed_by_grenade = managers.statistics:session_killed_by_grenade()
			local civilians_killed = managers.statistics:session_total_civilian_kills()
			local phalanx_vip_alive = false
			if not managers.enemy:all_enemies() then
				for _,enemy in pairs({}) do
				end
				phalanx_vip_alive = not alive(enemy.unit) or enemy.unit:base()._tweak_table == "phalanx_vip"
				if phalanx_vip_alive then
					do return end
				end
			end
			for achievement,achievement_data in pairs(tweak_data.achievement.complete_heist_achievements) do
				level_id = managers.job:has_active_job() and managers.job:current_level_id() or ""
				if achievement_data.difficulty then
					diff_pass = table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
					diff_pass = diff_pass
				end
				mask_pass = not achievement_data.mask or managers.blackmarket:equipped_mask().mask_id == achievement_data.mask
				job_pass = not achievement_data.job or not managers.statistics:started_session_from_beginning() or (not managers.job:on_last_stage() and not achievement_data.need_full_job) or managers.job:current_real_job_id() == achievement_data.job
				if achievement_data.jobs and managers.statistics:started_session_from_beginning() and (managers.job:on_last_stage() or achievement_data.need_full_job) then
					jobs_pass = table.contains(achievement_data.jobs, managers.job:current_real_job_id())
				end
				jobs_pass = jobs_pass
				level_pass = not achievement_data.level_id or achievement_data.level_id == level_id
				if achievement_data.levels then
					levels_pass = table.contains(achievement_data.levels, level_id)
					levels_pass = levels_pass
				end
				contract_pass = not achievement_data.contract or managers.job:current_contact_id() == achievement_data.contract
				if achievement_data.complete_job and managers.statistics:started_session_from_beginning() then
					complete_job_pass = managers.job:on_last_stage()
				end
				complete_job_pass = complete_job_pass
				no_shots_pass = not achievement_data.no_shots or managers.statistics:session_total_shots(achievement_data.no_shots) == 0
				if achievement_data.stealth and managers.groupai then
					stealth_pass = managers.groupai:state():whisper_mode()
				end
				stealth_pass = stealth_pass
				if achievement_data.loud and managers.groupai then
					loud_pass = not managers.groupai:state():whisper_mode()
				end
				loud_pass = loud_pass
				timer_pass = not achievement_data.timer or not managers.game_play_central or managers.game_play_central:get_heist_timer() <= achievement_data.timer
				num_players_pass = not achievement_data.num_players or achievement_data.num_players <= managers.network:session():amount_of_players()
				job_value_pass = not achievement_data.job_value or managers.mission:get_job_value(achievement_data.job_value.key) == achievement_data.job_value.value
				memory_pass = not achievement_data.memory or managers.job:get_memory(achievement, achievement_data.memory.is_shortterm) == achievement_data.memory.value
				if achievement_data.phalanx_vip_alive then
					phalanx_vip_alive_pass = phalanx_vip_alive
					phalanx_vip_alive_pass = phalanx_vip_alive_pass
				end
				used_weapon_category_pass = true
				if achievement_data.used_weapon_category then
					local used_weapons = managers.statistics:session_used_weapons()
				if used_weapons then
					end
					local category = achievement_data.used_weapon_category
					do
						local weapon_tweak = nil
						for _,weapon_id in ipairs(used_weapons) do
							weapon_tweak = tweak_data.weapon[weapon_id]
							if not weapon_tweak or weapon_tweak.category ~= category and (category ~= "pistol" or weapon_tweak.category ~= "akimbo") then
								used_weapon_category_pass = false
							end
					else
						end
					end
				end
				killed_by_weapons_pass = not achievement_data.killed_by_weapons
				if achievement_data.killed_by_weapons == 0 then
					if killed_by_weapons ~= 0 then
						killed_by_weapons_pass = not achievement_data.killed_by_weapons
				else
					end
				end
				killed_by_weapons_pass = achievement_data.killed_by_weapons <= killed_by_weapons
				killed_by_melee_pass = not achievement_data.killed_by_melee
				if achievement_data.killed_by_melee == 0 then
					if killed_by_melee ~= 0 then
						killed_by_melee_pass = not achievement_data.killed_by_melee
				else
					end
				end
				killed_by_melee_pass = achievement_data.killed_by_melee <= killed_by_melee
				killed_by_grenade_pass = not achievement_data.killed_by_grenade
				if achievement_data.killed_by_grenade == 0 then
					if killed_by_grenade ~= 0 then
						killed_by_grenade_pass = not achievement_data.killed_by_grenade
				else
					end
				end
				killed_by_grenade_pass = achievement_data.killed_by_grenade <= killed_by_grenade
				civilians_killed_pass = not achievement_data.civilians_killed
				if achievement_data.civilians_killed == 0 then
					if civilians_killed ~= 0 then
						civilians_killed_pass = not achievement_data.civilians_killed
				else
					end
				end
				civilians_killed_pass = achievement_data.civilians_killed <= civilians_killed
				pass_skills = not achievement_data.num_skills
				if not pass_skills then
					num_skills = 0
					for tree,data in ipairs(tweak_data.skilltree.trees) do
						local points = managers.skilltree:get_tree_progress(tree)
						num_skills = num_skills + points
					end
					pass_skills = num_skills <= achievement_data.num_skills
				end
				if achievement_data.equipped then
					equipped_pass = false
					equipped_pass = equipped_pass
				end
				if achievement_data.equipped then
					for category,data in pairs(achievement_data.equipped) do
						weapon_data = managers.blackmarket:equipped_item(category)
						if (category == "grenades" or category == "armors") and data == weapon_data then
							equipped_pass = true
						elseif data.weapon_id and weapon_data and weapon_data.weapon_id and data.weapon_id == weapon_data.weapon_id then
							equipped_pass = true
						if data.blueprint then
							end
						if weapon_data.blueprint then
							end
							for _,part_or_parts in ipairs(data.blueprint) do
								if type(part_or_parts) == "string" and not table.contains(weapon_data.blueprint, part_or_parts) then
									equipped_pass = false
								end
							else
								for _,part_or_parts in (for generator) do
								end
								local found_one = false
								for _,part_id in ipairs(part_or_parts) do
									if table.contains(weapon_data.blueprint, part_id) then
										found_one = true
								else
									end
								end
								if not found_one then
									equipped_pass = false
							else
								end
							end
						end
					end
					equipped_team_pass = true
					if achievement_data.equipped_team then
						local pass_armor, pass_deployable, pass_mask, pass_melee_weapon, pass_primary, pass_secondary, pass_primaries, pass_secondaries, pass_primary_unmodded, pass_secondary_unmodded, pass_skills, pass_melee_weapons, pass_primary_category, pass_secondary_category, pass_masks, pass_armors, pass_characters = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
						local ad = achievement_data.equipped_team
						do
							local oufit = nil
							for _,peer in pairs(managers.network:session():all_peers()) do
								oufit = peer:blackmarket_outfit()
								pass_deployable = not ad.deployable or ad.deployable == oufit.deployable
								pass_armor = not ad.armor or (ad.armor == oufit.armor and ad.armor == oufit.armor_current)
								if ad.armors and table.contains(ad.armors, oufit.armor) then
									pass_armors = table.contains(ad.armors, oufit.armor_current)
								end
								pass_armors = pass_armors
								pass_mask = not ad.mask or ad.mask == oufit.mask.mask_id
								if ad.masks then
									pass_masks = table.contains(ad.masks, oufit.mask.mask_id)
									pass_masks = pass_masks
								end
								pass_melee_weapon = not ad.melee_weapon or ad.melee_weapon == oufit.melee_weapon
								if ad.melee_weapons then
									pass_melee_weapons = table.contains(ad.melee_weapons, oufit.melee_weapon)
									pass_melee_weapons = pass_melee_weapons
								end
								pass_primary = not ad.primary or ad.primary == oufit.primary.factory_id
								if ad.primaries then
									pass_primaries = table.contains(ad.primaries, oufit.primary.factory_id)
									pass_primaries = pass_primaries
								end
								if ad.primary_unmodded then
									pass_primary_unmodded = managers.weapon_factory:is_weapon_unmodded(oufit.primary.factory_id, oufit.primary.blueprint)
									pass_primary_unmodded = pass_primary_unmodded
								end
								pass_primary_category = not ad.primary_category or ad.primary_category == tweak_data:get_raw_value("weapon", managers.weapon_factory:get_weapon_id_by_factory_id(oufit.primary.factory_id), "category")
								pass_secondary = not ad.secondary or ad.secondary == oufit.secondary.factory_id
								if ad.secondaries then
									pass_secondaries = table.contains(ad.secondaries, oufit.secondary.factory_id)
									pass_secondaries = pass_secondaries
								end
								if ad.secondary_unmodded then
									pass_secondary_unmodded = managers.weapon_factory:is_weapon_unmodded(oufit.secondary.factory_id, oufit.secondary.blueprint)
									pass_secondary_unmodded = pass_secondary_unmodded
								end
								pass_secondary_category = not ad.secondary_category or ad.secondary_category == tweak_data:get_raw_value("weapon", managers.weapon_factory:get_weapon_id_by_factory_id(oufit.secondary.factory_id), "category")
								if ad.characters then
									pass_characters = table.contains(ad.characters, peer:character())
									pass_characters = pass_characters
								end
								pass_skills = not ad.num_skills
								if not pass_skills then
									num_skills = 0
									if not oufit.skills.skills then
										for tree,points in ipairs({0}) do
										end
										num_skills = num_skills + (tonumber(points) or 0)
									end
									pass_skills = num_skills <= ad.num_skills
								end
								if ad.reverse_deployable then
									pass_deployable = not pass_deployable
								end
								if not pass_armor or not pass_armors or not pass_deployable or not pass_mask or not pass_masks or not pass_melee_weapon or not pass_primary or not pass_secondary or not pass_primaries or not pass_secondaries or not pass_primary_unmodded or not pass_secondary_unmodded or not pass_skills or not pass_melee_weapons or not pass_characters or not pass_primary_category or not pass_secondary_category then
									equipped_team_pass = false
								end
						else
							end
						end
					end
					all_pass = not job_pass or not jobs_pass or not level_pass or not levels_pass or not contract_pass or not diff_pass or not mask_pass or not no_shots_pass or not stealth_pass or not loud_pass or not equipped_pass or not equipped_team_pass or not num_players_pass or not pass_skills or not timer_pass or not killed_by_weapons_pass or not killed_by_melee_pass or not killed_by_grenade_pass or not complete_job_pass or not job_value_pass or not memory_pass or not phalanx_vip_alive_pass or used_weapon_category_pass
					if all_pass and achievement_data.need_full_job and managers.job:has_active_job() then
						if not managers.job:interupt_stage() then
							memory = managers.job:get_memory(achievement)
							if not memory then
								memory = {}
								for i = 1, #managers.job:current_job_chain_data() do
									memory[i] = false
								end
							end
							stage = managers.job:current_stage()
							memory[stage] = not not (all_pass)
							managers.job:set_memory(achievement, memory)
							if managers.job:on_last_stage() then
								for stage,passed in pairs(memory) do
									if not passed then
										all_pass = false
									end
							else
								end
							end
						else
							all_pass = false
						end
					else
						if managers.job:on_last_stage() then
							for stage,passed in pairs(memory) do
								if not passed then
									all_pass = false
								end
						else
							end
						end
					else
						all_pass = false
					end
					if all_pass then
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						end
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					elseif achievement_data.challenge_stat then
						managers.challenge:award_progress(achievement_data.challenge_stat)
					elseif achievement_data.challenge_award then
						managers.challenge:award(achievement_data.challenge_award)
					else
						Application:debug("[MissionEndState] complete_heist_achievements:", achievement)
					end
				end
			if managers.blackmarket:check_frog_1(managers.blackmarket) then
				end
			if managers.job:on_last_stage() then
				end
				managers.achievment:award("frog_1")
			end
			local masks_pass, level_pass, job_pass, jobs_pass, difficulty_pass, difficulties_pass, all_pass, memory, level_id, stage = nil, nil, nil, nil, nil, nil, nil, nil, nil, nil
			for achievement,achievement_data in pairs(tweak_data.achievement.four_mask_achievements) do
				level_id = managers.job:has_active_job() and managers.job:current_level_id() or ""
				masks_pass = not not achievement_data.masks
				level_pass = not achievement_data.level_id or achievement_data.level_id == level_id
				job_pass = not achievement_data.job or not managers.statistics:started_session_from_beginning() or not managers.job:on_last_stage() or managers.job:current_real_job_id() == achievement_data.job
				if achievement_data.jobs and managers.statistics:started_session_from_beginning() and managers.job:on_last_stage() then
					jobs_pass = table.contains(achievement_data.jobs, managers.job:current_real_job_id())
				end
				jobs_pass = jobs_pass
				difficulty_pass = not achievement_data.difficulty or Global.game_settings.difficulty == achievement_data.difficulty
				if achievement_data.difficulties then
					difficulties_pass = table.contains(achievement_data.difficulties, Global.game_settings.difficulty)
					difficulties_pass = difficulties_pass
					all_pass = not masks_pass or not level_pass or not job_pass or not jobs_pass or not difficulty_pass or difficulties_pass
					if all_pass then
						local available_masks = deep_clone(achievement_data.masks)
						for _,peer in pairs(managers.network:session():all_peers()) do
							local current_mask = peer:mask_id()
							for id,mask_id in ipairs(available_masks) do
								if current_mask == mask_id then
									table.remove(available_masks, id)
							else
								end
							end
						end
					if #available_masks == 0 then
						end
						if achievement_data.stat then
							managers.achievment:award_progress(achievement_data.stat)
						end
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					elseif achievement_data.challenge_stat then
						managers.challenge:award_progress(achievement_data.challenge_stat)
					elseif achievement_data.challenge_award then
						managers.challenge:award(achievement_data.challenge_award)
					end
				end
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 1311 
end


