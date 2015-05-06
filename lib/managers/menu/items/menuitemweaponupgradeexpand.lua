core:import("CoreMenuItem")
core:import("CoreMenuItemOption")
MenuItemWeaponUpgradeExpand = MenuItemWeaponUpgradeExpand or class(MenuItemExpand)
MenuItemWeaponUpgradeExpand.TYPE = "weapon_upgrade_expand"
function MenuItemWeaponUpgradeExpand:init(data_node, parameters)
	MenuItemWeaponUpgradeExpand.super.init(self, data_node, parameters)
	self._type = MenuItemWeaponUpgradeExpand.TYPE
	local data_node = {
		type = "MenuItemWeaponUpgradeAction",
		name = self._parameters.weapon_id .. "buy1",
		text_id = "menu_buy",
		action_type = "buy_upgrade",
		callback = "buy_weapon_upgrade",
		visible_callback = "can_buy_weapon_upgrade",
		weapon_id = self._parameters.weapon_id,
		weapon_upgrade = self._parameters.weapon_upgrade,
		upgrade_type = self._parameters.upgrade_type
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node)
	self:add_item(item)
	local data_node = {
		type = "MenuItemWeaponUpgradeAction",
		name = self._parameters.weapon_id .. "attach",
		text_id = "menu_attach",
		action_type = "attach_upgrade",
		callback = "attach_weapon_upgrade",
		visible_callback = "owns_weapon_upgrade",
		weapon_id = self._parameters.weapon_id,
		weapon_upgrade = self._parameters.weapon_upgrade,
		upgrade_type = self._parameters.upgrade_type
	}
	local item = CoreMenuNode.MenuNode.create_item(self, data_node)
	self:add_item(item)
end
function MenuItemWeaponUpgradeExpand:expand_value()
	return 0
end
function MenuItemWeaponUpgradeExpand:can_expand()
	return self:parameter("unlocked")
end
function MenuItemWeaponUpgradeExpand:setup_gui(node, row_item)
	local scaled_size = managers.gui_data:scaled_size()
	row_item.gui_panel = node.item_panel:panel({
		w = node.item_panel:w()
	})
	row_item.upgrade_name = node._text_item_part(node, row_item, row_item.gui_panel, node.align_line_padding(node))
	row_item.upgrade_name:set_font_size(22)
	local _, _, w, h = row_item.upgrade_name:text_rect()
	row_item.upgrade_name:set_h(h)
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
	row_item.upgrade_name:set_left(h + 4)
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_equipped")
	row_item.attached_icon = row_item.gui_panel:parent():bitmap({
		visible = self._parameters.attached,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.attached_icon:set_center(h / 2, row_item.gui_panel:y() + h / 2)
	row_item.attached_icon:set_right(row_item.gui_panel:x())
	local texture, rect = tweak_data.hud_icons:get_icon_data("icon_locked")
	row_item.locked_icon = row_item.gui_panel:bitmap({
		visible = not self._parameters.unlocked,
		texture = texture,
		texture_rect = rect,
		layer = node.layers.items
	})
	row_item.locked_icon:set_center(h / 2, h / 2)
	row_item.locked_icon:set_right(row_item.locked_icon:parent():w() - 4)
	row_item.expanded_indicator = row_item.gui_panel:parent():bitmap({
		visible = false,
		texture = "guis/textures/menu_selected",
		x = 0,
		y = 0,
		layer = 0
	})
	row_item.expanded_indicator:set_w(row_item.gui_panel:w())
	row_item.expanded_indicator:set_height(64 * row_item.gui_panel:height() / 32)
	row_item.expanded_indicator:set_rotation(180)
	row_item.bottom_line = row_item.gui_panel:parent():bitmap({
		texture = "guis/textures/headershadow",
		rotation = 180,
		layer = node.layers.items + 1,
		color = Color.white,
		w = row_item.gui_panel:w(),
		y = 100
	})
end
function MenuItemWeaponUpgradeExpand:on_item_position(row_item, node)
	row_item.expanded_indicator:set_position(row_item.gui_panel:position())
	row_item.expanded_indicator:set_center_y(row_item.gui_panel:center_y())
	row_item.attached_icon:set_center_y(row_item.gui_panel:center_y())
	row_item.expand_line:set_lefttop(row_item.gui_panel:leftbottom())
	row_item.expand_line:set_left(row_item.expand_line:left())
end
function MenuItemWeaponUpgradeExpand:on_item_positions_done(row_item, node)
	if self:expanded() then
		local child = self._items[#self._items]
		local row_child = node.row_item(node, child)
		if row_child then
			row_item.bottom_line:set_lefttop(row_child.gui_panel:leftbottom())
			row_item.bottom_line:set_top(row_item.bottom_line:top() - 1)
		end
	end
end
function MenuItemWeaponUpgradeExpand:on_buy(node)
	self:update_expanded_items(node)
end
function MenuItemWeaponUpgradeExpand:on_attach_upgrade(node)
	for _, item in ipairs(self:parameters().parent_item:items()) do
		local row_item = node:row_item(item)
		item:reload(row_item, node)
	end
end
function MenuItemWeaponUpgradeExpand:reload(row_item, node)
	MenuItemWeaponUpgradeExpand.super.reload(self, row_item, node)
	row_item.expanded_indicator:set_position(row_item.gui_panel:position())
	row_item.expanded_indicator:set_center_y(row_item.gui_panel:center_y())
	row_item.expanded_indicator:set_visible(self:expanded())
	row_item.expand_line:set_w(row_item.gui_panel:w())
	row_item.bottom_line:set_visible(self:expanded() and self:parameter("unlocked"))
	local upgrades = Global.blackmarket_manager.weapon_upgrades[self:parameter("weapon_id")]
	self._parameters.attached = upgrades and upgrades[self:parameter("weapon_upgrade")].attached or false
	row_item.attached_icon:set_visible(self._parameters.attached)
	if self:expanded() then
		row_item.expanded_indicator:set_color(Color.white)
		row_item.menu_unselected:set_color(Color(1, 0.5, 0))
	else
		row_item.menu_unselected:set_color(Color(0.5, 0.5, 0.5))
	end
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponUpgradeExpand:highlight_row_item(node, row_item, mouse_over)
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponUpgradeExpand:fade_row_item(node, row_item, mouse_over)
	self:_set_row_item_state(node, row_item)
end
function MenuItemWeaponUpgradeExpand:_set_row_item_state(node, row_item)
	if self:expanded() or row_item.highlighted then
		row_item.upgrade_name:set_color(Color.black)
		row_item.upgrade_name:set_font(tweak_data.menu.default_font_no_outline_id)
	else
		row_item.upgrade_name:set_color(self:parameter("owned") and self:parameter("unlocked") and row_item.color or Color(1, 0.5, 0.5, 0.5))
		row_item.upgrade_name:set_font(tweak_data.menu.default_font_id)
	end
end
function MenuItemWeaponUpgradeExpand:on_delete_row_item(row_item, ...)
	MenuItemWeaponUpgradeExpand.super.on_delete_row_item(self, row_item, ...)
	row_item.gui_panel:parent():remove(row_item.attached_icon)
	row_item.gui_panel:parent():remove(row_item.bottom_line)
end
function MenuItemWeaponUpgradeExpand:_max_condition()
	return 16
end
function MenuItemWeaponUpgradeExpand:_at_max_condition()
	return self._parameters.condition == self:_max_condition()
end
MenuItemWeaponUpgradeAction = MenuItemWeaponUpgradeAction or class(MenuItemExpandAction)
function MenuItemWeaponUpgradeAction:init(data_node, parameters)
	MenuItemWeaponUpgradeAction.super.init(self, data_node, parameters)
end
