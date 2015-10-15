GuiTweakData = GuiTweakData or class()
function GuiTweakData:init()
	local soundtrack = {
		id = "soundtrack",
		name_id = "menu_content_soundtrack",
		desc_id = "menu_content_soundtrack_desc",
		date_id = "menu_content_soundtrack_date",
		store = 254260,
		image = "guis/textures/pd2/content_updates/soundtrack"
	}
	local diamond_store = {
		id = "diamond_store",
		name_id = "menu_content_diamond_store",
		desc_id = "menu_content_diamond_store_desc",
		date_id = "menu_content_diamond_store_date",
		store = 274160,
		image = "guis/textures/pd2/content_updates/diamond_store"
	}
	local birthday = {
		id = "birthday",
		name_id = "menu_content_birthday",
		desc_id = "menu_content_birthday_desc",
		date_id = "menu_content_birthday_date",
		webpage = "http://www.overkillsoftware.com/birthday/",
		image = "guis/textures/pd2/content_updates/birthday"
	}
	local halloween = {
		id = "halloween",
		name_id = "menu_content_halloween",
		desc_id = "menu_content_halloween_desc",
		date_id = "menu_content_halloween_date",
		webpage = "http://www.overkillsoftware.com/helltopay/",
		image = "guis/textures/pd2/content_updates/halloween"
	}
	local armored_transport = {
		id = "armored_transport",
		name_id = "menu_content_armored_transport",
		desc_id = "menu_content_armored_transport_desc",
		date_id = "menu_content_armored_transport_date",
		store = 264610,
		image = "guis/textures/pd2/content_updates/armored_transport"
	}
	local gage_pack = {
		id = "gage_pack",
		name_id = "menu_content_gage_pack",
		desc_id = "menu_content_gage_pack_desc",
		date_id = "menu_content_gage_pack_date",
		store = 267380,
		image = "guis/textures/pd2/content_updates/gage_pack"
	}
	local charliesierra = {
		id = "charliesierra",
		name_id = "menu_content_charliesierra",
		desc_id = "menu_content_charliesierra_desc",
		date_id = "menu_content_charliesierra_date",
		store = 271110,
		image = "guis/textures/pd2/content_updates/charliesierra"
	}
	local christmas = {
		id = "christmas",
		name_id = "menu_content_christmas",
		desc_id = "menu_content_christmas_desc",
		date_id = "menu_content_christmas_date",
		store = 267381,
		image = "guis/textures/pd2/content_updates/christmas"
	}
	local infamy = {
		id = "infamy",
		name_id = "menu_content_infamy",
		desc_id = "menu_content_infamy_desc",
		date_id = "menu_content_infamy_date",
		store = 274161,
		image = "guis/textures/pd2/content_updates/infamy_introduction"
	}
	local gage_pack_lmg = {
		id = "gage_pack_lmg",
		name_id = "menu_content_gage_pack_lmg",
		desc_id = "menu_content_gage_pack_lmg_desc",
		date_id = "menu_content_gage_pack_lmg_date",
		store = 275590,
		image = "guis/textures/pd2/content_updates/gage_pack_lmg"
	}
	local deathwish = {
		id = "deathwish",
		name_id = "menu_content_deathwish",
		desc_id = "menu_content_deathwish_desc",
		date_id = "menu_content_deathwish_date",
		store = 284430,
		image = "guis/textures/pd2/content_updates/deathwish"
	}
	local election_day = {
		id = "election_day",
		name_id = "menu_content_election_day",
		desc_id = "menu_content_election_day_desc",
		date_id = "menu_content_election_day_date",
		store = 288900,
		image = "guis/textures/pd2/content_updates/election_day"
	}
	local gage_pack_jobs = {
		id = "gage_pack_jobs",
		name_id = "menu_content_gage_pack_jobs",
		desc_id = "menu_content_gage_pack_jobs_desc",
		date_id = "menu_content_gage_pack_jobs_date",
		store = 259381,
		image = "guis/textures/pd2/content_updates/gage_pack_jobs"
	}
	local gage_pack_snp = {
		id = "gage_pack_snp",
		name_id = "menu_content_gage_pack_snp",
		desc_id = "menu_content_gage_pack_snp_desc",
		date_id = "menu_content_gage_pack_snp_date",
		store = 259380,
		image = "guis/textures/pd2/content_updates/gage_pack_snp"
	}
	local kosugi = {
		id = "kosugi",
		name_id = "menu_content_kosugi",
		desc_id = "menu_content_kosugi_desc",
		date_id = "menu_content_kosugi_date",
		store = 267382,
		image = "guis/textures/pd2/content_updates/kosugi"
	}
	local big_bank = {
		id = "big_bank",
		name_id = "menu_content_big_bank",
		desc_id = "menu_content_big_bank_desc",
		date_id = "menu_content_big_bank_date",
		store = 306690,
		image = "guis/dlcs/big_bank/textures/pd2/content_updates/big_bank"
	}
	local gage_pack_shotgun = {
		id = "gage_pack_shotgun",
		name_id = "menu_content_gage_pack_shotgun",
		desc_id = "menu_content_gage_pack_shotgun_desc",
		date_id = "menu_content_gage_pack_shotgun_date",
		store = 311050,
		image = "guis/dlcs/gage_pack_shotgun/textures/pd2/content_updates/gage_pack_shotgun"
	}
	local gage_pack_assault = {
		id = "gage_pack_assault",
		name_id = "menu_content_gage_pack_assault",
		desc_id = "menu_content_gage_pack_assault_desc",
		date_id = "menu_content_gage_pack_assault_date",
		store = 320030,
		image = "guis/dlcs/gage_pack_assault/textures/pd2/content_updates/gage_pack_assault"
	}
	local jukebox = {
		id = "jukebox",
		name_id = "menu_content_jukebox",
		desc_id = "menu_content_jukebox_desc",
		date_id = "menu_content_jukebox_date",
		webpage = "http://www.overkillsoftware.com/bigfatmusicupdate/",
		image = "guis/textures/pd2/content_updates/jukebox"
	}
	local hl_miami = {
		id = "hl_miami",
		name_id = "menu_content_hl_miami",
		desc_id = "menu_content_hl_miami_desc",
		date_id = "menu_content_hl_miami_date",
		store = 323500,
		image = "guis/dlcs/hl_miami/textures/pd2/content_updates/hl_miami"
	}
	local crimefest = {
		id = "crimefest",
		name_id = "menu_content_crimefest",
		desc_id = "menu_content_crimefest_desc",
		date_id = "menu_content_crimefest_date",
		webpage = "http://www.overkillsoftware.com/crimefest/mrated.html",
		image = "guis/textures/pd2/content_updates/crimefest"
	}
	local jowi = {
		id = "jowi",
		name_id = "menu_content_jowi",
		desc_id = "menu_content_jowi_desc",
		date_id = "menu_content_jowi_date",
		store = 330010,
		image = "guis/textures/pd2/content_updates/jowi"
	}
	local hoxton_char = {
		id = "hoxton_char",
		name_id = "menu_content_hoxton_char",
		desc_id = "menu_content_hoxton_char_desc",
		date_id = "menu_content_hoxton_char_date",
		store = 330490,
		image = "guis/textures/pd2/content_updates/hoxton_char"
	}
	local hoxton_job = {
		id = "hoxton_job",
		name_id = "menu_content_hoxton_job",
		desc_id = "menu_content_hoxton_job_desc",
		date_id = "menu_content_hoxton_job_date",
		store = 330491,
		image = "guis/textures/pd2/content_updates/hoxton_job"
	}
	local halloween_2014 = {
		id = "halloween_2014",
		name_id = "menu_content_halloween_2014",
		desc_id = "menu_content_halloween_2014_desc",
		date_id = "menu_content_halloween_2014_date",
		webpage = "http://www.overkillsoftware.com/halloween/",
		image = "guis/textures/pd2/content_updates/halloween_2014"
	}
	local gage_pack_historical = {
		id = "gage_pack_historical",
		name_id = "menu_content_gage_pack_historical",
		desc_id = "menu_content_gage_pack_historical_desc",
		date_id = "menu_content_gage_pack_historical_date",
		store = 331900,
		image = "guis/dlcs/gage_pack_historical/textures/pd2/content_updates/gage_pack_historical"
	}
	local christmas_2014 = {
		id = "christmas_2014",
		name_id = "menu_content_christmas_2014",
		desc_id = "menu_content_christmas_2014_desc",
		date_id = "menu_content_christmas_2014_date",
		webpage = "http://www.overkillsoftware.com/whitechristmas/",
		image = "guis/dlcs/pines/textures/pd2/content_updates/christmas_2014"
	}
	local character_pack_clover = {
		id = "character_pack_clover",
		name_id = "menu_content_character_pack_clover",
		desc_id = "menu_content_character_pack_clover_desc",
		date_id = "menu_content_character_pack_clover_date",
		store = 337661,
		image = "guis/dlcs/character_pack_clover/textures/pd2/content_updates/character_pack_clover"
	}
	local hope_diamond = {
		id = "hope_diamond",
		name_id = "menu_content_hope_diamond",
		desc_id = "menu_content_hope_diamond_desc",
		date_id = "menu_content_hope_diamond_date",
		store = 337660,
		image = "guis/dlcs/character_pack_clover/textures/pd2/content_updates/hope_diamond"
	}
	local hw_boxing = {
		id = "hw_boxing",
		name_id = "menu_content_hw_boxing",
		desc_id = "menu_content_hw_boxing_desc",
		date_id = "menu_content_hw_boxing_date",
		webpage = "http://www.overkillsoftware.com/happynewyear/",
		image = "guis/dlcs/pd2_hw_boxing/textures/pd2/content_updates/hw_boxing"
	}
	local character_pack_dragan = {
		id = "character_pack_dragan",
		name_id = "menu_content_character_pack_dragan",
		desc_id = "menu_content_character_pack_dragan_desc",
		date_id = "menu_content_character_pack_dragan_date",
		store = 344140,
		image = "guis/dlcs/character_pack_dragan/textures/pd2/content_updates/dragan"
	}
	local the_bomb = {
		id = "the_bomb",
		name_id = "menu_content_the_bomb",
		desc_id = "menu_content_the_bomb_desc",
		date_id = "menu_content_the_bomb_date",
		store = 339480,
		image = "guis/dlcs/the_bomb/textures/pd2/content_updates/the_bomb"
	}
	local akm4_pack = {
		id = "akm4_pack",
		name_id = "menu_content_akm4_pack",
		desc_id = "menu_content_akm4_pack_desc",
		date_id = "menu_content_akm4_pack_date",
		store = 351890,
		image = "guis/dlcs/dlc_akm4/textures/pd2/content_updates/akm4_pack"
	}
	local infamy_2_0 = {
		id = "infamy_2_0",
		name_id = "menu_content_infamy_2_0",
		desc_id = "menu_content_infamy_2_0_desc",
		date_id = "menu_content_infamy_2_0_date",
		webpage = "http://www.overkillsoftware.com/games/infamy2/",
		image = "guis/dlcs/infamous/textures/pd2/content_updates/infamy_2_0"
	}
	local overkill_pack = {
		id = "overkill_pack",
		name_id = "menu_content_overkill_pack",
		desc_id = "menu_content_overkill_pack_desc",
		date_id = "menu_content_overkill_pack_date",
		store = 348090,
		image = "guis/dlcs/dlc_pack_overkill/textures/pd2/content_updates/overkill_pack"
	}
	local complete_overkill_pack = {
		id = "complete_overkill_pack",
		name_id = "menu_content_complete_overkill_pack",
		desc_id = "menu_content_complete_overkill_pack_desc",
		date_id = "menu_content_complete_overkill_pack_date",
		webpage = "http://www.overkillsoftware.com/thehypetrain/",
		image = "guis/dlcs/dlc_pack_overkill/textures/pd2/content_updates/complete_overkill_pack"
	}
	local hlm2 = {
		id = "hlm2",
		name_id = "menu_content_hlm2",
		desc_id = "menu_content_hlm2_desc",
		date_id = "menu_content_hlm2_date",
		store = 274170,
		image = "guis/dlcs/hlm2/textures/pd2/content_updates/hlm2"
	}
	local hlm2_deluxe = {
		id = "hlm2_deluxe",
		name_id = "menu_content_hlm2_deluxe",
		desc_id = "menu_content_hlm2_deluxe_desc",
		date_id = "menu_content_hlm2_deluxe_date",
		store = 274170,
		image = "guis/dlcs/hlm2/textures/pd2/content_updates/hlm2_deluxe"
	}
	local bbq = {
		id = "bbq",
		name_id = "menu_content_bbq",
		desc_id = "menu_content_bbq_desc",
		date_id = "menu_content_bbq_date",
		store = 337661,
		webpage = "http://www.overkillsoftware.com/bbq/",
		image = "guis/textures/pd2/content_updates/bbq"
	}
	local springbreak = {
		id = "springbreak",
		name_id = "menu_content_springbreak",
		desc_id = "menu_content_springbreak_desc",
		date_id = "menu_content_springbreak_date",
		webpage = "http://www.overkillsoftware.com/springbreak/",
		image = "guis/textures/pd2/content_updates/springbreak"
	}
	local bbq = {
		id = "bbq",
		name_id = "menu_content_bbq",
		desc_id = "menu_content_bbq_desc",
		date_id = "menu_content_bbq_date",
		store = 358150,
		image = "guis/dlcs/bbq/textures/pd2/content_updates/bbq"
	}
	local fpsanimation = {
		id = "fpsanimation",
		name_id = "menu_content_fpsanimation",
		desc_id = "menu_content_fpsanimation_desc",
		date_id = "menu_content_fpsanimation_date",
		webpage = "http://www.overkillsoftware.com/animations-update/",
		image = "guis/textures/pd2/content_updates/fpsanimation"
	}
	local springcleaning = {
		id = "springcleaning",
		name_id = "menu_content_springcleaning",
		desc_id = "menu_content_springcleaning_desc",
		date_id = "menu_content_springcleaning_date",
		webpage = "http://steamcommunity.com/games/218620/announcements/detail/177107167839449807",
		image = "guis/textures/pd2/content_updates/springcleaning"
	}
	local west = {
		id = "west",
		name_id = "menu_content_west",
		desc_id = "menu_content_west_desc",
		date_id = "menu_content_west_date",
		store = 349830,
		image = "guis/dlcs/west/textures/pd2/content_updates/west"
	}
	local bsides = {
		id = "bsides",
		name_id = "menu_content_bsides",
		desc_id = "menu_content_bsides_desc",
		date_id = "menu_content_bsides_date",
		store = 368870,
		image = "guis/textures/pd2/content_updates/bsides"
	}
	local shoutout = {
		id = "shoutout",
		name_id = "menu_content_shoutout",
		desc_id = "menu_content_shoutout_desc",
		date_id = "menu_content_shoutout_date",
		webpage = "http://www.overkillsoftware.com/meltdown/",
		image = "guis/textures/pd2/content_updates/shoutout"
	}
	local arena = {
		id = "arena",
		name_id = "menu_content_arena",
		desc_id = "menu_content_arena_desc",
		date_id = "menu_content_arena_date",
		store = 366660,
		image = "guis/dlcs/dlc_arena/textures/pd2/content_updates/arena"
	}
	local character_pack_sokol = {
		id = "character_pack_sokol",
		name_id = "menu_content_character_pack_sokol",
		desc_id = "menu_content_character_pack_sokol_desc",
		date_id = "menu_content_character_pack_sokol_date",
		store = 374301,
		image = "guis/dlcs/character_pack_sokol/textures/pd2/content_updates/sokol"
	}
	local kenaz = {
		id = "kenaz",
		name_id = "menu_content_kenaz",
		desc_id = "menu_content_kenaz_desc",
		date_id = "menu_content_kenaz_date",
		store = 374300,
		image = "guis/dlcs/kenaz/textures/pd2/content_updates/kenaz"
	}
	local turtles = {
		id = "turtles",
		name_id = "menu_content_turtles",
		desc_id = "menu_content_turtles_desc",
		date_id = "menu_content_turtles_date",
		store = 384021,
		image = "guis/dlcs/turtles/textures/pd2/content_updates/turtles"
	}
	local dragon = {
		id = "dragon",
		name_id = "menu_content_dragon",
		desc_id = "menu_content_dragon_desc",
		date_id = "menu_content_dragon_date",
		store = 384020,
		image = "guis/dlcs/dragon/textures/pd2/content_updates/dragon"
	}
	local steel = {
		id = "steel",
		name_id = "menu_content_steel",
		desc_id = "menu_content_steel_desc",
		date_id = "menu_content_steel_date",
		store = 401650,
		image = "guis/dlcs/steel/textures/pd2/content_updates/steel"
	}
	local gordon = {
		id = "gordon",
		name_id = "menu_content_gordon",
		desc_id = "menu_content_gordon_desc",
		date_id = "menu_content_gordon_date",
		webpage = "http://www.overkillsoftware.com/fbifiles/",
		image = "guis/dlcs/gordon/textures/pd2/content_updates/gordon"
	}
	self.content_updates = {
		title_id = "menu_content_updates",
		choice_id = "menu_content_updates_previous",
		num_items = 6
	}
	if SystemInfo:platform() == Idstring("WIN32") then
		self.content_updates.item_list = {
			soundtrack,
			diamond_store,
			birthday,
			halloween,
			armored_transport,
			gage_pack,
			charliesierra,
			christmas,
			infamy,
			gage_pack_lmg,
			deathwish,
			election_day,
			gage_pack_jobs,
			gage_pack_snp,
			kosugi,
			big_bank,
			gage_pack_shotgun,
			gage_pack_assault,
			jukebox,
			hl_miami,
			crimefest,
			jowi,
			hoxton_char,
			hoxton_job,
			halloween_2014,
			gage_pack_historical,
			christmas_2014,
			hope_diamond,
			character_pack_clover,
			hw_boxing,
			the_bomb,
			character_pack_dragan,
			akm4_pack,
			infamy_2_0,
			overkill_pack,
			complete_overkill_pack,
			hlm2,
			hlm2_deluxe,
			springbreak,
			bbq,
			west,
			springcleaning,
			bsides,
			shoutout,
			arena,
			kenaz,
			character_pack_sokol,
			turtles,
			dragon,
			steel,
			gordon
		}
	elseif SystemInfo:platform() == Idstring("PS3") then
		self.content_updates.item_list = {
			armored_transport,
			gage_pack,
			gage_pack_lmg
		}
	elseif SystemInfo:platform() == Idstring("PS4") then
		self.content_updates.item_list = {armored_transport}
	elseif SystemInfo:platform() == Idstring("XB1") then
		self.content_updates.item_list = {armored_transport}
	elseif SystemInfo:platform() == Idstring("X360") then
		self.content_updates.item_list = {}
	end
	self.fav_videos = {
		title_id = "menu_fav_videos",
		choice_id = nil,
		num_items = 3,
		db_url = "http://www.overkillsoftware.com/?page_id=1263",
		button = {
			text_id = "menu_fav_video_homepage",
			url = "http://www.overkillsoftware.com/?page_id=1263"
		},
		item_list = {
			{
				id = "fav3",
				image = "guis/textures/pd2/fav_video3",
				use_db = true
			},
			{
				id = "fav2",
				image = "guis/textures/pd2/fav_video2",
				use_db = true
			},
			{
				id = "fav1",
				image = "guis/textures/pd2/fav_video1",
				use_db = true
			}
		}
	}
	self.masks_sort_order = {
		"aviator",
		"plague",
		"welder",
		"smoker",
		"ghost",
		"skullhard",
		"skullveryhard",
		"skulloverkill",
		"skulloverkillplus"
	}
	self.blackscreen_risk_textures = {
		overkill_290 = "guis/textures/pd2/risklevel_deathwish_blackscreen"
	}
	self.suspicion_to_visibility = {}
	self.suspicion_to_visibility[1] = {}
	self.suspicion_to_visibility[1].name_id = "bm_menu_concealment_low"
	self.suspicion_to_visibility[1].max_index = 9
	self.suspicion_to_visibility[2] = {}
	self.suspicion_to_visibility[2].name_id = "bm_menu_concealment_medium"
	self.suspicion_to_visibility[2].max_index = 20
	self.suspicion_to_visibility[3] = {}
	self.suspicion_to_visibility[3].name_id = "bm_menu_concealment_high"
	self.suspicion_to_visibility[3].max_index = 30
	self.mouse_pointer = {}
	self.mouse_pointer.controller = {}
	self.mouse_pointer.controller.acceleration_speed = 4
	self.mouse_pointer.controller.max_acceleration = 3
	self.mouse_pointer.controller.mouse_pointer_speed = 125
	local min_amount_masks = 72
	self.MASK_ROWS_PER_PAGE = 4
	self.MASK_COLUMNS_PER_PAGE = 4
	self.MAX_MASK_PAGES = math.ceil(min_amount_masks / (self.MASK_ROWS_PER_PAGE * self.MASK_COLUMNS_PER_PAGE))
	self.MAX_MASK_SLOTS = self.MAX_MASK_PAGES * self.MASK_ROWS_PER_PAGE * self.MASK_COLUMNS_PER_PAGE
	local min_amount_weapons = 72
	self.WEAPON_ROWS_PER_PAGE = 4
	self.WEAPON_COLUMNS_PER_PAGE = 4
	self.MAX_WEAPON_PAGES = math.ceil(min_amount_weapons / (self.WEAPON_ROWS_PER_PAGE * self.WEAPON_COLUMNS_PER_PAGE))
	self.MAX_WEAPON_SLOTS = self.MAX_WEAPON_PAGES * self.WEAPON_ROWS_PER_PAGE * self.WEAPON_COLUMNS_PER_PAGE
	self.fbi_files_webpage = "http://fbi.overkillsoftware.com/"
	self.crimefest_challenges_webpage = "http://www.overkillsoftware.com/games/roadtocrimefest/"
	self.crime_net = {}
	self.crime_net.controller = {}
	self.crime_net.controller.snap_distance = 50
	self.crime_net.controller.snap_speed = 5
	self.crime_net.job_vars = {}
	self.crime_net.job_vars.max_active_jobs = 10
	self.crime_net.job_vars.active_job_time = 25
	self.crime_net.job_vars.new_job_min_time = 1.5
	self.crime_net.job_vars.new_job_max_time = 3.5
	self.crime_net.job_vars.refresh_servers_time = 5
	self.crime_net.job_vars.total_active_jobs = 40
	self.crime_net.job_vars.max_active_server_jobs = 100
	self.crime_net.debug_options = {}
	self.crime_net.debug_options.regions = false
	self.crime_net.debug_options.mass_spawn = false
	self.crime_net.debug_options.mass_spawn_limit = 100
	self.crime_net.debug_options.mass_spawn_timer = 0.04
	self.rename_max_letters = 20
	self.rename_skill_set_max_letters = 15
	self.mod_preview_min_fov = -20
	self.mod_preview_max_fov = 3
	self.stats_present_multiplier = 10
	self.armor_damage_shake_base = 1.1
	self.buy_weapon_category_groups = {
		grenade_launcher = "wpn_special",
		saw = "wpn_special",
		minigun = "wpn_special",
		flamethrower = "wpn_special",
		bow = "wpn_special",
		crossbow = "wpn_special"
	}
	self.LONGEST_CHAR_NAME = "JOHN WICK"
	self.crime_net.regions = {
		{
			closed = true,
			text = {
				title_id = "cn_menu_georgetown_title",
				x = 348,
				y = 310
			},
			{
				-10,
				270,
				293,
				252,
				271,
				337,
				341,
				372,
				372,
				475,
				475,
				491,
				491,
				504,
				503,
				524,
				536,
				536,
				542,
				542,
				555,
				555,
				598,
				598,
				638,
				638,
				657,
				688,
				686,
				691,
				701,
				698,
				687,
				650,
				634,
				602,
				609,
				580,
				576,
				576,
				567,
				559,
				558,
				542,
				543,
				512,
				512,
				503,
				381,
				377,
				348,
				315,
				315,
				290,
				290,
				259,
				259,
				237,
				237,
				261,
				261,
				257,
				224,
				221,
				187,
				182,
				163,
				163,
				147,
				147,
				133,
				133,
				102,
				102,
				-10
			},
			{
				-10,
				-10,
				28,
				73,
				122,
				123,
				132,
				141,
				145,
				172,
				216,
				215,
				180,
				179,
				229,
				228,
				244,
				253,
				253,
				248,
				247,
				241,
				241,
				219,
				219,
				209,
				208,
				234,
				241,
				242,
				262,
				270,
				277,
				276,
				279,
				296,
				300,
				362,
				361,
				408,
				416,
				417,
				430,
				430,
				477,
				477,
				514,
				523,
				523,
				514,
				514,
				501,
				493,
				484,
				469,
				469,
				465,
				465,
				439,
				440,
				434,
				430,
				429,
				433,
				433,
				438,
				438,
				423,
				423,
				435,
				435,
				423,
				423,
				412,
				412
			}
		},
		{
			closed = true,
			{
				340,
				350,
				350,
				373,
				373,
				368,
				368,
				358,
				358,
				351,
				351,
				340
			},
			{
				103,
				103,
				106,
				106,
				116,
				116,
				123,
				123,
				116,
				116,
				122,
				121
			}
		},
		{
			closed = true,
			{
				564,
				576,
				576,
				564
			},
			{
				189,
				189,
				208,
				208
			}
		},
		{
			closed = true,
			{
				147,
				168,
				164,
				144
			},
			{
				444,
				451,
				463,
				457
			}
		},
		{
			closed = true,
			{
				168,
				185,
				181,
				166
			},
			{
				463,
				468,
				478,
				473
			}
		},
		{
			closed = true,
			{
				371,
				417,
				417,
				414,
				371
			},
			{
				534,
				534,
				554,
				557,
				538
			}
		},
		{
			closed = true,
			{
				422,
				509,
				509,
				500,
				500,
				477,
				477,
				466,
				457,
				457,
				447,
				422
			},
			{
				534,
				534,
				548,
				559,
				585,
				585,
				575,
				581,
				581,
				573,
				573,
				557
			}
		},
		{
			closed = true,
			text = {
				title_id = "cn_menu_westend_title",
				x = 789,
				y = 418
			},
			{
				519,
				530,
				517,
				528,
				522,
				540,
				538,
				544,
				549,
				561,
				565,
				571,
				566,
				574,
				579,
				609,
				613,
				630,
				628,
				644,
				641,
				662,
				665,
				703,
				696,
				721,
				721,
				756,
				756,
				767,
				767,
				736,
				709,
				701,
				651,
				651,
				640,
				623,
				634,
				608,
				591,
				581,
				599,
				599,
				551,
				541,
				598,
				598,
				640,
				735,
				735,
				751,
				760,
				766,
				771,
				831,
				831,
				882,
				882,
				922,
				922,
				976,
				976,
				1031,
				1036,
				1019,
				1020,
				994,
				1063,
				1063,
				1068,
				1098,
				1104,
				1113,
				1123,
				1132,
				1175,
				1175,
				1184,
				1184,
				1171,
				1171,
				1161,
				1161,
				1169,
				1169,
				1185,
				1185,
				1168,
				1168,
				1175,
				1175,
				1193,
				1193,
				1175,
				1175,
				1170,
				1170,
				1190,
				1190,
				1171,
				1171
			},
			{
				-10,
				13,
				23,
				34,
				42,
				57,
				61,
				68,
				63,
				75,
				69,
				74,
				79,
				87,
				82,
				113,
				110,
				128,
				131,
				144,
				148,
				169,
				165,
				199,
				207,
				226,
				239,
				258,
				276,
				284,
				305,
				341,
				340,
				331,
				331,
				343,
				338,
				364,
				369,
				428,
				428,
				452,
				460,
				514,
				514,
				540,
				540,
				586,
				636,
				636,
				552,
				549,
				545,
				539,
				529,
				529,
				533,
				533,
				530,
				530,
				537,
				537,
				530,
				530,
				521,
				483,
				480,
				416,
				382,
				345,
				340,
				353,
				348,
				346,
				346,
				350,
				328,
				297,
				297,
				269,
				269,
				247,
				247,
				222,
				222,
				182,
				182,
				170,
				170,
				116,
				116,
				111,
				111,
				85,
				85,
				68,
				68,
				60,
				60,
				31,
				31,
				-10
			}
		},
		{
			closed = false,
			text = {
				title_id = "cn_menu_foggy_bottom_title",
				x = 858,
				y = 704
			},
			{
				1031,
				1052,
				1039,
				1039,
				1045,
				1045,
				1039,
				1039,
				1000,
				990,
				972,
				972,
				927,
				908,
				901,
				882,
				882,
				722,
				693,
				693,
				686,
				685,
				676,
				676,
				688,
				693,
				730,
				730,
				679,
				670,
				664,
				664,
				667,
				667,
				673,
				669,
				674,
				652,
				652
			},
			{
				530,
				574,
				575,
				616,
				616,
				667,
				667,
				893,
				893,
				883,
				883,
				855,
				855,
				842,
				853,
				853,
				906,
				906,
				874,
				816,
				816,
				804,
				804,
				785,
				785,
				774,
				774,
				759,
				759,
				754,
				745,
				734,
				726,
				691,
				686,
				683,
				677,
				657,
				636
			}
		},
		{
			closed = true,
			{
				512,
				529,
				516,
				519,
				513,
				495,
				498,
				501,
				504,
				500
			},
			{
				597,
				616,
				627,
				630,
				634,
				609,
				607,
				611,
				609,
				604
			}
		},
		{
			closed = true,
			{
				559,
				569,
				571,
				639,
				631,
				647,
				616,
				616,
				610,
				610,
				601,
				598,
				589,
				580,
				569,
				561,
				557,
				557,
				584,
				584,
				580,
				591,
				589,
				580,
				570,
				564,
				568,
				563,
				558,
				561,
				552,
				546,
				550,
				549
			},
			{
				601,
				611,
				609,
				666,
				679,
				692,
				732,
				792,
				792,
				814,
				814,
				822,
				831,
				833,
				831,
				825,
				815,
				721,
				721,
				710,
				706,
				697,
				688,
				686,
				693,
				683,
				676,
				658,
				650,
				646,
				619,
				614,
				610,
				608
			}
		},
		{
			closed = false,
			text = {
				title_id = "cn_menu_shaw_title",
				x = 1426,
				y = 310
			},
			{
				2047,
				1972,
				1879,
				1879,
				1735,
				1677,
				1677,
				1683,
				1625,
				1619,
				1624,
				1620,
				1641,
				1641,
				1572,
				1571,
				1558,
				1558,
				1547,
				1547,
				1523,
				1523,
				1462,
				1462,
				1450,
				1450,
				1422,
				1402,
				1402,
				1356,
				1356,
				1316,
				1316,
				1308,
				1308,
				1279,
				1279,
				1245,
				1245,
				1200,
				1200,
				1039
			},
			{
				278,
				311,
				311,
				352,
				416,
				416,
				429,
				440,
				468,
				461,
				458,
				451,
				442,
				420,
				420,
				470,
				470,
				467,
				467,
				469,
				469,
				518,
				518,
				532,
				532,
				547,
				560,
				560,
				570,
				569,
				591,
				610,
				604,
				604,
				614,
				628,
				614,
				614,
				644,
				665,
				608,
				608
			}
		},
		{
			closed = false,
			text = {
				title_id = "cn_menu_downtown_title",
				x = 1469,
				y = 720
			},
			{
				1200,
				1206,
				1206,
				1201,
				1201,
				1251,
				1251,
				1201,
				1201,
				1205,
				1254,
				1254,
				1285,
				1285,
				1308,
				1308,
				1372,
				1372,
				1388,
				1388,
				1411,
				1411,
				1462,
				1462,
				1523,
				1523,
				1538,
				1538,
				1528,
				1527,
				1709,
				1709,
				1760,
				1880,
				1880,
				2047
			},
			{
				665,
				669,
				688,
				688,
				741,
				760,
				787,
				787,
				898,
				902,
				902,
				896,
				896,
				902,
				902,
				896,
				896,
				903,
				903,
				896,
				896,
				898,
				898,
				889,
				889,
				901,
				901,
				920,
				920,
				953,
				953,
				902,
				902,
				798,
				609,
				609
			}
		}
	}
	self.crime_net.map_start_positions = {
		{
			max_level = 10,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 20,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 30,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 40,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 50,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 60,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 70,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 80,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 90,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 100,
			x = 1080,
			y = 512,
			zoom = 4
		}
	}
	self.crime_net.special_contracts = {
		{
			id = "gage_assignment",
			name_id = "menu_cn_gage_assignment",
			desc_id = "menu_cn_gage_assignment_desc",
			menu_node = "crimenet_gage_assignment",
			x = 425,
			y = 910,
			icon = "guis/textures/pd2/crimenet_marker_gage",
			dlc = "gage_pack_jobs"
		},
		{
			id = "premium_buy",
			name_id = "menu_cn_premium_buy",
			desc_id = "menu_cn_premium_buy_desc",
			menu_node = "crimenet_contract_special",
			x = 420,
			y = 846,
			icon = "guis/textures/pd2/crimenet_marker_buy"
		},
		{
			id = "contact_info",
			name_id = "menu_cn_contact_info",
			desc_id = "menu_cn_contact_info_desc",
			menu_node = "crimenet_contact_info",
			x = 912,
			y = 905,
			icon = "guis/textures/pd2/crimenet_marker_codex"
		},
		{
			id = "challenge",
			name_id = "menu_cn_challenge",
			desc_id = "menu_cn_challenge_desc",
			menu_node = "crimenet_contract_challenge",
			x = 347,
			y = 716,
			icon = "guis/textures/pd2/crimenet_challenge"
		}
	}
	if Application:production_build() or SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") then
		table.insert(self.crime_net.special_contracts, {
			id = "casino",
			name_id = "menu_cn_casino",
			desc_id = "menu_cn_casino_desc",
			menu_node = "crimenet_contract_casino",
			x = 125,
			y = 790,
			icon = "guis/textures/pd2/crimenet_casino",
			unlock = "unlock_level",
			pulse = true,
			pulse_color = Color(204, 255, 209, 32) / 255
		})
	end
	self.crime_net.codex = {
		{
			id = "contacts",
			name_id = "menu_contacts",
			{
				id = "bain",
				name_id = "heist_contact_bain",
				{
					desc_id = "heist_contact_bain_description",
					video = "bain",
					post_event = "pln_contact_bain"
				}
			},
			{
				id = "vlad",
				name_id = "heist_contact_vlad",
				{
					desc_id = "heist_contact_vlad_description",
					videos = {
						"vlad1",
						"vlad2",
						"vlad3"
					},
					post_event = "vld_quote_set_a"
				}
			},
			{
				id = "hector",
				name_id = "heist_contact_hector",
				{
					desc_id = "heist_contact_hector_description",
					videos = {
						"hector1",
						"hector2",
						"hector3"
					},
					post_event = "hct_quote_set_a"
				}
			},
			{
				id = "the_elephant",
				name_id = "heist_contact_the_elephant",
				{
					desc_id = "heist_contact_the_elephant_description",
					videos = {
						"the_elephant1",
						"the_elephant2",
						"the_elephant3"
					},
					post_event = "elp_quote_set_a"
				}
			},
			{
				id = "gage",
				name_id = "heist_contact_gage",
				{
					desc_id = "heist_contact_gage_description",
					videos = {
						"gage1",
						"gage2",
						"gage3"
					},
					post_event = "pln_contact_gage"
				}
			},
			{
				id = "the_dentist",
				name_id = "heist_contact_the_dentist",
				{
					desc_id = "heist_contact_the_dentist_description",
					videos = {
						"the_dentist1",
						"the_dentist2",
						"the_dentist3",
						"the_dentist4",
						"the_dentist5",
						"the_dentist6"
					},
					post_event = "dentist_quote_set_a"
				}
			},
			{
				id = "the_butcher",
				name_id = "heist_contact_the_butcher",
				{
					desc_id = "heist_contact_the_butcher_description",
					videos = {
						"the_butcher1",
						"the_butcher2",
						"the_butcher3"
					},
					post_event = "butcher_quote_set_a"
				}
			}
		},
		{
			id = "playable_characters",
			name_id = "menu_playable_characters",
			{
				id = "dallas",
				name_id = "menu_russian",
				{
					desc_id = "russian_desc_codex",
					videos = {
						"dallas1",
						"dallas2",
						"dallas3"
					},
					post_event = "pln_contact_dallas"
				}
			},
			{
				id = "wolf",
				name_id = "menu_german",
				{
					desc_id = "german_desc_codex",
					videos = {"wolf1", "wolf2"},
					post_event = "pln_contact_wolf"
				}
			},
			{
				id = "chains",
				name_id = "menu_spanish",
				{
					desc_id = "spanish_desc_codex",
					videos = {
						"chains1",
						"chains2",
						"chains3"
					},
					post_event = "pln_contact_chains"
				}
			},
			{
				id = "old_hoxton",
				name_id = "menu_old_hoxton",
				{
					desc_id = "old_hoxton_desc_codex",
					videos = {
						"old_hoxton1",
						"old_hoxton2"
					},
					post_event = "pln_contact_hoxton"
				}
			},
			{
				id = "jowi",
				name_id = "menu_jowi",
				{
					desc_id = "jowi_desc_codex",
					videos = {
						"jowi1",
						"jowi2",
						"jowi3",
						"jowi4"
					},
					post_event = "pln_contact_wick"
				}
			},
			{
				id = "hoxton",
				name_id = "menu_american",
				{
					desc_id = "american_desc_codex",
					videos = {
						"hoxton1",
						"hoxton2",
						"hoxton3"
					},
					post_event = "pln_contact_houston"
				},
				{
					desc_id = "houston_desc_codex",
					videos = {
						"hoxton1",
						"hoxton2",
						"hoxton3"
					},
					post_event = "pln_contact_houston"
				}
			},
			{
				id = "clover",
				name_id = "menu_clover",
				{
					desc_id = "menu_clover_desc_codex",
					videos = {"clover1", "clover2"},
					post_event = "pln_contact_clover"
				}
			},
			{
				id = "dragan",
				name_id = "menu_dragan",
				{
					desc_id = "menu_dragan_desc_codex",
					videos = {
						"dragan1",
						"dragan2",
						"dragan3"
					},
					post_event = "pln_contact_dragan"
				}
			},
			{
				id = "jacket",
				name_id = "menu_jacket",
				{
					desc_id = "menu_jacket_desc_codex",
					videos = {"jacket1", "jacket2"},
					post_event = "pln_contact_jacket"
				}
			},
			{
				id = "bonnie",
				name_id = "menu_bonnie",
				{
					desc_id = "menu_bonnie_desc_codex",
					videos = {"bonnie1"},
					post_event = "pln_contact_bonnie"
				}
			},
			{
				id = "sokol",
				name_id = "menu_sokol",
				{
					desc_id = "menu_sokol_desc_codex",
					videos = {"sokol1"},
					post_event = "pln_contact_sokol"
				}
			},
			{
				id = "dragon",
				name_id = "menu_dragon",
				{
					desc_id = "menu_dragon_desc_codex",
					videos = {"dragon1"},
					post_event = "pln_contact_jiro"
				}
			}
		}
	}
	self.crime_net.locations = {}
	if not Application:production_build() or SystemInfo:platform() ~= Idstring("WIN32") then
		self.crime_net.locations = {
			{
				{
					dots = {
						{1601, 425},
						{1025, 835},
						{444, 567},
						{1221, 685},
						{1603, 555},
						{1401, 620},
						{1581, 685},
						{1306, 750},
						{1486, 815},
						{1666, 750},
						{1450, 880},
						{1041, 620},
						{730, 880},
						{883, 555},
						{861, 685},
						{766, 815},
						{946, 750},
						{1480, 165},
						{1304, 295},
						{1484, 230},
						{1664, 295},
						{1241, 425},
						{1421, 360},
						{1063, 490},
						{1243, 555},
						{1423, 490},
						{1120, 165},
						{1124, 230},
						{760, 165},
						{764, 230},
						{944, 295},
						{701, 360},
						{681, 620},
						{881, 425},
						{703, 490},
						{400, 165},
						{404, 230},
						{584, 295},
						{343, 490},
						{224, 295},
						{341, 360},
						{521, 425},
						{586, 750}
					},
					weight = 100
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain",
						"the_dentist",
						"the_butcher"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			}
		}
	else
		self.crime_net.locations = {
			{
				{
					weight = 500,
					{
						558,
						558,
						566,
						579,
						591,
						600,
						608,
						607,
						614,
						616
					},
					{
						722,
						812,
						824,
						832,
						827,
						811,
						810,
						788,
						790,
						722
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						610,
						644,
						555,
						591,
						593,
						582,
						585
					},
					{
						733,
						691,
						620,
						685,
						699,
						705,
						724
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						567,
						570,
						589,
						559,
						563,
						571
					},
					{
						683,
						690,
						684,
						623,
						652,
						678
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						627,
						636,
						568,
						556,
						549
					},
					{
						684,
						665,
						610,
						604,
						614
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						498,
						505,
						505,
						513,
						527,
						517,
						514
					},
					{
						611,
						611,
						602,
						598,
						615,
						624,
						632
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						372,
						416,
						416
					},
					{
						535,
						557,
						533
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						149,
						145,
						164,
						167
					},
					{
						446,
						455,
						462,
						452
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						168,
						167,
						182,
						184
					},
					{
						465,
						472,
						477,
						469
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						424,
						506,
						508,
						467,
						423
					},
					{
						535,
						536,
						549,
						581,
						556
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						479,
						499,
						498,
						471
					},
					{
						583,
						583,
						535,
						534
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						212,
						558,
						554,
						203
					},
					{
						432,
						430,
						248,
						251
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {"normal"}
				}
			},
			{
				{
					weight = 10,
					{
						240,
						543,
						542,
						241
					},
					{
						440,
						442,
						477,
						464
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {"normal"}
				}
			},
			{
				{
					weight = 500,
					{
						260,
						291,
						289,
						315,
						315,
						346,
						511,
						511
					},
					{
						432,
						472,
						483,
						493,
						500,
						514,
						514,
						407
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						376,
						382,
						502,
						511,
						511,
						542,
						542,
						510
					},
					{
						510,
						522,
						519,
						512,
						473,
						441,
						420,
						421
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						554,
						567,
						577,
						574,
						609,
						556,
						522
					},
					{
						416,
						416,
						407,
						360,
						302,
						247,
						291
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						598,
						630,
						690,
						701,
						679,
						659,
						639,
						639,
						596
					},
					{
						298,
						276,
						275,
						266,
						229,
						210,
						211,
						219,
						219
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						536,
						524,
						505,
						504,
						491,
						491,
						472,
						470
					},
					{
						253,
						232,
						229,
						180,
						180,
						215,
						215,
						261
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						205,
						202,
						339,
						373,
						474,
						472
					},
					{
						251,
						123,
						125,
						147,
						173,
						267
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						564,
						563,
						576,
						576
					},
					{
						190,
						206,
						207,
						191
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 1,
					{
						341,
						349,
						358,
						372,
						373,
						369,
						367,
						359,
						358,
						349,
						349,
						340
					},
					{
						103,
						105,
						108,
						107,
						115,
						115,
						122,
						121,
						116,
						115,
						121,
						120
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						553,
						628,
						628,
						555
					},
					{
						243,
						245,
						282,
						326
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						148,
						166,
						164,
						185,
						189,
						224,
						225,
						135
					},
					{
						422,
						423,
						436,
						436,
						432,
						432,
						123,
						125
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						553,
						544,
						774,
						832,
						879,
						925,
						977,
						988,
						1036,
						874,
						735,
						599,
						598
					},
					{
						514,
						538,
						527,
						528,
						533,
						527,
						534,
						527,
						529,
						161,
						342,
						458,
						515
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 50,
					{
						585,
						602,
						598,
						641,
						734,
						732,
						760,
						772,
						609,
						591
					},
					{
						452,
						462,
						584,
						637,
						635,
						552,
						544,
						527,
						429,
						429
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 25,
					{
						740,
						708,
						702,
						652,
						650,
						640,
						625,
						635,
						602,
						743
					},
					{
						343,
						343,
						333,
						333,
						344,
						339,
						363,
						368,
						443,
						437
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						983,
						1059,
						1059,
						656,
						707,
						755,
						833
					},
					{
						423,
						384,
						162,
						162,
						199,
						258,
						393
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1058,
						1094,
						1112,
						1133,
						1174,
						1172,
						1183,
						1183,
						1170,
						1170,
						1049
					},
					{
						337,
						349,
						345,
						349,
						328,
						296,
						296,
						269,
						268,
						248,
						248
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						1053,
						1168,
						1149,
						1004,
						872
					},
					{
						162,
						166,
						340,
						341,
						162
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						997,
						1071,
						1201,
						1886,
						1879,
						1197,
						1206
					},
					{
						418,
						609,
						608,
						253,
						105,
						110,
						325
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 50,
					{
						1045,
						1115,
						1127,
						1110,
						1092,
						1072,
						1066,
						1058,
						1041
					},
					{
						604,
						607,
						354,
						351,
						358,
						347,
						352,
						578,
						576
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1204,
						1239,
						1239,
						1280,
						1280,
						1305,
						1307,
						1200
					},
					{
						658,
						642,
						606,
						612,
						624,
						613,
						536,
						590
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1306,
						1318,
						1352,
						1354,
						1399,
						1401,
						1284
					},
					{
						602,
						606,
						589,
						565,
						568,
						487,
						539
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 25,
					{
						1399,
						1426,
						1446,
						1447,
						1460,
						1460,
						1522,
						1521,
						1376
					},
					{
						559,
						556,
						545,
						529,
						527,
						513,
						516,
						423,
						481
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1521,
						1569,
						1571,
						1510
					},
					{
						466,
						465,
						394,
						411
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						1625,
						1625,
						1678,
						1676,
						1643,
						1642
					},
					{
						455,
						465,
						441,
						416,
						418,
						445
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 50,
					{
						1563,
						1733,
						1877,
						1878
					},
					{
						417,
						414,
						349,
						239
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 25,
					{
						1125,
						1181,
						1177,
						1187,
						1188,
						1238,
						1239
					},
					{
						358,
						328,
						300,
						298,
						266,
						267,
						361
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1162,
						1162,
						1172,
						1170,
						1212,
						1211,
						1170,
						1171
					},
					{
						225,
						246,
						247,
						267,
						269,
						181,
						183,
						223
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1185,
						1186,
						1171,
						1170,
						1178,
						1218,
						1216
					},
					{
						184,
						168,
						168,
						120,
						112,
						111,
						189
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 200,
					{
						772,
						1033,
						1036,
						972,
						736,
						733,
						763
					},
					{
						529,
						537,
						895,
						854,
						814,
						550,
						547
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 50,
					{
						743,
						696,
						675,
						696,
						692,
						723,
						882,
						881,
						917,
						917
					},
					{
						780,
						776,
						792,
						817,
						873,
						906,
						903,
						854,
						835,
						791
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 25,
					{
						653,
						655,
						676,
						668,
						667,
						665,
						678,
						750,
						747
					},
					{
						639,
						659,
						676,
						693,
						735,
						744,
						758,
						760,
						636
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						916,
						928,
						973,
						972,
						990,
						999,
						1036,
						1035,
						904
					},
					{
						846,
						853,
						854,
						882,
						882,
						892,
						892,
						831,
						829
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						1033,
						1044,
						1042,
						1038,
						1039,
						1050,
						1033,
						1000,
						1004
					},
					{
						667,
						667,
						615,
						615,
						574,
						573,
						536,
						539,
						683
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 500,
					{
						1872,
						1879,
						1763,
						1199,
						1250,
						1240
					},
					{
						359,
						790,
						900,
						879,
						788,
						647
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1201,
						1256,
						1277,
						1247,
						1244,
						1201,
						1209,
						1202
					},
					{
						739,
						763,
						613,
						614,
						644,
						665,
						675,
						689
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1259,
						1200,
						1203,
						1253,
						1265
					},
					{
						789,
						788,
						901,
						901,
						825
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1256,
						1283,
						1287,
						1307,
						1308,
						1374,
						1375,
						1391,
						1388,
						1460,
						1457,
						1254
					},
					{
						893,
						894,
						903,
						901,
						894,
						894,
						901,
						902,
						896,
						895,
						854,
						854
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1522,
						1524,
						1542,
						1540,
						1529,
						1528,
						1707,
						1706,
						1520
					},
					{
						891,
						898,
						901,
						920,
						921,
						950,
						951,
						874,
						872
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 10,
					{
						1575,
						1637,
						1638,
						1620,
						1625,
						1525,
						1523,
						1559,
						1575
					},
					{
						422,
						422,
						438,
						449,
						488,
						528,
						468,
						468,
						473
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						1533,
						1462,
						1464,
						1453,
						1450,
						1530
					},
					{
						519,
						519,
						530,
						533,
						557,
						554
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						1357,
						1355,
						1463,
						1463,
						1403,
						1402
					},
					{
						572,
						609,
						609,
						556,
						561,
						574
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			},
			{
				{
					weight = 5,
					{
						1676,
						1680,
						1753,
						1751
					},
					{
						417,
						461,
						464,
						415
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"overkill_290"
					}
				}
			}
		}
		self:_create_location_bounding_boxes()
		self:_create_location_spawning_dots()
		print("Generating new spawn points for crimenet")
	end
	local wts = {}
	local dlc_1_folder = "units/pd2_dlc1/weapons/wpn_effects_textures/"
	local butch_folder = "units/pd2_dlc_butcher_mods/weapons/wpn_effects_textures/"
	wts.color_indexes = {
		{color = "red"},
		{
			color = "blue",
			dlc = "gage_pack_jobs"
		},
		{
			color = "green",
			dlc = "gage_pack_jobs"
		},
		{
			color = "yellow",
			dlc = "gage_pack_jobs"
		}
	}
	wts.types = {}
	wts.types.sight = {
		suffix = "_il",
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_s_1_il",
			name_id = "menu_reticle_1_s"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_m_1_il",
			name_id = "menu_reticle_1_m"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_l_1_il",
			name_id = "menu_reticle_1_l"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_2_il",
			name_id = "menu_reticle_2"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_3_il",
			name_id = "menu_reticle_3"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_4_il",
			name_id = "menu_reticle_4"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_5_il",
			name_id = "menu_reticle_5",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_6_il",
			name_id = "menu_reticle_6",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_7_il",
			name_id = "menu_reticle_7",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_8_il",
			name_id = "menu_reticle_8",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_9_il",
			name_id = "menu_reticle_9",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = dlc_1_folder .. "wpn_sight_reticle_10_il",
			name_id = "menu_reticle_10",
			dlc = "gage_pack_jobs"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_11_il",
			name_id = "menu_reticle_11"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_12_il",
			name_id = "menu_reticle_12"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_13_il",
			name_id = "menu_reticle_13"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_14_il",
			name_id = "menu_reticle_14"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_15_il",
			name_id = "menu_reticle_15"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_16_il",
			name_id = "menu_reticle_16"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_17_il",
			name_id = "menu_reticle_17"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_18_il",
			name_id = "menu_reticle_18"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_19_il",
			name_id = "menu_reticle_19"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_20_il",
			name_id = "menu_reticle_20"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_21_il",
			name_id = "menu_reticle_21"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_22_il",
			name_id = "menu_reticle_22"
		},
		{
			texture_path = butch_folder .. "wpn_sight_reticle_23_il",
			name_id = "menu_reticle_23"
		}
	}
	self.weapon_texture_switches = wts
	self.tradable_inventory_sort_list = {
		"aquired",
		"alphabetic",
		"quality",
		"rarity",
		"category",
		"bonus"
	}
end
function GuiTweakData:_create_location_bounding_boxes()
	for _, location in ipairs(self.crime_net.locations) do
		local params = location[1]
		if params then
			local min_x, max_x, min_y, max_y
			for _, x in ipairs(params[1]) do
				if not min_x then
				else
					min_x = x or math.min(min_x, x)
				end
				if not max_x then
				else
					max_x = x or math.max(max_x, x)
				end
			end
			for _, y in ipairs(params[2]) do
				if not min_y then
				else
					min_y = y or math.min(min_y, y)
				end
				if not max_y then
				else
					max_y = y or math.max(max_y, y)
				end
			end
			params.bounding_box = {
				min_x,
				max_x,
				min_y,
				max_y
			}
		end
	end
end
function GuiTweakData:_create_location_spawning_dots()
	local map_w = 2048
	local map_h = 1024
	local border_w = 125
	local border_h = 50
	local start_y = 50
	local start_x = -50
	local step_x = 180
	local step_y = 130
	local random_x = 0
	local random_y = 0
	local random_step_x = step_x / 2
	local zig_y = step_y / 2
	local zig = true
	for y = border_h + start_y, map_h - 2 * border_h + start_y, step_y do
		for x = border_w + math.random(-random_step_x, random_step_x) + start_x, map_w - 2 * border_w + start_x, step_x do
			local found_point = false
			local rx = x + math.random(-random_x, random_x)
			local ry = y + math.random(-random_y, random_y) + (zig and zig_y or 0)
			for _, location_data in ipairs(self.crime_net.locations) do
				local location = location_data[1]
				local bounding_box = location.bounding_box
				location.dots = location.dots or {}
				if rx >= bounding_box[1] and rx <= bounding_box[2] and ry >= bounding_box[3] and ry <= bounding_box[4] then
					local vx = location[1]
					local vy = location[2]
					local j, c
					j = #vx
					for i = 1, #vx do
						if ry < vy[i] ~= (ry < vy[j]) and rx < (vx[j] - vx[i]) * (ry - vy[i]) / (vy[j] - vy[i]) + vx[i] then
							found_point = not found_point
						end
						j = i
					end
					if found_point then
						table.insert(location.dots, {rx, ry})
					end
				else
				end
			end
			zig = not zig
		end
		zig = not zig
	end
	local new_locations = {}
	new_locations[1] = {}
	new_locations[1].filters = self.crime_net.locations[1].filters
	new_locations[1][1] = {}
	new_locations[1][1].dots = {}
	new_locations[1][1].weight = 100
	for i = #self.crime_net.locations, 1, -1 do
		if self.crime_net.locations[i][1].dots then
			for _, dot in pairs(self.crime_net.locations[i][1].dots) do
				table.insert(new_locations[1][1].dots, dot)
			end
		end
	end
	self.crime_net.locations = new_locations
end
function GuiTweakData:create_narrative_locations(locations)
end
function GuiTweakData:print_locations()
	if Application:production_build() then
		local save_me = self:serializeTable(self.crime_net.locations, "self.crime_net.locations", true, 0)
		local file = SystemFS:open("crime_net_locations.txt", "w")
		file:print(save_me)
		file:close()
	end
end
function GuiTweakData:serializeTable(val, name, skipnewlines, depth)
	skipnewlines = skipnewlines or false
	depth = depth or 0
	local tmp = ""
	if name and type(name) == "string" then
		tmp = tmp .. name .. "="
	end
	if type(val) == "table" then
		tmp = tmp .. "{ " .. (depth == 0 and "\n" or "")
		local i = 1
		for k, v in pairs(val) do
			tmp = tmp .. self:serializeTable(v, k, skipnewlines, depth + 1)
			if depth > 0 and i < table.size(val) then
				tmp = tmp .. ", "
				i = i + 1
			else
				tmp = tmp .. " "
			end
		end
		tmp = tmp .. "}" .. (depth <= 1 and ", \n" or "")
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
	end
	return tmp
end
function GuiTweakData:tradable_inventory_sort_func(index)
	if type(index) == "string" then
		index = self:tradable_inventory_sort_index(index)
	end
	if index == 1 then
		return function(x, y)
			return y < x
		end
	elseif index == 2 then
		do
			local inventory_tradable = managers.blackmarket:get_inventory_tradable()
			local x_item, y_item, x_td, y_td, x_loc, y_loc
			local localization_cache = {}
			return function(x, y)
				x_item = inventory_tradable[x]
				y_item = inventory_tradable[y]
				x_td = tweak_data.economy[x_item.category] or tweak_data.blackmarket[x_item.category][x_item.entry]
				y_td = tweak_data.economy[y_item.category] or tweak_data.blackmarket[y_item.category][y_item.entry]
				if x_td.name_id ~= y_td.name_id then
					localization_cache[x_td.name_id] = localization_cache[x_td.name_id] or managers.localization:to_upper_text(x_td.name_id)
					localization_cache[y_td.name_id] = localization_cache[y_td.name_id] or managers.localization:to_upper_text(y_td.name_id)
					x_loc = localization_cache[x_td.name_id]
					y_loc = localization_cache[y_td.name_id]
					return x_loc < y_loc
				end
				return y < x
			end
		end
	elseif index == 3 then
		do
			local inventory_tradable = managers.blackmarket:get_inventory_tradable()
			local x_item, y_item, x_quality, y_quality
			return function(x, y)
				x_item = inventory_tradable[x]
				y_item = inventory_tradable[y]
				x_quality = tweak_data.economy.qualities[x_item.quality]
				y_quality = tweak_data.economy.qualities[y_item.quality]
				if not x_quality then
					return false
				end
				if not y_quality then
					return not x_quality
				end
				if x_quality.index ~= y_quality.index then
					return x_quality.index > y_quality.index
				end
				return y < x
			end
		end
	elseif index == 4 then
		do
			local inventory_tradable = managers.blackmarket:get_inventory_tradable()
			local x_item, y_item, x_td, y_td, x_rarity, y_rarity
			return function(x, y)
				x_item = inventory_tradable[x]
				y_item = inventory_tradable[y]
				x_td = tweak_data.economy[x_item.category] or tweak_data.blackmarket[x_item.category][x_item.entry]
				y_td = tweak_data.economy[y_item.category] or tweak_data.blackmarket[y_item.category][y_item.entry]
				x_rarity = tweak_data.economy.rarities[x_td.rarity or "common"]
				y_rarity = tweak_data.economy.rarities[y_td.rarity or "common"]
				if x_rarity.index ~= y_rarity.index then
					return x_rarity.index > y_rarity.index
				end
				return y < x
			end
		end
	elseif index == 5 then
		do
			local inventory_tradable = managers.blackmarket:get_inventory_tradable()
			local x_item, y_item
			return function(x, y)
				x_item = inventory_tradable[x]
				y_item = inventory_tradable[y]
				if x_item.category ~= y_item.category then
					return x_item.category > y_item.category
				end
				return y < x
			end
		end
	elseif index == 6 then
		do
			local inventory_tradable = managers.blackmarket:get_inventory_tradable()
			local x_item, y_item
			return function(x, y)
				x_item = inventory_tradable[x]
				y_item = inventory_tradable[y]
				if x_item.bonus ~= y_item.bonus then
					return x_item.bonus
				end
				return y < x
			end
		end
	end
	return nil
end
function GuiTweakData:tradable_inventory_sort_name(index)
	return self.tradable_inventory_sort_list[index] or "none"
end
function GuiTweakData:tradable_inventory_sort_index(name)
	for index, n in ipairs(self.tradable_inventory_sort_list) do
		if n == name then
			return index
		end
	end
	return 0
end
