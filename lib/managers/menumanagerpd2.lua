core:import("CoreMenuManager")
core:import("CoreMenuCallbackHandler")
require("lib/managers/menu/MenuSceneManager")
require("lib/managers/menu/MenuComponentManager")
require("lib/managers/menu/items/MenuItemExpand")
require("lib/managers/menu/items/MenuItemWeaponExpand")
require("lib/managers/menu/items/MenuItemWeaponUpgradeExpand")
require("lib/managers/menu/items/MenuItemMaskExpand")
require("lib/managers/menu/items/MenuItemArmorExpand")
require("lib/managers/menu/items/MenuItemCharacterExpand")
require("lib/managers/menu/items/MenuItemDivider")
core:import("CoreEvent")
function MenuManager:update(t, dt, ...)
	MenuManager.super.update(self, t, dt, ...)
	if managers.menu_scene then
		managers.menu_scene:update(t, dt)
	end
	managers.menu_component:update(t, dt)
end
function MenuManager:on_view_character(user)
	local outfit = user:rich_presence("outfit")
	if outfit ~= "" then
		if managers.menu:active_menu().logic:selected_node_name() ~= "view_character" then
			managers.menu:active_menu().logic:select_node("view_character", true, {})
		end
		managers.menu_scene:set_main_character_outfit(outfit)
		managers.menu_component:create_view_character_profile_gui(user, 0, 300)
	end
end
function MenuManager:on_enter_lobby()
	print("function MenuManager:on_enter_lobby()")
	managers.menu:active_menu().logic:select_node("lobby", true, {})
	managers.platform:set_rich_presence("MPLobby")
	managers.menu_component:pre_set_game_chat_leftbottom(0, 50)
	managers.network:session():on_entered_lobby()
	self:setup_local_lobby_character()
	if Global.exe_argument_level then
		MenuCallbackHandler:start_the_game()
	end
end
function MenuManager:on_leave_active_job()
	managers.statistics:stop_session({quit = true})
	managers.savefile:save_progress()
	managers.job:deactivate_current_job()
	managers.gage_assignment:deactivate_assignments()
	if managers.groupai then
		managers.groupai:state():set_AI_enabled(false)
	end
	self._sound_source:post_event("menu_exit")
	managers.menu:close_menu("lobby_menu")
	managers.menu:close_menu("menu_pause")
end
function MenuManager:setup_local_lobby_character()
	local local_peer = managers.network:session():local_peer()
	local level = managers.experience:current_level()
	local rank = managers.experience:current_rank()
	local character = local_peer:character()
	local progress = managers.upgrades:progress()
	if managers.menu_scene then
		managers.menu_scene:set_lobby_character_out_fit(local_peer:id(), managers.blackmarket:outfit_string(), rank)
	end
	local_peer:set_outfit_string(managers.blackmarket:outfit_string())
	managers.network:session():send_to_peers_loaded("sync_profile", level, rank)
	managers.network:session():check_send_outfit()
end
function MenuManager:http_test()
	Steam:http_request("http://www.overkillsoftware.com/?feed=rss", callback(self, self, "http_test_result"))
end
function MenuManager:http_test_result(success, body)
	print("success", success)
	print("body", body)
	print(inspect(self:_get_text_block(body, "<title>", "</title>")))
	print(inspect(self:_get_text_block(body, "<link>", "</link>")))
end
function MenuCallbackHandler:continue_to_lobby()
end
function MenuCallbackHandler:on_view_character_focus(node, in_focus, data)
	if in_focus and data then
	else
		managers.menu_scene:set_main_character_outfit(managers.blackmarket:outfit_string())
		managers.menu_component:close_view_character_profile_gui()
	end
end
function MenuCallbackHandler:on_character_customization()
	managers.menu_component:close_weapon_box()
end
function MenuCallbackHandler:start_job(job_data)
	if not managers.job:activate_job(job_data.job_id) then
		return
	end
	Global.game_settings.level_id = managers.job:current_level_id()
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.world_setting = managers.job:current_world_setting()
	Global.game_settings.difficulty = job_data.difficulty
	local matchmake_attributes = self:get_matchmake_attributes()
	if Network:is_server() then
		local job_id_index = tweak_data.narrative:get_index_from_job_id(managers.job:current_job_id())
		local level_id_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
		local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
		managers.network:session():send_to_peers("sync_game_settings", job_id_index, level_id_index, difficulty_index)
		managers.network.matchmake:set_server_attributes(matchmake_attributes)
		managers.menu_component:on_job_updated()
		managers.menu:active_menu().logic:navigate_back(true)
		managers.menu:active_menu().logic:refresh_node("lobby", true)
	else
		managers.network.matchmake:create_lobby(matchmake_attributes)
	end
end
function MenuCallbackHandler:play_single_player_job(item)
	self:play_single_player()
	self:start_single_player_job({
		job_id = item:parameter("job_id"),
		difficulty = "normal"
	})
end
function MenuCallbackHandler:play_quick_start_job(item)
	self:start_job({
		job_id = item:parameter("job_id"),
		difficulty = "normal"
	})
end
function MenuCallbackHandler:start_single_player_job(job_data)
	if not managers.job:activate_job(job_data.job_id) then
		return
	end
	Global.game_settings.level_id = managers.job:current_level_id()
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.difficulty = job_data.difficulty
	Global.game_settings.world_setting = managers.job:current_world_setting()
	MenuCallbackHandler:start_the_game()
end
function MenuCallbackHandler:crimenet_focus_changed(node, in_focus)
	if in_focus then
		if node:parameters().no_servers then
			managers.crimenet:start_no_servers()
		else
			managers.crimenet:start()
		end
		managers.menu_component:create_crimenet_gui()
	else
		managers.crimenet:stop()
		managers.menu_component:close_crimenet_gui()
	end
end
function MenuCallbackHandler:can_buy_weapon(item)
	return not Global.blackmarket_manager.weapons[item:parameter("weapon_id")].owned
end
function MenuCallbackHandler:owns_weapon(item)
	return not self:can_buy_weapon(item)
end
function MenuCallbackHandler:open_blackmarket_node()
	managers.menu:active_menu().logic:select_node("blackmarket")
end
function MenuCallbackHandler:leave_blackmarket(...)
	managers.menu_component:close_weapon_box()
	managers.menu_scene:remove_item()
	managers.blackmarket:release_preloaded_blueprints()
end
function MenuCallbackHandler:_left_blackmarket()
	managers.menu_scene:remove_item()
end
function MenuCallbackHandler:blackmarket_abort_customize_mask()
	managers.blackmarket:abort_customize_mask()
end
function MenuCallbackHandler:got_skillpoint_to_spend()
	return managers.skilltree and managers.skilltree:points() > 0
end
function MenuCallbackHandler:got_new_lootdrop()
	return managers.blackmarket and managers.blackmarket:got_any_new_drop()
end
function MenuCallbackHandler:got_new_content_update()
	return false
end
function MenuCallbackHandler:got_new_fav_videos()
	return false
end
function MenuCallbackHandler:not_got_new_content_update()
	return not self:got_new_content_update()
end
function MenuCallbackHandler:do_content_lootdrop(node)
	managers.menu:open_node("crimenet_contract_casino_lootdrop", {
		secure_cards = 0,
		preferred_item = nil,
		increase_infamous = false
	})
end
function MenuCallbackHandler:test_clicked_weapon(item)
	if not item:parameter("customize") then
		managers.menu_scene:clicked_blackmarket_item()
		managers.menu_component:create_weapon_box(item:parameter("weapon_id"), {
			condition = math.round(item:parameter("condition") / item:_max_condition() * 100)
		})
	end
end
function MenuCallbackHandler:buy_weapon(item)
	local name = managers.localization:text(tweak_data.weapon[item:parameter("weapon_id")].name_id)
	local cost = 50000
	local yes_func = callback(self, self, "on_buy_weapon_yes", {item = item, cost = cost})
	managers.menu:show_buy_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:on_buy_weapon_yes(params)
	Global.blackmarket_manager.weapons[params.item:parameter("weapon_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true
	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end
function MenuCallbackHandler:equip_weapon(item)
	Global.player_manager.kit.weapon_slots[item:parameter("weapon_slot")] = item:parameter("weapon_id")
	for weapon_id, data in pairs(Global.blackmarket_manager.weapons) do
		if data.selection_index == item:parameter("weapon_slot") then
			data.equipped = weapon_id == item:parameter("weapon_id")
		end
	end
end
function MenuCallbackHandler:repair_weapon(item)
	if item:_at_max_condition() then
		return
	end
	local name = managers.localization:text(tweak_data.weapon[item:parameter("weapon_id")].name_id)
	local cost = 50000 * (1 - item:parameter("parent_item"):condition() / item:_max_condition())
	local yes_func = callback(self, self, "on_repair_yes", {item = item, cost = cost})
	managers.menu:show_repair_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:on_repair_yes(params)
	Global.blackmarket_manager.weapons[params.item:parameters().weapon_id].condition = params.item:_max_condition()
	params.item:dirty()
	self:test_clicked_weapon(params.item:parameters().parent_item)
end
function MenuCallbackHandler:clicked_weapon_upgrade_type(item)
	managers.menu_scene:clicked_weapon_upgrade_type(item:parameters().name)
end
function MenuCallbackHandler:clicked_weapon_upgrade(item)
	local weapon_id = item:parameter("weapon_id")
	local upgrade = item:parameter("weapon_upgrade")
	managers.menu_scene:view_weapon_upgrade(weapon_id, tweak_data.weapon_upgrades.upgrades[upgrade].visual_upgrade)
end
function MenuCallbackHandler:can_buy_weapon_upgrade(item)
	return not self:owns_weapon_upgrade(item)
end
function MenuCallbackHandler:owns_weapon_upgrade(item)
	return Global.blackmarket_manager.weapon_upgrades[item:parameter("weapon_id")][item:parameter("weapon_upgrade")].owned
end
function MenuCallbackHandler:buy_weapon_upgrades(item)
end
function MenuCallbackHandler:buy_weapon_upgrade(item)
	local name = managers.localization:text(tweak_data.weapon_upgrades.upgrades[item:parameter("weapon_upgrade")].name_id)
	local cost = 10000
	local yes_func = callback(self, self, "_on_buy_weapon_upgrade_yes", {item = item, cost = cost})
	managers.menu:show_buy_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:_on_buy_weapon_upgrade_yes(params)
	Global.blackmarket_manager.weapon_upgrades[params.item:parameter("weapon_id")][params.item:parameter("weapon_upgrade")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true
	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end
function MenuCallbackHandler:attach_weapon_upgrade(item)
	local weapon_id = item:parameter("weapon_id")
	local upgrade = item:parameter("weapon_upgrade")
	local attach = not Global.blackmarket_manager.weapon_upgrades[weapon_id][upgrade].attached
	Global.blackmarket_manager.weapon_upgrades[weapon_id][upgrade].attached = not Global.blackmarket_manager.weapon_upgrades[weapon_id][upgrade].attached
	for _, _upgrade in ipairs(tweak_data.weapon_upgrades.weapon[weapon_id][item:parameter("upgrade_type")]) do
		if _upgrade ~= upgrade then
			Global.blackmarket_manager.weapon_upgrades[weapon_id][_upgrade].attached = false
		end
	end
end
function MenuCallbackHandler:clicked_customize_character_category(item)
	local name = item:name()
	if name == "masks" then
		if item:expanded() then
			managers.menu_scene:clicked_masks()
			return
		end
	elseif name == "armor" and item:expanded() then
		managers.menu_scene:clicked_armor()
		return
	end
	managers.menu_scene:clicked_customize_character_category()
end
function MenuCallbackHandler:test_clicked_mask(item)
	if not item:parameter("customize") then
		managers.menu_scene:clicked_blackmarket_item()
	end
	managers.menu_component:close_weapon_box()
	managers.menu_scene:spawn_mask(item:parameter("mask_id"))
end
function MenuCallbackHandler:can_buy_mask(item)
	return not self:owns_mask(item)
end
function MenuCallbackHandler:owns_mask(item)
	return Global.blackmarket_manager.masks[item:parameter("mask_id")].owned
end
function MenuCallbackHandler:equip_mask(item)
	local mask_id = item:parameter("mask_id")
	managers.blackmarket:on_buy_mask(mask_id, "normal", 9)
	managers.blackmarket:equip_mask(9)
	self:_update_outfit_information()
end
function MenuCallbackHandler:_update_outfit_information()
	local outfit_string = managers.blackmarket:outfit_string()
	if self:is_win32() then
		Steam:set_rich_presence("outfit", outfit_string)
	end
	if managers.network:session() then
		local local_peer = managers.network:session():local_peer()
		local in_lobby = local_peer:in_lobby() and game_state_machine:current_state_name() ~= "ingame_lobby_menu"
		if managers.menu_scene and in_lobby then
			local id = local_peer:id()
			managers.menu_scene:set_lobby_character_out_fit(id, outfit_string, managers.experience:current_rank())
		end
		local kit_menu = managers.menu:get_menu("kit_menu")
		if kit_menu then
			local id = local_peer:id()
			local criminal_name = local_peer:character()
			kit_menu.renderer:set_slot_outfit(id, criminal_name, outfit_string)
		end
		local_peer:set_outfit_string(outfit_string)
		managers.network:session():check_send_outfit()
	end
end
function MenuCallbackHandler:buy_mask(item)
	local name = managers.localization:text(tweak_data.blackmarket.masks[item:parameter("mask_id")].name_id)
	local cost = 10000
	local yes_func = callback(self, self, "_on_buy_mask_yes", {item = item, cost = cost})
	managers.menu:show_buy_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:_on_buy_mask_yes(params)
	Global.blackmarket_manager.masks[params.item:parameter("mask_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true
	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end
function MenuCallbackHandler:leave_character_customization()
	self:leave_blackmarket()
end
function MenuCallbackHandler:clicked_character(item)
	print("MenuCallbackHandler:clicked_character", item)
end
function MenuCallbackHandler:equip_character(item)
	local character_id = item:parameter("character_id")
	Global.blackmarket_manager.characters[character_id].equipped = true
	managers.menu_scene:set_character(character_id)
	for id, character in pairs(Global.blackmarket_manager.characters) do
		if id ~= character_id then
			character.equipped = false
		end
	end
	self:_update_outfit_information()
end
function MenuCallbackHandler:can_buy_character(item)
	return not self:owns_character(item)
end
function MenuCallbackHandler:owns_character(item)
	return Global.blackmarket_manager.characters[item:parameter("character_id")].owned
end
function MenuCallbackHandler:buy_character(item)
	local name = managers.localization:text(tweak_data.blackmarket.characters[item:parameter("character_id")].name_id)
	local cost = 10000
	local yes_func = callback(self, self, "_on_buy_character_yes", {item = item, cost = cost})
	managers.menu:show_buy_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:_on_buy_character_yes(params)
	Global.blackmarket_manager.characters[params.item:parameter("character_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true
	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end
function MenuCallbackHandler:test_clicked_armor(item)
	managers.menu_component:close_weapon_box()
	if not item:parameter("customize") then
	end
end
function MenuCallbackHandler:can_buy_armor(item)
	return not self:owns_armor(item)
end
function MenuCallbackHandler:owns_armor(item)
	return Global.blackmarket_manager.armors[item:parameter("armor_id")].owned
end
function MenuCallbackHandler:buy_armor(item)
	local name = managers.localization:text(tweak_data.blackmarket.armors[item:parameter("armor_id")].name_id)
	local cost = 20000
	local yes_func = callback(self, self, "_on_buy_armor_yes", {item = item, cost = cost})
	managers.menu:show_buy_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:_on_buy_armor_yes(params)
	Global.blackmarket_manager.armors[params.item:parameter("armor_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true
	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end
function MenuCallbackHandler:equip_armor(item)
	local armor_id = item:parameter("armor_id")
	Global.blackmarket_manager.armors[armor_id].equipped = true
	managers.menu_scene:set_character_armor(armor_id)
	for id, armor in pairs(Global.blackmarket_manager.armors) do
		if id ~= armor_id then
			armor.equipped = false
		end
	end
	self:_update_outfit_information()
end
function MenuCallbackHandler:repair_armor(item)
	if item:_at_max_condition() then
		return
	end
	local armor_id = item:parameter("armor_id")
	local name = managers.localization:text(tweak_data.blackmarket.armors[armor_id].name_id)
	local cost = 30000 * (1 - item:parameter("parent_item"):condition() / item:_max_condition())
	local yes_func = callback(self, self, "on_repair_armor_yes", {item = item, cost = cost})
	managers.menu:show_repair_weapon({yes_func = yes_func}, name, "$" .. cost)
end
function MenuCallbackHandler:on_repair_armor_yes(params)
	Global.blackmarket_manager.armors[params.item:parameters().armor_id].condition = params.item:_max_condition()
	params.item:dirty()
end
function MenuCallbackHandler:stage_success()
	if not managers.job:has_active_job() then
		return true
	end
	return managers.job:stage_success()
end
function MenuCallbackHandler:stage_not_success()
	return not self:stage_success()
end
function MenuCallbackHandler:is_job_finished()
	return managers.job:is_job_finished()
end
function MenuCallbackHandler:is_job_not_finished()
	return not self:is_job_finished()
end
function MenuCallbackHandler:got_job()
	return managers.job:has_active_job()
end
function MenuCallbackHandler:got_no_job()
	return not self:got_job()
end
MenuMarketItemInitiator = MenuMarketItemInitiator or class()
function MenuMarketItemInitiator:modify_node(node)
	local node_name = node:parameters().name
	local armor_item = node:item("armor")
	self:_add_expand_armor(armor_item)
	local submachine_guns_item = node:item("submachine_guns")
	self:_add_expand_weapon(submachine_guns_item, 3)
	local assault_rifles_item = node:item("assault_rifles")
	self:_add_expand_weapon(assault_rifles_item, 2)
	local handguns_item = node:item("handguns")
	self:_add_expand_weapon(handguns_item, 1)
	local support_equipment_item = node:item("support_equipment")
	if support_equipment_item and self:_uses_owned_stats() then
		support_equipment_item:set_parameter("current", 1)
		support_equipment_item:set_parameter("total", 4)
	end
	local miscellaneous_item = node:item("miscellaneous")
	if miscellaneous_item and self:_uses_owned_stats() then
		miscellaneous_item:set_parameter("current", 0)
		miscellaneous_item:set_parameter("total", 6)
	end
	local masks_item = node:item("masks")
	self:_add_expand_mask(masks_item)
	local character_item = node:item("character")
	self:_add_expand_character(character_item)
	return node
end
function MenuMarketItemInitiator:_add_weapon(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_character(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_mask(bm_data)
	return true
end
function MenuMarketItemInitiator:_add_armor(bm_data)
	return true
end
function MenuMarketItemInitiator:_uses_owned_stats()
	return true
end
function MenuMarketItemInitiator:_add_weapon_params()
end
function MenuMarketItemInitiator:_add_mask_params(params)
end
function MenuMarketItemInitiator:_add_character_params(params)
end
function MenuMarketItemInitiator:_add_armor_params(params)
end
function MenuMarketItemInitiator:_add_expand_weapon(item, selection_index)
	if not item then
		return
	end
	local i = 0
	local j = 0
	for weapon, data in pairs(tweak_data.weapon) do
		if data.autohit and data.use_data.selection_index == selection_index then
			i = i + 1
			local bm_data = Global.blackmarket_manager.weapons[weapon]
			local unlocked = bm_data.unlocked
			local owned = bm_data.owned
			if owned and unlocked then
				j = j + 1
			end
			local equipped = bm_data.equipped
			local condition = bm_data.condition
			if self:_add_weapon(bm_data) then
				local weapon_item = item:get_item(weapon)
				if not weapon_item then
					local params = {
						type = "MenuItemWeaponExpand",
						name = weapon,
						text_id = data.name_id,
						callback = "test_clicked_weapon",
						weapon_id = weapon,
						unlocked = unlocked and true or false,
						condition = condition,
						weapon_slot = selection_index
					}
					self:_add_weapon_params(params)
					weapon_item = CoreMenuNode.MenuNode.create_item(item, params)
					item:add_item(weapon_item)
				end
				weapon_item:parameters().unlocked = unlocked
				weapon_item:parameters().equipped = equipped and true or false
				weapon_item:parameters().owned = owned
				weapon_item:parameters().condition = condition
			end
		end
	end
	if self:_uses_owned_stats() then
		item:set_parameter("current", j)
		item:set_parameter("total", i)
	end
	item:_show_items(nil)
	return i
end
function MenuMarketItemInitiator:_add_expand_mask(item)
	local i = 0
	local j = 0
	for mask_id, data in pairs(tweak_data.blackmarket.masks) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.masks[mask_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped
		if owned then
			j = j + 1
		end
		if self:_add_mask(bm_data) then
			local mask_item = item:get_item(mask_id)
			if not mask_item then
				local params = {
					type = "MenuItemMaskExpand",
					name = mask_id,
					text_id = data.name_id,
					callback = "test_clicked_mask",
					unlocked = unlocked and true or false,
					mask_id = mask_id
				}
				self:_add_mask_params(params)
				mask_item = CoreMenuNode.MenuNode.create_item(item, params)
				item:add_item(mask_item)
			end
			mask_item:parameters().equipped = equipped and true or false
			mask_item:parameters().owned = owned
		end
	end
	if self:_uses_owned_stats() then
		item:set_parameter("current", j)
		item:set_parameter("total", i)
	end
	item:_show_items(nil)
	return i
end
function MenuMarketItemInitiator:_add_expand_character(item)
	local i = 0
	local j = 0
	for character_id, data in pairs(tweak_data.blackmarket.characters) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.characters[character_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped
		if owned then
			j = j + 1
		end
		if self:_add_character(bm_data) then
			local character_item = item:get_item(character_id)
			if not character_item then
				local params = {
					type = "MenuItemCharacterExpand",
					name = character_id,
					text_id = data.name_id,
					callback = "clicked_character",
					unlocked = unlocked and true or false,
					character_id = character_id
				}
				self:_add_character_params(params)
				character_item = CoreMenuNode.MenuNode.create_item(item, params)
				item:add_item(character_item)
			end
			character_item:parameters().equipped = equipped and true or false
			character_item:parameters().owned = owned
		end
	end
	if self:_uses_owned_stats() then
		item:set_parameter("current", j)
		item:set_parameter("total", i)
	end
	item:_show_items(nil)
	return i
end
function MenuMarketItemInitiator:_add_expand_armor(item)
	if not item then
		return
	end
	local i = 0
	local j = 0
	for armor_id, data in pairs(tweak_data.blackmarket.armors) do
		i = i + 1
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		local unlocked = bm_data.unlocked
		local owned = bm_data.owned
		local equipped = bm_data.equipped
		local condition = bm_data.condition
		if owned then
			j = j + 1
		end
		if self:_add_armor(bm_data) then
			local armor_item = item:get_item(armor_id)
			if not armor_item then
				local params = {
					type = "MenuItemArmorExpand",
					name = armor_id,
					text_id = data.name_id,
					callback = "test_clicked_armor",
					armor_id = armor_id,
					condition = condition
				}
				self:_add_armor_params(params)
				armor_item = CoreMenuNode.MenuNode.create_item(item, params)
				item:add_item(armor_item)
			end
			armor_item:parameters().equipped = equipped
			armor_item:parameters().unlocked = unlocked
			armor_item:parameters().owned = owned
			armor_item:parameters().condition = condition
		end
	end
	if self:_uses_owned_stats() then
		item:set_parameter("current", j)
		item:set_parameter("total", i)
	end
	item:_show_items(nil)
	return i
end
MenuBlackMarketInitiator = MenuBlackMarketInitiator or class(MenuMarketItemInitiator)
MenuBuyUpgradesInitiator = MenuBuyUpgradesInitiator or class()
function MenuBuyUpgradesInitiator:modify_node(original_node, weapon_id, p2, p3)
	local node = deep_clone(original_node)
	local node_name = node:parameters().name
	node:parameters().topic_id = tweak_data.weapon[weapon_id].name_id
	local scopes_item = node:item("scopes")
	self:_add_expand_upgrade(scopes_item, weapon_id, "scopes")
	local barrels_item = node:item("barrels")
	self:_add_expand_upgrade(barrels_item, weapon_id, "barrels")
	local grips_item = node:item("grips")
	self:_add_expand_upgrade(grips_item, weapon_id, "grips")
	return node
end
function MenuBuyUpgradesInitiator:_add_expand_upgrade(item, weapon_id, upgrade)
	local i = 0
	local j = 0
	local weapon_upgrades = tweak_data.weapon_upgrades.weapon[weapon_id]
	if weapon_upgrades then
		local upgrades = weapon_upgrades[upgrade]
		if upgrades then
			for _, w_upgrade in ipairs(upgrades) do
				i = i + 1
				local owned = Global.blackmarket_manager.weapon_upgrades[weapon_id][w_upgrade].owned
				if owned then
					j = j + 1
				end
				local params = {
					type = "MenuItemWeaponUpgradeExpand",
					name = w_upgrade,
					text_id = tweak_data.weapon_upgrades.upgrades[w_upgrade].name_id,
					callback = "clicked_weapon_upgrade",
					weapon_upgrade = w_upgrade,
					weapon_id = weapon_id,
					unlocked = Global.blackmarket_manager.weapon_upgrades[weapon_id][w_upgrade].unlocked,
					attached = Global.blackmarket_manager.weapon_upgrades[weapon_id][w_upgrade].attached,
					owned = owned,
					upgrade_type = upgrade
				}
				local upgrade_item = CoreMenuNode.MenuNode.create_item(item, params)
				item:add_item(upgrade_item)
			end
		end
	end
	item:set_parameter("current", j)
	item:set_parameter("total", i)
	item:_show_items(nil)
end
MenuComponentInitiator = MenuComponentInitiator or class()
function MenuComponentInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	if data and data.back_callback then
		table.insert(node:parameters().back_callback, data.back_callback)
	end
	node:parameters().menu_component_data = data
	return node
end
MenuLoadoutInitiator = MenuLoadoutInitiator or class()
function MenuLoadoutInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	node:parameters().menu_component_data = data
	node:parameters().menu_component_next_node_name = "loadout"
	return node
end
MenuCharacterCustomizationInitiator = MenuCharacterCustomizationInitiator or class(MenuMarketItemInitiator)
function MenuCharacterCustomizationInitiator:_add_weapon(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_character(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_mask(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_add_armor(bm_data)
	return bm_data.owned and bm_data.unlocked
end
function MenuCharacterCustomizationInitiator:_uses_owned_stats()
	return false
end
function MenuCharacterCustomizationInitiator:_add_weapon_params(params)
	params.customize = true
end
function MenuCharacterCustomizationInitiator:_add_mask_params(params)
	params.customize = true
end
function MenuCharacterCustomizationInitiator:_add_character_params(params)
	params.customize = true
end
function MenuCharacterCustomizationInitiator:_add_armor_params(params)
	params.customize = true
end
MenuCrimeNetInitiator = MenuCrimeNetInitiator or class()
function MenuCrimeNetInitiator:modify_node(node)
	local new_node = deep_clone(node)
	self:refresh_node(new_node)
	return new_node
end
function MenuCrimeNetInitiator:refresh_node(node)
	do return node end
	local dead_list = {}
	for _, item in ipairs(node:items()) do
		dead_list[item:parameters().name] = true
	end
	local online = {}
	local offline = {}
	for _, user in ipairs(Steam:friends()) do
		if math.random(2) == 1 and user:state() == "online" or user:state() == "away" then
			table.insert(online, user)
		else
			table.insert(offline, user)
		end
	end
	node:delete_item("online")
	if not node:item("online") then
		local params = {
			type = "MenuItemDivider",
			name = "online",
			text_id = "menu_online"
		}
		local new_item = node:create_item({
			type = "MenuItemDivider"
		}, params)
		node:add_item(new_item)
	end
	for _, user in ipairs(online) do
		local name = user:id()
		local item = node:item(name)
		if item then
			node:delete_item(name)
		end
		local params = {
			name = name,
			text_id = user:name(),
			localize = "false"
		}
		local new_item = node:create_item(nil, params)
		node:add_item(new_item)
	end
	node:delete_item("offline")
	if not node:item("offline") then
		local params = {
			type = "MenuItemDivider",
			name = "offline",
			text_id = "menu_offline"
		}
		local new_item = node:create_item({
			type = "MenuItemDivider"
		}, params)
		node:add_item(new_item)
	end
	for _, user in ipairs(offline) do
		local name = user:id()
		local item = node:item(name)
		if item then
			node:delete_item(name)
		end
		local params = {
			name = name,
			text_id = user:name(),
			localize = "false"
		}
		local new_item = node:create_item(nil, params)
		node:add_item(new_item)
	end
	for name, _ in pairs(dead_list) do
	end
	managers.menu:add_back_button(node)
	return node
end
function MenuManager:show_repair_weapon(params, weapon, cost)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_repair_weapon_title")
	dialog_data.text = managers.localization:text("dialog_repair_weapon_message", {WEAPON = weapon, COST = cost})
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = params.yes_func
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	dialog_data.button_list = {yes_button, no_button}
	managers.system_menu:show(dialog_data)
end
function MenuManager:show_buy_weapon(params, weapon, cost)
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_buy_weapon_title")
	dialog_data.text = managers.localization:text("dialog_buy_weapon_message", {WEAPON = weapon, COST = cost})
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = params.yes_func
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	dialog_data.button_list = {yes_button, no_button}
	managers.system_menu:show(dialog_data)
end
function MenuCallbackHandler:on_visit_fbi_files()
	Steam:overlay_activate("url", tweak_data.gui.fbi_files_webpage)
end
function MenuCallbackHandler:on_visit_fbi_files_suspect(item)
	if item then
		Steam:overlay_activate("url", tweak_data.gui.fbi_files_webpage .. (item and "/suspect/" .. item:name() .. "/" or ""))
	end
end
FbiFilesInitiator = FbiFilesInitiator or class()
function FbiFilesInitiator:modify_node(node, up)
	node:clean_items()
	local params = {
		name = "on_visit_fbi_files",
		text_id = "menu_visit_fbi_files",
		help_id = "menu_visit_fbi_files_help",
		callback = "on_visit_fbi_files"
	}
	local new_item = node:create_item(nil, params)
	node:add_item(new_item)
	if managers.network:session() then
		local peer = managers.network:session():local_peer()
		local params = {
			name = peer:user_id(),
			text_id = peer:name() .. " (" .. (managers.experience:current_rank() > 0 and managers.experience:rank_string(managers.experience:current_rank()) .. "-" or "") .. (managers.experience:current_level() or "") .. ")",
			callback = "on_visit_fbi_files_suspect",
			to_upper = false,
			rpc = peer:rpc(),
			peer = peer,
			localize = false,
			localize_help = false
		}
		local new_item = node:create_item(nil, params)
		node:add_item(new_item)
		for _, peer in pairs(managers.network:session():peers()) do
			local params = {
				name = peer:user_id(),
				text_id = peer:name() .. " (" .. (0 < peer:rank() and managers.experience:rank_string(peer:rank()) .. "-" or "") .. (peer:level() or "") .. ")",
				callback = "on_visit_fbi_files_suspect",
				to_upper = false,
				rpc = peer:rpc(),
				peer = peer,
				localize = false,
				localize_help = false
			}
			local new_item = node:create_item(nil, params)
			node:add_item(new_item)
		end
	end
	managers.menu:add_back_button(node)
	return node
end
function FbiFilesInitiator:refresh_node(node)
	return self:modify_node(node)
end
