WeaponLionGadget1 = WeaponLionGadget1 or class(WeaponGadgetBase)
WeaponLionGadget1.GADGET_TYPE = "liongadget1"
WeaponLionGadget1._bipod_wanted_t = nil
WeaponLionGadget1._previous_state = nil
function WeaponLionGadget1:init(unit)
	WeaponLionGadget1.super.init(self, unit)
	self._is_npc = false
end
function WeaponLionGadget1:update(unit, t, dt)
end
function WeaponLionGadget1:set_npc()
	self._is_npc = true
end
function WeaponLionGadget1:is_usable()
	if self._is_npc then
		return
	end
	if not managers.player:player_unit():mover():standing() or managers.player:current_state() ~= "standard" or managers.player:player_unit():inventory():equipped_unit():base():selection_index() ~= 2 then
		return false
	end
	local mvec1 = Vector3()
	local mvec2 = Vector3()
	local mvec_look_dir = Vector3()
	local mvec_gun_down_dir = Vector3()
	local bipod_max_length = 75
	local bipod_min_length = 10
	local from = mvec1
	local to = mvec2
	if not self._bipod_obj and self._unit:parent() then
		self._bipod_obj = self._unit:parent():get_object(Idstring("a_bp"))
		if not self._bipod_obj then
			return false
		end
	end
	mrotation.y(self._bipod_obj:rotation(), mvec_look_dir)
	mrotation.x(self._bipod_obj:rotation(), mvec_gun_down_dir)
	mvector3.set(from, self._bipod_obj:position())
	mvector3.set(to, mvec_gun_down_dir)
	mvector3.multiply(to, bipod_max_length)
	mvector3.rotate_with(to, Rotation(mvec_look_dir, 120))
	mvector3.add(to, from)
	local ray_bipod_left = self._unit:raycast(from, to)
	mvector3.set(to, mvec_gun_down_dir)
	mvector3.multiply(to, bipod_max_length)
	mvector3.rotate_with(to, Rotation(mvec_look_dir, 60))
	mvector3.add(to, from)
	local ray_bipod_right = self._unit:raycast(from, to)
	if ray_bipod_left then
	end
	if ray_bipod_right then
	end
	if ray_bipod_left and bipod_min_length > ray_bipod_left.distance then
		managers.hud:show_hint({
			text = managers.localization:text("hud_hint_bipod_nomount"),
			time = 2
		})
		return false
	end
	if ray_bipod_right and bipod_min_length > ray_bipod_right.distance then
		managers.hud:show_hint({
			text = managers.localization:text("hud_hint_bipod_nomount"),
			time = 2
		})
		return false
	end
	if ray_bipod_left or ray_bipod_right then
		return true
	end
	managers.hud:show_hint({
		text = managers.localization:text("hud_hint_bipod_nomount"),
		time = 2
	})
	return false
end
function WeaponLionGadget1:_check_state()
	if not self._is_npc then
		if self._on and self:is_usable() and managers.player:current_state() ~= "bipod" then
			self._previous_state = managers.player:current_state()
			managers.player:set_player_state("bipod")
		elseif managers.player:current_state() == "bipod" then
			self._bipod_wanted_t = nil
			managers.player:set_player_state(self._previous_state or "standard")
			self._previous_state = nil
		end
	end
	WeaponLionGadget1.super._check_state(self)
	self._unit:set_extension_update_enabled(Idstring("base"), self._on)
end
function WeaponLionGadget1:destroy(unit)
	WeaponLionGadget1.super.destroy(self, unit)
end
