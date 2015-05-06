require("lib/states/GameState")
ServerLeftState = ServerLeftState or class(MissionEndState)
function ServerLeftState:init(game_state_machine, setup)
	ServerLeftState.super.init(self, "server_left", game_state_machine, setup)
end
function ServerLeftState:at_enter(...)
	self._success = false
	self._server_left = true
	self._completion_bonus_done = true
	ServerLeftState.super.at_enter(self, ...)
	if Network:multiplayer() then
		self:_shut_down_network()
	end
	self:_create_server_left_dialog()
end
function ServerLeftState:on_server_left()
end
function ServerLeftState:_create_server_left_dialog()
	MenuMainState._create_server_left_dialog(self)
end
function ServerLeftState:_load_start_menu()
	if not managers.job:stage_success() or not managers.job:on_last_stage() then
		setup:load_start_menu()
	end
end
function ServerLeftState:on_server_left_ok_pressed()
	self._completion_bonus_done = true
	self:_set_continue_button_text()
end
