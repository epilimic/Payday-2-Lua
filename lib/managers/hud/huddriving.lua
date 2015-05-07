HUDDriving = HUDDriving or class()
function HUDDriving:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel
	self._hud_panel:clear()
	self._full_hud_panel:clear()
	self._markers = {}
	local y_pos = -90
	local legend_rect_bg = self._hud_panel:rect({
		name = "legend_rect_bg",
		color = Color.black,
		layer = 0,
		h = 32,
		w = self._hud_panel:w() - 300,
		x = 150,
		y = hud.panel:h() - 120,
		valign = "bottom"
	})
	self._hud_panel:text({
		name = "value_speed",
		text = "100 kmph",
		x = 0,
		y = y_pos,
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
	self._hud_panel:text({
		name = "value_RPM",
		text = "7200",
		x = legend_rect_bg:x() + 10,
		y = y_pos,
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
	self._hud_panel:text({
		name = "value_gear",
		text = "N",
		x = -170,
		y = y_pos,
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
end
function HUDDriving:start()
	self._active = true
end
function HUDDriving:stop()
	self._active = false
end
function HUDDriving:set_vehicle_state(speed, rpm, gear)
	self._hud_panel:child("value_speed"):set_text(string.format("%d", speed) .. " km/h")
	self._hud_panel:child("value_RPM"):set_text(rpm .. " rpm")
	self._hud_panel:child("value_gear"):set_text(gear)
end
