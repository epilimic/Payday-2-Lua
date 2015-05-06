ImageBoxGui = ImageBoxGui or class(TextBoxGui)
function ImageBoxGui:init(...)
	ImageBoxGui.super.init(self, ...)
end
function ImageBoxGui:update(t, dt)
end
function ImageBoxGui:_create_text_box(ws, title, text, content_data, text_config, image_config)
	ImageBoxGui.super._create_text_box(self, ws, title, text, content_data, text_config)
	self:_create_image_box(image_config)
end
function ImageBoxGui:_create_image_box(image_config)
	image_config = image_config or {}
	local image_shapes = image_config.shapes or {}
	local image_texture = image_config.texture or nil
	local image_video = image_config.video or nil
	local video_loop = image_config.video_loop or false
	local keep_texure_ratio = image_config.keep_ratio or false
	local image_render_template = image_config.render_template
	local image_blend_mode = image_config.blend_mode
	local image_width = image_config.w or image_config.width or 0
	local image_height = image_config.h or image_config.height or 0
	local image_padding = image_config.padding or 0
	local image_halign = Idstring(image_config.halign or image_config.align or "left")
	local image_valign = Idstring(image_config.valign or image_config.vertical or "center")
	local image_layer = image_config.layer or 0
	local main = self._panel
	local title = main:child("title")
	local info_area = main:child("info_area")
	local buttons_panel = info_area:child("buttons_panel")
	local scroll_panel = info_area:child("scroll_panel")
	local halign_not_center = image_halign ~= Idstring("center")
	local valign_not_center = image_valign ~= Idstring("center")
	local grow_w, grow_h = 0, 0
	if halign_not_center then
		grow_w = image_width + image_padding * 2
	end
	if valign_not_center and not halign_not_center then
		grow_h = image_height + image_padding * 2
	end
	main:grow(grow_w, grow_h)
	info_area:set_size(main:size())
	local move_x, move_y = 0, 0
	if image_halign == Idstring("left") then
		move_x = grow_w
	end
	if image_valign ~= Idstring("bottom") then
		move_y = grow_h
	end
	title:move(move_x, move_y)
	buttons_panel:move(move_x, move_y)
	scroll_panel:move(move_x, move_y)
	self._panel_w = main:w()
	self._panel_h = main:h()
	local top_line = self._panel:child("top_line")
	local bottom_line = self._panel:child("bottom_line")
	local scroll_up_indicator_shade = self._panel:child("scroll_up_indicator_shade")
	local scroll_down_indicator_shade = self._panel:child("scroll_down_indicator_shade")
	local scroll_up_indicator_arrow = self._panel:child("scroll_up_indicator_arrow")
	local scroll_down_indicator_arrow = self._panel:child("scroll_down_indicator_arrow")
	top_line:set_world_bottom(scroll_panel:world_top())
	bottom_line:set_world_top(scroll_panel:world_bottom())
	scroll_up_indicator_shade:set_top(top_line:bottom())
	scroll_down_indicator_shade:set_bottom(bottom_line:top())
	scroll_up_indicator_arrow:set_lefttop(scroll_panel:right() + 2, scroll_up_indicator_shade:top() + 8)
	scroll_down_indicator_arrow:set_leftbottom(scroll_panel:right() + 2, scroll_down_indicator_shade:bottom() - 8)
	local image_panel = main:panel({
		name = "image_panel",
		w = image_width,
		h = image_height,
		layer = image_layer
	})
	if image_halign == Idstring("center") then
		image_panel:set_center_x(self._panel_w / 2)
	elseif image_halign == Idstring("right") then
		image_panel:set_right(self._panel_w - 10)
	else
		image_panel:set_left(10)
	end
	if image_valign == Idstring("center") then
		image_panel:set_center_y(self._panel_h / 2)
	elseif image_valign == Idstring("bottom") then
		image_panel:set_bottom(self._panel_h - 10)
	else
		image_panel:set_top(10)
	end
	if image_texture and DB:has(Idstring("texture"), image_texture) then
		local image = image_panel:bitmap({
			texture = image_texture,
			w = image_width,
			h = image_height,
			blend_mode = image_blend_mode
		})
		if image_render_template then
			image:set_render_template(image_render_template)
		end
		if keep_texure_ratio then
			local texture_width, texture_height = image:texture_width(), image:texture_height()
			local image_aspect = math.max(image_width, 1) / math.max(image_height, 1)
			local texture_aspect = math.max(texture_width, 1) / math.max(texture_height, 1)
			local aspect = texture_aspect / image_aspect
			local sw = math.min(image_width, image_width * aspect)
			local sh = math.min(image_height, image_height / aspect)
			image:set_size(sw, sh)
			image:set_center(image_panel:w() / 2, image_panel:h() / 2)
		end
	end
	if image_video then
		local image = image_panel:video({
			video = image_video,
			w = image_width,
			h = image_height,
			loop = video_loop,
			blend_mode = image_blend_mode
		})
		if image_render_template then
			image:set_render_template(image_render_template)
		end
		if keep_texure_ratio then
			local texture_width, texture_height = image:video_width(), image:video_height()
			local image_aspect = math.max(image_width, 1) / math.max(image_height, 1)
			local texture_aspect = math.max(texture_width, 1) / math.max(texture_height, 1)
			local aspect = texture_aspect / image_aspect
			local sw = math.min(image_width, image_width * aspect)
			local sh = math.min(image_height, image_height / aspect)
			image:set_size(sw, sh)
			image:set_center(image_panel:w() / 2, image_panel:h() / 2)
		end
	end
	if image_shapes then
		for _, shape in pairs(image_shapes) do
			local type = shape.type or rect
			local new_shape
			if type == "rect" then
				new_shape = image_panel:rect({
					color = shape.color or Color.white,
					w = shape.width or shape.w or 0,
					h = shape.height or shape.h or 0,
					layer = shape.layer or 0,
					blend_mode = image_blend_mode
				})
			elseif type == "bitmap" then
				new_shape = image_panel:bitmap({
					texture = shape.texture,
					color = shape.color or Color.white,
					w = shape.width or shape.w or 0,
					h = shape.height or shape.h or 0,
					layer = shape.layer or 0,
					blend_mode = image_blend_mode
				})
			end
			new_shape:set_center(shape.x * image_panel:w(), shape.y * image_panel:h())
			new_shape:set_position(math.round(new_shape:x()), math.round(new_shape:y()))
		end
	end
	self._info_box:create_sides(info_area, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self:_set_scroll_indicator()
	main:set_center(main:parent():w() / 2, main:parent():h() / 2)
end
