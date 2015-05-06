HUDAssaultCorner = HUDAssaultCorner or class()
function HUDAssaultCorner:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
	if self._hud_panel:child("assault_panel") then
		self._hud_panel:remove(self._hud_panel:child("assault_panel"))
	end
	local size = 200
	local assault_panel = self._hud_panel:panel({
		visible = false,
		name = "assault_panel",
		w = 400,
		h = 100
	})
	assault_panel:set_top(0)
	assault_panel:set_right(self._hud_panel:w())
	self._assault_color = Color(1, 1, 1, 0)
	local icon_assaultbox = assault_panel:bitmap({
		halign = "right",
		valign = "top",
		color = Color.yellow,
		name = "icon_assaultbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_assaultbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_assaultbox:set_right(icon_assaultbox:parent():w())
	self._bg_box = HUDBGBox_create(assault_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._assault_color,
		blend_mode = "add"
	})
	self._bg_box:set_right(icon_assaultbox:left() - 3)
	local yellow_tape = assault_panel:rect({
		visible = false,
		name = "yellow_tape",
		h = tweak_data.hud.location_font_size * 1.5,
		w = size * 3,
		color = Color(1, 0.8, 0),
		layer = 1
	})
	yellow_tape:set_center(10, 10)
	yellow_tape:set_rotation(30)
	yellow_tape:set_blend_mode("add")
	assault_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
	if self._hud_panel:child("hostages_panel") then
		self._hud_panel:remove(self._hud_panel:child("hostages_panel"))
	end
	local hostages_panel = self._hud_panel:panel({
		name = "hostages_panel",
		w = size,
		h = size,
		x = self._hud_panel:w() - size
	})
	self._hostages_bg_box = HUDBGBox_create(hostages_panel, {
		w = 38,
		h = 38,
		x = 0,
		y = 0
	}, {})
	self._hostages_bg_box:set_right(hostages_panel:w())
	local num_hostages = self._hostages_bg_box:text({
		name = "num_hostages",
		text = "0",
		valign = "center",
		align = "center",
		vertical = "center",
		w = self._hostages_bg_box:w(),
		h = self._hostages_bg_box:h(),
		layer = 1,
		x = 0,
		y = 0,
		color = Color.white,
		font = tweak_data.hud_corner.assault_font,
		font_size = tweak_data.hud_corner.numhostages_size
	})
	local hostages_icon = hostages_panel:bitmap({
		name = "hostages_icon",
		texture = "guis/textures/pd2/hud_icon_hostage",
		valign = "top",
		layer = 1,
		x = 0,
		y = 0
	})
	hostages_icon:set_right(self._hostages_bg_box:left())
	hostages_icon:set_center_y(self._hostages_bg_box:h() / 2)
	if self._hud_panel:child("point_of_no_return_panel") then
		self._hud_panel:remove(self._hud_panel:child("point_of_no_return_panel"))
	end
	local size = 300
	local point_of_no_return_panel = self._hud_panel:panel({
		visible = false,
		name = "point_of_no_return_panel",
		w = size,
		h = 40,
		x = self._hud_panel:w() - size
	})
	self._noreturn_color = Color(1, 1, 0, 0)
	local icon_noreturnbox = point_of_no_return_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._noreturn_color,
		name = "icon_noreturnbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_noreturnbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_noreturnbox:set_right(icon_noreturnbox:parent():w())
	self._noreturn_bg_box = HUDBGBox_create(point_of_no_return_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._noreturn_color,
		blend_mode = "add"
	})
	self._noreturn_bg_box:set_right(icon_noreturnbox:left() - 3)
	local w = point_of_no_return_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	local point_of_no_return_text = self._noreturn_bg_box:text({
		name = "point_of_no_return_text",
		text = "",
		blend_mode = "add",
		layer = 1,
		valign = "center",
		align = "right",
		vertical = "center",
		x = 0,
		y = 0,
		color = self._noreturn_color,
		font_size = tweak_data.hud_corner.noreturn_size,
		font = tweak_data.hud_corner.assault_font
	})
	point_of_no_return_text:set_text(utf8.to_upper(managers.localization:text("hud_assault_point_no_return_in", {time = ""})))
	point_of_no_return_text:set_size(self._noreturn_bg_box:w(), self._noreturn_bg_box:h())
	local point_of_no_return_timer = self._noreturn_bg_box:text({
		name = "point_of_no_return_timer",
		text = "",
		blend_mode = "add",
		layer = 1,
		valign = "center",
		align = "center",
		vertical = "center",
		x = 0,
		y = 0,
		color = self._noreturn_color,
		font_size = tweak_data.hud_corner.noreturn_size,
		font = tweak_data.hud_corner.assault_font
	})
	local _, _, w, h = point_of_no_return_timer:text_rect()
	point_of_no_return_timer:set_size(46, self._noreturn_bg_box:h())
	point_of_no_return_timer:set_right(point_of_no_return_timer:parent():w())
	point_of_no_return_text:set_right(math.round(point_of_no_return_timer:left()))
	if self._hud_panel:child("casing_panel") then
		self._hud_panel:remove(self._hud_panel:child("casing_panel"))
	end
	local size = 300
	local casing_panel = self._hud_panel:panel({
		visible = false,
		name = "casing_panel",
		w = size,
		h = 40,
		x = self._hud_panel:w() - size
	})
	self._casing_color = Color.white
	local icon_casingbox = casing_panel:bitmap({
		halign = "right",
		valign = "top",
		color = self._casing_color,
		name = "icon_casingbox",
		blend_mode = "add",
		visible = true,
		layer = 0,
		texture = "guis/textures/pd2/hud_icon_stealthbox",
		x = 0,
		y = 0,
		w = 24,
		h = 24
	})
	icon_casingbox:set_right(icon_casingbox:parent():w())
	self._casing_bg_box = HUDBGBox_create(casing_panel, {
		w = 242,
		h = 38,
		x = 0,
		y = 0
	}, {
		color = self._casing_color,
		blend_mode = "add"
	})
	self._casing_bg_box:set_right(icon_casingbox:left() - 3)
	local w = casing_panel:w()
	local size = 200 - tweak_data.hud.location_font_size
	casing_panel:panel({
		name = "text_panel",
		layer = 1,
		w = yellow_tape:w()
	}):set_center(yellow_tape:center())
end
function HUDAssaultCorner:_animate_assault(bg_box)
	local assault_panel = self._hud_panel:child("assault_panel")
	local icon_assaultbox = assault_panel:child("icon_assaultbox")
	icon_assaultbox:stop()
	icon_assaultbox:animate(callback(self, self, "_show_icon_assaultbox"))
	self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, function()
	end, {
		attention_color = self._assault_color,
		attention_forever = true
	})
	local text_panel = self._bg_box:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"))
end
function HUDAssaultCorner:_animate_text(text_panel, bg_box, color)
	local text_list = bg_box or self._bg_box:script().text_list
	local text_index = 0
	local texts = {}
	local padding = 10
	local function create_new_text(text_panel, text_list, text_index, texts)
		if texts[text_index] and texts[text_index].text then
			text_panel:remove(texts[text_index].text)
			texts[text_index] = nil
		end
		local text_id = text_list[text_index]
		local text_string = ""
		if type(text_id) == "string" then
			text_string = managers.localization:to_upper_text(text_id)
		elseif text_id == Idstring("risk") then
			for i = 1, managers.job:current_difficulty_stars() do
				text_string = text_string .. managers.localization:get_default_macro("BTN_SKULL")
			end
		end
		local text = text_panel:text({
			text = text_string,
			layer = 1,
			align = "center",
			vertical = "center",
			blend_mode = "add",
			color = color or self._assault_color,
			font_size = tweak_data.hud_corner.assault_size,
			font = tweak_data.hud_corner.assault_font,
			w = 10,
			h = 10
		})
		local _, _, w, h = text:text_rect()
		text:set_size(w, h)
		texts[text_index] = {
			x = text_panel:w() + w * 0.5 + padding * 2,
			text = text
		}
	end
	while true do
		local dt = coroutine.yield()
		local last_text = texts[text_index]
		if last_text and last_text.text then
			if last_text.x + last_text.text:w() * 0.5 + padding < text_panel:w() then
				text_index = text_index % #text_list + 1
				create_new_text(text_panel, text_list, text_index, texts)
			end
		else
			text_index = text_index % #text_list + 1
			create_new_text(text_panel, text_list, text_index, texts)
		end
		local speed = 90
		for i, data in pairs(texts) do
			if data.text then
				data.x = data.x - dt * speed
				data.text:set_center_x(data.x)
				data.text:set_center_y(text_panel:h() * 0.5)
				if 0 > data.x + data.text:w() * 0.5 then
					text_panel:remove(data.text)
					data.text = nil
				end
			end
		end
	end
end
function HUDAssaultCorner:sync_start_assault(data)
	if self._point_of_no_return then
		return
	end
	self:_hide_hostages()
	if managers.job:current_difficulty_stars() > 0 then
		local ids_risk = Idstring("risk")
		self:_start_assault({
			"hud_assault_assault",
			"hud_assault_end_line",
			ids_risk,
			"hud_assault_end_line",
			"hud_assault_assault",
			"hud_assault_end_line",
			ids_risk,
			"hud_assault_end_line"
		})
	else
		self:_start_assault({
			"hud_assault_assault",
			"hud_assault_end_line",
			"hud_assault_assault",
			"hud_assault_end_line",
			"hud_assault_assault",
			"hud_assault_end_line"
		})
	end
end
function HUDAssaultCorner:sync_end_assault(result)
	if self._point_of_no_return then
		return
	end
	self:_end_assault()
end
function HUDAssaultCorner:_start_assault(text_list)
	text_list = text_list or {""}
	local assault_panel = self._hud_panel:child("assault_panel")
	local text_panel = assault_panel:child("text_panel")
	text_panel:script().text_list = {}
	self._bg_box:script().text_list = {}
	for _, text_id in ipairs(text_list) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(self._bg_box:script().text_list, text_id)
	end
	self._assault = true
	if self._bg_box:child("text_panel") then
		self._bg_box:child("text_panel"):stop()
		self._bg_box:child("text_panel"):clear()
	else
		self._bg_box:panel({name = "text_panel"})
	end
	self._bg_box:child("bg"):stop()
	self._bg_box:stop()
	assault_panel:set_visible(true)
	self._bg_box:animate(callback(self, self, "_animate_assault"))
end
function HUDAssaultCorner:_end_assault()
	if not self._assault then
		return
	end
	self._assault = false
	self._bg_box:child("text_panel"):stop()
	self._bg_box:child("text_panel"):clear()
	local function close_done()
		self._bg_box:set_visible(false)
		local icon_assaultbox = self._hud_panel:child("assault_panel"):child("icon_assaultbox")
		icon_assaultbox:stop()
		icon_assaultbox:animate(callback(self, self, "_hide_icon_assaultbox"))
	end
	self._bg_box:stop()
	self._bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
end
function HUDAssaultCorner:_show_icon_assaultbox(icon_assaultbox)
	local TOTAL_T = 2
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.sin(t * 360 * 2))))
		icon_assaultbox:set_alpha(alpha)
	end
	icon_assaultbox:set_alpha(1)
end
function HUDAssaultCorner:_hide_icon_assaultbox(icon_assaultbox)
	local TOTAL_T = 1
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.cos(t * 360 * 2))))
		icon_assaultbox:set_alpha(alpha)
	end
	icon_assaultbox:set_alpha(0)
	self:_show_hostages()
end
function HUDAssaultCorner:_show_hostages()
	if not self._point_of_no_return then
		self._hud_panel:child("hostages_panel"):show()
	end
end
function HUDAssaultCorner:_hide_hostages()
	self._hud_panel:child("hostages_panel"):hide()
end
function HUDAssaultCorner:set_control_info(data)
	self._hostages_bg_box:child("num_hostages"):set_text("" .. data.nr_hostages)
	local bg = self._hostages_bg_box:child("bg")
	bg:stop()
	bg:animate(callback(nil, _G, "HUDBGBox_animate_bg_attention"), {})
end
function HUDAssaultCorner:feed_point_of_no_return_timer(time, is_inside)
	time = math.floor(time)
	local minutes = math.floor(time / 60)
	local seconds = math.round(time - minutes * 60)
	local text = (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
	self._noreturn_bg_box:child("point_of_no_return_timer"):set_text(text)
end
function HUDAssaultCorner:show_point_of_no_return_timer()
	local delay_time = self._assault and 1.2 or 0
	self:_end_assault()
	local point_of_no_return_panel = self._hud_panel:child("point_of_no_return_panel")
	self._hud_panel:child("hostages_panel"):set_visible(false)
	point_of_no_return_panel:stop()
	point_of_no_return_panel:animate(callback(self, self, "_animate_show_noreturn"), delay_time)
	self._point_of_no_return = true
end
function HUDAssaultCorner:hide_point_of_no_return_timer()
	self._noreturn_bg_box:stop()
	self._hud_panel:child("point_of_no_return_panel"):set_visible(false)
	self._hud_panel:child("hostages_panel"):set_visible(true)
	self._point_of_no_return = false
end
function HUDAssaultCorner:flash_point_of_no_return_timer(beep)
	local function flash_timer(o)
		local t = 0
		while t < 0.5 do
			t = t + coroutine.yield()
			local n = 1 - math.sin(t * 180)
			local r = math.lerp(1 or self._point_of_no_return_color.r, 1, n)
			local g = math.lerp(0 or self._point_of_no_return_color.g, 0.8, n)
			local b = math.lerp(0 or self._point_of_no_return_color.b, 0.2, n)
			o:set_color(Color(r, g, b))
			o:set_font_size(math.lerp(tweak_data.hud_corner.noreturn_size, tweak_data.hud_corner.noreturn_size * 1.25, n))
		end
	end
	local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
	point_of_no_return_timer:animate(flash_timer)
end
function HUDAssaultCorner:show_casing()
	local delay_time = self._assault and 1.2 or 0
	self:_end_assault()
	local casing_panel = self._hud_panel:child("casing_panel")
	local text_panel = casing_panel:child("text_panel")
	text_panel:script().text_list = {}
	self._casing_bg_box:script().text_list = {}
	for _, text_id in ipairs({
		"hud_casing_mode_ticker",
		"hud_assault_end_line",
		"hud_casing_mode_ticker",
		"hud_assault_end_line"
	}) do
		table.insert(text_panel:script().text_list, text_id)
		table.insert(self._casing_bg_box:script().text_list, text_id)
	end
	if self._casing_bg_box:child("text_panel") then
		self._casing_bg_box:child("text_panel"):stop()
		self._casing_bg_box:child("text_panel"):clear()
	else
		self._casing_bg_box:panel({name = "text_panel"})
	end
	self._casing_bg_box:child("bg"):stop()
	self._hud_panel:child("hostages_panel"):set_visible(false)
	casing_panel:stop()
	casing_panel:animate(callback(self, self, "_animate_show_casing"), delay_time)
	self._casing = true
end
function HUDAssaultCorner:hide_casing()
	if self._casing_bg_box:child("text_panel") then
		self._casing_bg_box:child("text_panel"):stop()
		self._casing_bg_box:child("text_panel"):clear()
	end
	local icon_casingbox = self._hud_panel:child("casing_panel"):child("icon_casingbox")
	icon_casingbox:stop()
	local function close_done()
		self._casing_bg_box:set_visible(false)
		local icon_casingbox = self._hud_panel:child("casing_panel"):child("icon_casingbox")
		icon_casingbox:stop()
		icon_casingbox:animate(callback(self, self, "_hide_icon_assaultbox"))
	end
	self._casing_bg_box:stop()
	self._casing_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_close_left"), close_done)
	self._casing = false
end
function HUDAssaultCorner:_animate_simple_text(text)
	local _, _, w, _ = text:text_rect()
	text:set_w(w + 10)
	text:set_visible(true)
	text:set_x(text:parent():w())
	local x = text:x()
	local t = 0
	local speed = 90
	while true do
		local dt = coroutine.yield()
		t = t + dt
		x = x - speed * dt
		text:set_x(x)
		if 0 > text:right() then
			text:set_x(text:parent():w())
			x = text:x()
		end
	end
end
function HUDAssaultCorner:_animate_show_casing(casing_panel, delay_time)
	local icon_casingbox = casing_panel:child("icon_casingbox")
	wait(delay_time)
	casing_panel:set_visible(true)
	icon_casingbox:stop()
	icon_casingbox:animate(callback(self, self, "_show_icon_assaultbox"))
	local open_done = function()
	end
	self._casing_bg_box:stop()
	self._casing_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, open_done, {
		attention_color = self._casing_color,
		attention_forever = true
	})
	local text_panel = self._casing_bg_box:child("text_panel")
	text_panel:stop()
	text_panel:animate(callback(self, self, "_animate_text"), self._casing_bg_box, Color.white)
end
function HUDAssaultCorner:_animate_show_noreturn(point_of_no_return_panel, delay_time)
	local icon_noreturnbox = point_of_no_return_panel:child("icon_noreturnbox")
	local point_of_no_return_text = self._noreturn_bg_box:child("point_of_no_return_text")
	point_of_no_return_text:set_visible(false)
	local point_of_no_return_timer = self._noreturn_bg_box:child("point_of_no_return_timer")
	point_of_no_return_timer:set_visible(false)
	wait(delay_time)
	point_of_no_return_panel:set_visible(true)
	icon_noreturnbox:stop()
	icon_noreturnbox:animate(callback(self, self, "_show_icon_assaultbox"))
	local function open_done()
		point_of_no_return_text:animate(callback(self, self, "_animate_show_texts"), {point_of_no_return_text, point_of_no_return_timer})
	end
	self._noreturn_bg_box:stop()
	self._noreturn_bg_box:animate(callback(nil, _G, "HUDBGBox_animate_open_left"), 0.75, 242, open_done, {
		attention_color = self._casing_color,
		attention_forever = true
	})
end
function HUDAssaultCorner:_animate_show_texts(anim_object, texts)
	for _, text in ipairs(texts) do
		text:set_visible(true)
	end
	local TOTAL_T = 0.5
	local t = TOTAL_T
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local alpha = math.round(math.abs((math.sin(t * 360 * 3))))
		for _, text in ipairs(texts) do
			text:set_alpha(alpha)
		end
	end
	for _, text in ipairs(texts) do
		text:set_alpha(1)
	end
end
function HUDAssaultCorner:test()
	self._hud_panel:child("point_of_no_return_panel"):animate(callback(self, self, "_animate_test_point_of_no_return"))
end
function HUDAssaultCorner:_animate_test_point_of_no_return(panel)
	managers.hud:show_point_of_no_return_timer()
	local t = 15
	local prev_time = t
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		local sec = math.floor(t)
		if sec < math.floor(prev_time) then
			prev_time = sec
			managers.hud:flash_point_of_no_return_timer(sec <= 10)
		end
		managers.hud:feed_point_of_no_return_timer(math.max(t, 0), false)
	end
	managers.hud:hide_point_of_no_return_timer()
end
