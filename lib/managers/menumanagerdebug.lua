function MenuCallbackHandler:toggle_god_mode(item)
	local god_mode_on = item:value() == "on"
	Global.god_mode = god_mode_on
	if managers.player:player_unit() then
		managers.player:player_unit():character_damage():set_god_mode(god_mode_on)
	end
end
function MenuCallbackHandler:toggle_post_effects(item)
	local post_effects_on = item:value() == "on"
	Global.debug_post_effects_enabled = post_effects_on
	if not post_effects_on then
		managers.environment_controller:set_suppression_value(0)
	end
end
function MenuCallbackHandler:freeflight(item)
	if setup:freeflight() then
		setup:freeflight():enable()
		self:resume_game()
	end
end
function MenuCallbackHandler:give_weapon()
	local player = managers.player:player_unit()
	if player then
		player:inventory():add_unit_by_name(Idstring("units/weapons/mp5/mp5"), false)
	end
end
function MenuCallbackHandler:give_experience()
	if managers.job:has_active_job() then
		managers.experience:debug_add_points(managers.experience:get_xp_dissected(true, 1, true))
	else
		managers.experience:debug_add_points(2500, true)
	end
end
function MenuCallbackHandler:give_more_experience()
	managers.experience:debug_add_points(250000, false)
end
function MenuCallbackHandler:give_max_experience()
	managers.experience:debug_add_points(100000000, false)
end
function MenuCallbackHandler:debug_next_stage()
	if managers.platform:presence() == "Playing" then
		local num_winners = managers.network:session():amount_of_alive_players()
		managers.network:session():send_to_peers("mission_ended", true, num_winners)
		game_state_machine:change_state_by_name("victoryscreen", {
			num_winners = num_winners,
			personal_win = alive(managers.player:player_unit())
		})
	end
end
function MenuCallbackHandler:debug_give_alot_of_lootdrops()
	for i = 1, 4 do
		managers.lootdrop:new_debug_drop(100, true, i)
	end
end
function MenuCallbackHandler:debug_give_money()
	managers.money:debug_job_completed(3)
end
function MenuCallbackHandler:debug_give_alot_of_money()
	for stars = 1, 7 do
		for i = 1, 10 do
			managers.money:debug_job_completed(stars)
		end
	end
end
function MenuCallbackHandler:debug_show_marketplace_ui()
	XboxLive:show_marketplace_ui(0)
end
function MenuCallbackHandler:debug_kill_all_civilians()
	for u_key, u_data in pairs(managers.enemy:all_civilians()) do
		u_data.unit:base():set_slot(u_data.unit, 0)
	end
end
function MenuCallbackHandler:debug_kill_all_enemies()
	for u_key, u_data in pairs(managers.enemy:all_enemies()) do
		u_data.unit:base():set_slot(u_data.unit, 0)
	end
end
function MenuCallbackHandler:debug_kill_all_team_ai()
	for _, data in pairs(managers.groupai:state():all_AI_criminals()) do
		if data and alive(data.unit) then
			data.unit:character_damage():force_bleedout()
		end
	end
end
function MenuCallbackHandler:debug_kill_all_cameras()
	for _, unit in pairs(SecurityCamera.cameras) do
		if alive(unit) and unit:base() then
			unit:base():set_detection_enabled(false)
		end
	end
end
function MenuCallbackHandler:debug_replenish_all_ammo()
	for id, weapon in pairs(managers.player:player_unit():inventory():available_selections()) do
		if alive(weapon.unit) then
			weapon.unit:base():replenish()
			managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
		end
	end
end
function MenuCallbackHandler:debug_spawn_enemy(item)
	local pos = managers.viewport:get_current_camera_position()
	local rot = Rotation(managers.viewport:get_current_camera_rotation():y():with_z(0), math.UP)
	local ray = World:raycast("ray", pos, pos:with_z(-10000))
	if ray then
		pos = ray.position
	end
	local unit = World:spawn_unit(Idstring(item:name()), pos, rot)
	managers.groupai:state():assign_enemy_to_group_ai(unit, "law1")
end
function MenuCallbackHandler:debug_spawn_enemy_infront_of_player(unit_name)
	local player = managers.player:player_unit()
	if not alive(player) then
		return
	end
	local pos = player:position() + player:camera():forward() * 300
	local rot = Rotation(player:camera():forward():with_z(0), math.UP)
	local unit = World:spawn_unit(Idstring(unit_name), pos, rot)
	managers.groupai:state():assign_enemy_to_group_ai(unit, "law1")
end
function MenuCallbackHandler:debug_spawn_bag(item)
	local unit = managers.player:player_unit()
	local rot = managers.player:player_unit():movement():m_head_rot()
	rot = Rotation(rot:yaw(), 0, 0)
	local camera_ext = unit:camera()
	local throw_distance_multiplier_upgrade_level = managers.player:upgrade_level("carry", "throw_distance_multiplier", 0)
	if Network:is_client() then
		managers.network:session():send_to_host("server_drop_carry", item:name(), 1, true, false, 1, camera_ext:position(), camera_ext:rotation(), unit:camera():forward(), throw_distance_multiplier_upgrade_level, nil)
	else
		managers.player:server_drop_carry(item:name(), 1, true, false, 1, camera_ext:position(), camera_ext:rotation(), unit:camera():forward(), throw_distance_multiplier_upgrade_level, nil, nil)
	end
end
function MenuCallbackHandler:debug_spawn_special_equipment(item)
	managers.player:add_special({
		name = item:name(),
		amount = "1"
	})
end
function MenuCallbackHandler:toggle_contour_enabled(item)
	Global.debug_contour_enabled = item:value() == "on"
end
function MenuCallbackHandler:reset_statistics()
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_warning_title")
	dialog_data.text = managers.localization:text("dialog_are_you_sure_you_want_to_reset_statistics")
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = callback(self, self, "_dialog_reset_statistics_yes")
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	function no_button.callback_func()
	end
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	managers.system_menu:show(dialog_data)
end
function MenuCallbackHandler:_dialog_reset_statistics_yes()
	managers.statistics:reset()
	managers.savefile:save_progress()
end
function MenuCallbackHandler:give_all_achievements()
	local achievements = {
		"hot_wheels",
		"fish_ai",
		"f_in_chemistry",
		"caribbean_pirate",
		"short_fuse",
		"pink_panther",
		"big_deal",
		"i_wasnt_even_there",
		"i_knew_what_i_was_doing_was_wrong",
		"doctor_fantastic",
		"diamonds_are_forever",
		"lets_do_this",
		"yeah_hes_a_gold_digger",
		"going_all_in",
		"window_cleaner",
		"lord_of_war",
		"the_wire",
		"the_first_line",
		"king_of_the_hill",
		"you_shall_not_pass",
		"frappucino_to_go_please",
		"bullet_dodger",
		"bilbo_baggin",
		"tip_the_scales",
		"how_do_you_like_me_now",
		"iron_man",
		"armed_to_the_teeth",
		"would_you_like_your_receipt",
		"fully_loaded",
		"weapon_collector",
		"masked_villain",
		"no_one_cared_who_i_was",
		"murphys_laws",
		"no_turning_back",
		"im_a_healer_tank_damage_dealer",
		"spend_money_to_make_money",
		"going_places",
		"you_gotta_start_somewhere",
		"guilty_of_crime",
		"gone_in_30_seconds",
		"armed_and_dangerous",
		"big_shot",
		"most_wanted",
		"like_an_angry_bear",
		"halloween_1",
		"halloween_2",
		"halloween_3",
		"halloween_4",
		"halloween_5",
		"halloween_6",
		"halloween_7",
		"halloween_8",
		"halloween_9",
		"halloween_10",
		"halloween_nightmare_1",
		"halloween_nightmare_2",
		"halloween_nightmare_3",
		"halloween_nightmare_4",
		"armored_1",
		"armored_2",
		"armored_3",
		"armored_4",
		"armored_5",
		"armored_6",
		"armored_7",
		"armored_8",
		"armored_9",
		"armored_10",
		"armored_11",
		"gage_1",
		"gage_2",
		"gage_3",
		"gage_4",
		"gage_5",
		"gage_6",
		"gage_7",
		"gage_8",
		"gage_9",
		"gage_10",
		"charliesierra_1",
		"charliesierra_2",
		"charliesierra_4",
		"charliesierra_5",
		"charliesierra_6",
		"charliesierra_7",
		"charliesierra_8",
		"charliesierra_9",
		"charliesierra_3",
		"ignominy_1",
		"ignominy_2",
		"ignominy_3",
		"ignominy_4",
		"ignominy_5",
		"gage2_1",
		"gage2_2",
		"gage2_3",
		"gage2_4",
		"gage2_5",
		"gage2_6",
		"gage2_7",
		"gage2_8",
		"gage2_9",
		"gage2_10",
		"death_1",
		"death_2",
		"death_3",
		"death_4",
		"death_5",
		"death_6",
		"death_7",
		"death_8",
		"death_9",
		"death_10",
		"death_11",
		"death_12",
		"death_13",
		"death_14",
		"death_15",
		"death_16",
		"death_17",
		"death_18",
		"death_19",
		"death_20",
		"death_21",
		"death_22",
		"death_23",
		"death_24",
		"death_26",
		"death_27",
		"death_28",
		"death_29",
		"death_30",
		"death_31",
		"death_32",
		"death_33",
		"death_34",
		"death_35",
		"bob_1",
		"bob_2",
		"bob_3",
		"bob_4",
		"bob_5",
		"bob_6",
		"bob_7",
		"bob_8",
		"bob_9",
		"bob_10",
		"gmod_1",
		"gmod_2",
		"gmod_3",
		"gmod_4",
		"gmod_5",
		"gmod_6",
		"gmod_7",
		"gmod_8",
		"gmod_9",
		"gmod_10",
		"gage3_1",
		"gage3_2",
		"gage3_3",
		"gage3_4",
		"gage3_5",
		"gage3_6",
		"gage3_7",
		"gage3_8",
		"gage3_9",
		"gage3_10",
		"gage3_11",
		"gage3_12",
		"gage3_13",
		"gage3_14",
		"gage3_15",
		"gage3_16",
		"gage3_17",
		"kosugi_1",
		"kosugi_2",
		"kosugi_3",
		"kosugi_4",
		"kosugi_5",
		"kosugi_6",
		"bigbank_1",
		"bigbank_2",
		"bigbank_3",
		"bigbank_4",
		"bigbank_5",
		"bigbank_6",
		"bigbank_7",
		"bigbank_8",
		"bigbank_9",
		"bigbank_10",
		"gage4_1",
		"gage4_2",
		"gage4_3",
		"gage4_4",
		"gage4_5",
		"gage4_6",
		"gage4_7",
		"gage4_8",
		"gage4_9",
		"gage4_10",
		"gage4_11",
		"gage4_12",
		"gage5_1",
		"gage5_2",
		"gage5_3",
		"gage5_4",
		"gage5_5",
		"gage5_6",
		"gage5_7",
		"gage5_8",
		"gage5_9",
		"gage5_10",
		"pig_1",
		"pig_2",
		"pig_3",
		"pig_4",
		"pig_5",
		"pig_6",
		"pig_7",
		"squek",
		"bulldog_1",
		"bulldog_2",
		"bulldog_3",
		"bulldog_4",
		"halloween_nightmare_5",
		"eagle_1",
		"eagle_2",
		"eagle_3",
		"eagle_4",
		"eagle_5",
		"deer_1",
		"deer_2",
		"deer_3",
		"deer_4",
		"deer_5",
		"deer_6",
		"deer_7",
		"bat_1",
		"bat_2",
		"bat_3",
		"bat_4",
		"bat_5",
		"bat_6",
		"frog_1",
		"gorilla_1",
		"cow_1",
		"cow_2",
		"cow_3",
		"cow_4",
		"cow_5",
		"cow_6",
		"cow_7",
		"cow_8",
		"cow_9",
		"cow_10",
		"cow_11",
		"ameno_1",
		"ameno_2",
		"ameno_3",
		"ameno_4",
		"ameno_5",
		"ameno_6",
		"ameno_7",
		"ameno_8",
		"ignominy_6",
		"ignominy_7",
		"ignominy_8",
		"ignominy_9",
		"ignominy_10",
		"ignominy_11",
		"ignominy_12",
		"ignominy_13",
		"ignominy_14",
		"ignominy_15",
		"ignominy_16",
		"ignominy_17",
		"ignominy_18",
		"ignominy_19",
		"ignominy_20",
		"ignominy_21",
		"ignominy_22",
		"ignominy_23",
		"ignominy_24",
		"ignominy_25",
		"ovk_1",
		"ovk_2",
		"ovk_3",
		"ovk_4",
		"ovk_5",
		"ovk_6",
		"ovk_7",
		"ovk_8",
		"ovk_9",
		"ovk_10",
		"slakt_1",
		"slakt_2",
		"slakt_3",
		"slakt_4",
		"slakt_5",
		"djur_1",
		"fort_3",
		"payback_1",
		"payback_2",
		"fort_4",
		"payback_3",
		"fort_1",
		"fort_2",
		"grill_1",
		"grill_2",
		"grill_3",
		"grill_4",
		"scorpion_1",
		"scorpion_2",
		"scorpion_3",
		"scorpion_4"
	}
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_warning_title")
	dialog_data.text = managers.localization:text("dialog_are_you_sure_you_want_to_get_achievements")
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	function yes_button.callback_func()
		for _, achievement in pairs(achievements) do
			managers.achievment:award(achievement)
		end
	end
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	function no_button.callback_func()
	end
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	managers.system_menu:show(dialog_data)
end
function MenuCallbackHandler:reset_achievements()
	local dialog_data = {}
	dialog_data.title = managers.localization:text("dialog_warning_title")
	dialog_data.text = managers.localization:text("dialog_are_you_sure_you_want_to_reset_achievements")
	local yes_button = {}
	yes_button.text = managers.localization:text("dialog_yes")
	yes_button.callback_func = callback(self, self, "_dialog_reset_achievements_yes")
	local no_button = {}
	no_button.text = managers.localization:text("dialog_no")
	function no_button.callback_func()
	end
	no_button.cancel_button = true
	dialog_data.button_list = {yes_button, no_button}
	managers.system_menu:show(dialog_data)
end
function MenuCallbackHandler:_dialog_reset_achievements_yes()
	managers.achievment:clear_all_steam()
	Global.achievment_manager = nil
	managers.achievment:init()
	managers.savefile:save_progress()
end
function MenuCallbackHandler:_debug_profile_remove_items(global_value, name, type, count)
	for i = 1, count do
		managers.blackmarket:remove_item(global_value, type, name)
		managers.blackmarket:alter_global_value_item(global_value, type, nil, name, Idstring("remove_from_inventory"))
	end
end
function MenuCallbackHandler:_debug_profile_cleanup_items(global_value, name, type, unique)
	if unique then
		self:_debug_profile_remove_items(global_value, name, type, managers.blackmarket:get_item_amount(global_value, type, name) - 1)
	end
	for value, data in pairs(managers.blackmarket._global.inventory) do
		if global_value ~= value then
			local count = managers.blackmarket:get_item_amount(value, type, name, true)
			self:_debug_profile_remove_items(value, name, type, managers.blackmarket:get_item_amount(value, type, name, true))
		end
	end
end
function MenuCallbackHandler:debug_profile_all_masks()
	for name, item in pairs(tweak_data.blackmarket.masks) do
		if name ~= "character_locked" and item.pcs then
			if item.dlcs or item.dlc then
				if item.dlcs then
					for _, dlc in pairs(item.dlcs) do
						self:_debug_profile_cleanup_items(dlc, name, "masks", item.value == 0)
						if not managers.blackmarket:has_inventory_item(dlc, "masks", name) then
							managers.blackmarket:add_to_inventory(dlc, "masks", name)
						end
					end
				end
				if item.dlc then
					self:_debug_profile_cleanup_items(item.dlc, name, "masks", item.value == 0)
					if not managers.blackmarket:has_inventory_item(item.dlc, "masks", name) then
						managers.blackmarket:add_to_inventory(item.dlc, "masks", name)
					end
				end
			else
				local global_value = item.infamous and "infamous" or item.global_value or "normal"
				self:_debug_profile_cleanup_items(global_value, name, "masks", item.value == 0)
				if not managers.blackmarket:has_inventory_item(global_value, "masks", name) then
					managers.blackmarket:add_to_inventory(global_value, "masks", name)
				end
			end
		end
	end
	managers.blackmarket._global.new_drops = {}
end
function MenuCallbackHandler:debug_profile_all_materials()
	for name, item in pairs(tweak_data.blackmarket.materials) do
		if name ~= "plastic" then
			local global_value = item.infamous and "infamous" or item.global_value or item.dlc or "normal"
			self:_debug_profile_cleanup_items(global_value, name, "materials", item.value == 0)
			if not managers.blackmarket:has_inventory_item(global_value, "materials", name) then
				managers.blackmarket:add_to_inventory(global_value, "materials", name)
			end
		end
	end
	managers.blackmarket._global.new_drops = {}
end
function MenuCallbackHandler:debug_profile_all_textures()
	for name, item in pairs(tweak_data.blackmarket.textures) do
		if name ~= "no_color_no_material" and name ~= "no_color_full_material" then
			local global_value = item.infamous and "infamous" or item.global_value or item.dlc or "normal"
			self:_debug_profile_cleanup_items(global_value, name, "textures", item.value == 0)
			if not managers.blackmarket:has_inventory_item(global_value, "textures", name) then
				managers.blackmarket:add_to_inventory(global_value, "textures", name)
			end
		end
	end
	managers.blackmarket._global.new_drops = {}
end
function MenuCallbackHandler:debug_profile_all_colors()
	for name, item in pairs(tweak_data.blackmarket.colors) do
		if name ~= "nothing" then
			local global_value = item.infamous and "infamous" or item.global_value or item.dlc or "normal"
			self:_debug_profile_cleanup_items(global_value, name, "colors", item.value == 0)
			if not managers.blackmarket:has_inventory_item(global_value, "colors", name) then
				managers.blackmarket:add_to_inventory(global_value, "colors", name)
			end
		end
	end
	managers.blackmarket._global.new_drops = {}
end
function MenuCallbackHandler:debug_profile_all_mods()
	for inv_global, inv_data in pairs(managers.blackmarket._global.inventory) do
		for item_type, item_data in pairs(inv_data) do
			if item_type == "weapon_mods" then
				for wpn_mod, amount in pairs(item_data) do
					if (tweak_data.blackmarket.weapon_mods[wpn_mod].dlc or "normal") ~= inv_global then
						self:_debug_profile_remove_items(inv_global, wpn_mod, "weapon_mods", amount)
					end
				end
			end
		end
	end
	for name, item in pairs(tweak_data.blackmarket.weapon_mods) do
		managers.blackmarket:add_to_inventory(item.dlc or "normal", "weapon_mods", name)
	end
	managers.blackmarket._global.new_drops = {}
end
function MenuCallbackHandler:debug_profile_remove_all_mods()
	for inv_global, inv_data in pairs(managers.blackmarket._global.inventory) do
		for item_type, item_data in pairs(inv_data) do
			if item_type == "weapon_mods" then
				for wpn_mod, amount in pairs(item_data) do
					self:_debug_profile_remove_items(inv_global, wpn_mod, "weapon_mods", amount)
				end
			end
		end
	end
end
function MenuCallbackHandler:debug_profile_get_exp()
	local xp = 10000
	managers.experience:add_points(xp, false, true)
	managers.skilltree:give_specialization_points(xp)
end
function MenuCallbackHandler:debug_profile_get_level()
	local xp = managers.experience:next_level_data_points()
	managers.experience:add_points(xp, false, true)
	managers.skilltree:give_specialization_points(xp)
end
function MenuCallbackHandler:debug_profile_get_10_levels()
	for i = 1, 10 do
		MenuCallbackHandler:debug_profile_get_level()
	end
end
function MenuCallbackHandler:debug_profile_get_rank()
	local rank = managers.experience:current_rank()
	if rank < #tweak_data.infamy.tree then
		managers.experience:set_current_rank(rank + 1)
	end
end
function MenuCallbackHandler:debug_profile_all_levels()
	local xp = 23400000
	managers.experience:add_points(xp, false, true)
	managers.skilltree:give_specialization_points(xp)
end
function MenuCallbackHandler:debug_give_xp(xp, chunks)
	xp = tonumber(xp) or 0
	for i = 1, chunks or 1 do
		managers.experience:add_points(xp, false, true)
		managers.skilltree:give_specialization_points(xp)
	end
end
function MenuCallbackHandler:debug_profile_all_ranks()
	for rank = managers.experience:current_rank() + 1, #tweak_data.infamy.tree do
		managers.experience:set_current_rank(rank)
	end
end
function MenuCallbackHandler:debug_profile_all_specializations()
	local max_points = managers.skilltree:digest_value(Global.skilltree_manager.specializations.max_points, false)
	Global.skilltree_manager.specializations.total_points = managers.skilltree:digest_value(max_points, true)
	Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(max_points, true)
	local specialization_tweak = tweak_data.skilltree.specializations
	for tree, data in ipairs(managers.skilltree._global.specializations) do
		local total_points = 0
		for tier, spec_data in ipairs(specialization_tweak[tree]) do
			total_points = total_points + spec_data.cost
		end
		if specialization_tweak[tree] then
			local points_left = total_points - managers.skilltree:digest_value(data.points_spent, false)
			managers.skilltree:spend_specialization_points(points_left, tree)
		end
	end
	Global.skilltree_manager.specializations.points = managers.skilltree:digest_value(0, true)
	Global.skilltree_manager.specializations.points_present = managers.skilltree:digest_value(0, true)
	Global.skilltree_manager.specializations.xp_leftover = managers.skilltree:digest_value(0, true)
	Global.skilltree_manager.specializations.xp_present = managers.skilltree:digest_value(0, true)
end
function MenuCallbackHandler:debug_profile_get_cash()
	managers.money:add_to_total(50000000)
end
function MenuCallbackHandler:debug_profile_remove_levels()
	managers.experience:reset()
	managers.infamy:reset()
	managers.skilltree:reset()
	managers.blackmarket:reset_equipped()
	if managers.menu_component then
		managers.menu_component:refresh_player_profile_gui()
	end
	local logic = managers.menu:active_menu().logic
	if logic then
		logic:refresh_node()
		logic:select_item("crimenet")
	end
end
function MenuCallbackHandler:debug_choose_specialization_tier(item)
	Global.debug_specialization_tier = tonumber(item:value())
end
function MenuCallbackHandler:debug_set_specialization(item)
end
function MenuCallbackHandler:debug_retry_then_request_texture()
	managers.game_play_central:restart_the_game()
	managers.menu_component:request_texture("guis/textures/pd2/skilltree/icons_technician", function(t)
		managers.menu_component._main_panel:bitmap({texture = t})
	end)
end
function MenuCallbackHandler:print_local_steam_stats()
	self:_debug_print_stats(false, 1)
end
function MenuCallbackHandler:print_global_steam_stats()
	self:_debug_print_stats(true, 1)
end
function MenuCallbackHandler:print_global_steam_stats_yesterday()
	self:_debug_print_stats(true, -1)
end
function MenuCallbackHandler:print_global_steam_stats_7days()
	self:_debug_print_stats(true, 7)
end
function MenuCallbackHandler:print_global_steam_stats_30days()
	self:_debug_print_stats(true, 30)
end
function MenuCallbackHandler:print_global_steam_stats_60days()
	self:_debug_print_stats(true, 60)
end
function MenuCallbackHandler:print_global_steam_stats_alltime()
	self:_debug_print_stats(true)
end
function MenuCallbackHandler:_debug_print_stats(global_flag, days)
	local key
	local stats = {}
	local account = managers.network.account
	days = days or nil
	local level_list, job_list, mask_list, weapon_list, melee_list, grenade_list, enemy_list, armor_list, character_list = tweak_data.statistics:statistics_table()
	table.insert(stats, {
		name = "stat_version",
		loc = account:get_stat("stat_version"),
		glo = account:get_stat("stat_version")
	})
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
	local play_stat
	for _, play_time in ipairs(play_times) do
		key = "player_time_" .. play_time .. "h"
		play_stat = account:get_global_stat(key, days)
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = play_stat
		})
	end
	table.insert(stats, {
		name = "player_level",
		loc = account:get_stat("player_level"),
		glo = account:get_global_stat("player_level", days)
	})
	for i = 0, 100, 10 do
		key = "player_level_" .. i
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for i = 0, 25 do
		key = "player_rank_" .. i
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	key = "player_specialization_active"
	table.insert(stats, {
		name = key,
		loc = account:get_stat(key),
		glo = account:get_global_stat(key, days)
	})
	for i = 1, 10 do
		key = "player_specialization_" .. i
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	table.insert(stats, {
		name = "player_cash_0k",
		loc = account:get_stat("player_cash_0k"),
		glo = account:get_global_stat("player_cash_0k", days)
	})
	local cash_amount = 1
	for i = 0, 9 do
		key = "player_cash_" .. cash_amount .. "k"
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
		cash_amount = cash_amount * 10
	end
	local skill_data = tweak_data.skilltree.trees
	for tree_index, tree in ipairs(skill_data) do
		if tree.statistics ~= false then
			key = "skill_" .. tree.skill .. "_unlocked"
			table.insert(stats, {
				name = key,
				loc = account:get_stat(key),
				glo = account:get_global_stat(key, days)
			})
			for _, tier in ipairs(tree.tiers) do
				for _, skill in ipairs(tier) do
					key = "skill_" .. tree.skill .. "_" .. skill
					table.insert(stats, {
						name = key,
						loc = account:get_stat(key),
						glo = account:get_global_stat(key, days)
					})
					key = "skill_" .. tree.skill .. "_" .. skill .. "_ace"
					table.insert(stats, {
						name = key,
						loc = account:get_stat(key),
						glo = account:get_global_stat(key, days)
					})
				end
			end
		end
	end
	for tree_index, tree in ipairs(skill_data) do
		if tree.statistics ~= false then
			key = "skill_" .. tree.skill
			table.insert(stats, {
				name = key,
				loc = account:get_stat(key),
				glo = account:get_global_stat(key, days)
			})
			for i = 0, 35, 5 do
				key = "skill_" .. tree.skill .. "_" .. i
				table.insert(stats, {
					name = key,
					loc = account:get_stat(key),
					glo = account:get_global_stat(key, days)
				})
			end
		end
	end
	for _, difficulty in pairs(tweak_data.difficulties) do
		key = "difficulty_" .. difficulty
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for i = 0, 10 do
		key = "specialization_used_" .. i
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, weapon_name in ipairs(weapon_list) do
		key = "weapon_used_" .. weapon_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, melee_name in ipairs(melee_list) do
		key = "melee_used_" .. melee_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, grenade_name in ipairs(grenade_list) do
		key = "grenade_used_" .. grenade_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	table.insert(stats, {
		name = "gadget_used_ammo_bag",
		loc = account:get_stat("gadget_used_ammo_bag"),
		glo = account:get_global_stat("gadget_used_ammo_bag", days)
	})
	table.insert(stats, {
		name = "gadget_used_doctor_bag",
		loc = account:get_stat("gadget_used_doctor_bag"),
		glo = account:get_global_stat("gadget_used_doctor_bag", days)
	})
	table.insert(stats, {
		name = "gadget_used_trip_mine",
		loc = account:get_stat("gadget_used_trip_mine"),
		glo = account:get_global_stat("gadget_used_trip_mine", days)
	})
	table.insert(stats, {
		name = "gadget_used_sentry_gun",
		loc = account:get_stat("gadget_used_sentry_gun"),
		glo = account:get_global_stat("gadget_used_sentry_gun", days)
	})
	table.insert(stats, {
		name = "gadget_used_ecm_jammer",
		loc = account:get_stat("gadget_used_ecm_jammer"),
		glo = account:get_global_stat("gadget_used_ecm_jammer", days)
	})
	table.insert(stats, {
		name = "gadget_used_first_aid",
		loc = account:get_stat("gadget_used_first_aid"),
		glo = account:get_global_stat("gadget_used_first_aid", days)
	})
	table.insert(stats, {
		name = "gadget_used_body_bag",
		loc = account:get_stat("gadget_used_body_bag"),
		glo = account:get_global_stat("gadget_used_body_bag", days)
	})
	table.insert(stats, {
		name = "gadget_used_armor_bag",
		loc = account:get_stat("gadget_used_armor_bag"),
		glo = account:get_global_stat("gadget_used_armor_bag", days)
	})
	for _, mask_name in ipairs(mask_list) do
		key = "mask_used_" .. mask_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, armor_name in ipairs(armor_list) do
		key = "armor_used_" .. armor_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, character_name in ipairs(character_list) do
		key = "character_used_" .. character_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, weapon_name in ipairs(weapon_list) do
		key = "weapon_kills_" .. weapon_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, melee_name in ipairs(melee_list) do
		key = "melee_kills_" .. melee_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, grenade_name in ipairs(grenade_list) do
		key = "grenade_kills_" .. grenade_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, enemy_name in ipairs(enemy_list) do
		key = "enemy_kills_" .. enemy_name
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	table.insert(stats, {
		name = "heist_success",
		loc = account:get_stat("heist_success"),
		glo = account:get_global_stat("heist_success", days)
	})
	table.insert(stats, {
		name = "heist_failed",
		loc = account:get_stat("heist_failed"),
		glo = account:get_global_stat("heist_failed", days)
	})
	for _, level_id in ipairs(level_list) do
		key = "level_" .. level_id
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, job_id in ipairs(job_list) do
		key = "job_" .. job_id
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	for _, job_id in ipairs(job_list) do
		key = "contract_" .. job_id .. "_win"
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
		key = "contract_" .. job_id .. "_win_dropin"
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
		key = "contract_" .. job_id .. "_fail"
		table.insert(stats, {
			name = key,
			loc = account:get_stat(key),
			glo = account:get_global_stat(key, days)
		})
	end
	table.insert(stats, {
		name = "option_decide_host",
		loc = account:get_stat("option_decide_host"),
		glo = account:get_global_stat("option_decide_host", days)
	})
	table.insert(stats, {
		name = "option_decide_vote",
		loc = account:get_stat("option_decide_vote"),
		glo = account:get_global_stat("option_decide_vote", days)
	})
	table.insert(stats, {
		name = "option_decide_none",
		loc = account:get_stat("option_decide_none"),
		glo = account:get_global_stat("option_decide_none", days)
	})
	table.insert(stats, {
		name = "info_playing_win_host",
		loc = account:get_stat("info_playing_win_host"),
		glo = account:get_global_stat("info_playing_win_host", days)
	})
	table.insert(stats, {
		name = "info_playing_win_client",
		loc = account:get_stat("info_playing_win_client"),
		glo = account:get_global_stat("info_playing_win_client", days)
	})
	table.insert(stats, {
		name = "info_playing_win_client_dropin",
		loc = account:get_stat("info_playing_win_client_dropin"),
		glo = account:get_global_stat("info_playing_win_client_dropin", days)
	})
	table.insert(stats, {
		name = "info_playing_fail_host",
		loc = account:get_stat("info_playing_fail_host"),
		glo = account:get_global_stat("info_playing_fail_host", days)
	})
	table.insert(stats, {
		name = "info_playing_fail_client",
		loc = account:get_stat("info_playing_fail_client"),
		glo = account:get_global_stat("info_playing_fail_client", days)
	})
	table.insert(stats, {
		name = "info_playing_normal",
		loc = account:get_stat("info_playing_normal"),
		glo = account:get_global_stat("info_playing_normal", days)
	})
	table.insert(stats, {
		name = "info_playing_beta",
		loc = account:get_stat("info_playing_beta"),
		glo = account:get_global_stat("info_playing_beta", days)
	})
	table.insert(stats, {
		name = "stats_election_day_s",
		loc = account:get_stat("stats_election_day_s"),
		glo = account:get_global_stat("stats_election_day_s", days)
	})
	table.insert(stats, {
		name = "stats_election_day_n",
		loc = account:get_stat("stats_election_day_n"),
		glo = account:get_global_stat("stats_election_day_n", days)
	})
	table.insert(stats, {
		name = "payday2",
		loc = account:get_stat("payday2"),
		glo = account:get_global_stat("payday2", days)
	})
	local err = false
	for key, data in pairs(stats) do
		if not Steam:sa_handler():set_stat(data.name, data.loc) then
			Application:error("[StatisticsManager:debug_print_stats] WARNING - Stat is missing on Steam: '" .. data.name .. "'")
			err = true
		end
	end
	if err then
		Application:throw_exception("[StatisticsManager:debug_print_stats] Missing statistics, needs to be added!!")
	end
	print("----------------------------------")
	if (days ~= 1 or not "TODAY") and (days ~= -1 or not "YESTERDAY") and (days or not "ALLTIME") then
	end
	print((global_flag and "GLOBAL" or "LOCAL") .. " STEAM STATISTICS FOR " .. "LAST " .. days .. " DAYS")
	print("----------------------------------")
	for key, data in pairs(stats) do
		print(data.name, global_flag and data.glo or data.loc)
	end
	print("----------------------------------")
end
MenuSpawnUnit = MenuSpawnUnit or class()
function MenuSpawnUnit:modify_node(node, data)
	node:clean_items()
	local unit_table = {}
	for _, unit_data in pairs(PackageManager:all_loaded_unit_data()) do
		if unit_data:type() == Idstring("being") and unit_data:network_sync() == "spawn" and unit_data:slot() ~= 16 then
			local path_name = unit_data:name():s()
			local unit_name = string.sub(path_name, string.match(path_name, "^.*()/") + 1)
			table.insert(unit_table, {name = unit_name, path = path_name})
		end
	end
	table.sort(unit_table, function(a, b)
		return a.name < b.name
	end)
	for _, unit_name in pairs(unit_table) do
		local item = node:create_item(nil, {
			name = unit_name.path,
			text_id = unit_name.name,
			align = "left",
			localize = "false",
			callback = "debug_spawn_enemy"
		})
		node:add_item(item)
	end
	return node
end
MenuSpawnBag = MenuSpawnBag or class()
function MenuSpawnBag:modify_node(node, data)
	node:clean_items()
	local carry_table = {}
	for carry_id, carry_data in pairs(tweak_data.carry) do
		if carry_data.name_id then
			table.insert(carry_table, {
				name = carry_id,
				text = carry_data.name_id
			})
		end
	end
	table.sort(carry_table, function(a, b)
		return a.name < b.name
	end)
	for _, data in pairs(carry_table) do
		local item = node:create_item(nil, {
			name = data.name,
			text_id = data.text,
			align = "left",
			callback = "debug_spawn_bag"
		})
		node:add_item(item)
	end
	return node
end
MenuSpawnSpecialEquipment = MenuSpawnSpecialEquipment or class()
function MenuSpawnSpecialEquipment:modify_node(node, data)
	node:clean_items()
	local equipment_table = {}
	for equipment_id, equipment_data in pairs(tweak_data.equipments.specials) do
		if equipment_data.text_id and equipment_data.sync_possession then
			table.insert(equipment_table, {
				name = equipment_id,
				text = equipment_data.text_id
			})
		end
	end
	table.sort(equipment_table, function(a, b)
		return a.name < b.name
	end)
	for _, data in pairs(equipment_table) do
		local item = node:create_item(nil, {
			name = data.name,
			text_id = data.text,
			align = "left",
			callback = "debug_spawn_special_equipment"
		})
		node:add_item(item)
	end
	return node
end
DynamicLevelCreator = DynamicLevelCreator or class()
function DynamicLevelCreator:modify_node(node)
	print("DynamicLevelCreator:modify_node", inspect(node))
	local single_player = node:parameters().single_player
	local new_node = deep_clone(node)
	for _, level_id in ipairs(tweak_data.levels:get_level_index()) do
		local level_data = tweak_data.levels[level_id]
		local params = {
			name = "pick_" .. level_id,
			level_id = level_id,
			text_id = managers.localization:text(level_data.name_id),
			help_id = single_player and "menu_start_the_game_help" or "menu_start_lobby_help",
			difficulty = 1,
			localize = "false",
			callback = single_player and "lobby_start_campaign" or "lobby_create_campaign",
			info_panel = "lobby_campaign",
			title_id = "menu_campaign"
		}
		local new_item = new_node:create_item(nil, params)
		new_node:add_item(new_item)
	end
	managers.menu:add_back_button(new_node)
	return new_node
end
DynamicJobCreator = DynamicJobCreator or class()
function DynamicJobCreator:modify_node(node)
	print("DynamicJobCreator:modify_node", inspect(node))
	local new_node = node
	new_node:clean_items()
	if not new_node:item("back") then
		local params
		if node:parameters().single_player then
			params = {
				name = "play_single_player_dynamicly",
				text_id = "menu_setup_game",
				next_node = "play_single_player_dynamicly"
			}
		else
			params = {
				name = "setup_game",
				text_id = "menu_setup_game",
				help_id = "menu_setup_game_help",
				next_node = "create_lobby_dynamicly",
				callback = "play_online_game"
			}
		end
		local new_item = new_node:create_item(nil, params)
		new_node:add_item(new_item)
		self:create_divider(node, "div1", nil, nil, nil)
		if not node:parameters().single_player then
			local params = {
				name = "play_PSN_online",
				text_id = "menu_play_online",
				help_id = "menu_play_online_help",
				next_node = "play_PSN_online",
				callback = "find_online_games",
				visible_callback = "is_ps3"
			}
			local new_item = new_node:create_item(nil, params)
			new_node:add_item(new_item)
			local params = {
				name = "play_STEAM_online",
				text_id = "menu_play_online",
				help_id = "menu_play_online_help",
				next_node = "play_STEAM_online",
				callback = "find_online_games",
				visible_callback = "is_win32"
			}
			local new_item = new_node:create_item(nil, params)
			new_node:add_item(new_item)
			local params = {
				name = "play_PSN_with_friends",
				text_id = "menu_play_with_friends",
				help_id = "menu_play_with_friends_help",
				next_node = "play_PSN_online_with_friends",
				callback = "find_online_games_with_friends",
				visible_callback = "is_ps3"
			}
			local new_item = new_node:create_item(nil, params)
			new_node:add_item(new_item)
			local params = {
				name = "play_STEAM_with_friends",
				text_id = "menu_play_with_friends",
				help_id = "menu_play_with_friends_help",
				next_node = "play_STEAM_online_with_friends",
				callback = "find_online_games_with_friends",
				visible_callback = "is_win32"
			}
			local new_item = new_node:create_item(nil, params)
			new_node:add_item(new_item)
			local params = {
				name = "view_invites",
				text_id = "menu_view_invites",
				help_id = "menu_view_invites_help",
				callback = "view_invites",
				visible_callback = "is_ps3"
			}
			local new_item = new_node:create_item(nil, params)
			new_node:add_item(new_item)
			self:create_divider(node, "div2", nil, nil, nil)
		end
		local jobs = {}
		for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
			local job_data = tweak_data.narrative:job_data(job_id)
			local dlc = job_data.dlc
			dlc = true
			if dlc and not tweak_data.narrative:is_wrapped_to_job(job_id) then
				self:create_job(new_node, job_id)
			end
		end
	end
	managers.menu:add_back_button(new_node)
	return new_node
end
function DynamicJobCreator:create_job(node, job_id)
	local text_id, color_ranges = tweak_data.narrative:create_job_name(job_id)
	local single_player = node:parameters().single_player
	local ghostable = managers.job:is_job_ghostable(job_id)
	if ghostable then
		text_id = text_id .. " " .. managers.localization:get_default_macro("BTN_GHOST")
	end
	local params = {
		name = "pick" .. job_id,
		text_id = text_id,
		color_ranges = color_ranges,
		localize = "false",
		callback = single_player and "debug_start_single_player_job" or "debug_start_job",
		job_id = job_id
	}
	local data_node = {}
	local new_item = node:create_item(data_node, params)
	node:add_item(new_item)
end
function DynamicJobCreator:create_divider(node, id, text_id, size, color)
	local params = {
		name = "divider_" .. id,
		no_text = not text_id,
		text_id = text_id,
		localize = "false",
		size = size or 8,
		color = color
	}
	local data_node = {
		type = "MenuItemDivider"
	}
	local new_item = node:create_item(data_node, params)
	node:add_item(new_item)
end
function MenuCallbackHandler:debug_start_single_player_job(item)
	MenuCallbackHandler:start_single_player_job({
		job_id = item:parameters().job_id,
		difficulty = "normal"
	})
end
function MenuCallbackHandler:debug_start_job(item)
	MenuCallbackHandler:start_job({
		job_id = item:parameters().job_id,
		difficulty = "normal"
	})
end
