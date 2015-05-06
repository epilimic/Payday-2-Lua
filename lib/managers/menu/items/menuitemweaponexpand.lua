core:import("CoreMenuItem")
core:import("CoreMenuItemOption")
MenuItemWeaponExpand = MenuItemWeaponExpand or class(MenuItemExpand)
MenuItemWeaponExpand.TYPE = "weapon_expand"
function MenuItemWeaponExpand:init(data_node, parameters)
	MenuItemWeaponExpand.super.init(self, data_node, parameters)
	self._type = MenuItemWeaponExpand.TYPE
	local data_node = {
		type = "MenuItemWeaponAction",
		name = self._parameters.weapon_id .. "buy",
		text_id = "menu_buy",
		action_type = "buy",
		callback = "buy_weapon",
		visible_callback = "can_buy_weapon",
		weapon_id = self._parameters.weapon_id
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node)
	self:add_item(item)
	local data_node = {
		type = "MenuItemWeaponAction",
		name = self._parameters.weapon_id .. "equip",
		text_id = "menu_equip",
		action_type = "equip",
		callback = "equip_weapon",
		visible_callback = "owns_weapon",
		weapon_id = self._parameters.weapon_id,
		weapon_slot = self._parameters.weapon_slot
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node)
	self:add_item(item)
	local data_node = {
		type = "MenuItemWeaponAction",
		name = self._parameters.weapon_id .. "repair",
		text_id = "menu_repair",
		action_type = "repair",
		callback = "repair_weapon",
		visible_callback = "owns_weapon",
		weapon_id = self._parameters.weapon_id,
		weapon_slot = self._parameters.weapon_slot
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node)
	self:add_item(item)
	local data_node = {
		type = "MenuItemWeaponAction",
		name = self._parameters.weapon_id .. "buy_upgrades",
		text_id = "menu_buy_upgrades",
		action_type = "buy_upgrades",
		callback = "buy_weapon_upgrades",
		visible_callback = "owns_weapon",
		weapon_id = self._parameters.weapon_id,
		weapon_slot = self._parameters.weapon_slot,
		next_node = "buy_upgrades"
	}
	local parameters = {
		next_node_parameters = {
			self._parameters.weapon_id
		}
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node, parameters)
	self:add_item(item)
	self:_show_items(nil)
end
function MenuItemWeaponExpand:expand_value()
	return 0
end
function MenuItemWeaponExpand:toggle(...)
	if not self:parameter("unlocked") then
	end
	MenuItemWeaponExpand.super.toggle(self, ...)
end
function MenuItemWeaponExpand:can_expand()
	return self:parameter("unlocked")
end
function MenuItemWeaponExpand:setup_gui(node, row_item)
	local scaled_size = managers.gui_data:scaled_size()
	row_item.gui_panel = node.item_panel:panel({
		w = node.item_panel:w()
	})
	row_item.weapon_name = node._text_item_part(node, row_item, row_item.gui_panel, node.align_line_padding(node))
	row_item.weapon_name:set_font_size(22)
	local _, _, w, h = row_item.weapon_name:text_rect()
	row_item.weapon_name:set_h(h)
	row_item.gui_panel:set_left(node._mid_align(node) + self._parameters.expand_value)
	row_item.gui_panel:set_w(scaled_size.width - row_item.gui_panel:left())
	row_item.gui_panel:set_h(h)
	local texture, rect = tweak_data.hud_icons:get_icon_data(tweak_data.weapon[self._parameters.weapon_id].hud_icon)
	row_item.weapon_icon = row_item.gui_panel:bitmap({
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.weapon_icon:set_size(h, h)
	row_item.weapon_name:set_left(h + 4)
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_equipped")
	row_item.equipped_icon = row_item.gui_panel:parent():bitmap({
		visible = self._parameters.equipped,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.equipped_icon:set_center(h / 2, row_item.gui_panel:y() + h / 2)
	row_item.equipped_icon:set_right(row_item.gui_panel:x())
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_locked")
	row_item.locked_icon = row_item.gui_panel:bitmap({
		visible = not self._parameters.unlocked,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.locked_icon:set_center(h / 2, h / 2)
	row_item.locked_icon:set_right(row_item.locked_icon:parent():w() - 4)
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_circlebg")
	row_item.circlefill = row_item.gui_panel:bitmap({
		visible = self._parameters.unlocked and self._parameters.owned,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.circlefill:set_position(row_item.locked_icon:position())
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_circlefill" .. self._parameters.condition)
	row_item.repair_circle = row_item.gui_panel:bitmap({
		visible = self._parameters.unlocked and self._parameters.owned,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items + 1,
		color = self:_repair_circle_color(self._parameters.condition)
	})
	row_item.repair_circle:set_position(row_item.circlefill:position())
	row_item.expanded_indicator = row_item.gui_panel:parent():bitmap({
		visible = false,
		color = Color.red,
		texture = "guis/textures/menu_selected",
		x = 0,
		y = 0,
		layer = node.layers.items - 1
	})
	row_item.expanded_indicator:set_w(row_item.gui_panel:w())
	row_item.expanded_indicator:set_height(64 * row_item.gui_panel:height() / 32)
	row_item.bottom_line = row_item.gui_panel:parent():bitmap({
		texture = "guis/textures/headershadowdown",
		layer = node.layers.items + 1,
		color = Color.white,
		w = row_item.gui_panel:w(),
		y = 100
	})
end
function MenuItemWeaponExpand:on_item_position(row_item, node)
	row_item.expanded_indicator:set_position(row_item.gui_panel:position())
	row_item.expanded_indicator:set_center_y(row_item.gui_panel:center_y())
	row_item.equipped_icon:set_center_y(row_item.gui_panel:center_y())
	row_item.expand_line:set_lefttop(row_item.gui_panel:leftbottom())
	row_item.expand_line:set_left(row_item.expand_line:left())
end
function MenuItemWeaponExpand:on_item_positions_done(row_item, node)
	if self:expanded() then
		local child = self._items[#self._items]
		local row_child = node.row_item(node, child)
		if row_child then
			row_item.bottom_line:set_lefttop(row_child.gui_panel:leftbottom())
			row_item.bottom_line:set_top(row_item.bottom_line:top() - 1)
		end
	end
end
function MenuItemWeaponExpand:on_buy(node)
	local row_item = node:row_item(self)
	self:collaps(node, row_item)
	self:_show_items(self._callback_handler)
	self:expand(node, row_item)
	node:need_repositioning()
	row_item.node:select_item(self:name())
	node:highlight_item(self, false)
end
function MenuItemWeaponExpand:on_equip(node)
	for _, item in ipairs(self:parameters().parent_item:items()) do
		local row_item = node:row_item(item)
		item:reload(row_item, node)
	end
end
function MenuItemWeaponExpand:on_repair(node)
	local row_item = node:row_item(self)
	self._parameters.condition = Global.blackmarket_manager.weapons[self._parameters.weapon_id].condition
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_circlefill" .. self._parameters.condition)
	row_item.repair_circle:set_texture_rect(rect[1], rect[2], rect[3], rect[4])
	row_item.repair_circle:set_size(rect[3], rect[4])
	row_item.repair_circle:set_color(self:_repair_circle_color(self._parameters.condition))
end
function MenuItemWeaponExpand:_repair_circle_color(condition)
	return condition < 4 and Color(1, 0.5, 0) or Color.white
end
function MenuItemWeaponExpand:reload(row_item, node)
	MenuItemWeaponExpand.super.reload(self, row_item, node)
	row_item.expanded_indicator:set_position(row_item.gui_panel:position())
	row_item.expanded_indicator:set_center_y(row_item.gui_panel:center_y())
	row_item.expanded_indicator:set_visible(self:expanded())
	row_item.expand_line:set_w(row_item.gui_panel:w())
	row_item.bottom_line:set_visible(self:expanded() and self:parameter("unlocked"))
	row_item.circlefill:set_visible(not self:expanded() and self:parameter("unlocked") and self:parameter("owned"))
	row_item.repair_circle:set_visible(not self:expanded() and self:parameter("unlocked") and self:parameter("owned"))
	self._parameters.equipped = Global.blackmarket_manager.weapons[self:parameter("weapon_id")].equipped
	row_item.equipped_icon:set_visible(self._parameters.equipped)
	if self:expanded() then
		row_item.expanded_indicator:set_color(Color.white)
		row_item.menu_unselected:set_color(Color(1, 0.5, 0))
	else
		row_item.menu_unselected:set_color(Color(0.5, 0.5, 0.5))
	end
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponExpand:highlight_row_item(node, row_item, mouse_over)
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponExpand:fade_row_item(node, row_item, mouse_over)
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponExpand:_set_row_item_state(node, row_item)
	if self:expanded() or row_item.highlighted then
		row_item.weapon_name:set_color(Color.black)
		row_item.weapon_name:set_font(tweak_data.menu.default_font_no_outline_id)
	else
		row_item.weapon_name:set_color(self:parameter("owned") and self:parameter("unlocked") and row_item.color or Color(1, 0.5, 0.5, 0.5))
		row_item.weapon_name:set_font(tweak_data.menu.default_font_id)
	end
end
function MenuItemWeaponExpand:on_delete_row_item(row_item, ...)
	MenuItemWeaponExpand.super.on_delete_row_item(self, row_item, ...)
	row_item.gui_panel:parent():remove(row_item.equipped_icon)
	row_item.gui_panel:parent():remove(row_item.bottom_line)
end
function MenuItemWeaponExpand:condition()
	return self:parameter("condition")
end
function MenuItemWeaponExpand:_max_condition()
	return 16
end
function MenuItemWeaponExpand:_at_max_condition()
	return self._parameters.condition == self:_max_condition()
end
MenuItemWeaponAction = MenuItemWeaponAction or class(MenuItemExpandAction)
function MenuItemWeaponAction:init(data_node, parameters)
	MenuItemWeaponAction.super.init(self, data_node, parameters)
end
