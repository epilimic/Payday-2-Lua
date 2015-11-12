StatisticsManager = StatisticsManager or class()
function StatisticsManager:init()
	self:_setup()
	self:_reset_session()
end
function StatisticsManager:_setup(reset)
	self._defaults = {}
	self._defaults.killed = {
		civilian = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		civilian_female = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		cop = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		fbi = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		fbi_swat = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		fbi_heavy_swat = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		swat = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		heavy_swat = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		city_swat = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		security = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		gensec = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		gangster = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		biker_escape = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		mobster = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		mobster_boss = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		hector_boss = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		hector_boss_no_armor = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		sniper = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		shield = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		spooc = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		taser = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		tank = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		tank_hw = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		tank_green = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		tank_black = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		tank_skull = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		hostage_rescue = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		murkywater = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		phalanx_minion = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		phalanx_vip = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		other = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		},
		total = {
			count = 0,
			head_shots = 0,
			melee = 0,
			explosion = 0,
			tied = 0
		}
	}
	self._defaults.killed_by_melee = {}
	self._defaults.killed_by_weapon = {}
	self._defaults.killed_by_grenade = {}
	self._defaults.shots_by_weapon = {}
	self._defaults.sessions = {count = 0, time = 0}
	self._defaults.sessions.levels = {}
	for _, lvl in ipairs(tweak_data.levels._level_index) do
		self._defaults.sessions.levels[lvl] = {
			started = 0,
			completed = 0,
			quited = 0,
			drop_in = 0,
			from_beginning = 0,
			time = 0
		}
	end
	self._defaults.sessions.jobs = {}
	self._defaults.revives = {npc_count = 0, player_count = 0}
	self._defaults.cameras = {count = 0}
	self._defaults.objectives = {count = 0}
	self._defaults.shots_fired = {total = 0, hits = 0}
	self._defaults.downed = {
		bleed_out = 0,
		fatal = 0,
		incapacitated = 0,
		death = 0
	}
	self._defaults.reloads = {count = 0}
	self._defaults.health = {amount_lost = 0}
	self._defaults.experience = {}
	self._defaults.misc = {}
	self._defaults.play_time = {minutes = 0}
	if not Global.statistics_manager or reset then
		Global.statistics_manager = deep_clone(self._defaults)
		self._global = Global.statistics_manager
		self._global.session = deep_clone(self._defaults)
		self:_calculate_average()
	end
	self._global = self._global or Global.statistics_manager
end
function StatisticsManager:reset()
	self:_setup(true)
end
function StatisticsManager:_reset_session()
	if self._global then
		self._global.session = deep_clone(self._defaults)
	end
end
function StatisticsManager:_write_log_header()
	local file_handle = SystemFS:open(self._data_log_name, "w")
	file_handle:puts(managers.network.account:username())
	file_handle:puts(Network:is_server() and "true" or "false")
end
function StatisticsManager:_flush_log()
	if not self._data_log or #self._data_log == 0 then
		return
	end
	local file_handle = SystemFS:open(self._data_log_name, "a")
	for _, line in ipairs(self._data_log) do
		local type = line[1]
		local time = line[2]
		local pos = line[3]
		if type == 1 then
			file_handle:puts("1 " .. time .. " " .. pos.x .. " " .. pos.y .. " " .. pos.z .. " " .. line[4])
		elseif type == 2 then
			file_handle:puts("2 " .. time .. " " .. pos.x .. " " .. pos.y .. " " .. pos.z .. " " .. line[4] .. " " .. tostring(line[5]))
		elseif type == 3 then
			file_handle:puts("3 " .. time .. " " .. pos.x .. " " .. pos.y .. " " .. pos.z .. " " .. line[4] .. " " .. line[5])
		end
	end
	self._data_log = {}
end
function StatisticsManager:update(t, dt)
	if self._data_log then
		self._log_timer = self._log_timer - dt
		if self._log_timer <= 0 and alive(managers.player:player_unit()) then
			self._log_timer = 0.25
			table.insert(self._data_log, {
				1,
				Application:time(),
				managers.player:player_unit():position(),
				1 / dt
			})
			if Network:is_server() then
				for u_key, u_data in pairs(managers.enemy:all_enemies()) do
					table.insert(self._data_log, {
						2,
						Application:time(),
						u_data.unit:position(),
						1,
						u_key
					})
				end
				for u_key, u_data in pairs(managers.groupai:state()._ai_criminals) do
					table.insert(self._data_log, {
						2,
						Application:time(),
						u_data.unit:position(),
						2,
						u_key
					})
				end
				for u_key, u_data in pairs(managers.enemy:all_civilians()) do
					table.insert(self._data_log, {
						2,
						Application:time(),
						u_data.unit:position(),
						3,
						u_key
					})
				end
			end
			if #self._data_log > 5000 then
				self:_flush_log()
			end
		end
	end
end
function StatisticsManager:start_session(data)
	if self._session_started then
		return
	end
	if Global.level_data.level_id and self._global.sessions.levels[Global.level_data.level_id] then
		self._global.sessions.levels[Global.level_data.level_id].started = self._global.sessions.levels[Global.level_data.level_id].started + 1
		self._global.sessions.levels[Global.level_data.level_id].from_beginning = self._global.sessions.levels[Global.level_data.level_id].from_beginning + (Global.statistics_manager.playing_from_start and 1 or 0)
		self._global.sessions.levels[Global.level_data.level_id].drop_in = self._global.sessions.levels[Global.level_data.level_id].drop_in + (Global.statistics_manager.playing_from_start and 0 or 1)
	end
	local job_id = managers.job:current_job_id()
	if managers.job:on_first_stage() then
		local job_stat = tostring(job_id) .. "_" .. tostring(Global.game_settings.difficulty)
		if Global.statistics_manager.playing_from_start then
			self._global.sessions.jobs[job_stat .. "_started"] = (self._global.sessions.jobs[job_stat .. "_started"] or 0) + 1
		else
			self._global.sessions.jobs[job_stat .. "_started_dropin"] = (self._global.sessions.jobs[job_stat .. "_started_dropin"] or 0) + 1
		end
	end
	self._global.session = deep_clone(self._defaults)
	self._global.sessions.count = self._global.sessions.count + 1
	self._start_session_time = Application:time()
	self._start_session_from_beginning = Global.statistics_manager.playing_from_start
	self._start_session_drop_in = data.drop_in
	self._session_started = true
end
function StatisticsManager:get_session_time_seconds()
	local t = Application:time()
	return t - (self._start_session_time or t)
end
function StatisticsManager:stop_session(data)
	if not self._session_started then
		if data and data.quit then
			Global.statistics_manager.playing_from_start = nil
		end
		return
	end
	Application:debug("StatisticsManager:stop_session( data ) level_id: ", Global.level_data.level_id)
	if not self._global.sessions.levels[Global.level_data.level_id] then
		return
	end
	self:_flush_log()
	self._data_log = nil
	self._session_started = nil
	local success = data and data.success
	local session_time = self:get_session_time_seconds()
	if Global.level_data.level_id then
		self._global.sessions.levels[Global.level_data.level_id].time = self._global.sessions.levels[Global.level_data.level_id].time + session_time
		if success then
			self._global.sessions.levels[Global.level_data.level_id].completed = self._global.sessions.levels[Global.level_data.level_id].completed + 1
		else
			self._global.sessions.levels[Global.level_data.level_id].quited = self._global.sessions.levels[Global.level_data.level_id].quited + 1
		end
	end
	local completion
	local job_id = managers.job:current_job_id()
	if job_id and data then
		local job_stat = tostring(job_id) .. "_" .. tostring(Global.game_settings.difficulty)
		if data.type == "victory" then
			if managers.job:on_last_stage() then
				if Global.statistics_manager.playing_from_start then
					self._global.sessions.jobs[job_stat .. "_completed"] = (self._global.sessions.jobs[job_stat .. "_completed"] or 0) + 1
					completion = "win_begin"
				else
					self._global.sessions.jobs[job_stat .. "_completed_dropin"] = (self._global.sessions.jobs[job_stat .. "_completed_dropin"] or 0) + 1
					completion = "win_dropin"
				end
			else
				completion = "done"
			end
		elseif data.type == "gameover" then
			if Global.statistics_manager.playing_from_start then
				self._global.sessions.jobs[job_stat .. "_failed"] = (self._global.sessions.jobs[job_stat .. "_failed"] or 0) + 1
			else
				self._global.sessions.jobs[job_stat .. "_failed_dropin"] = (self._global.sessions.jobs[job_stat .. "_failed_dropin"] or 0) + 1
			end
			completion = "fail"
		end
	end
	self._global.sessions.time = self._global.sessions.time + session_time
	self._global.session.sessions.time = session_time
	self._global.last_session = deep_clone(self._global.session)
	self:_calculate_average()
	if data and (managers.job:on_last_stage() and data.type == "victory" or data.quit) then
		Global.statistics_manager.playing_from_start = nil
	end
	if SystemInfo:platform() == Idstring("WIN32") then
		self:publish_to_steam(self._global.session, success, completion)
	end
end
function StatisticsManager:started_session_from_beginning()
	return self._start_session_from_beginning
end
function StatisticsManager:_increment_misc(name, amount)
	if not self._global.misc then
		self._global.misc = {}
	end
	self._global.misc[name] = (self._global.misc[name] or 0) + amount
	self._global.session.misc[name] = (self._global.session.misc[name] or 0) + amount
	if self._data_log and alive(managers.player:player_unit()) then
		table.insert(self._data_log, {
			3,
			Application:time(),
			managers.player:player_unit():position(),
			name,
			amount
		})
	end
end
function StatisticsManager:use_trip_mine()
	self:_increment_misc("deploy_trip", 1)
end
function StatisticsManager:use_ammo_bag()
	self:_increment_misc("deploy_ammo", 1)
end
function StatisticsManager:use_doctor_bag()
	self:_increment_misc("deploy_medic", 1)
end
function StatisticsManager:use_ecm_jammer()
	self:_increment_misc("deploy_jammer", 1)
end
function StatisticsManager:use_sentry_gun()
	self:_increment_misc("deploy_sentry", 1)
end
function StatisticsManager:use_first_aid()
	self:_increment_misc("deploy_firstaid", 1)
end
function StatisticsManager:use_body_bag()
	self:_increment_misc("deploy_bodybag", 1)
end
function StatisticsManager:use_armor_bag()
	self:_increment_misc("deploy_armorbag", 1)
end
function StatisticsManager:in_custody()
	self:_increment_misc("in_custody", 1)
end
function StatisticsManager:trade(data)
	self:_increment_misc("trade", 1)
end
function StatisticsManager:aquired_money(amount)
	self:_increment_misc("cash", amount * 1000)
end
function StatisticsManager:mission_stats(name)
	self._global.session.mission_stats = self._global.session.mission_stats or {}
	self._global.session.mission_stats[name] = (self._global.session.mission_stats[name] or 0) + 1
end
function StatisticsManager:publish_to_steam(session, success, completion)
	if Application:editor() or not managers.criminals:local_character_name() then
		return
	end
	local max_ranks = 25
	local max_specializations = tweak_data.statistics:statistics_specializations()
	local session_time_seconds = self:get_session_time_seconds()
	local session_time_minutes = session_time_seconds / 60
	local session_time = session_time_minutes / 60
	if session_time_seconds == 0 or session_time_minutes == 0 or session_time == 0 then
		return
	end
	local level_list, job_list, mask_list, weapon_list, melee_list, grenade_list, enemy_list, armor_list, character_list = tweak_data.statistics:statistics_table()
	local stats = self:check_version()
	self._global.play_time.minutes = math.ceil(self._global.play_time.minutes + session_time_minutes)
	local current_time = math.floor(self._global.play_time.minutes / 60)
	local time_found = false
	local play_times = {
		1000,
		500,
		250,
		200,
		150,
		100,
		80,
		40,
		20,
		10,
		0
	}
	for _, play_time in ipairs(play_times) do
		if not time_found and current_time >= play_time then
			stats["player_time_" .. play_time .. "h"] = {
				type = "int",
				method = "set",
				value = 1
			}
			time_found = true
		else
			stats["player_time_" .. play_time .. "h"] = {
				type = "int",
				method = "set",
				value = 0
			}
		end
	end
	local current_level = managers.experience:current_level()
	stats.player_level = {
		type = "int",
		method = "set",
		value = current_level
	}
	for i = 0, 100, 10 do
		stats["player_level_" .. i] = {
			type = "int",
			method = "set",
			value = 0
		}
	end
	local level_range = current_level >= 100 and 100 or math.floor(current_level / 10) * 10
	stats["player_level_" .. level_range] = {
		type = "int",
		method = "set",
		value = 1
	}
	local current_rank = managers.experience:current_rank()
	local current_rank_range = max_ranks < current_rank and max_ranks or current_rank
	for i = 0, max_ranks do
		stats["player_rank_" .. i] = {
			type = "int",
			method = "set",
			value = 0
		}
	end
	stats["player_rank_" .. current_rank_range] = {
		type = "int",
		method = "set",
		value = 1
	}
	for i = 1, max_specializations do
		local specialization = managers.skilltree:get_specialization_value(i)
		if specialization and specialization.tiers and specialization.tiers.current_tier then
			stats["player_specialization_" .. i] = {
				type = "int",
				method = "set",
				value = managers.skilltree:digest_value(specialization.tiers.current_tier)
			}
		end
	end
	local current_cash = managers.money:offshore()
	local cash_found = false
	local cash_amount = 1000000000
	current_cash = current_cash / 1000
	for i = 0, 9 do
		if not cash_found and cash_amount <= current_cash then
			stats["player_cash_" .. cash_amount .. "k"] = {
				type = "int",
				method = "set",
				value = 1
			}
			cash_found = true
		else
			stats["player_cash_" .. cash_amount .. "k"] = {
				type = "int",
				method = "set",
				value = 0
			}
		end
		cash_amount = cash_amount / 10
	end
	stats.player_cash_0k = {
		type = "int",
		method = "set",
		value = cash_found and 0 or 1
	}
	stats.gadget_used_ammo_bag = {
		type = "int",
		value = session.misc.deploy_ammo or 0
	}
	stats.gadget_used_doctor_bag = {
		type = "int",
		value = session.misc.deploy_medic or 0
	}
	stats.gadget_used_trip_mine = {
		type = "int",
		value = session.misc.deploy_trip or 0
	}
	stats.gadget_used_sentry_gun = {
		type = "int",
		value = session.misc.deploy_sentry or 0
	}
	stats.gadget_used_ecm_jammer = {
		type = "int",
		value = session.misc.deploy_jammer or 0
	}
	stats.gadget_used_first_aid = {
		type = "int",
		value = session.misc.deploy_firstaid or 0
	}
	stats.gadget_used_body_bag = {
		type = "int",
		value = session.misc.deploy_bodybag or 0
	}
	stats.gadget_used_armor_bag = {
		type = "int",
		value = session.misc.deploy_armorbag or 0
	}
	if completion then
		for weapon_name, weapon_data in pairs(session.shots_by_weapon) do
			if 0 < weapon_data.total and table.contains(weapon_list, weapon_name) then
				stats["weapon_used_" .. weapon_name] = {type = "int", value = 1}
				stats["weapon_shots_" .. weapon_name] = {
					type = "int",
					value = weapon_data.total
				}
				stats["weapon_hits_" .. weapon_name] = {
					type = "int",
					value = weapon_data.hits
				}
			end
		end
		local melee_name = managers.blackmarket:equipped_melee_weapon()
		if table.contains(melee_list, melee_name) then
			stats["melee_used_" .. melee_name] = {type = "int", value = 1}
		end
		local grenade_name = managers.blackmarket:equipped_grenade()
		if table.contains(grenade_list, grenade_name) then
			stats["grenade_used_" .. grenade_name] = {type = "int", value = 1}
		end
		local mask_id = managers.blackmarket:equipped_mask().mask_id
		if table.contains(mask_list, mask_id) then
			stats["mask_used_" .. mask_id] = {type = "int", value = 1}
		end
		local armor_id = managers.blackmarket:equipped_armor()
		if table.contains(armor_list, armor_id) then
			stats["armor_used_" .. armor_id] = {type = "int", value = 1}
		end
		local character_id = managers.network:session() and managers.network:session():local_peer():character()
		if table.contains(character_list, character_id) then
			stats["character_used_" .. character_id] = {type = "int", value = 1}
		end
		stats["difficulty_" .. Global.game_settings.difficulty] = {type = "int", value = 1}
		local specialization = managers.skilltree:get_specialization_value("current_specialization")
		if specialization >= 0 and max_specializations >= specialization then
			stats["specialization_used_" .. specialization] = {type = "int", value = 1}
		end
	end
	for weapon_name, weapon_data in pairs(session.killed_by_weapon) do
		if 0 < weapon_data.count and table.contains(weapon_list, weapon_name) then
			stats["weapon_kills_" .. weapon_name] = {
				type = "int",
				value = weapon_data.count
			}
		end
	end
	for melee_name, melee_kill in pairs(session.killed_by_melee) do
		if melee_kill > 0 and table.contains(melee_list, melee_name) then
			stats["melee_kills_" .. melee_name] = {type = "int", value = melee_kill}
		end
	end
	for grenade_name, grenade_kill in pairs(session.killed_by_grenade) do
		if grenade_kill > 0 and table.contains(grenade_list, grenade_name) then
			stats["grenade_kills_" .. grenade_name] = {type = "int", value = grenade_kill}
		end
	end
	for enemy_name, enemy_data in pairs(session.killed) do
		if 0 < enemy_data.count and enemy_name ~= "total" and table.contains(enemy_list, enemy_name) then
			stats["enemy_kills_" .. enemy_name] = {
				type = "int",
				value = enemy_data.count
			}
		end
	end
	if completion == "win_begin" then
		if Network:is_server() then
			if Global.game_settings.kick_option == 1 then
				stats.option_decide_host = {type = "int", value = 1}
			elseif Global.game_settings.kick_option == 2 then
				stats.option_decide_vote = {type = "int", value = 1}
			elseif Global.game_settings.kick_option == 0 then
				stats.option_decide_none = {type = "int", value = 1}
			end
			stats.info_playing_win_host = {type = "int", value = 1}
		else
			stats.info_playing_win_client = {type = "int", value = 1}
		end
	elseif completion == "win_dropin" then
		if not Network:is_server() then
			stats.info_playing_win_client_dropin = {type = "int", value = 1}
		end
	elseif completion == "fail" then
		if Network:is_server() then
			stats.info_playing_fail_host = {type = "int", value = 1}
		else
			stats.info_playing_fail_client = {type = "int", value = 1}
		end
	end
	if completion == "win_begin" or completion == "win_dropin" then
		stats.heist_success = {type = "int", value = 1}
	elseif completion == "fail" then
		stats.heist_failed = {type = "int", value = 1}
	end
	stats.info_playing_normal = {
		type = "int",
		method = "set",
		value = 1
	}
	stats.info_playing_beta = {
		type = "int",
		method = "set",
		value = 0
	}
	local level_id = managers.job:current_level_id()
	if completion then
		if table.contains(level_list, level_id) then
			stats["level_" .. level_id] = {type = "int", value = 1}
		end
		if level_id == "election_day_2" then
			local stealth = managers.groupai and managers.groupai:state():whisper_mode()
			print("[StatisticsManager]: Election Day 2 Voting: " .. (stealth and "Swing Vote" or "Delayed Vote"))
			stats["stats_election_day_" .. (stealth and "s" or "n")] = {type = "int", value = 1}
		end
	end
	local job_id = managers.job:current_job_id()
	if table.contains(job_list, job_id) then
		stats["job_" .. job_id] = {type = "int", value = 1}
		if completion == "win_begin" then
			stats["contract_" .. job_id .. "_win"] = {type = "int", value = 1}
		elseif completion == "win_dropin" then
			stats["contract_" .. job_id .. "_win_dropin"] = {type = "int", value = 1}
		elseif completion == "fail" then
			stats["contract_" .. job_id .. "_fail"] = {type = "int", value = 1}
		end
	end
	if session.mission_stats then
		for name, count in pairs(session.mission_stats) do
			print("Mission Statistics: mission_" .. name, count)
			stats["mission_" .. name] = {type = "int", value = count}
		end
	end
	managers.network.account:publish_statistics(stats)
end
function StatisticsManager:publish_level_to_steam()
	if Application:editor() then
		return
	end
	local max_ranks = 25
	local stats = {}
	local current_level = managers.experience:current_level()
	stats.player_level = {
		type = "int",
		method = "set",
		value = current_level
	}
	for i = 0, 100, 10 do
		stats["player_level_" .. i] = {
			type = "int",
			method = "set",
			value = 0
		}
	end
	local level_range = current_level >= 100 and 100 or math.floor(current_level / 10) * 10
	stats["player_level_" .. level_range] = {
		type = "int",
		method = "set",
		value = 1
	}
	local current_rank = managers.experience:current_rank()
	local current_rank_range = max_ranks < current_rank and max_ranks or current_rank
	for i = 0, max_ranks do
		stats["player_rank_" .. i] = {
			type = "int",
			method = "set",
			value = 0
		}
	end
	stats["player_rank_" .. current_rank_range] = {
		type = "int",
		method = "set",
		value = 1
	}
	managers.network.account:publish_statistics(stats)
end
function StatisticsManager:_table_contains(list, item)
	for index, name in pairs(list) do
		if name == item then
			return index
		end
	end
end
function StatisticsManager:publish_equipped_to_steam()
	if Application:editor() then
		return
	end
	local stats = {}
	local level_list, job_list, mask_list, weapon_list, melee_list, grenade_list, enemy_list, armor_list, character_list, deployable_list = tweak_data.statistics:statistics_table()
	local mask_name = managers.blackmarket:equipped_mask().mask_id
	local mask_index = self:_table_contains(mask_list, mask_name)
	if mask_index then
		stats.equipped_mask = {
			type = "int",
			method = "set",
			value = mask_index
		}
	end
	local primary_name = managers.blackmarket:equipped_primary().weapon_id
	local primary_index = self:_table_contains(weapon_list, primary_name)
	if primary_index then
		stats.equipped_primary = {
			type = "int",
			method = "set",
			value = primary_index
		}
	end
	local secondary_name = managers.blackmarket:equipped_secondary().weapon_id
	local secondary_index = self:_table_contains(weapon_list, secondary_name)
	if secondary_index then
		stats.equipped_secondary = {
			type = "int",
			method = "set",
			value = secondary_index
		}
	end
	local melee_name = managers.blackmarket:equipped_melee_weapon()
	local melee_index = self:_table_contains(melee_list, melee_name)
	if melee_index then
		stats.equipped_melee = {
			type = "int",
			method = "set",
			value = melee_index
		}
	end
	local grenade_name = managers.blackmarket:equipped_grenade()
	local grenade_index = self:_table_contains(grenade_list, grenade_name)
	if grenade_index then
		stats.equipped_grenade = {
			type = "int",
			method = "set",
			value = grenade_index
		}
	end
	local armor_name = managers.blackmarket:equipped_armor()
	local armor_index = self:_table_contains(armor_list, armor_name)
	if armor_index then
		stats.equipped_armor = {
			type = "int",
			method = "set",
			value = armor_index
		}
	end
	local character_name = managers.blackmarket:get_preferred_character()
	local character_index = self:_table_contains(character_list, character_name)
	if character_index then
		stats.equipped_character = {
			type = "int",
			method = "set",
			value = character_index
		}
	end
	local deployable_name = managers.blackmarket:equipped_deployable()
	local deployable_index = self:_table_contains(deployable_list, deployable_name)
	if deployable_index then
		stats.equipped_deployable = {
			type = "int",
			method = "set",
			value = deployable_index
		}
	end
	managers.network.account:publish_statistics(stats)
end
function StatisticsManager:publish_skills_to_steam(skip_version_check)
	if Application:editor() then
		return
	end
	local stats = skip_version_check and {} or self:check_version()
	local skill_amount = {}
	local skill_data = tweak_data.skilltree.skills
	local tree_data = tweak_data.skilltree.trees
	for tree_index, tree in ipairs(tree_data) do
		if tree.statistics ~= false then
			skill_amount[tree_index] = 0
			stats["skill_" .. tree.skill .. "_unlocked"] = {
				type = "int",
				method = "set",
				value = managers.skilltree:tree_unlocked(tree_index) and 1 or 0
			}
			for _, tier in ipairs(tree.tiers) do
				for _, skill in ipairs(tier) do
					if skill_data[skill].statistics ~= false then
						local skill_points = managers.skilltree:next_skill_step(skill)
						local skill_bought = skill_points > 1 and 1 or 0
						local skill_aced = skill_points > 2 and 1 or 0
						stats["skill_" .. tree.skill .. "_" .. skill] = {
							type = "int",
							method = "set",
							value = skill_bought
						}
						stats["skill_" .. tree.skill .. "_" .. skill .. "_ace"] = {
							type = "int",
							method = "set",
							value = skill_aced
						}
						skill_amount[tree_index] = skill_amount[tree_index] + skill_bought + skill_aced
					end
				end
			end
		end
	end
	for tree_index, tree in ipairs(tree_data) do
		if tree.statistics ~= false then
			stats["skill_" .. tree.skill] = {
				type = "int",
				method = "set",
				value = skill_amount[tree_index]
			}
			for i = 0, 35, 5 do
				stats["skill_" .. tree.skill .. "_" .. i] = {
					type = "int",
					method = "set",
					value = 0
				}
			end
			local skill_count = math.ceil(skill_amount[tree_index] / 5) * 5
			if skill_count > 35 then
				skill_count = 35
			end
			stats["skill_" .. tree.skill .. "_" .. skill_count] = {
				type = "int",
				method = "set",
				value = 1
			}
		end
	end
	local specialization = managers.skilltree:get_specialization_value("current_specialization")
	stats.player_specialization_active = {
		type = "int",
		method = "set",
		value = specialization or 0
	}
	managers.network.account:publish_statistics(stats)
end
function StatisticsManager:check_version()
	local CURRENT_VERSION = 2
	local stats = {}
	local resolution = string.format("%dx%d", RenderSettings.resolution.x, RenderSettings.resolution.y)
	local resolution_list = tweak_data.statistics:resolution_statistics_table()
	for _, res in pairs(resolution_list) do
		stats["option_resolution_" .. res] = {
			type = "int",
			method = "set",
			value = 0
		}
	end
	stats.option_resolution_other = {
		type = "int",
		method = "set",
		value = 0
	}
	stats[table.contains(resolution_list, resolution) and "option_resolution_" .. resolution or "option_resolution_other"] = {
		type = "int",
		method = "set",
		value = 1
	}
	if CURRENT_VERSION > managers.network.account:get_stat("stat_version") then
		self:publish_skills_to_steam(true)
		stats.stat_version = {
			type = "int",
			method = "set",
			value = CURRENT_VERSION
		}
	end
	return stats
end
function StatisticsManager:debug_estimate_steam_players()
	local key
	local stats = {}
	local account = managers.network.account
	local days = 60
	local num_players = 0
	local play_times = {
		0,
		10,
		20,
		40,
		80,
		100,
		150,
		200,
		250,
		500,
		1000
	}
	for _, play_time in ipairs(play_times) do
		key = "player_time_" .. play_time .. "h"
		num_players = num_players + account:get_global_stat(key, days)
	end
	Application:debug(managers.money:add_decimal_marks_to_string(tostring(num_players)) .. " players have summited statistics to Steam the last 60 days.")
end
function StatisticsManager:_calculate_average()
	local t = self._global.sessions.count ~= 0 and self._global.sessions.count or 1
	self._global.average = {}
	self._global.average.killed = deep_clone(self._global.killed)
	self._global.average.sessions = deep_clone(self._global.sessions)
	self._global.average.revives = deep_clone(self._global.revives)
	for _, data in pairs(self._global.average.killed) do
		data.count = math.round(data.count / t)
		data.head_shots = math.round(data.head_shots / t)
		data.melee = math.round(data.melee / t)
		data.explosion = math.round(data.explosion / t)
	end
	self._global.average.sessions.time = self._global.average.sessions.time / t
	for lvl, data in pairs(self._global.average.sessions.levels) do
		data.time = data.time / t
	end
	for counter, value in pairs(self._global.average.revives) do
		self._global.average.revives[counter] = math.round(value / t)
	end
	self._global.average.shots_fired = deep_clone(self._global.shots_fired)
	self._global.average.shots_fired.total = math.round(self._global.average.shots_fired.total / t)
	self._global.average.shots_fired.hits = math.round(self._global.average.shots_fired.hits / t)
	self._global.average.downed = deep_clone(self._global.downed)
	self._global.average.downed.bleed_out = math.round(self._global.average.downed.bleed_out / t)
	self._global.average.downed.fatal = math.round(self._global.average.downed.fatal / t)
	self._global.average.downed.incapacitated = math.round(self._global.average.downed.incapacitated / t)
	self._global.average.downed.death = math.round(self._global.average.downed.death / t)
	self._global.average.reloads = deep_clone(self._global.reloads)
	self._global.average.reloads.count = math.round(self._global.average.reloads.count / t)
	self._global.average.experience = deep_clone(self._global.experience)
	for size, data in pairs(self._global.average.experience) do
		if data.actions then
			data.count = math.round(data.count / t)
			for action, count in pairs(data.actions) do
				data.actions[action] = math.round(count / t)
			end
		end
	end
end
function StatisticsManager:killed_by_anyone(data)
	local by_explosion = data.variant == "explosion"
	local name_id = data.weapon_unit and data.weapon_unit:base():get_name_id()
	managers.achievment:set_script_data("pacifist_fail", true)
	if name_id ~= "m79" and name_id ~= "m79_npc" then
		managers.achievment:set_script_data("blow_out_fail", true)
	end
end
function StatisticsManager:killed(data)
	local stats_name = data.stats_name or data.name
	data.type = tweak_data.character[data.name] and tweak_data.character[data.name].challenges.type
	if not self._global.killed[stats_name] or not self._global.session.killed[stats_name] then
		Application:error("Bad name id applied to killed, " .. tostring(stats_name) .. ". Defaulting to 'other'")
		stats_name = "other"
	end
	local by_bullet = data.variant == "bullet"
	local by_melee = data.variant == "melee"
	local by_explosion = data.variant == "explosion"
	local by_other_variant = not by_bullet and not by_melee and not by_explosion
	local type = self._global.killed[stats_name]
	type.count = type.count + 1
	type.head_shots = type.head_shots + (data.head_shot and 1 or 0)
	type.melee = type.melee + (by_melee and 1 or 0)
	type.explosion = type.explosion + (by_explosion and 1 or 0)
	self._global.killed.total.count = self._global.killed.total.count + 1
	self._global.killed.total.head_shots = self._global.killed.total.head_shots + (data.head_shot and 1 or 0)
	self._global.killed.total.melee = self._global.killed.total.melee + (by_melee and 1 or 0)
	self._global.killed.total.explosion = self._global.killed.total.explosion + (by_explosion and 1 or 0)
	local type = self._global.session.killed[stats_name]
	type.count = type.count + 1
	type.head_shots = type.head_shots + (data.head_shot and 1 or 0)
	type.melee = type.melee + (by_melee and 1 or 0)
	type.explosion = type.explosion + (by_explosion and 1 or 0)
	self._global.session.killed.total.count = self._global.session.killed.total.count + 1
	self._global.session.killed.total.head_shots = self._global.session.killed.total.head_shots + (data.head_shot and 1 or 0)
	self._global.session.killed.total.melee = self._global.session.killed.total.melee + (by_melee and 1 or 0)
	self._global.session.killed.total.explosion = self._global.session.killed.total.explosion + (by_explosion and 1 or 0)
	if by_bullet then
		local name_id, throwable_id = self:_get_name_id_and_throwable_id(data.weapon_unit)
		if throwable_id then
			self._global.session.killed_by_grenade[throwable_id] = (self._global.session.killed_by_grenade[throwable_id] or 0) + 1
			self._global.killed_by_grenade[throwable_id] = (self._global.killed_by_grenade[throwable_id] or 0) + 1
		else
			self:_add_to_killed_by_weapon(name_id, data)
			if self._global.session.killed_by_weapon[name_id].count == tweak_data.achievement.first_blood.count then
				local category = data.weapon_unit:base():weapon_tweak_data().category
				if category == tweak_data.achievement.first_blood.weapon_type then
					managers.achievment:award(tweak_data.achievement.first_blood.award)
				end
			end
			if data.name == "tank" then
				managers.achievment:set_script_data("dodge_this_active", true)
			end
		end
	elseif by_melee then
		local name_id = data.name_id
		self._global.session.killed_by_melee[name_id] = (self._global.session.killed_by_melee[name_id] or 0) + 1
		self._global.killed_by_melee[name_id] = (self._global.killed_by_melee[name_id] or 0) + 1
	elseif by_explosion then
		local name_id, throwable_id = self:_get_name_id_and_throwable_id(data.weapon_unit)
		if throwable_id then
			self._global.session.killed_by_grenade[throwable_id] = (self._global.session.killed_by_grenade[throwable_id] or 0) + 1
			self._global.killed_by_grenade[throwable_id] = (self._global.killed_by_grenade[throwable_id] or 0) + 1
		end
		local boom_guns = {
			"gre_m79",
			"huntsman",
			"r870",
			"saiga",
			"ksg",
			"striker",
			"serbu",
			"benelli",
			"judge",
			"rpg7",
			"m32"
		}
		if name_id and table.contains(boom_guns, name_id) then
			self:_add_to_killed_by_weapon(name_id, data)
		end
	elseif by_other_variant then
		local name_id, throwable_id = self:_get_name_id_and_throwable_id(data.weapon_unit)
		self:_add_to_killed_by_weapon(name_id, data)
	end
end
function StatisticsManager:_add_to_killed_by_weapon(name_id, data)
	if not name_id then
		return
	end
	self._global.session.killed_by_weapon[name_id] = self._global.session.killed_by_weapon[name_id] or {count = 0, headshots = 0}
	self._global.session.killed_by_weapon[name_id].count = self._global.session.killed_by_weapon[name_id].count + 1
	self._global.session.killed_by_weapon[name_id].headshots = self._global.session.killed_by_weapon[name_id].headshots + (data.head_shot and 1 or 0)
	self._global.killed_by_weapon[name_id] = self._global.killed_by_weapon[name_id] or {count = 0, headshots = 0}
	self._global.killed_by_weapon[name_id].count = self._global.killed_by_weapon[name_id].count + 1
	self._global.killed_by_weapon[name_id].headshots = (self._global.killed_by_weapon[name_id].headshots or 0) + (data.head_shot and 1 or 0)
end
function StatisticsManager:_get_name_id_and_throwable_id(weapon_unit)
	if not alive(weapon_unit) then
		return nil, nil
	end
	if weapon_unit:base().projectile_entry then
		local projectile_data = tweak_data.blackmarket.projectiles[weapon_unit:base():projectile_entry()]
		local name_id = projectile_data.weapon_id
		local throwable_id = projectile_data.throwable and weapon_unit:base():projectile_entry()
		return name_id, throwable_id
	elseif weapon_unit:base().get_name_id then
		local name_id = weapon_unit:base():get_name_id()
		return name_id, nil
	end
end
function StatisticsManager:completed_job(job_id, difficulty)
	if tweak_data.narrative:has_job_wrapper(job_id) then
		local count = 0
		local job_wrapper = tweak_data.narrative.jobs[job_id].job_wrapper
		for _, wrapped_job in ipairs(job_wrapper) do
			count = count + (self._global.sessions.jobs[tostring(wrapped_job) .. "_" .. tostring(difficulty) .. "_completed"] or 0)
		end
		return count
	elseif tweak_data.narrative:is_wrapped_to_job(job_id) then
		local count = 0
		local tweak_jobs = tweak_data.narrative.jobs
		local job_wrapper = tweak_jobs[tweak_jobs[job_id].wrapped_to_job].job_wrapper
		for _, wrapped_job in ipairs(job_wrapper) do
			count = count + (self._global.sessions.jobs[tostring(wrapped_job) .. "_" .. tostring(difficulty) .. "_completed"] or 0)
		end
		return count
	end
	return self._global.sessions.jobs[tostring(job_id) .. "_" .. tostring(difficulty) .. "_completed"] or 0
end
function StatisticsManager:tied(data)
	data.type = tweak_data.character[data.name] and tweak_data.character[data.name].challenges.type
	if not self._global.killed[data.name] or not self._global.session.killed[data.name] then
		Application:error("Bad name id applied to tied, " .. tostring(data.name) .. ". Defaulting to 'other'")
		data.name = "other"
	end
	self._global.killed[data.name].tied = (self._global.killed[data.name].tied or 0) + 1
	self._global.session.killed[data.name].tied = self._global.session.killed[data.name].tied + 1
	if self._data_log and alive(managers.player:player_unit()) then
		table.insert(self._data_log, {
			3,
			Application:time(),
			managers.player:player_unit():position(),
			"tiedown",
			1
		})
	end
end
function StatisticsManager:revived(data)
	if not data.reviving_unit or data.reviving_unit ~= managers.player:player_unit() then
		return
	end
	local counter = data.npc and "npc_count" or "player_count"
	self._global.revives[counter] = self._global.revives[counter] + 1
	self._global.session.revives[counter] = self._global.session.revives[counter] + 1
	if self._data_log and alive(managers.player:player_unit()) then
		table.insert(self._data_log, {
			3,
			Application:time(),
			managers.player:player_unit():position(),
			"revive",
			1
		})
	end
end
function StatisticsManager:camera_destroyed(data)
	self._global.cameras.count = self._global.cameras.count + 1
	self._global.session.cameras.count = self._global.session.cameras.count + 1
end
function StatisticsManager:objective_completed(data)
	if managers.platform:presence() ~= "Playing" and managers.platform:presence() ~= "Mission_end" then
		return
	end
	self._global.objectives.count = self._global.objectives.count + 1
	self._global.session.objectives.count = self._global.session.objectives.count + 1
end
function StatisticsManager:health_subtracted(amount)
	self._global.health.amount_lost = self._global.health.amount_lost + amount
	self._global.session.health.amount_lost = self._global.session.health.amount_lost + amount
end
function StatisticsManager:shot_fired(data)
	local name_id = data.name_id or data.weapon_unit:base():get_name_id()
	if not data.skip_bullet_count then
		self._global.shots_fired.total = self._global.shots_fired.total + 1
		self._global.session.shots_fired.total = self._global.session.shots_fired.total + 1
		self._global.session.shots_by_weapon[name_id] = self._global.session.shots_by_weapon[name_id] or {hits = 0, total = 0}
		self._global.session.shots_by_weapon[name_id].total = self._global.session.shots_by_weapon[name_id].total + 1
		self._global.shots_by_weapon[name_id] = self._global.shots_by_weapon[name_id] or {hits = 0, total = 0}
		self._global.shots_by_weapon[name_id].total = self._global.shots_by_weapon[name_id].total + 1
	end
	if data.hit then
		self._global.shots_fired.hits = self._global.shots_fired.hits + 1
		self._global.session.shots_fired.hits = self._global.session.shots_fired.hits + 1
		self._global.session.shots_by_weapon[name_id] = self._global.session.shots_by_weapon[name_id] or {hits = 0, total = 0}
		self._global.session.shots_by_weapon[name_id].hits = self._global.session.shots_by_weapon[name_id].hits + 1
		self._global.shots_by_weapon[name_id] = self._global.shots_by_weapon[name_id] or {hits = 0, total = 0}
		self._global.shots_by_weapon[name_id].hits = self._global.shots_by_weapon[name_id].hits + 1
	end
end
function StatisticsManager:downed(data)
	managers.achievment:set_script_data("stand_together_fail", true)
	local counter = data.bleed_out and "bleed_out" or data.fatal and "fatal" or data.incapacitated and "incapacitated" or "death"
	self._global.downed[counter] = self._global.downed[counter] + 1
	self._global.session.downed[counter] = self._global.session.downed[counter] + 1
	if self._data_log and alive(managers.player:player_unit()) then
		table.insert(self._data_log, {
			3,
			Application:time(),
			managers.player:player_unit():position(),
			"downed",
			1
		})
	end
end
function StatisticsManager:reloaded(data)
	self._global.reloads.count = self._global.reloads.count + 1
	self._global.session.reloads.count = self._global.session.reloads.count + 1
	if self._data_log and alive(managers.player:player_unit()) then
		table.insert(self._data_log, {
			3,
			Application:time(),
			managers.player:player_unit():position(),
			"reloaded",
			1
		})
	end
end
function StatisticsManager:recieved_experience(data)
	self._global.experience[data.size] = self._global.experience[data.size] or {
		count = 0,
		actions = {}
	}
	self._global.experience[data.size].count = self._global.experience[data.size].count + 1
	self._global.experience[data.size].actions[data.action] = self._global.experience[data.size].actions[data.action] or 0
	self._global.experience[data.size].actions[data.action] = self._global.experience[data.size].actions[data.action] + 1
	self._global.session.experience[data.size] = self._global.session.experience[data.size] or {
		count = 0,
		actions = {}
	}
	self._global.session.experience[data.size].count = self._global.session.experience[data.size].count + 1
	self._global.session.experience[data.size].actions[data.action] = self._global.session.experience[data.size].actions[data.action] or 0
	self._global.session.experience[data.size].actions[data.action] = self._global.session.experience[data.size].actions[data.action] + 1
end
function StatisticsManager:get_killed()
	return self._global.killed
end
function StatisticsManager:count_up(id)
	if not self._statistics[id] then
		Application:stack_dump_error("Bad id to count up, " .. tostring(id) .. ".")
		return
	end
	self._statistics[id].count = self._statistics[id].count + 1
end
function StatisticsManager:print_stats()
	local time_text = self:_time_text(math.round(self._global.sessions.time))
	local time_average_text = self:_time_text(math.round(self._global.average.sessions.time))
	local t = self._global.sessions.count ~= 0 and self._global.sessions.count or 1
	print("- Sessions \t\t-")
	print("Total sessions:\t", self._global.sessions.count)
	print("Total time:\t\t", time_text)
	print("Average time:\t", time_average_text)
	print([[

- Levels 		-]])
	for name, data in pairs(self._global.sessions.levels) do
		local time_text = self:_time_text(math.round(data.time))
		print("Started: " .. data.started .. "\tBeginning: " .. data.from_beginning .. "\tDrop in: " .. data.drop_in .. "\tCompleted: " .. data.completed .. "\tQuited: " .. data.quited .. "\tTime: " .. time_text .. "\t- " .. name)
	end
	print([[

- Kills 		-]])
	for name, data in pairs(self._global.killed) do
		print("Count: " .. self:_amount_format(data.count) .. "/" .. self:_amount_format(self._global.average.killed[name].count, true) .. " Head shots: " .. self:_amount_format(data.head_shots) .. "/" .. self:_amount_format(self._global.average.killed[name].head_shots, true) .. " Melee: " .. self:_amount_format(data.melee) .. "/" .. self:_amount_format(self._global.average.killed[name].melee, true) .. " Explosion: " .. self:_amount_format(data.explosion) .. "/" .. self:_amount_format(self._global.average.killed[name].explosion, true) .. " " .. name)
	end
	print([[

- Revives 		-]])
	print("Count: " .. self._global.revives.npc_count .. "/" .. self._global.average.revives.npc_count .. "\t- Npcs")
	print("Count: " .. self._global.revives.player_count .. "/" .. self._global.average.revives.player_count .. "\t- Players")
	print([[

- Cameras 		-]])
	print("Count: " .. self._global.cameras.count)
	print([[

- Objectives 	-]])
	print("Count: " .. self._global.objectives.count)
	print([[

- Shots fired 	-]])
	print("Total: " .. self._global.shots_fired.total .. "/" .. self._global.average.shots_fired.total)
	print("Hits: " .. self._global.shots_fired.hits .. "/" .. self._global.average.shots_fired.hits)
	print("Hit percentage: " .. math.round(self._global.shots_fired.hits / (self._global.shots_fired.total ~= 0 and self._global.shots_fired.total or 1) * 100) .. "%")
	print([[

- Downed 	-]])
	print("Bleed out: " .. self._global.downed.bleed_out .. "/" .. self._global.average.downed.bleed_out)
	print("Fatal: " .. self._global.downed.fatal .. "/" .. self._global.average.downed.fatal)
	print("Incapacitated: " .. self._global.downed.incapacitated .. "/" .. self._global.average.downed.incapacitated)
	print("Death: " .. self._global.downed.death .. "/" .. self._global.average.downed.death)
	print([[

- Reloads 	-]])
	print("Count: " .. self._global.reloads.count .. "/" .. self._global.average.reloads.count)
	self:_print_experience_stats()
end
function StatisticsManager:is_dropin()
	return self._start_session_drop_in
end
function StatisticsManager:_print_experience_stats()
	local t = self._global.sessions.count ~= 0 and self._global.sessions.count or 1
	local average = self._global.average.experience
	local total = 0
	print([[

- Experience -]])
	for size, data in pairs(self._global.experience) do
		local exp = tweak_data.experience_manager.values[size]
		local average_count = average[size] and self:_amount_format(average[size].count, true) or "-"
		local average_exp = average[size] and self:_amount_format(exp * average[size].count, true) or "-"
		total = total + exp * data.count
		print([[

Size: ]] .. size .. " " .. self:_amount_format(exp, true) .. "" .. self:_amount_format(data.count) .. "/" .. average_count .. " " .. self:_amount_format(exp * data.count) .. "/" .. average_exp)
		for action, count in pairs(data.actions) do
			local average_count = average[size] and average[size].actions[action] and self:_amount_format(average[size].actions[action], true) or "-"
			local average_exp = average[size] and average[size].actions[action] and self:_amount_format(exp * average[size].actions[action], true) or "-"
			print("\tAction: " .. action)
			print("\t\tCount:" .. self:_amount_format(count) .. "/" .. average_count .. self:_amount_format(exp * count) .. "/" .. average_exp)
		end
	end
	print([[

Total:]] .. self:_amount_format(total) .. "/" .. self:_amount_format(total / t, true))
end
function StatisticsManager:_amount_format(amount, left)
	amount = math.round(amount)
	local s = ""
	for i = 6 - string.len(amount), 0, -1 do
		s = s .. " "
	end
	if not left or not (amount .. s) then
	end
	return s .. amount
end
function StatisticsManager:_time_text(time, params)
	local no_days = params and params.no_days
	local days = no_days and 0 or math.floor(time / 86400)
	time = time - days * 86400
	local hours = math.floor(time / 3600)
	time = time - hours * 3600
	local minutes = math.floor(time / 60)
	time = time - minutes * 60
	local seconds = math.round(time)
	if not no_days or not "" then
	end
	return ((days < 10 and "0" .. days or days) .. ":") .. (hours < 10 and "0" .. hours or hours) .. ":" .. (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
end
function StatisticsManager:_check_loaded_data()
	if not self._global.downed.incapacitated then
		self._global.downed.incapacitated = 0
	end
	for name, data in pairs(self._defaults.killed) do
		self._global.killed[name] = self._global.killed[name] or deep_clone(self._defaults.killed[name])
	end
	for name, data in pairs(self._global.killed) do
		data.melee = data.melee or 0
		data.explosion = data.explosion or 0
	end
	for name, lvl in pairs(self._defaults.sessions.levels) do
		self._global.sessions.levels[name] = self._global.sessions.levels[name] or deep_clone(lvl)
	end
	for _, lvl in pairs(self._global.sessions.levels) do
		lvl.drop_in = lvl.drop_in or 0
		lvl.from_beginning = lvl.from_beginning or 0
	end
	self._global.sessions.jobs = self._global.sessions.jobs or {}
	self._global.experience = self._global.experience or deep_clone(self._defaults.experience)
end
function StatisticsManager:time_played()
	local time = math.round(self._global.sessions.time)
	local time_text = self:_time_text(time)
	return time_text, time
end
function StatisticsManager:favourite_level()
	local started = 0
	local c_name
	for name, data in pairs(self._global.sessions.levels) do
		if started < data.started then
			c_name = name or c_name
		end
		if started < data.started then
			started = data.started or started
		end
	end
	if not c_name or not tweak_data.levels:get_localized_level_name_from_level_id(c_name) then
	end
	return (managers.localization:text("debug_undecided"))
end
function StatisticsManager:total_completed_campaigns()
	local i = 0
	for name, data in pairs(self._global.sessions.levels) do
		i = i + data.completed
	end
	return i
end
function StatisticsManager:favourite_weapon()
	local weapon_id
	local count = 0
	for id, data in pairs(self._global.killed_by_weapon) do
		if count < data.count then
			count = data.count
			weapon_id = id
		end
	end
	if not weapon_id or not managers.localization:text(tweak_data.weapon[weapon_id].name_id) then
	end
	return (managers.localization:text("debug_undecided"))
end
function StatisticsManager:total_kills()
	return self._global.killed.total.count
end
function StatisticsManager:total_head_shots()
	return self._global.killed.total.head_shots
end
function StatisticsManager:hit_accuracy()
	if self._global.shots_fired.total == 0 then
		return 0
	end
	return math.floor(self._global.shots_fired.hits / self._global.shots_fired.total * 100)
end
function StatisticsManager:total_completed_objectives()
	return self._global.objectives.count
end
function StatisticsManager:total_downed()
	return self._global.session.downed.bleed_out + self._global.session.downed.incapacitated
end
function StatisticsManager:session_time_played()
	local time = math.round(self._global.session.sessions.time)
	local time_text = self:_time_text(time, {no_days = true})
	return time_text, time
end
function StatisticsManager:completed_objectives()
	return self._global.session.objectives.count
end
function StatisticsManager:session_favourite_weapon()
	local weapon_id
	local count = 0
	for id, data in pairs(self._global.session.killed_by_weapon) do
		if count < data.count then
			count = data.count
			weapon_id = id
		end
	end
	if not weapon_id or not managers.localization:text(tweak_data.weapon[weapon_id].name_id) then
	end
	return (managers.localization:text("debug_undecided"))
end
function StatisticsManager:session_used_weapons()
	local weapons_used = {}
	if self._global.session.shots_by_weapon then
		for weapon, _ in pairs(self._global.session.shots_by_weapon) do
			table.insert(weapons_used, weapon)
		end
	end
	return weapons_used
end
function StatisticsManager:session_killed_by_grenade()
	local count = 0
	for projectile_id, kills in pairs(self._global.session.killed_by_grenade) do
		count = count + kills
	end
	return count
end
function StatisticsManager:session_killed_by_melee()
	local count = 0
	for melee_id, kills in pairs(self._global.session.killed_by_melee) do
		count = count + kills
	end
	return count
end
function StatisticsManager:session_killed_by_weapon(weapon_id)
	return self._global.session.killed_by_weapon[weapon_id] and self._global.session.killed_by_weapon[weapon_id].count or 0
end
function StatisticsManager:session_killed_by_weapons()
	local count = 0
	for weapon_id, data in pairs(self._global.session.killed_by_weapon) do
		count = count + data.count
	end
	return count
end
function StatisticsManager:session_enemy_killed_by_type(enemy, type)
	return self._global.session.killed and self._global.session.killed[enemy] and self._global.session.killed[enemy][type] or 0
end
function StatisticsManager:session_killed()
	return self._global.session.killed
end
function StatisticsManager:session_total_kills()
	return self._global.session.killed.total.count
end
function StatisticsManager:session_total_killed()
	return self._global.session.killed.total
end
function StatisticsManager:session_total_shots(weapon_type)
	local weapon = weapon_type == "primaries" and managers.blackmarket:equipped_primary() or managers.blackmarket:equipped_secondary()
	local weapon_data = weapon and self._global.session.shots_by_weapon[weapon.weapon_id]
	return weapon_data and weapon_data.total or 0
end
function StatisticsManager:session_total_specials_kills()
	return self._global.session.killed.shield.count + self._global.session.killed.spooc.count + self._global.session.killed.tank.count + self._global.session.killed.taser.count
end
function StatisticsManager:session_total_head_shots()
	return self._global.session.killed.total.head_shots
end
function StatisticsManager:session_hit_accuracy()
	if self._global.session.shots_fired.total == 0 then
		return 0
	end
	return math.floor(self._global.session.shots_fired.hits / self._global.session.shots_fired.total * 100)
end
function StatisticsManager:session_total_civilian_kills()
	return self._global.session.killed.civilian.count + self._global.session.killed.civilian_female.count
end
function StatisticsManager:send_statistics()
	if not managers.network:session() then
		return
	end
	local peer_id = managers.network:session():local_peer():id()
	local total_kills = self:session_total_kills()
	local total_specials_kills = self:session_total_specials_kills()
	local total_head_shots = self:session_total_head_shots()
	local accuracy = math.min(self:session_hit_accuracy(), 1000)
	local downs = self:total_downed()
	if Network:is_server() then
		managers.network:session():on_statistics_recieved(peer_id, total_kills, total_specials_kills, total_head_shots, accuracy, downs)
	else
		managers.network:session():send_to_host("send_statistics", total_kills, total_specials_kills, total_head_shots, accuracy, downs)
	end
end
function StatisticsManager:save(data)
	local state = {
		camera = self._global.cameras,
		downed = self._global.downed,
		killed = self._global.killed,
		objectives = self._global.objectives,
		reloads = self._global.reloads,
		revives = self._global.revives,
		sessions = self._global.sessions,
		shots_fired = self._global.shots_fired,
		experience = self._global.experience,
		killed_by_melee = self._global.killed_by_melee,
		killed_by_weapon = self._global.killed_by_weapon,
		killed_by_grenade = self._global.killed_by_grenade,
		shots_by_weapon = self._global.shots_by_weapon,
		health = self._global.health,
		misc = self._global.misc,
		play_time = self._global.play_time
	}
	data.StatisticsManager = state
end
function StatisticsManager:load(data)
	local state = data.StatisticsManager
	if state then
		for name, stats in pairs(state) do
			self._global[name] = stats
		end
		self:_check_loaded_data()
		self:_calculate_average()
	end
end
