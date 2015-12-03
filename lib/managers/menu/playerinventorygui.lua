require("lib/managers/menu/WalletGuiObject")
require("lib/utils/InventoryDescription")
local IS_WIN_32 = SystemInfo:platform() == Idstring("WIN32")
local NOT_WIN_32 = not IS_WIN_32
local TOP_ADJUSTMENT = NOT_WIN_32 and 50 or 55
local BOT_ADJUSTMENT = NOT_WIN_32 and 50 or 60
local select_anim = function(o, box, instant)
	if box.image_object then
		local object = box.image_object
		do
			local current_width = object.gui:w()
			local current_height = object.gui:h()
			local end_width = object.shape[3]
			local end_height = object.shape[4]
			local cx, cy = object.gui:center()
			if instant then
				object.gui:set_size(end_width, end_height)
				object.gui:set_center(cx, cy)
			else
				over(0.2, function(p)
				-- upvalues: object , current_width , end_width , current_height , end_height , cx , cy
				object.gui:set_size(math.lerp(current_width, end_width, p), math.lerp(current_height, end_height, p))
				object.gui:set_center(cx, cy)
      end)
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

local unselect_anim = function(o, box, instant)
	if box.image_object then
		local object = box.image_object
		do
			local current_width = object.gui:w()
			local current_height = object.gui:h()
			local end_width = object.shape[3] * 0.8
			local end_height = object.shape[4] * 0.8
			local cx, cy = object.gui:center()
			if instant then
				object.gui:set_size(end_width, end_height)
				object.gui:set_center(cx, cy)
			else
				over(0.2, function(p)
				-- upvalues: object , current_width , end_width , current_height , end_height , cx , cy
				object.gui:set_size(math.lerp(current_width, end_width, p), math.lerp(current_height, end_height, p))
				object.gui:set_center(cx, cy)
      end)
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

if not PlayerInventoryGui then
	PlayerInventoryGui = class()
end
local make_fine_text = function(text)
		local x, y, w, h = text:text_rect()
		text:set_size(w, h)
		text:set_position(math.round(text:x()), math.round(text:y()))
  end
PlayerInventoryGui.init = function(self, ws, fullscreen_ws, node)
	-- upvalues: make_fine_text , TOP_ADJUSTMENT , select_anim , unselect_anim , BOT_ADJUSTMENT
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	self._panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()
	self._show_all_panel = self._ws:panel():panel({visible = false, w = self._ws:panel():w() * 0.75, h = tweak_data.menu.pd2_medium_font_size})
	self._show_all_panel:set_righttop(self._ws:panel():w(), 0)
	local show_all_text = self._show_all_panel:text({text = managers.localization:to_upper_text(managers.menu:is_pc_controller() and "menu_show_all" or "menu_legend_show_all", {BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")}), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, blend_mode = "add"})
	make_fine_text(show_all_text)
	show_all_text:set_right(self._show_all_panel:w())
	show_all_text:set_center_y(self._show_all_panel:h() / 2)
	if not managers.menu:is_pc_controller() then
		self._show_all_panel:set_bottom(self._ws:panel():h())
	end
	show_all_text:set_world_position(math.round(show_all_text:world_x()), math.round(show_all_text:world_y()))
	self._boxes = {}
	self._boxes_by_name = {}
	self._boxes_by_layer = {}
	self._mod_boxes = {}
	self._max_layer = 1
	managers.menu_component:close_contract_gui()
	if not node:parameters().menu_component_data then
		self._data = {selected_box = "character"}
	end
	self._node:parameters().menu_component_data = self._data
	self._input_focus = 1
	WalletGuiObject.set_wallet(self._panel)
	local y = TOP_ADJUSTMENT
	local title_text = self._panel:text({name = "title", text = managers.localization:to_upper_text("menu_player_inventory"), font = tweak_data.menu.pd2_large_font, font_size = tweak_data.menu.pd2_large_font_size, color = tweak_data.screen_colors.text, layer = 1})
	make_fine_text(title_text)
	local back_button = self._panel:text({name = "back_button", text = managers.localization:to_upper_text("menu_back"), align = "right", vertical = "bottom", font = tweak_data.menu.pd2_large_font, font_size = tweak_data.menu.pd2_large_font_size, color = tweak_data.screen_colors.button_stage_3, layer = 1})
	make_fine_text(back_button)
	back_button:set_right(self._panel:w())
	back_button:set_bottom(self._panel:h())
	back_button:set_visible(managers.menu:is_pc_controller())
	if MenuBackdropGUI then
		local massive_font = tweak_data.menu.pd2_massive_font
		local massive_font_size = tweak_data.menu.pd2_massive_font_size
		local bg_text = self._fullscreen_panel:text({text = title_text:text(), h = 90, align = "left", vertical = "top", font = massive_font, font_size = massive_font_size, color = tweak_data.screen_colors.button_stage_3, alpha = 0.4})
		local x, y = managers.gui_data:safe_to_full_16_9(managers.gui_data, title_text:world_x(), title_text:world_center_y())
		bg_text:set_world_left(x)
		bg_text:set_world_center_y(y)
		bg_text:move(-13, 9)
		MenuBackdropGUI.animate_bg_text(self, bg_text)
	if managers.menu:is_pc_controller() then
		end
		local bg_back = self._fullscreen_panel:text({name = "back_button", text = back_button:text(), h = 90, align = "right", vertical = "bottom", font = massive_font, font_size = massive_font_size, color = tweak_data.screen_colors.button_stage_3, alpha = 0.4, layer = 0})
		local x, y = managers.gui_data:safe_to_full_16_9(managers.gui_data, back_button:world_right(), back_button:world_center_y())
		bg_back:set_world_right(x)
		bg_back:set_world_center_y(y)
		bg_back:move(13, -9)
		MenuBackdropGUI.animate_bg_text(self, bg_back)
	end
	local padding_x = 10
	local padding_y = 0
	local x = self._panel:w() - 500
	local y = TOP_ADJUSTMENT + tweak_data.menu.pd2_small_font_size
	local width = self._panel:w() - x
	local height = 540
	local combined_width = width - padding_x * 2
	local combined_height = height - padding_y * 3
	local box_width = combined_width / 3
	local box_height = combined_height / 4
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	if player_loadout_data.primary.item_bg_texture then
		local primary_box = self:create_box({name = "primary", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_primaries"), text = player_loadout_data.primary.info_text, image = player_loadout_data.primary.item_texture, bg_image = player_loadout_data.primary.item_bg_texture, text_selected_color = player_loadout_data.primary.info_text_color, use_background = true, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.white:with_alpha(0.75), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_primary_menu"), right = callback(self, self, "preview_primary"), up = callback(self, self, "previous_primary"), down = callback(self, self, "next_primary")}})
		if player_loadout_data.secondary.item_bg_texture then
			local secondary_box = self:create_box({name = "secondary", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_secondaries"), text = player_loadout_data.secondary.info_text, image = player_loadout_data.secondary.item_texture, bg_image = player_loadout_data.secondary.item_bg_texture, text_selected_color = player_loadout_data.secondary.info_text_color, use_background = true, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.white:with_alpha(0.75), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_secondary_menu"), right = callback(self, self, "preview_secondary"), up = callback(self, self, "previous_secondary"), down = callback(self, self, "next_secondary")}})
			local melee_box = self:create_box({name = "melee", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_melee_weapons"), text = player_loadout_data.melee_weapon.info_text, image = player_loadout_data.melee_weapon.item_texture, 
dual_image = {player_loadout_data.melee_weapon.dual_texture_1, player_loadout_data.melee_weapon.dual_texture_2}, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_melee_menu"), right = callback(self, self, "preview_melee"), up = callback(self, self, "previous_melee"), down = callback(self, self, "next_melee")}})
			local throwable_box = self:create_box({name = "throwable", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_grenades"), text = player_loadout_data.grenade.info_text, image = player_loadout_data.grenade.item_texture, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_throwable_menu"), right = callback(self, self, "preview_throwable"), up = callback(self, self, "previous_throwable"), down = callback(self, self, "next_throwable")}})
			local armor_box = self:create_box({name = "armor", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_armors"), text = player_loadout_data.armor.info_text, image = player_loadout_data.armor.item_texture, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_armor_menu"), right = false, up = callback(self, self, "previous_armor"), down = callback(self, self, "next_armor")}})
			local deployable_box = self:create_box({name = "deployable", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_deployables"), text = player_loadout_data.deployable.info_text, image = player_loadout_data.deployable.item_texture, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_deployable_menu"), right = false, up = callback(self, self, "previous_deployable"), down = callback(self, self, "next_deployable")}})
			local mask_box = self:create_box({name = "mask", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("bm_menu_masks"), text = player_loadout_data.mask.info_text, image = player_loadout_data.mask.item_texture, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_mask_menu"), right = callback(self, self, "preview_mask"), up = callback(self, self, "previous_mask"), down = callback(self, self, "next_mask")}})
			if not managers.network:session() or not {right = false} then
				local character_box = self:create_box({name = "character", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("menu_preferred_character"), text = player_loadout_data.character.info_text, image = player_loadout_data.character.item_texture, alpha = managers.network:session() and 0.2 or 1, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_character_menu"), right = false, up = callback(self, self, "previous_character"), down = callback(self, self, "next_character")}})
				local skill_box = self:create_box({name = "skilltree", w = box_width, h = box_height, unselected_text = managers.localization:to_upper_text("menu_st_skilltree"), text = managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}), image = false, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_skilltree_menu"), right = false, up = callback(self, self, "previous_skilltree"), down = callback(self, self, "next_skilltree")}})
				local texture_rect_x = 0
				local texture_rect_y = 0
				local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
				local specialization_data = tweak_data.skilltree.specializations[current_specialization]
				local specialization_text = specialization_data and managers.localization:text(specialization_data.name_id) or " "
				if specialization_data then
					local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
					local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
					local tier_data = specialization_data[max_tier]
				if tier_data then
					end
					texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
					texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
					specialization_text = specialization_text .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")"
				end
				local specialization_box = self:create_box({name = "specialization", w = box_width, h = box_height, image_size_mul = 0.8, unselected_text = managers.localization:to_upper_text("menu_specialization"), text = specialization_text, image = "guis/textures/pd2/specialization/icons_atlas", 
image_rect = {(texture_rect_x) * 64, (texture_rect_y) * 64, 64, 64}, select_anim = select_anim, unselect_anim = unselect_anim, bg_color = Color.black:with_alpha(0.05), bg_blend_mode = "normal", 
clbks = {left = callback(self, self, "open_specialization_menu"), right = false, up = callback(self, self, "previous_specialization"), down = callback(self, self, "next_specialization")}})
				local box_matrix = {
{"character", "primary", "deployable"}, 
{"mask", "secondary", "armor"}, 
{nil, "melee", "skilltree"}, 
{nil, "throwable", "specialization"}}
				self:sort_boxes_by_matrix(box_matrix)
				local character_panel = self._panel:panel()
				local weapons_panel = self._panel:panel()
				local eqpt_skills_panel = self._panel:panel()
				character_panel:set_shape(character_box:left(), character_box:top(), mask_box:right() - character_box:left(), mask_box:bottom() - character_box:top())
				weapons_panel:set_shape(primary_box:left(), primary_box:top(), throwable_box:right() - primary_box:left(), throwable_box:bottom() - primary_box:top())
				eqpt_skills_panel:set_shape(deployable_box:left(), deployable_box:top(), specialization_box:right() - deployable_box:left(), specialization_box:bottom() - deployable_box:top())
				character_panel:set_w(math.floor(eqpt_skills_panel:w()))
				weapons_panel:set_w(math.floor(eqpt_skills_panel:w()))
				eqpt_skills_panel:set_w(math.floor(eqpt_skills_panel:w()))
				eqpt_skills_panel:set_right(self._panel:w())
				weapons_panel:set_right(eqpt_skills_panel:left() - padding_x)
				character_panel:set_right(weapons_panel:left() - padding_x)
				character_panel:rect({color = Color.black, alpha = 0.4})
				weapons_panel:rect({color = Color.black, alpha = 0.4})
				eqpt_skills_panel:rect({color = Color.black, alpha = 0.4})
				local column_one_box_panel = self._panel:panel()
				column_one_box_panel:set_shape(character_panel:shape())
				local column_two_box_panel = self._panel:panel()
				column_two_box_panel:set_shape(weapons_panel:shape())
				local column_three_box_panel = self._panel:panel()
				column_three_box_panel:set_shape(eqpt_skills_panel:shape())
				self._column_one_box = BoxGuiObject:new(column_one_box_panel, {
sides = {1, 1, 2, 2}})
				self._column_two_box = BoxGuiObject:new(column_two_box_panel, {
sides = {1, 1, 2, 2}})
				self._column_three_box = BoxGuiObject:new(column_three_box_panel, {
sides = {1, 1, 2, 2}})
				local character_text = self._panel:text({text = managers.localization:to_upper_text("menu_player_column_one_title"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, blend_mode = "add", color = tweak_data.screen_colors.text})
				local weapons_text = self._panel:text({text = managers.localization:to_upper_text("menu_player_column_two_title"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, blend_mode = "add", color = tweak_data.screen_colors.text})
				local eqpt_skills_text = self._panel:text({text = managers.localization:to_upper_text("menu_player_column_three_title"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, blend_mode = "add", color = tweak_data.screen_colors.text})
				make_fine_text(character_text)
				make_fine_text(weapons_text)
				make_fine_text(eqpt_skills_text)
				character_text:set_rightbottom(character_panel:right(), character_panel:top())
				weapons_text:set_rightbottom(weapons_panel:right(), weapons_panel:top())
				eqpt_skills_text:set_rightbottom(eqpt_skills_panel:right(), eqpt_skills_panel:top())
				if not managers.network.account:username() then
					local alias_text = self._panel:text({x = 2, y = TOP_ADJUSTMENT, text = tostring(managers.blackmarket:get_preferred_character_real_name()), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, blend_mode = "add", color = tweak_data.screen_colors.text})
					make_fine_text(alias_text)
					local player_panel = self._panel:panel({x = 0, y = TOP_ADJUSTMENT + tweak_data.menu.pd2_small_font_size, w = 320, h = 310})
					self._player_panel = player_panel
					self._player_box_panel = self._panel:panel()
					self._player_box_panel:set_shape(player_panel:shape())
					self._player_box = BoxGuiObject:new(self._player_box_panel, {
sides = {1, 1, 2, 1}})
					if not managers.experience:next_level_data() then
						local next_level_data = {}
					end
					local player_level = managers.experience:current_level()
					local player_rank = managers.experience:current_rank()
					local is_infamous = player_rank > 0
					local size = 96
					local player_level_panel = player_panel:panel({name = "player_level_panel", w = size, h = size, x = 10, y = 10})
					player_level_panel:bitmap({texture = "guis/textures/pd2/endscreen/exp_ring", 
texture_rect = {16, 16, 224, 224}, w = size, h = size, color = Color.white, alpha = 0.4})
					player_level_panel:bitmap({texture = "guis/textures/pd2/endscreen/exp_ring", 
texture_rect = {16, 16, 224, 224}, color = Color((next_level_data.current_points or 1) / (next_level_data.points or 1), 1, 1), w = size, h = size, layer = 1, render_template = "VertexColorTexturedRadial", blend_mode = "add"})
					player_level_panel:text({text = tostring(player_level), font = tweak_data.menu.pd2_medium_font, font_size = tweak_data.menu.pd2_medium_font_size, align = "center", vertical = "center"})
					local player_rank_panel = player_panel:panel({name = "player_rank_panel", w = size / 2, h = size / 2, x = player_level_panel:right() + 2, y = player_level_panel:top()})
					local texture, texture_rect = "guis/textures/pd2/inv_infamycard_bg", {0, 0, 29, 43}
					local player_rank_bitmap = player_rank_panel:bitmap({texture = texture, texture_rect = texture_rect})
					local panel_width = player_rank_panel:width()
					local panel_height = player_rank_panel:height()
					local texture_width = 64
					local texture_height = 92
					local aspect = panel_width / panel_height
					do
						local sw = math.max(texture_width, texture_height * aspect)
						local sh = math.max(texture_height, texture_width / aspect)
						local dw = texture_width / sw
						local dh = texture_height / sh
						player_rank_bitmap:set_size(math.round(dw * panel_width * 0.9), math.round(dh * panel_height * 0.9))
						player_rank_bitmap:set_center(panel_width / 2, panel_height / 2)
					end
					local rank_text = player_rank_panel:text({text = managers.experience:rank_string(player_rank), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, align = "center", vertical = "center", layer = 1, color = Color.black})
					local _, _, w, _ = rank_text:text_rect()
					if 0 < w and player_rank_bitmap:w() - 6 <= w then
						rank_text:set_font_size(rank_text:font_size() * ((player_rank_bitmap:w() - 6) / w))
					end
					local detection_panel = player_panel:panel({name = "detection_panel", layer = 0, x = player_level_panel:right() + 2, y = player_rank_panel:bottom(), w = size / 2, h = size / 2})
					local detection_ring_left_bg = detection_panel:bitmap({name = "detection_left_bg", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.2, blend_mode = "add", layer = 0, w = detection_panel:w(), h = detection_panel:h()})
					local detection_ring_right_bg = detection_panel:bitmap({name = "detection_right_bg", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.2, blend_mode = "add", layer = 0, w = detection_panel:w(), h = detection_panel:h()})
					detection_ring_right_bg:set_texture_rect(64, 0, -64, 64)
					local detection_ring_left = detection_panel:bitmap({name = "detection_left", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.5, render_template = "VertexColorTexturedRadial", blend_mode = "add", layer = 1, w = detection_panel:w(), h = detection_panel:h()})
					local detection_ring_right = detection_panel:bitmap({name = "detection_right", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.5, render_template = "VertexColorTexturedRadial", blend_mode = "add", layer = 1, w = detection_panel:w(), h = detection_panel:h()})
					detection_ring_right:set_texture_rect(64, 0, -64, 64)
					local detection_ring_left2 = detection_panel:bitmap({name = "detection_left2", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.5, render_template = "VertexColorTexturedRadial", blend_mode = "add", layer = 1, w = detection_panel:w(), h = detection_panel:h()})
					local detection_ring_right2 = detection_panel:bitmap({name = "detection_right2", texture = "guis/textures/pd2/blackmarket/inv_detection_meter", alpha = 0.5, render_template = "VertexColorTexturedRadial", blend_mode = "add", layer = 1, w = detection_panel:w(), h = detection_panel:h()})
					detection_ring_right2:set_texture_rect(64, 0, -64, 64)
					local detection_value = detection_panel:text({name = "detection_value", text = "", font = tweak_data.menu.pd2_medium_font, font_size = tweak_data.menu.pd2_medium_font_size, alpha = 1, visible = true, blend_mode = "add", w = 64, h = 64})
					self._player_stats_panel = player_panel:panel({name = "player_stats_panel", x = 10, w = player_panel:w() - 20, h = 160})
					self._player_stats_panel:set_bottom(player_panel:h() - 10)
					self:setup_player_stats(self._player_stats_panel)
					local info_panel = self._panel:panel({name = "info_panel", x = 0, y = player_panel:bottom() + 10, w = player_panel:w(), h = self._panel:h() - player_panel:top() - BOT_ADJUSTMENT - player_panel:h() - 10})
					BoxGuiObject:new(info_panel, {
sides = {1, 1, 1, 1}})
					local info_content_panel = info_panel:panel({layer = 1})
					info_content_panel:grow(-20, -20)
					info_content_panel:move(10, 10)
					self._info_text = info_content_panel:text({text = "", font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, wrap = true, word_wrap = true, blend_mode = "add"})
					self._info_panel = info_content_panel:panel({layer = 1})
					self:set_info_text("")
					self._legends_panel = self._panel:panel({w = self._panel:w() * 0.75, h = tweak_data.menu.pd2_medium_font_size})
					self._legends = {}
					if managers.menu:is_pc_controller() then
						self._legends_panel:set_righttop(self._panel:w(), 0)
						local panel = self._legends_panel:panel({name = "select", visible = false})
						local icon = panel:bitmap({name = "icon", texture = "guis/textures/pd2/mouse_buttons", 
texture_rect = {1, 1, 17, 23}, w = 17, h = 23, blend_mode = "add"})
						do
							local text = panel:text({text = managers.localization:to_upper_text("menu_mouse_select"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, blend_mode = "add"})
							make_fine_text(text)
							text:set_left(icon:right() + 2)
							text:set_center_y(icon:center_y())
							panel:set_w(text:right())
							self._legends.select = panel
						end
						local panel = self._legends_panel:panel({name = "preview", visible = false})
						local icon = panel:bitmap({name = "icon", texture = "guis/textures/pd2/mouse_buttons", 
texture_rect = {18, 1, 17, 23}, w = 17, h = 23, blend_mode = "add"})
						do
							local text = panel:text({text = managers.localization:to_upper_text("menu_mouse_preview"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, blend_mode = "add"})
							make_fine_text(text)
							text:set_left(icon:right() + 2)
							text:set_center_y(icon:center_y())
							panel:set_w(text:right())
							self._legends.preview = panel
						end
						local panel = self._legends_panel:panel({name = "switch", visible = false})
						local icon = panel:bitmap({name = "icon", texture = "guis/textures/pd2/mouse_buttons", 
texture_rect = {35, 1, 17, 23}, w = 17, h = 23, blend_mode = "add"})
						do
							local text = panel:text({text = managers.localization:to_upper_text("menu_mouse_switch"), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, blend_mode = "add"})
							make_fine_text(text)
							text:set_left(icon:right() + 2)
							text:set_center_y(icon:center_y())
							panel:set_w(text:right())
							self._legends.switch = panel
						end
						local panel = self._legends_panel:panel({name = "hide_all", visible = false})
						local text = panel:text({text = managers.localization:to_upper_text("menu_hide_all", {BTN_X = managers.localization:btn_macro("menu_toggle_voice_message")}), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, blend_mode = "add"})
						make_fine_text(text)
						text:set_center_y(panel:h() / 2)
						panel:set_w(text:right())
						self._legends.hide_all = panel
					else
						self._legends_panel:set_rightbottom(self._panel:w(), self._panel:h())
						self._legends_panel:text({name = "text", text = "", font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, color = tweak_data.screen_colors.text, blend_mode = "add", align = "right", halign = "right", valign = "bottom", vertical = "bottom"})
					end
					self._text_buttons = {}
					local alias_show_button, alias_hide_button, column_one_show_button, column_one_hide_button, column_two_show_button, column_two_hide_button, column_three_show_button, column_three_hide_button = nil, nil, nil, nil, nil, nil, nil, nil
					local alias_hide_func = function()
						-- upvalues: alias_show_button , alias_hide_button , self , info_panel
						if alive(alias_show_button) then
							alias_show_button:hide()
						end
						if alive(alias_hide_button) then
							alias_hide_button:show()
						end
						if alive(self._player_panel) then
							self._player_panel:hide()
						end
						if alive(self._player_box_panel) then
							self._player_box:create_sides(self._player_box_panel, {
sides = {0, 0, 2, 0}})
						end
						if alive(info_panel) then
							info_panel:hide()
						end
          end
					local alias_show_func = function()
						-- upvalues: alias_show_button , alias_hide_button , self , info_panel
						if alive(alias_show_button) then
							alias_show_button:show()
						end
						if alive(alias_hide_button) then
							alias_hide_button:hide()
						end
						if alive(self._player_panel) then
							self._player_panel:show()
						end
						if alive(self._player_box_panel) then
							self._player_box:create_sides(self._player_box_panel, {
sides = {1, 1, 2, 1}})
						end
						if alive(info_panel) then
							info_panel:show()
						end
          end
					local column_one_hide_func = function()
						-- upvalues: column_one_show_button , column_one_hide_button , character_panel , column_one_box_panel , self , box_matrix
						if alive(column_one_show_button) then
							column_one_show_button:hide()
						end
						if alive(column_one_hide_button) then
							column_one_hide_button:show()
						end
						if alive(character_panel) then
							character_panel:hide()
						end
						if alive(column_one_box_panel) then
							self._column_one_box:create_sides(column_one_box_panel, {
sides = {0, 0, 2, 0}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[1] then
								box = self._boxes_by_name[boxes[1]]
							end
							if box then
								box.panel:hide()
							end
						end
          end
					local column_one_show_func = function()
						-- upvalues: column_one_show_button , column_one_hide_button , character_panel , column_one_box_panel , self , box_matrix
						if alive(column_one_show_button) then
							column_one_show_button:show()
						end
						if alive(column_one_hide_button) then
							column_one_hide_button:hide()
						end
						if alive(character_panel) then
							character_panel:show()
						end
						if alive(column_one_box_panel) then
							self._column_one_box:create_sides(column_one_box_panel, {
sides = {1, 1, 2, 1}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[1] then
								box = self._boxes_by_name[boxes[1]]
							end
							if box then
								box.panel:show()
							end
						end
          end
					local column_two_hide_func = function()
						-- upvalues: column_two_show_button , column_two_hide_button , weapons_panel , column_two_box_panel , self , box_matrix
						if alive(column_two_show_button) then
							column_two_show_button:hide()
						end
						if alive(column_two_hide_button) then
							column_two_hide_button:show()
						end
						if alive(weapons_panel) then
							weapons_panel:hide()
						end
						if alive(column_two_box_panel) then
							self._column_two_box:create_sides(column_two_box_panel, {
sides = {0, 0, 2, 0}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[2] then
								box = self._boxes_by_name[boxes[2]]
							end
							if box then
								box.panel:hide()
							end
						end
						for _,box in ipairs(self._boxes_by_layer[2]) do
							box.panel:hide()
						end
          end
					local column_two_show_func = function()
						-- upvalues: column_two_show_button , column_two_hide_button , weapons_panel , column_two_box_panel , self , box_matrix
						if alive(column_two_show_button) then
							column_two_show_button:show()
						end
						if alive(column_two_hide_button) then
							column_two_hide_button:hide()
						end
						if alive(weapons_panel) then
							weapons_panel:show()
						end
						if alive(column_two_box_panel) then
							self._column_two_box:create_sides(column_two_box_panel, {
sides = {1, 1, 2, 1}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[2] then
								box = self._boxes_by_name[boxes[2]]
							end
							if box then
								box.panel:show()
							end
						end
						for _,box in ipairs(self._boxes_by_layer[2]) do
							box.panel:show()
						end
          end
					local column_three_hide_func = function()
						-- upvalues: column_three_show_button , column_three_hide_button , eqpt_skills_panel , column_three_box_panel , self , box_matrix
						if alive(column_three_show_button) then
							column_three_show_button:hide()
						end
						if alive(column_three_hide_button) then
							column_three_hide_button:show()
						end
						if alive(eqpt_skills_panel) then
							eqpt_skills_panel:hide()
						end
						if alive(column_three_box_panel) then
							self._column_three_box:create_sides(column_three_box_panel, {
sides = {0, 0, 2, 0}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[3] then
								box = self._boxes_by_name[boxes[3]]
							end
							if box then
								box.panel:hide()
							end
						end
						for _,box in ipairs(self._boxes_by_layer[3]) do
							box.panel:hide()
						end
          end
					local column_three_show_func = function()
						-- upvalues: column_three_show_button , column_three_hide_button , eqpt_skills_panel , column_three_box_panel , self , box_matrix
						if alive(column_three_show_button) then
							column_three_show_button:show()
						end
						if alive(column_three_hide_button) then
							column_three_hide_button:hide()
						end
						if alive(eqpt_skills_panel) then
							eqpt_skills_panel:show()
						end
						if alive(column_three_box_panel) then
							self._column_three_box:create_sides(column_three_box_panel, {
sides = {1, 1, 2, 1}})
						end
						local box = nil
						for _,boxes in ipairs(box_matrix) do
							if boxes[3] then
								box = self._boxes_by_name[boxes[3]]
							end
							if box then
								box.panel:show()
							end
						end
						for _,box in ipairs(self._boxes_by_layer[3]) do
							box.panel:show()
						end
          end
					self._show_hide_data = {}
					self._show_hide_data.panels = {self._player_panel, character_panel, weapons_panel, eqpt_skills_panel}
					self._show_hide_data.show_funcs = {alias_show_func, column_one_show_func, column_two_show_func, column_three_show_func}
					self._show_hide_data.hide_funcs = {alias_hide_func, column_one_hide_func, column_two_hide_func, column_three_hide_func}
					if managers.menu:is_pc_controller() then
						local show_string = managers.localization:to_upper_text("menu_button_hide")
						local hide_string = managers.localization:to_upper_text("menu_button_show")
						alias_show_button = self:create_text_button({left = alias_text:right() + 2, top = alias_text:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = show_string, clbk = alias_hide_func, alpha = 0.1})
						alias_hide_button = self:create_text_button({disabled = true, left = alias_show_button:left(), top = alias_show_button:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = hide_string, clbk = alias_show_func})
						column_one_show_button = self:create_text_button({right = character_text:left() - 2, top = character_text:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = show_string, clbk = column_one_hide_func, alpha = 0.1})
						column_one_hide_button = self:create_text_button({disabled = true, right = column_one_show_button:right(), top = column_one_show_button:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = hide_string, clbk = column_one_show_func})
						column_two_show_button = self:create_text_button({right = weapons_text:left() - 2, top = weapons_text:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = show_string, clbk = column_two_hide_func, alpha = 0.1})
						column_two_hide_button = self:create_text_button({disabled = true, right = column_two_show_button:right(), top = column_two_show_button:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = hide_string, clbk = column_two_show_func})
						column_three_show_button = self:create_text_button({right = eqpt_skills_text:left() - 2, top = eqpt_skills_text:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = show_string, clbk = column_three_hide_func, alpha = 0.1})
						column_three_hide_button = self:create_text_button({disabled = true, right = column_three_show_button:right(), top = column_three_show_button:top(), font = tweak_data.menu.pd2_small_font, font_size = tweak_data.menu.pd2_small_font_size, text = hide_string, clbk = column_three_show_func})
						local alias_big_panel = self._panel:panel({})
						alias_big_panel:set_w(self._player_panel:w())
						alias_big_panel:set_x(self._player_panel:x())
						local column_one_big_panel = self._panel:panel({})
						column_one_big_panel:set_w(character_panel:w())
						column_one_big_panel:set_x(character_panel:x())
						local column_two_big_panel = self._panel:panel({})
						column_two_big_panel:set_w(weapons_panel:w())
						column_two_big_panel:set_x(weapons_panel:x())
						local column_three_big_panel = self._panel:panel({})
						column_three_big_panel:set_w(eqpt_skills_panel:w())
						column_three_big_panel:set_x(eqpt_skills_panel:x())
						self._change_alpha_table = {
{panel = alias_big_panel, button = alias_show_button}, 
{panel = column_one_big_panel, button = column_one_show_button}, 
{panel = column_two_big_panel, button = column_two_show_button}, 
{panel = column_three_big_panel, button = column_three_show_button}}
					end
					self:_round_everything()
					do
						local box = self:_get_selected_box()
						if box then
							box.selected = true
							self:_update_stats(box.name)
							self:_update_box_status(box, true)
							self:_update_legends(box.name)
						if box.select_anim then
							end
							box.panel:stop()
							box.panel:animate(box.select_anim, box, true)
						end
						self:update_detection()
						self:_update_player_stats()
						self:_update_mod_boxes()
					end
					 -- WARNING: missing end command somewhere! Added here
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 374 445 836 1334 
end

PlayerInventoryGui._update_legends = function(self, name)
	local box = self._boxes_by_name[name]
	if box and box.clbks then
		if box.clbks.left then
			local show_select = true
			if box.clbks.right then
				local show_preview = true
				if box.clbks.up and box.clbks.down then
					local show_switch = true
					local show_hide_all = true
					do
						if managers.menu:is_pc_controller() then
							local x = self._legends_panel:w()
							if alive(self._legends.hide_all) then
								self._legends.hide_all:set_visible(show_hide_all)
								self._legends.hide_all:set_right(x)
							if show_hide_all then
								end
							if not self._legends.hide_all:left() - 5 then
								end
							end
							if alive(self._legends.switch) then
								self._legends.switch:set_visible(show_switch)
								self._legends.switch:set_right(x)
							if show_switch then
								end
							if not self._legends.switch:left() - 5 then
								end
							end
							if alive(self._legends.preview) then
								self._legends.preview:set_visible(show_preview)
								self._legends.preview:set_right(x)
							if show_preview then
								end
							if not self._legends.preview:left() - 5 then
								end
							end
							if alive(self._legends.select) then
								self._legends.select:set_visible(show_select)
								self._legends.select:set_right(x)
							if show_select then
								end
						end
						if not self._legends.select:left() - 5 then
							end
						else
							local legends = {}
							legends[#legends + 1] = {string_id = "menu_legend_zoom_rotate"}
							if show_preview then
								legends[#legends + 1] = {string_id = "menu_legend_preview"}
							end
							if show_switch then
								legends[#legends + 1] = {string_id = "menu_legend_switch"}
							end
							legends[#legends + 1] = {string_id = "menu_legend_hide_all"}
							legends[#legends + 1] = {string_id = "menu_legend_preview_move"}
							if show_select then
								legends[#legends + 1] = {string_id = "menu_legend_select"}
							end
							legends[#legends + 1] = {string_id = "menu_legend_back"}
							local legend_text = ""
							for i,legend in ipairs(legends) do
								local spacing = i > 1 and "  |  " or ""
								legend_text = legend_text .. spacing .. managers.localization:to_upper_text(legend.string_id, {BTN_UPDATE = managers.localization:btn_macro("menu_update"), BTN_BACK = managers.localization:btn_macro("back")})
							end
							self._legends_panel:child("text"):set_text(legend_text)
						end
					else
						if managers.menu:is_pc_controller() then
							local x = self._legends_panel:w()
							if alive(self._legends.switch) then
								self._legends.switch:set_visible(false)
							end
							if alive(self._legends.preview) then
								self._legends.preview:set_visible(false)
							end
							if alive(self._legends.select) then
								self._legends.select:set_visible(false)
							end
						if alive(self._legends.hide_all) then
							end
							self._legends.hide_all:set_visible(true)
							self._legends.hide_all:set_right(x)
						end
					end
					 -- WARNING: missing end command somewhere! Added here
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 13 22 35 149 
end

PlayerInventoryGui._round_everything = function(self)
	if alive(self._panel) then
		for i,d in ipairs(self._panel:children()) do
			self:_rec_round_object(d)
		end
	end
	if alive(self._fullscreen_panel) then
		for i,d in ipairs(self._fullscreen_panel:children()) do
			self:_rec_round_object(d)
		end
	end
	if alive(self._show_all_panel) then
		for i,d in ipairs(self._show_all_panel:children()) do
			self:_rec_round_object(d)
		end
	end
end

PlayerInventoryGui._rec_round_object = function(self, object)
	local x, y, w, h = object:shape()
	object:set_shape(math.round(x), math.round(y), math.round(w), math.round(h))
	if object.children then
		for i,d in ipairs(object:children()) do
			self:_rec_round_object(d)
		end
	end
end

PlayerInventoryGui.set_info_text = function(self, text, color_ranges, recursive)
	self._info_text:set_text(text)
	local _, _, _, h = self._info_text:text_rect()
	self._info_text:set_h(h)
	if not recursive and self._info_panel:parent():h() < self._info_text:bottom() then
		local x = self._info_text:world_left() + 1
		local y = self._info_panel:parent():world_bottom() - self._info_text:line_height()
		local index = self._info_text:point_to_index(x, y)
		local text = self._info_text:text()
		text = utf8.sub(text, 1, index)
		text = text .. "..."
		return self:set_info_text(text, color_ranges, true)
	end
	if color_ranges then
		if color_ranges.add_colors_to_text_object then
			managers.menu_component:add_colors_to_text_object(self._info_text, unpack(color_ranges))
		end
	else
		for _,color_range in ipairs(color_ranges) do
			self._info_text:set_range_color(color_range.start, color_range.stop, color_range.color)
		end
	end
	self._info_panel:set_top(self._info_text:bottom())
	self._info_panel:set_h(self._info_panel:parent():h() - self._info_panel:top())
end

PlayerInventoryGui.setup_player_stats = function(self, panel)
	local data = {
{name = "armor"}, 
{name = "health"}, 
{name = "concealment", index = true}, 
{name = "movement", procent = true}, 
{name = "dodge", revert = true, procent = true}, 
{name = "damage_shake"}, 
{name = "stamina"}}
	local stats_panel = panel:child("stats_panel")
	if alive(stats_panel) then
		panel:remove(stats_panel)
		stats_panel = nil
	end
	stats_panel = panel:panel({name = "stats_panel"})
	local panel = stats_panel:panel({layer = 1, w = stats_panel:w(), h = 20})
	self._player_stats_shown = data
	self._player_stats_titles = {}
	self._player_stats_titles.total = stats_panel:text({x = 135, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))})
	self._player_stats_titles.base = stats_panel:text({x = 200, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, alpha = 0.75, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))})
	self._player_stats_titles.skill = stats_panel:text({x = 259, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 0.75, layer = 2, color = tweak_data.screen_colors.resource, text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))})
	local x = 0
	local y = 20
	local text_panel = nil
	do
		local text_columns = {
{name = "name", size = 100}, 
{name = "total", size = 60, align = "right"}, 
{name = "base", size = 60, align = "right", alpha = 0.75, blend = "add"}, 
{name = "skill", size = 60, align = "right", alpha = 0.75, blend = "add", color = tweak_data.screen_colors.resource}}
		self._player_stats_texts = {}
		self._player_stats_panel = stats_panel:panel()
		for i,stat in ipairs(data) do
			panel = self._player_stats_panel:panel({name = "weapon_stats", layer = 1, x = 0, y = y, w = self._player_stats_panel:w(), h = 20})
			if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
				panel:rect({name = tostring(i), color = Color.black:with_alpha(0.4)})
			end
			x = 2
			y = y + 20
			self._player_stats_texts[stat.name] = {}
			for _,column in ipairs(text_columns) do
				text_panel = panel:panel({layer = 0, x = x, w = column.size, h = panel:h()})
				if not column.color then
					self._player_stats_texts[stat.name][column.name] = text_panel:text({text = "0", font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, align = column.align, layer = 1, alpha = column.alpha, blend_mode = column.blend, color = tweak_data.screen_colors.text})
					x = x + column.size
					if column.name == "name" then
						self._player_stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
					end
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 262 
end

PlayerInventoryGui.set_weapon_stats = function(self, panel, data)
	local stats_panel = panel:child("stats_panel")
	if alive(stats_panel) then
		panel:remove(stats_panel)
		stats_panel = nil
	end
	stats_panel = panel:panel({name = "stats_panel"})
	local panel = stats_panel:panel({layer = 1, w = stats_panel:w(), h = 20})
	self._stats_shown = data
	self._stats_titles = {}
	self._stats_titles.total = stats_panel:text({x = 120, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))})
	self._stats_titles.base = stats_panel:text({x = 170, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, alpha = 0.75, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))})
	self._stats_titles.mod = stats_panel:text({x = 219, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, alpha = 0.75, color = tweak_data.screen_colors.stats_mods, text = utf8.to_upper(managers.localization:text("bm_menu_stats_mod"))})
	self._stats_titles.skill = stats_panel:text({x = 259, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 0.75, layer = 2, color = tweak_data.screen_colors.resource, text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))})
	local x = 0
	local y = 20
	local text_panel = nil
	do
		local text_columns = {
{name = "name", size = 100}, 
{name = "total", size = 45, align = "right"}, 
{name = "base", size = 45, align = "right", alpha = 0.75, blend = "add"}, 
{name = "mods", size = 45, align = "right", alpha = 0.75, blend = "add", color = tweak_data.screen_colors.stats_mods}, 
{name = "skill", size = 45, align = "right", alpha = 0.75, blend = "add", color = tweak_data.screen_colors.resource}}
		self._stats_texts = {}
		self._stats_panel = stats_panel:panel()
		for i,stat in ipairs(data) do
			panel = self._stats_panel:panel({name = "weapon_stats", layer = 1, x = 0, y = y, w = self._stats_panel:w(), h = 20})
			if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
				panel:rect({name = tostring(i), color = Color.black:with_alpha(0.4)})
			end
			x = 2
			y = y + 20
			self._stats_texts[stat.name] = {}
			for _,column in ipairs(text_columns) do
				text_panel = panel:panel({layer = 0, x = x, w = column.size, h = panel:h()})
				if not column.color then
					self._stats_texts[stat.name][column.name] = text_panel:text({text = "0", font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, align = column.align, layer = 1, alpha = column.alpha, blend_mode = column.blend, color = tweak_data.screen_colors.text})
					x = x + column.size
					if column.name == "name" then
						self._stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
					end
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 281 
end

PlayerInventoryGui.set_weapon_mods_stats = function(self, panel, data)
	local stats_panel = panel:child("stats_panel")
	if alive(stats_panel) then
		panel:remove(stats_panel)
		stats_panel = nil
	end
	stats_panel = panel:panel({name = "stats_panel"})
	local panel = stats_panel:panel({layer = 1, w = stats_panel:w(), h = 20})
	self._stats_shown = data
	self._stats_titles = {}
	self._stats_titles.total = stats_panel:text({x = 120, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 1, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))})
	self._stats_titles.equip = stats_panel:text({x = 200, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 1, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_equipped"))})
	local x = 0
	local y = 20
	local text_panel = nil
	do
		local text_columns = {
{name = "name", size = 100}, 
{name = "total", size = 45, align = "right"}, 
{name = "equip", size = 90, align = "right"}}
		self._stats_texts = {}
		self._stats_panel = stats_panel:panel()
		for i,stat in ipairs(data) do
			panel = self._stats_panel:panel({name = "weapon_stats", layer = 1, x = 0, y = y, w = self._stats_panel:w(), h = 20})
			if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
				panel:rect({name = tostring(i), color = Color.black:with_alpha(0.4)})
			end
			x = 2
			y = y + 20
			self._stats_texts[stat.name] = {}
			for _,column in ipairs(text_columns) do
				text_panel = panel:panel({layer = 0, x = x, w = column.size, h = panel:h()})
				if not column.color then
					self._stats_texts[stat.name][column.name] = text_panel:text({text = "0", font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, align = column.align, layer = 1, alpha = column.alpha, blend_mode = column.blend, color = tweak_data.screen_colors.text})
					x = x + column.size
					if column.name == "name" then
						self._stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
					end
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 202 
end

PlayerInventoryGui.set_melee_stats = function(self, panel, data)
	local stats_panel = panel:child("stats_panel")
	if alive(stats_panel) then
		panel:remove(stats_panel)
		stats_panel = nil
	end
	stats_panel = panel:panel({name = "stats_panel"})
	local panel = stats_panel:panel({layer = 1, w = stats_panel:w(), h = 20})
	self._stats_shown = data
	self._stats_titles = {}
	self._stats_titles.total = stats_panel:text({x = 135, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_total"))})
	self._stats_titles.base = stats_panel:text({x = 200, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, alpha = 0.75, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("bm_menu_stats_base"))})
	self._stats_titles.skill = stats_panel:text({x = 259, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 0.75, layer = 2, color = tweak_data.screen_colors.resource, text = utf8.to_upper(managers.localization:text("bm_menu_stats_skill"))})
	local x = 0
	local y = 20
	local text_panel = nil
	do
		local text_columns = {
{name = "name", size = 100}, 
{name = "total", size = 70, align = "right"}, 
{name = "base", size = 60, align = "right", alpha = 0.75, blend = "add"}, 
{name = "skill", size = 60, align = "right", alpha = 0.75, blend = "add", color = tweak_data.screen_colors.resource}}
		self._stats_texts = {}
		self._stats_panel = stats_panel:panel()
		for i,stat in ipairs(data) do
			panel = self._stats_panel:panel({name = "weapon_stats", layer = 1, x = 0, y = y, w = self._stats_panel:w(), h = 20})
			if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
				panel:rect({name = tostring(i), color = Color.black:with_alpha(0.4)})
			end
			x = 2
			y = y + 20
			self._stats_texts[stat.name] = {}
			for _,column in ipairs(text_columns) do
				text_panel = panel:panel({layer = 0, x = x, w = column.size, h = panel:h()})
				if not column.color then
					self._stats_texts[stat.name][column.name] = text_panel:text({text = "0", font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, align = column.align, layer = 1, alpha = column.alpha, blend_mode = column.blend, color = tweak_data.screen_colors.text})
					x = x + column.size
					if column.name == "name" then
						self._stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("bm_menu_" .. stat.name))
					end
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 242 
end

PlayerInventoryGui.set_skilltree_stats = function(self, panel, data)
	local stats_panel = panel:child("stats_panel")
	if alive(stats_panel) then
		panel:remove(stats_panel)
		stats_panel = nil
	end
	stats_panel = panel:panel({name = "stats_panel"})
	local panel = stats_panel:panel({layer = 1, w = stats_panel:w(), h = 20})
	self._stats_shown = data
	self._stats_titles = {}
	self._stats_titles.points = stats_panel:text({x = 135, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("st_menu_point_plural", {points = ""}))})
	self._stats_titles.owned = stats_panel:text({x = 197, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, layer = 2, alpha = 0.95, color = tweak_data.screen_colors.text, text = utf8.to_upper(managers.localization:text("st_menu_skill_owned"))})
	self._stats_titles.aced = stats_panel:text({x = 259, font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, alpha = 0.85, layer = 2, color = tweak_data.screen_colors.resource, text = utf8.to_upper(managers.localization:text("st_menu_skill_maxed"))})
	local x = 0
	local y = 20
	local text_panel = nil
	do
		local text_columns = {
{name = "name", size = 100}, 
{name = "points", size = 65, align = "right"}, 
{name = "owned", size = 65, align = "right", alpha = 0.95, blend = "add"}, 
{name = "aced", size = 50, align = "right", alpha = 0.85, blend = "add", color = tweak_data.screen_colors.resource}}
		self._stats_texts = {}
		self._stats_panel = stats_panel:panel()
		for i,stat in ipairs(data) do
			panel = self._stats_panel:panel({name = "weapon_stats", layer = 1, x = 0, y = y, w = self._stats_panel:w(), h = 20})
			if math.mod(i, 2) ~= 0 and not panel:child(tostring(i)) then
				panel:rect({name = tostring(i), color = Color.black:with_alpha(0.4)})
			end
			x = 2
			y = y + 20
			self._stats_texts[stat.name] = {}
			for _,column in ipairs(text_columns) do
				text_panel = panel:panel({layer = 0, x = x, w = column.size, h = panel:h()})
				if not column.color then
					self._stats_texts[stat.name][column.name] = text_panel:text({text = "0", font_size = tweak_data.menu.pd2_small_font_size, font = tweak_data.menu.pd2_small_font, align = column.align, layer = 1, alpha = column.alpha, blend_mode = column.blend, color = tweak_data.screen_colors.text})
					x = x + column.size
					if column.name == "name" then
						if not stat.name_s then
							self._stats_texts[stat.name].name:set_text(managers.localization:to_upper_text("st_menu_" .. stat.name))
						end
					end
				end
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 244 
end

local format_round = function(num, round_value)
	if not round_value or not tostring(math.round(num)) then
		return string.format("%.1f", num):gsub("%.?0+$", "")
	end
end

PlayerInventoryGui._update_player_stats = function(self)
	-- upvalues: format_round
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = "armors"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local equipped_slot = managers.blackmarket:equipped_armor_slot()
	local temp_stats_shown = self._stats_shown
	self._stats_shown = self._player_stats_shown
	local base_stats, mods_stats, skill_stats = self:_get_armor_stats(equipped_item)
	self._stats_shown = temp_stats_shown
	for _,stat in ipairs(self._player_stats_shown) do
		local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
		local base = base_stats[stat.name].value
		self._player_stats_texts[stat.name].total:set_alpha(1)
		self._player_stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
		self._player_stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
		self._player_stats_texts[stat.name].skill:set_text((skill_stats[stat.name].value <= 0 or not "+") and (not skill_stats[stat.name].skill_in_effect or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
		if value ~= 0 and base < value then
			self._player_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
		elseif value ~= 0 and value < base then
			self._player_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
		else
			self._player_stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end
	end
end

PlayerInventoryGui._update_stats = function(self, name)
	if name == self._current_stat_shown then
		return 
	end
	self._current_stat_shown = name
	self:set_info_text("")
	self._info_panel:clear()
	if name == "primary" or name == "secondary" then
		self:set_weapon_stats(self._info_panel, {
{name = "magazine", stat_name = "extra_ammo", round_value = true}, 
{name = "totalammo", stat_name = "total_ammo_mod", round_value = true}, 
{name = "fire_rate", round_value = true}, 
{name = "damage"}, 
{name = "spread", offset = true, revert = true, percent = true}, 
{name = "recoil", offset = true, revert = true, percent = true}, 
{name = "concealment", index = true}, 
{name = "suppression", offset = true, percent = false}})
		self:_update_info_weapon(name)
	elseif name == "armor" then
		self:_update_info_armor(name)
	elseif name == "melee" then
		self:set_melee_stats(self._info_panel, {
{name = "damage", range = true}, 
{name = "damage_effect", range = true, multiple_of = "damage"}, 
{name = "charge_time", num_decimals = 1, inverse = true, suffix = managers.localization:text("menu_seconds_suffix_short")}, 
{name = "range", range = true}, 
{name = "concealment", index = true}})
		self:_update_info_melee(name)
	elseif name == "skilltree" then
		self:_update_info_skilltree(name)
	elseif name == "specialization" then
		self:_update_info_specialization(name)
	elseif name == "character" then
		self:_update_info_character(name)
	elseif name == "mask" then
		self:_update_info_mask(name)
	elseif name == "throwable" then
		self:_update_info_throwable(name)
	elseif name == "deployable" then
		self:_update_info_deployable(name)
	else
		local box = self._boxes_by_name[name]
		if box and box.params and box.params.mod_data then
			if box.params.mod_data.selected_tab == "weapon_cosmetics" then
				local cosmetics = managers.blackmarket:get_weapon_cosmetics(box.params.mod_data.category, box.params.mod_data.slot)
			if cosmetics then
				end
				if not tweak_data.blackmarket.weapon_skins[cosmetics.id] then
					local c_td = {}
				end
				if c_td.default_blueprint then
					self:set_weapon_stats(self._info_panel, {
{name = "magazine", stat_name = "extra_ammo", round_value = true}, 
{name = "totalammo", stat_name = "total_ammo_mod", round_value = true}, 
{name = "fire_rate", round_value = true}, 
{name = "damage"}, 
{name = "spread", offset = true, revert = true, percent = true}, 
{name = "recoil", offset = true, revert = true, percent = true}, 
{name = "concealment", index = true}, 
{name = "suppression", offset = true, percent = false}})
				end
				self:_update_info_weapon_cosmetics(name, cosmetics)
			end
		else
			self:set_weapon_mods_stats(self._info_panel, {
{name = "magazine", stat_name = "extra_ammo", round_value = true}, 
{name = "totalammo", stat_name = "total_ammo_mod", round_value = true}, 
{name = "fire_rate", round_value = true}, 
{name = "damage"}, 
{name = "spread", offset = true, revert = true, percent = true}, 
{name = "recoil", offset = true, revert = true, percent = true}, 
{name = "concealment", index = true}, 
{name = "suppression", offset = true, percent = false}})
			self:_update_info_weapon_mod(box)
		end
	else
		self:_update_info_generic(name)
	end
end

PlayerInventoryGui._update_info_skilltree = function(self, name)
	local text_string = ""
	text_string = text_string .. managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}) .. "\n "
	local tree_to_string_id = {mastermind = "st_menu_mastermind", enforcer = "st_menu_enforcer", technician = "st_menu_technician", ghost = "st_menu_ghost", hoxton = "st_menu_hoxton_pack"}
	text_string = text_string .. "\n"
	for i,tree in ipairs({"mastermind", "enforcer", "technician", "ghost", "hoxton"}) do
		local points, progress, num_skills = managers.skilltree:get_tree_progress_new(tree)
		points = string.format("%02d", points)
		text_string = text_string .. managers.localization:to_upper_text("menu_profession_progress", {profession = managers.localization:to_upper_text(tree_to_string_id[tree]), progress = points, num_skills = num_skills}) .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_specialization = function(self, name)
	-- upvalues: IS_WIN_32
	local text_string = ""
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	local specialization_data = tweak_data.skilltree.specializations[current_specialization]
	if specialization_data then
		local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
		local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
		text_string = managers.localization:text(specialization_data.name_id) .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")\n"
		if current_tier < max_tier then
			local current_points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "current_points")
			local points = managers.skilltree:get_specialization_value(current_specialization, "tiers", "next_tier_data", "points")
			text_string = text_string .. managers.localization:text("menu_st_progress", {progress = string.format("%i/%i", current_points, points)}) .. "\n"
		end
	if IS_WIN_32 then
		end
	if specialization_data.desc_id then
		end
		text_string = text_string .. "\n" .. managers.localization:text(specialization_data.desc_id)
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_character = function(self, name)
	-- upvalues: IS_WIN_32
	local character = managers.blackmarket:get_preferred_character()
	local character_name = CriminalsManager.convert_old_to_new_character_workname(character)
	local color_ranges = {}
	local text_string = ""
	text_string = text_string .. managers.localization:text("menu_" .. character) .. "\n"
	if managers.network:session() then
		local color_range = {start = utf8.len(text_string), color = tweak_data.screen_colors.important_1}
		text_string = text_string .. managers.localization:to_upper_text("menu_preferred_character_lobby_error") .. "\n"
		color_range.stop = utf8.len(text_string)
		table.insert(color_ranges, color_range)
	end
	if IS_WIN_32 then
		text_string = text_string .. managers.localization:text(character .. "_desc") .. "\n"
	end
	self:set_info_text(text_string, color_ranges)
end

PlayerInventoryGui._update_info_mask = function(self, name)
	-- upvalues: IS_WIN_32
	local mask = managers.blackmarket:equipped_mask()
	local mask_name = managers.blackmarket:get_mask_name_by_category_slot("masks", managers.blackmarket:equipped_mask_slot())
	if mask then
		local mask_data = tweak_data.blackmarket.masks[mask.mask_id]
	end
	local text_string = ""
	if mask_data then
		text_string = text_string .. mask_name .. "\n\n"
	if IS_WIN_32 then
		end
		text_string = text_string .. managers.localization:text(mask_data.desc_id) .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_throwable = function(self, name)
	-- upvalues: IS_WIN_32
	local throwable_id, amount = managers.blackmarket:equipped_projectile()
	if throwable_id then
		local projectile_data = tweak_data.blackmarket.projectiles[throwable_id]
	end
	local text_string = ""
	if projectile_data then
		text_string = text_string .. managers.localization:text(projectile_data.name_id) .. " (x" .. tostring(amount) .. ")" .. "\n\n"
	if IS_WIN_32 then
		end
		text_string = text_string .. managers.localization:text(projectile_data.desc_id) .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_deployable = function(self, name)
	-- upvalues: IS_WIN_32
	local deployable_id = managers.blackmarket:equipped_deployable()
	if deployable_id then
		local equipment_data = tweak_data.equipments[deployable_id]
	end
	if deployable_id then
		local deployable_data = tweak_data.blackmarket.deployables[deployable_id]
	end
	local text_string = ""
	if not equipment_data.quantity then
		local amount = not deployable_data or not equipment_data or 1
	end
	amount = amount + (managers.player:equiptment_upgrade_value(deployable_id, "quantity") or 0)
	text_string = text_string .. managers.localization:text(deployable_data.name_id) .. " (x" .. tostring(amount) .. ")" .. "\n\n"
	if IS_WIN_32 then
		text_string = text_string .. managers.localization:text(deployable_data.desc_id, {BTN_INTERACT = managers.localization:btn_macro("interact", true), BTN_USE_ITEM = managers.localization:btn_macro("use_item", true)}) .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_generic = function(self, name)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local text_string = ""
	local loadout_name = name == "throwable" and "grenade" or name
	if player_loadout_data[loadout_name] then
		text_string = managers.localization:text("bm_menu_equipped") .. ": " .. player_loadout_data[loadout_name].info_text .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_weapon_mod = function(self, box)
	-- upvalues: format_round
	local mod_data = box.params.mod_data
	local crafted = managers.blackmarket:get_crafted_category_slot(mod_data.category, mod_data.slot)
	local part_id = managers.weapon_factory:get_part_id_from_weapon_by_type(mod_data.selected_tab, crafted.blueprint)
	local tweak_stats = tweak_data.weapon.stats
	local modifier_stats = tweak_data.weapon[crafted.weapon_id].stats_modifiers
	if not part_id or managers.weapon_factory:is_part_standard_issue_by_weapon_id(mod_data.name, part_id) then
		local total_base_stats, total_mods_stats, total_skill_stats = WeaponDescription._get_stats(crafted.weapon_id, mod_data.category, mod_data.slot)
		self:set_info_text(" ")
		for _,stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].equip:set_text("")
			for name,column in pairs(self._stats_texts[stat.name]) do
				column:set_alpha(0.5)
			end
			local total_value = math.max(total_base_stats[stat.name].value + total_mods_stats[stat.name].value + total_skill_stats[stat.name].value, 0)
			self._stats_texts[stat.name].total:set_alpha(1)
			self._stats_texts[stat.name].total:set_text(format_round(total_value, stat.round_value))
		end
		return 
	end
	local tweak_parts = tweak_data.weapon.factory.parts[part_id]
	local mod_stats = WeaponDescription.get_stats_for_mod(part_id, mod_data.name, mod_data.category, mod_data.slot)
	local total_base_stats, total_mods_stats, total_skill_stats = WeaponDescription._get_stats(crafted.weapon_id, mod_data.category, mod_data.slot)
	do
		local text_string = managers.weapon_factory:get_part_name_by_part_id(part_id)
		self:set_info_text(text_string)
		for _,stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			local total_value = math.max(total_base_stats[stat.name].value + total_mods_stats[stat.name].value + total_skill_stats[stat.name].value, 0)
			local value = mod_stats.chosen[stat.name]
			local equip = mod_stats.equip[stat.name]
			local stat_changed = tweak_parts and ((stat.stat_name or tweak_parts.stats[stat.name]) and 1) or 0.5
			for stat_name,stat_text in pairs(self._stats_texts[stat.name]) do
				if stat_name ~= "name" then
					stat_text:set_text("")
				end
			end
			for name,column in pairs(self._stats_texts[stat.name]) do
				column:set_alpha(stat_changed)
			end
			self._stats_texts[stat.name].total:set_alpha(1)
			if equip <= 0 or not "+" then
				self._stats_texts[stat.name].equip:set_text((equip == 0 and "" or "") .. format_round(equip, stat.round_value))
				self._stats_texts[stat.name].total:set_text(format_round(total_value, stat.round_value))
				if value > 0 then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < 0 then
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].equip:set_color(tweak_data.screen_colors.text)
				end
				 -- DECOMPILER ERROR: unhandled construct in 'if'

				if stat.percent and math.round(total_value) >= 100 then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
				end
				for _,stat in (for generator) do
					if stat.index then
						for _,stat in (for generator) do
						end
						if tweak_stats[stat.name] then
							local without_skill = math.round(total_base_stats[stat.name].value + total_mods_stats[stat.name].value)
							local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
							do
								if not modifier_stats or not modifier_stats[stat.name] then
									local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (not stat.offset or 1)
								end
								max_stat = max_stat - offset
						end
						if max_stat <= without_skill then
							end
							self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
						end
					end
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 232 
end

PlayerInventoryGui._update_info_weapon = function(self, name)
	-- upvalues: format_round
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = name == "primary" and "primaries" or "secondaries"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local equipped_slot = managers.blackmarket:equipped_weapon_slot(category)
	local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(equipped_item.weapon_id, category, equipped_slot)
	local text_string = string.format("##%s##  %s", player_loadout_data[name].info_text, managers.experience:cash_string(managers.money:get_weapon_slot_sell_value(category, equipped_slot)))
	if not player_loadout_data[name].info_text_color then
		self:set_info_text(text_string, {tweak_data.screen_colors.text; add_colors_to_text_object = true})
		local tweak_stats = tweak_data.weapon.stats
		do
			local modifier_stats = tweak_data.weapon[equipped_item.weapon_id].stats_modifiers
			for _,stat in ipairs(self._stats_shown) do
				self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
				local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
				local base = base_stats[stat.name].value
				self._stats_texts[stat.name].total:set_alpha(1)
				self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
				self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
				if mods_stats[stat.name].value <= 0 or not "+" then
					self._stats_texts[stat.name].mods:set_text((mods_stats[stat.name].value == 0 and "" or "") .. format_round(mods_stats[stat.name].value, stat.round_valuee))
					self._stats_texts[stat.name].skill:set_text((skill_stats[stat.name].value <= 0 or not "+") and (not skill_stats[stat.name].skill_in_effect or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
					if base < value then
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
					elseif value < base then
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
					else
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
					end
					 -- DECOMPILER ERROR: unhandled construct in 'if'

					if stat.percent and math.round(value) >= 100 then
						self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
					end
					for _,stat in (for generator) do
						if stat.index then
							for _,stat in (for generator) do
							end
							if tweak_stats[stat.name] then
								local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
								local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
								do
									if not modifier_stats or not modifier_stats[stat.name] then
										local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (not stat.offset or 1)
									end
									max_stat = max_stat - offset
							end
							if max_stat <= without_skill then
								end
								self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
							end
						end
					end
					 -- WARNING: missing end command somewhere! Added here
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 53 151 
end

PlayerInventoryGui._update_info_weapon_cosmetics = function(self, name, cosmetics)
	-- upvalues: format_round
	if not tweak_data.blackmarket.weapon_skins[cosmetics.id] then
		local c_td = {}
	end
	local quality_text = managers.localization:text(tweak_data.economy.qualities[cosmetics.quality].name_id)
	local name_text = managers.localization:text(c_td.name_id)
	local info_text = managers.localization:to_upper_text("menu_cash_safe_result", {quality = quality_text, name = name_text})
	if cosmetics.bonus then
		if tweak_data.blackmarket.weapon_skins[cosmetics.id] then
			local bonus = tweak_data.blackmarket.weapon_skins[cosmetics.id].bonus
		end
	if bonus then
		end
	if not c_td.default_blueprint then
		end
		local bonus_tweak = tweak_data.economy.bonuses[bonus]
		if (not bonus_tweak.exp_multiplier or not bonus_tweak.exp_multiplier * 100 - 100 .. "%") and bonus_tweak.money_multiplier then
			local bonus_value = bonus_tweak.money_multiplier * 100 - 100 .. "%"
		end
		info_text = info_text .. "\n" .. managers.localization:text("dialog_new_tradable_item_bonus", {bonus = managers.localization:text(bonus_tweak.name_id, {team_bonus = bonus_value})})
	end
	self:set_info_text(info_text, {tweak_data.economy.rarities[c_td.rarity].color; add_colors_to_text_object = true})
	if c_td.default_blueprint then
		local box = self._boxes_by_name[name]
		local category = box.params.mod_data.category
		local slot = box.params.mod_data.slot
		local base_stats, mods_stats, skill_stats = WeaponDescription._get_stats(c_td.weapon_id, category, slot, c_td.default_blueprint)
		local crafted = managers.blackmarket:get_crafted_category_slot(category, slot)
		local tweak_stats = tweak_data.weapon.stats
		local modifier_stats = tweak_data.weapon[crafted.weapon_id].stats_modifiers
		for _,stat in ipairs(self._stats_shown) do
			self._stats_texts[stat.name].name:set_text(utf8.to_upper(managers.localization:text("bm_menu_" .. stat.name)))
			local value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
			local base = base_stats[stat.name].value
			self._stats_texts[stat.name].total:set_alpha(1)
			self._stats_texts[stat.name].total:set_text(format_round(value, stat.round_value))
			self._stats_texts[stat.name].base:set_text(format_round(base, stat.round_value))
			if mods_stats[stat.name].value <= 0 or not "+" then
				self._stats_texts[stat.name].mods:set_text((mods_stats[stat.name].value == 0 and "" or "") .. format_round(mods_stats[stat.name].value, stat.round_valuee))
				self._stats_texts[stat.name].skill:set_text((skill_stats[stat.name].value <= 0 or not "+") and (not skill_stats[stat.name].skill_in_effect or "") .. format_round(skill_stats[stat.name].value, stat.round_value) or "")
				if base < value then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
				elseif value < base then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
				else
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
				end
				 -- DECOMPILER ERROR: unhandled construct in 'if'

				if stat.percent and math.round(value) >= 100 then
					self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
				end
				for _,stat in (for generator) do
					if stat.index then
						for _,stat in (for generator) do
						end
						if tweak_stats[stat.name] then
							local without_skill = math.round(base_stats[stat.name].value + mods_stats[stat.name].value)
							local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (modifier_stats and modifier_stats[stat.name] or 1)
							do
								if not modifier_stats or not modifier_stats[stat.name] then
									local offset = math.min(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier * (not stat.offset or 1)
								end
								max_stat = max_stat - offset
						end
						if max_stat <= without_skill then
							end
							self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stat_maxed)
						end
					end
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 223 
end

PlayerInventoryGui._update_info_armor = function(self, name)
	-- upvalues: IS_WIN_32
	local armor_id = managers.blackmarket:equipped_armor()
	if armor_id then
		local armor_data = tweak_data.blackmarket.armors[armor_id]
	end
	local text_string = ""
	if armor_data then
		text_string = text_string .. managers.localization:text(armor_data.name_id) .. "\n\n"
	if IS_WIN_32 then
		end
		text_string = text_string .. managers.localization:text(armor_data.desc_id) .. "\n"
	end
	self:set_info_text(text_string)
end

PlayerInventoryGui._update_info_melee = function(self, name)
	-- upvalues: format_round
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local category = "melee_weapons"
	local equipped_item = managers.blackmarket:equipped_item(category)
	local base_stats, mods_stats, skill_stats = self:_get_melee_weapon_stats(equipped_item)
	local text_string = string.format("%s", player_loadout_data.melee_weapon.info_text)
	self:set_info_text(text_string)
	local value, value_min, value_max = nil, nil, nil
	for _,stat in ipairs(self._stats_shown) do
		if stat.range then
			value_min = math.max(base_stats[stat.name].min_value + mods_stats[stat.name].min_value + skill_stats[stat.name].min_value, 0)
			value_max = math.max(base_stats[stat.name].max_value + mods_stats[stat.name].max_value + skill_stats[stat.name].max_value, 0)
		end
		value = math.max(base_stats[stat.name].value + mods_stats[stat.name].value + skill_stats[stat.name].value, 0)
		local base, base_min, base_max, skill, skill_min, skill_max = nil, nil, nil, nil, nil, nil
		if stat.range then
			base_min = base_stats[stat.name].min_value
			base_max = base_stats[stat.name].max_value
			skill_min = skill_stats[stat.name].min_value
			skill_max = skill_stats[stat.name].max_value
		end
		base = base_stats[stat.name].value
		skill = skill_stats[stat.name].value
		local format_string = "%0." .. tostring(stat.num_decimals or 0) .. "f"
		if value then
			local equip_text = format_round(value, stat.round_value)
		end
		if base then
			local base_text = format_round(base, stat.round_value)
		end
		if skill_stats[stat.name].value then
			local skill_text = format_round(skill_stats[stat.name].value, stat.round_value)
		end
		if base_min then
			local base_min_text = format_round(base_min, true)
		end
		if base_max then
			local base_max_text = format_round(base_max, true)
		end
		if value_min then
			local value_min_text = format_round(value_min, true)
		end
		if value_max then
			local value_max_text = format_round(value_max, true)
		end
		if skill_min then
			local skill_min_text = format_round(skill_min, true)
		end
		if skill_max then
			local skill_max_text = format_round(skill_max, true)
		end
		if stat.range then
			if base_min ~= base_max then
				base_text = base_min_text .. " (" .. base_max_text .. ")"
			end
			if value_min ~= value_max then
				equip_text = value_min_text .. " (" .. value_max_text .. ")"
			end
		if skill_min ~= skill_max then
			end
			skill_text = skill_min_text .. " (" .. skill_max_text .. ")"
		end
		if stat.suffix then
			base_text = base_text .. tostring(stat.suffix)
			equip_text = equip_text .. tostring(stat.suffix)
			skill_text = skill_text .. tostring(stat.suffix)
		end
		if stat.prefix then
			base_text = tostring(stat.prefix) .. base_text
			equip_text = tostring(stat.prefix) .. equip_text
			skill_text = tostring(stat.prefix) .. skill_text
		end
		self._stats_texts[stat.name].total:set_alpha(1)
		self._stats_texts[stat.name].total:set_text(equip_text)
		self._stats_texts[stat.name].base:set_text(base_text)
		self._stats_texts[stat.name].skill:set_text((skill_stats[stat.name].value <= 0 or not "+") and (not skill_stats[stat.name].skill_in_effect or "") .. skill_text or "")
		local positive = value ~= 0 and base < value
		local negative = value ~= 0 and value < base
		if stat.inverse then
			local temp = positive
			positive = negative
			negative = temp
		end
		if stat.range then
			if positive then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
			elseif negative then
				self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
			end
		elseif positive then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_positive)
		elseif negative then
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.stats_negative)
		else
			self._stats_texts[stat.name].total:set_color(tweak_data.screen_colors.text)
		end
	end
end

PlayerInventoryGui.sort_boxes_by_matrix = function(self, box_matrix)
	-- upvalues: TOP_ADJUSTMENT
	local padding_x = 10
	local padding_y = 0
	local top_x = self._panel:w() - 500
	local top_y = TOP_ADJUSTMENT + tweak_data.menu.pd2_small_font_size
	local width = self._panel:w() - top_x
	local height = 540
	local combined_width = width - padding_x * 2
	local combined_height = height - padding_y * 3
	local box_width = combined_width / 3
	local box_height = combined_height / 4
	local num_boxes, box, x, y, up, down, left, right = nil, nil, nil, nil, nil, nil, nil, nil
	for row,box_list in pairs(box_matrix) do
		if box_list then
			num_boxes = #box_list
			for column,box_name in pairs(box_list) do
				box = self._boxes_by_name[box_name]
				if box then
					x = top_x + (box_width + padding_x) * (column - 1)
					y = top_y + (box_height + padding_y) * (row - 1)
					box.panel:set_position(x, y)
					if box_matrix[row - 1] then
						up = box_matrix[row - 1][column]
					end
					if box_matrix[row + 1] then
						down = box_matrix[row + 1][column]
					end
					left = box_list[column - 1]
					right = box_list[column + 1]
					box.links = {up = up, down = down, left = left, right = right}
					box.params.x = x
					box.params.y = y
				end
			end
		end
	end
end

PlayerInventoryGui.create_grid_links = function(self, grid_x, grid_y)
	local up, down, left, right = nil, nil, nil, nil
	for i,box in ipairs(self._boxes) do
		up = i - grid_x
		down = i + grid_x
		left = (i - 1) % grid_x ~= 0 and i - 1 or 0
		right = i % grid_x ~= 0 and i + 1 or 0
		up = self._boxes[up] or nil
		down = self._boxes[down] or nil
		left = self._boxes[left] or nil
		right = self._boxes[right] or nil
		if ((not up or down) and not left) or right then
			box.links = {up = up.name, down = down.name, left = left.name, right = right.name}
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 58 
end

PlayerInventoryGui._update_mod_boxes = function(self)
	-- upvalues: select_anim , unselect_anim
	local box = nil
	for _,mod_box in ipairs(self._mod_boxes) do
		box = self._boxes_by_name[mod_box.name]
		if box then
			self:unretrieve_box_textures(box)
			box.panel:parent():remove(box.panel)
			box.dead = true
			self._boxes_by_name[mod_box.name] = nil
		end
	end
	local to_be_removed = {}
	for index,box in pairs(self._boxes) do
		if box.dead then
			table.insert(to_be_removed, index)
		end
	end
	for _,index in ipairs(to_be_removed) do
		table.remove(self._boxes, index)
	end
	for i = 2, self._max_layer do
		self._boxes_by_layer[i] = nil
	end
	self._mod_boxes = {}
	self._max_layer = 1
	local player_loadout_data = managers.blackmarket:player_loadout_data(true)
	local clbks = {left = callback(self, self, "open_weapon_mod_menu")}
	local primary_box = self._boxes_by_name.primary.panel
	local icon_box = nil
	local when_to_split = 8
	local x = primary_box:right() - 2
	local y = primary_box:bottom() - 2
	local w = (primary_box:w() - 4) / when_to_split
	local h = w
	local mod_links = {up = "primary", down = "primary", left = "primary", right = "primary"}
	do
		local box_name = nil
		if not player_loadout_data.primary.info_icons then
			for _,icon in ipairs({}) do
			end
			box_name = "icon_primary_" .. icon.type
			icon_box = self:create_box({name = box_name, use_borders = false, 
mod_data = {selected_tab = icon.type, name = managers.blackmarket:equipped_primary().weapon_id, name_localized = player_loadout_data.primary.info_text, text_selected_color = player_loadout_data.primary.info_text_color, category = "primaries", slot = managers.blackmarket:equipped_weapon_slot("primaries")}, w = w, h = h, padding = 0, text = false, image = icon.texture, alpha = icon.equipped and 1 or 0.25, select_anim = select_anim, unselect_anim = unselect_anim, bg_blend_mode = "normal", layer = 2, clbks = (not icon.weapon_skin_bonus and clbks), links = mod_links, can_select = not icon.weapon_skin_bonus})
			icon_box:set_rightbottom(x, y)
			icon_box:set_visible(primary_box:visible())
			x = icon_box:left()
			if _ % when_to_split == 0 then
				x = primary_box:right() - 2
				y = y - 18
			end
		end
	end
	local secondary_box = self._boxes_by_name.secondary.panel
	local icon_box = nil
	local when_to_split = 8
	local x = secondary_box:right() - 2
	local y = secondary_box:bottom() - 2
	local w = (secondary_box:w() - 4) / when_to_split
	local h = w
	local mod_links = {up = "secondary", down = "secondary", left = "secondary", right = "secondary"}
	do
		local box_name = nil
		if not player_loadout_data.secondary.info_icons then
			for _,icon in ipairs({}) do
			end
			box_name = "icon_secondary_" .. icon.type
			icon_box = self:create_box({name = box_name, use_borders = false, 
mod_data = {selected_tab = icon.type, name = managers.blackmarket:equipped_secondary().weapon_id, name_localized = player_loadout_data.secondary.info_text, text_selected_color = player_loadout_data.secondary.info_text_color, category = "secondaries", slot = managers.blackmarket:equipped_weapon_slot("secondaries")}, w = w, h = h, padding = 0, text = false, image = icon.texture, alpha = icon.equipped and 1 or 0.25, select_anim = select_anim, unselect_anim = unselect_anim, bg_blend_mode = "normal", layer = 2, clbks = (not icon.weapon_skin_bonus and clbks), links = mod_links, can_select = not icon.weapon_skin_bonus})
			icon_box:set_rightbottom(x, y)
			icon_box:set_visible(secondary_box:visible())
			x = icon_box:left()
			if _ % when_to_split == 0 then
				x = secondary_box:right() - 2
				y = y - 18
			end
		end
	end
	local skilltree_box = self._boxes_by_name.skilltree.panel
	local icon_box = nil
	local w = (skilltree_box:w() - 2 * (#tweak_data.skilltree.trees - 1) - 8) / #tweak_data.skilltree.trees
	local h = w
	local x = skilltree_box:left() + 4
	local y = skilltree_box:center_y() - 2 - h / 2
	local mod_links = {up = "skilltree", down = "skilltree", left = "skilltree", right = "skilltree"}
	do
		local box_name, points, progress, num_skills = nil, nil, nil, nil
		for tree,data in ipairs(tweak_data.skilltree.trees) do
			box_name = "icon_skilltree_" .. data.skill
			points = managers.skilltree:get_tree_progress_new(tree)
			if points ~= 0 or not Color(0.5, 0.5, 0.5) then
				icon_box = self:create_box({name = box_name, w = w, h = h + 20, padding = 0, can_select = false, use_borders = false, text = tostring(points), text_color = tweak_data.screen_colors.text, text_vertical = "bottom", text_align = "center", image = "guis/textures/pd2/inv_skillcards_icons", 
texture_rect = {(tree - 1) * 24, 0, 22, 31}, alpha = 1, select_anim = select_anim, unselect_anim = select_anim, bg_blend_mode = "normal", layer = 3, clbks = false, links = mod_links})
				icon_box:set_lefttop(math.round(x), math.round(y))
				x = x + w + 2
			end
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 376 
end

PlayerInventoryGui.create_box = function(self, params, index)
	-- upvalues: make_fine_text
	local x = params.x or 0
	local y = params.y or 0
	local w = math.max(params.w or params.width or 1, 1)
	local h = math.max(params.h or params.height or 1, 1)
	local alpha = params.alpha or params.a or 1
	if params.shrink_text == nil then
		local shrink_text = true
		local adept_width = params.adept_width or false
		if params.keep_box_ratio == nil then
			local keep_box_ratio = true
			local box_halign = params.halign or "left"
			local box_valign = params.valign or "top"
			local border_padding = params.border_padding or params.padding or 5
			local padding = params.padding or 0
			local text = params.text or false
			local unselected_text = params.unselected_text or text
			local image = params.image or false
			local dual_image = params.dual_image or false
			if params.use_borders == nil then
				local use_borders = true
				local use_background = params.use_background or false
				local background_image = params.bg_image or false
				local clbks = params.callbacks or params.clbks or false
				local links = params.links or false
				if params.can_select == nil then
					local can_select = true
					local layer = params.layer or 1
					if params.enabled == nil then
						local enabled = true
						if not params.name then
							local name = tostring(#self._boxes + 1)
						end
						if self._boxes_by_name[name] then
							Application:error("[PlayerInventoryGui:create_box] Failed creating box! Box with that name already exists", name)
							return 
						end
						local select_anim = params.select_anim or false
						local unselect_anim = params.unselect_anim or false
						w = math.max(w, border_padding * 2 + 1)
						h = math.max(h, border_padding * 2 + 1)
						local panel = (self._panel:panel({name = name, x = x, y = y, w = w, h = h, alpha = alpha, layer = layer * 10}))
						local text_object, image_object, borders_object, bg_object = nil, nil, nil, nil
						if not params.text_align then
							local align = not text or "left"
						end
						local vertical = params.text_vertical or "top"
						if not params.text_selected_color and not params.text_color then
							local selected_color = tweak_data.screen_colors.text
						end
						if not params.text_unselected_color and not params.text_color then
							local unselected_color = tweak_data.screen_colors.button_stage_3:with_alpha(0.25)
						end
						local blend_mode = params.text_blend_mode or params.blend_mode or "add"
						if not params.font then
							local font = tweak_data.menu.pd2_small_font
						end
						if not params.font_size then
							local font_size = tweak_data.menu.pd2_small_font_size
						end
						local gui_object = panel:text({text = unselected_text, font = font, font_size = font_size, color = unselected_color, blend_mode = blend_mode, layer = 1})
						make_fine_text(gui_object)
						do
							local needed_width = gui_object:w() + border_padding * 2
							if w < needed_width then
								if shrink_text then
									gui_object:set_font_size(font_size * (w / needed_width))
									make_fine_text(gui_object)
								end
							elseif adept_width then
								panel:set_w(needed_width)
							if keep_box_ratio then
								end
								local ratio = w / h
								panel:set_h(panel:w() / ratio)
							end
							if vertical == "top" then
								gui_object:set_top(border_padding)
							elseif vertical == "bottom" then
								gui_object:set_bottom(panel:h() - border_padding)
							else
								gui_object:set_center_y(panel:h() / 2)
							end
							if align == "left" then
								gui_object:set_left(border_padding)
							elseif align == "right" then
								gui_object:set_right(panel:w() - border_padding)
							else
								gui_object:set_center_x(panel:w() / 2)
							end
							gui_object:set_position(math.round(gui_object:x()), math.round(gui_object:y()))
							text_object = {gui = gui_object, selected_text = text, unselected_text = unselected_text, selected_color = selected_color, unselected_color = unselected_color, 
shape = {gui_object:shape()}}
						end
						if not params.text_vertical then
							local text_vertical = not image and not dual_image or "top"
						end
						local async_loading = true
						if not params.image_selected_color and not params.image_color then
							local selected_color = Color.white
						end
						if not params.image_unselected_color and not params.image_color then
							local unselected_color = Color.white
						end
						local render_template = params.image_render_template
						local blend_mode = params.image_blend_mode or params.blend_mode or "normal"
						local texture_rect = params.texture_rect or params.image_rect or nil
						local image_size_mul = params.image_size_mul or 1
						local panel_width = panel:w() - border_padding * 2
						local panel_height = panel:h() - border_padding * 2 - (text_object and text_object.gui:h() + padding or 0)
						local gui_object = panel:panel({w = panel_width, h = panel_height, layer = 1})
						if text_object and text_object.gui and text_vertical == "top" then
							gui_object:set_top(text_object.gui:bottom())
						elseif text_object and text_object.gui and text_vertical == "bottom" then
							gui_object:set_bottom(text_object.gui:top())
						else
							gui_object:set_y(border_padding)
						end
						gui_object:set_center_x(panel:w() / 2)
						local requested_textures = {}
						do
							local requested_indices = {}
							if image then
								local params = {panel = gui_object, selected_color = selected_color, unselected_color = unselected_color, render_template = render_template, blend_mode = blend_mode, texture_rect = texture_rect, image_size_mul = image_size_mul}
								if not async_loading then
									self:texture_loaded_clbk(Idstring(image), params)
								else
									local texture_loaded_clbk = callback(self, self, "texture_loaded_clbk", params)
									table.insert(requested_textures, image)
									table.insert(requested_indices, managers.menu_component:request_texture(image, texture_loaded_clbk))
								end
							elseif dual_image then
								local texture_rect_dual_1 = params.texture_rect_dual_1 or params.image_rect_dual_1 or nil
								local texture_rect_dual_2 = params.texture_rect_dual_2 or params.image_rect_dual_2 or nil
								local panel1 = gui_object:panel({halign = "scale", valign = "scale"})
								panel1:set_size(gui_object:w() / 2, gui_object:h() / 2)
								panel1:set_center(gui_object:w() * 0.5, gui_object:h() * 0.35)
								local params = {panel = panel1, selected_color = selected_color, unselected_color = unselected_color, render_template = render_template, blend_mode = blend_mode, texture_rect = texture_rect_dual_1}
								if not async_loading then
									self:texture_loaded_clbk(Idstring(dual_image[1]), params)
								else
									local texture_loaded_clbk = callback(self, self, "texture_loaded_clbk", params)
									table.insert(requested_textures, dual_image[1])
									table.insert(requested_indices, managers.menu_component:request_texture(dual_image[1], texture_loaded_clbk))
								end
								local panel2 = gui_object:panel({halign = "scale", valign = "scale"})
								panel2:set_size(gui_object:w() / 2, gui_object:h() / 2)
								panel2:set_center(gui_object:w() * 0.5, gui_object:h() * 0.65)
								local params = {panel = panel2, selected_color = selected_color, unselected_color = unselected_color, render_template = render_template, blend_mode = blend_mode, texture_rect = texture_rect_dual_2}
								if not async_loading then
									self:texture_loaded_clbk(Idstring(dual_image[2]), params)
								end
							else
								local texture_loaded_clbk = callback(self, self, "texture_loaded_clbk", params)
								table.insert(requested_textures, dual_image[2])
								table.insert(requested_indices, managers.menu_component:request_texture(dual_image[2], texture_loaded_clbk))
							end
							image_object = {gui = gui_object, selected_color = selected_color, unselected_color = unselected_color, 
shape = {gui_object:shape()}, requested_textures = requested_textures, requested_indices = requested_indices}
						end
						if use_borders then
							if not params.box_selected_color and not params.box_color then
								local selected_color = Color.white
							end
							if not params.box_unselected_color and not params.box_color then
								local unselected_color = Color.white
							end
							if not params.box_selected_sides then
								local selected_sides = {2, 2, 2, 2}
							end
							if not params.box_unselected_sides then
								local unselected_sides = {0, 0, 0, 0}
							end
							local gui_object = BoxGuiObject:new(panel, {sides = unselected_sides})
							gui_object:set_color(unselected_color)
							borders_object = {gui = gui_object, selected_color = selected_color, unselected_color = unselected_color, selected_sides = selected_sides, unselected_sides = unselected_sides}
						end
						if use_background then
							if not params.bg_selected_color and not params.bg_color then
								local selected_color = Color.white
							end
							if not params.bg_unselected_color and not params.bg_color then
								local unselected_color = Color.white
							end
							local selectable = params.bg_selectable or false
							local blend_mode = params.bg_blend_mode or params.blend_mode or "add"
							local gui_object = nil
							if background_image then
								gui_object = panel:bitmap({texture = background_image, color = unselected_color, blend_mode = blend_mode, visible = not selectable, blend_mode = "add", layer = 0})
								if image_object then
									local texture_width = gui_object:texture_width()
									local texture_height = gui_object:texture_height()
									local panel_width = image_object.gui:w()
									local panel_height = image_object.gui:h()
									local tw = texture_width
									local th = texture_height
									local pw = panel_width
									local ph = panel_height
									if tw == 0 or th == 0 then
										Application:error("[BlackMarketGuiSlotItem] BG Texture size error!:", "width", tw, "height", th)
										tw = 1
										th = 1
									end
									local sw = math.min(pw, ph * (tw / th))
									local sh = math.min(ph, pw / (tw / th))
									gui_object:set_size(math.round(sw), math.round(sh))
									gui_object:set_world_center(image_object.gui:world_center())
								else
									gui_object:set_size(panel:w(), panel:h())
								end
							else
								gui_object = panel:rect({color = unselected_color, blend_mode = blend_mode, visible = not selectable, layer = 0})
							end
							bg_object = {gui = gui_object, selected_color = selected_color, unselected_color = unselected_color}
						end
						if panel:w() ~= w or panel:h() ~= h then
							if box_halign == "right" then
								panel:set_right(x + w)
							else
								panel:set_left(x)
							end
							if box_valign == "bottom" then
								panel:set_bottom(y + h)
							end
						else
							panel:set_top(y)
						end
						do
							local box = {name = name, layer = layer, panel = panel, clbks = clbks, text_object = text_object, image_object = image_object, borders_object = borders_object, bg_object = bg_object, enabled = enabled, selected = false, select_anim = select_anim, unselect_anim = unselect_anim, links = links, can_select = can_select, params = params}
							if unselect_anim then
								panel:animate(unselect_anim, box, true)
							end
							if index and not self._boxes[index] then
								self._boxes[index] = box
							else
								self._boxes[#self._boxes + 1] = box
							end
							self._boxes_by_name[name] = box
							if not self._boxes_by_layer[layer] then
								self._boxes_by_layer[layer] = {}
							end
							self._boxes_by_layer[layer][#self._boxes_by_layer[layer] + 1] = box
							if layer > 1 then
								table.insert(self._mod_boxes, box)
							end
							self._max_layer = math.max(self._max_layer, layer)
							return panel, box
						end
						 -- WARNING: missing end command somewhere! Added here
					end
					 -- WARNING: missing end command somewhere! Added here
				end
				 -- WARNING: missing end command somewhere! Added here
			end
			 -- WARNING: missing end command somewhere! Added here
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 42 54 97 124 136 
end

PlayerInventoryGui.update_box = function(self, box, params, skip_update_other)
	if not box or not box.params then
		return 
	end
	local selected = box.selected
	local box_params = box.params
	box_params.links = box.links
	if params then
		for i,d in pairs(params) do
			box_params[i] = d
		end
	end
	local visible = box.panel:visible()
	self:unretrieve_box_textures(box)
	if box.panel then
		self._panel:remove(box.panel)
	end
	local box_index = 0
	if not self._boxes_by_layer[box.layer] then
		for index,layer_box in ipairs({}) do
		end
		if layer_box.name == box_params.name then
			box_index = index
	else
		end
	end
	if box_index ~= 0 then
		table.remove(self._boxes_by_layer[box.layer], box_index)
	end
	local box_index = 0
	for index,index_box in ipairs(self._boxes) do
		if index_box.name == box_params.name then
			box_index = index
	else
		end
	end
	self._boxes[box_index] = nil
	self._boxes_by_name[box_params.name] = nil
	local panel, new_box = self:create_box(box_params, box_index)
	panel:set_visible(visible)
	if not skip_update_other then
		self:update_detection()
		self:_update_player_stats()
		self:_update_mod_boxes()
	end
	if selected then
		new_box.selected = true
		self:_update_box_status(new_box, true)
	if new_box.select_anim then
		end
		new_box.panel:stop()
		new_box.panel:animate(new_box.select_anim, new_box, true)
	end
end

PlayerInventoryGui._update_loadout_boxes = function(self)
	local player_loadout_data = managers.blackmarket:player_loadout_data()
	local loadout_boxes = {primary = "primary", secondary = "secondary", melee = "melee_weapon", throwable = "grenade", armor = "armor", deployable = "deployable", mask = "mask", character = "character"}
	local box = nil
	for box_name,entry in pairs(loadout_boxes) do
		box = self._boxes_by_name[box_name]
		self:update_box(box, {text = player_loadout_data[entry].info_text, image = player_loadout_data[entry].item_texture, 
dual_image = {player_loadout_data[entry].dual_texture_1, player_loadout_data[entry].dual_texture_2}}, true)
	end
	self:update_detection()
	self:_update_player_stats()
	self:_update_mod_boxes()
end

PlayerInventoryGui.update_detection = function(self)
	-- upvalues: make_fine_text
	local detection_panel = self._player_panel:child("detection_panel")
	if not alive(detection_panel) then
		return 
	end
	local detection_ring_left = detection_panel:child("detection_left")
	local detection_ring_right = detection_panel:child("detection_right")
	local detection_ring_left2 = detection_panel:child("detection_left2")
	local detection_ring_right2 = detection_panel:child("detection_right2")
	local detection_value = detection_panel:child("detection_value")
	local value, maxed_reached, min_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_value:set_text(math.round(value * 100))
	detection_ring_left:set_color(Color(0.5 + value * 0.5, 1, 1))
	detection_ring_right:set_color(Color(0.5 + value * 0.5, 1, 1))
	if maxed_reached then
		detection_value:set_color(Color(255, 255, 42, 0) / 255)
	elseif min_reached then
		detection_value:set_color(tweak_data.screen_colors.text)
	else
		detection_value:set_color(tweak_data.screen_colors.text)
	end
	make_fine_text(detection_value)
	detection_value:set_center(detection_panel:w() / 2, detection_panel:h() / 2 + 2)
	detection_value:set_position(math.round(detection_value:x()), math.round(detection_value:y()))
	local value, maxed_reached, min_reached = managers.blackmarket:get_suspicion_offset_of_local(tweak_data.player.SUSPICION_OFFSET_LERP or 0.75, true)
	detection_ring_left2:set_color(Color(0.5 + value * 0.5, 1, 1))
	detection_ring_right2:set_color(Color(0.5 + value * 0.5, 1, 1))
end

PlayerInventoryGui.texture_loaded_clbk = function(self, params, texture_idstring)
	local panel = params.panel
	local texture = texture_idstring
	local selected_color = params.selected_color
	local unselected_color = params.unselected_color
	local render_template = params.render_template
	local blend_mode = params.blend_mode
	local texture_rect = params.texture_rect
	local image_size_mul = params.image_size_mul or 1
	local gui_object = panel:bitmap({texture = texture, color = unselected_color, render_template = render_template, blend_mode = blend_mode, halign = "scale", valign = "scale", texture_rect = texture_rect})
	local panel_width = panel:width()
	local panel_height = panel:height()
	if not texture_rect or not texture_rect[3] then
		local texture_width = gui_object:texture_width()
	end
	if not texture_rect or not texture_rect[4] then
		local texture_height = gui_object:texture_height()
	end
	if panel_height <= 0 then
		Application:error("[PlayerInventoryGui:create_box] Failed creating image! Box not large enough")
		panel:remove(gui_object)
		gui_object = nil
	else
		local aspect = panel_width / panel_height
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh
		gui_object:set_size(math.round(dw * panel_width * image_size_mul), math.round(dh * panel_height * image_size_mul))
		gui_object:set_center(panel_width / 2, panel_height / 2)
	end
end

PlayerInventoryGui.open_weapon_mod_menu = function(self, box)
	BlackMarketGui.choose_weapon_mods_callback(self, box.params.mod_data)
end

PlayerInventoryGui.open_weapon_category_menu = function(self, category)
	if not managers.blackmarket:get_crafted_category(category) then
		local crafted_category = {}
	end
	local new_node_data = {category = category}
	local rows = tweak_data.gui.WEAPON_ROWS_PER_PAGE or 3
	local columns = tweak_data.gui.WEAPON_COLUMNS_PER_PAGE or 3
	local max_pages = tweak_data.gui.MAX_WEAPON_PAGES or 8
	local items_per_page = rows * columns
	local item_data, selected_tab = nil, nil
	for page = 1, max_pages do
		local index = 1
		local start_i = 1 + items_per_page * (page - 1)
		item_data = {}
		for i = start_i, items_per_page * page do
			item_data[index] = i
			index = index + 1
			if crafted_category[i] and crafted_category[i].equipped then
				selected_tab = page
			end
		end
		local name_id = managers.localization:to_upper_text("bm_menu_page", {page = tostring(page)})
		table.insert(new_node_data, {name = category, category = category, prev_node_data = false, start_i = start_i, allow_preview = true, name_localized = name_id, on_create_func_name = "populate_weapon_category_new", on_create_data = item_data, identifier = BlackMarketGui.identifiers.weapon, 
override_slots = {columns, rows}})
	end
	new_node_data.can_move_over_tabs = true
	new_node_data.selected_tab = selected_tab
	new_node_data.scroll_tab_anywhere = true
	new_node_data.topic_id = "bm_menu_" .. category
	new_node_data.topic_params = {weapon_category = managers.localization:text("bm_menu_weapons")}
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui._open_preview_node = function(self)
	managers.menu:open_node("blackmarket_preview_node", {})
end

PlayerInventoryGui._open_crafting_node = function(self, data)
	managers.menu:open_node("blackmarket_crafting_node", data)
end

PlayerInventoryGui._start_crafting_weapon = function(self, data, new_node_data)
	local custom_data = {item_pos = managers.menu_scene:get_scene_template_data("blackmarket_crafting").item_pos, scene_template = "blackmarket_crafting"}
	managers.blackmarket:view_weapon(data.category, data.slot, callback(self, self, "_open_crafting_node", {new_node_data}), true, BlackMarketGui.get_crafting_custom_data())
end

PlayerInventoryGui.open_primary_menu = function(self)
	self:open_weapon_category_menu("primaries")
end

PlayerInventoryGui.preview_primary = function(self)
	managers.blackmarket:view_weapon("primaries", managers.blackmarket:equipped_weapon_slot("primaries"), callback(self, self, "_open_preview_node"))
end

PlayerInventoryGui.previous_primary = function(self)
	local box = self._boxes_by_name.primary
	if box and managers.blackmarket:equip_previous_weapon("primaries") then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		if player_loadout_data.primary.item_bg_texture then
			self:update_box(box, {text = player_loadout_data.primary.info_text, text_selected_color = player_loadout_data.primary.info_text_color, image = player_loadout_data.primary.item_texture, bg_image = player_loadout_data.primary.item_bg_texture, use_background = true})
			self:_update_info_weapon("primary")
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 36 
end

PlayerInventoryGui.next_primary = function(self)
	local box = self._boxes_by_name.primary
	if box and managers.blackmarket:equip_next_weapon("primaries") then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		if player_loadout_data.primary.item_bg_texture then
			self:update_box(box, {text = player_loadout_data.primary.info_text, text_selected_color = player_loadout_data.primary.info_text_color, image = player_loadout_data.primary.item_texture, bg_image = player_loadout_data.primary.item_bg_texture, use_background = true})
			self:_update_info_weapon("primary")
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 36 
end

PlayerInventoryGui.open_secondary_menu = function(self)
	self:open_weapon_category_menu("secondaries")
end

PlayerInventoryGui.preview_secondary = function(self)
	managers.blackmarket:view_weapon("secondaries", managers.blackmarket:equipped_weapon_slot("secondaries"), callback(self, self, "_open_preview_node"))
end

PlayerInventoryGui.previous_secondary = function(self)
	local box = self._boxes_by_name.secondary
	if box and managers.blackmarket:equip_previous_weapon("secondaries") then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		if player_loadout_data.secondary.item_bg_texture then
			self:update_box(box, {text = player_loadout_data.secondary.info_text, text_selected_color = player_loadout_data.secondary.info_text_color or false, image = player_loadout_data.secondary.item_texture, bg_image = player_loadout_data.secondary.item_bg_texture, use_background = true})
			self:_update_info_weapon("secondary")
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 39 
end

PlayerInventoryGui.next_secondary = function(self)
	local box = self._boxes_by_name.secondary
	if box and managers.blackmarket:equip_next_weapon("secondaries") then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		if player_loadout_data.secondary.item_bg_texture then
			self:update_box(box, {text = player_loadout_data.secondary.info_text, text_selected_color = player_loadout_data.secondary.info_text_color or false, image = player_loadout_data.secondary.item_texture, bg_image = player_loadout_data.secondary.item_bg_texture, use_background = true})
			self:_update_info_weapon("secondary")
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 39 
end

PlayerInventoryGui.open_melee_menu = function(self)
	local sorted_categories, item_categories = managers.blackmarket:get_sorted_melee_weapons()
	local new_node_data = {}
	local item_data, selected_tab = nil, nil
	for page,category in ipairs(sorted_categories) do
		local items = item_categories[category]
		item_data = {}
		for _,item in ipairs(items) do
			table.insert(item_data, item)
			if item[2] and item[2].equipped then
				selected_tab = page
			end
		end
		local name_id = managers.localization:to_upper_text("bm_menu_page", {page = tostring(page)})
		table.insert(new_node_data, {name = category, category = "melee_weapons", prev_node_data = false, allow_preview = true, name_localized = name_id, on_create_func_name = "populate_melee_weapons_new", on_create_data = item_data, 
override_slots = {4, 4}, identifier = BlackMarketGui.identifiers.melee_weapon})
	end
	new_node_data.selected_tab = selected_tab
	new_node_data.scroll_tab_anywhere = true
	new_node_data.topic_id = "bm_menu_melee_weapons"
	new_node_data.topic_params = {weapon_category = managers.localization:text("bm_menu_melee_weapons")}
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_melee = function(self)
	local equipped_melee_weapon = managers.blackmarket:equipped_melee_weapon()
	local my_tweak_data = tweak_data.blackmarket.melee_weapons[equipped_melee_weapon]
	if my_tweak_data and my_tweak_data.unit and not my_tweak_data.no_inventory_preview then
		managers.menu:open_node("blackmarket_preview_node", {})
		managers.blackmarket:preview_melee_weapon(equipped_melee_weapon)
	end
end

PlayerInventoryGui.previous_melee = function(self)
	local box = self._boxes_by_name.melee
	if box and managers.blackmarket:equip_previous_melee_weapon() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.melee_weapon.info_text, image = player_loadout_data.melee_weapon.item_texture, 
dual_image = {player_loadout_data.melee_weapon.dual_texture_1, player_loadout_data.melee_weapon.dual_texture_2}})
		self:_update_info_melee("melee")
	end
end

PlayerInventoryGui.next_melee = function(self)
	local box = self._boxes_by_name.melee
	if box and managers.blackmarket:equip_next_melee_weapon() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.melee_weapon.info_text, image = player_loadout_data.melee_weapon.item_texture, 
dual_image = {player_loadout_data.melee_weapon.dual_texture_1, player_loadout_data.melee_weapon.dual_texture_2}})
		self:_update_info_melee("melee")
	end
end

PlayerInventoryGui.open_throwable_menu = function(self)
	local new_node_data = {}
	table.insert(new_node_data, {name = "bm_menu_grenades", category = "grenades", on_create_func_name = "populate_grenades", allow_preview = true, 
override_slots = {3, 3}, identifier = BlackMarketGui.identifiers.grenade})
	new_node_data.scroll_tab_anywhere = true
	new_node_data.topic_id = "bm_menu_grenades"
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_throwable = function(self)
	local equipped_grenade = managers.blackmarket:equipped_grenade()
	local my_tweak_data = tweak_data.blackmarket.projectiles[equipped_grenade]
	if my_tweak_data and my_tweak_data.unit_dummy and not my_tweak_data.no_inventory_preview then
		managers.menu:open_node("blackmarket_preview_node", {})
		managers.blackmarket:preview_grenade(equipped_grenade)
	end
end

PlayerInventoryGui.previous_throwable = function(self)
	local box = self._boxes_by_name.throwable
	if box and managers.blackmarket:equip_previous_grenade() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.grenade.info_text, image = player_loadout_data.grenade.item_texture})
		self:_update_info_throwable("throwable")
	end
end

PlayerInventoryGui.next_throwable = function(self)
	local box = self._boxes_by_name.throwable
	if box and managers.blackmarket:equip_next_grenade() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.grenade.info_text, image = player_loadout_data.grenade.item_texture})
		self:_update_info_throwable("throwable")
	end
end

PlayerInventoryGui.open_armor_menu = function(self)
	local new_node_data = {}
	table.insert(new_node_data, {name = "bm_menu_armors", category = "armors", on_create_func_name = "populate_armors", 
override_slots = {4, 2}, identifier = BlackMarketGui.identifiers.armor})
	new_node_data.topic_id = "bm_menu_armors"
	new_node_data.scroll_tab_anywhere = true
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_armor = function(self)
end

PlayerInventoryGui.previous_armor = function(self)
	local box = self._boxes_by_name.armor
	if box and managers.blackmarket:equip_previous_armor() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.armor.info_text, image = player_loadout_data.armor.item_texture})
		self:_update_info_armor("armor")
	end
end

PlayerInventoryGui.next_armor = function(self)
	local box = self._boxes_by_name.armor
	if box and managers.blackmarket:equip_next_armor() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.armor.info_text, image = player_loadout_data.armor.item_texture})
		self:_update_info_armor("armor")
	end
end

PlayerInventoryGui.open_deployable_menu = function(self)
	local new_node_data = {}
	table.insert(new_node_data, {name = "bm_menu_deployables", category = "deployables", on_create_func_name = "populate_deployables", 
override_slots = {4, 2}, identifier = BlackMarketGui.identifiers.deployable})
	new_node_data.scroll_tab_anywhere = true
	new_node_data.topic_id = "bm_menu_deployables"
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_deployable = function(self)
	local equipped_deployable = managers.blackmarket:equipped_deployable()
	local my_tweak_data = tweak_data.equipments[equipped_deployable]
	if my_tweak_data and my_tweak_data.dummy_unit and not my_tweak_data.no_inventory_preview then
		managers.menu:open_node("blackmarket_preview_node", {})
		managers.blackmarket:preview_deployable(equipped_deployable)
	end
end

PlayerInventoryGui.previous_deployable = function(self)
	local box = self._boxes_by_name.deployable
	if box and managers.blackmarket:equip_previous_deployable() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.deployable.info_text, image = player_loadout_data.deployable.item_texture})
		self:_update_info_deployable("deployable")
	end
end

PlayerInventoryGui.next_deployable = function(self)
	local box = self._boxes_by_name.deployable
	if box and managers.blackmarket:equip_next_deployable() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.deployable.info_text, image = player_loadout_data.deployable.item_texture})
		self:_update_info_deployable("deployable")
	end
end

PlayerInventoryGui.open_mask_menu = function(self)
	if not managers.blackmarket:get_crafted_category("masks") then
		local crafted_category = {}
	end
	local new_node_data = {category = "masks"}
	local rows = tweak_data.gui.MASK_ROWS_PER_PAGE or 3
	local columns = tweak_data.gui.MASK_COLUMNS_PER_PAGE or 3
	local max_pages = tweak_data.gui.MAX_MASK_PAGES or 8
	local items_per_page = rows * columns
	local item_data, selected_tab = nil, nil
	for page = 1, max_pages do
		local index = 1
		local start_i = 1 + items_per_page * (page - 1)
		item_data = {}
		for i = start_i, items_per_page * page do
			item_data[index] = i
			index = index + 1
			if crafted_category[i] and crafted_category[i].equipped then
				selected_tab = page
			end
		end
		local name_id = managers.localization:to_upper_text("bm_menu_page", {page = tostring(page)})
		table.insert(new_node_data, {name = "masks", category = "masks", prev_node_data = false, start_i = start_i, allow_preview = true, name_localized = name_id, on_create_func_name = "populate_masks_new", on_create_data = item_data, identifier = BlackMarketGui.identifiers.mask, 
override_slots = {columns, rows}})
	end
	new_node_data.can_move_over_tabs = true
	new_node_data.selected_tab = selected_tab
	new_node_data.scroll_tab_anywhere = true
	new_node_data.topic_id = "bm_menu_masks"
	new_node_data.topic_params = {weapon_category = managers.localization:text("bm_menu_masks")}
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_mask = function(self)
	managers.blackmarket:view_mask(managers.blackmarket:equipped_mask_slot())
	managers.menu:open_node("blackmarket_preview_mask_node", {})
end

PlayerInventoryGui.previous_mask = function(self)
	local box = self._boxes_by_name.mask
	if box and managers.blackmarket:equip_previous_mask() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.mask.info_text, image = player_loadout_data.mask.item_texture})
		self:_update_info_mask("mask")
	end
end

PlayerInventoryGui.next_mask = function(self)
	local box = self._boxes_by_name.mask
	if box and managers.blackmarket:equip_next_mask() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.mask.info_text, image = player_loadout_data.mask.item_texture})
		self:_update_info_mask("mask")
	end
end

PlayerInventoryGui.open_character_menu = function(self)
	local new_node_data = {}
	table.insert(new_node_data, {name = "bm_menu_characters", category = "characters", on_create_func_name = "populate_characters", 
override_slots = {5, 3}, identifier = BlackMarketGui.identifiers.character})
	new_node_data.scroll_tab_anywhere = true
	new_node_data.extra_options_panel = {h = 100, on_create_func_name = "populate_preferred_character_options"}
	new_node_data.topic_id = "bm_menu_characters"
	managers.menu:open_node("blackmarket_node", {new_node_data})
end

PlayerInventoryGui.preview_character = function(self)
end

PlayerInventoryGui.previous_character = function(self)
	local box = self._boxes_by_name.character
	if box and managers.blackmarket:equip_previous_character() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.character.info_text, image = player_loadout_data.character.item_texture})
		self:_update_info_character("character")
	if alive(self._character_text) then
		end
		if managers.network:session() or not managers.blackmarket:get_preferred_character_real_name() then
			self._character_text:set_text(managers.localization:to_upper_text("menu_" .. tostring(managers.network:session():local_peer():character())))
		end
	end
end

PlayerInventoryGui.next_character = function(self)
	local box = self._boxes_by_name.character
	if box and managers.blackmarket:equip_next_character() then
		local player_loadout_data = managers.blackmarket:player_loadout_data()
		self:update_box(box, {text = player_loadout_data.character.info_text, image = player_loadout_data.character.item_texture})
		self:_update_info_character("character")
	if alive(self._character_text) then
		end
		if managers.network:session() or not managers.blackmarket:get_preferred_character_real_name() then
			self._character_text:set_text(managers.localization:to_upper_text("menu_" .. tostring(managers.network:session():local_peer():character())))
		end
	end
end

PlayerInventoryGui.open_skilltree_menu = function(self)
	managers.menu:open_node("skilltree", {
{hide_specialization = true}})
end

PlayerInventoryGui.preview_skilltree = function(self)
end

PlayerInventoryGui.previous_skilltree = function(self)
	local box = self._boxes_by_name.skilltree
	if box and managers.skilltree:switch_skills_to_previous() then
		self:update_box(box, {text = managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)})})
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		if alive(self._skill_switch_text) then
			self._skill_switch_text:set_text(managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}))
		end
		local box = self._boxes_by_name.specialization
	if box then
		end
		local texture_rect_x = 0
		local texture_rect_y = 0
		if specialization_data then
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			do
				local tier_data = specialization_data[max_tier]
			if tier_data then
				end
				texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
			end
			texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
		end
		self:update_box(box, {text = specialization_data and managers.localization:text(specialization_data.name_id) or " ", 
image_rect = {(texture_rect_x) * 64, (texture_rect_y) * 64, 64, 64}})
		self:_update_loadout_boxes()
		self:_update_info_skilltree("skilltree")
	end
end

PlayerInventoryGui.next_skilltree = function(self)
	local box = self._boxes_by_name.skilltree
	if box and managers.skilltree:switch_skills_to_next() then
		self:update_box(box, {text = managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)})})
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		if alive(self._skill_switch_text) then
			self._skill_switch_text:set_text(managers.localization:text("menu_st_skill_switch_set", {skill_switch = managers.skilltree:get_skill_switch_name(managers.skilltree:get_selected_skill_switch(), true)}))
		end
		local box = self._boxes_by_name.specialization
	if box then
		end
		local texture_rect_x = 0
		local texture_rect_y = 0
		if specialization_data then
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			do
				local tier_data = specialization_data[max_tier]
			if tier_data then
				end
				texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
			end
			texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
		end
		self:update_box(box, {text = specialization_data and managers.localization:text(specialization_data.name_id) or " ", 
image_rect = {(texture_rect_x) * 64, (texture_rect_y) * 64, 64, 64}})
		self:_update_loadout_boxes()
		self:_update_info_skilltree("skilltree")
	end
end

PlayerInventoryGui.open_specialization_menu = function(self)
	managers.menu:open_node("skilltree", {
{hide_skilltree = true}})
end

PlayerInventoryGui.preview_specialization = function(self)
end

PlayerInventoryGui.previous_specialization = function(self)
	local box = self._boxes_by_name.specialization
	if box and managers.skilltree:previous_specialization() then
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		local box = self._boxes_by_name.specialization
	if box then
		end
		local texture_rect_x = 0
		local texture_rect_y = 0
		local specialization_text = specialization_data and managers.localization:text(specialization_data.name_id) or " "
		if specialization_data then
			local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			local tier_data = specialization_data[max_tier]
		if tier_data then
			end
			texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
			texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
			specialization_text = specialization_text .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")"
		end
		self:update_box(box, {text = specialization_text, 
image_rect = {(texture_rect_x) * 64, (texture_rect_y) * 64, 64, 64}}, true)
		self:_update_loadout_boxes()
		self:_update_info_specialization("specialization")
	end
end

PlayerInventoryGui.next_specialization = function(self)
	local box = self._boxes_by_name.specialization
	if box and managers.skilltree:next_specialization() then
		local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
		local specialization_data = tweak_data.skilltree.specializations[current_specialization]
		local box = self._boxes_by_name.specialization
	if box then
		end
		local texture_rect_x = 0
		local texture_rect_y = 0
		local specialization_text = specialization_data and managers.localization:text(specialization_data.name_id) or " "
		if specialization_data then
			local current_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "current_tier")
			local max_tier = managers.skilltree:get_specialization_value(current_specialization, "tiers", "max_tier")
			local tier_data = specialization_data[max_tier]
		if tier_data then
			end
			texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
			texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0
			specialization_text = specialization_text .. " (" .. tostring(current_tier) .. "/" .. tostring(max_tier) .. ")"
		end
		self:update_box(box, {text = specialization_text, 
image_rect = {(texture_rect_x) * 64, (texture_rect_y) * 64, 64, 64}}, true)
		self:_update_loadout_boxes()
		self:_update_info_specialization("specialization")
	end
end

PlayerInventoryGui._update_box_status = function(self, box, selected)
	-- upvalues: make_fine_text
	local list = {"text_object", "image_object", "borders_object", "bg_object"}
	for i,object_name in ipairs(list) do
		if box[object_name] then
			local object = box[object_name]
			if object.selected_color and object.unselected_color then
				if object.gui.children then
					for _,child in ipairs(object.gui:children()) do
						if child.children then
							for _,junior in ipairs(child:children()) do
								if not selected or not object.selected_color then
									junior:set_color(object.unselected_color)
								end
							end
						elseif not selected or not object.selected_color then
							child:set_color(object.unselected_color)
						end
					end
				end
			else
				if not selected or not object.selected_color then
					object.gui:set_color(object.unselected_color)
				end
			end
		if object.selected_sides then
			end
		if object.unselected_sides then
			end
			if object.gui.children then
				for _,child in ipairs(object.gui:children()) do
					if not selected or not object.selected_sides then
						child:create_sides(box.panel, {sides = object.unselected_sides})
					end
				end
			end
		else
			if not selected or not object.selected_sides then
				object.gui:create_sides(box.panel, {sides = object.unselected_sides})
			end
		end
	end
	local text_object = box.text_object
	if text_object and text_object.selected_text and text_object.unselected_text then
		local panel = box.panel
		local align = box.params and box.params.text_align or "left"
		local vertical = box.params and box.params.text_vertical or "top"
		local gui_object = text_object.gui
		local border_padding = box.params and box.params.border_padding or box.params.padding or 5
		local shrink_text = box.params and box.params.shrink_text or true
		local adept_width = box.params and box.params.adept_width or false
		local keep_box_ratio = box.params and box.params.keep_box_ratio or true
		if not box.params or not box.params.font then
			local font = tweak_data.menu.pd2_small_font
		end
		if not box.params or not box.params.font_size then
			local font_size = tweak_data.menu.pd2_small_font_size
		end
		gui_object:set_font_size(font_size)
		if not selected or not text_object.selected_text then
			gui_object:set_text(text_object.unselected_text)
		end
		make_fine_text(gui_object)
		local w = box.panel:w()
		local needed_width = gui_object:w() + border_padding * 2
		if w < needed_width then
			if shrink_text then
				gui_object:set_font_size(font_size * (w / needed_width))
				make_fine_text(gui_object)
			end
		elseif box.params and adept_width then
			panel:set_w(needed_width)
		if keep_box_ratio then
			end
			local ratio = w / h
			panel:set_h(panel:w() / ratio)
		end
		if vertical == "top" then
			gui_object:set_top(border_padding)
		elseif vertical == "bottom" then
			gui_object:set_bottom(panel:h() - border_padding)
		else
			gui_object:set_center_y(panel:h() / 2)
		end
		if align == "left" then
			gui_object:set_left(border_padding)
		elseif align == "right" then
			gui_object:set_right(panel:w() - border_padding)
		else
			gui_object:set_center_x(panel:w() / 2)
		end
		gui_object:set_position(math.round(gui_object:x()), math.round(gui_object:y()))
	end
end

PlayerInventoryGui._get_selected_box = function(self)
	if self._data and self._data.selected_box then
		return self._boxes_by_name[self._data.selected_box]
	end
end

PlayerInventoryGui._move = function(self, dir, box)
	local selected_box = self:_get_selected_box()
	local move_box = box or selected_box
	if move_box and move_box.links then
		local linked_box_name = move_box.links[dir]
	if linked_box_name then
		end
		local new_box = self._boxes_by_name[linked_box_name]
	if new_box then
		end
		if not new_box.panel:tree_visible() and new_box.links and new_box.links[dir] then
			return self:_move(dir, new_box)
		end
		return 
		selected_box.selected = false
		self:_update_box_status(selected_box, false)
		if selected_box.unselect_anim then
			selected_box.panel:stop()
			selected_box.panel:animate(selected_box.unselect_anim, selected_box)
		end
		self._data.selected_box = linked_box_name
		new_box.selected = true
		self:_update_stats(new_box.name)
		self:_update_box_status(new_box, true)
		self:_update_legends(new_box.name)
	if new_box.select_anim then
		end
		new_box.panel:stop()
		new_box.panel:animate(new_box.select_anim, new_box)
	end
end

PlayerInventoryGui.move_left = function(self)
	self:_move("left")
end

PlayerInventoryGui.move_right = function(self)
	self:_move("right")
end

PlayerInventoryGui.move_up = function(self)
	self:_move("up")
end

PlayerInventoryGui.move_down = function(self)
	self:_move("down")
end

PlayerInventoryGui.next_page = function(self)
	local box = self:_get_selected_box()
	if box and box.panel:tree_visible() and box.clbks and box.clbks.up then
		box.clbks.up(box)
	end
end

PlayerInventoryGui.previous_page = function(self)
	local box = self:_get_selected_box()
	if box and box.panel:tree_visible() and box.clbks and box.clbks.down then
		box.clbks.down(box)
	end
end

PlayerInventoryGui.special_btn_pressed = function(self, button)
	if button == Idstring("menu_preview_item_alt") then
		local box = self:_get_selected_box()
		if box and box.panel:tree_visible() and box.clbks and box.clbks.right then
			box.clbks.right(box)
		end
	else
		if button == Idstring("toggle_legends") then
			do return end
		end
	end
	if button == Idstring("menu_toggle_voice_message") then
		if self._show_all_panel:visible() then
			self._show_all_panel:hide()
			self._panel:show()
			self._fullscreen_panel:show()
		end
	else
		self._show_all_panel:show()
		self._panel:hide()
		self._fullscreen_panel:hide()
	end
end

PlayerInventoryGui.confirm_pressed = function(self)
	local box = self:_get_selected_box()
	if box and box.panel:tree_visible() and box.clbks and box.clbks.left then
		box.clbks.left(box)
	end
end

PlayerInventoryGui.input_focus = function(self)
	if self._panel:visible() then
		return self._input_focus
	end
end

PlayerInventoryGui.mouse_moved = function(self, o, x, y)
	if managers.menu_scene and managers.menu_scene:input_focus() then
		return false
	end
	if not self._panel:visible() then
		return false, "arrow"
	end
	local used = false
	local pointer = "arrow"
	if self._panel:child("back_button"):inside(x, y) then
		used = true
		pointer = "link"
		if not self._back_button_highlighted then
			self._back_button_highlighted = true
			self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
			return used, pointer
		end
	elseif self._back_button_highlighted then
		self._back_button_highlighted = false
		self._panel:child("back_button"):set_color(tweak_data.screen_colors.button_stage_3)
	end
	do
		local mouse_over_selected_box = nil
		for i = self._max_layer, 1, -1 do
			if self._boxes_by_layer[i] then
				for _,box in ipairs(self._boxes_by_layer[i]) do
					if alive(box.panel) and box.panel:tree_visible() and box.can_select and box.panel:inside(x, y) then
						self._data.selected_box = box.name
						mouse_over_selected_box = box.name
						used = true
						pointer = "link"
					end
			else
				end
			end
			if used then
				do break end
			end
		end
		for _,button in ipairs(self._text_buttons) do
			if alive(button.panel) and button.panel:visible() then
				if button.panel:inside(x, y) then
					if not button.highlighted then
						button.highlighted = true
						managers.menu_component:post_event("highlight")
					if alive(button.text) then
						end
						button.text:set_color(tweak_data.screen_colors.button_stage_2)
					end
					used = true
				end
			elseif button.highlighted then
				button.highlighted = false
				button.text:set_color(tweak_data.screen_colors.button_stage_3)
			end
		end
		if self._change_alpha_table then
			for _,data in ipairs(self._change_alpha_table) do
				data.button:set_alpha(not alive(data.panel) or not alive(data.button) or (data.panel:inside(x, y) and 1) or 0.1)
			end
		end
		for _,box in ipairs(self._boxes) do
			if self._data.selected_box == box.name and not box.selected then
				box.selected = true
				self:_update_stats(box.name)
				self:_update_box_status(box, true)
				managers.menu_component:post_event("highlight")
			if box.select_anim then
				end
				box.panel:stop()
				box.panel:animate(box.select_anim, box)
			end
			for _,box in (for generator) do
				if box.selected then
					box.selected = false
					self:_update_box_status(box, false)
				if box.unselect_anim then
					end
					box.panel:stop()
					box.panel:animate(box.unselect_anim, box)
				end
			end
			if self._mouse_over_selected_box ~= mouse_over_selected_box then
				self._mouse_over_selected_box = mouse_over_selected_box
				self:_update_legends(mouse_over_selected_box)
			end
			self._input_focus = pointer == "arrow" and 2 or 1
			return used, pointer
		end
		 -- WARNING: missing end command somewhere! Added here
	end
end

PlayerInventoryGui.mouse_pressed = function(self, button, x, y)
	if managers.menu_scene and managers.menu_scene:input_focus() then
		return false
	end
	if not self._panel:visible() then
		return false
	end
	local left_clicked = button == Idstring("0")
	local right_clicked = button == Idstring("1")
	local scroll_up = button == Idstring("mouse wheel up")
	local scroll_down = button == Idstring("mouse wheel down")
	if left_clicked and self._panel:child("back_button"):inside(x, y) then
		managers.menu:back(true)
		return 
	end
	if button == Idstring("0") then
		for _,button in ipairs(self._text_buttons) do
			if alive(button.panel) and button.panel:visible() and button.panel:inside(x, y) then
				if button.clbk then
					button.clbk(button)
				end
				managers.menu_component:post_event("menu_enter")
				return true
			end
		end
	end
	local box = self:_get_selected_box()
	if box and box.clbks and box.panel:tree_visible() and box.panel:inside(x, y) then
		if left_clicked and box.clbks.left then
			box.clbks.left(box)
		end
	elseif right_clicked and box.clbks.right then
		box.clbks.right(box)
	elseif scroll_up and box.clbks.up then
		box.clbks.up(box)
	elseif scroll_down and box.clbks.down then
		box.clbks.down(box)
	end
end

PlayerInventoryGui.unretrieve_box_textures = function(self, box)
	local object = nil
	for _,object_name in ipairs({"text_object", "image_object", "borders_object", "bg_object"}) do
		object = box[object_name]
		if object and object.requested_textures then
			for i = 1, #object.requested_textures do
				if object.requested_indices[i] then
					managers.menu_component:unretrieve_texture(object.requested_textures[i], object.requested_indices[i])
				end
			end
		end
	end
end

PlayerInventoryGui.close = function(self)
	for _,box in ipairs(self._boxes) do
		self:unretrieve_box_textures(box)
	end
	WalletGuiObject.close_wallet(self._panel)
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
		self._panel = nil
	end
	if alive(self._fullscreen_panel) then
		self._fullscreen_ws:panel():remove(self._fullscreen_panel)
		self._fullscreen_panel = nil
	end
	if alive(self._show_all_panel) then
		self._ws:panel():remove(self._show_all_panel)
		self._show_all_panel = nil
	end
	self._boxes = {}
	self._boxes_by_name = {}
end

PlayerInventoryGui.create_text_button = function(self, params)
	-- upvalues: IS_WIN_32 , make_fine_text
	if not params.left then
		local left = params.x
	end
	local right = params.right
	if not params.top then
		local top = params.y
	end
	local bottom = params.bottom
	local text = params.text or (params.text_id and managers.localization:text(params.text_id)) or ""
	if params.text_to_upper then
		text = utf8.to_upper(text)
	end
	local clbk = params.clbk
	local layer = params.layer or 1
	local hide_blur = params.hide_blur
	local disabled = params.disabled
	if not params.font then
		local font = tweak_data.menu.pd2_small_font
	end
	if not params.font_size then
		local font_size = tweak_data.menu.pd2_small_font_size
	end
	local alpha = params.alpha or 1
	local button_panel = self._panel:panel({x = left, y = top, layer = layer, visible = not disabled, alpha = alpha})
	local gui_blur = button_panel:bitmap({name = "button_blur", texture = "guis/textures/test_blur_df", render_template = "VertexColorTexturedBlur3D", layer = -1, visible = not hide_blur})
	if not IS_WIN_32 or not tweak_data.screen_colors.button_stage_3 then
		local gui_text = button_panel:text({name = "button_text", text = text, font = font, font_size = font_size, color = tweak_data.screen_colors.text, blend_mode = "add", layer = 0})
		make_fine_text(gui_text)
		button_panel:set_size(gui_text:size())
		gui_blur:set_size(button_panel:size())
		if right then
			button_panel:set_right(right)
		end
		if bottom then
			button_panel:set_bottom(bottom)
		end
		do
			local left, right, top, bottom = nil, nil, nil, nil
			for _,button in ipairs(self._text_buttons) do
				if button_panel:left() >= button.panel:right() then
					left = not alive(button.text)
				end
				right = button.panel:left() < button_panel:right()
				top = button_panel:top() < button.panel:bottom()
				bottom = button.panel:top() < button_panel:bottom()
				if left and right and top and bottom then
					if button.panel:visible() and button_panel:visible() then
						Application:error("[PlayerInventoryGui:create_text_button] Text button intersects with another text button", text, button.text:text())
					end
				else
					Application:debug("[PlayerInventoryGui:create_text_button] Text button intersects with another text button", text, button_panel:visible(), button.text:text(), button.panel:visible())
				end
			end
			table.insert(self._text_buttons, {panel = button_panel, text = gui_text, blur = gui_blur, highlighted = false, clbk = clbk})
			return button_panel
		end
		 -- WARNING: missing end command somewhere! Added here
	end
	-- WARNING: F->nextEndif is not empty. Unhandled nextEndif->addr = 92 
end

PlayerInventoryGui._get_mods_stats = function(self, name, base_stats, equipped_mods, bonus_stats)
	local mods_stats = {}
	local modifier_stats = tweak_data.weapon[name].stats_modifiers
	for _,stat in pairs(self._stats_shown) do
		mods_stats[stat.name] = {}
		mods_stats[stat.name].index = 0
		mods_stats[stat.name].value = 0
	end
	if equipped_mods then
		local tweak_stats = tweak_data.weapon.stats
		local tweak_factory = tweak_data.weapon.factory.parts
		local factory_id = managers.weapon_factory:get_factory_id_by_weapon_id(name)
		local default_blueprint = managers.weapon_factory:get_default_blueprint_by_factory_id(factory_id)
		if bonus_stats then
			for _,stat in pairs(self._stats_shown) do
				if stat.name == "magazine" then
					local ammo = mods_stats[stat.name].index
					ammo = ammo + (not ammo or tweak_data.weapon[name].stats.extra_ammo or 0)
					mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or 0)
				elseif stat.name == "totalammo" then
					local ammo = bonus_stats.total_ammo_mod
					mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
				else
					mods_stats[stat.name].index = mods_stats[stat.name].index + (bonus_stats[stat.name] or 0)
				end
			end
		end
		local part_data = nil
		for _,mod in ipairs(equipped_mods) do
			part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(mod, factory_id, default_blueprint)
			if part_data then
				for _,stat in pairs(self._stats_shown) do
					if part_data.stats then
						if stat.name == "magazine" then
							local ammo = part_data.stats.extra_ammo
							ammo = ammo + (not ammo or tweak_data.weapon[name].stats.extra_ammo or 0)
							mods_stats[stat.name].value = mods_stats[stat.name].value + (ammo and tweak_data.weapon.stats.extra_ammo[ammo] or 0)
						end
					elseif stat.name == "totalammo" then
						local ammo = part_data.stats.total_ammo_mod
						mods_stats[stat.name].index = mods_stats[stat.name].index + (ammo or 0)
					else
						mods_stats[stat.name].index = mods_stats[stat.name].index + (part_data.stats[stat.name] or 0)
					end
				end
			end
		end
		local index, stat_name = nil, nil
		for _,stat in pairs(self._stats_shown) do
			stat_name = stat.name
			if mods_stats[stat.name].index and tweak_stats[stat_name] then
				if stat.name == "concealment" then
					index = base_stats[stat.name].index + mods_stats[stat.name].index
				else
					index = math.clamp(base_stats[stat.name].index + mods_stats[stat.name].index, 1, #tweak_stats[stat_name])
				end
				if not stat.index or not index then
					mods_stats[stat.name].value = tweak_stats[stat_name][index] * tweak_data.gui.stats_present_multiplier
				end
				local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier
				if stat.offset then
					mods_stats[stat.name].value = mods_stats[stat.name].value - offset
				end
				if stat.revert then
					local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]]) * tweak_data.gui.stats_present_multiplier
					if stat.offset then
						max_stat = max_stat - offset
					end
					mods_stats[stat.name].value = max_stat - mods_stats[stat.name].value
				end
				if modifier_stats and modifier_stats[stat.name] then
					local mod = modifier_stats[stat.name]
					if stat.revert and not stat.index then
						local real_base_value = tweak_stats[stat_name][index]
						local modded_value = real_base_value * mod
						local offset = math.min(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])
						if stat.offset then
							modded_value = modded_value - offset
						end
						local max_stat = math.max(tweak_stats[stat_name][1], tweak_stats[stat_name][#tweak_stats[stat_name]])
						if stat.offset then
							max_stat = max_stat - offset
						end
						local new_value = (max_stat - (modded_value)) * tweak_data.gui.stats_present_multiplier
						if mod ~= 0 and (tweak_stats[stat_name][1] < modded_value or modded_value < tweak_stats[stat_name][#tweak_stats[stat_name]]) then
							new_value = (new_value + mods_stats[stat.name].value / mod) / 2
						end
						mods_stats[stat.name].value = new_value
					end
				else
					mods_stats[stat.name].value = mods_stats[stat.name].value * mod
				end
				if stat.percent then
					if not stat.index or not #tweak_stats[stat.name] then
						local max_stat = math.max(tweak_stats[stat.name][1], tweak_stats[stat.name][#tweak_stats[stat.name]]) * tweak_data.gui.stats_present_multiplier
					end
					if stat.offset then
						max_stat = max_stat - offset
					end
					local ratio = mods_stats[stat.name].value / (max_stat)
					mods_stats[stat.name].value = ratio * 100
				end
				mods_stats[stat.name].value = mods_stats[stat.name].value - base_stats[stat.name].value
			end
		end
	end
	return mods_stats
end

PlayerInventoryGui._get_melee_weapon_stats = function(self, name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local stats_data = managers.blackmarket:get_melee_weapon_stats(name)
	local multiple_of = {}
	local has_non_special = managers.player:has_category_upgrade("player", "non_special_melee_multiplier")
	local has_special = managers.player:has_category_upgrade("player", "melee_damage_multiplier")
	local non_special = managers.player:upgrade_value("player", "non_special_melee_multiplier", 1) - 1
	local special = managers.player:upgrade_value("player", "melee_damage_multiplier", 1) - 1
	for i,stat in ipairs(self._stats_shown) do
		local skip_rounding = stat.num_decimals
		base_stats[stat.name] = {value = 0, min_value = 0, max_value = 0}
		mods_stats[stat.name] = {value = 0, min_value = 0, max_value = 0}
		skill_stats[stat.name] = {value = 0, min_value = 0, max_value = 0}
		if stat.name == "damage" then
			local base_min = stats_data.min_damage * tweak_data.gui.stats_present_multiplier
			local base_max = stats_data.max_damage * tweak_data.gui.stats_present_multiplier
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1)
			local skill_mul = dmg_mul * ((has_non_special and has_special and math.max(non_special, special) or 0) + 1) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			base_stats[stat.name] = {min_value = base_min, max_value = base_max, value = (base_min + base_max) / 2}
			skill_stats[stat.name] = {min_value = skill_min, max_value = skill_max, value = (skill_min + skill_max) / 2}
			skill_stats[stat.name].skill_in_effect = skill_min > 0 or skill_max > 0
		elseif stat.name == "damage_effect" then
			local base_min = stats_data.min_damage_effect
			local base_max = stats_data.max_damage_effect
			base_stats[stat.name] = {min_value = base_min, max_value = base_max, value = (base_min + base_max) / 2}
			local dmg_mul = managers.player:upgrade_value("player", "melee_" .. tostring(tweak_data.blackmarket.melee_weapons[name].stats.weapon_type) .. "_damage_multiplier", 1) - 1
			local enf_skill = has_non_special and has_special and math.max(non_special, special) or 0
			local gst_skill = managers.player:upgrade_value("player", "melee_knockdown_mul", 1) - 1
			local skill_mul = (1 + dmg_mul) * (1 + enf_skill) * (1 + gst_skill) - 1
			local skill_min = skill_mul
			local skill_max = skill_mul
			skill_stats[stat.name] = {skill_min = skill_min, skill_max = skill_max, min_value = skill_min, max_value = skill_max, value = (skill_min + skill_max) / 2}
			skill_stats[stat.name].skill_in_effect = skill_min > 0 or skill_max > 0
		elseif stat.name == "charge_time" then
			local base = stats_data.charge_time
			base_stats[stat.name] = {value = base, min_value = base, max_value = base}
		elseif stat.name == "range" then
			local base_min = stats_data.range
			local base_max = stats_data.range
			base_stats[stat.name] = {min_value = base_min, max_value = base_max, value = (base_min + base_max) / 2}
		elseif stat.name == "concealment" then
			local base = managers.blackmarket:_calculate_melee_weapon_concealment(name)
			local skill = managers.blackmarket:concealment_modifier("melee_weapons")
			base_stats[stat.name] = {min_value = base, max_value = base, value = base}
			skill_stats[stat.name] = {min_value = skill, max_value = skill, value = skill}
			skill_stats[stat.name].skill_in_effect = skill > 0
		end
		if stat.multiple_of then
			table.insert(multiple_of, {stat.name, stat.multiple_of})
		end
		base_stats[stat.name].real_value = base_stats[stat.name].value
		mods_stats[stat.name].real_value = mods_stats[stat.name].value
		skill_stats[stat.name].real_value = skill_stats[stat.name].value
		base_stats[stat.name].real_min_value = base_stats[stat.name].min_value
		mods_stats[stat.name].real_min_value = mods_stats[stat.name].min_value
		skill_stats[stat.name].real_min_value = skill_stats[stat.name].min_value
		base_stats[stat.name].real_max_value = base_stats[stat.name].max_value
		mods_stats[stat.name].real_max_value = mods_stats[stat.name].max_value
		skill_stats[stat.name].real_max_value = skill_stats[stat.name].max_value
	end
	for i,data in ipairs(multiple_of) do
		local multiplier = data[1]
		local stat = data[2]
		base_stats[multiplier].min_value = base_stats[stat].real_min_value * base_stats[multiplier].real_min_value
		base_stats[multiplier].max_value = base_stats[stat].real_max_value * base_stats[multiplier].real_max_value
		base_stats[multiplier].value = (base_stats[multiplier].min_value + base_stats[multiplier].max_value) / 2
	end
	for i,stat in ipairs(self._stats_shown) do
		if not stat.index then
			if skill_stats[stat.name].value and base_stats[stat.name].value then
				skill_stats[stat.name].value = base_stats[stat.name].value * skill_stats[stat.name].value
				base_stats[stat.name].value = base_stats[stat.name].value
			end
			if skill_stats[stat.name].min_value and base_stats[stat.name].min_value then
				skill_stats[stat.name].min_value = base_stats[stat.name].min_value * skill_stats[stat.name].min_value
				base_stats[stat.name].min_value = base_stats[stat.name].min_value
			end
		if skill_stats[stat.name].max_value then
			end
		if base_stats[stat.name].max_value then
			end
			skill_stats[stat.name].max_value = base_stats[stat.name].max_value * skill_stats[stat.name].max_value
			base_stats[stat.name].max_value = base_stats[stat.name].max_value
		end
	end
	return base_stats, mods_stats, skill_stats
end

PlayerInventoryGui._get_armor_stats = function(self, name)
	local base_stats = {}
	local mods_stats = {}
	local skill_stats = {}
	local detection_risk = managers.blackmarket:get_suspicion_offset_from_custom_data({armors = name}, tweak_data.player.SUSPICION_OFFSET_LERP or 0.75)
	detection_risk = math.round(detection_risk * 100)
	local bm_armor_tweak = tweak_data.blackmarket.armors[name]
	local upgrade_level = bm_armor_tweak.upgrade_level
	for i,stat in ipairs(self._stats_shown) do
		base_stats[stat.name] = {value = 0}
		mods_stats[stat.name] = {value = 0}
		skill_stats[stat.name] = {value = 0}
		if stat.name == "armor" then
			local base = tweak_data.player.damage.ARMOR_INIT
			local mod = managers.player:body_armor_value("armor", upgrade_level)
			base_stats[stat.name] = {value = (base + mod) * tweak_data.gui.stats_present_multiplier}
			skill_stats[stat.name] = {value = (base_stats[stat.name].value + managers.player:body_armor_skill_addend(name) * tweak_data.gui.stats_present_multiplier) * managers.player:body_armor_skill_multiplier(name) - base_stats[stat.name].value}
		elseif stat.name == "health" then
			local base = tweak_data.player.damage.HEALTH_INIT
			local mod = managers.player:thick_skin_value()
			base_stats[stat.name] = {value = (base + mod) * tweak_data.gui.stats_present_multiplier}
			skill_stats[stat.name] = {value = base_stats[stat.name].value * managers.player:health_skill_multiplier() - base_stats[stat.name].value}
		elseif stat.name == "concealment" then
			base_stats[stat.name] = {value = managers.player:body_armor_value("concealment", upgrade_level)}
			skill_stats[stat.name] = {value = managers.blackmarket:concealment_modifier("armors")}
		elseif stat.name == "movement" then
			local base = tweak_data.player.movement_state.standard.movement.speed.STANDARD_MAX / 100 * tweak_data.gui.stats_present_multiplier
			local movement_penalty = managers.player:body_armor_value("movement", upgrade_level)
			local base_value = movement_penalty * base
			base_stats[stat.name] = {value = base_value}
			local skill_mod = managers.player:movement_speed_multiplier(false, false, upgrade_level, 1)
			local skill_value = skill_mod * base - base_value
			skill_stats[stat.name] = {value = skill_value}
			skill_stats[stat.name].skill_in_effect = skill_value > 0
		elseif stat.name == "dodge" then
			local base = 0
			local mod = managers.player:body_armor_value("dodge", upgrade_level)
			base_stats[stat.name] = {value = (base + mod) * 100}
			skill_stats[stat.name] = {value = managers.player:skill_dodge_chance(false, false, false, name, detection_risk) * 100}
		elseif stat.name == "damage_shake" then
			local base = tweak_data.gui.armor_damage_shake_base
			local mod = math.max(managers.player:body_armor_value("damage_shake", upgrade_level, nil, 1), 0.01)
			local skill = math.max(managers.player:upgrade_value("player", "damage_shake_multiplier", 1), 0.01)
			local base_value = base
			local mod_value = base / mod - base_value
			local skill_value = base / mod / skill - base_value - mod_value + managers.player:upgrade_value("player", "damage_shake_addend", 0)
			base_stats[stat.name] = {value = (base_value + mod_value) * tweak_data.gui.stats_present_multiplier}
			skill_stats[stat.name] = {value = skill_value * tweak_data.gui.stats_present_multiplier}
		elseif stat.name == "stamina" then
			local stamina_data = tweak_data.player.movement_state.stamina
			local base = stamina_data.STAMINA_INIT
			local mod = managers.player:body_armor_value("stamina", upgrade_level)
			local skill = managers.player:stamina_multiplier()
			local base_value = base
			local mod_value = base * mod - base_value
			local skill_value = base * mod * skill - base_value - mod_value
			base_stats[stat.name] = {value = base_value + mod_value}
			skill_stats[stat.name] = {value = skill_value}
		end
		skill_stats[stat.name].skill_in_effect = skill_stats[stat.name].skill_in_effect or skill_stats[stat.name].value ~= 0
	end
	return base_stats, mods_stats, skill_stats
end


