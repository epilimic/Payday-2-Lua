OffshoreGui = OffshoreGui or class()
OffshoreGui.TITLE_COLOR = Color(0.5, 0.6, 0.5)
OffshoreGui.MONEY_COLOR = Color(0.5, 0.6, 0.5)
function OffshoreGui:init(unit)
	self._unit = unit
	self._visible = true
	self._gui_object = self._gui_object or "gui_object"
	self._new_gui = World:gui()
	self:add_workspace(self._unit:get_object(Idstring(self._gui_object)))
	self:setup()
	self._unit:set_extension_update_enabled(Idstring("offshore_gui"), false)
end
function OffshoreGui:add_workspace(gui_object)
	self._ws = self._new_gui:create_object_workspace(1280, 720, gui_object, Vector3(0, 0, 0))
end
function OffshoreGui:setup()
	if self._back_drop_gui then
		self._back_drop_gui:destroy()
	end
	self._ws:panel():clear()
	self._ws:panel():set_alpha(0.8)
	self._ws:panel():rect({
		color = Color.black,
		layer = -1
	})
	self._back_drop_gui = MenuBackdropGUI:new(self._ws)
	local panel = self._back_drop_gui:get_new_background_layer()
	local font_size = 120
	local default_offset = 48
	local text = managers.localization:to_upper_text("menu_offshore_account")
	self._title_text = panel:text({
		text = text,
		y = -self._ws:panel():h() / 2 - default_offset,
		font = "fonts/font_medium_noshadow_mf",
		align = "center",
		vertical = "bottom",
		font_size = font_size,
		layer = 0,
		visible = true,
		color = OffshoreGui.TITLE_COLOR
	})
	local font_size = 220
	local money_text = managers.experience:cash_string(managers.money:offshore())
	self._title_text = panel:text({
		text = money_text,
		y = self._ws:panel():h() / 2 - default_offset,
		font = "fonts/font_medium_noshadow_mf",
		align = "center",
		vertical = "top",
		font_size = font_size,
		layer = 0,
		visible = true,
		color = OffshoreGui.MONEY_COLOR
	})
end
function OffshoreGui:_start()
end
function OffshoreGui:start()
end
function OffshoreGui:sync_start()
	self:_start()
end
function OffshoreGui:set_visible(visible)
	self._visible = visible
	self._gui:set_visible(visible)
end
function OffshoreGui:lock_gui()
	self._ws:set_cull_distance(self._cull_distance)
	self._ws:set_frozen(true)
end
function OffshoreGui:destroy()
	if alive(self._new_gui) and alive(self._ws) then
		self._new_gui:destroy_workspace(self._ws)
		self._ws = nil
		self._new_gui = nil
	end
end
