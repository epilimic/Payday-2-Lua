require("lib/managers/menu/WalletGuiObject")
local make_fine_text = function(text)
	local x, y, w, h = text:text_rect()
	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end
MissionBriefingTabItem = MissionBriefingTabItem or class()
function MissionBriefingTabItem:init(panel, text, i)
	self._main_panel = panel
	self._panel = self._main_panel:panel({})
	self._index = i
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(i - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() + 5 or 0
	self._tab_string = text
	self._tab_string_prefix = ""
	self._tab_string_suffix = ""
	local tab_string = self._tab_string_prefix .. self._tab_string .. self._tab_string_suffix
	self._tab_text = self._main_panel:text({
		name = "tab_text_" .. tostring(self._index),
		text = tab_string,
		h = 32,
		x = offset,
		align = "center",
		vertical = "center",
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.pd2_medium_font,
		color = tweak_data.screen_colors.button_stage_3,
		layer = 1,
		blend_mode = "add"
	})
	local _, _, tw, th = self._tab_text:text_rect()
	self._tab_text:set_size(tw + 15, th + 10)
	self._tab_select_rect = self._main_panel:bitmap({
		name = "tab_select_rect_" .. tostring(self._index),
		texture = "guis/textures/pd2/shared_tab_box",
		layer = 0,
		color = tweak_data.screen_colors.text,
		visible = false
	})
	self._tab_select_rect:set_shape(self._tab_text:shape())
	self._panel:set_top(self._tab_text:bottom() - 3)
	self._panel:grow(0, -(self._panel:top() + 70 + tweak_data.menu.pd2_small_font_size * 4 + 25))
	self._selected = true
	self:deselect()
end
function MissionBriefingTabItem:reduce_to_small_font()
	self._tab_text:set_font(tweak_data.menu.pd2_small_font_id)
	self._tab_text:set_font_size(tweak_data.menu.pd2_small_font_size)
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(self._index - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() or 0
	local x, y, w, h = self._tab_text:text_rect()
	self._tab_text:set_size(w + 15, h + 10)
	self._tab_text:set_x(offset + 5)
	self._tab_select_rect:set_shape(self._tab_text:shape())
	self._panel:set_top(self._tab_text:bottom() - 3)
	self._panel:set_h(self._main_panel:h())
	self._panel:grow(0, -(self._panel:top() + 70 + tweak_data.menu.pd2_small_font_size * 4 + 25))
end
function MissionBriefingTabItem:update_tab_position()
	local prev_item_title_text = self._main_panel:child("tab_text_" .. tostring(self._index - 1))
	local offset = prev_item_title_text and prev_item_title_text:right() or 0
	self._tab_text:set_x(offset + 5)
	self._tab_select_rect:set_shape(self._tab_text:shape())
end
function MissionBriefingTabItem:set_tab_text(text)
	self._tab_string = text
	self:_set_tab_text()
end
function MissionBriefingTabItem:set_tab_prefix(text)
	self._tab_string_prefix = text
	self:_set_tab_text()
end
function MissionBriefingTabItem:set_tab_suffix(text)
	self._tab_string_suffix = text
	self:_set_tab_text()
end
function MissionBriefingTabItem:_set_tab_text()
	local tab_string = self._tab_string_prefix .. self._tab_string .. self._tab_string_suffix
	self._tab_text:set_text(tab_string)
	local _, _, tw, th = self._tab_text:text_rect()
	self._tab_text:set_size(tw + 15, th + 10)
	self._tab_select_rect:set_shape(self._tab_text:shape())
	managers.menu_component:update_mission_briefing_tab_positions()
end
function MissionBriefingTabItem:show()
	self._panel:show()
end
function MissionBriefingTabItem:hide()
	self._panel:hide()
end
function MissionBriefingTabItem:panel()
	return self._panel
end
function MissionBriefingTabItem:index()
	return self._index
end
function MissionBriefingTabItem:select(no_sound)
	if self._selected then
		return
	end
	self:show()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_colors.button_stage_1)
		self._tab_text:set_blend_mode("normal")
		self._tab_select_rect:show()
	end
	self._selected = true
	if no_sound then
		return
	end
	managers.menu_component:post_event("menu_enter")
end
function MissionBriefingTabItem:deselect()
	if not self._selected then
		return
	end
	self:hide()
	if self._tab_text and alive(self._tab_text) then
		self._tab_text:set_color(tweak_data.screen_colors.button_stage_3)
		self._tab_text:set_blend_mode("add")
		self._tab_select_rect:hide()
	end
	self._selected = false
end
function MissionBriefingTabItem:mouse_moved(x, y)
	if not self._selected then
		if self._tab_text:inside(x, y) then
			if not self._highlighted then
				self._highlighted = true
				self._tab_text:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
			end
		elseif self._highlighted then
			self._tab_text:set_color(tweak_data.screen_colors.button_stage_3)
			self._highlighted = false
		end
	end
	return self._selected, self._highlighted
end
function MissionBriefingTabItem:mouse_pressed(button, x, y)
	if button ~= Idstring("0") then
		return false
	end
	if not self._selected and self._tab_text:inside(x, y) then
		return true
	end
	return self._selected
end
function MissionBriefingTabItem:move_left()
end
function MissionBriefingTabItem:move_right()
end
function MissionBriefingTabItem:move_up()
end
function MissionBriefingTabItem:move_down()
end
function MissionBriefingTabItem:update(t, dt)
end
function MissionBriefingTabItem:confirm_pressed()
end
function MissionBriefingTabItem:something_selected()
	return false
end
function MissionBriefingTabItem:destroy()
	self._main_panel:remove(self._panel)
	self._main_panel:remove(self._tab_text)
	self._main_panel:remove(self._tab_select_rect)
	self._panel = nil
	self._tab_text = nil
	self._tab_select_rect = nil
end
function MissionBriefingTabItem.animate_select(o, center_helper, instant)
	o:set_layer(2)
	local size = o:h()
	if size == 85 then
		return
	end
	managers.menu_component:post_event("highlight")
	local center_x, center_y = o:center()
	if alive(center_helper) then
		local center_x, center_y = center_helper:center()
	end
	local aspect = o:texture_width() / math.max(1, o:texture_height())
	if instant then
		local s = math.lerp(size, 85, 1)
		o:set_size(s * aspect, s)
		o:set_center(center_x, center_y)
		return
	end
	over(math.abs(85 - size) / 100, function(p)
		local s = math.lerp(size, 85, p)
		if alive(center_helper) then
			center_x, center_y = center_helper:center()
		end
		o:set_size(s * aspect, s)
		o:set_center(center_x, center_y)
	end)
end
function MissionBriefingTabItem.animate_deselect(o, center_helper)
	o:set_layer(1)
	local size = o:h()
	if size == 65 then
		return
	end
	local center_x, center_y = o:center()
	if alive(center_helper) then
		local center_x, center_y = center_helper:center()
	end
	local aspect = o:texture_width() / math.max(1, o:texture_height())
	over(math.abs(65 - size) / 100, function(p)
		local s = math.lerp(size, 65, p)
		if alive(center_helper) then
			center_x, center_y = center_helper:center()
		end
		o:set_size(s * aspect, s)
		o:set_center(center_x, center_y)
	end)
end
DescriptionItem = DescriptionItem or class(MissionBriefingTabItem)
function DescriptionItem:init(panel, text, i, saved_descriptions)
	DescriptionItem.super.init(self, panel, text, i)
	if not managers.job:has_active_job() then
		return
	end
	local stage_data = managers.job:current_stage_data()
	local level_data = managers.job:current_level_data()
	local name_id = stage_data.name_id or level_data.name_id
	local briefing_id = managers.job:current_briefing_id()
	local title_text = self._panel:text({
		name = "title_text",
		text = managers.localization:to_upper_text(name_id),
		font_size = tweak_data.menu.pd2_medium_font_size,
		font = tweak_data.menu.pd2_medium_font,
		y = 10,
		x = 10,
		color = tweak_data.screen_colors.text
	})
	local x, y, w, h = title_text:text_rect()
	title_text:set_size(w, h)
	title_text:set_position(math.round(title_text:x()), math.round(title_text:y()))
	local pro_text
	if managers.job:is_current_job_professional() then
		pro_text = self._panel:text({
			name = "pro_text",
			text = managers.localization:to_upper_text("cn_menu_pro_job"),
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			color = tweak_data.screen_colors.pro_color,
			blend_mode = "add"
		})
		local x, y, w, h = pro_text:text_rect()
		pro_text:set_size(w, h)
		pro_text:set_position(title_text:right() + 10, title_text:y())
	end
	self._scroll_panel = self._panel:panel({
		x = 10,
		y = title_text:bottom()
	})
	self._scroll_panel:grow(-self._scroll_panel:x() - 10, -self._scroll_panel:y())
	local desc_string = managers.localization:text(briefing_id)
	local is_level_ghostable = managers.job:is_level_ghostable(managers.job:current_level_id()) and managers.groupai and managers.groupai:state():whisper_mode()
	if is_level_ghostable and Network:is_server() then
		desc_string = desc_string .. [[


]] .. managers.localization:text("menu_ghostable_stage")
	end
	local desc_text = self._scroll_panel:text({
		name = "description_text",
		text = desc_string,
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		wrap = true,
		word_wrap = true,
		color = tweak_data.screen_colors.text
	})
	if saved_descriptions then
		local text = ""
		for i, text_id in ipairs(saved_descriptions) do
			text = text .. managers.localization:text(text_id) .. "\n"
		end
		desc_text:set_text(text)
	end
	self:_chk_add_scrolling()
end
function DescriptionItem:reduce_to_small_font()
	DescriptionItem.super.reduce_to_small_font(self)
	if not alive(self._scroll_panel) then
		return
	end
	local desc_text = self._scroll_panel:child("description_text")
	local title_text = self._panel:child("title_text")
	self._scroll_panel:set_h(self._panel:h())
	self._scroll_panel:set_y(title_text:bottom())
	self._scroll_panel:grow(0, -self._scroll_panel:y())
	local show_scroll_line_top = 0 > desc_text:top()
	local show_scroll_line_bottom = desc_text:bottom() > self._scroll_panel:h()
	if self._scroll_box then
		self._scroll_box:create_sides(self._scroll_panel, {
			sides = {
				0,
				0,
				show_scroll_line_top and 2 or 0,
				show_scroll_line_bottom and 2 or 0
			}
		})
	end
end
function DescriptionItem:_chk_add_scrolling()
	local desc_text = self._scroll_panel:child("description_text")
	local _, _, _, h = desc_text:text_rect()
	desc_text:set_h(h)
	if desc_text:h() > self._scroll_panel:h() and not self._scrolling then
		self._scrolling = true
		self._scroll_box = BoxGuiObject:new(self._scroll_panel, {
			sides = {
				0,
				0,
				0,
				0
			}
		})
		self._show_scroll_line_top = false
		self._show_scroll_line_bottom = false
		local show_scroll_line_top = 0 > desc_text:top()
		local show_scroll_line_bottom = desc_text:bottom() > self._scroll_panel:h()
		if show_scroll_line_top ~= self._show_scroll_line_top or show_scroll_line_bottom ~= self._show_scroll_line_bottom then
			self._scroll_box:create_sides(self._scroll_panel, {
				sides = {
					0,
					0,
					show_scroll_line_top and 2 or 0,
					show_scroll_line_bottom and 2 or 0
				}
			})
			self._show_scroll_line_top = show_scroll_line_top
			self._show_scroll_line_bottom = show_scroll_line_bottom
		end
		if not managers.menu:is_pc_controller() then
			local legends = {
				"menu_legend_preview_move"
			}
			local t_text = ""
			for i, string_id in ipairs(legends) do
				local spacing = i > 1 and "  |  " or ""
				t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(string_id, {
					BTN_UPDATE = managers.localization:btn_macro("menu_update"),
					BTN_BACK = managers.localization:btn_macro("back")
				}))
			end
			local legend_text = self._panel:text({
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				text = t_text,
				halign = "right",
				valign = "top"
			})
			local _, _, lw, lh = legend_text:text_rect()
			legend_text:set_size(lw, lh)
			legend_text:set_righttop(self._panel:w() - 5, 5)
		end
	elseif self._scrolling then
	end
end
function DescriptionItem:on_whisper_mode_changed()
	local briefing_id = managers.job:current_briefing_id()
	if briefing_id then
		local desc_string = managers.localization:text(briefing_id)
		local is_level_ghostable = managers.job:is_level_ghostable(managers.job:current_level_id()) and managers.groupai and managers.groupai:state():whisper_mode()
		if is_level_ghostable then
			desc_string = desc_string .. [[


]] .. managers.localization:text("menu_ghostable_stage")
		end
		self:set_description_text(desc_string)
	end
end
function DescriptionItem:set_title_text(text)
	self._panel:child("title_text"):set_text(text)
end
function DescriptionItem:add_description_text(text)
	self._scroll_panel:child("description_text"):set_text(self._scroll_panel:child("description_text"):text() .. "\n" .. text)
	self:_chk_add_scrolling()
end
function DescriptionItem:set_description_text(text)
	self._scroll_panel:child("description_text"):set_text(text)
	self:_chk_add_scrolling()
end
function DescriptionItem:move_up()
	if not managers.job:has_active_job() or not self._scrolling then
		return
	end
	local desc_text = self._scroll_panel:child("description_text")
	if desc_text:top() < 0 then
		self._scroll_speed = 2
	end
end
function DescriptionItem:move_down()
	if not managers.job:has_active_job() or not self._scrolling then
		return
	end
	local desc_text = self._scroll_panel:child("description_text")
	if desc_text:bottom() > self._scroll_panel:h() then
		self._scroll_speed = -2
	end
end
function DescriptionItem:update(t, dt)
	if not managers.job:has_active_job() or not self._scrolling then
		return
	end
	local desc_text = self._scroll_panel:child("description_text")
	if desc_text:h() > self._scroll_panel:h() and self._scroll_speed then
		self._scroll_speed = math.step(self._scroll_speed, 0, dt * 4)
		desc_text:move(0, math.clamp(self._scroll_speed, -1, 1) * 100 * dt)
		if 0 < desc_text:top() then
			desc_text:set_top(0)
			self._scroll_speed = nil
		elseif desc_text:bottom() < self._scroll_panel:h() then
			desc_text:set_bottom(self._scroll_panel:h())
			self._scroll_speed = nil
		end
		if self._scroll_speed == 0 then
			self._scroll_speed = nil
		end
		local show_scroll_line_top = 0 > desc_text:top()
		local show_scroll_line_bottom = desc_text:bottom() > self._scroll_panel:h()
		if show_scroll_line_top ~= self._show_scroll_line_top or show_scroll_line_bottom ~= self._show_scroll_line_bottom then
			self._scroll_box:create_sides(self._scroll_panel, {
				sides = {
					0,
					0,
					show_scroll_line_top and 2 or 0,
					show_scroll_line_bottom and 2 or 0
				}
			})
			self._show_scroll_line_top = show_scroll_line_top
			self._show_scroll_line_bottom = show_scroll_line_bottom
		end
	end
end
function DescriptionItem:select(no_sound)
	DescriptionItem.super.select(self, no_sound)
end
function DescriptionItem:deselect()
	DescriptionItem.super.deselect(self)
end
function DescriptionItem:mouse_moved(x, y)
	return DescriptionItem.super.mouse_moved(self, x, y)
end
function DescriptionItem:mouse_pressed(button, x, y)
	local inside = DescriptionItem.super.mouse_pressed(self, button, x, y)
	if inside == false then
		return false
	end
	return inside
end
AssetsItem = AssetsItem or class(MissionBriefingTabItem)
function AssetsItem:init(panel, text, i, assets_names, max_assets, menu_component_data)
	AssetsItem.super.init(self, panel, text, i)
	self._num_items = managers.preplanning:has_current_level_preplanning() and 4 or 8
	self._panel:set_w(self._main_panel:w() * (self._num_items / 8))
	self._panel:set_right(self._main_panel:w())
	self._my_menu_component_data = menu_component_data
	self:create_assets(assets_names, max_assets)
	if #assets_names == 0 then
		self._loading_text = self._panel:text({
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:to_upper_text("debug_loading_level"),
			rotation = 360
		})
	end
end
function AssetsItem:post_init()
	self:select_asset(self._my_menu_component_data.selected or 1, true)
	for i = 1, #self._assets_names do
		self._panel:child("asset_" .. tostring(i)):set_rotation(0)
	end
end
function AssetsItem:select(no_sound)
	AssetsItem.super.select(self, no_sound)
end
function AssetsItem:deselect()
	AssetsItem.super.deselect(self)
end
function AssetsItem:get_asset_id(i)
	return self._assets_names[i][4]
end
function AssetsItem:get_requested_textures()
	return self._requested_textures
end
function AssetsItem:add_preplanning_button()
	local preplanning_panel = self._panel:panel({
		name = "preplanning"
	})
	preplanning_panel:set_right(0)
	preplanning_panel:grow(-20, -20)
	preplanning_panel:move(10, 10)
	if preplanning_panel:w() > preplanning_panel:h() then
		preplanning_panel:grow(preplanning_panel:h() - preplanning_panel:w(), 0)
	end
	local loading_text = preplanning_panel:text({
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		name = "loading",
		text = managers.localization:to_upper_text("menu_pp_loading"),
		wrap = true,
		word_wrap = true,
		rotation = 360
	})
	self._requested_textures = {}
	self._cached_textures = {}
	self._ready_to_chk_preplanning_done = false
	self._preplanning_ready = false
	local index, texture_ids, key
	local texture_done_clbk = callback(self, self, "preplanning_texture_done_clbk")
	local function request_texture_func(texture)
		texture_ids = Idstring(texture)
		key = texture_ids:key()
		self._requested_textures[key] = true
		index = managers.menu_component:request_texture(texture, texture_done_clbk)
		self._requested_textures[key] = {texture = texture, index = index}
	end
	for _, data in ipairs(managers.preplanning:current_location_data()) do
		if data.texture then
			request_texture_func(data.texture)
		end
	end
	local custom_icons_path = tweak_data.preplanning.gui.custom_icons_path
	local type_icons_path = tweak_data.preplanning.gui.type_icons_path
	local category_icons_path = tweak_data.preplanning.gui.category_icons_path
	if type_icons_path then
		request_texture_func(type_icons_path)
	end
	if category_icons_path then
		request_texture_func(category_icons_path)
	end
	self._ready_to_chk_preplanning_done = true
	self:chk_preplanning_textures_done()
end
function AssetsItem:preplanning_texture_done_clbk(texture_idstring)
	local key = texture_idstring:key()
	if self._requested_textures[key] then
		self._cached_textures[key] = true
		print("[AssetsItem:preplanning_texture_done_clbk] Texture cached", key)
		if self._ready_to_chk_preplanning_done then
			self:chk_preplanning_textures_done()
		end
	end
end
function AssetsItem:chk_preplanning_textures_done()
	self._preplanning_ready = true
	for key, data in pairs(self._requested_textures) do
		if not self._cached_textures[key] then
			self._preplanning_ready = false
			return
		end
	end
	local preplanning_panel = self._preplanning_ready and alive(self._panel) and self._panel:child("preplanning")
	if alive(preplanning_panel) then
		preplanning_panel:clear()
		local text = preplanning_panel:text({
			name = "text",
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = managers.localization:to_upper_text("menu_preplanning_enter"),
			wrap = true,
			word_wrap = true,
			layer = 1,
			rotation = 360
		})
		make_fine_text(text)
		text:set_center(preplanning_panel:w() / 2, preplanning_panel:h() / 2)
		text:set_visible(managers.menu:is_pc_controller())
		local level_id = managers.job:current_level_id()
		local button = preplanning_panel:bitmap({
			name = "button",
			texture = tweak_data.preplanning.locations[level_id].mission_briefing_texture,
			alpha = 0.8,
			rotation = 360,
			blend_mode = "add",
			w = preplanning_panel:w(),
			h = preplanning_panel:h()
		})
	end
end
function AssetsItem:create_assets(assets_names, max_assets)
	self._panel:clear()
	self._loading_text = nil
	self._asset_locked = {}
	self._assets_list = {}
	self._assets_names = assets_names
	self._unlock_cost = assets_names[3] or false
	local center_y = math.round(self._panel:h() / 2) - tweak_data.menu.pd2_small_font_size
	self._asset_text_panel = self._panel:panel({name = "asset_text", layer = 4})
	local first_rect, rect
	local w = self._panel:w() / (self._num_items / 2)
	local step = w * 0.5
	for i = 1, #assets_names do
		local center_x = i * w - w * 0.5
		rect = self._panel:rect({
			name = "bg_rect_" .. tostring(i),
			w = 85,
			h = 85
		})
		rect:hide()
		first_rect = first_rect or rect
		local center_x = math.ceil(i / 2) * w - step
		local center_y = self._panel:h() * (i % 2 > 0 and 0.295 or 0.815)
		local texture = assets_names[i][1]
		local asset
		if texture and DB:has(Idstring("texture"), texture) then
			asset = self._panel:bitmap({
				name = "asset_" .. tostring(i),
				texture = texture,
				w = 65,
				h = 65,
				rotation = math.random(2) - 1.5,
				layer = 1,
				valign = "top"
			})
		else
			asset = self._panel:bitmap({
				name = "asset_" .. tostring(i),
				texture = "guis/textures/pd2/endscreen/what_is_this",
				rotation = math.random(2) - 1.5,
				alpha = 0,
				w = 65,
				h = 65,
				layer = 1,
				valign = "top"
			})
		end
		local aspect = asset:texture_width() / math.max(1, asset:texture_height())
		asset:set_w(asset:h() * aspect)
		rect:set_w(rect:h() * aspect)
		rect:set_center(center_x, center_y)
		rect:set_position(math.round(rect:x()), math.round(rect:y()))
		asset:set_center(rect:center())
		asset:set_position(math.round(asset:x()), math.round(asset:y()))
		asset:set_rotation(0.5)
		if not assets_names[i][3] then
			local lock = self._panel:bitmap({
				name = "asset_lock_" .. tostring(i),
				texture = assets_names[i][5] and "guis/textures/pd2/blackmarket/money_lock" or "guis/textures/pd2/skilltree/padlock",
				color = tweak_data.screen_colors.item_stage_1,
				layer = 3
			})
			lock:set_center(rect:center())
			asset:set_color(Color.black:with_alpha(0.6))
			self._asset_locked[i] = true
		end
		table.insert(self._assets_list, asset)
	end
	self._text_strings_localized = false
	self._my_asset_space = w
	self._my_left_i = self._my_menu_component_data.my_left_i or 1
	if 1 < math.ceil(#self._assets_list / self._num_items) then
		self._move_left_rect = self._panel:bitmap({
			texture = "guis/textures/pd2/hud_arrow",
			color = tweak_data.screen_colors.button_stage_3,
			rotation = 360,
			w = 32,
			h = 32,
			blend_mode = "add",
			layer = 3
		})
		self._move_left_rect:set_center(0, self._panel:h() / 2)
		self._move_left_rect:set_position(math.round(self._move_left_rect:x()), math.round(self._move_left_rect:y()))
		self._move_left_rect:set_visible(false)
		self._move_right_rect = self._panel:bitmap({
			texture = "guis/textures/pd2/hud_arrow",
			color = tweak_data.screen_colors.button_stage_3,
			rotation = 180,
			w = 32,
			h = 32,
			blend_mode = "add",
			layer = 3
		})
		self._move_right_rect:set_center(self._panel:w(), self._panel:h() / 2)
		self._move_right_rect:set_position(math.round(self._move_right_rect:x()), math.round(self._move_right_rect:y()))
		self._move_right_rect:set_visible(false)
	end
	if not managers.menu:is_pc_controller() then
		local legends = {
			"menu_legend_preview_move",
			"menu_legend_select"
		}
		if managers.preplanning:has_current_level_preplanning() then
			table.insert(legends, 1, "menu_legend_open_preplanning")
		end
		local t_text = ""
		for i, string_id in ipairs(legends) do
			local spacing = i > 1 and "  |  " or ""
			t_text = t_text .. spacing .. utf8.to_upper(managers.localization:text(string_id, {
				BTN_UPDATE = managers.localization:btn_macro("menu_update"),
				BTN_BACK = managers.localization:btn_macro("back")
			}))
		end
		local legend_text = self._panel:text({
			rotation = 360,
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			text = t_text
		})
		local _, _, lw, lh = legend_text:text_rect()
		legend_text:set_size(lw, lh)
		legend_text:set_righttop(self._panel:w() - 5, 5)
	end
	local first_rect = self._panel:child("bg_rect_1")
	if first_rect then
		self._select_box_panel = self._panel:panel({layer = -3, visible = false})
		self._select_box_panel:set_shape(first_rect:shape())
		self._select_box = BoxGuiObject:new(self._select_box_panel, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
	end
	self:post_init()
end
function AssetsItem:unlock_asset_by_id(id)
	for i, asset_data in ipairs(self._assets_names) do
		if Idstring(asset_data[4]) == Idstring(id) then
			self._asset_locked[i] = false
			self._assets_list[i]:set_color(Color.white)
			local lock = self._panel:child("asset_lock_" .. tostring(i))
			if lock then
				self._panel:remove(lock)
			end
		end
	end
	self:select_asset(self._asset_selected, true)
end
function AssetsItem:move_assets_left()
	self._my_left_i = math.max(self._my_left_i - 1, 1)
	self:update_asset_positions_and_text()
	managers.menu_component:post_event("menu_enter")
end
function AssetsItem:move_assets_right()
	self._my_left_i = math.min(self._my_left_i + 1, math.ceil(#self._assets_list / self._num_items))
	self:update_asset_positions_and_text()
	managers.menu_component:post_event("menu_enter")
end
function AssetsItem:update_asset_positions_and_text()
	self:update_asset_positions()
	local bg = self._panel:child("bg_rect_" .. tostring(self._asset_selected))
	if alive(bg) then
		self._asset_text_panel:set_center_x(bg:center_x())
		self._asset_text_panel:set_position(math.round(self._asset_text_panel:x()), math.round(self._asset_text_panel:y()))
		for i, asset_text in ipairs(self._asset_text_panel:children()) do
			if asset_text:world_left() < 10 then
				asset_text:set_world_left(10)
				asset_text:set_align("left")
			elseif asset_text:world_right() > self._panel:w() - 10 then
				asset_text:set_world_right(self._panel:w() - 10)
				asset_text:set_align("right")
			else
				asset_text:set_align("center")
			end
		end
	end
end
function AssetsItem:update_asset_positions()
	self._my_menu_component_data.my_left_i = self._my_left_i
	local w = self._my_asset_space
	for i, asset in pairs(self._assets_list) do
		local cx = (math.ceil(i / 2) - (self._my_left_i - 1) * (self._num_items / 2)) * w - w / 2
		local lock = self._panel:child("asset_lock_" .. tostring(i))
		if alive(lock) then
			lock:set_center_x(cx)
		end
		self._panel:child("bg_rect_" .. tostring(i)):set_center_x(cx)
		self._panel:child("bg_rect_" .. tostring(i)):set_left(math.round(self._panel:child("bg_rect_" .. tostring(i)):left()))
		asset:set_center_x(cx)
		asset:set_left(math.round(asset:left()))
	end
	self._move_left_rect:set_visible(self._my_left_i > 1)
	self._move_right_rect:set_visible(self._my_left_i < math.ceil(#self._assets_list / self._num_items))
	if 1 < math.ceil(#self._assets_list / self._num_items) then
		self:set_tab_suffix(" (" .. tostring(self._my_left_i) .. "/" .. tostring(math.ceil(#self._assets_list / self._num_items)) .. ")")
	end
end
function AssetsItem:select_asset(i, instant)
	if #self._assets_list > self._num_items then
		if i then
			local page = math.ceil(i / self._num_items)
			self._my_left_i = page
		end
		self:update_asset_positions()
	end
	if not i then
		return
	end
	local bg = self._panel:child("bg_rect_" .. tostring(i))
	if not self._assets_names[i] then
		return
	end
	local text_string = self._assets_names[i][2]
	local extra_string, extra_color
	if not self._text_strings_localized then
		text_string = managers.localization:text(text_string)
	end
	text_string = text_string .. "\n"
	if self._asset_selected == i and not instant then
		return
	end
	local is_init = self._asset_selected == nil
	self:check_deselect_item()
	self._asset_selected = i
	self._my_menu_component_data.selected = self._asset_selected
	local rect = self._panel:child("bg_rect_" .. tostring(i))
	if rect then
		self._select_box_panel:set_shape(rect:shape())
		self._select_box:create_sides(self._select_box_panel, {
			sides = {
				2,
				2,
				2,
				2
			}
		})
	end
	if self._asset_locked[i] then
		local can_client_unlock = managers.assets.ALLOW_CLIENTS_UNLOCK == true or type(managers.assets.ALLOW_CLIENTS_UNLOCK) == "string" and managers.player:has_team_category_upgrade("player", managers.assets.ALLOW_CLIENTS_UNLOCK)
		local is_server = Network:is_server() or can_client_unlock
		local can_unlock = self._assets_names[i][5]
		if not self._assets_names[i][6] or not text_string then
			text_string = managers.localization:text("bm_menu_mystery_asset")
		end
		if is_server and can_unlock then
			extra_string = managers.localization:text("st_menu_cost") .. " " .. managers.experience:cash_string(managers.money:get_mission_asset_cost_by_id(self._assets_names[i][4]))
			if not managers.money:can_afford_mission_asset(self._assets_names[i][4]) then
				extra_string = extra_string .. "\n" .. managers.localization:text("bm_menu_not_enough_cash")
				extra_color = tweak_data.screen_colors.important_1
			end
		else
			if is_server or not "menu_briefing_asset_server_locked" then
			end
			extra_string = managers.localization:text((managers.assets:get_asset_unlock_text_by_id(self._assets_names[i][4])))
		end
		extra_color = extra_color or can_unlock and tweak_data.screen_colors.text or tweak_data.screen_colors.important_1
	end
	extra_color = extra_color or tweak_data.screen_colors.text
	self._asset_text_panel:clear()
	if text_string then
		local text = self._asset_text_panel:text({
			name = "text_string",
			text = text_string,
			align = "center",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = tweak_data.screen_colors.text
		})
		make_fine_text(text)
		text:set_top(0)
		text:set_center_x(self._asset_text_panel:w() / 2)
	end
	if extra_string then
		local last_child = self._asset_text_panel:children()[self._asset_text_panel:num_children()]
		local text = self._asset_text_panel:text({
			name = "extra_string",
			text = extra_string,
			align = "center",
			font_size = tweak_data.menu.pd2_small_font_size,
			font = tweak_data.menu.pd2_small_font,
			color = extra_color
		})
		make_fine_text(text)
		if last_child then
			text:set_top(last_child:bottom())
		end
		text:set_center_x(self._asset_text_panel:w() / 2)
	end
	self._assets_list[i]:stop()
	self._assets_list[i]:animate(self.animate_select, self._panel:child("bg_rect_" .. tostring(i)), instant)
	if alive(bg) then
		self._asset_text_panel:set_h(self._asset_text_panel:children()[self._asset_text_panel:num_children()]:bottom())
		self._asset_text_panel:set_center_x(bg:center_x())
		self._asset_text_panel:set_position(math.round(self._asset_text_panel:x()), math.round(self._asset_text_panel:y()))
		local a_left = self._asset_text_panel:left()
		local a_right = self._asset_text_panel:right()
		for i, asset_text in ipairs(self._asset_text_panel:children()) do
			asset_text:set_position(math.round(asset_text:x()), math.round(asset_text:y()))
			if a_left + asset_text:left() < 12 then
				asset_text:set_left(12 - a_left)
			elseif a_left + asset_text:right() > self._panel:w() - 12 then
				asset_text:set_right(self._panel:w() - 12 - a_left)
			end
		end
	end
	if rect then
		if i % 2 > 0 then
			self._asset_text_panel:set_top(rect:bottom())
		else
			self._asset_text_panel:set_bottom(rect:top())
		end
	end
end
function AssetsItem:check_deselect_item()
	if self._asset_selected and self._assets_list[self._asset_selected] then
		self._assets_list[self._asset_selected]:stop()
		self._assets_list[self._asset_selected]:animate(self.animate_deselect, self._panel:child("bg_rect_" .. tostring(self._asset_selected)))
		self._asset_text_panel:clear()
	end
	self._asset_selected = nil
end
function AssetsItem:mouse_moved(x, y)
	if alive(self._move_left_rect) and alive(self._move_right_rect) then
		if self._move_left_rect:visible() and self._move_left_rect:inside(x, y) then
			if not self._move_left_highlighted then
				self._move_left_highlighted = true
				self._move_left_rect:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
				self:check_deselect_item()
			end
			self._asset_text_panel:clear()
			return false, true
		elseif self._move_left_highlighted then
			self._move_left_rect:set_color(tweak_data.screen_colors.button_stage_3)
			self._move_left_highlighted = false
		end
		if self._move_right_rect:visible() and self._move_right_rect:inside(x, y) then
			if not self._move_right_highlighted then
				self._move_right_highlighted = true
				self._move_right_rect:set_color(tweak_data.screen_colors.button_stage_2)
				managers.menu_component:post_event("highlight")
				self:check_deselect_item()
			end
			self._asset_text_panel:clear()
			return false, true
		elseif self._move_right_highlighted then
			self._move_right_rect:set_color(tweak_data.screen_colors.button_stage_3)
			self._move_right_highlighted = false
		end
	end
	local preplanning = self._preplanning_ready and self._panel:child("preplanning")
	if alive(preplanning) and preplanning:tree_visible() then
		if preplanning:inside(x, y) then
			if not self._preplanning_highlight then
				self._preplanning_highlight = true
				preplanning:child("button"):set_alpha(1)
				managers.menu_component:post_event("highlight")
			end
			self:check_deselect_item()
			return false, true
		elseif self._preplanning_highlight then
			self._preplanning_highlight = false
			preplanning:child("button"):set_alpha(0.8)
		end
	end
	local selected, highlighted = AssetsItem.super.mouse_moved(self, x, y)
	if not self._panel:inside(x, y) or not selected then
		self:check_deselect_item()
		return selected, highlighted
	end
	self._assets_list = self._assets_list or {}
	local update_select = false
	if not self._asset_selected then
		update_select = true
	elseif self._assets_list[self._asset_selected] and not self._panel:child("bg_rect_" .. tostring(self._asset_selected)):inside(x, y) and self._assets_list[self._asset_selected]:visible() then
		update_select = true
	end
	if update_select then
		for i, asset in ipairs(self._assets_list) do
			if self._panel:child("bg_rect_" .. tostring(i)):inside(x, y) and asset:visible() then
				update_select = false
				self:select_asset(i)
			else
			end
		end
	end
	if not update_select then
		return false, true
	end
	return selected, highlighted
end
function AssetsItem:mouse_pressed(button, x, y)
	local inside = AssetsItem.super.mouse_pressed(self, button, x, y)
	if inside == false then
		return false
	end
	if alive(self._move_left_rect) and alive(self._move_right_rect) then
		if self._move_left_rect:visible() and self._move_left_rect:inside(x, y) then
			self:move_assets_left()
			return
		end
		if self._move_right_rect:visible() and self._move_right_rect:inside(x, y) then
			self:move_assets_right()
			return
		end
	end
	local preplanning = self._preplanning_ready and self._panel:child("preplanning")
	if alive(preplanning) and preplanning:inside(x, y) then
		self:open_preplanning()
		return
	end
	if self._asset_selected and alive(self._panel:child("bg_rect_" .. tostring(self._asset_selected))) and self._panel:child("bg_rect_" .. tostring(self._asset_selected)):inside(x, y) then
		return self:_return_asset_info(self._asset_selected)
	end
	return inside
end
function AssetsItem:open_preplanning()
	if self._preplanning_ready then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("preplanning")
		managers.menu_component:on_ready_pressed_mission_briefing_gui(false)
	end
end
function AssetsItem:move(x, y)
	if #self._assets_list == 0 then
		return
	end
	local asset_selected = self._asset_selected
	local new_selected = self._my_left_i and (self._my_left_i - 1) * self._num_items + 1 or 1
	if asset_selected then
		local is_top = 0 < asset_selected % 2
		if not is_top or not math.max(y, 0) then
		end
		local step = 2 * x + math.min(y, 0)
		new_selected = asset_selected + step
		if new_selected > #self._assets_list then
			local old_page = math.ceil(asset_selected / self._num_items)
			local new_page = math.ceil(new_selected / self._num_items)
			if old_page < new_page then
				new_selected = #self._assets_list
			end
		end
	end
	if new_selected >= 1 and new_selected <= #self._assets_list then
		self._asset_selected = asset_selected
		self:select_asset(new_selected)
	end
end
function AssetsItem:move_left()
	self:move(-1, 0)
	do return end
	if #self._assets_list == 0 then
		return
	end
	self._asset_selected = self._asset_selected or 0
	local new_selected = math.max(self._asset_selected - 1, 1)
	self:select_asset(new_selected)
	return
end
function AssetsItem:move_up()
	self:move(0, -1)
end
function AssetsItem:move_down()
	self:move(0, 1)
end
function AssetsItem:move_right()
	self:move(1, 0)
	do return end
	if #self._assets_list == 0 then
		return
	end
	self._asset_selected = self._asset_selected or 0
	local new_selected = math.min(self._asset_selected + 1, #self._assets_list)
	self:select_asset(new_selected)
	return
end
function AssetsItem:confirm_pressed()
	return self:_return_asset_info(self._asset_selected)
end
function AssetsItem:something_selected()
	return self._asset_selected and true or false
end
function AssetsItem:_return_asset_info(i)
	local asset_cost
	if self._asset_locked[i] then
		local can_unlock = self._assets_names[i][5] and managers.money:can_afford_mission_asset(self._assets_names[i][4])
		local can_client_unlock = managers.assets.ALLOW_CLIENTS_UNLOCK == true or type(managers.assets.ALLOW_CLIENTS_UNLOCK) == "string" and managers.player:has_team_category_upgrade("player", managers.assets.ALLOW_CLIENTS_UNLOCK)
		if (Network:is_server() or can_client_unlock) and can_unlock then
			asset_cost = managers.money:get_mission_asset_cost_by_id(self._assets_names[i][4])
		else
			asset_cost = true
		end
	end
	return i, asset_cost
end
LoadoutItem = LoadoutItem or class(AssetsItem)
function LoadoutItem:init(panel, text, i, assets_names, menu_component_data)
	LoadoutItem.super.init(self, panel, text, i, assets_names, 5, menu_component_data, true)
	self._text_strings_localized = true
	local got_deployables = managers.player:availible_equipment(1)
	got_deployables = got_deployables and #got_deployables > 0
	if got_deployables or self._assets_list[4] then
	end
	local primaries = not managers.blackmarket:get_crafted_category("primaries") and {}
	local got_primary = false
	for _, d in pairs(primaries) do
		got_primary = true
		break
	end
	if got_primary or self._assets_list[1] then
	end
	local when_to_split = 6
	do
		local equipped_weapon = managers.blackmarket:equipped_primary()
		local primary_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		local icon_list = {}
		for i, icon in ipairs(managers.menu_component:create_weapon_mod_icon_list(equipped_weapon.weapon_id, "primaries", equipped_weapon.factory_id, primary_slot)) do
			if icon.equipped then
				table.insert(icon_list, icon)
			end
		end
		local split = when_to_split < #icon_list
		for index, icon in ipairs(icon_list) do
			local texture = icon.texture
			if DB:has(Idstring("texture"), texture) then
				local object = self._panel:bitmap({
					texture = texture,
					w = 16,
					h = 16,
					rotation = math.random(2) - 1.5,
					alpha = icon.equipped and 1 or 0.25,
					layer = 2
				})
				object:set_rightbottom(math.round(self._assets_list[1]:right() - index * 18) + 25, math.round(self._assets_list[1]:bottom() + 17.5))
				if split then
					if when_to_split < index then
						object:move(18 * when_to_split, 0)
					else
						object:move(0, 18)
					end
				end
			end
		end
	end
	do
		local equipped_weapon = managers.blackmarket:equipped_secondary()
		local primary_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
		local icon_list = {}
		for i, icon in ipairs(managers.menu_component:create_weapon_mod_icon_list(equipped_weapon.weapon_id, "secondaries", equipped_weapon.factory_id, primary_slot)) do
			if icon.equipped then
				table.insert(icon_list, icon)
			end
		end
		local split = when_to_split < #icon_list
		for index, icon in ipairs(icon_list) do
			local texture = icon.texture
			if DB:has(Idstring("texture"), texture) then
				local object = self._panel:bitmap({
					texture = texture,
					w = 16,
					h = 16,
					rotation = math.random(2) - 1.5,
					alpha = icon.equipped and 1 or 0.25,
					layer = 2
				})
				object:set_rightbottom(math.round(self._assets_list[2]:right() - index * 18) + 25, math.round(self._assets_list[2]:bottom() + 17.5))
				if split then
					if when_to_split < index then
						object:move(18 * when_to_split, 0)
					else
						object:move(0, 18)
					end
				end
			end
		end
	end
	self._asset_text:move(0, 25)
	self:select_asset(self._my_menu_component_data.selected or 1, true)
end
function LoadoutItem:post_init()
	if Application:production_build() then
		self._panel:set_debug(false)
	end
end
function LoadoutItem:select(no_sound)
	LoadoutItem.super.select(self, no_sound)
end
function LoadoutItem:deselect()
	LoadoutItem.super.deselect(self)
end
function LoadoutItem:mouse_moved(x, y)
	return LoadoutItem.super.mouse_moved(self, x, y)
end
function LoadoutItem:open_node(node)
	self._my_menu_component_data.changing_loadout = nil
	self._my_menu_component_data.current_slot = nil
	if node == 1 then
		self._my_menu_component_data.changing_loadout = "primary"
		self._my_menu_component_data.current_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_primaries_loadout()
		})
	elseif node == 2 then
		self._my_menu_component_data.changing_loadout = "secondary"
		self._my_menu_component_data.current_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_secondaries_loadout()
		})
	elseif node == 3 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_melee_weapon_loadout()
		})
	elseif node == 4 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_armor_loadout()
		})
	elseif node == 5 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_deployable_loadout()
		})
	elseif node == 6 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_grenade_loadout()
		})
	end
	managers.menu_component:on_ready_pressed_mission_briefing_gui(false)
end
function LoadoutItem:confirm_pressed()
	if self._asset_selected then
		self:open_node(self._asset_selected)
		return true
	end
end
function LoadoutItem:mouse_pressed(button, x, y)
	local inside = LoadoutItem.super.mouse_pressed(self, button, x, y)
	if inside == false then
		return false
	end
	self:open_node(inside)
	return inside and true
end
function LoadoutItem:populate_category(category, data)
	local crafted_category = managers.blackmarket:get_crafted_category(category) or {}
	local new_data = {}
	local index = 0
	local max_items = data.override_slots and data.override_slots[1] * data.override_slots[2] or 9
	local max_rows = tweak_data.gui.MAX_WEAPON_ROWS or 3
	max_items = max_rows * (data.override_slots and data.override_slots[2] or 3)
	for i = 1, max_items do
		data[i] = nil
	end
	local weapon_data = Global.blackmarket_manager.weapons
	local guis_catalog = "guis/"
	for i, crafted in pairs(crafted_category) do
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[crafted.weapon_id] and tweak_data.weapon[crafted.weapon_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		new_data = {}
		new_data.name = crafted.weapon_id
		new_data.name_localized = managers.weapon_factory:get_weapon_name_by_factory_id(crafted.factory_id)
		new_data.category = category
		new_data.slot = i
		new_data.unlocked = managers.blackmarket:weapon_unlocked(crafted.weapon_id)
		new_data.lock_texture = not new_data.unlocked and "guis/textures/pd2/lock_level"
		new_data.equipped = crafted.equipped
		new_data.can_afford = true
		new_data.skill_based = weapon_data[crafted.weapon_id].skill_based
		new_data.skill_name = new_data.skill_based and "bm_menu_skill_locked_" .. new_data.name
		new_data.level = managers.blackmarket:weapon_level(crafted.weapon_id)
		local texture_name = tweak_data.weapon[crafted.weapon_id].texture_name or tostring(crafted.weapon_id)
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		new_data.comparision_data = new_data.unlocked and managers.blackmarket:get_weapon_stats(category, i)
		new_data.stream = false
		new_data.global_value = tweak_data.weapon[new_data.name] and tweak_data.weapon[new_data.name].global_value or "normal"
		new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or nil
		new_data.lock_texture = BlackMarketGui.get_lock_icon(self, new_data)
		if not new_data.equipped and new_data.unlocked then
			table.insert(new_data, "lo_w_equip")
		end
		local icon_list = managers.menu_component:create_weapon_mod_icon_list(crafted.weapon_id, category, crafted.factory_id, i)
		local icon_index = 1
		new_data.mini_icons = {}
		for _, icon in pairs(icon_list) do
			table.insert(new_data.mini_icons, {
				texture = icon.texture,
				right = (icon_index - 1) * 18,
				bottom = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false,
				alpha = icon.equipped and 1 or 0.25
			})
			icon_index = icon_index + 1
		end
		data[i] = new_data
		index = i
	end
	for i = 1, max_items do
		if not data[i] then
			new_data = {}
			new_data.name = "empty_slot"
			new_data.name_localized = managers.localization:text("bm_menu_empty_weapon_slot")
			new_data.name_localized_selected = new_data.name_localized
			new_data.is_loadout = true
			new_data.category = category
			new_data.empty_slot = true
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function LoadoutItem:populate_primaries(data)
	self:populate_category("primaries", data)
end
function LoadoutItem:populate_secondaries(data)
	self:populate_category("secondaries", data)
end
function LoadoutItem:populate_armors(data)
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for armor_id, armor_data in pairs(tweak_data.blackmarket.armors) do
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[armor_id] and tweak_data.blackmarket.armors[armor_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if bm_data.owned then
			index = index + 1
			new_data = {}
			new_data.name = tweak_data.blackmarket.armors[armor_id].name_id
			new_data.category = "armors"
			new_data.slot = index
			new_data.unlocked = bm_data.unlocked
			new_data.lock_texture = not new_data.unlocked and "guis/textures/pd2/lock_level"
			new_data.equipped = bm_data.equipped
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. armor_id
			if not new_data.equipped then
				table.insert(new_data, "a_equip")
			end
			data[index] = new_data
		end
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "armors"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function LoadoutItem:populate_deployables(data)
	local deployables = managers.player:availible_equipment(1) or {}
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for i, deployable in ipairs(deployables) do
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.deployables[deployable] and tweak_data.blackmarket.deployables[deployable].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		new_data = {}
		new_data.name = deployable
		new_data.name_localized = managers.localization:text(tweak_data.upgrades.definitions[deployable].name_id)
		new_data.category = "deployables"
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. tostring(deployable)
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = managers.player:equipment_in_slot(1) == deployable
		new_data.stream = false
		if not new_data.equipped then
			table.insert(new_data, "lo_d_equip")
		end
		data[i] = new_data
		index = i
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "deployables"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function LoadoutItem:populate_grenades(data)
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for i, grenade in ipairs(tweak_data.blackmarket.projectiles) do
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.projectiles[grenade] and tweak_data.blackmarket.projectiles[grenade].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		new_data = {}
		new_data.name = grenade
		new_data.name_localized = managers.localization:text(tweak_data.upgrades.definitions[grenade].name_id)
		new_data.category = "grenades"
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. tostring(deployable)
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = managers.player:equipment_in_slot(1) == grenade
		new_data.stream = false
		if not new_data.equipped then
			table.insert(new_data, "lo_d_grenade")
		end
		data[i] = new_data
		index = i
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "grenades"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function LoadoutItem:create_primaries_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_primaries",
		category = "primaries",
		on_create_func = callback(self, self, "populate_primaries"),
		override_slots = {3, 3},
		identifier = Idstring("weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_primaries")
	}
	return data
end
function LoadoutItem:create_secondaries_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_secondaries",
		category = "secondaries",
		on_create_func = callback(self, self, "populate_secondaries"),
		override_slots = {3, 3},
		identifier = Idstring("weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_secondaries")
	}
	return data
end
function LoadoutItem:create_deployable_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_deployables",
		category = "deployables",
		on_create_func_name = "populate_deployables",
		override_slots = {4, 2},
		identifier = Idstring("deployable")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_deployables")
	}
	return data
end
function LoadoutItem:create_grenade_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_grenades",
		category = "grenades",
		on_create_func_name = "populate_grenades",
		override_slots = {3, 2},
		identifier = Idstring("grenade")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_grenades")
	}
	return data
end
function LoadoutItem:create_melee_weapon_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_melee_weapons",
		category = "melee_weapons",
		on_create_func_name = "populate_melee_weapons",
		override_slots = {3, 3},
		identifier = Idstring("melee_weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_melee_weapons")
	}
	return data
end
function LoadoutItem:create_armor_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_armors",
		category = "armors",
		on_create_func_name = "populate_armors",
		override_slots = {4, 2},
		identifier = Idstring("armor")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_armors")
	}
	return data
end
function LoadoutItem.animate_select(o, center_helper, instant)
	LoadoutItem.super.animate_select(o, center_helper, instant)
end
function LoadoutItem.animate_deselect(o, center_helper, instant)
	LoadoutItem.super.animate_deselect(o, center_helper, instant)
end
TeamLoadoutItem = TeamLoadoutItem or class(MissionBriefingTabItem)
function TeamLoadoutItem:init(panel, text, i)
	TeamLoadoutItem.super.init(self, panel, text, i)
	self._player_slots = {}
	local quarter_width = self._panel:w() / 4
	local slot_panel
	for i = 1, 4 do
		local old_right = slot_panel and slot_panel:right() or 0
		slot_panel = self._panel:panel({
			x = old_right,
			y = 0,
			w = quarter_width,
			h = self._panel:h(),
			valign = "grow"
		})
		self._player_slots[i] = {}
		self._player_slots[i].panel = slot_panel
		self._player_slots[i].outfit = {}
		local kit_menu = managers.menu:get_menu("kit_menu")
		if kit_menu then
			local kit_slot = kit_menu.renderer:get_player_slot_by_peer_id(i)
			if kit_slot then
				local outfit = kit_slot.outfit
				local character = kit_slot.params and kit_slot.params.character
				if outfit and character then
					self:set_slot_outfit(i, character, outfit)
				end
			end
		end
	end
end
function TeamLoadoutItem:reduce_to_small_font()
	TeamLoadoutItem.super.reduce_to_small_font(self)
	for i = 1, 4 do
		if self._player_slots[i].box then
			self._player_slots[i].box:create_sides(self._player_slots[i].panel, {
				sides = {
					1,
					1,
					1,
					1
				}
			})
		end
	end
end
function TeamLoadoutItem:set_slot_outfit(slot, criminal_name, outfit)
	local player_slot = self._player_slots[slot]
	if not player_slot then
		return
	end
	player_slot.panel:clear()
	if not outfit then
		return
	end
	local slot_h = player_slot.panel:h()
	local aspect
	local x = player_slot.panel:w() / 2
	local y = player_slot.panel:h() / 18
	local w = slot_h / 5 * 0.95
	local h = w
	local slot_color = tweak_data.chat_colors[slot]
	local criminal_text = player_slot.panel:text({
		font_size = tweak_data.menu.pd2_small_font_size,
		font = tweak_data.menu.pd2_small_font,
		color = slot_color,
		x = 5,
		y = 5,
		text = managers.localization:to_upper_text("menu_" .. tostring(criminal_name))
	})
	if SystemInfo:platform() == Idstring("WIN32") then
		criminal_text:move(5, 5)
	end
	local primary_texture, secondary_texture
	if outfit.primary.factory_id then
		local primary_id = managers.weapon_factory:get_weapon_id_by_factory_id(outfit.primary.factory_id)
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[primary_id] and tweak_data.weapon[primary_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[primary_id].texture_name or tostring(primary_id)
		local texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local primary_bitmap = player_slot.panel:bitmap({
			texture = texture,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = primary_bitmap:texture_width() / math.max(1, primary_bitmap:texture_height())
		primary_bitmap:set_w(primary_bitmap:h() * aspect)
		primary_bitmap:set_center_x(x)
		primary_bitmap:set_center_y(y * 3)
		primary_texture = texture
		local perks = managers.blackmarket:get_perks_from_weapon_blueprint(outfit.primary.factory_id, outfit.primary.blueprint)
		if table.size(perks) > 0 then
			local perk_index = 0
			for perk in pairs(perks) do
				local texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk
				if DB:has(Idstring("texture"), texture) then
					local perk_object = player_slot.panel:bitmap({
						texture = texture,
						w = 16,
						h = 16,
						rotation = math.random(2) - 1.5,
						alpha = 0.8
					})
					perk_object:set_rightbottom(math.round(primary_bitmap:right() - perk_index * 16), math.round(primary_bitmap:bottom() - 5))
					perk_index = perk_index + 1
				end
			end
		end
	end
	if outfit.secondary.factory_id then
		local secondary_id = managers.weapon_factory:get_weapon_id_by_factory_id(outfit.secondary.factory_id)
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[secondary_id] and tweak_data.weapon[secondary_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[secondary_id].texture_name or tostring(secondary_id)
		local texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local secondary_bitmap = player_slot.panel:bitmap({
			texture = texture,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = secondary_bitmap:texture_width() / math.max(1, secondary_bitmap:texture_height())
		secondary_bitmap:set_w(secondary_bitmap:h() * aspect)
		secondary_bitmap:set_center_x(x)
		secondary_bitmap:set_center_y(y * 6)
		secondary_texture = texture
		local perks = managers.blackmarket:get_perks_from_weapon_blueprint(outfit.secondary.factory_id, outfit.secondary.blueprint)
		if table.size(perks) > 0 then
			local perk_index = 0
			for perk in pairs(perks) do
				local texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk
				if DB:has(Idstring("texture"), texture) then
					local perk_object = player_slot.panel:bitmap({
						texture = texture,
						w = 16,
						h = 16,
						rotation = math.random(2) - 1.5,
						alpha = 0.8
					})
					perk_object:set_rightbottom(secondary_bitmap:right() - perk_index * 16, secondary_bitmap:bottom() - 5)
					perk_index = perk_index + 1
				end
			end
		end
	end
	if outfit.melee_weapon then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.melee_weapons[outfit.melee_weapon] and tweak_data.blackmarket.melee_weapons[outfit.melee_weapon].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if outfit.melee_weapon == "weapon" then
			if primary_texture and secondary_texture then
				local primary = player_slot.panel:bitmap({
					texture = primary_texture,
					w = w * 0.75,
					h = h * 0.75,
					rotation = math.random(2) - 21.5,
					alpha = 0.8
				})
				aspect = primary:texture_width() / math.max(1, primary:texture_height())
				primary:set_w(primary:h() * aspect)
				local secondary = player_slot.panel:bitmap({
					texture = secondary_texture,
					w = w * 0.75,
					h = h * 0.75,
					rotation = math.random(2) - 21.5,
					alpha = 0.8
				})
				aspect = secondary:texture_width() / math.max(1, secondary:texture_height())
				secondary:set_w(secondary:h() * aspect)
				primary:set_center_x(x - primary:w() * 0.25)
				primary:set_center_y(y * 9)
				secondary:set_center_x(x + secondary:w() * 0.25)
				secondary:set_center_y(y * 9)
			end
		else
			local melee_weapon_bitmap = player_slot.panel:bitmap({
				texture = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. outfit.melee_weapon,
				w = w,
				h = h,
				rotation = math.random(2) - 1.5,
				alpha = 0.8
			})
			aspect = melee_weapon_bitmap:texture_width() / math.max(1, melee_weapon_bitmap:texture_height())
			melee_weapon_bitmap:set_w(melee_weapon_bitmap:h() * aspect)
			melee_weapon_bitmap:set_center_x(x)
			melee_weapon_bitmap:set_center_y(y * 9)
		end
	end
	if outfit.grenade then
		do break end
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.projectiles[outfit.grenade] and tweak_data.blackmarket.projectiles[outfit.grenade].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local grenade_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/grenades/" .. outfit.grenade,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = grenade_bitmap:texture_width() / math.max(1, grenade_bitmap:texture_height())
		grenade_bitmap:set_w(grenade_bitmap:h() * aspect)
		grenade_bitmap:set_center_x(x)
		grenade_bitmap:set_center_y(y * 12)
	end
	if outfit.armor then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[outfit.armor] and tweak_data.blackmarket.armors[outfit.armor].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local armor_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. outfit.armor,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = armor_bitmap:texture_width() / math.max(1, armor_bitmap:texture_height())
		armor_bitmap:set_w(armor_bitmap:h() * aspect)
		armor_bitmap:set_center_x(x)
		armor_bitmap:set_center_y(y * 12)
	end
	if outfit.deployable and outfit.deployable ~= "nil" then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.deployables[outfit.deployable] and tweak_data.blackmarket.deployables[outfit.deployable].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local deployable_bitmap = player_slot.panel:bitmap({
			texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. outfit.deployable,
			w = w,
			h = h,
			rotation = math.random(2) - 1.5,
			alpha = 0.8
		})
		aspect = deployable_bitmap:texture_width() / math.max(1, deployable_bitmap:texture_height())
		deployable_bitmap:set_w(deployable_bitmap:h() * aspect)
		deployable_bitmap:set_center_x(x)
		deployable_bitmap:set_center_y(y * 15)
		local deployable_amount = tonumber(outfit.deployable_amount) or 0
		if deployable_amount > 1 then
			local deployable_text = player_slot.panel:text({
				text = "x" .. tostring(deployable_amount),
				font_size = tweak_data.menu.pd2_small_font_size,
				font = tweak_data.menu.pd2_small_font,
				rotation = deployable_bitmap:rotation(),
				color = tweak_data.screen_colors.text
			})
			local _, _, w, h = deployable_text:text_rect()
			deployable_text:set_size(w, h)
			deployable_text:set_rightbottom(player_slot.panel:w(), player_slot.panel:h())
			deployable_text:set_position(math.round(deployable_text:x()) - 16, math.round(deployable_text:y()) - 5)
		end
	end
	player_slot.box = BoxGuiObject:new(player_slot.panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
end
NewLoadoutItem = NewLoadoutItem or class()
function NewLoadoutItem:init(panel, columns, rows, x, y, params)
	local parent_w, parent_h = panel:size()
	local w = math.round(parent_w / (columns or 1))
	local h = math.round(parent_h / (rows or 1))
	local font = tweak_data.menu.pd2_medium_font
	local font_size = tweak_data.menu.pd2_medium_font_size
	self._panel = panel:panel({
		w = w - 2,
		h = h - 2,
		x = (x - 1) * w + 1,
		y = (y - 1) * h + 1
	})
	self._info_panel = self._panel:panel({h = font_size})
	self._item_panel = self._panel:panel({
		h = math.max(0, self._panel:h() - self._info_panel:h())
	})
	self._item_panel:set_position(0, 0)
	self._info_panel:set_top(self._item_panel:bottom())
	self._info_panel:left(self._item_panel:left())
	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size
	self._info_text = self._info_panel:text({
		font = font,
		font_size = font_size,
		visible = false,
		align = "center",
		rotation = 360
	})
	if params then
		if params.info_text then
			self:set_info_text(params.info_text)
		end
		if params.item_texture and DB:has(Idstring("texture"), params.item_texture) then
			self._item_image = self._item_panel:bitmap({
				texture = params.item_texture,
				layer = 1
			})
			local texture_width = self._item_image:texture_width()
			local texture_height = self._item_image:texture_height()
			local aspect = texture_width / texture_height
			local sw = math.min(self._item_panel:w(), self._item_panel:h() * aspect)
			local sh = math.min(self._item_panel:h(), self._item_panel:w() / aspect)
			self._item_image:set_size(sw, sh)
			self._item_image:set_center(self._item_panel:w() / 2, self._item_panel:h() / 2)
		elseif params.dual_texture_1 and params.dual_texture_2 then
			if DB:has(Idstring("texture"), params.dual_texture_1) then
				self._item_image1 = self._item_panel:bitmap({
					texture = params.dual_texture_1,
					layer = 1
				})
				local texture_width = self._item_image1:texture_width()
				local texture_height = self._item_image1:texture_height()
				local aspect = texture_width / texture_height
				local sw = math.min(self._item_panel:w(), self._item_panel:h() * aspect)
				local sh = math.min(self._item_panel:h(), self._item_panel:w() / aspect)
				self._item_image1:set_size(sw * 0.5, sh * 0.5)
				self._item_image1:set_center(self._item_panel:w() * 0.5, self._item_panel:h() * 0.35)
			end
			if DB:has(Idstring("texture"), params.dual_texture_2) then
				self._item_image2 = self._item_panel:bitmap({
					texture = params.dual_texture_2,
					layer = 1
				})
				local texture_width = self._item_image2:texture_width()
				local texture_height = self._item_image2:texture_height()
				local aspect = texture_width / texture_height
				local sw = math.min(self._item_panel:w(), self._item_panel:h() * aspect)
				local sh = math.min(self._item_panel:h(), self._item_panel:w() / aspect)
				self._item_image2:set_size(sw * 0.5, sh * 0.5)
				self._item_image2:set_center(self._item_panel:w() * 0.5, self._item_panel:h() * 0.65)
			end
		end
		if params.info_icons then
			self._info_icon_panel = self._info_panel:panel()
			local when_to_split = math.floor(self._info_icon_panel:w() / 18)
			local split = when_to_split < #params.info_icons
			for index, icon in ipairs(params.info_icons) do
				local texture = icon.texture
				if DB:has(Idstring("texture"), texture) then
					local object = self._info_icon_panel:bitmap({
						texture = texture,
						w = 16,
						h = 16,
						alpha = icon.equipped and 1 or 0.25,
						layer = 1
					})
					object:set_center(self._info_icon_panel:right() - index * 18, self._info_icon_panel:h() / 2)
					if split and index > when_to_split then
						object:move(18 * when_to_split, 0)
					end
				else
				end
			end
		end
		self._params = params
	end
	self:deselect_item()
end
function NewLoadoutItem:set_info_text(text)
	self._info_text:set_text(text)
	local x, y, w, h = self._info_text:text_rect()
	self._info_text:set_align(w > self._info_text:w() and "left" or "center")
end
function NewLoadoutItem:mouse_moved(x, y)
	local mouse_over = self._item_panel:inside(x, y)
	if mouse_over then
		self:select_item()
	else
		self:deselect_item()
	end
	return mouse_over
end
function NewLoadoutItem:inside(x, y)
	return self._item_panel:inside(x, y)
end
function NewLoadoutItem:select_item()
	self._panel:set_alpha(1)
	self._info_text:set_visible(true)
	self._selected = true
	if alive(self._info_icon_panel) then
		self._info_icon_panel:set_visible(false)
	end
end
function NewLoadoutItem:deselect_item()
	self._panel:set_alpha(0.75)
	self._info_text:set_visible(false)
	self._selected = false
	if alive(self._info_icon_panel) then
		self._info_icon_panel:set_visible(true)
	end
end
NewLoadoutTab = NewLoadoutTab or class(MissionBriefingTabItem)
NewLoadoutTab.columns = 3
NewLoadoutTab.rows = 2
function NewLoadoutTab:init(panel, text, i, menu_component_data)
	self._my_menu_component_data = menu_component_data
	NewLoadoutTab.super.init(self, panel, text, i)
	self._panel:move(0, 5)
	self._panel:grow(0, -5)
	local primary_texture = "guis/textures/pd2/endscreen/what_is_this"
	local secondary_texture = "guis/textures/pd2/endscreen/what_is_this"
	local melee_weapon_texture = "guis/textures/pd2/endscreen/what_is_this"
	local grenade_texture = "guis/textures/pd2/endscreen/what_is_this"
	local armor_texture = "guis/textures/pd2/endscreen/what_is_this"
	local deployable_texture = "guis/textures/pd2/endscreen/what_is_this"
	local empty_string = managers.localization:to_upper_text("menu_loadout_empty")
	local primary_string = empty_string
	local secondary_string = empty_string
	local melee_weapon_string = empty_string
	local grenade_string = empty_string
	local armor_string = empty_string
	local deployable_string = empty_string
	local primary_perks = {}
	local secondary_perks = {}
	local primary = managers.blackmarket:equipped_primary()
	local secondary = managers.blackmarket:equipped_secondary()
	local melee_weapon = managers.blackmarket:equipped_melee_weapon()
	local grenade, grenade_amount = managers.blackmarket:equipped_grenade()
	local armor = managers.blackmarket:equipped_armor()
	local deployable = managers.player:equipment_in_slot(1)
	if primary then
		local guis_catalog = "guis/"
		local weapon_id = primary.weapon_id
		local bundle_folder = tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[weapon_id].texture_name or tostring(weapon_id)
		primary_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local equipped_weapon = managers.blackmarket:equipped_primary()
		local equipped_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		primary_string = managers.blackmarket:get_weapon_name_by_category_slot("primaries", equipped_slot)
		if equipped_weapon and equipped_slot then
			local icon_list = {}
			for i, icon in ipairs(managers.menu_component:create_weapon_mod_icon_list(equipped_weapon.weapon_id, "primaries", equipped_weapon.factory_id, equipped_slot)) do
				if icon.equipped then
					table.insert(icon_list, icon)
				end
			end
			primary_perks = icon_list
		end
	end
	if secondary then
		local guis_catalog = "guis/"
		local weapon_id = secondary.weapon_id
		local bundle_folder = tweak_data.weapon[weapon_id] and tweak_data.weapon[weapon_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		local texture_name = tweak_data.weapon[secondary.weapon_id].texture_name or tostring(secondary.weapon_id)
		secondary_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		local equipped_weapon = managers.blackmarket:equipped_secondary()
		local equipped_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
		secondary_string = managers.blackmarket:get_weapon_name_by_category_slot("secondaries", equipped_slot)
		if equipped_weapon and equipped_slot then
			local icon_list = {}
			for i, icon in ipairs(managers.menu_component:create_weapon_mod_icon_list(equipped_weapon.weapon_id, "secondaries", equipped_weapon.factory_id, equipped_slot)) do
				if icon.equipped then
					table.insert(icon_list, icon)
				end
			end
			secondary_perks = icon_list
		end
	end
	if melee_weapon then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.melee_weapons[melee_weapon] and tweak_data.blackmarket.melee_weapons[melee_weapon].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if melee_weapon == "weapon" then
			melee_weapon_texture = nil
		else
			melee_weapon_texture = guis_catalog .. "textures/pd2/blackmarket/icons/melee_weapons/" .. tostring(melee_weapon)
		end
		melee_weapon_string = managers.localization:text(tweak_data.blackmarket.melee_weapons[melee_weapon].name_id)
	end
	if grenade and grenade_amount > 0 then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.projectiles[grenade] and tweak_data.blackmarket.projectiles[grenade].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		grenade_texture = guis_catalog .. "textures/pd2/blackmarket/icons/grenades/" .. tostring(grenade)
		grenade_string = managers.localization:text(tweak_data.blackmarket.projectiles[grenade].name_id)
	end
	if armor then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[armor] and tweak_data.blackmarket.armors[armor].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		armor_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. tostring(armor)
		armor_string = managers.localization:text(tweak_data.blackmarket.armors[armor].name_id)
	end
	if deployable then
		local guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.deployables[deployable] and tweak_data.blackmarket.deployables[deployable].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		deployable_texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. tostring(deployable)
		deployable_string = managers.localization:text(tweak_data.upgrades.definitions[deployable].name_id)
	end
	local primary = {
		item_texture = primary_texture,
		info_text = primary_string,
		info_icons = primary_perks
	}
	local secondary = {
		item_texture = secondary_texture,
		info_text = secondary_string,
		info_icons = secondary_perks
	}
	local melee_weapon = {
		item_texture = melee_weapon_texture,
		info_text = melee_weapon_string,
		dual_texture_1 = primary_texture,
		dual_texture_2 = secondary_texture
	}
	local grenade = {item_texture = grenade_texture, info_text = grenade_string}
	local armor = {item_texture = armor_texture, info_text = armor_string}
	local deployable = {item_texture = deployable_texture, info_text = deployable_string}
	local items = {
		primary,
		secondary,
		melee_weapon,
		grenade,
		armor,
		deployable
	}
	local selected = self._my_menu_component_data.selected or 1
	self._items = {}
	local columns = NewLoadoutTab.columns
	local rows = NewLoadoutTab.rows
	for row = 1, rows do
		for column = 1, columns do
			local item = items[(row - 1) * columns + column]
			if item then
				local new_item = NewLoadoutItem:new(self._panel, columns, rows, column, row, item)
				table.insert(self._items, new_item)
				if #self._items == selected then
					new_item:select_item()
					self._item_selected = #self._items
					self._my_menu_component_data.selected = selected
				end
			end
		end
	end
end
function NewLoadoutTab:mouse_moved(x, y)
	local selected, highlighted = NewLoadoutTab.super.mouse_moved(self, x, y)
	if not selected then
		return selected, highlighted
	end
	local mouse_over = false
	if self._items then
		for index, item in ipairs(self._items) do
			local item_state = item:mouse_moved(x, y)
			if item_state then
				mouse_over = index
			end
		end
	end
	if mouse_over then
		if self._item_selected ~= mouse_over then
			self._item_selected = mouse_over
			self._my_menu_component_data.selected = mouse_over
			managers.menu_component:post_event("highlight")
		end
	elseif self._item_selected then
		self._item_selected = false
		self._my_menu_component_data.selected = false
	end
	return false, mouse_over
end
function NewLoadoutTab:mouse_pressed(button, x, y)
	local inside = NewLoadoutTab.super.mouse_pressed(self, button, x, y)
	if inside == false then
		return false
	end
	if self._item_selected and self._items[self._item_selected] and self._items[self._item_selected]:inside(x, y) then
		self:confirm_pressed()
	end
	return inside
end
function NewLoadoutTab:confirm_pressed()
	if self._item_selected then
		self:open_node(self._item_selected)
		return true
	end
end
function NewLoadoutTab:move_selected(x, y)
	if not self._item_selected then
		self._item_selected = self._my_menu_component_data.selected or 1
	end
	local columns = NewLoadoutTab.columns
	local rows = NewLoadoutTab.rows
	local c = (self._item_selected - 1) % columns + 1
	local r = math.ceil(self._item_selected / columns)
	c = math.clamp(c + x, 1, columns)
	r = math.clamp(r + y, 1, rows)
	local new_selected = c + (r - 1) * columns
	if new_selected ~= self._item_selected and self._items[new_selected] then
		self._items[self._item_selected]:deselect_item()
		self._item_selected = new_selected
		self._my_menu_component_data.selected = new_selected
		self._items[new_selected]:select_item()
		managers.menu_component:post_event("highlight")
	end
end
function NewLoadoutTab:move_left()
	self:move_selected(-1, 0)
end
function NewLoadoutTab:move_right()
	self:move_selected(1, 0)
end
function NewLoadoutTab:move_up()
	self:move_selected(0, -1)
end
function NewLoadoutTab:move_down()
	self:move_selected(0, 1)
end
function NewLoadoutTab:select(no_sound)
	NewLoadoutTab.super.select(self, no_sound)
end
function NewLoadoutTab:deselect()
	NewLoadoutTab.super.deselect(self)
end
function NewLoadoutTab:populate_category(category, data)
	local crafted_category = managers.blackmarket:get_crafted_category(category) or {}
	local new_data = {}
	local index = 0
	local max_items = data.override_slots and data.override_slots[1] * data.override_slots[2] or 9
	local max_rows = tweak_data.gui.MAX_WEAPON_ROWS or 3
	max_items = max_rows * (data.override_slots and data.override_slots[2] or 3)
	for i = 1, max_items do
		data[i] = nil
	end
	local weapon_data = Global.blackmarket_manager.weapons
	local guis_catalog = "guis/"
	for i, crafted in pairs(crafted_category) do
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.weapon[crafted.weapon_id] and tweak_data.weapon[crafted.weapon_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		new_data = {}
		new_data.name = crafted.weapon_id
		new_data.name_localized = managers.blackmarket:get_weapon_name_by_category_slot(category, i)
		new_data.category = category
		new_data.custom_name_text = managers.blackmarket:get_crafted_custom_name(category, i, true)
		new_data.slot = i
		new_data.unlocked = managers.blackmarket:weapon_unlocked(crafted.weapon_id)
		new_data.lock_texture = not new_data.unlocked and "guis/textures/pd2/lock_level"
		new_data.equipped = crafted.equipped
		new_data.can_afford = true
		new_data.skill_based = weapon_data[crafted.weapon_id].skill_based
		new_data.skill_name = new_data.skill_based and "bm_menu_skill_locked_" .. new_data.name
		new_data.level = managers.blackmarket:weapon_level(crafted.weapon_id)
		local texture_name = tweak_data.weapon[crafted.weapon_id].texture_name or tostring(crafted.weapon_id)
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/weapons/" .. texture_name
		new_data.comparision_data = new_data.unlocked and managers.blackmarket:get_weapon_stats(category, i)
		new_data.stream = false
		new_data.global_value = tweak_data.weapon[new_data.name] and tweak_data.weapon[new_data.name].global_value or "normal"
		new_data.dlc_locked = tweak_data.lootdrop.global_values[new_data.global_value].unlock_id or nil
		new_data.lock_texture = BlackMarketGui.get_lock_icon(self, new_data)
		if not new_data.equipped and new_data.unlocked then
			table.insert(new_data, "lo_w_equip")
		end
		local icon_list = managers.menu_component:create_weapon_mod_icon_list(crafted.weapon_id, category, crafted.factory_id, i)
		local icon_index = 1
		new_data.mini_icons = {}
		for _, icon in pairs(icon_list) do
			table.insert(new_data.mini_icons, {
				texture = icon.texture,
				right = (icon_index - 1) * 18,
				bottom = 0,
				layer = 1,
				w = 16,
				h = 16,
				stream = false,
				alpha = icon.equipped and 1 or 0.25
			})
			icon_index = icon_index + 1
		end
		data[i] = new_data
		index = i
	end
	for i = 1, max_items do
		if not data[i] then
			new_data = {}
			new_data.name = "empty_slot"
			new_data.name_localized = managers.localization:text("bm_menu_empty_weapon_slot")
			new_data.name_localized_selected = new_data.name_localized
			new_data.is_loadout = true
			new_data.category = category
			new_data.empty_slot = true
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			new_data.mid_text = {}
			new_data.mid_text.noselected_text = new_data.name_localized
			new_data.mid_text.noselected_color = tweak_data.screen_colors.button_stage_3
			new_data.mid_text.selected_text = new_data.mid_text.noselected_text
			new_data.mid_text.selected_color = new_data.mid_text.noselected_color
			new_data.mid_text.is_lock_same_color = true
			data[i] = new_data
		end
	end
end
function NewLoadoutTab:populate_primaries(data)
	self:populate_category("primaries", data)
end
function NewLoadoutTab:populate_secondaries(data)
	self:populate_category("secondaries", data)
end
function NewLoadoutTab:populate_armors(data)
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for armor_id, armor_data in pairs(tweak_data.blackmarket.armors) do
		local bm_data = Global.blackmarket_manager.armors[armor_id]
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.armors[armor_id] and tweak_data.blackmarket.armors[armor_id].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		if bm_data.owned then
			index = index + 1
			new_data = {}
			new_data.name = tweak_data.blackmarket.armors[armor_id].name_id
			new_data.category = "armors"
			new_data.slot = index
			new_data.unlocked = bm_data.unlocked
			new_data.lock_texture = not new_data.unlocked and "guis/textures/pd2/lock_level"
			new_data.equipped = bm_data.equipped
			new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/armors/" .. armor_id
			if not new_data.equipped then
				table.insert(new_data, "a_equip")
			end
			data[index] = new_data
		end
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "armors"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function NewLoadoutTab:populate_deployables(data)
	local deployables = managers.player:availible_equipment(1) or {}
	local new_data = {}
	local index = 0
	local guis_catalog = "guis/"
	for i, deployable in ipairs(deployables) do
		guis_catalog = "guis/"
		local bundle_folder = tweak_data.blackmarket.deployables[deployable] and tweak_data.blackmarket.deployables[deployable].texture_bundle_folder
		if bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
		end
		new_data = {}
		new_data.name = deployable
		new_data.name_localized = managers.localization:text(tweak_data.upgrades.definitions[deployable].name_id)
		new_data.category = "deployables"
		new_data.bitmap_texture = guis_catalog .. "textures/pd2/blackmarket/icons/deployables/" .. tostring(deployable)
		new_data.slot = i
		new_data.unlocked = true
		new_data.equipped = managers.player:equipment_in_slot(1) == deployable
		new_data.stream = false
		if not new_data.equipped then
			table.insert(new_data, "lo_d_equip")
		end
		data[i] = new_data
		index = i
	end
	for i = 1, 9 do
		if not data[i] then
			new_data = {}
			new_data.name = "empty"
			new_data.name_localized = ""
			new_data.category = "deployables"
			new_data.slot = i
			new_data.unlocked = true
			new_data.equipped = false
			data[i] = new_data
		end
	end
end
function NewLoadoutTab:create_primaries_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_primaries",
		category = "primaries",
		on_create_func = callback(self, self, "populate_primaries"),
		override_slots = {3, 3},
		identifier = Idstring("weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_primaries")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:create_secondaries_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_secondaries",
		category = "secondaries",
		on_create_func = callback(self, self, "populate_secondaries"),
		override_slots = {3, 3},
		identifier = Idstring("weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_secondaries")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:create_deployable_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_deployables",
		category = "deployables",
		on_create_func_name = "populate_deployables",
		override_slots = {4, 2},
		identifier = Idstring("deployable")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_deployables")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:create_melee_weapon_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_melee_weapons",
		category = "melee_weapons",
		on_create_func_name = "populate_melee_weapons",
		override_slots = {3, 3},
		identifier = Idstring("melee_weapon")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_melee_weapons")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:create_grenade_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_grenades",
		category = "grenades",
		on_create_func_name = "populate_grenades",
		override_slots = {3, 3},
		identifier = Idstring("grenade")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_grenades")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:create_armor_loadout()
	local data = {}
	table.insert(data, {
		name = "bm_menu_armors",
		category = "armors",
		on_create_func_name = "populate_armors",
		override_slots = {4, 2},
		identifier = Idstring("armor")
	})
	data.topic_id = "menu_loadout_blackmarket"
	data.topic_params = {
		category = managers.localization:text("bm_menu_armors")
	}
	data.is_loadout = true
	return data
end
function NewLoadoutTab:open_node(node)
	self._my_menu_component_data.changing_loadout = nil
	self._my_menu_component_data.current_slot = nil
	if node == 1 then
		self._my_menu_component_data.changing_loadout = "primary"
		self._my_menu_component_data.current_slot = managers.blackmarket:equipped_weapon_slot("primaries")
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_primaries_loadout()
		})
	elseif node == 2 then
		self._my_menu_component_data.changing_loadout = "secondary"
		self._my_menu_component_data.current_slot = managers.blackmarket:equipped_weapon_slot("secondaries")
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_secondaries_loadout()
		})
	elseif node == 3 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_melee_weapon_loadout()
		})
	elseif node == 4 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_grenade_loadout()
		})
	elseif node == 5 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_armor_loadout()
		})
	elseif node == 6 then
		managers.menu_component:post_event("menu_enter")
		managers.menu:open_node("loadout", {
			self:create_deployable_loadout()
		})
	end
	managers.menu_component:on_ready_pressed_mission_briefing_gui(false)
end
MissionBriefingGui = MissionBriefingGui or class()
function MissionBriefingGui:init(saferect_ws, fullrect_ws, node)
	self._safe_workspace = saferect_ws
	self._full_workspace = fullrect_ws
	self._node = node
	self._fullscreen_panel = self._full_workspace:panel():panel()
	self._panel = self._safe_workspace:panel():panel({
		w = self._safe_workspace:panel():w() / 2,
		layer = 6
	})
	self._panel:set_right(self._safe_workspace:panel():w())
	self._panel:set_top(165 + tweak_data.menu.pd2_medium_font_size)
	self._panel:grow(0, -self._panel:top())
	self._ready = managers.network:session():local_peer():waiting_for_player_ready()
	local ready_text = self:ready_text()
	self._ready_button = self._panel:text({
		name = "ready_button",
		text = ready_text,
		align = "right",
		vertical = "center",
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_3,
		layer = 2,
		blend_mode = "add",
		rotation = 360
	})
	local _, _, w, h = self._ready_button:text_rect()
	self._ready_button:set_size(w, h)
	if not managers.menu:is_pc_controller() then
	end
	self._ready_tick_box = self._panel:bitmap({
		name = "ready_tickbox",
		texture = "guis/textures/pd2/mission_briefing/gui_tickbox",
		layer = 2
	})
	self._ready_tick_box:set_rightbottom(self._panel:w(), self._panel:h())
	self._ready_tick_box:set_image(self._ready and "guis/textures/pd2/mission_briefing/gui_tickbox_ready" or "guis/textures/pd2/mission_briefing/gui_tickbox")
	self._ready_button:set_center_y(self._ready_tick_box:center_y())
	self._ready_button:set_right(self._ready_tick_box:left() - 5)
	local big_text = self._fullscreen_panel:text({
		name = "ready_big_text",
		text = ready_text,
		h = 90,
		align = "right",
		vertical = "bottom",
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		color = tweak_data.screen_colors.button_stage_3,
		alpha = 0.4,
		layer = 1,
		rotation = 360
	})
	local _, _, w, h = big_text:text_rect()
	big_text:set_size(w, h)
	local x, y = managers.gui_data:safe_to_full_16_9(self._ready_button:world_right(), self._ready_button:world_center_y())
	big_text:set_world_right(x)
	big_text:set_world_center_y(y)
	big_text:move(13, -3)
	big_text:set_layer(self._ready_button:layer() - 1)
	if MenuBackdropGUI then
		MenuBackdropGUI.animate_bg_text(self, big_text)
	end
	WalletGuiObject.set_wallet(self._safe_workspace:panel(), 10)
	self._node:parameters().menu_component_data = self._node:parameters().menu_component_data or {}
	self._node:parameters().menu_component_data.asset = self._node:parameters().menu_component_data.asset or {}
	self._node:parameters().menu_component_data.loadout = self._node:parameters().menu_component_data.loadout or {}
	local asset_data = self._node:parameters().menu_component_data.asset
	local loadout_data = self._node:parameters().menu_component_data.loadout
	if not managers.menu:is_pc_controller() then
		local prev_page = self._panel:text({
			name = "tab_text_0",
			y = 0,
			w = 0,
			h = tweak_data.menu.pd2_medium_font_size,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			layer = 2,
			text = managers.localization:get_default_macro("BTN_BOTTOM_L"),
			vertical = "top"
		})
		local _, _, w, h = prev_page:text_rect()
		prev_page:set_size(w, h + 10)
		prev_page:set_left(0)
		self._prev_page = prev_page
	end
	self._items = {}
	self._description_item = DescriptionItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_description")), 1, self._node:parameters().menu_component_data.saved_descriptions)
	table.insert(self._items, self._description_item)
	self._assets_item = AssetsItem:new(self._panel, managers.preplanning:has_current_level_preplanning() and managers.localization:to_upper_text("menu_preplanning") or utf8.to_upper(managers.localization:text("menu_assets")), 2, {}, nil, asset_data)
	table.insert(self._items, self._assets_item)
	self._new_loadout_item = NewLoadoutTab:new(self._panel, managers.localization:to_upper_text("menu_loadout"), 3, loadout_data)
	table.insert(self._items, self._new_loadout_item)
	if not Global.game_settings.single_player then
		self._team_loadout_item = TeamLoadoutItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_team_loadout")), 4)
		table.insert(self._items, self._team_loadout_item)
	end
	if tweak_data.levels[Global.level_data.level_id].music ~= "no_music" then
		self._jukebox_item = JukeboxItem:new(self._panel, utf8.to_upper(managers.localization:text("menu_jukebox")), Global.game_settings.single_player and 4 or 5)
		table.insert(self._items, self._jukebox_item)
	end
	local max_x = self._panel:w()
	if not managers.menu:is_pc_controller() then
		local next_page = self._panel:text({
			name = "tab_text_" .. tostring(#self._items + 1),
			y = 0,
			w = 0,
			h = tweak_data.menu.pd2_medium_font_size,
			font_size = tweak_data.menu.pd2_medium_font_size,
			font = tweak_data.menu.pd2_medium_font,
			layer = 2,
			text = managers.localization:get_default_macro("BTN_BOTTOM_R"),
			vertical = "top"
		})
		local _, _, w, h = next_page:text_rect()
		next_page:set_size(w, h + 10)
		next_page:set_right(self._panel:w())
		self._next_page = next_page
		max_x = next_page:left() - 5
	end
	self._reduced_to_small_font = not managers.menu:is_pc_controller()
	self:chk_reduce_to_small_font()
	self._selected_item = 0
	self:set_tab(self._node:parameters().menu_component_data.selected_tab, true)
	local box_panel = self._panel:panel()
	box_panel:set_shape(self._items[self._selected_item]:panel():shape())
	BoxGuiObject:new(box_panel, {
		sides = {
			1,
			1,
			2,
			1
		}
	})
	if managers.assets:is_all_textures_loaded() or #managers.assets:get_all_asset_ids(true) == 0 then
		self:create_asset_tab()
	end
	self._items[self._selected_item]:select(true)
	self._enabled = true
	self:flash_ready()
end
function MissionBriefingGui:chk_reduce_to_small_font()
	local max_x = alive(self._next_page) and self._next_page:left() - 5 or self._panel:w()
	if self._reduced_to_small_font or self._items[#self._items] and alive(self._items[#self._items]._tab_text) and max_x < self._items[#self._items]._tab_text:right() then
		for i, tab in ipairs(self._items) do
			tab:reduce_to_small_font()
		end
	end
end
function MissionBriefingGui:update(t, dt)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:update(t, dt)
	end
end
function MissionBriefingGui:ready_text()
	local legend = not managers.menu:is_pc_controller() and managers.localization:get_default_macro("BTN_Y") or ""
	return legend .. utf8.to_upper(managers.localization:text("menu_waiting_is_ready"))
end
function MissionBriefingGui:flash_ready()
	if self._ready then
		return
	end
	self._next_ready_flash = self._next_ready_flash or 0
	if TimerManager:main():time() < self._next_ready_flash then
		return
	end
	self._next_ready_flash = TimerManager:main():time() + 3
	local animate_flash_ready = function(o)
		local center_x, center_y = o:center()
		local font_size = o:font_size()
		local color = o:color()
		over(0.14, function(p)
			o:set_color(math.lerp(color, tweak_data.screen_colors.important_1, p))
			o:set_font_size(font_size + 1 * p)
			o:set_rotation(math.sin(p * 360) * 0.2)
			if o:rotation() == 0 then
				o:set_rotation(0.1)
			end
		end)
		wait(0.01)
		over(0.14, function(p)
			o:set_color(math.lerp(tweak_data.screen_colors.important_1, color, p))
			o:set_font_size(font_size + 1 * (1 - p))
			o:set_rotation(math.sin((1 - p) * 360) * 0.2)
			if o:rotation() == 0 then
				o:set_rotation(0.01)
			end
		end)
		o:set_color(color)
		o:set_font_size(font_size)
		o:set_rotation(360)
	end
	self._ready_button:animate(animate_flash_ready)
end
function MissionBriefingGui:open_asset_buy(i, id)
	local params = {}
	params.asset_id = id
	params.yes_func = callback(self, self, "_buy_asset_callback", id)
	managers.menu:show_confirm_mission_asset_buy(params)
end
function MissionBriefingGui:_buy_asset_callback(asset_id)
	managers.assets:unlock_asset(asset_id)
end
function MissionBriefingGui:unlock_asset(asset_id)
	self._assets_item:unlock_asset_by_id(asset_id)
end
function MissionBriefingGui:create_asset_tab()
	local asset_ids = managers.assets:get_all_asset_ids(true)
	local assets_names = {}
	self._fullscreen_asset_background_h = self._fullscreen_panel:gradient({
		name = "asset_background_h",
		layer = 99,
		orientation = "horizontal",
		color = Color.black:with_alpha(0.1)
	})
	self._fullscreen_asset_background_h:add_gradient_point(0.25, Color.black:with_alpha(0.5))
	self._fullscreen_asset_background_h:add_gradient_point(0.75, Color.black:with_alpha(0.5))
	self._fullscreen_asset_background_h:add_gradient_point(0.5, Color.black:with_alpha(0.75))
	self._fullscreen_asset_background_v = self._fullscreen_panel:gradient({
		name = "asset_background_v",
		layer = 99,
		orientation = "vertical",
		color = Color.black:with_alpha(0.1)
	})
	self._fullscreen_asset_background_v:add_gradient_point(0.25, Color.black:with_alpha(0.5))
	self._fullscreen_asset_background_v:add_gradient_point(0.75, Color.black:with_alpha(0.5))
	self._fullscreen_asset_background_v:add_gradient_point(0.5, Color.black:with_alpha(0.75))
	self._fullscreen_asset_background_v:hide()
	self._fullscreen_asset_background_h:hide()
	self._fullscreen_assets_list = {}
	for i, asset_id in ipairs(asset_ids) do
		local asset_tweak_data = managers.assets:get_asset_tweak_data_by_id(asset_id)
		assets_names[i] = {
			managers.assets:get_asset_texture(asset_id),
			asset_tweak_data.name_id,
			managers.assets:get_asset_unlocked_by_id(asset_id),
			asset_id,
			managers.assets:get_asset_can_unlock_by_id(asset_id),
			managers.assets:get_asset_no_mystery_by_id(asset_id)
		}
		local asset = self._fullscreen_panel:bitmap({
			name = "asset_" .. tostring(i),
			texture = assets_names[i][1],
			w = 512,
			h = 512,
			layer = 100
		})
		local aspect = asset:texture_width() / math.max(asset:texture_height(), 1)
		local size = math.max(asset:texture_height(), self._panel:h())
		asset:set_size(size * aspect, size)
		asset:set_center(self._fullscreen_panel:w() / 2, self._fullscreen_panel:h() / 2)
		asset:hide()
		table.insert(self._fullscreen_assets_list, asset)
	end
	self._assets_item:create_assets(assets_names)
	if managers.preplanning:has_current_level_preplanning() then
		self._assets_item:add_preplanning_button()
	end
	self:chk_reduce_to_small_font()
end
function MissionBriefingGui:on_whisper_mode_changed()
	if self._description_item then
		self._description_item:on_whisper_mode_changed()
	end
end
function MissionBriefingGui:open_asset(asset_index)
	self._displaying_asset = asset_index
	local fullscreen_asset = self._fullscreen_assets_list[self._displaying_asset]
	if fullscreen_asset and alive(fullscreen_asset) then
		local animate_show = function(o)
			local start_alpha = o:alpha()
			over(0.1, function(p)
				o:set_alpha(math.lerp(start_alpha, 1, p))
			end)
		end
		fullscreen_asset:show()
		fullscreen_asset:stop()
		fullscreen_asset:animate(animate_show)
		self._fullscreen_asset_zoom = 1
		local cx, cy = fullscreen_asset:center()
		self._fullscreen_asset_background_v:show()
		self._fullscreen_asset_background_v:stop()
		self._fullscreen_asset_background_v:animate(animate_show)
		self._fullscreen_asset_background_h:show()
		self._fullscreen_asset_background_h:stop()
		self._fullscreen_asset_background_h:animate(animate_show)
		managers.menu_component:post_event("menu_enter")
	else
		self._displaying_asset = nil
	end
end
function MissionBriefingGui:close_asset()
	if not self._fullscreen_assets_list then
		return
	end
	local fullscreen_asset = self._fullscreen_assets_list[self._displaying_asset]
	if fullscreen_asset and alive(fullscreen_asset) then
		local animate_hide = function(o)
			local start_alpha = o:alpha()
			over(0.05, function(p)
				o:set_alpha(math.lerp(start_alpha, 0, p))
			end)
			o:hide()
		end
		fullscreen_asset:stop()
		fullscreen_asset:animate(animate_hide)
		self._fullscreen_asset_background_v:stop()
		self._fullscreen_asset_background_v:animate(animate_hide)
		self._fullscreen_asset_background_h:stop()
		self._fullscreen_asset_background_h:animate(animate_hide)
	end
	self._displaying_asset = nil
end
function MissionBriefingGui:zoom_asset(zoom)
	local fullscreen_asset = self._fullscreen_assets_list[self._displaying_asset]
	if not fullscreen_asset or not alive(fullscreen_asset) then
		return
	end
	if zoom == "in" then
		self._fullscreen_asset_zoom = math.min(self._fullscreen_asset_zoom + 0.1, 1.5)
	elseif zoom == "out" then
		self._fullscreen_asset_zoom = math.max(self._fullscreen_asset_zoom - 0.1, 0.5)
	end
	local cx, cy = fullscreen_asset:center()
end
function MissionBriefingGui:next_tab(no_sound)
	local new_selected_item = self._selected_item + 1
	return self:set_tab(new_selected_item, no_sound)
end
function MissionBriefingGui:prev_tab(no_sound)
	local new_selected_item = self._selected_item - 1
	return self:set_tab(new_selected_item, no_sound)
end
function MissionBriefingGui:set_tab(i, no_sound)
	if self._selected_item == i then
		return
	end
	i = math.clamp(i, 1, #self._items)
	if self._selected_item ~= i then
		if self._items[self._selected_item] then
			self._items[self._selected_item]:deselect()
		end
		self._selected_item = i
		self._items[self._selected_item]:select(no_sound)
		self._node:parameters().menu_component_data.selected_tab = self._selected_item
		if self._prev_page then
			self._prev_page:set_visible(self._selected_item > 1)
		end
		if self._next_page then
			self._next_page:set_visible(self._selected_item < #self._items)
		end
	end
	return self._selected_item
end
function MissionBriefingGui:mouse_pressed(button, x, y)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._displaying_asset then
		if button == Idstring("mouse wheel down") then
			self:zoom_asset("out")
			return
		elseif button == Idstring("mouse wheel up") then
			self:zoom_asset("in")
			return
		end
		self:close_asset()
		return
	end
	if button == Idstring("mouse wheel down") then
		self:next_tab(true)
		return
	elseif button == Idstring("mouse wheel up") then
		self:prev_tab(true)
		return
	end
	if button ~= Idstring("0") then
		return
	end
	for index, tab in ipairs(self._items) do
		local pressed, cost = tab:mouse_pressed(button, x, y)
		if pressed == true then
			self:set_tab(index)
		elseif type(pressed) == "number" then
			if cost then
				if type(cost) == "number" then
					self:open_asset_buy(pressed, tab:get_asset_id(pressed))
				end
			else
				self:open_asset(pressed)
			end
		end
	end
	if self._ready_button:inside(x, y) or self._ready_tick_box:inside(x, y) then
		self:on_ready_pressed()
	end
	return self._selected_item
end
function MissionBriefingGui:set_enabled(state)
	self._enabled = state
	if self._jukebox_item then
		self._jukebox_item:set_enabled(state)
	end
end
function MissionBriefingGui:mouse_moved(x, y)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false, "arrow"
	end
	if self._displaying_asset then
		return false, "arrow"
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return false, "arrow"
	end
	local mouse_over_tab = false
	for _, tab in ipairs(self._items) do
		local selected, highlighted = tab:mouse_moved(x, y)
		if highlighted and not selected then
			mouse_over_tab = true
		end
	end
	if mouse_over_tab then
		return true, "link"
	end
	if self._ready_button:inside(x, y) or self._ready_tick_box:inside(x, y) then
		if not self._ready_highlighted then
			self._ready_highlighted = true
			self._ready_button:set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
		end
		return true, "link"
	elseif self._ready_highlighted then
		self._ready_button:set_color(tweak_data.screen_colors.button_stage_3)
		self._ready_highlighted = false
	end
	if managers.hud._hud_mission_briefing and managers.hud._hud_mission_briefing._backdrop then
		managers.hud._hud_mission_briefing._backdrop:mouse_moved(x, y)
	end
	return false, "arrow"
end
function MissionBriefingGui:set_description_text_id(text_id)
	self._node:parameters().menu_component_data.saved_descriptions = self._node:parameters().menu_component_data.saved_descriptions or {}
	table.insert(self._node:parameters().menu_component_data.saved_descriptions, text_id)
	self:add_description_text(managers.localization:text(text_id))
end
function MissionBriefingGui:add_description_text(text)
	self._description_item:add_description_text(text)
end
function MissionBriefingGui:set_description_text(text)
	self._description_item:set_description_text(text)
end
function MissionBriefingGui:set_slot_outfit(slot, criminal_name, outfit)
	if self._team_loadout_item then
		self._team_loadout_item:set_slot_outfit(slot, criminal_name, outfit)
	end
end
function MissionBriefingGui:on_ready_pressed(ready)
	if not managers.network:session() then
		return
	end
	local ready_changed = true
	if ready ~= nil then
		ready_changed = self._ready ~= ready
		self._ready = ready
	else
		self._ready = not self._ready
	end
	managers.network:session():local_peer():set_waiting_for_player_ready(self._ready)
	managers.network:session():chk_send_local_player_ready()
	managers.network:game():on_set_member_ready(managers.network:session():local_peer():id(), self._ready, ready_changed)
	local ready_text = self:ready_text()
	self._ready_button:set_text(ready_text)
	self._fullscreen_panel:child("ready_big_text"):set_text(ready_text)
	self._ready_tick_box:set_image(self._ready and "guis/textures/pd2/mission_briefing/gui_tickbox_ready" or "guis/textures/pd2/mission_briefing/gui_tickbox")
	if ready_changed then
		if self._ready then
			if managers.menu:active_menu() and managers.menu:active_menu().logic and managers.menu:active_menu().logic:selected_node() then
				local item = managers.menu:active_menu().logic:selected_node():item("choose_jukebox_your_choice")
				if item then
					item:set_icon_visible(false)
				end
			end
			managers.menu_component:post_event("box_tick")
		else
			managers.menu_component:post_event("box_untick")
		end
	end
end
function MissionBriefingGui:input_focus()
	if self._jukebox_item then
		if self._jukebox_item.displayed then
			local gamepad_used = managers.menu:get_controller():get_default_controller_id() ~= "keyboard"
			if not managers.menu:get_controller():get_input_bool("previous_page") and (not gamepad_used or not managers.menu:get_controller():get_input_bool("menu_toggle_ready")) then
				return false
			end
		end
		if self._jukebox_item.closing then
			self._jukebox_item.closing = nil
			return false
		end
	end
	return self._displaying_asset and 1 or self._enabled
end
function MissionBriefingGui:scroll_up()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_right()
	end
end
function MissionBriefingGui:scroll_down()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_left()
	end
end
function MissionBriefingGui:move_up()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_up()
	end
end
function MissionBriefingGui:move_down()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_down()
	end
end
function MissionBriefingGui:move_left()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_left()
	end
end
function MissionBriefingGui:move_right()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	if self._items[self._selected_item] then
		self._items[self._selected_item]:move_right()
	end
end
function MissionBriefingGui:confirm_pressed()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false
	end
	if self._displaying_asset then
		self:close_asset()
		return true
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return false
	end
	if self._items[self._selected_item] then
		local selected, cost = self._items[self._selected_item]:confirm_pressed()
		if selected and type(selected) == "number" then
			if cost then
				if type(cost) == "number" then
					self:open_asset_buy(selected, self._items[self._selected_item]:get_asset_id(selected))
					return true
				end
			else
				self:open_asset(selected)
				return true
			end
		elseif selected then
			return false
		end
	end
	if managers.menu:is_pc_controller() then
		self:on_ready_pressed()
		return true
	end
	return false
end
function MissionBriefingGui:back_pressed()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return false
	end
	if self._displaying_asset then
		self:close_asset()
		return true
	end
	return false
end
function MissionBriefingGui:special_btn_pressed(button)
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return false
	end
	if self._displaying_asset then
		self:close_asset()
		return false
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return false
	end
	if button == Idstring("menu_toggle_ready") then
		self:on_ready_pressed()
		return true
	elseif button == Idstring("menu_toggle_pp_breakdown") and managers.preplanning:has_current_level_preplanning() and self._assets_item and self._items[self._selected_item] == self._assets_item then
		self._assets_item:open_preplanning()
	end
	return false
end
function MissionBriefingGui:accept_input(accept)
	print("MissionBriefingGui:accept_input", accept)
end
function MissionBriefingGui:next_page()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	self:next_tab(false)
end
function MissionBriefingGui:previous_page()
	if not alive(self._panel) or not alive(self._fullscreen_panel) or not self._enabled then
		return
	end
	if self._displaying_asset then
		return
	end
	if game_state_machine:current_state().blackscreen_started and game_state_machine:current_state():blackscreen_started() then
		return
	end
	self:prev_tab(false)
end
function MissionBriefingGui:hide()
	self._enabled = false
	self:close_asset()
	self._panel:set_alpha(0.5)
	self._fullscreen_panel:set_alpha(0.5)
end
function MissionBriefingGui:show()
	self._enabled = true
	self._panel:set_alpha(1)
	self._fullscreen_panel:set_alpha(1)
end
function MissionBriefingGui:update_tab_positions()
	for i, item in ipairs(self._items) do
		item:update_tab_position()
	end
end
function MissionBriefingGui:close()
	print("[MissionBriefingGui:close]")
	WalletGuiObject.close_wallet(self._safe_workspace:panel())
	managers.music:track_listen_stop()
	self:close_asset()
	local requested_asset_textures = self._assets_item and self._assets_item:get_requested_textures()
	if requested_asset_textures then
		for key, data in pairs(requested_asset_textures) do
			managers.menu_component:unretrieve_texture(data.texture, data.index)
		end
	end
	if self._panel and alive(self._panel) then
		self._panel:parent():remove(self._panel)
	end
	if self._fullscreen_panel and alive(self._fullscreen_panel) then
		self._fullscreen_panel:parent():remove(self._fullscreen_panel)
	end
end
function MissionBriefingGui:reload_loadout()
	self._node:parameters().menu_component_data = self._node:parameters().menu_component_data or {}
	self._node:parameters().menu_component_data.loadout = self._node:parameters().menu_component_data.loadout or {}
	local loadout_data = self._node:parameters().menu_component_data.loadout
	if SystemInfo:platform() == Idstring("X360") then
		if loadout_data.changing_loadout == "primary" and loadout_data.current_slot ~= managers.blackmarket:equipped_weapon_slot("primaries") then
			managers.blackmarket:preload_primary_weapon()
		elseif loadout_data.changing_loadout == "secondary" and loadout_data.current_slot ~= managers.blackmarket:equipped_weapon_slot("secondaries") then
			managers.blackmarket:preload_secondary_weapon()
		end
	end
	loadout_data.changing_loadout = nil
	loadout_data.current_slot = nil
	self._new_loadout_item:destroy()
	self._new_loadout_item = nil
	self._items[3] = nil
	self._new_loadout_item = NewLoadoutTab:new(self._panel, managers.localization:to_upper_text("menu_loadout"), 3, loadout_data)
	self._items[3] = self._new_loadout_item
	self:chk_reduce_to_small_font()
	self:set_tab(self._node:parameters().menu_component_data.selected_tab, true)
	self._items[self._selected_item]:select(true)
	WalletGuiObject.set_wallet(self._safe_workspace:panel(), 10)
end
function MissionBriefingGui:reload()
	self:close()
	MissionBriefingGui.init(self, self._safe_workspace, self._full_workspace, self._node)
end
JukeboxItem = JukeboxItem or class(MissionBriefingTabItem)
function JukeboxItem:init(panel, text, i, assets_names, max_assets, menu_component_data)
	JukeboxItem.super.init(self, panel, text, i)
	self._panel:set_w(self._main_panel:w())
	self._panel:set_right(self._main_panel:w())
	self._my_menu_component_data = menu_component_data
end
function JukeboxItem:post_init()
end
function JukeboxItem:select(no_sound)
	JukeboxItem.super.select(self, no_sound)
	if not self.displayed then
		if managers.menu:active_menu() then
			managers.menu:open_node("jukebox")
		end
		self.displayed = true
		managers.music:track_listen_start("stop_all_music")
	end
end
function JukeboxItem:deselect()
	self.closing = true
	if managers.menu:active_menu() and managers.menu:active_menu().logic:selected_node() then
		managers.menu:active_menu().logic:selected_node():parameters().block_back = false
		managers.menu:back(true)
	end
	self.displayed = nil
	managers.music:track_listen_stop()
	JukeboxItem.super.deselect(self)
end
function JukeboxItem:set_enabled(state)
	if not self.displayed then
		return
	end
	if managers.menu:active_menu() and managers.menu:active_menu().logic:selected_node() then
		local item_list = managers.menu:active_menu().logic:selected_node():items()
		for _, item_data in ipairs(item_list) do
			item_data:set_enabled(state)
		end
	end
end
