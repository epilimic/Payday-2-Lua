local selected_setup
if Global.load_level then
	if Global.network then
		selected_setup = require("lib/setups/NetworkGameSetup")
	else
		selected_setup = require("lib/setups/GameSetup")
	end
elseif Global.load_start_menu then
	selected_setup = require("lib/setups/MenuSetup")
elseif Application:editor() then
	selected_setup = require("lib/setups/NetworkGameSetup")
else
	selected_setup = require("lib/setups/MenuSetup")
end
setup = setup or selected_setup:new()
setup:make_entrypoint()
