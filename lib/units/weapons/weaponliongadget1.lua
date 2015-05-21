WeaponLionGadget1 = WeaponLionGadget1 or class(WeaponGadgetBase)
WeaponLionGadget1.GADGET_TYPE = "bipod"
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
function WeaponLionGadget1:is_bipod()
	return true
end
function WeaponLionGadget1:is_usable()
	if not self._center_ray_from or not self._center_ray_to then
		return nil
	end
	local ray_bipod_center = self._unit:raycast(self._center_ray_from, self._center_ray_to)
	local ray_bipod_left = self._unit:raycast(self._left_ray_from, self._left_ray_to)
	local ray_bipod_right = self._unit:raycast(self._right_ray_from, self._right_ray_to)
	return ray_bipod_center and (ray_bipod_left or ray_bipod_right)
end
function WeaponLionGadget1:_is_deployable()
	if self._is_npc then
		return false
	end
	if not self._bipod_obj and self._unit:parent() then
		self._bipod_obj = self._unit:parent():get_object(Idstring("a_bp"))
		if not self._bipod_obj then
			return false
		end
	end
	local is_reloading = false
	if managers.player:current_state() == "standard" and managers.player:player_unit():movement()._current_state then
		is_reloading = managers.player:player_unit():movement()._current_state:_is_reloading()
	end
	if not managers.player:player_unit():mover():standing() or managers.player:current_state() ~= "standard" and managers.player:current_state() ~= "carry" and managers.player:current_state() ~= "bipod" or managers.player:player_unit():inventory():equipped_unit():base():selection_index() ~= 2 or is_reloading then
		return false
	end
	local bipod_rays = self:_shoot_bipod_rays()
	if not bipod_rays then
		return false
	end
	local bipod_min_length = 5
	if bipod_rays.forward then
		return false
	end
	if bipod_rays.left and bipod_min_length > bipod_rays.left.distance then
		return false
	end
	if bipod_rays.right and bipod_min_length > bipod_rays.right.distance then
		return false
	end
	if (bipod_rays.left or bipod_rays.right) and bipod_rays.center or bipod_rays.center then
		return true
	end
	return false
end
function WeaponLionGadget1:_shoot_bipod_rays()
	local mvec1 = Vector3()
	local mvec2 = Vector3()
	local mvec3 = Vector3()
	local mvec_look_dir = Vector3()
	local mvec_gun_down_dir = Vector3()
	local from = mvec1
	local to = mvec2
	local from_offset = mvec3
	local bipod_max_length = 90
	mrotation.y(self._bipod_obj:rotation(), mvec_look_dir)
	mrotation.x(self._bipod_obj:rotation(), mvec_gun_down_dir)
	if mvec_look_dir:to_polar().pitch > 60 then
		return nil
	end
	mvector3.set(from, self._bipod_obj:position())
	mvector3.set(to, mvec_gun_down_dir)
	mvector3.multiply(to, bipod_max_length)
	mvector3.rotate_with(to, Rotation(mvec_look_dir, 120))
	mvector3.add(to, from)
	local ray_bipod_left = self._unit:raycast(from, to)
	self._left_ray_from = Vector3(from.x, from.y, from.z)
	self._left_ray_to = Vector3(to.x, to.y, to.z)
	mvector3.set(to, mvec_gun_down_dir)
	mvector3.multiply(to, bipod_max_length)
	mvector3.rotate_with(to, Rotation(mvec_look_dir, 60))
	mvector3.add(to, from)
	local ray_bipod_right = self._unit:raycast(from, to)
	self._right_ray_from = Vector3(from.x, from.y, from.z)
	self._right_ray_to = Vector3(to.x, to.y, to.z)
	mvector3.set(to, mvec_gun_down_dir)
	mvector3.multiply(to, bipod_max_length)
	mvector3.rotate_with(to, Rotation(mvec_look_dir, 90))
	mvector3.add(to, from)
	local ray_bipod_center = self._unit:raycast(from, to)
	self._center_ray_from = Vector3(from.x, from.y, from.z)
	self._center_ray_to = Vector3(to.x, to.y, to.z)
	mvector3.set(from_offset, Vector3(0, -100, 0))
	mvector3.rotate_with(from_offset, self._bipod_obj:rotation())
	mvector3.add(from, from_offset)
	mvector3.set(to, mvec_look_dir)
	mvector3.multiply(to, 500)
	mvector3.add(to, from)
	local ray_bipod_forward = self._unit:raycast(from, to)
	return {
		left = ray_bipod_left,
		right = ray_bipod_right,
		center = ray_bipod_center,
		forward = ray_bipod_forward
	}
end
function WeaponLionGadget1:_check_state()
	local bipod_deployable = self:_is_deployable()
	if not bipod_deployable and not self._on then
		managers.hud:show_hint({
			text = managers.localization:text("hud_hint_bipod_nomount"),
			time = 2
		})
	end
	self._on = false
	if not self._is_npc then
		if managers.player:current_state() ~= "bipod" and bipod_deployable then
			self._previous_state = managers.player:current_state()
			managers.player:set_player_state("bipod")
			self._on = true
		elseif managers.player:current_state() == "bipod" then
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
