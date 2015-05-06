HUDHitDirection = HUDHitDirection or class()
function HUDHitDirection:init(hud)
	self._hud_panel = hud.panel
	if self._hud_panel:child("hit_direction_panel") then
		self._hud_panel:remove(self._hud_panel:child("hit_direction_panel"))
	end
	self._hit_direction_panel = self._hud_panel:panel({
		visible = true,
		name = "hit_direction_panel",
		w = 256,
		h = 256,
		valign = "center",
		halign = "center",
		layer = -5
	})
	self._hit_direction_panel:set_center(self._hit_direction_panel:parent():w() / 2, self._hit_direction_panel:parent():h() / 2)
	local right = self._hit_direction_panel:bitmap({
		name = "right",
		visible = true,
		texture = "guis/textures/pd2/hitdirection",
		color = Color.white,
		blend_mode = "add",
		alpha = 0,
		halign = "right"
	})
	right:set_right(right:parent():w())
	local tw = right:texture_width()
	local th = right:texture_height()
	local left = self._hit_direction_panel:bitmap({
		name = "left",
		rotation = 180,
		visible = true,
		texture = "guis/textures/pd2/hitdirection",
		color = Color.white,
		blend_mode = "add",
		alpha = 0,
		halign = "right"
	})
	left:set_left(0)
	local up = self._hit_direction_panel:bitmap({
		name = "up",
		rotation = -90,
		visible = true,
		texture = "guis/textures/pd2/hitdirection",
		color = Color.white,
		blend_mode = "add",
		alpha = 0,
		halign = "right"
	})
	up:set_top(-tw * 1.5)
	up:set_center_x(up:parent():w() / 2)
	local down = self._hit_direction_panel:bitmap({
		name = "down",
		rotation = 90,
		visible = true,
		texture = "guis/textures/pd2/hitdirection",
		color = Color.white,
		blend_mode = "add",
		alpha = 0,
		halign = "right"
	})
	down:set_y(tw * 1.5)
	down:set_center_x(down:parent():w() / 2)
end
function HUDHitDirection:on_hit_direction(dir)
	local direction = self._hit_direction_panel:child(dir)
	direction:stop()
	direction:animate(callback(self, self, "_animate_hit_direction"))
end
function HUDHitDirection:_animate_hit_direction(direction)
	direction:set_alpha(1)
	local st = 0.6
	local t = st
	local st_red_t = 0.4
	local red_t = st_red_t
	while t > 0 do
		local dt = coroutine.yield()
		t = t - dt
		red_t = math.clamp(red_t - dt, 0, 1)
		direction:set_color(Color(1, red_t / st_red_t, red_t / st_red_t))
		direction:set_alpha(t / st)
	end
	direction:set_alpha(0)
end
