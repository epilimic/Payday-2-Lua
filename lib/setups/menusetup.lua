require("lib/setups/Setup")
require("lib/network/base/NetworkManager")
require("lib/network/NetworkGame")
require("lib/managers/MoneyManager")
require("lib/managers/StatisticsManager")
require("lib/managers/MissionManager")
require("lib/managers/CriminalsManager")
require("lib/units/beings/player/PlayerAnimationData")
require("lib/units/menu/MenuMovement")
require("lib/units/MenuScriptUnitData")
require("lib/units/weapons/MenuRaycastWeaponBase")
require("lib/units/weapons/MenuShotgunBase")
require("lib/units/weapons/MenuSawWeaponBase")
require("lib/units/weapons/WeaponGadgetBase")
require("lib/units/weapons/WeaponFlashLight")
require("lib/units/weapons/WeaponLaser")
require("lib/units/weapons/WeaponSecondSight")
require("lib/units/weapons/WeaponSimpleAnim")
require("lib/units/weapons/WeaponLionGadget1")
core:import("SequenceManager")
MenuSetup = MenuSetup or class(Setup)
MenuSetup.IS_START_MENU = true
function MenuSetup:load_packages()
	Setup.load_packages(self)
	if not PackageManager:loaded("packages/start_menu") then
		PackageManager:load("packages/start_menu")
	end
	if not PackageManager:loaded("packages/load_level") then
		PackageManager:load("packages/load_level")
	end
	if not PackageManager:loaded("packages/load_default") then
		PackageManager:load("packages/load_default")
	end
	local prefix = "packages/dlcs/"
	local sufix = "/start_menu"
	local package = ""
	for dlc_package, bundled in pairs(tweak_data.BUNDLED_DLC_PACKAGES) do
		package = prefix .. tostring(dlc_package) .. sufix
		Application:debug("[MenuSetup:load_packages] DLC package: " .. package, "Is package OK to load?: " .. tostring(bundled))
		if bundled and (bundled == true or bundled == 1) and PackageManager:package_exists(package) and not PackageManager:loaded(package) then
			PackageManager:load(package)
		end
	end
	if not PackageManager:loaded("packages/game_base") then
		local _load_wip_func = function()
			if PackageManager:package_exists("packages/wip/game_base") then
				if not PackageManager:loaded("packages/wip/game_base") then
					PackageManager:load("packages/wip/game_base", function()
						Global._game_base_package_loaded = true
					end)
				end
			else
				Global._game_base_package_loaded = true
			end
		end
		PackageManager:load("packages/game_base", _load_wip_func)
	end
	if PackageManager:package_exists("packages/wip/start_menu") and not PackageManager:loaded("packages/wip/start_menu") then
		PackageManager:load("packages/wip/start_menu")
	end
end
function MenuSetup:gather_packages_to_unload()
	Setup.unload_packages(self)
	self._started_unloading_packages = true
	self._packages_to_unload = self._packages_to_unload or {}
	if not Global.load_start_menu then
		if PackageManager:loaded("packages/start_menu") then
		end
		local prefix = "packages/dlcs/"
		local sufix = "/start_menu"
		local package = ""
		for dlc_package, bundled in pairs(tweak_data.BUNDLED_DLC_PACKAGES) do
			package = prefix .. tostring(dlc_package) .. sufix
			if bundled and (bundled == true or bundled == 1) and PackageManager:package_exists(package) and PackageManager:loaded(package) then
				table.insert(self._packages_to_unload, package)
			end
		end
		if PackageManager:loaded("packages/wip/start_menu") then
			table.insert(self._packages_to_unload, "packages/wip/start_menu")
		end
	end
end
function MenuSetup:unload_packages()
	Setup.unload_packages(self)
	if PackageManager:loaded("packages/start_menu") then
		PackageManager:unload("packages/start_menu")
	end
end
function MenuSetup:init_game()
	local gsm = Setup.init_game(self)
	if not Application:editor() then
		local event_id, checkpoint_index, level, level_class_name, mission, world_setting, intro_skipped
		if not Global.exe_arguments_parsed then
			local arg_list = Application:argv()
			for i = 1, #arg_list do
				local arg = arg_list[i]
				if arg == "-event_id" then
					event_id = arg_list[i + 1]
					i = i + 1
				elseif arg == "-checkpoint_index" then
					checkpoint_index = tonumber(arg_list[i + 1])
					i = i + 1
				elseif arg == "-level" then
					level = arg_list[i + 1]
					i = i + 1
				elseif arg == "-class" then
					level_class_name = arg_list[i + 1]
					i = i + 1
				elseif arg == "-mission" then
					mission = arg_list[i + 1]
					i = i + 1
				elseif arg == "-world_setting" then
					world_setting = arg_list[i + 1]
					i = i + 1
				elseif arg == "-skip_intro" then
					game_state_machine:set_boot_intro_done(true)
					intro_skipped = true
				elseif arg == "+connect_lobby" then
					Global.boot_invite = arg_list[i + 1]
				end
			end
			Global.exe_arguments_parsed = true
		end
		if level then
			local preferred_index = managers.controller:get_preferred_default_wrapper_index()
			managers.user:set_index(preferred_index)
			managers.controller:set_default_wrapper_index(preferred_index)
			game_state_machine:set_boot_intro_done(true)
			managers.user:set_active_user_state_change_quit(true)
			managers.network:host_game()
			local level_id = tweak_data.levels:get_level_name_from_world_name(level)
			managers.network:session():load_level(level, mission, world_setting, level_class_name, level_id)
		elseif game_state_machine:is_boot_intro_done() then
			if game_state_machine:is_boot_from_sign_out() or intro_skipped then
				game_state_machine:change_state_by_name("menu_titlescreen")
			else
				game_state_machine:change_state_by_name("menu_main")
			end
		else
			game_state_machine:change_state_by_name("bootup")
		end
	end
	return gsm
end
function MenuSetup:init_managers(managers)
	Setup.init_managers(self, managers)
	managers.sequence:preload()
	managers.menu_scene = MenuSceneManager:new()
	managers.money = MoneyManager:new()
	managers.statistics = StatisticsManager:new()
	managers.network = NetworkManager:new("NetworkGame")
end
function MenuSetup:init_finalize()
	Setup.init_finalize(self)
	if managers.network:session() then
		managers.network:init_finalize()
	end
	if SystemInfo:platform() == Idstring("PS3") then
		if not Global.hdd_space_checked then
			managers.savefile:check_space_required()
			self.update = self.update_wait_for_savegame_info
		else
			managers.achievment:chk_install_trophies()
		end
	end
	if SystemInfo:platform() == Idstring("PS4") then
		managers.achievment:chk_install_trophies()
	end
	if managers.music then
		managers.music:init_finalize()
	end
	if managers.challenge then
		managers.challenge:init_finalize()
	end
	managers.dyn_resource:post_init()
end
function MenuSetup:update_wait_for_savegame_info(t, dt)
	managers.savefile:update(t, dt)
	print("Checking fetch_savegame_hdd_space_required")
	if managers.savefile:fetch_savegame_hdd_space_required() then
		Application:check_sufficient_hdd_space_to_launch(managers.savefile:fetch_savegame_hdd_space_required(), managers.dlc:has_full_game())
		if SystemInfo:platform() == Idstring("PS3") or SystemInfo:platform() == Idstring("PS4") then
			Trophies:set_translation_text(managers.localization:text("err_load"), managers.localization:text("err_ins"), managers.localization:text("err_disk"))
			managers.achievment:chk_install_trophies()
		end
		Global.hdd_space_checked = true
		self.update = nil
	end
end
function MenuSetup:update(t, dt)
	Setup.update(self, t, dt)
	managers.crimenet:update(t, dt)
	managers.network:update(t, dt)
end
function MenuSetup:paused_update(t, dt)
	Setup.paused_update(self, t, dt)
	managers.network:update(t, dt)
end
function MenuSetup:end_update(t, dt)
	Setup.end_update(self, t, dt)
	managers.network:end_update()
end
function MenuSetup:paused_end_update(t, dt)
	Setup.paused_end_update(self, t, dt)
	managers.network:end_update()
end
function MenuSetup:destroy()
	MenuSetup.super.destroy(self)
end
return MenuSetup
