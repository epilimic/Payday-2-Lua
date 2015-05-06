BoxGuiObject = BoxGuiObject or class()
local mvector_tl = Vector3()
local mvector_tr = Vector3()
local mvector_bl = Vector3()
local mvector_br = Vector3()
function BoxGuiObject:init(panel, config)
	self:create_sides(panel, config)
end
function BoxGuiObject:create_sides(panel, config)
	if not alive(panel) then
		Application:error("[BoxGuiObject:create_sides] Failed creating BoxGui. Parent panel not alive!")
		return
	end
	if alive(self._panel) then
		self._panel:parent():remove(self._panel)
		self._panel = nil
	end
	self._panel = panel:panel({
		name = config.name,
		halign = "grow",
		valign = "grow",
		layer = 1
	})
	self._color = config.color or self._color or Color.white
	local left_side = config.sides and config.sides[1] or config.left or 0
	local right_side = config.sides and config.sides[2] or config.right or 0
	local top_side = config.sides and config.sides[3] or config.top or 0
	local bottom_side = config.sides and config.sides[4] or config.bottom or 0
	self:_create_side(self._panel, "left", left_side)
	self:_create_side(self._panel, "right", right_side)
	self:_create_side(self._panel, "top", top_side)
	self:_create_side(self._panel, "bottom", bottom_side)
end
function BoxGuiObject:_create_side(panel, side, type)
	local ids_side = Idstring(side)
	local ids_left = Idstring("left")
	local ids_right = Idstring("right")
	local ids_top = Idstring("top")
	local ids_bottom = Idstring("bottom")
	local left_or_right = false
	local w, h
	if ids_side == ids_left or ids_side == ids_right then
		left_or_right = true
		w = 2
		h = panel:h()
	else
		w = panel:w()
		h = 2
	end
	local side_panel = panel:panel({
		name = side,
		w = w,
		h = h,
		halign = "grow",
		valign = "grow"
	})
	if type == 0 then
		return
	elseif type == 1 then
		local one = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap"
		})
		local two = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap"
		})
		local x = math.random(1, 255)
		local y = math.random(0, one:texture_height() / 2 - 1) * 2
		local tw = math.min(10, w)
		local th = math.min(10, h)
		if left_or_right then
			mvector3.set_static(mvector_tl, x, y + tw, 0)
			mvector3.set_static(mvector_tr, x, y, 0)
			mvector3.set_static(mvector_bl, x + th, y + tw, 0)
			mvector3.set_static(mvector_br, x + th, y, 0)
			one:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			x = math.random(1, 255)
			y = math.random(0, math.round(one:texture_height() / 2 - 1)) * 2
			mvector3.set_static(mvector_tl, x, y + tw, 0)
			mvector3.set_static(mvector_tr, x, y, 0)
			mvector3.set_static(mvector_bl, x + th, y + tw, 0)
			mvector3.set_static(mvector_br, x + th, y, 0)
			two:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			one:set_size(2, th)
			two:set_size(2, th)
			two:set_bottom(h)
		else
			mvector3.set_static(mvector_tl, x, y, 0)
			mvector3.set_static(mvector_tr, x + tw, y, 0)
			mvector3.set_static(mvector_bl, x, y + th, 0)
			mvector3.set_static(mvector_br, x + tw, y + th, 0)
			one:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			x = math.random(1, 255)
			y = math.random(0, math.round(one:texture_height() / 2 - 1)) * 2
			mvector3.set_static(mvector_tl, x, y, 0)
			mvector3.set_static(mvector_tr, x + tw, y, 0)
			mvector3.set_static(mvector_bl, x, y + th, 0)
			mvector3.set_static(mvector_br, x + tw, y + th, 0)
			two:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
			one:set_size(tw, 2)
			two:set_size(tw, 2)
			two:set_right(w)
		end
	elseif type == 2 then
		local full = side_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			halign = "grow",
			valign = "grow",
			wrap_mode = "wrap",
			w = side_panel:w(),
			h = side_panel:h()
		})
		local x = math.random(1, 255)
		local y = math.random(0, math.round(full:texture_height() / 2 - 1)) * 2
		if left_or_right then
			mvector3.set_static(mvector_tl, x, y + w, 0)
			mvector3.set_static(mvector_tr, x, y, 0)
			mvector3.set_static(mvector_bl, x + h, y + w, 0)
			mvector3.set_static(mvector_br, x + h, y, 0)
			full:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
		else
			mvector3.set_static(mvector_tl, x, y, 0)
			mvector3.set_static(mvector_tr, x + w, y, 0)
			mvector3.set_static(mvector_bl, x, y + h, 0)
			mvector3.set_static(mvector_br, x + w, y + h, 0)
			full:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
		end
	else
		Application:error("[BoxGuiObject] Type", type, "is not supported")
		Application:stack_dump()
		return
	end
	side_panel:set_position(0, 0)
	if ids_side == ids_right then
		side_panel:set_right(panel:w())
	elseif ids_side == ids_bottom then
		side_panel:set_bottom(panel:h())
	end
	return side_panel
end
function BoxGuiObject:hide()
	self._panel:hide()
end
function BoxGuiObject:show()
	self._panel:show()
end
function BoxGuiObject:set_visible(visible)
	self._panel:set_visible(visible)
end
function BoxGuiObject:set_layer(layer)
	self._panel:set_layer(layer)
end
function BoxGuiObject:size()
	return self._panel:size()
end
function BoxGuiObject:set_aligns(halign, valign)
	for i, d in pairs(self._panel:children()) do
		d:set_valign(valign)
		d:set_halign(halign)
	end
end
function BoxGuiObject:set_clipping(clip, rec_panel)
	if not rec_panel or not rec_panel:children() then
	end
	for i, d in pairs((self._panel:children())) do
		if d.set_rotation then
			d:set_rotation(clip and 0 or 360)
		else
			self:set_clipping(clip, d)
		end
	end
end
function BoxGuiObject:color()
	return self._color
end
function BoxGuiObject:set_color(color, rec_panel)
	self._color = color
	if not rec_panel or not rec_panel:children() then
	end
	for i, d in pairs((self._panel:children())) do
		if d.set_color then
			d:set_color(color)
		else
			self:set_color(color, d)
		end
	end
end
function BoxGuiObject:blend_mode()
	return self._blend_mode
end
function BoxGuiObject:set_blend_mode(blend_mode, rec_panel)
	self._blend_mode = blend_mode
	if not rec_panel or not rec_panel:children() then
	end
	for i, d in pairs((self._panel:children())) do
		if d.set_blend_mode then
			d:set_blend_mode(blend_mode)
		else
			self:set_blend_mode(blend_mode, d)
		end
	end
end
function BoxGuiObject:close()
	if alive(self._panel) and alive(self._panel:parent()) then
		self._panel:parent():remove(self._panel)
	end
end
