HUDHeistTimer = HUDHeistTimer or class()
function HUDHeistTimer:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("heist_timer_panel") then
		self._hud_panel:remove(self._hud_panel:child("heist_timer_panel"))
	end
	self._heist_timer_panel = self._hud_panel:panel({
		visible = true,
		name = "heist_timer_panel",
		h = 40,
		y = 0,
		valign = "top",
		layer = 0
	})
	self._timer_text = self._heist_timer_panel:text({
		name = "timer_text",
		text = "00:00",
		font_size = 28,
		font = tweak_data.hud.medium_font_noshadow,
		color = Color.white,
		align = "center",
		vertical = "top",
		layer = 1,
		wrap = false,
		word_wrap = false
	})
	self._last_time = 0
end
function HUDHeistTimer:set_time(time)
	if math.floor(time) < self._last_time then
		return
	end
	self._last_time = time
	time = math.floor(time)
	local hours = math.floor(time / 3600)
	time = time - hours * 3600
	local minutes = math.floor(time / 60)
	time = time - minutes * 60
	local seconds = math.round(time)
	if hours > 0 then
	else
		local text = (hours < 10 and "0" .. hours or hours) .. ":" or ""
	end
	local text = text .. (minutes < 10 and "0" .. minutes or minutes) .. ":" .. (seconds < 10 and "0" .. seconds or seconds)
	self._timer_text:set_text(text)
end
