require("lib/managers/menu/SkillTreeGui")
require("lib/managers/menu/InfamyTreeGui")
require("lib/managers/menu/BlackMarketGui")
require("lib/managers/menu/InventoryList")
require("lib/managers/menu/MissionBriefingGui")
require("lib/managers/menu/StageEndScreenGui")
require("lib/managers/menu/LootDropScreenGUI")
require("lib/managers/menu/CrimeNetContractGui")
require("lib/managers/menu/CrimeNetFiltersGui")
require("lib/managers/menu/CrimeNetCasinoGui")
require("lib/managers/menu/MenuSceneGui")
require("lib/managers/menu/PlayerProfileGuiObject")
require("lib/managers/menu/IngameContractGui")
require("lib/managers/menu/IngameManualGui")
require("lib/managers/menu/PrePlanningMapGui")
require("lib/managers/menu/GameInstallingGui")
require("lib/managers/menu/PlayerInventoryGui")
require("lib/managers/hud/HUDLootScreen")
if not MenuComponentManager then
	MenuComponentManager = class()
end
MenuComponentManager.init = function(self)
	self._ws = Overlay:gui():create_screen_workspace()
	self._fullscreen_ws = managers.gui_data:create_fullscreen_16_9_workspace(managers.gui_data)
	managers.gui_data:layout_workspace(self._ws)
	self._main_panel = self._ws:panel():panel()
	self._requested_textures = {}
	self._block_texture_requests = false
	self._REFRESH_FRIENDS_TIME = 5
	self._refresh_friends_t = TimerManager:main():time() + self._REFRESH_FRIENDS_TIME
	self._sound_source = SoundDevice:create_source("MenuComponentManager")
	self._resolution_changed_callback_id = managers.viewport:add_resolution_changed_func(callback(self, self, "resolution_changed"))
	self._request_done_clbk_func = callback(self, self, "_request_done_callback")
	self._preplanning_saved_draws = {}
	local is_installing, install_progress = managers.dlc:is_installing()
	self._is_game_installing = is_installing
	self._crimenet_enabled = not is_installing
	self._crimenet_offline_enabled = not is_installing
	self._active_components = {}
	self._active_components.news = {create = callback(self, self, "_create_newsfeed_gui"), close = callback(self, self, "close_newsfeed_gui")}
	self._active_components.profile = {create = callback(self, self, "_create_profile_gui"), close = callback(self, self, "_disable_profile_gui")}
	self._active_components.friends = {create = callback(self, self, "_create_friends_gui"), close = callback(self, self, "_disable_friends_gui")}
	self._active_components.chats = {create = callback(self, self, "_create_chat_gui"), close = callback(self, self, "_disable_chat_gui")}
	self._active_components.lobby_chats = {create = callback(self, self, "_create_lobby_chat_gui"), close = callback(self, self, "hide_lobby_chat_gui")}
	self._active_components.crimenet_chats = {create = callback(self, self, "_create_crimenet_chats_gui"), close = callback(self, self, "hide_crimenet_chat_gui")}
	self._active_components.preplanning_chats = {create = callback(self, self, "_create_preplanning_chats_gui"), close = callback(self, self, "hide_preplanning_chat_gui")}
	self._active_components.contract = {create = callback(self, self, "_create_contract_gui"), close = callback(self, self, "_disable_contract_gui")}
	self._active_components.server_info = {create = callback(self, self, "_create_server_info_gui"), close = callback(self, self, "_disable_server_info_gui")}
	self._active_components.debug_strings = {create = callback(self, self, "_create_debug_strings_gui"), close = callback(self, self, "_disable_debug_strings_gui")}
	self._active_components.debug_fonts = {create = callback(self, self, "_create_debug_fonts_gui"), close = callback(self, self, "_disable_debug_fonts_gui")}
	self._active_components.skilltree = {create = callback(self, self, "_create_skilltree_gui"), close = callback(self, self, "close_skilltree_gui")}
	self._active_components.infamytree = {create = callback(self, self, "_create_infamytree_gui"), close = callback(self, self, "close_infamytree_gui")}
	self._active_components.crimenet = {create = callback(self, self, "_create_crimenet_gui"), close = callback(self, self, "close_crimenet_gui")}
	self._active_components.crimenet_contract = {create = callback(self, self, "_create_crimenet_contract_gui"), close = callback(self, self, "close_crimenet_contract_gui")}
	self._active_components.crimenet_filters = {create = callback(self, self, "_create_crimenet_filters_gui"), close = callback(self, self, "close_crimenet_filters_gui")}
	self._active_components.crimenet_casino = {create = callback(self, self, "_create_crimenet_casino_gui"), close = callback(self, self, "close_crimenet_casino_gui")}
	self._active_components.lootdrop_casino = {create = callback(self, self, "_create_lootdrop_casino_gui"), close = callback(self, self, "close_lootdrop_casino_gui")}
	self._active_components.blackmarket = {create = callback(self, self, "_create_blackmarket_gui"), close = callback(self, self, "close_blackmarket_gui")}
	self._active_components.mission_briefing = {create = callback(self, self, "_create_mission_briefing_gui"), close = callback(self, self, "_hide_mission_briefing_gui")}
	self._active_components.stage_endscreen = {create = callback(self, self, "_create_stage_endscreen_gui"), close = callback(self, self, "_hide_stage_endscreen_gui")}
	self._active_components.lootdrop = {create = callback(self, self, "_create_lootdrop_gui"), close = callback(self, self, "_hide_lootdrop_gui")}
	self._active_components.menuscene_info = {create = callback(self, self, "_create_menuscene_info_gui"), close = callback(self, self, "_close_menuscene_info_gui")}
	self._active_components.player_profile = {create = callback(self, self, "_create_player_profile_gui"), close = callback(self, self, "close_player_profile_gui")}
	self._active_components.ingame_contract = {create = callback(self, self, "_create_ingame_contract_gui"), close = callback(self, self, "close_ingame_contract_gui")}
	self._active_components.ingame_manual = {create = callback(self, self, "_create_ingame_manual_gui"), close = callback(self, self, "close_ingame_manual_gui")}
	self._active_components.inventory_list = {create = callback(self, self, "_create_inventory_list_gui"), close = callback(self, self, "close_inventory_list_gui")}
	self._active_components.preplanning_map = {create = callback(self, self, "create_preplanning_map_gui"), close = callback(self, self, "close_preplanning_map_gui")}
	self._active_components.game_installing = {create = callback(self, self, "create_game_installing_gui"), close = callback(self, self, "close_game_installing_gui")}
	self._active_components.inventory = {create = callback(self, self, "create_inventory_gui"), close = callback(self, self, "close_inventory_gui")}
end

MenuComponentManager.save = function(self, data)
end

MenuComponentManager.load = function(self, data)
	self:on_whisper_mode_changed()
end

MenuComponentManager.get_controller_input_bool = function(self, button)
	if not managers.menu or not managers.menu:active_menu() then
		return 
	end
	local controller = managers.menu:active_menu().input:get_controller_class()
	if managers.menu:active_menu().input:get_accept_input() then
		return controller:get_input_bool(button)
	end
end

MenuComponentManager._setup_controller_input = function(self)
	if not self._controller_connected then
		self._left_axis_vector = Vector3()
		self._right_axis_vector = Vector3()
		self._fullscreen_ws:connect_controller(managers.menu:active_menu().input:get_controller(), true)
		self._fullscreen_ws:panel():axis_move(callback(self, self, "_axis_move"))
		self._controller_connected = true
	if SystemInfo:platform() == Idstring("WIN32") then
		end
		self._fullscreen_ws:connect_keyboard(Input:keyboard())
		self._fullscreen_ws:panel():key_press(callback(self, self, "key_press_controller_support"))
	end
end

MenuComponentManager._destroy_controller_input = function(self)
	if self._controller_connected then
		self._fullscreen_ws:disconnect_all_controllers()
		if alive(self._fullscreen_ws:panel()) then
			self._fullscreen_ws:panel():axis_move(nil)
		end
		self._controller_connected = nil
	if SystemInfo:platform() == Idstring("WIN32") then
		end
		self._fullscreen_ws:disconnect_keyboard()
		self._fullscreen_ws:panel():key_press(nil)
	end
end

MenuComponentManager.key_press_controller_support = function(self, o, k)
	if not MenuCallbackHandler:can_toggle_chat() then
		return 
	end
	local toggle_chat = Idstring(managers.controller:get_settings("pc"):get_connection("toggle_chat"):get_input_name_list()[1])
	if k == toggle_chat then
		if self._game_chat_gui and self._game_chat_gui:enabled() then
			self._game_chat_gui:open_page()
			return 
		end
		if managers.hud and not managers.hud:chat_focus() and managers.menu:toggle_chatinput() then
			managers.hud:set_chat_skip_first(true)
		end
		return 
	end
end

MenuComponentManager.saferect_ws = function(self)
	return self._ws
end

MenuComponentManager.fullscreen_ws = function(self)
	return self._fullscreen_ws
end

MenuComponentManager.resolution_changed = function(self)
	managers.gui_data:layout_workspace(self._ws)
	managers.gui_data:layout_fullscreen_16_9_workspace(managers.gui_data, self._fullscreen_ws)
	if self._tcst then
		managers.gui_data:layout_fullscreen_16_9_workspace(managers.gui_data, self._tcst)
	end
end

MenuComponentManager._axis_move = function(self, o, axis_name, axis_vector, controller)
	if axis_name == Idstring("left") then
		mvector3.set(self._left_axis_vector, axis_vector)
	else
		if axis_name == Idstring("right") then
			mvector3.set(self._right_axis_vector, axis_vector)
		end
	end
end

MenuComponentManager.set_active_components = function(self, components, node)
	local to_close = {}
	for component,_ in pairs(self._active_components) do
		to_close[component] = true
	end
	for _,component in ipairs(components) do
		if self._active_components[component] then
			to_close[component] = nil
			self._active_components[component].create(node)
		end
	end
	for component,_ in pairs(to_close) do
		self._active_components[component]:close()
	end
	if not managers.menu:is_pc_controller() then
		self:_setup_controller_input()
	end
end

MenuComponentManager.make_color_text = function(self, text_object, color)
	local text = text_object:text()
	local text_dissected = utf8.characters(text)
	local idsp = Idstring("#")
	local start_ci = {}
	local end_ci = {}
	local first_ci = true
	for i,c in ipairs(text_dissected) do
		if Idstring(c) == idsp then
			local next_c = text_dissected[i + 1]
		if next_c then
			end
			if Idstring(next_c) == idsp then
				if first_ci then
					table.insert(start_ci, i)
				else
					table.insert(end_ci, i)
					first_ci = not first_ci
				end
			end
		end
		if #start_ci ~= #end_ci then
			do return end
		end
		for i = 1, #start_ci do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - (i * 4 - 1)
		end
		text = string.gsub(text, "##", "")
		text_object:set_text(text)
		text_object:clear_range_color(1, utf8.len(text))
		if #start_ci ~= #end_ci then
			Application:error("CrimeNetGui:make_color_text: Not even amount of ##'s in text", #start_ci, #end_ci)
		else
			for i = 1, #start_ci do
				if not color then
					text_object:set_range_color(start_ci[i], end_ci[i], tweak_data.screen_colors.resource)
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

MenuComponentManager.on_job_updated = function(self)
	if self._contract_gui then
		self._contract_gui:refresh()
	end
end

MenuComponentManager.update = function(self, t, dt)
	if self._set_crimenet_enabled == true then
		if self._crimenet_gui then
			self._crimenet_gui:enable_crimenet()
		end
		self._set_crimenet_enabled = nil
	elseif self._set_crimenet_enabled == false then
		if self._crimenet_gui then
			self._crimenet_gui:disable_crimenet()
		end
		self._set_crimenet_enabled = nil
	end
	if self._mission_briefing_update_tab_wanted then
		self:update_mission_briefing_tab_positions()
	end
	self:_update_newsfeed_gui(t, dt)
	self:_update_game_installing_gui(t, dt)
	if self._refresh_friends_t < t then
		self:_update_friends_gui()
		self._refresh_friends_t = t + self._REFRESH_FRIENDS_TIME
	end
	if self._lobby_profile_gui then
		self._lobby_profile_gui:update(t, dt)
	end
	if self._profile_gui then
		self._profile_gui:update(t, dt)
	end
	if self._view_character_profile_gui then
		self._view_character_profile_gui:update(t, dt)
	end
	if self._contract_gui then
		self._contract_gui:update(t, dt)
	end
	if self._menuscene_info_gui then
		self._menuscene_info_gui:update(t, dt)
	end
	if self._skilltree_gui then
		self._skilltree_gui:update(t, dt)
	end
	if self._crimenet_contract_gui then
		self._crimenet_contract_gui:update(t, dt)
	end
	if self._lootdrop_gui then
		self._lootdrop_gui:update(t, dt)
	end
	if self._lootdrop_casino_gui then
		self._lootdrop_casino_gui:update(t, dt)
	end
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:update(t, dt)
	end
	if self._mission_briefing_gui then
		self._mission_briefing_gui:update(t, dt)
	end
	if self._ingame_manual_gui then
		self._ingame_manual_gui:update(t, dt)
	end
	if self._preplanning_map then
		self._preplanning_map:update(t, dt)
	end
	if self._blackmarket_gui then
		self._blackmarket_gui:update(t, dt)
	end
end

MenuComponentManager.get_left_controller_axis = function(self)
	if managers.menu:is_pc_controller() or not self._left_axis_vector then
		return 0, 0
	end
	local x = mvector3.x(self._left_axis_vector)
	local y = mvector3.y(self._left_axis_vector)
	return x, y
end

MenuComponentManager.get_right_controller_axis = function(self)
	if managers.menu:is_pc_controller() or not self._right_axis_vector then
		return 0, 0
	end
	local x = mvector3.x(self._right_axis_vector)
	local y = mvector3.y(self._right_axis_vector)
	return x, y
end

MenuComponentManager.accept_input = function(self, accept)
	if not self._weapon_text_box then
		return 
	end
	if not accept then
		self._weapon_text_box:release_scroll_bar()
	end
end

MenuComponentManager.input_focus = function(self)
	if managers.system_menu and managers.system_menu:is_active() and not managers.system_menu:is_closing() then
		return true
	end
	if self._game_chat_gui then
		local input_focus = self._game_chat_gui:input_focus()
		if input_focus == true then
			return true
		end
	elseif input_focus == 1 then
		return 1
	end
	if self._skilltree_gui then
		local input_focus = self._skilltree_gui:input_focus()
		if input_focus then
			return input_focus
		end
	end
	if self._infamytree_gui and self._infamytree_gui:input_focus() then
		return 1
	end
	if self:is_preplanning_enabled() then
		return self._preplanning_map:input_focus()
	end
	if self._blackmarket_gui then
		return self._blackmarket_gui:input_focus()
	end
	if self._mission_briefing_gui then
		return self._mission_briefing_gui:input_focus()
	end
	if self._stage_endscreen_gui then
		return self._stage_endscreen_gui:input_focus()
	end
	if self._lootdrop_casino_gui then
		return self._lootdrop_casino_gui:input_focus()
	end
	if self._lootdrop_gui then
		return self._lootdrop_gui:input_focus()
	end
	if self._crimenet_gui then
		return self._crimenet_gui:input_focus()
	end
	if self._ingame_manual_gui then
		return self._ingame_manual_gui:input_focus()
	end
	if self._player_inventory_gui then
		return self._player_inventory_gui:input_focus()
	end
end

MenuComponentManager.scroll_up = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if not self._weapon_text_box then
		return 
	end
	self._weapon_text_box:scroll_up()
	if self._mission_briefing_gui and self._mission_briefing_gui:scroll_up() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:scroll_up() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:scroll_up() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:scroll_up() then
		return true
	end
end

MenuComponentManager.scroll_down = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if not self._weapon_text_box then
		return 
	end
	self._weapon_text_box:scroll_down()
	if self._mission_briefing_gui and self._mission_briefing_gui:scroll_down() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:scroll_down() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:scroll_down() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:scroll_down() then
		return true
	end
end

MenuComponentManager.move_up = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:move_up() then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:move_up() then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:move_up() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:move_up() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:move_up() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:move_up() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:move_up() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:move_up() then
		return true
	end
end

MenuComponentManager.move_down = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:move_down() then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:move_down() then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:move_down() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:move_down() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:move_down() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:move_down() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:move_down() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:move_down() then
		return true
	end
end

MenuComponentManager.move_left = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:move_left() then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:move_left() then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:move_left() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:move_left() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:move_left() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:move_left() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:move_left() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:move_left() then
		return true
	end
end

MenuComponentManager.move_right = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:move_right() then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:move_right() then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:move_right() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:move_right() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:move_right() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:move_right() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:move_right() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:move_right() then
		return true
	end
end

MenuComponentManager.next_page = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:next_page(true) then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:next_page() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:next_page() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:next_page() then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:next_page() then
		return true
	end
	if self:is_preplanning_enabled() and self._preplanning_map:next_page() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:next_page() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:next_page() then
		return true
	end
	if self._ingame_manual_gui and self._ingame_manual_gui:next_page() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:next_page() then
		return true
	end
end

MenuComponentManager.previous_page = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:previous_page(true) then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:previous_page() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:previous_page() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:previous_page() then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:previous_page() then
		return true
	end
	if self:is_preplanning_enabled() and self._preplanning_map:previous_page() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:previous_page() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:previous_page() then
		return true
	end
	if self._ingame_manual_gui and self._ingame_manual_gui:previous_page() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:previous_page() then
		return true
	end
end

MenuComponentManager.confirm_pressed = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:confirm_pressed() then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:confirm_pressed() then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:confirm_pressed() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:confirm_pressed() then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:confirm_pressed() then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:confirm_pressed() then
		return true
	end
	if self:is_preplanning_enabled() and self._preplanning_map:confirm_pressed() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:confirm_pressed() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:confirm_pressed() then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:confirm_pressed() then
		return true
	end
	if Application:production_build() and self._debug_font_gui then
		self._debug_font_gui:toggle()
	end
end

MenuComponentManager.back_pressed = function(self)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:back_pressed() then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:back_pressed() then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:back_pressed() then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:back_pressed() then
		return true
	end
end

MenuComponentManager.special_btn_pressed = function(self, ...)
	if self._game_chat_gui and self._game_chat_gui:input_focus() == true then
		return true
	end
	if self._game_chat_gui and self._game_chat_gui:special_btn_pressed(...) then
		return true
	end
	if self._preplanning_map and self._preplanning_map:special_btn_pressed(...) then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:special_btn_pressed(...) then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:special_btn_pressed(...) then
		return true
	end
	if self._crimenet_contract_gui and self._crimenet_contract_gui:special_btn_pressed(...) then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:special_btn_pressed(...) then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:special_btn_pressed(...) then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:special_btn_pressed(...) then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:special_btn_pressed(...) then
		return true
	end
	if self._crimenet_casino_gui and self._crimenet_casino_gui:special_btn_pressed(...) then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:special_btn_pressed(...) then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:special_btn_pressed(...) then
		return true
	end
end

MenuComponentManager.mouse_pressed = function(self, o, button, x, y)
	if self._game_chat_gui and self._game_chat_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._infamytree_gui and self._infamytree_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._blackmarket_gui and self._blackmarket_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._newsfeed_gui and self._newsfeed_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._profile_gui then
		if self._profile_gui:mouse_pressed(button, x, y) then
			return true
		end
		if button == Idstring("0") then
			if self._profile_gui:check_minimize(x, y) then
				local minimized_data = {text = "PROFILE", help_text = "MAXIMIZE PROFILE WINDOW"}
				self._profile_gui:set_minimized(true, minimized_data)
				return true
			end
		if self._profile_gui:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._profile_gui:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._profile_gui:mouse_wheel_up(x, y) then
		return true
	end
	if self._contract_gui then
		if self._contract_gui:mouse_pressed(button, x, y) then
			return true
		end
		if button == Idstring("0") then
			if self._contract_gui:check_minimize(x, y) then
				local minimized_data = {text = "CONTRACT", help_text = "MAXIMIZE CONTRACT WINDOW"}
				self._contract_gui:set_minimized(true, minimized_data)
				return true
			end
		if self._contract_gui:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._contract_gui:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._contract_gui:mouse_wheel_up(x, y) then
		return true
	end
	if self._server_info_gui then
		if self._server_info_gui:mouse_pressed(button, x, y) then
			return true
		end
		if button == Idstring("0") then
			if self._server_info_gui:check_minimize(x, y) then
				local minimized_data = {text = "SERVER INFO", help_text = "MAXIMIZE SERVER INFO WINDOW"}
				self._server_info_gui:set_minimized(true, minimized_data)
				return true
			end
		if self._server_info_gui:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._server_info_gui:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._server_info_gui:mouse_wheel_up(x, y) then
		return true
	end
	if self._lobby_profile_gui then
		if self._lobby_profile_gui:mouse_pressed(button, x, y) then
			return true
		end
		if button == Idstring("0") then
			if self._lobby_profile_gui:check_minimize(x, y) then
				return true
			end
		if self._lobby_profile_gui:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._lobby_profile_gui:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._lobby_profile_gui:mouse_wheel_up(x, y) then
		return true
	end
	if self._mission_briefing_gui and self._mission_briefing_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._stage_endscreen_gui and self._stage_endscreen_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._lootdrop_gui and self._lootdrop_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._lootdrop_casino_gui and self._lootdrop_casino_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._crimenet_casino_gui and self._crimenet_casino_gui:mouse_pressed(button, x, y) then
		return true
	end
	if self._view_character_profile_gui then
		if self._view_character_profile_gui:mouse_pressed(button, x, y) then
			return true
		end
		if button == Idstring("0") then
			if self._view_character_profile_gui:check_minimize(x, y) then
				return true
			end
		if self._view_character_profile_gui:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._view_character_profile_gui:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._view_character_profile_gui:mouse_wheel_up(x, y) then
		return true
	end
	if self._test_profile1 then
		if self._test_profile1:check_grab_scroll_bar(x, y) then
			return true
		end
		if self._test_profile2:check_grab_scroll_bar(x, y) then
			return true
		end
		if self._test_profile3:check_grab_scroll_bar(x, y) then
			return true
		end
	if self._test_profile4:check_grab_scroll_bar(x, y) then
		end
		return true
	end
	if self._crimenet_contract_gui and self._crimenet_contract_gui:mouse_pressed(o, button, x, y) then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:mouse_pressed(o, button, x, y) then
		return true
	end
	if self:is_preplanning_enabled() and self._preplanning_map:mouse_pressed(button, x, y) then
		return true
	end
	if self._minimized_list and button == Idstring("0") then
		for i,data in ipairs(self._minimized_list) do
			if data.panel:inside(x, y) then
				data.callback(data)
			end
	else
		end
	end
	if self._friends_book then
		if self._friends_book:mouse_pressed(button, x, y) then
			return true
		end
	if button == Idstring("0") and self._friends_book:check_grab_scroll_bar(x, y) then
		end
		return true
	end
	do return end
	if button == Idstring("mouse wheel down") and self._friends_book:mouse_wheel_down(x, y) then
		return true
	end
	do return end
	if button == Idstring("mouse wheel up") and self._friends_book:mouse_wheel_up(x, y) then
		return true
	end
	if self._debug_strings_book then
		if self._debug_strings_book:mouse_pressed(button, x, y) then
			return true
		end
	if button == Idstring("0") and self._debug_strings_book:check_grab_scroll_bar(x, y) then
		end
		return true
	end
	do return end
	if button == Idstring("mouse wheel down") and self._debug_strings_book:mouse_wheel_down(x, y) then
		return true
	end
	do return end
	if button == Idstring("mouse wheel up") and self._debug_strings_book:mouse_wheel_up(x, y) then
		return true
	end
	if self._weapon_text_box then
		if button == Idstring("0") then
			if self._weapon_text_box:check_close(x, y) then
				self:close_weapon_box()
				return true
			end
			if self._weapon_text_box:check_minimize(x, y) then
				self._weapon_text_box:set_visible(false)
				self._weapon_text_minimized_id = self:add_minimized({callback = callback(self, self, "_maximize_weapon_box"), text = "WEAPON"})
				return true
			end
		if self._weapon_text_box:check_grab_scroll_bar(x, y) then
			end
			return true
		end
	else
		if button == Idstring("mouse wheel down") and self._weapon_text_box:mouse_wheel_down(x, y) then
			return true
		end
	end
	do return end
	if button == Idstring("mouse wheel up") and self._weapon_text_box:mouse_wheel_up(x, y) then
		return true
	end
	if self._player_inventory_gui and self._player_inventory_gui:mouse_pressed(button, x, y) then
		return true
	end
end

MenuComponentManager.mouse_clicked = function(self, o, button, x, y)
	if self._blackmarket_gui then
		return self._blackmarket_gui:mouse_clicked(o, button, x, y)
	end
	if self._skilltree_gui then
		return self._skilltree_gui:mouse_clicked(o, button, x, y)
	end
end

MenuComponentManager.mouse_double_click = function(self, o, button, x, y)
	if self._blackmarket_gui then
		return self._blackmarket_gui:mouse_double_click(o, button, x, y)
	end
	if self._skilltree_gui then
		return self._skilltree_gui:mouse_double_click(o, button, x, y)
	end
end

MenuComponentManager.mouse_released = function(self, o, button, x, y)
	if self._game_chat_gui and self._game_chat_gui:mouse_released(o, button, x, y) then
		return true
	end
	if self._crimenet_gui and self._crimenet_gui:mouse_released(o, button, x, y) then
		return true
	end
	if self:is_preplanning_enabled() and self._preplanning_map:mouse_released(button, x, y) then
		return true
	end
	if self._blackmarket_gui then
		return self._blackmarket_gui:mouse_released(button, x, y)
	end
	if self._friends_book and self._friends_book:release_scroll_bar() then
		return true
	end
	if self._skilltree_gui and self._skilltree_gui:mouse_released(button, x, y) then
		return true
	end
	if self._debug_strings_book and self._debug_strings_book:release_scroll_bar() then
		return true
	end
	if self._chat_book then
		local used, pointer = self._chat_book:release_scroll_bar()
	if used then
		end
		return true, pointer
	end
	if self._profile_gui and self._profile_gui:release_scroll_bar() then
		return true
	end
	if self._contract_gui and self._contract_gui:release_scroll_bar() then
		return true
	end
	if self._server_info_gui and self._server_info_gui:release_scroll_bar() then
		return true
	end
	if self._lobby_profile_gui and self._lobby_profile_gui:release_scroll_bar() then
		return true
	end
	if self._view_character_profile_gui and self._view_character_profile_gui:release_scroll_bar() then
		return true
	end
	if self._test_profile1 then
		if self._test_profile1:release_scroll_bar() then
			return true
		end
		if self._test_profile2:release_scroll_bar() then
			return true
		end
		if self._test_profile3:release_scroll_bar() then
			return true
		end
	if self._test_profile4:release_scroll_bar() then
		end
		return true
	end
	if self._weapon_text_box and self._weapon_text_box:release_scroll_bar() then
		return true
	end
	return false
end

MenuComponentManager.mouse_moved = function(self, o, x, y)
	local wanted_pointer = "arrow"
	if self._game_chat_gui then
		local used, pointer = self._game_chat_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._skilltree_gui then
		local used, pointer = self._skilltree_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._infamytree_gui then
		local used, pointer = self._infamytree_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._blackmarket_gui then
		local used, pointer = self._blackmarket_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._crimenet_contract_gui then
		local used, pointer = self._crimenet_contract_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._crimenet_gui then
		local used, pointer = self._crimenet_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self:is_preplanning_enabled() then
		local used, pointer = self._preplanning_map:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._friends_book then
		local used, pointer = self._friends_book:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._friends_book:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._debug_strings_book then
		local used, pointer = self._debug_strings_book:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._debug_strings_book:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._profile_gui then
		local used, pointer = self._profile_gui:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._profile_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._contract_gui then
		local used, pointer = self._contract_gui:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._contract_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._server_info_gui then
		local used, pointer = self._server_info_gui:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._server_info_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._backdrop_gui then
		local used, pointer = self._backdrop_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._mission_briefing_gui then
		local used, pointer = self._mission_briefing_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._stage_endscreen_gui then
		local used, pointer = self._stage_endscreen_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._lootdrop_gui then
		local used, pointer = self._lootdrop_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._lootdrop_casino_gui then
		local used, pointer = self._lootdrop_casino_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._crimenet_casino_gui then
		local used, pointer = self._crimenet_casino_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._lobby_profile_gui then
		local used, pointer = self._lobby_profile_gui:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._lobby_profile_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._view_character_profile_gui then
		local used, pointer = self._view_character_profile_gui:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._view_character_profile_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._test_profile1 then
		local used, pointer = self._test_profile1:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._test_profile2:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._test_profile3:moved_scroll_bar(x, y)
		if used then
			return true, pointer
		end
		local used, pointer = self._test_profile4:moved_scroll_bar(x, y)
	if used then
		end
		return true, pointer
	end
	if self._newsfeed_gui then
		local used, pointer = self._newsfeed_gui:mouse_moved(x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	if self._minimized_list then
		for i,data in ipairs(self._minimized_list) do
			if data.mouse_over ~= data.panel:inside(x, y) then
				data.mouse_over = data.panel:inside(x, y)
				if not data.mouse_over or not tweak_data.menu.default_font_no_outline_id then
					data.text:set_font(Idstring(tweak_data.menu.default_font))
				end
				if not data.mouse_over or not Color.black then
					data.text:set_color(Color.white)
				end
				data.selected:set_visible(data.mouse_over)
				data.help_text:set_visible(data.mouse_over)
			end
			data.help_text:set_position(x + 12, y + 12)
		end
	end
	if self._weapon_text_box and self._weapon_text_box:moved_scroll_bar(x, y) then
		return true, wanted_pointer
	end
	if self._player_inventory_gui then
		local used, pointer = self._player_inventory_gui:mouse_moved(o, x, y)
	if pointer or used then
		end
		return true, wanted_pointer
	end
	return false, wanted_pointer
end

MenuComponentManager.peer_outfit_updated = function(self, peer_id)
	if self._contract_gui then
		self._contract_gui:refresh()
	end
end

MenuComponentManager.on_peer_removed = function(self, peer, reason)
	if self._lootdrop_gui then
		self._lootdrop_gui:on_peer_removed(peer, reason)
	end
	if self._lootdrop_casino_gui then
		self._lootdrop_casino_gui:on_peer_removed(peer, reason)
	end
	if self._contract_gui then
		self._contract_gui:refresh()
	end
end

MenuComponentManager._create_crimenet_contract_gui = function(self, node)
	self:close_crimenet_contract_gui()
	self._crimenet_contract_gui = CrimeNetContractGui:new(self._ws, self._fullscreen_ws, node)
	self:disable_crimenet()
end

MenuComponentManager.close_crimenet_contract_gui = function(self, ...)
	if self._crimenet_contract_gui then
		self._crimenet_contract_gui:close()
		self._crimenet_contract_gui = nil
		self:enable_crimenet()
	end
end

MenuComponentManager.set_crimenet_contract_difficulty_id = function(self, difficulty_id)
	if self._crimenet_contract_gui then
		self._crimenet_contract_gui:set_difficulty_id(difficulty_id)
	end
end

MenuComponentManager._create_crimenet_filters_gui = function(self, node)
	self:close_crimenet_filters_gui()
	self._crimenet_filters_gui = CrimeNetFiltersGui:new(self._ws, self._fullscreen_ws, node)
	self:disable_crimenet()
end

MenuComponentManager.close_crimenet_filters_gui = function(self, ...)
	if self._crimenet_filters_gui then
		self._crimenet_filters_gui:close()
		self._crimenet_filters_gui = nil
		self:enable_crimenet()
	end
end

MenuComponentManager._create_crimenet_casino_gui = function(self, node)
	self:close_crimenet_casino_gui()
	self._crimenet_casino_gui = CrimeNetCasinoGui:new(self._ws, self._fullscreen_ws, node)
	self:disable_crimenet()
end

MenuComponentManager.close_crimenet_casino_gui = function(self, ...)
	if self._crimenet_casino_gui then
		self._crimenet_casino_gui:close()
		self._crimenet_casino_gui = nil
		self:enable_crimenet()
	end
end

MenuComponentManager.can_afford = function(self)
	if self._crimenet_casino_gui then
		self._crimenet_casino_gui:can_afford()
	end
end

MenuComponentManager._create_crimenet_gui = function(self, ...)
	if self._crimenet_gui then
		return 
	end
	self._crimenet_gui = CrimeNetGui:new(self._ws, self._fullscreen_ws, ...)
end

MenuComponentManager.start_crimenet_job = function(self)
	self:enable_crimenet()
	if self._crimenet_gui then
		self._crimenet_gui:start_job()
	end
end

MenuComponentManager.enable_crimenet = function(self)
	self._set_crimenet_enabled = (self._set_crimenet_enabled == nil and true)
end

MenuComponentManager.disable_crimenet = function(self)
	self._set_crimenet_enabled = (self._set_crimenet_enabled == nil and false)
end

MenuComponentManager.update_crimenet_gui = function(self, t, dt)
	if self._crimenet_gui then
		self._crimenet_gui:update(t, dt)
	end
end

MenuComponentManager.update_crimenet_job = function(self, ...)
	self._crimenet_gui:update_job(...)
end

MenuComponentManager.feed_crimenet_job_timer = function(self, ...)
	self._crimenet_gui:feed_timer(...)
end

MenuComponentManager.update_crimenet_server_job = function(self, ...)
	if self._crimenet_gui then
		self._crimenet_gui:update_server_job(...)
	end
end

MenuComponentManager.feed_crimenet_server_timer = function(self, ...)
	self._crimenet_gui:feed_server_timer(...)
end

MenuComponentManager.criment_goto_lobby = function(self, ...)
	if self._crimenet_gui then
		self._crimenet_gui:goto_lobby(...)
	end
end

MenuComponentManager.set_crimenet_players_online = function(self, amount)
	if self._crimenet_gui then
		self._crimenet_gui:set_players_online(amount)
	end
end

MenuComponentManager.add_crimenet_gui_preset_job = function(self, id)
	if self._crimenet_gui then
		self._crimenet_gui:add_preset_job(id)
	end
end

MenuComponentManager.add_crimenet_server_job = function(self, ...)
	if self._crimenet_gui then
		self._crimenet_gui:add_server_job(...)
	end
end

MenuComponentManager.remove_crimenet_gui_job = function(self, id)
	if self._crimenet_gui then
		self._crimenet_gui:remove_job(id)
	end
end

MenuComponentManager.set_crimenet_gui_getting_hacked = function(self, hacked)
	if self._crimenet_gui then
		self._crimenet_gui:set_getting_hacked(hacked)
	end
end

MenuComponentManager.has_crimenet_gui = function(self)
	return not not self._crimenet_gui
end

MenuComponentManager.has_blackmarket_gui = function(self)
	return not not self._blackmarket_gui
end

MenuComponentManager.close_crimenet_gui = function(self)
	if self._crimenet_gui then
		self._crimenet_gui:close()
		self._crimenet_gui = nil
	end
end

MenuComponentManager.create_weapon_box = function(self, w_id, params)
	local title = managers.localization:text(tweak_data.weapon[w_id].name_id)
	local text = managers.localization:text(tweak_data.weapon[w_id].description_id)
	local stats_list = {
{type = "bar", text = "DAMAGE: 32(+6)", current = 32, total = 50}, 
{type = "empty", h = 2}, 
{type = "bar", text = "RELOAD SPEED: 4(-2)", current = 4, total = 20}, 
{type = "empty", h = 2}, 
{type = "bar", text = "RECOIL: 8 (+0)", current = 8, total = 10}, 
{type = "empty", h = 2}, 
{type = "condition", value = params.condition or 19}, 
{type = "empty", h = 10}, 
{type = "mods", 
list = {"SHORTENED BARREL", "SPEEDHOLSTER SLING", "ONMILTE TRITIUM SIGHTS"}}, 
{type = "empty", h = 10}}
	if self._weapon_text_box then
		self._weapon_text_box:recreate_text_box(self._ws, title, text, {stats_list = stats_list}, {type = "weapon_stats", no_close_legend = true, use_minimize_legend = true})
	else
		self._weapon_text_box = TextBoxGui:new(self._ws, title, text, {stats_list = stats_list}, {type = "weapon_stats", no_close_legend = true, use_minimize_legend = true})
	end
end

MenuComponentManager.close_weapon_box = function(self)
	if self._weapon_text_box then
		self._weapon_text_box:close()
	end
	self._weapon_text_box = nil
	if self._weapon_text_minimized_id then
		self:remove_minimized(self._weapon_text_minimized_id)
		self._weapon_text_minimized_id = nil
	end
end

MenuComponentManager._create_chat_gui = function(self)
	if SystemInfo:platform() == Idstring("WIN32") and MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		self._preplanning_chat_gui_active = false
		self._lobby_chat_gui_active = false
		self._crimenet_chat_gui_active = false
		if self._game_chat_gui then
			self:show_game_chat_gui()
		else
			self:add_game_chat()
		end
		self._game_chat_gui:set_params(self._saved_game_chat_params or "default")
		self._saved_game_chat_params = nil
	end
end

MenuComponentManager._create_lobby_chat_gui = function(self)
	if SystemInfo:platform() == Idstring("WIN32") and MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		self._preplanning_chat_gui_active = false
		self._lobby_chat_gui_active = true
		self._crimenet_chat_gui_active = false
		if self._game_chat_gui then
			self:show_game_chat_gui()
		else
			self:add_game_chat()
		end
		self._game_chat_gui:set_params(self._saved_game_chat_params or "lobby")
		self._saved_game_chat_params = nil
	end
end

MenuComponentManager._create_crimenet_chats_gui = function(self)
	if SystemInfo:platform() == Idstring("WIN32") and MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		self._preplanning_chat_gui_active = false
		self._crimenet_chat_gui_active = true
		self._lobby_chat_gui_active = false
		if self._game_chat_gui then
			self:show_game_chat_gui()
		else
			self:add_game_chat()
		end
		self._game_chat_gui:set_params(self._saved_game_chat_params or "crimenet")
		self._saved_game_chat_params = nil
	end
end

MenuComponentManager._create_preplanning_chats_gui = function(self)
	if SystemInfo:platform() == Idstring("WIN32") and MenuCallbackHandler:is_multiplayer() and managers.network:session() then
		self._preplanning_chat_gui_active = true
		self._crimenet_chat_gui_active = false
		self._lobby_chat_gui_active = false
		if self._game_chat_gui then
			self:show_game_chat_gui()
		else
			self:add_game_chat()
		end
		self._game_chat_gui:set_params(self._saved_game_chat_params or "preplanning")
		self._saved_game_chat_params = nil
	end
end

MenuComponentManager.create_chat_gui = function(self)
	self:close_chat_gui()
	local config = {w = 540, h = 220, x = 290, no_close_legend = true, use_minimize_legend = true, header_type = "fit"}
	self._chat_book = BookBoxGui:new(self._ws, nil, config)
	self._chat_book:set_layer(8)
	local global_gui = ChatGui:new(self._ws, "Global", "")
	global_gui:set_channel_id(ChatManager.GLOBAL)
	global_gui:set_layer(self._chat_book:layer())
	self._chat_book:add_page("Global", global_gui, false)
	self._chat_book:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager.add_game_chat = function(self)
	if SystemInfo:platform() == Idstring("WIN32") then
		self._game_chat_gui = ChatGui:new(self._ws)
	if self._game_chat_params then
		end
		self._game_chat_gui:set_params(self._game_chat_params)
		self._game_chat_params = nil
	end
end

MenuComponentManager.set_max_lines_game_chat = function(self, max_lines)
	if self._game_chat_gui then
		self._game_chat_gui:set_max_lines(max_lines)
	elseif not self._game_chat_params then
		self._game_chat_params = {}
	end
	self._game_chat_params.max_lines = max_lines
end

MenuComponentManager.pre_set_game_chat_leftbottom = function(self, from_left, from_bottom)
	if self._game_chat_gui then
		self._game_chat_gui:set_leftbottom(from_left, from_bottom)
	elseif not self._game_chat_params then
		self._game_chat_params = {}
	end
	self._game_chat_params.left = from_left
	self._game_chat_params.bottom = from_bottom
end

MenuComponentManager.remove_game_chat = function(self)
	if not self._chat_book then
		return 
	end
	self._chat_book:remove_page("Game")
end

MenuComponentManager.hide_lobby_chat_gui = function(self)
	if self._game_chat_gui and self._lobby_chat_gui_active then
		self._game_chat_gui:hide()
	end
end

MenuComponentManager.hide_crimenet_chat_gui = function(self)
	if self._game_chat_gui and self._crimenet_chat_gui_active then
		self._game_chat_gui:hide()
	end
end

MenuComponentManager.hide_preplanning_chat_gui = function(self)
	if self._game_chat_gui and self._preplanning_chat_gui_active then
		self._game_chat_gui:hide()
	end
end

MenuComponentManager.hide_game_chat_gui = function(self)
	if self._game_chat_gui then
		self._game_chat_gui:hide()
	end
end

MenuComponentManager.show_game_chat_gui = function(self)
	if self._game_chat_gui then
		self._game_chat_gui:show()
	end
end

MenuComponentManager._disable_chat_gui = function(self)
	if self._game_chat_gui and not self._lobby_chat_gui_active and not self._crimenet_chat_gui_active and not self._preplanning_chat_gui_active then
		self._game_chat_gui:set_enabled(false)
	end
end

MenuComponentManager.close_chat_gui = function(self)
	if self._game_chat_gui then
		self._game_chat_gui:close()
		self._game_chat_gui = nil
	end
	if self._chat_book_minimized_id then
		self:remove_minimized(self._chat_book_minimized_id)
		self._chat_book_minimized_id = nil
	end
	self._game_chat_bottom = nil
	self._lobby_chat_gui_active = nil
	self._crimenet_chat_gui_active = nil
	self._preplanning_chat_gui_active = nil
end

MenuComponentManager.set_crimenet_chat_gui = function(self, state)
	if self._game_chat_gui then
		self._game_chat_gui:set_crimenet_chat(state)
	end
end

MenuComponentManager._create_friends_gui = function(self)
	if SystemInfo:platform() == Idstring("WIN32") then
		if self._friends_book then
			self._friends_book:set_enabled(true)
			return 
		end
		self:create_friends_gui()
	end
end

MenuComponentManager.create_friends_gui = function(self)
	self:close_friends_gui()
	self._friends_book = BookBoxGui:new(self._ws, nil, {no_close_legend = true, no_scroll_legend = true})
	self._friends_gui = FriendsBoxGui:new(self._ws, "Friends", "")
	self._friends2_gui = FriendsBoxGui:new(self._ws, "Test", "", nil, nil, "recent")
	self._friends3_gui = FriendsBoxGui:new(self._ws, "Test", "")
	self._friends_book:add_page("Friends", self._friends_gui, true)
	self._friends_book:add_page("Recent Players", self._friends2_gui)
	self._friends_book:add_page("Clan", self._friends3_gui)
	self._friends_book:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager._update_friends_gui = function(self)
	if self._friends_gui then
		self._friends_gui:update_friends()
	end
end

MenuComponentManager._disable_friends_gui = function(self)
	if self._friends_book then
		self._friends_book:set_enabled(false)
	end
end

MenuComponentManager.close_friends_gui = function(self)
	if self._friends_gui then
		self._friends_gui = nil
	end
	if self._friends_book then
		self._friends_book:close()
		self._friends_book = nil
	end
end

MenuComponentManager._create_contract_gui = function(self)
	if self._contract_gui then
		self._contract_gui:set_enabled(true)
		return 
	end
	self:create_contract_gui()
end

MenuComponentManager.create_contract_gui = function(self)
	self:close_contract_gui()
	self._contract_gui = ContractBoxGui:new(self._ws, self._fullscreen_ws)
	if not managers.menu:get_all_peers_state() then
		local peers_state = {}
	end
	for i = 1, 4 do
		self._contract_gui:update_character_menu_state(i, peers_state[i])
	end
end

MenuComponentManager.update_contract_character = function(self, peer_id)
	if self._contract_gui then
		self._contract_gui:update_character(peer_id)
	end
end

MenuComponentManager.update_contract_character_menu_state = function(self, peer_id, state)
	if self._contract_gui then
		self._contract_gui:update_character_menu_state(peer_id, state)
		self._contract_gui:update_bg_state(peer_id, state)
	end
end

MenuComponentManager.show_contract_character = function(self, state)
	if self._contract_gui then
		for i = 1, 4 do
			self._contract_gui:set_character_panel_alpha(i, state and 1 or 0.4)
		end
	end
end

MenuComponentManager._disable_contract_gui = function(self)
	if self._contract_gui then
		self._contract_gui:set_enabled(false)
	end
end

MenuComponentManager.close_contract_gui = function(self)
	if self._contract_gui then
		self._contract_gui:close()
		self._contract_gui = nil
	end
end

MenuComponentManager._create_skilltree_gui = function(self, node)
	self:create_skilltree_gui(node)
end

MenuComponentManager.create_skilltree_gui = function(self, node)
	self:close_skilltree_gui()
	self._skilltree_gui = SkillTreeGui:new(self._ws, self._fullscreen_ws, node)
	self:enable_skilltree_gui()
end

MenuComponentManager.close_skilltree_gui = function(self)
	if self._skilltree_gui then
		self._skilltree_gui:close()
		self._skilltree_gui = nil
	end
end

MenuComponentManager.enable_skilltree_gui = function(self)
	if self._skilltree_gui then
		self._skilltree_gui:enable()
	end
end

MenuComponentManager.disable_skilltree_gui = function(self)
	if self._skilltree_gui then
		self._skilltree_gui:disable()
	end
end

MenuComponentManager.on_tier_unlocked = function(self, ...)
	if self._skilltree_gui then
		self._skilltree_gui:on_tier_unlocked(...)
	end
end

MenuComponentManager.on_skill_unlocked = function(self, ...)
	if self._skilltree_gui then
		self._skilltree_gui:on_skill_unlocked(...)
	end
end

MenuComponentManager.on_points_spent = function(self, ...)
	if self._skilltree_gui then
		self._skilltree_gui:on_points_spent(...)
	end
end

MenuComponentManager.on_skilltree_reset = function(self, ...)
	if self._skilltree_gui then
		self._skilltree_gui:on_skilltree_reset(...)
	end
end

MenuComponentManager._create_infamytree_gui = function(self)
	self:create_infamytree_gui()
end

MenuComponentManager.create_infamytree_gui = function(self, node)
	self:close_infamytree_gui()
	self._infamytree_gui = InfamyTreeGui:new(self._ws, self._fullscreen_ws, node)
end

MenuComponentManager.close_infamytree_gui = function(self)
	if self._infamytree_gui then
		self._infamytree_gui:close()
		self._infamytree_gui = nil
	end
end

MenuComponentManager._create_inventory_list_gui = function(self, node)
	self:create_inventory_list_gui(node)
end

MenuComponentManager.create_inventory_list_gui = function(self, node)
	self:close_inventory_list_gui()
	self._inventory_list_gui = InventoryList:new(self._ws, self._fullscreen_ws, node)
end

MenuComponentManager.close_inventory_list_gui = function(self)
	if self._inventory_list_gui then
		self._inventory_list_gui:close()
		self._inventory_list_gui = nil
	end
end

MenuComponentManager._create_blackmarket_gui = function(self, node)
	self:create_blackmarket_gui(node)
end

MenuComponentManager.create_blackmarket_gui = function(self, node)
	if not node then
		return 
	end
	if node:parameters().set_blackmarket_enabled == nil then
		self:close_blackmarket_gui()
	end
	if not self._blackmarket_gui then
		self._blackmarket_gui = BlackMarketGui:new(self._ws, self._fullscreen_ws, node)
	end
	if node:parameters().set_blackmarket_enabled ~= nil then
		self._blackmarket_gui:set_enabled(node:parameters().set_blackmarket_enabled)
	end
end

MenuComponentManager.set_blackmarket_tab_positions = function(self)
	if self._blackmarket_gui then
		self._blackmarket_gui:set_tab_positions()
	end
end

MenuComponentManager.reload_blackmarket_gui = function(self)
	if self._blackmarket_gui and not self._blackmarket_gui:in_setup() then
		self._blackmarket_gui:reload()
	end
end

MenuComponentManager.close_blackmarket_gui = function(self)
	if self._blackmarket_gui then
		self._blackmarket_gui:close()
		self._blackmarket_gui = nil
	end
end

MenuComponentManager.set_blackmarket_enabled = function(self, enabled)
	if self._blackmarket_gui then
		self._blackmarket_gui:set_enabled(enabled)
	end
end

MenuComponentManager.set_blackmarket_disable_fetching = function(self, disabled)
	self._blackmarket_disable_fetching = disabled
end

MenuComponentManager.blackmarket_fetching_disable = function(self)
	return self._blackmarket_disable_fetching
end

MenuComponentManager.hide_blackmarket_gui = function(self)
	if self._blackmarket_gui then
		self._blackmarket_gui:hide()
	end
end

MenuComponentManager.show_blackmarket_gui = function(self)
	if self._blackmarket_gui then
		self._blackmarket_gui:show()
	end
end

MenuComponentManager.get_bonus_stats_blackmarket_gui = function(self, cosmetic_id, weapon_id, bonus)
	if self._blackmarket_gui then
		return self._blackmarket_gui:get_bonus_stats(cosmetic_id, weapon_id, bonus)
	end
end

MenuComponentManager._create_server_info_gui = function(self)
	if self._server_info_gui then
		self:close_server_info_gui()
	end
	self:create_server_info_gui()
end

MenuComponentManager.create_server_info_gui = function(self)
	self:close_server_info_gui()
	self._server_info_gui = ServerStatusBoxGui:new(self._ws)
	self._server_info_gui:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager._disable_server_info_gui = function(self)
	if self._server_info_gui then
		self._server_info_gui:set_enabled(false)
	end
end

MenuComponentManager.close_server_info_gui = function(self)
	if self._server_info_gui then
		self._server_info_gui:close()
		self._server_info_gui = nil
	end
end

MenuComponentManager.set_server_info_state = function(self, state)
	if self._server_info_gui then
		self._server_info_gui:set_server_info_state(state)
	end
end

MenuComponentManager._create_mission_briefing_gui = function(self, node)
	self:create_mission_briefing_gui(node)
end

MenuComponentManager.create_mission_briefing_gui = function(self, node)
	if not self._mission_briefing_gui then
		self._mission_briefing_gui = MissionBriefingGui:new(self._ws, self._fullscreen_ws, node)
		if managers.groupai and managers.groupai:state() and not self._whisper_listener then
			self._whisper_listener = "MenuComponentManager_whisper_mode"
			managers.groupai:state():add_listener(self._whisper_listener, {"whisper_mode"}, callback(self, self, "on_whisper_mode_changed"))
		end
	else
		self._mission_briefing_gui:reload_loadout()
	end
	self._mission_briefing_gui:show()
end

MenuComponentManager._hide_mission_briefing_gui = function(self)
	self:hide_mission_briefing_gui()
end

MenuComponentManager.hide_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:hide()
	end
end

MenuComponentManager.show_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:show()
	end
end

MenuComponentManager.close_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:close()
		self._mission_briefing_gui = nil
	if self._whisper_listener then
		end
		managers.groupai:state():remove_listener(self._whisper_listener)
		self._whisper_listener = nil
	end
end

MenuComponentManager.update_mission_briefing_tab_positions = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:update_tab_positions()
		self._mission_briefing_update_tab_wanted = nil
	else
		self._mission_briefing_update_tab_wanted = true
	end
end

MenuComponentManager.on_whisper_mode_changed = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:on_whisper_mode_changed()
		local hud = managers.hud:get_mission_briefing_hud()
	if hud then
		end
		hud:on_whisper_mode_changed()
	end
end

MenuComponentManager.set_mission_briefing_description = function(self, text_id)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:set_description_text_id(text_id)
	end
end

MenuComponentManager.on_ready_pressed_mission_briefing_gui = function(self, ready)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:on_ready_pressed(ready)
	end
end

MenuComponentManager.disable_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:set_enabled(false)
	end
end

MenuComponentManager.unlock_asset_mission_briefing_gui = function(self, asset_id)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:unlock_asset(asset_id)
	end
end

MenuComponentManager.set_slot_outfit_mission_briefing_gui = function(self, slot, criminal_name, outfit)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:set_slot_outfit(slot, criminal_name, outfit)
	end
end

MenuComponentManager.create_asset_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:create_asset_tab()
	end
end

MenuComponentManager.close_asset_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:close_asset()
	end
end

MenuComponentManager.flash_ready_mission_briefing_gui = function(self)
	if self._mission_briefing_gui then
		self._mission_briefing_gui:flash_ready()
	end
end

MenuComponentManager._create_lootdrop_gui = function(self)
	self:create_lootdrop_gui()
end

MenuComponentManager.create_lootdrop_gui = function(self)
	if not self._lootdrop_gui then
		self._lootdrop_gui = LootDropScreenGui:new(self._ws, self._fullscreen_ws, managers.hud:get_lootscreen_hud(), self._saved_lootdrop_state)
		self._saved_lootdrop_state = nil
	end
	self:show_lootdrop_gui()
end

MenuComponentManager.set_lootdrop_state = function(self, state)
	if self._lootdrop_gui then
		self._lootdrop_gui:set_state(state)
	else
		self._saved_lootdrop_state = state
	end
end

MenuComponentManager._hide_lootdrop_gui = function(self)
	self:hide_lootdrop_gui()
end

MenuComponentManager.hide_lootdrop_gui = function(self)
	if self._lootdrop_gui then
		self._lootdrop_gui:hide()
	end
end

MenuComponentManager.show_lootdrop_gui = function(self)
	if self._lootdrop_gui then
		self._lootdrop_gui:show()
	end
end

MenuComponentManager.close_lootdrop_gui = function(self)
	if self._lootdrop_gui then
		self._lootdrop_gui:close()
		self._lootdrop_gui = nil
	end
end

MenuComponentManager.lootdrop_is_now_active = function(self)
	if self._lootdrop_gui then
		self._lootdrop_gui._panel:show()
		self._lootdrop_gui._fullscreen_panel:show()
	end
end

MenuComponentManager._create_lootdrop_casino_gui = function(self, node)
	self:create_lootdrop_casino_gui(node)
end

MenuComponentManager.create_lootdrop_casino_gui = function(self, node)
	if not self._lootdrop_casino_gui then
		if not node:parameters().menu_component_data then
			local casino_data = {}
		end
		local card_secured = casino_data.secure_cards or 0
		local card_drops = {}
		card_drops[1] = (math.random(3) <= card_secured and casino_data.preferred_item)
		card_drops[2] = (((not card_drops[1] or not card_secured - 1) and card_secured ~= 2) or not managers.lootdrop:specific_fake_loot_pc(casino_data.preferred_item)) and card_secured == 1 and card_secured ~= math.random(3)
		card_drops[3] = (((card_drops[2] and card_secured - 1) or card_secured > 0) and managers.lootdrop:specific_fake_loot_pc(casino_data.preferred_item))
		local skip_types = {cash = true, xp = true}
		local setup_lootdrop_data = {}
		setup_lootdrop_data.preferred_type = casino_data.preferred_item
		setup_lootdrop_data.preferred_type_drop = card_drops[1]
		setup_lootdrop_data.preferred_chance = tweak_data:get_value("casino", "prefer_chance")
		if casino_data.increase_infamous then
			setup_lootdrop_data.increase_infamous = tweak_data:get_value("casino", "infamous_chance")
		end
		setup_lootdrop_data.skip_types = skip_types
		setup_lootdrop_data.disable_difficulty = true
		setup_lootdrop_data.max_pcs = 1
		local new_lootdrop_data = {}
		managers.lootdrop:new_make_drop(new_lootdrop_data, setup_lootdrop_data)
		local global_values = {normal = 1, superior = 2, exceptional = 3, infamous = 4}
		local peer = managers.network:session() and managers.network:session():local_peer() or false
		local global_value = global_values[new_lootdrop_data.global_value] or 1
		local item_category = new_lootdrop_data.type_items
		local item_id = new_lootdrop_data.item_entry
		local max_pc = new_lootdrop_data.total_stars
		if not new_lootdrop_data.joker or not 0 then
			local item_pc = math.ceil(new_lootdrop_data.item_payclass / 10)
		end
		if not managers.lootdrop:can_drop_weapon_mods() then
			skip_types.weapon_mods = true
			if not card_drops[2] then
				local card_left_pc = managers.lootdrop:new_fake_loot_pc(nil, skip_types)
			end
			if not card_drops[3] then
				local card_right_pc = managers.lootdrop:new_fake_loot_pc(nil, skip_types)
			end
			local lootdrop_data = {peer, new_lootdrop_data.global_value, item_category, item_id, max_pc, item_pc, card_left_pc, card_right_pc}
			local selected_card = {}
			selected_card[peer and peer:id() or 1] = 2
			local parent_layer = managers.menu:active_menu() and managers.menu:active_menu().renderer:selected_node() and managers.menu:active_menu().renderer:selected_node():layer() or 100
			self._lootscreen_casino_hud = HUDLootScreen:new(nil, self._fullscreen_ws, nil, selected_card)
			self._lootscreen_casino_hud:set_layer(parent_layer + 1)
			self._lootscreen_casino_hud:show()
			self._lootdrop_casino_gui = CasinoLootDropScreenGui:new(self._ws, self._fullscreen_ws, self._lootscreen_casino_hud)
			self._lootdrop_casino_gui:set_layer(parent_layer + 1)
			self._lootscreen_casino_hud:make_cards(peer, max_pc, card_left_pc, card_right_pc)
			self._lootscreen_casino_hud:make_lootdrop(lootdrop_data)
		if not managers.menu:is_pc_controller() then
			end
			managers.menu:active_menu().input:deactivate_controller_mouse()
		end
		if self._lootdrop_casino_gui then
			self:disable_crimenet()
			self._lootdrop_casino_gui:show()
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 154 
end

MenuComponentManager.close_lootdrop_casino_gui = function(self)
	if self._lootdrop_casino_gui then
		self._lootdrop_casino_gui:close()
		self._lootdrop_casino_gui = nil
		self:enable_crimenet()
	end
	if self._lootscreen_casino_hud then
		self._lootscreen_casino_hud:close()
		self._lootscreen_casino_hud = nil
	if not managers.menu:is_pc_controller() then
		end
		managers.menu:active_menu().input:activate_controller_mouse()
	end
end

MenuComponentManager.check_lootdrop_casino_done = function(self)
	return self._lootdrop_casino_gui:card_chosen()
end

MenuComponentManager._create_stage_endscreen_gui = function(self)
	self:create_stage_endscreen_gui()
end

MenuComponentManager.create_stage_endscreen_gui = function(self)
	if not self._stage_endscreen_gui then
		self._stage_endscreen_gui = StageEndScreenGui:new(self._ws, self._fullscreen_ws)
	end
	game_state_machine:current_state():set_continue_button_text()
	self._stage_endscreen_gui:show()
	if self._endscreen_predata then
		if self._endscreen_predata.cash_summary then
			self:show_endscreen_cash_summary()
		end
		if self._endscreen_predata.stats then
			self:feed_endscreen_statistics(self._endscreen_predata.stats)
		end
		if self._endscreen_predata.continue then
			self:set_endscreen_continue_button_text(self._endscreen_predata.continue[1], self._endscreen_predata.continue[2])
		end
		self._endscreen_predata = nil
	end
end

MenuComponentManager._hide_stage_endscreen_gui = function(self)
	self:hide_stage_endscreen_gui()
end

MenuComponentManager.hide_stage_endscreen_gui = function(self)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:hide()
	end
end

MenuComponentManager.show_stage_endscreen_gui = function(self)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:show()
	end
end

MenuComponentManager.close_stage_endscreen_gui = function(self)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:close()
		self._stage_endscreen_gui = nil
	end
end

MenuComponentManager.show_endscreen_cash_summary = function(self)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:show_cash_summary()
	elseif not self._endscreen_predata then
		self._endscreen_predata = {}
	end
	self._endscreen_predata.cash_summary = true
end

MenuComponentManager.feed_endscreen_statistics = function(self, data)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:feed_statistics(data)
	elseif not self._endscreen_predata then
		self._endscreen_predata = {}
	end
	self._endscreen_predata.stats = data
end

MenuComponentManager.set_endscreen_continue_button_text = function(self, text, not_clickable)
	if self._stage_endscreen_gui then
		self._stage_endscreen_gui:set_continue_button_text(text, not_clickable)
	elseif not self._endscreen_predata then
		self._endscreen_predata = {}
	end
	self._endscreen_predata.continue = {text, not_clickable}
end

MenuComponentManager._create_menuscene_info_gui = function(self, node)
	self:_close_menuscene_info_gui()
	if not self._menuscene_info_gui then
		self._menuscene_info_gui = MenuSceneGui:new(self._ws, self._fullscreen_ws, node)
	end
end

MenuComponentManager._close_menuscene_info_gui = function(self)
	if self._menuscene_info_gui then
		self._menuscene_info_gui:close()
		self._menuscene_info_gui = nil
	end
end

MenuComponentManager._create_player_profile_gui = function(self)
	self:create_player_profile_gui()
end

MenuComponentManager.create_player_profile_gui = function(self)
	self:close_player_profile_gui()
	self._player_profile_gui = PlayerProfileGuiObject:new(self._ws)
end

MenuComponentManager.refresh_player_profile_gui = function(self)
	if self._player_profile_gui then
		self:create_player_profile_gui()
	end
end

MenuComponentManager.close_player_profile_gui = function(self)
	if self._player_profile_gui then
		self._player_profile_gui:close()
		self._player_profile_gui = nil
	end
end

MenuComponentManager._create_ingame_manual_gui = function(self)
	self:create_ingame_manual_gui()
end

MenuComponentManager.create_ingame_manual_gui = function(self)
	self:close_ingame_manual_gui()
	self._ingame_manual_gui = IngameManualGui:new(self._ws, self._fullscreen_ws)
	self._ingame_manual_gui:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager.ingame_manual_texture_done = function(self, texture_ids)
	if self._ingame_manual_gui then
		self._ingame_manual_gui:create_page(texture_ids)
	else
		local destroy_me = self._ws:panel():bitmap({texture = texture_ids, visible = false, w = 0, h = 0})
		destroy_me:parent():remove(destroy_me)
	end
end

MenuComponentManager.close_ingame_manual_gui = function(self)
	if self._ingame_manual_gui then
		self._ingame_manual_gui:close()
		self._ingame_manual_gui = nil
	end
end

MenuComponentManager._create_ingame_contract_gui = function(self)
	self:create_ingame_contract_gui()
end

MenuComponentManager.create_ingame_contract_gui = function(self)
	self:close_ingame_contract_gui()
	self._ingame_contract_gui = IngameContractGui:new(self._ws)
	self._ingame_contract_gui:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager.close_ingame_contract_gui = function(self)
	if self._ingame_contract_gui then
		self._ingame_contract_gui:close()
		self._ingame_contract_gui = nil
	end
end

MenuComponentManager._create_profile_gui = function(self)
	if self._profile_gui then
		self._profile_gui:set_enabled(true)
		return 
	end
	self:create_profile_gui()
end

MenuComponentManager.create_profile_gui = function(self)
	self:close_profile_gui()
	self._profile_gui = ProfileBoxGui:new(self._ws)
	self._profile_gui:set_layer(tweak_data.gui.MENU_COMPONENT_LAYER)
end

MenuComponentManager._disable_profile_gui = function(self)
	if self._profile_gui then
		self._profile_gui:set_enabled(false)
	end
end

MenuComponentManager.close_profile_gui = function(self)
	if self._profile_gui then
		self._profile_gui:close()
		self._profile_gui = nil
	end
end

MenuComponentManager.create_test_profiles = function(self)
	self:close_test_profiles()
	self._test_profile1 = ProfileBoxGui:new(self._ws)
	self._test_profile1:set_title("")
	self._test_profile1:set_use_minimize_legend(false)
	self._test_profile2 = ProfileBoxGui:new(self._ws)
	self._test_profile2:set_title("")
	self._test_profile2:set_use_minimize_legend(false)
	self._test_profile3 = ProfileBoxGui:new(self._ws)
	self._test_profile3:set_title("")
	self._test_profile3:set_use_minimize_legend(false)
	self._test_profile4 = ProfileBoxGui:new(self._ws)
	self._test_profile4:set_title("")
	self._test_profile4:set_use_minimize_legend(false)
end

MenuComponentManager.close_test_profiles = function(self)
	if self._test_profile1 then
		self._test_profile1:close()
		self._test_profile1 = nil
		self._test_profile2:close()
		self._test_profile2 = nil
		self._test_profile3:close()
		self._test_profile3 = nil
		self._test_profile4:close()
		self._test_profile4 = nil
	end
end

MenuComponentManager.create_lobby_profile_gui = function(self, peer_id, x, y)
	self:close_lobby_profile_gui()
	self._lobby_profile_gui = LobbyProfileBoxGui:new(self._ws, nil, nil, nil, {h = 160, x = x, y = y}, peer_id)
	self._lobby_profile_gui:set_title(nil)
	self._lobby_profile_gui:set_use_minimize_legend(false)
end

MenuComponentManager.close_lobby_profile_gui = function(self)
	if self._lobby_profile_gui then
		self._lobby_profile_gui:close()
		self._lobby_profile_gui = nil
	end
	if self._lobby_profile_gui_minimized_id then
		self:remove_minimized(self._lobby_profile_gui_minimized_id)
		self._lobby_profile_gui_minimized_id = nil
	end
end

MenuComponentManager.create_view_character_profile_gui = function(self, user, x, y)
	self:close_view_character_profile_gui()
	self._view_character_profile_gui = ViewCharacterProfileBoxGui:new(self._ws, nil, nil, nil, {h = 160, w = 360, x = 837, y = 100}, user)
	self._view_character_profile_gui:set_title(nil)
	self._view_character_profile_gui:set_use_minimize_legend(false)
end

MenuComponentManager.close_view_character_profile_gui = function(self)
	if self._view_character_profile_gui then
		self._view_character_profile_gui:close()
		self._view_character_profile_gui = nil
	end
	if self._view_character_profile_gui_minimized_id then
		self:remove_minimized(self._view_character_profile_gui_minimized_id)
		self._view_character_profile_gui_minimized_id = nil
	end
end

MenuComponentManager.get_texture_from_mod_type = function(self, type, sub_type, gadget, silencer, is_auto, equipped, mods, types, is_a_path)
	local texture = nil
	if is_a_path then
		texture = type
	elseif silencer then
		texture = "guis/textures/pd2/blackmarket/inv_mod_silencer"
	elseif type == "gadget" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. (gadget or "flashlight")
	elseif type == "upper_reciever" or type == "lower_reciever" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_custom"
	elseif type == "custom" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. (sub_type or (is_auto and "autofire") or "singlefire")
	elseif type == "sight" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_scope"
	elseif type == "ammo" then
		if not sub_type then
			texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(not equipped or type)
			do return end
			if mods and #mods > 0 then
				local weapon_factory_tweak_data = tweak_data.weapon.factory.parts
				local part_id = mods[1][1]
				type = weapon_factory_tweak_data[part_id].type
				sub_type = weapon_factory_tweak_data[part_id].sub_type
				texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(sub_type or type)
			end
			texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(sub_type or type)
		elseif type == "bonus" then
			if not sub_type then
				texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(not equipped or type)
				do return end
				texture = "guis/textures/pd2/blackmarket/inv_mod_bonus"
				texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(sub_type or type)
			else
				texture = "guis/textures/pd2/blackmarket/inv_mod_" .. type
			end
			return texture
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 49 91 
end

MenuComponentManager.create_weapon_mod_icon_list = function(self, weapon, category, factory_id, slot)
	local icon_list = {}
	local mods_all = managers.blackmarket:get_dropable_mods_by_weapon_id(weapon)
	local instance_ids = managers.blackmarket:get_cosmetics_instances_by_weapon_id(weapon)
	local crafted = managers.blackmarket:get_crafted_category(category)[slot]
	if table.size(mods_all) > 0 then
		local weapon_factory_tweak_data = tweak_data.weapon.factory.parts
		local mods_equip = deep_clone(managers.blackmarket:get_weapon_blueprint(category, slot))
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		for _,default_part in ipairs(default_blueprint) do
			table.delete(mods_equip, default_part)
		end
		local mods = {}
		local mods_sorted = {}
		local types = {}
		local type = nil
		if not crafted or not crafted.customize_locked then
			do
				for id,data in pairs(mods_all) do
					if not mods[id] then
						mods[id] = {}
					end
					for _,mod in ipairs(data) do
						table.insert(mods[id], clone(mod))
					end
					table.insert(mods_sorted, id)
					types[id] = true
				end
			end
		end
		for _,data in pairs(mods) do
			local sort_td = tweak_data.blackmarket.weapon_mods
			local x_td, y_td, x_pc, y_pc = nil, nil, nil, nil
			table.sort(data, function(x, y)
				-- upvalues: x_td , sort_td , y_td , x_pc , y_pc
				x_td = sort_td[x[1]]
				y_td = sort_td[y[1]]
				x_pc = x_td.value or x_td.pc or (x_td.pcs and x_td.pcs[1]) or 10
				y_pc = y_td.value or y_td.pc or (y_td.pcs and y_td.pcs[1]) or 10
				x_pc = x_pc + (x[2] and tweak_data.lootdrop.global_values[x[2]].sort_number or 0)
				y_pc = y_pc + (y[2] and tweak_data.lootdrop.global_values[y[2]].sort_number or 0)
				return x_pc < y_pc or (x_pc == y_pc and x[1] < y[1])
      end)
		end
		table.sort(mods_sorted, function(x, y)
			return y < x
    end)
		if #instance_ids > 0 then
			types.weapon_cosmetics = true
			table.insert(mods_sorted, "weapon_cosmetics")
		end
		if crafted.cosmetics and crafted.cosmetics.bonus then
			local bonuses = tweak_data.economy:get_bonus_icons(tweak_data.blackmarket.weapon_skins[crafted.cosmetics.id].bonus)
			types.weapon_skin_bonuses = {}
			for _,texture_path in ipairs(bonuses) do
				table.insert(types.weapon_skin_bonuses, texture_path)
				table.insert(mods_sorted, texture_path)
			end
		end
		for _,name in pairs(mods_sorted) do
			local gadget, silencer, equipped, sub_type = nil, nil, nil, nil
			local is_auto = not tweak_data.weapon[weapon] or tweak_data.weapon[weapon].FIRE_MODE == "auto"
			local weapon_skin_bonus = false
			if types.weapon_skin_bonuses and table.contains(types.weapon_skin_bonuses, name) then
				if not managers.job:is_current_job_competitive() then
					equipped = not managers.weapon_factory:has_perk("bonus", crafted.factory_id, crafted.blueprint)
				else
					equipped = false
				end
				weapon_skin_bonus = true
			elseif name == "weapon_cosmetics" then
				equipped = not not managers.blackmarket:get_weapon_cosmetics(category, slot)
			else
				for _,name_equip in pairs(mods_equip) do
					if name == weapon_factory_tweak_data[name_equip].type then
						equipped = true
						sub_type = weapon_factory_tweak_data[name_equip].sub_type
						if name == "gadget" then
							gadget = sub_type
						end
						if sub_type == "silencer" then
							silencer = true
						end
					else
						silencer = false
					end
			else
				end
			end
			local texture = self:get_texture_from_mod_type(name, sub_type, gadget, silencer, is_auto, equipped, mods[name], types, weapon_skin_bonus)
			if texture then
				if DB:has(Idstring("texture"), texture) then
					table.insert(icon_list, {texture = texture, equipped = equipped, type = name, weapon_skin_bonus = weapon_skin_bonus})
				end
			else
				Application:error("[MenuComponentManager:create_weapon_mod_icon_list]", "Missing texture for weapon mod icon", texture)
			end
		end
	end
	return icon_list
end

MenuComponentManager.create_game_installing_gui = function(self)
	if self._game_installing then
		return 
	end
	self:_create_game_installing_gui()
end

MenuComponentManager._create_game_installing_gui = function(self)
	self:close_game_installing_gui()
	if not MenuCallbackHandler:is_installed() then
		self._game_installing = GameInstallingGui:new(self._ws)
	end
end

MenuComponentManager._update_game_installing_gui = function(self, t, dt)
	if not self._crimenet_enabled or not self._crimenet_offline_enabled then
		local is_installing, install_progress = managers.dlc:is_installing()
		if self._game_installing then
			self._game_installing:update(install_progress)
		end
		self._is_game_installing = is_installing
	if not self._is_game_installing then
		end
	if managers.menu:active_menu() then
		end
		local logic = managers.menu:active_menu().logic
		if logic then
			local node = logic:get_node("main")
			if node then
				local crimenet = node:item("crimenet")
				if crimenet then
					crimenet:set_enabled(true)
					self._crimenet_enabled = true
				end
				local crimenet_offline = node:item("crimenet_offline")
			if crimenet_offline then
				end
				crimenet_offline:set_enabled(true)
				self._crimenet_offline_enabled = true
			end
		else
			self._crimenet_enabled = true
			self._crimenet_offline_enabled = true
		end
		self:close_game_installing_gui()
	end
end

MenuComponentManager.close_game_installing_gui = function(self)
	if self._game_installing then
		self._game_installing:close()
		self._game_installing = nil
	end
end

MenuComponentManager.create_inventory_gui = function(self, node)
	self:_create_inventory_gui(node)
end

MenuComponentManager._create_inventory_gui = function(self, node)
	self:close_inventory_gui()
	self._player_inventory_gui = PlayerInventoryGui:new(self._ws, self._fullscreen_ws, node)
	local active_menu = managers.menu:active_menu()
	if active_menu then
		active_menu.input:set_force_input(true)
	end
end

MenuComponentManager.close_inventory_gui = function(self)
	if self._player_inventory_gui then
		self._player_inventory_gui:close()
		self._player_inventory_gui = nil
		local active_menu = managers.menu:active_menu()
	if active_menu then
		end
		active_menu.input:set_force_input(false)
	end
end

MenuComponentManager._create_newsfeed_gui = function(self)
	if self._newsfeed_gui then
		return 
	end
	self:create_newsfeed_gui()
end

MenuComponentManager.create_newsfeed_gui = function(self)
	self:close_newsfeed_gui()
	if SystemInfo:platform() == Idstring("WIN32") then
		self._newsfeed_gui = NewsFeedGui:new(self._ws)
	end
end

MenuComponentManager._update_newsfeed_gui = function(self, t, dt)
	if self._newsfeed_gui then
		self._newsfeed_gui:update(t, dt)
	end
end

MenuComponentManager.close_newsfeed_gui = function(self)
	if self._newsfeed_gui then
		self._newsfeed_gui:close()
		self._newsfeed_gui = nil
	end
end

MenuComponentManager.create_preplanning_map_gui = function(self, node)
	if not self._preplanning_map then
		self._preplanning_map = self:_create_preplanning_map_gui(node)
	end
	self._preplanning_map:set_active_node(node)
	if self._preplanning_peer_draw_lines and self._preplanning_peer_draw_line_index then
		self:_set_preplanning_drawings(self._preplanning_peer_draw_lines, self._preplanning_peer_draw_line_index)
	end
	if #self._preplanning_saved_draws > 0 then
		self:_set_preplanning_saved_draws(self._preplanning_saved_draws)
	end
	local active_menu = managers.menu:active_menu()
	if active_menu then
		active_menu.input:set_force_input(true)
	end
end

MenuComponentManager._create_preplanning_map_gui = function(self, node)
	return PrePlanningMapGui:new(self._ws, self._fullscreen_ws, node)
end

MenuComponentManager.is_preplanning_enabled = function(self)
	if self._preplanning_map then
		return self._preplanning_map:enabled()
	end
end

MenuComponentManager.close_preplanning_map_gui = function(self)
	self:_close_preplanning_map_gui()
	if self._preplanning_map then
		local active_menu = managers.menu:active_menu()
	if active_menu then
		end
		active_menu.input:set_force_input(false)
	end
end

MenuComponentManager.kill_preplanning_map_gui = function(self)
	if self._preplanning_map then
		if Network:is_server() then
			local peer_draw_lines, peer_draw_line_index = self._preplanning_map:get_drawings()
			self._preplanning_peer_draw_lines = peer_draw_lines
			self._preplanning_peer_draw_line_index = peer_draw_line_index
		end
		self._preplanning_map:close()
		self._preplanning_map = nil
	end
end

MenuComponentManager._close_preplanning_map_gui = function(self)
	if self._preplanning_map then
		self._preplanning_map:disable()
	end
end

MenuComponentManager.preplanning_flash_error = function(self, ...)
	if self._preplanning_map then
		self._preplanning_map:flash_error(...)
	end
end

MenuComponentManager.set_preplanning_category_filter = function(self, category)
	if self._preplanning_map then
		self._preplanning_map:set_category_filter(category)
	end
end

MenuComponentManager.set_preplanning_type_filter = function(self, type)
	if self._preplanning_map then
		self._preplanning_map:set_type_filter(type)
	end
end

MenuComponentManager.get_preplanning_filter = function(self)
	if self._preplanning_map then
		return self._preplanning_map:current_type_filter()
	end
end

MenuComponentManager.set_preplanning_selected_element_item = function(self, item)
	if self._preplanning_map then
		return self._preplanning_map:set_selected_element_item(item)
	end
end

MenuComponentManager.set_preplanning_map_position_to_item = function(self, item)
	if self._preplanning_map then
		return self._preplanning_map:set_map_position_to_item(item)
	end
end

MenuComponentManager.set_preplanning_map_position = function(self, x, y, location)
	if self._preplanning_map then
		return self._preplanning_map:set_map_position(x, y, location)
	end
end

MenuComponentManager.update_preplanning_element = function(self, type, id)
	if self._preplanning_map then
		return self._preplanning_map:update_element(type, id)
	end
end

MenuComponentManager.preplanning_post_event = function(self, event, listener_clbk)
	if self._preplanning_map then
		return self._preplanning_map:post_event(event, listener_clbk)
	end
end

MenuComponentManager.preplanning_stop_event = function(self)
	if self._preplanning_map then
		return self._preplanning_map:stop_event()
	end
end

MenuComponentManager.preplanning_start_custom_talk = function(self, id)
	if self._preplanning_map then
		return self._preplanning_map:start_custom_talk(id)
	end
end

MenuComponentManager.toggle_preplanning_drawing = function(self, peer_id)
	if self._preplanning_map then
		return self._preplanning_map:toggle_drawing(peer_id)
	end
end

MenuComponentManager.sync_preplanning_draw_event = function(self, peer_id, event_id, var1, var2)
	if self._preplanning_map then
		if event_id == 1 then
			self._preplanning_map:sync_start_drawing(peer_id, var1, var2)
		elseif event_id == 2 then
			self._preplanning_map:sync_end_drawing(peer_id)
		elseif event_id == 3 then
			self._preplanning_map:sync_undo_drawing(peer_id)
		elseif event_id == 4 then
			self._preplanning_map:sync_erase_drawing(peer_id)
		elseif event_id == 5 then
			if managers.network and managers.network:session() then
				local server_peer = managers.network:session():server_peer()
			end
		if server_peer then
			end
		if server_peer:id() == peer_id then
			end
			for i = 1, managers.criminals.MAX_NR_CRIMINALS do
				self._preplanning_map:sync_erase_drawing(i)
			end
		end
	else
		table.insert(self._preplanning_saved_draws, {peer_id, event_id, var1, var2; clbk = "sync_preplanning_draw_event"})
	end
end

MenuComponentManager.sync_preplanning_draw_point = function(self, peer_id, x, y)
	if self._preplanning_map then
		return self._preplanning_map:sync_draw_point(peer_id, x, y)
	else
		table.insert(self._preplanning_saved_draws, {peer_id, x, y; clbk = "sync_preplanning_draw_point"})
	end
end

MenuComponentManager.clear_preplanning_draws = function(self, peer_id)
	if self._preplanning_map then
		self._preplanning_map:sync_erase_drawing(peer_id)
	else
		for i = #self._preplanning_saved_draws, 1, -1 do
			if self._preplanning_saved_draws[i][1] == peer_id then
				table.remove(self._preplanning_saved_draws, i)
			end
		end
	end
end

MenuComponentManager.preplanning_sync_save = function(self, data)
	if not data then
		return 
	end
	if self._preplanning_map then
		local peer_draw_lines, peer_draw_line_index = self._preplanning_map:get_drawings()
		data.peer_draw_lines = peer_draw_lines
		data.peer_draw_line_index = peer_draw_line_index
	elseif self._preplanning_peer_draw_lines and self._preplanning_peer_draw_line_index then
		data.peer_draw_lines = self._preplanning_peer_draw_lines
		data.peer_draw_line_index = self._preplanning_peer_draw_line_index
	else
		data.preplanning_saved_draws = self._preplanning_saved_draws
	end
end

MenuComponentManager.preplanning_sync_load = function(self, data)
	if not data then
		return 
	end
	if self._preplanning_map then
		if data.preplanning_saved_draws then
			self:_set_preplanning_saved_draws(data.preplanning_saved_draws)
		elseif data.peer_draw_lines and data.peer_draw_line_index then
			self:_set_preplanning_drawings(data.peer_draw_lines, data.peer_draw_line_index)
		end
	elseif data.preplanning_saved_draws then
		self._preplanning_saved_draws = data.preplanning_saved_draws
	elseif data.peer_draw_lines and data.peer_draw_line_index then
		self._preplanning_peer_draw_lines = data.peer_draw_lines
		self._preplanning_peer_draw_line_index = data.peer_draw_line_index
	end
end

MenuComponentManager._set_preplanning_saved_draws = function(self, preplanning_saved_draws)
	local clbk, vars = nil, nil
	for _,draw_data in ipairs(preplanning_saved_draws) do
		clbk = draw_data.clbk
		if clbk and self[clbk] then
			vars = {}
			for _,var in ipairs(draw_data) do
				table.insert(vars, var)
			end
			self[clbk](self, unpack(vars))
		end
	end
	self._preplanning_saved_draws = {}
end

MenuComponentManager._set_preplanning_drawings = function(self, peer_draw_lines, peer_draw_line_index)
	self._preplanning_map:set_drawings(peer_draw_lines, peer_draw_line_index)
	self._preplanning_peer_draw_lines = nil
	self._preplanning_peer_draw_line_index = nil
end

MenuComponentManager.hide_preplanning_drawboard = function(self)
	if self._preplanning_map then
		self._preplanning_map:hide_drawboard()
	end
end

MenuComponentManager.set_preplanning_drawboard = function(self, x, y)
	if self._preplanning_map then
		self._preplanning_map:set_drawboard_button_position(x, y)
	end
end

MenuComponentManager.get_game_chat_button_shape = function(self)
	if self._game_chat_gui then
		return self._game_chat_gui:get_chat_button_shape()
	end
end

MenuComponentManager.set_blackmarket_tradable_loaded = function(self, error)
	if self._blackmarket_gui then
		self._blackmarket_gui:set_tradable_loaded(error)
	end
end

MenuComponentManager._create_debug_fonts_gui = function(self)
	if self._debug_fonts_gui then
		self._debug_fonts_gui:set_enabled(true)
		return 
	end
	self:create_debug_fonts_gui()
end

MenuComponentManager.create_debug_fonts_gui = function(self)
	self:close_debug_fonts_gui()
	self._debug_fonts_gui = DebugDrawFonts:new(self._fullscreen_ws)
end

MenuComponentManager._disable_debug_fonts_gui = function(self)
	if self._debug_fonts_gui then
		self._debug_fonts_gui:set_enabled(false)
	end
end

MenuComponentManager.close_debug_fonts_gui = function(self)
	if self._debug_fonts_gui then
		self._debug_fonts_gui:close()
		self._debug_fonts_gui = nil
	end
end

MenuComponentManager.toggle_debug_fonts_gui = function(self)
	if Application:production_build() and self._debug_fonts_gui then
		self._debug_fonts_gui:toggle_debug()
	end
end

MenuComponentManager.reload_debug_fonts_gui = function(self)
	if self._debug_fonts_gui then
		self._debug_fonts_gui:reload()
	end
end

MenuComponentManager._create_debug_strings_gui = function(self)
	if self._debug_strings_book then
		self._debug_strings_book:set_enabled(true)
		return 
	end
	self:create_debug_strings_gui()
end

MenuComponentManager.create_debug_strings_gui = function(self)
	self:close_debug_strings_gui()
	self._debug_strings_book = BookBoxGui:new(self._ws, nil, {no_close_legend = true, no_scroll_legend = true, w = 1088, h = 612})
	self._debug_strings_book._info_box:close()
	self._debug_strings_book._info_box = nil
	for i,file_name in ipairs({"debug", "blackmarket", "challenges", "hud", "atmospheric_text", "subtitles", "heist", "menu", "savefile", "system_text", "systemmenu", "wip"}) do
		local gui = DebugStringsBoxGui:new(self._ws, "file", "", nil, nil, "strings/" .. file_name)
		self._debug_strings_book:add_page(file_name, gui, i == 1)
	end
	self._debug_strings_book:add_background()
	self._debug_strings_book:set_layer(tweak_data.gui.DIALOG_LAYER)
	self._debug_strings_book:set_centered()
end

MenuComponentManager._disable_debug_strings_gui = function(self)
	if self._debug_strings_book then
		self._debug_strings_book:set_enabled(false)
	end
end

MenuComponentManager.close_debug_strings_gui = function(self)
	if self._debug_strings_book then
		self._debug_strings_book:close()
		self._debug_strings_book = nil
	end
end

MenuComponentManager._maximize_weapon_box = function(self, data)
	self._weapon_text_box:set_visible(true)
	self._weapon_text_minimized_id = nil
	self:remove_minimized(data.id)
end

MenuComponentManager.add_minimized = function(self, config)
	if not self._minimized_list then
		self._minimized_list = {}
	end
	self._minimized_id = (self._minimized_id or 0) + 1
	local panel = (self._main_panel:panel({w = 100, h = 20, layer = tweak_data.gui.MENU_COMPONENT_LAYER}))
	local text = nil
	if config.text then
		text = panel:text({text = config.text, align = "center", halign = "left", vertical = "center", hvertical = "center", font = tweak_data.menu.default_font, font_size = 22, layer = 2})
		text:set_center_y(panel:center_y())
		local _, _, w, h = text:text_rect()
		text:set_size(w + 8, h)
		panel:set_size(w + 8, h)
	end
	local help_text = panel:parent():text({text = config.help_text or "CLICK TO MAXIMIZE WEAPON INFO", align = "left", halign = "left", vertical = "center", hvertical = "center", visible = false, font = tweak_data.menu.small_font, font_size = tweak_data.menu.small_font_size, color = Color.white, layer = 3})
	help_text:set_shape(help_text:text_rect())
	local unselected = panel:bitmap({texture = "guis/textures/menu_unselected", layer = 0})
	unselected:set_h(64 * panel:h() / 32)
	unselected:set_center_y(panel:center_y())
	local selected = panel:bitmap({texture = "guis/textures/menu_selected", layer = 1, visible = false})
	selected:set_h(64 * panel:h() / 32)
	selected:set_center_y(panel:center_y())
	panel:set_bottom(self._main_panel:h() - CoreMenuRenderer.Renderer.border_height)
	local top_line = panel:parent():bitmap({visible = false, texture = "guis/textures/headershadow", layer = 1, w = panel:w()})
	top_line:set_bottom(panel:top())
	table.insert(self._minimized_list, {id = self._minimized_id, panel = panel, selected = selected, text = text, help_text = help_text, top_line = top_line, callback = config.callback, mouse_over = false})
	self:_layout_minimized()
	return self._minimized_id
end

MenuComponentManager._layout_minimized = function(self)
	local x = 0
	for i,data in ipairs(self._minimized_list) do
		data.panel:set_x(x)
		data.top_line:set_x(x)
		x = x + data.panel:w() + 2
	end
end

MenuComponentManager.remove_minimized = function(self, id)
	for i,data in ipairs(self._minimized_list) do
		if data.id == id then
			data.help_text:parent():remove(data.help_text)
			data.top_line:parent():remove(data.top_line)
			self._main_panel:remove(data.panel)
			table.remove(self._minimized_list, i)
	else
		end
	end
	self:_layout_minimized()
end

MenuComponentManager._request_done_callback = function(self, texture_ids)
	local key = texture_ids:key()
	local entry = self._requested_textures[key]
	if not entry then
		return 
	end
	local clbks = {}
	for index,owner_data in pairs(entry.owners) do
		table.insert(clbks, owner_data.clbk)
		owner_data.clbk = nil
	end
	for _,clbk in pairs(clbks) do
		clbk(texture_ids)
	end
end

MenuComponentManager.request_texture = function(self, texture, done_cb)
	if self._block_texture_requests then
		debug_pause(string.format("[MenuComponentManager:request_texture] Requesting texture is blocked! %s", texture))
		return false
	end
	local texture_ids = Idstring(texture)
	if not DB:has(Idstring("texture"), texture_ids) then
		Application:error(string.format("[MenuComponentManager:request_texture] No texture entry named \"%s\" in database.", texture))
		return false
	end
	local key = texture_ids:key()
	local entry = self._requested_textures[key]
	if not entry then
		entry = {next_index = 1, 
owners = {}, texture_ids = texture_ids}
		self._requested_textures[key] = entry
	end
	local index = entry.next_index
	entry.owners[index] = {clbk = done_cb}
	do
		while 1 do
			local next_index = index + 1
			while entry.owners[next_index] do
				if index == next_index then
					debug_pause("[MenuComponentManager:request_texture] overflow!")
				end
				next_index = next_index + 1
				if next_index == 10000 then
					next_index = 1
				end
			end
			entry.next_index = next_index
			TextureCache:request(texture_ids, "NORMAL", callback(self, self, "_request_done_callback"), 100)
			return index
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

MenuComponentManager.unretrieve_texture = function(self, texture, index)
	local texture_ids = Idstring(texture)
	local key = texture_ids:key()
	local entry = self._requested_textures[key]
	if entry and entry.owners[index] then
		entry.owners[index] = nil
		if not next(entry.owners) then
			self._requested_textures[key] = nil
		end
		TextureCache:unretrieve(texture_ids)
	end
end

MenuComponentManager.retrieve_texture = function(self, texture)
	return TextureCache:retrieve(texture, "NORMAL")
end

MenuComponentManager.add_colors_to_text_object = function(self, text_object, ...)
	local text = text_object:text()
	local unchanged_text = text
	local colors = {...}
	if #colors ~= 1 or not colors[1] then
		local default_color = tweak_data.screen_colors.text
	end
	local start_ci, end_ci, first_ci = nil, nil, nil
	local text_dissected = utf8.characters(text)
	local idsp = Idstring("#")
	start_ci = {}
	end_ci = {}
	first_ci = true
	for i,c in ipairs(text_dissected) do
		if Idstring(c) == idsp then
			local next_c = text_dissected[i + 1]
		if next_c then
			end
			if Idstring(next_c) == idsp then
				if first_ci then
					table.insert(start_ci, i)
				else
					table.insert(end_ci, i)
					first_ci = not first_ci
				end
			end
		end
		if #start_ci ~= #end_ci then
			do return end
		end
		for i = 1, #start_ci do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - (i * 4 - 1)
		end
		text = string.gsub(text, "##", "")
		text_object:set_text(text)
		if colors then
			text_object:clear_range_color(1, utf8.len(text))
			if #start_ci ~= #end_ci then
				Application:error("[MenuComponentManager:color_text_object]: Missing '#' in text:", unchanged_text, #start_ci, #end_ci)
			end
		else
			for i = 1, #start_ci do
				text_object:set_range_color(start_ci[i], end_ci[i], colors[i] or default_color)
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

if not MenuComponentPostEventInstance then
	MenuComponentPostEventInstance = class()
end
MenuComponentPostEventInstance.init = function(self, sound_source)
	self._sound_source = sound_source
	self._post_event = false
end

MenuComponentPostEventInstance.post_event = function(self, event)
	if alive(self._post_event) then
		self._post_event:stop()
	end
	self._post_event = false
	if alive(self._sound_source) then
		self._post_event = self._sound_source:post_event(event)
	end
end

MenuComponentPostEventInstance.stop_event = function(self)
	if alive(self._post_event) then
		self._post_event:stop()
	end
	self._post_event = false
end

MenuComponentManager.new_post_event_instance = function(self)
	local event_instance = MenuComponentPostEventInstance:new(self._sound_source)
	if not self._unique_event_instances then
		self._unique_event_instances = {}
	end
	table.insert(self._unique_event_instances, event_instance)
	return event_instance
end

MenuComponentManager.post_event = function(self, event, unique)
	if alive(self._post_event) then
		self._post_event:stop()
		self._post_event = nil
	end
	local post_event = self._sound_source:post_event(event)
	if unique then
		self._post_event = post_event
	end
	return post_event
end

MenuComponentManager.stop_event = function(self)
	print("MenuComponentManager:stop_event()")
	if alive(self._post_event) then
		self._post_event:stop()
		self._post_event = nil
	end
end

MenuComponentManager.close = function(self)
	print("[MenuComponentManager:close]")
	self:close_friends_gui()
	self:close_newsfeed_gui()
	self:close_profile_gui()
	self:close_player_profile_gui()
	self:close_contract_gui()
	self:close_server_info_gui()
	self:close_chat_gui()
	self:close_crimenet_gui()
	self:close_blackmarket_gui()
	self:close_stage_endscreen_gui()
	self:close_lootdrop_gui()
	self:close_lootdrop_casino_gui()
	self:close_mission_briefing_gui()
	self:close_debug_fonts_gui()
	self:kill_preplanning_map_gui()
	if self._resolution_changed_callback_id then
		managers.viewport:remove_resolution_changed_func(self._resolution_changed_callback_id)
	end
	if alive(self._sound_source) then
		self._sound_source:stop()
	end
	self:_destroy_controller_input()
	if self._requested_textures then
		for key,entry in pairs(self._requested_textures) do
			TextureCache:unretrieve(entry.texture_ids)
		end
	end
	self._requested_textures = {}
	self._block_texture_requests = true
end

MenuComponentManager.play_transition = function(self, run_in_pause)
	if self._transition_panel then
		self._transition_panel:parent():remove(self._transition_panel)
	end
	self._transition_panel = self._fullscreen_ws:panel():panel({name = "transition_panel", layer = 10000})
	self._transition_panel:rect({name = "fade1", color = Color.black, halign = "scale", valign = "scale "})
	local animate_transition = function(o)
		-- upvalues: run_in_pause
		local fade1 = o:child("fade1")
		local seconds = 0.5
		local t = 0
		do
			while 1 do
				local dt, p = nil, nil
				while t < seconds do
					dt = coroutine.yield()
					if dt == 0 and run_in_pause then
						dt = TimerManager:main():delta_time()
					end
					t = t + dt
					p = (t) / seconds
					fade1:set_alpha(1 - p)
				end
			end
			 -- WARNING: missing end command somewhere! Added here
		end
  end
	self._transition_panel:animate(animate_transition)
end

MenuComponentManager.test_camera_shutter_tech = function(self)
	if not self._tcst then
		self._tcst = managers.gui_data:create_fullscreen_16_9_workspace(managers.gui_data)
		local o = self._tcst:panel():panel({layer = 10000})
		local b = o:rect({name = "black", color = Color.black, layer = 5, halign = "scale", valign = "scale"})
		local one_frame_hide = function(o)
			o:hide()
			coroutine.yield()
			o:show()
    end
		b:animate(one_frame_hide)
	end
	local o = self._tcst:panel():children()[1]
	local animate_fade = function(o)
		local black = o:child("black")
		over(0.5, function(p)
			-- upvalues: black
			black:set_alpha(1 - p)
    end)
  end
	o:stop()
	o:animate(animate_fade)
end

MenuComponentManager.create_test_gui = function(self)
	if alive(Global.test_gui) then
		Overlay:gui():destroy_workspace(Global.test_gui)
		Global.test_gui = nil
	end
	Global.test_gui = managers.gui_data:create_fullscreen_16_9_workspace(managers.gui_data)
	local panel = Global.test_gui:panel()
	local bg = panel:rect({layer = 1000, color = Color.black})
	local size = 48
	local x = 0
	for i = 3, 3 do
		local bitmap = panel:bitmap({name = "bitmap", layer = 1001, render_template = "TextDistanceField", texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/mezzanine_test", rotation = 360})
		bitmap:set_size(bitmap:texture_width() * i, bitmap:texture_height() * i)
		bitmap:set_position(x, 0)
		x = bitmap:right() + 10
	end
end

MenuComponentManager.destroy_test_gui = function(self)
	if alive(Global.test_gui) then
		Overlay:gui():destroy_workspace(Global.test_gui)
		Global.test_gui = nil
	end
end


