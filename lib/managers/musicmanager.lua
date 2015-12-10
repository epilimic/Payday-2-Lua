MusicManager = MusicManager or class(CoreMusicManager)
function MusicManager:init()
	MusicManager.super.init(self)
end
function MusicManager:init_globals(...)
	MusicManager.super.init_globals(self, ...)
	Global.music_manager.track_attachment = {}
	Global.music_manager.custom_playlist = {}
	Global.music_manager.custom_menu_playlist = {}
	Global.music_manager.unlocked_tracks = {}
	self:_set_default_values()
end
function MusicManager:track_listen_start(event, track)
	if self._current_track == track and self._current_event == event then
		return
	end
	self._skip_play = true
	Global.music_manager.source:stop()
	if track then
		Global.music_manager.source:set_switch("music_randomizer", track)
	end
	Global.music_manager.source:post_event(event)
	self._current_track = track
	self._current_event = event
end
function MusicManager:track_listen_stop()
	if self._current_event then
		Global.music_manager.source:post_event("stop_all_music")
		if Global.music_manager.current_event then
			Global.music_manager.source:post_event(Global.music_manager.current_event)
		end
	end
	if self._current_track and Global.music_manager.current_track then
		Global.music_manager.source:set_switch("music_randomizer", Global.music_manager.current_track)
	end
	self._current_event = nil
	self._current_track = nil
	self._skip_play = nil
end
function MusicManager:playlist()
	return Global.music_manager.custom_playlist
end
function MusicManager:playlist_add(track)
	table.insert(Global.music_manager.custom_playlist, track)
end
function MusicManager:playlist_remove(track)
	for index, track_name in pairs(Global.music_manager.custom_playlist) do
		if track == track_name then
			table.remove(Global.music_manager.custom_playlist, index)
		else
		end
	end
end
function MusicManager:playlist_clear()
	Global.music_manager.custom_playlist = {}
end
function MusicManager:playlist_contains(track)
	return table.contains(Global.music_manager.custom_playlist, track)
end
function MusicManager:playlist_menu()
	return Global.music_manager.custom_menu_playlist
end
function MusicManager:playlist_menu_add(track)
	table.insert(Global.music_manager.custom_menu_playlist, track)
end
function MusicManager:playlist_menu_remove(track)
	for index, track_name in pairs(Global.music_manager.custom_menu_playlist) do
		if track == track_name then
			table.remove(Global.music_manager.custom_menu_playlist, index)
		else
		end
	end
end
function MusicManager:playlist_menu_clear()
	Global.music_manager.custom_menu_playlist = {}
end
function MusicManager:playlist_menu_contains(track)
	return table.contains(Global.music_manager.custom_menu_playlist, track)
end
function MusicManager:track_attachment(name)
	return Global.music_manager.track_attachment[name]
end
function MusicManager:track_attachment_add(name, track)
	Global.music_manager.track_attachment[name] = track
end
function MusicManager:track_attachment_clear()
	Global.music_manager.track_attachment = {}
end
function MusicManager:unlock_track(name)
	Global.music_manager.unlocked_tracks[name] = true
end
function MusicManager:track_unlocked(name)
	return Global.music_manager.unlocked_tracks[name]
end
function MusicManager:save_settings(data)
	local state = {
		custom_playlist = Global.music_manager.custom_playlist,
		custom_menu_playlist = Global.music_manager.custom_menu_playlist,
		track_attachment = Global.music_manager.track_attachment,
		unlocked_tracks = Global.music_manager.unlocked_tracks
	}
	data.MusicManager = state
end
function MusicManager:load_settings(data)
	local state = data.MusicManager
	if state then
		Global.music_manager.custom_playlist = state.custom_playlist or {}
		Global.music_manager.custom_menu_playlist = state.custom_menu_playlist or {}
		Global.music_manager.track_attachment = state.track_attachment or {}
		Global.music_manager.unlocked_tracks = state.unlocked_tracks or {}
		self:_set_default_values()
	end
end
function MusicManager:save_profile(data)
	local state = {
		loadout_selection = Global.music_manager.loadout_selection
	}
	data.MusicManager = state
end
function MusicManager:load_profile(data)
	local state = data.MusicManager
	if state then
		Global.music_manager.loadout_selection = state.loadout_selection
	end
end
function MusicManager:current_track_string()
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	if level_data and level_data.music == "no_music" then
		return utf8.to_upper(managers.localization:text("menu_jukebox_track_" .. Global.level_data.level_id))
	end
	return utf8.to_upper(managers.localization:text("menu_jukebox_" .. Global.music_manager.current_track))
end
function MusicManager:jukebox_random_all()
	local switches = {}
	local track_list, track_locked = self:jukebox_music_tracks()
	for _, track_name in ipairs(track_list) do
		if not track_locked[track_name] then
			table.insert(switches, track_name)
		end
	end
	return switches
end
function MusicManager:jukebox_random_all_menu()
	local switches = {}
	local track_list, track_locked = self:jukebox_menu_tracks()
	for _, track_name in ipairs(track_list) do
		if not track_locked[track_name] then
			table.insert(switches, track_name)
		end
	end
	return switches
end
function MusicManager:jukebox_set_defaults()
	self:playlist_clear()
	local tracks_list, tracks_locked = self:jukebox_music_tracks()
	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			self:playlist_add(track_name)
		end
	end
	self:playlist_menu_clear()
	local tracks_list, tracks_locked = self:jukebox_menu_tracks()
	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			self:playlist_menu_add(track_name)
		end
	end
	self:track_attachment_clear()
	local defaults = self:jukebox_default_tracks()
	for name, track in pairs(defaults) do
		self:track_attachment_add(name, track)
	end
end
function MusicManager:jukebox_heist_specific()
	if managers.job:interupt_stage() then
		return self:track_attachment("escape") or "all"
	end
	local job_data = Global.job_manager.current_job
	if job_data then
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)
		if job_tweak then
			local track_data = job_tweak.name_id .. (job_data.stages > 1 and job_data.current_stage or "")
			return self:track_attachment(track_data) or "all"
		end
	end
	return "all"
end
function MusicManager:_set_default_values()
	if #Global.music_manager.custom_playlist == 0 then
		local tracks_list, tracks_locked = self:jukebox_music_tracks()
		for _, track_name in pairs(tracks_list) do
			if not tracks_locked[track_name] then
				table.insert(Global.music_manager.custom_playlist, track_name)
			end
		end
	end
	if #Global.music_manager.custom_menu_playlist == 0 then
		local tracks_list, tracks_locked = self:jukebox_menu_tracks()
		for _, track_name in pairs(tracks_list) do
			if not tracks_locked[track_name] then
				table.insert(Global.music_manager.custom_menu_playlist, track_name)
			end
		end
	end
	local default_tracks = self:jukebox_default_tracks()
	for name, track in pairs(default_tracks) do
		if not Global.music_manager.track_attachment[name] then
			Global.music_manager.track_attachment[name] = track
		end
	end
end
function MusicManager:jukebox_menu_track(name)
	local track = self:track_attachment(name)
	if track == "all" then
		local track_list = self:jukebox_random_all_menu()
		return track_list[math.random(#track_list)]
	elseif track == "playlist" then
		local track_list = managers.music:playlist_menu()
		return track_list[math.random(#track_list)]
	else
		return track
	end
end
function MusicManager:jukebox_default_tracks()
	local default_options = {
		mainmenu = "menu_music",
		loadout = "loadout_music",
		heistresult = "resultscreen_win",
		heistlost = "resultscreen_lose",
		heistfinish = "music_loot_drop",
		credits = "criminals_ambition",
		heist_gallery = "track_05",
		heist_branchbank = "track_03",
		heist_branchbank_cash = "track_07",
		heist_branchbank_deposit = "track_01",
		heist_branchbank_gold = "track_04",
		heist_welcome_to_the_jungle1 = "track_04",
		heist_welcome_to_the_jungle2 = "track_06",
		heist_rat = "track_08",
		heist_family = "track_04",
		heist_election_day1 = "track_04",
		heist_election_day2 = "track_05",
		heist_firestarter1 = "track_08",
		heist_firestarter2 = "track_06",
		heist_firestarter3 = "track_02",
		heist_four_stores = "track_01",
		heist_framing_frame1 = "track_05",
		heist_framing_frame2 = "track_08",
		heist_framing_frame3 = "track_03",
		heist_roberts = "track_10",
		heist_jewelry_store = "track_01",
		heist_mallcrasher = "track_03",
		heist_nightclub = "track_05",
		heist_alex1 = "track_08",
		heist_alex2 = "track_07",
		heist_alex3 = "track_02",
		heist_big = "all",
		heist_arm_cro = "all",
		heist_arm_hcm = "all",
		heist_arm_fac = "all",
		heist_arm_par = "all",
		heist_arm_for = "all",
		heist_arm_und = "all",
		heist_ukrainian_job = "track_07",
		heist_watchdogs1 = "track_02",
		heist_watchdogs2 = "track_06",
		escape = "track_16",
		heist_mia1 = "all",
		heist_mia2 = "all",
		heist_hox1 = "track_20",
		heist_hox2 = "track_21",
		heist_haunted = "track_22",
		heist_pines = "track_23",
		heist_mus = "all",
		heist_crojob1 = "all",
		heist_crojob2 = "all",
		heist_cage = "track_26",
		heist_hox_3 = "track_27",
		heist_shoutout_raid = "track_28",
		heist_kenaz_full = "all",
		heist_jolly = "track_30",
		heist_red2 = "track_31",
		heist_dinner = "track_35",
		heist_nail = "track_36",
		heist_pbr = "all",
		heist_pbr2 = "all",
		heist_cane = "track_39"
	}
	if managers.dlc:has_armored_transport() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_arm_cro = "track_09"
		default_options.heist_arm_hcm = "track_09"
		default_options.heist_arm_fac = "track_09"
		default_options.heist_arm_par = "track_09"
		default_options.heist_arm_for = "track_09"
		default_options.heist_arm_und = "track_09"
	end
	if managers.dlc:has_big_bank() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_big = "track_14"
	end
	if managers.dlc:has_hl_miami() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_mia1 = "track_18"
		default_options.heist_mia2 = "track_19"
	end
	if managers.dlc:has_hope_diamond() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_mus = "track_24"
	end
	if managers.dlc:has_the_bomb() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_crojob1 = "track_25"
		default_options.heist_crojob2 = "track_25"
	end
	if managers.dlc:has_kenaz() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_kenaz_full = "track_29"
	end
	if managers.dlc:has_berry() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_pbr = "track_37"
	end
	if managers.dlc:has_berry() or managers.dlc:has_soundtrack_or_cce() then
		default_options.heist_pbr2 = "track_38"
	end
	return default_options
end
function MusicManager:jukebox_music_tracks()
	local tracks = {}
	local tracks_locked = {}
	local lock_data = {
		armored = not managers.dlc or managers.dlc:has_armored_transport() or managers.dlc:has_soundtrack_or_cce(),
		infamy = managers.experience and managers.experience:current_rank() > 0,
		deathwish = managers.experience and (managers.experience:current_rank() > 0 or managers.experience:current_level() >= tweak_data.difficulty_level_locks[tweak_data:difficulty_to_index("overkill_290")]),
		bigbank = not managers.dlc or managers.dlc:has_big_bank() or managers.dlc:has_soundtrack_or_cce(),
		assault = not managers.dlc or managers.dlc:has_gage_pack_assault() or managers.dlc:has_soundtrack_or_cce(),
		miami = not managers.dlc or managers.dlc:has_hl_miami() or managers.dlc:has_soundtrack_or_cce(),
		diamond = not managers.dlc or managers.dlc:has_hope_diamond() or managers.dlc:has_soundtrack_or_cce(),
		thebomb = not managers.dlc or managers.dlc:has_the_bomb() or managers.dlc:has_soundtrack_or_cce(),
		kenaz = not managers.dlc or managers.dlc:has_kenaz() or managers.dlc:has_soundtrack_or_cce(),
		payday = managers.dlc and managers.dlc:has_pdth_soundtrack(),
		berry = not managers.dlc or managers.dlc:has_berry() or managers.dlc:has_soundtrack_or_cce()
	}
	for _, data in ipairs(tweak_data.music.track_list) do
		table.insert(tracks, data.track)
		if data.lock and not self:track_unlocked(data.track) then
			if lock_data[data.lock] then
				self:unlock_track(data.track)
				self:playlist_add(data.track)
			else
				tracks_locked[data.track] = data.lock
			end
		end
	end
	return tracks, tracks_locked
end
function MusicManager:jukebox_menu_tracks()
	local tracks = {}
	local tracks_locked = {}
	local lock_data = {
		soundtrack = managers.dlc and managers.dlc:has_soundtrack_or_cce(),
		bsides = managers.dlc and managers.dlc:has_bsides_soundtrack(),
		payday = managers.dlc and managers.dlc:has_pdth_soundtrack(),
		xmas = managers.dlc and managers.dlc:has_xmas_soundtrack(),
		alesso = managers.dlc and managers.dlc:has_arena(),
		berry = not managers.dlc or managers.dlc:has_berry() or managers.dlc:has_soundtrack_or_cce()
	}
	for _, data in ipairs(tweak_data.music.track_menu_list) do
		table.insert(tracks, data.track)
		if data.lock and not lock_data[data.lock] then
			tracks_locked[data.track] = data.lock
		end
	end
	return tracks, tracks_locked
end
function MusicManager:music_tracks()
	return tweak_data.music.soundbank_list
end
