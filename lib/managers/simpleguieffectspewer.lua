SimpleGUIEffectSpewer = SimpleGUIEffectSpewer or class()
SimpleGUIEffectSpewer.DEFAULT_PARTICLE_TEXTURES = {
	"guis/textures/pd2/particles/bulb",
	"guis/textures/pd2/particles/spark"
}
function SimpleGUIEffectSpewer:_particles_update(t, dt)
	local dead_particles = {}
	local particle_live_p = 1
	self._particle_panel:set_visible(self._spew_panel:tree_visible())
	for key, particle_data in pairs(self.__living_particles) do
		particle_data.pt = particle_data.pt + dt
		particle_live_p = particle_data.plive_time == 0 and 1 or particle_data.pt / particle_data.plive_time
		particle_data.particle:set_alpha(math.clamp(math.sin((particle_live_p + 0.2) * 150), 0, 1))
		local sx, sy = particle_data.particle:center()
		particle_data.particle:move(particle_data.dir_x * particle_data.particle_speed * dt, particle_data.dir_y * particle_data.particle_speed * dt)
		if self._particle_gravity ~= 0 then
			particle_data.gravity = particle_data.gravity + dt * self._particle_gravity
			particle_data.particle:move(0, dt * particle_data.gravity)
		end
		if particle_data.sway_speed ~= 0 and particle_data.sway_distance ~= 0 then
			particle_data.sway_t = particle_data.sway_t + dt
			particle_data.particle:move(math.cos(particle_data.sway_t * particle_data.sway_speed) * -particle_data.dir_y * particle_data.sway_distance, math.cos(particle_data.sway_t * particle_data.sway_speed) * particle_data.dir_x * particle_data.sway_distance)
		end
		if particle_data.flip_speed ~= 0 then
			local dimension = self._particle_flip_dimension or particle_data.w
			if dimension <= particle_data.particle:w() then
				particle_data.flip_bit = true
			else
				if particle_data.particle:w() <= -dimension then
					particle_data.flip_bit = false
				else
				end
			end
			local cx, cy = particle_data.particle:center()
			if particle_data.flip_bit then
				particle_data.particle:grow(-dt * particle_data.flip_speed, 0)
			else
				particle_data.particle:grow(dt * particle_data.flip_speed, 0)
			end
			particle_data.particle:set_center(cx, cy)
		end
		if particle_data.pt >= particle_data.plive_time then
			table.insert(dead_particles, key)
		else
			local ex, ey = particle_data.particle:center()
			local dir_x = ex - sx
			local dir_y = ey - sy
			local magnitude = (dir_x * dir_x + dir_y * dir_y) ^ 0.5
			if magnitude ~= 0 then
				dir_x = dir_x / magnitude
				dir_y = dir_y / magnitude
				local rotation = math.atan2(dir_y, dir_x)
				if math.abs(rotation - particle_data.start_rotation) < 90 then
					particle_data.particle:set_rotation(rotation)
				end
			end
		end
	end
	for i, dead_particle_key in ipairs(dead_particles) do
		self._particle_panel:remove(self.__living_particles[dead_particle_key].particle)
		self.__living_particles[dead_particle_key] = nil
	end
end
function SimpleGUIEffectSpewer:_spew_update(t, dt)
	self.__particle_spawn_t = self.__particle_spawn_t - dt
	while self.__particle_spawn_t <= 0 do
		if self._max_num_particles == 0 or self._max_num_particles > table.size(self.__living_particles) then
			local rot = math.rand(self._min_spew_angle, self._max_spew_angle)
			if rot == 0 then
				rot = 360 or rot
			end
			local new_particle = self._particle_panel:bitmap({
				texture = self._particle_textures[math.random(#self._particle_textures)],
				rotation = rot,
				blend_mode = self._particle_blend_mode
			})
			local ratio = new_particle:texture_width() / new_particle:texture_height()
			local w = math.random(self._min_particle_w, self._max_particle_w) * ratio
			local h = math.random(self._min_particle_h, self._max_particle_h)
			new_particle:set_size(w, h)
			local wx, wy = self._spew_panel:world_center()
			if self._ws_converter then
				local func = callback(managers.gui_data, managers.gui_data, self._ws_converter)
				if func then
					wx, wy = func(wx, wy)
				end
			end
			new_particle:set_world_center(wx, wy)
			local red, green, blue = 1, 1, 1
			if self._particle_colors then
				if not self._particle_colors.red then
					local red_data = {1, 1}
				end
				if not self._particle_colors.green then
					local green_data = {1, 1}
				end
				if not self._particle_colors.blue then
					local blue_data = {1, 1}
				end
				red = type(red_data) == "number" and red_data or math.rand(red_data[1], red_data[2])
				green = type(green_data) == "number" and green_data or math.rand(green_data[1], green_data[2])
				blue = type(blue_data) == "number" and blue_data or math.rand(blue_data[1], blue_data[2])
			end
			new_particle:set_color(Color(red, green, blue))
			local dir_x = math.cos(rot)
			local dir_y = math.sin(rot)
			local sway_distance = math.rand(self._min_particle_sway_distance, self._max_particle_sway_distance)
			local sway_speed = math.rand(self._min_particle_sway_speed, self._max_particle_sway_speed)
			local particle_speed = math.rand(self._min_particle_speed, self._max_particle_speed)
			local plive_time = math.rand(self._min_plive_time, self._max_plive_time)
			local particle_flip_speed = math.rand(self._min_particle_flip_speed, self._max_particle_flip_speed)
			if self.__living_particles[new_particle:key()] and alive(self.__living_particles[new_particle:key()].particle) then
				Application:error("[SimpleGUIEffectSpewer] Particle already exists:", new_particle:key())
				self._particle_panel:remove(self.__living_particles[new_particle:key()].particle)
				self.__living_particles[new_particle:key()] = nil
			end
			self.__living_particles[new_particle:key()] = {
				particle = new_particle,
				w = w,
				h = h,
				dir_x = dir_x,
				dir_y = dir_y,
				particle_speed = particle_speed,
				plive_time = plive_time,
				pt = 0,
				start_rotation = rot,
				gravity = 0,
				sway_distance = sway_distance,
				sway_speed = sway_speed,
				sway_t = math.rand(1),
				flip_speed = particle_flip_speed,
				flip_dir = math.random() < 0.5 and -1 or 1
			}
		end
		self.__particle_spawn_interval = self._fixed_spew_rate and self.__particle_spawn_interval or math.rand(self._min_spawn_interval, self._max_spawn_interval)
		if self._max_num_particles <= table.size(self.__living_particles) then
			self.__particle_spawn_t = self.__particle_spawn_interval
		else
			self.__particle_spawn_t = self.__particle_spawn_t + self.__particle_spawn_interval
		end
	end
end
function SimpleGUIEffectSpewer:animation_update(o)
	local t = 0
	local dt = coroutine.yield()
	self.__spew_time = math.rand(self._min_spew_time, self._max_spew_time)
	self.__particle_spawn_interval = math.rand(self._min_spawn_interval, self._max_spawn_interval)
	self.__particle_spawn_t = self._spew_at_start and 0 or self.__particle_spawn_interval
	self.__living_particles = {}
	local done = false
	while not done do
		done = true
		if t <= self.__spew_time then
			self:_spew_update(t, dt)
			done = false
		else
		end
		if 0 < table.size(self.__living_particles) then
			self:_particles_update(t, dt)
			done = false
		end
		dt = coroutine.yield()
		t = t + dt
		if not alive(self._particle_panel) or not alive(self._spew_panel) then
			if alive(self._spew_panel) and alive(self._spew_parent_panel) then
				self._spew_parent_panel:remove(self._spew_panel)
			end
			if alive(self._particle_panel) then
				self._ws:panel():remove(self._particle_panel)
			end
			return
		end
	end
	self._spew_parent_panel:remove(self._spew_panel)
	self._ws:panel():remove(self._particle_panel)
end
function SimpleGUIEffectSpewer:init(params)
	params = params or {
		spew_time = 1,
		plive_time = 1,
		spawn_interval = 0.1
	}
	self._ws = params.ws or managers.menu_component:fullscreen_ws()
	self._particle_panel = self._ws:panel():panel()
	self._particle_panel:set_alpha(params.particle_alpha or 1)
	self._spew_parent_panel = params.parent_panel or self._particle_panel
	self._spew_panel_x = params.x or self._spew_parent_panel:w() / 2
	self._spew_panel_y = params.y or self._spew_parent_panel:h() / 2
	self._ws_converter = params.ws_converter or nil
	self._layer = params.layer or 0
	self._max_num_particles = params.max_num_particles or 0
	self._min_spew_time = params.min_spew_time or params.spew_time or 0
	self._max_spew_time = params.max_spew_time or params.spew_time or 0
	self._min_plive_time = params.min_plive_time or params.plive_time or 0
	self._max_plive_time = params.max_plive_time or params.plive_time or 0
	self._min_spawn_interval = params.min_spawn_interval or params.spawn_interval or 0
	self._max_spawn_interval = params.max_spawn_interval or params.spawn_interval or 0
	self._min_particle_speed = params.min_particle_speed or params.particle_speed or 10
	self._max_particle_speed = params.max_particle_speed or params.particle_speed or 10
	self._min_spew_angle = params.min_spew_angle or params.spew_angle or 0
	self._max_spew_angle = params.max_spew_angle or params.spew_angle or 360
	self._min_particle_w = params.min_particle_w or params.particle_w or 32
	self._max_particle_w = params.max_particle_w or params.particle_w or 32
	self._min_particle_h = params.min_particle_h or params.particle_h or 32
	self._max_particle_h = params.max_particle_h or params.particle_h or 32
	self._min_particle_sway_distance = params.min_particle_sway_distance or params.min_sway_distance or params.particle_sway_distance or params.sway_distance or 0
	self._max_particle_sway_distance = params.max_particle_sway_distance or params.max_sway_distance or params.particle_sway_distance or params.sawy_distance or 0
	self._min_particle_sway_speed = params.min_particle_sway_speed or params.min_sway_speed or params.particle_sway_speed or params.sway_speed or 0
	self._max_particle_sway_speed = params.max_particle_sway_speed or params.max_sway_speed or params.particle_sway_speed or params.sawy_speed or 0
	self._min_particle_flip_speed = params.min_particle_flip_speed or params.particle_flip_speed or 0
	self._max_particle_flip_speed = params.max_particle_flip_speed or params.particle_flip_speed or 0
	self._particle_flip_dimension = params.particle_flip_dimension or nil
	self._particle_acceleration = params.particle_acceleration or 0
	self._particle_gravity = params.particle_gravity or params.gravity or 0
	self._particle_blend_mode = params.particle_blend_mode or "add"
	self._particle_colors = params.particle_colors
	self._particle_textures = params.particle_textures or self.DEFAULT_PARTICLE_TEXTURES or {}
	self._spew_at_start = params.spew_at_start or false
	self._fixed_spew_rate = params.fixed_spew_rate or false
	self._spew_panel = self._spew_parent_panel:panel({
		x = self._spew_panel_x - 5,
		y = self._spew_panel_y - 5,
		w = 9,
		h = 9,
		layer = self._layer
	})
	self._update_thread = self._particle_panel:animate(callback(self, self, "animation_update"))
	self._particle_panel:set_layer(self._layer)
end
function SimpleGUIEffectSpewer.sample_boom()
	local ws = managers.menu_component:fullscreen_ws()
	SimpleGUIEffectSpewer:new({
		spew_time = 0.5,
		min_plive_time = 0.6,
		max_plive_time = 1,
		spawn_interval = 0.04,
		min_particle_speed = 175,
		max_particle_speed = 225,
		max_num_particles = 35,
		particle_colors = {
			red = {0.8, 1},
			green = {0.7, 0.9},
			blue = {0, 0.1}
		},
		particle_textures = {
			"guis/textures/pd2/particles/bulb"
		},
		particle_sway_distance = 0.5,
		particle_sway_speed = 360
	})
	SimpleGUIEffectSpewer:new({
		spew_time = 0.6,
		min_plive_time = 0.4,
		max_plive_time = 0.6,
		spawn_interval = 0.05,
		min_particle_speed = 375,
		max_particle_speed = 425,
		max_num_particles = 20,
		particle_colors = {
			red = {0.8, 1},
			green = {0.7, 0.9},
			blue = {0, 0.1}
		},
		particle_textures = {
			"guis/textures/pd2/particles/spark"
		},
		particle_w = 16,
		particle_h = 16
	})
	SimpleGUIEffectSpewer:new({
		spew_time = 0,
		spew_at_start = true,
		plive_time = 1.6,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = {
			red = 0.8,
			green = 0.8,
			blue = 0.1
		},
		particle_w = ws:panel():h() / 2,
		particle_h = ws:panel():h() / 2,
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		particle_alpha = 0.8,
		layer = 1
	})
	SimpleGUIEffectSpewer:new({
		spew_time = 0,
		spew_at_start = true,
		plive_time = 1.5,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = {
			red = 0.8,
			green = 0.5,
			blue = 0.1
		},
		particle_w = ws:panel():h(),
		particle_h = ws:panel():h(),
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		particle_alpha = 0.8,
		layer = 1
	})
	SimpleGUIEffectSpewer:new({
		spew_time = 0,
		spew_at_start = true,
		plive_time = 0.8,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = {
			red = 0.8,
			green = 0.5,
			blue = 0.1
		},
		particle_w = ws:panel():h(),
		particle_h = ws:panel():h(),
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		particle_alpha = 0.8,
		layer = 1
	})
end
function SimpleGUIEffectSpewer.get_skill_spewers(x, y, panel)
	local ws = managers.menu_component:fullscreen_ws()
	local skill_color = tweak_data.screen_colors.button_stage_3
	local colors = {
		red = {
			skill_color.red - 0.1,
			skill_color.red + 0.1
		},
		green = {
			skill_color.green - 0.1,
			skill_color.green + 0.1
		},
		blue = {
			skill_color.blue - 0.1,
			skill_color.blue + 0.1
		}
	}
	return {
		spew_time = 0.4,
		min_plive_time = 0.4,
		max_plive_time = 0.6,
		spawn_interval = 0.06,
		min_particle_speed = 100,
		max_particle_speed = 155,
		max_num_particles = 35,
		particle_colors = colors,
		particle_alpha = skill_color.alpha,
		particle_textures = {
			"guis/textures/pd2/particles/bulb"
		},
		particle_sway_distance = 0.4,
		particle_sway_speed = 180,
		particle_w = 8,
		particle_h = 8,
		x = x,
		y = y,
		parent_panel = panel,
		layer = (panel and panel:layer() or 0) + 2,
		ws_converter = "safe_to_full_16_9",
		gravity = 50
	}, {
		spew_time = 0.2,
		min_plive_time = 0.2,
		max_plive_time = 0.3,
		spawn_interval = 0.05,
		min_particle_speed = 255,
		max_particle_speed = 305,
		max_num_particles = 35,
		particle_colors = colors,
		particle_alpha = skill_color.alpha,
		particle_textures = {
			"guis/textures/pd2/particles/spark"
		},
		particle_w = 4,
		particle_h = 4,
		x = x,
		y = y,
		parent_panel = panel,
		layer = (panel and panel:layer() or 0) + 2,
		ws_converter = "safe_to_full_16_9"
	}, {
		spew_time = 0,
		spew_at_start = true,
		plive_time = 1.6,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = colors,
		particle_w = ws:panel():h() * 0.25,
		particle_h = ws:panel():h() * 0.25,
		particle_alpha = skill_color.alpha * 0.8,
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		x = x,
		y = y,
		parent_panel = panel,
		layer = (panel and panel:layer() or 0) + 3,
		ws_converter = "safe_to_full_16_9"
	}, {
		spew_time = 0,
		spew_at_start = true,
		plive_time = 1.5,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = colors,
		particle_alpha = skill_color.alpha * 0.8,
		particle_w = ws:panel():h() * 0.35,
		particle_h = ws:panel():h() * 0.35,
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		x = x,
		y = y,
		parent_panel = panel,
		layer = (panel and panel:layer() or 0) + 3,
		ws_converter = "safe_to_full_16_9"
	}, {
		spew_time = 0,
		spew_at_start = true,
		plive_time = 0.8,
		particle_speed = 0,
		max_num_particles = 1,
		spawn_interval = 0.1,
		particle_colors = colors,
		particle_alpha = skill_color.alpha * 0.8,
		particle_w = ws:panel():h() * 0.45,
		particle_h = ws:panel():h() * 0.45,
		particle_textures = {
			"guis/textures/pd2/particles/fill"
		},
		x = x,
		y = y,
		parent_panel = panel,
		layer = (panel and panel:layer() or 0) + 3,
		ws_converter = "safe_to_full_16_9"
	}
end
function SimpleGUIEffectSpewer.item_sell(x, y, layer)
	local ws = managers.menu_component:fullscreen_ws()
	local skill_color = Color(255, 215, 0)
	local colors = {
		red = {
			skill_color.red - 0.1,
			skill_color.red + 0.1
		},
		green = {
			skill_color.green - 0.1,
			skill_color.green + 0.1
		},
		blue = {
			skill_color.blue - 0.1,
			skill_color.blue + 0.1
		}
	}
	local spewers = {
		{
			x = x,
			y = y,
			spew_time = 0.35,
			min_plive_time = 0.7,
			max_plive_time = 0.9,
			spawn_interval = 0.015,
			min_particle_speed = 125,
			max_particle_speed = 195,
			max_num_particles = 35,
			particle_colors = colors,
			particle_alpha = skill_color.alpha,
			particle_textures = {
				"guis/textures/pd2/particles/bulb"
			},
			min_particle_w = -32,
			max_particle_w = 32,
			particle_h = 32,
			min_spew_angle = -180,
			max_spew_angle = 0,
			min_particle_flip_speed = 125,
			max_particle_flip_speed = 225,
			particle_flip_dimension = 32,
			layer = layer,
			ws_converter = "safe_to_full_16_9",
			gravity = 325,
			particle_blend_mode = "normal"
		}
	}
	for i, spewer in ipairs(spewers) do
		SimpleGUIEffectSpewer:new(spewer)
	end
end
function SimpleGUIEffectSpewer.skill_up(x, y, panel)
	local spewers = {
		SimpleGUIEffectSpewer.get_skill_spewers(x, y, panel)
	}
	for i, spewer in ipairs(spewers) do
		SimpleGUIEffectSpewer:new(spewer)
	end
end
function SimpleGUIEffectSpewer.infamous_up(x, y, panel)
	local spewers = {
		SimpleGUIEffectSpewer.get_skill_spewers(x, y, panel)
	}
	for i, spewer in ipairs(spewers) do
		spewer.particle_w = spewer.particle_w and math.floor(spewer.particle_w * 1.4)
		spewer.particle_h = spewer.particle_h and math.floor(spewer.particle_h * 1.4)
		SimpleGUIEffectSpewer:new(spewer)
	end
end
