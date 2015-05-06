FadeoutGuiObject = FadeoutGuiObject or class()
function FadeoutGuiObject:init(params)
	Global.FadeoutObjects = Global.FadeoutObjects or {}
	table.insert(Global.FadeoutObjects, self)
	params = params or {}
	local sustain = params.sustain or 0
	local fade_out_t = params.fade_out or 0
	local fade_color = params.color or Color.black
	local show_loding_icon = params.show_loading_icon or true
	local loading_texture = params.loading_texture or "guis/textures/icon_loading"
	self._ws = managers.gui_data:create_fullscreen_workspace()
	self._panel = self._ws:panel()
	self._panel:set_layer(1000)
	if show_loding_icon then
		local loading_icon = self._panel:bitmap({
			name = "loading_icon",
			texture = loading_texture
		})
		loading_icon:set_position(managers.gui_data:safe_to_full(0, 0))
		loading_icon:set_center_y(self._panel:h() / 2)
		local spin_forever_animation = function(o)
			local dt
			while true do
				dt = coroutine.yield()
				o:rotate(dt * 180)
			end
		end
		loading_icon:animate(spin_forever_animation)
	end
	local function fade_out_animation(panel)
		local loading_icon = panel:child("loading_icon")
		wait(sustain)
		over(fade_out_t, function(p)
			panel:set_alpha(1 - p)
			if alive(loading_icon) then
				loading_icon:set_alpha(1 - p)
			end
		end)
		Application:debug("FadeoutGuiObject: Destroy")
		Overlay:gui():destroy_workspace(self._ws)
		table.delete(Global.FadeoutObjects, self)
	end
	Application:debug("FadeoutGuiObject: Fadeout")
	self._panel:animate(fade_out_animation)
end
