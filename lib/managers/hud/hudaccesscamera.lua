HUDAccessCamera = HUDAccessCamera or class()
function HUDAccessCamera:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
	self._hud_panel:clear()
	self._full_hud_panel:clear()
	self._markers = {}
	local legend_rect_bg = self._hud_panel:rect({
		name = "legend_rect_bg",
		color = Color.black,
		layer = 0,
		h = 32,
		w = self._hud_panel:w() / 2,
		x = self._hud_panel:w() / 4,
		y = hud.panel:h() - 64,
		valign = "bottom"
	})
	local legend_prev = self._hud_panel:text({
		name = "legend_prev",
		text_id = "hud_prev_camera",
		x = legend_rect_bg:x() + 10,
		y = -32,
		font_size = 28,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "left",
		vertical = "bottom",
		valign = "bottom",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	local legend_next = self._hud_panel:text({
		name = "legend_next",
		text = "[MOUSE 1]>",
		x = legend_rect_bg:right() - 10,
		y = -32,
		font_size = 28,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "right",
		vertical = "bottom",
		valign = "bottom",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	legend_next:set_right(legend_rect_bg:right() - 10)
	local legend_exit = self._hud_panel:text({
		name = "legend_exit",
		text = "EXIT[SPACE]",
		x = 0,
		y = -32,
		font_size = 28,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "center",
		vertical = "bottom",
		valign = "bottom",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	legend_exit:set_center_x(legend_rect_bg:center_x())
	self._hud_panel:text({
		x = 10,
		name = "camera_name",
		text = "",
		font_size = 32,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "left",
		vertical = "bottom",
		valign = "bottom",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._hud_panel:text({
		x = -10,
		name = "date",
		text = "",
		font_size = 32,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "right",
		vertical = "bottom",
		valign = "bottom",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._hud_panel:rect({
		name = "rect_bg",
		color = Color.black,
		layer = 0,
		h = 32,
		y = hud.panel:h() - 32,
		valign = "bottom"
	})
	self._hud_panel:rect({
		name = "destroyed_rect_bg",
		visible = false,
		color = Color.black,
		layer = 0,
		h = 32
	})
	self._hud_panel:text({
		x = 10,
		name = "destroyed_text",
		visible = false,
		text = "FEED LOST",
		font_size = 32,
		font = tweak_data.hud.medium_font,
		color = Color.white,
		align = "left",
		vertical = "top",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._full_hud_panel:rect({
		name = "destroyed_rect",
		visible = false,
		color = Color(0.5, 0.5, 0.5),
		layer = -1,
		valign = "scale"
	})
	local size = self._full_hud_panel:w() + 50
	self._full_hud_panel:bitmap({
		name = "noise",
		texture = "core/textures/noise",
		color = Color(0.2, 0, 0, 0),
		layer = 3,
		wrap_mode = "wrap",
		w = size,
		h = size,
		valign = "scale",
		halign = "scale"
	})
	self._full_hud_panel:child("noise"):set_texture_rect(0, 0, size, size)
	self._full_hud_panel:bitmap({
		x = 0,
		y = 0,
		name = "noise2",
		texture = "core/textures/noise",
		color = Color(0.2, 0, 0, 0),
		layer = 3,
		wrap_mode = "wrap",
		w = size,
		h = size,
		valign = "scale",
		halign = "scale"
	})
	self._full_hud_panel:child("noise2"):set_texture_rect(0, 0, size, size)
end
function HUDAccessCamera:start()
	local prev = "hud_prev_camera"
	local next = "hud_next_camera"
	self._hud_panel:child("legend_prev"):set_text(utf8.to_upper(managers.localization:text(prev, {
		BTN_PRIMARY = managers.localization:btn_macro("primary_attack")
	})))
	self._hud_panel:child("legend_next"):set_text(utf8.to_upper(managers.localization:text(next, {
		BTN_SECONDARY = managers.localization:btn_macro("secondary_attack")
	})))
	self._hud_panel:child("legend_exit"):set_text(utf8.to_upper(managers.localization:text("hud_exit_camera", {
		BTN_JUMP = managers.localization:btn_macro("jump")
	})))
	self._active = true
	self._hud_panel:animate(callback(self, self, "_animate_date"))
end
function HUDAccessCamera:stop()
	self._active = false
end
function HUDAccessCamera:set_destroyed(destroyed, no_feed)
	self._full_hud_panel:child("destroyed_rect"):set_visible(destroyed)
	self._hud_panel:child("destroyed_rect_bg"):set_visible(destroyed)
	self._hud_panel:child("destroyed_text"):set_text(managers.localization:text(no_feed and "hud_access_camera_no_feed" or "hud_access_camera_feed_lost"))
	self._hud_panel:child("destroyed_text"):set_visible(destroyed)
end
function HUDAccessCamera:set_camera_name(name)
	self._hud_panel:child("camera_name"):set_text(utf8.to_upper(name))
end
function HUDAccessCamera:set_date(date)
	self._hud_panel:child("date"):set_text(date)
end
function HUDAccessCamera:_animate_date()
	while self._active do
		local dt = coroutine.yield()
		self:set_date(Application:date("%Y-%m-%d %H:%M:%S"))
		self._full_hud_panel:child("noise"):set_x(-math.random(50))
		self._full_hud_panel:child("noise"):set_y(-math.random(50))
	end
end
function HUDAccessCamera:draw_marker(i, pos)
	self._markers = self._markers or {}
	if not self._markers[i] then
		self._markers[i] = self._full_hud_panel:bitmap({
			texture = "guis/textures/access_camera_marker",
			color = Color.white,
			layer = -2,
			x = pos.x,
			y = pos.y
		})
	end
	self._markers[i]:set_center(pos.x, pos.y)
end
function HUDAccessCamera:max_markers(amount)
	while amount < #self._markers do
		local obj = table.remove(self._markers, amount + 1)
		self._full_hud_panel:remove(obj)
	end
end
