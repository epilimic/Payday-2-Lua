LevelsTweakData = LevelsTweakData or class()
function LevelsTweakData:init()
	self.framing_frame_1 = {}
	self.framing_frame_1.name_id = "heist_framing_frame_1_hl"
	self.framing_frame_1.briefing_id = "heist_framing_frame_1_briefing"
	self.framing_frame_1.briefing_dialog = "Play_pln_framing_stage1_brief"
	self.framing_frame_1.world_name = "narratives/e_framing_frame/stage_1"
	self.framing_frame_1.intro_event = "Play_pln_framing_stage1_intro_a"
	self.framing_frame_1.outro_event = {
		"Play_pln_framing_stage1_end_a",
		"Play_pln_framing_stage1_end_b"
	}
	self.framing_frame_1.music = "heist"
	self.framing_frame_1.package = {
		"packages/narr_framing_1"
	}
	self.framing_frame_1.cube = "cube_apply_heist_bank"
	self.framing_frame_1.ghost_bonus = 0.075
	self.framing_frame_1.max_bags = 13
	self.framing_frame_2 = {}
	self.framing_frame_2.name_id = "heist_framing_frame_2_hl"
	self.framing_frame_2.briefing_id = "heist_framing_frame_2_briefing"
	self.framing_frame_2.briefing_dialog = "Play_pln_framing_stage2_brief"
	self.framing_frame_2.world_name = "narratives/e_framing_frame/stage_2"
	self.framing_frame_2.intro_event = "Play_pln_framing_stage2_intro_a"
	self.framing_frame_2.outro_event = {
		"Play_pln_framing_stage2_end_a",
		"Play_pln_framing_stage2_end_b"
	}
	self.framing_frame_2.music = "heist"
	self.framing_frame_2.package = {
		"packages/narr_framing_2"
	}
	self.framing_frame_2.cube = "cube_apply_heist_bank"
	self.framing_frame_2.ghost_bonus = 0.025
	self.framing_frame_2.max_bags = 13
	self.framing_frame_3 = {}
	self.framing_frame_3.name_id = "heist_framing_frame_3_hl"
	self.framing_frame_3.briefing_id = "heist_framing_frame_3_briefing"
	self.framing_frame_3.briefing_dialog = "Play_pln_framing_stage3_brief"
	self.framing_frame_3.world_name = "narratives/e_framing_frame/stage_3"
	self.framing_frame_3.intro_event = "Play_pln_framing_stage3_intro"
	self.framing_frame_3.outro_event = {
		"Play_pln_framing_stage3_end_a",
		"Play_pln_framing_stage3_end_b",
		"Play_pln_framing_stage3_end_c"
	}
	self.framing_frame_3.music = "heist"
	self.framing_frame_3.package = "packages/narr_framing_3"
	self.framing_frame_3.cube = "cube_apply_heist_bank"
	self.framing_frame_3.ghost_bonus = 0.15
	self.framing_frame_3.max_bags = 21
	self.election_day_1 = {}
	self.election_day_1.name_id = "heist_election_day_1_hl"
	self.election_day_1.briefing_id = "eday1_brief"
	self.election_day_1.briefing_dialog = "Play_pln_ed1_brf"
	self.election_day_1.world_name = "narratives/e_election_day/stage_1"
	self.election_day_1.intro_event = "Play_pln_ed1_intro_a"
	self.election_day_1.outro_event = {
		"Play_pln_ed1_end_a",
		"Play_pln_ed1_end_b",
		"Play_pln_ed1_end_c"
	}
	self.election_day_1.music = "heist"
	self.election_day_1.package = {
		"packages/narr_election1"
	}
	self.election_day_1.cube = "cube_apply_heist_bank"
	self.election_day_1.ghost_bonus = 0.05
	self.election_day_1.max_bags = 0
	self.election_day_2 = {}
	self.election_day_2.name_id = "heist_election_day_2_hl"
	self.election_day_2.briefing_id = "eday2_brief"
	self.election_day_2.briefing_dialog = "Play_pln_ed2_brf"
	self.election_day_2.world_name = "narratives/e_election_day/stage_2"
	self.election_day_2.intro_event = "Play_pln_ed2_intro_a"
	self.election_day_2.outro_event = {
		"Play_pln_ed2_end_a",
		"Play_pln_ed2_end_b"
	}
	self.election_day_2.music = "heist"
	self.election_day_2.package = {
		"packages/narr_election2"
	}
	self.election_day_2.cube = "cube_apply_heist_bank"
	self.election_day_2.ghost_bonus = 0.15
	self.election_day_2.max_bags = 21
	self.election_day_3 = {}
	self.election_day_3.name_id = "heist_election_day_3_hl"
	self.election_day_3.briefing_id = "eday3_brief_skip1"
	self.election_day_3.briefing_dialog = "Play_pln_ed3_brf_b"
	self.election_day_3.world_name = "narratives/e_election_day/stage_3"
	self.election_day_3.intro_event = "Play_pln_ed3_intro_a"
	self.election_day_3.outro_event = "Play_pln_ed3_end_a"
	self.election_day_3.music = "heist"
	self.election_day_3.package = "packages/narr_election3"
	self.election_day_3.cube = "cube_apply_heist_bank"
	self.election_day_3.max_bags = 16
	self.election_day_3_skip1 = deep_clone(self.election_day_3)
	self.election_day_3_skip1.briefing_id = "eday3_brief_skip1"
	self.election_day_3_skip1.briefing_dialog = "Play_pln_ed3_brf_b"
	self.election_day_3_skip2 = deep_clone(self.election_day_3)
	self.election_day_3_skip2.briefing_id = "eday3_brief_skip2"
	self.election_day_3_skip2.briefing_dialog = "Play_pln_ed3_brf_c"
	self.alex_1 = {}
	self.alex_1.name_id = "heist_alex_1_hl"
	self.alex_1.briefing_id = "heist_alex_1_briefing"
	self.alex_1.briefing_dialog = "Play_pln_rat_stage1_brief"
	self.alex_1.world_name = "narratives/h_alex_must_die/stage_1"
	self.alex_1.intro_event = "Play_pln_rat_stage1_intro_a"
	self.alex_1.outro_event = {
		"Play_pln_rat_stage1_end_a",
		"Play_pln_rat_stage1_end_b",
		"Play_pln_rat_stage1_end_c"
	}
	self.alex_1.music = "heist"
	self.alex_1.package = "packages/narr_alex1"
	self.alex_1.cube = "cube_apply_heist_bank"
	self.alex_1.max_bags = 11
	self.alex_2 = {}
	self.alex_2.name_id = "heist_alex_2_hl"
	self.alex_2.briefing_id = "heist_alex_2_briefing"
	self.alex_2.briefing_dialog = "Play_pln_rat_stage2_brief"
	self.alex_2.world_name = "narratives/h_alex_must_die/stage_2"
	self.alex_2.intro_event = "Play_pln_rat_stage2_intro_a"
	self.alex_2.outro_event = {
		"Play_pln_rat_stage2_end_a",
		"Play_pln_rat_stage2_end_b",
		"Play_pln_rat_stage2_end_c",
		"Play_pln_rat_stage2_end_d",
		"Play_pln_rat_stage2_end_e"
	}
	self.alex_2.music = "heist"
	self.alex_2.package = "packages/narr_alex2"
	self.alex_2.cube = "cube_apply_heist_bank"
	self.alex_2.max_bags = 19
	self.alex_3 = {}
	self.alex_3.name_id = "heist_alex_3_hl"
	self.alex_3.briefing_id = "heist_alex_3_briefing"
	self.alex_3.briefing_dialog = "Play_pln_rat_stage3_brief"
	self.alex_3.world_name = "narratives/h_alex_must_die/stage_3"
	self.alex_3.intro_event = "Play_pln_rat_stage3_intro_a"
	self.alex_3.outro_event = {
		"Play_pln_rat_stage3_end_a",
		"Play_pln_rat_stage3_end_b",
		"Play_pln_rat_stage3_end_c"
	}
	self.alex_3.music = "heist"
	self.alex_3.package = "packages/narr_alex3"
	self.alex_3.cube = "cube_apply_heist_bank"
	self.alex_3.max_bags = 34
	self.watchdogs_1 = {}
	self.watchdogs_1.name_id = "heist_watchdogs_1_hl"
	self.watchdogs_1.briefing_id = "heist_watchdogs_1_briefing"
	self.watchdogs_1.briefing_dialog = "Play_pln_watchdogs_new_stage1_brief"
	self.watchdogs_1.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_watchdogs_1")
	self.watchdogs_1.world_name = "narratives/h_watchdogs/stage_1"
	self.watchdogs_1.intro_event = "Play_pln_watchdogs_new_stage1_intro_a"
	self.watchdogs_1.outro_event = {
		"Play_pln_watchdogs_new_stage1_end_a",
		"Play_pln_watchdogs_new_stage1_end_b"
	}
	self.watchdogs_1.music = "heist"
	self.watchdogs_1.package = {
		"packages/narr_watchdogs1"
	}
	self.watchdogs_1.cube = "cube_apply_heist_bank"
	self.watchdogs_1.max_bags = 16
	self.watchdogs_1_night = deep_clone(self.watchdogs_1)
	self.watchdogs_1_night.env_params = {
		environment = "environments/pd2_env_night/pd2_env_night"
	}
	self.watchdogs_1_night.package = {
		"packages/narr_watchdogs1_night"
	}
	self.watchdogs_2 = {}
	self.watchdogs_2.name_id = "heist_watchdogs_2_hl"
	self.watchdogs_2.briefing_id = "heist_watchdogs_2_briefing"
	self.watchdogs_2.briefing_dialog = "Play_pln_watchdogs_new_stage2_brief"
	self.watchdogs_2.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_watchdogs_2")
	self.watchdogs_2.world_name = "narratives/h_watchdogs/stage_2"
	self.watchdogs_2.intro_event = {
		"Play_pln_watchdogs_new_stage2_intro_a",
		"Play_pln_watchdogs_new_stage2_intro_b"
	}
	self.watchdogs_2.outro_event = {
		"Play_pln_watchdogs_new_stage2_end_a",
		"Play_pln_watchdogs_new_stage2_end_b"
	}
	self.watchdogs_2.music = "heist"
	self.watchdogs_2.package = {
		"packages/narr_watchdogs2"
	}
	self.watchdogs_2.cube = "cube_apply_heist_bank"
	self.watchdogs_2.max_bags = 16
	self.watchdogs_2_day = deep_clone(self.watchdogs_2)
	self.watchdogs_2_day.env_params = {
		environment = "environments/pd2_env_wd2_evening/pd2_env_wd2_evening"
	}
	self.watchdogs_2_day.package = {
		"packages/narr_watchdogs2_day"
	}
	self.firestarter_1 = {}
	self.firestarter_1.name_id = "heist_firestarter_1_hl"
	self.firestarter_1.briefing_id = "heist_firestarter_1_briefing"
	self.firestarter_1.briefing_dialog = "Play_pln_firestarter_stage1_brief"
	self.firestarter_1.world_name = "narratives/h_firestarter/stage_1"
	self.firestarter_1.intro_event = "Play_pln_firestarter_stage1_intro_a"
	self.firestarter_1.outro_event = {
		"Play_pln_firestarter_stage1_end_a",
		"Play_pln_firestarter_stage1_end_b"
	}
	self.firestarter_1.music = "heist"
	self.firestarter_1.package = "packages/narr_firestarter1"
	self.firestarter_1.cube = "cube_apply_heist_bank"
	self.firestarter_1.max_bags = 16
	self.firestarter_2 = {}
	self.firestarter_2.name_id = "heist_firestarter_2_hl"
	self.firestarter_2.briefing_id = "heist_firestarter_2_briefing"
	self.firestarter_2.briefing_dialog = "Play_pln_firestarter_stage2_brief"
	self.firestarter_2.world_name = "narratives/h_firestarter/stage_2"
	self.firestarter_2.intro_event = "Play_pln_firestarter_stage2_intro_a"
	self.firestarter_2.outro_event = {
		"Play_pln_firestarter_stage2_end_a",
		"Play_pln_firestarter_stage2_end_b"
	}
	self.firestarter_2.music = "heist"
	self.firestarter_2.package = "packages/narr_firestarter2"
	self.firestarter_2.cube = "cube_apply_heist_bank"
	self.firestarter_2.ghost_bonus = 0.15
	self.firestarter_2.max_bags = 34
	self.firestarter_3 = {}
	self.firestarter_3.name_id = "heist_firestarter_3_hl"
	self.firestarter_3.briefing_id = "heist_firestarter_3_briefing"
	self.firestarter_3.briefing_dialog = "Play_pln_firestarter_stage3_brief"
	self.firestarter_3.world_name = "narratives/h_firestarter/stage_3"
	self.firestarter_3.intro_event = "Play_pln_firestarter_stage3_intro_a"
	self.firestarter_3.outro_event = {
		"Play_pln_firestarter_stage3_end_a",
		"Play_pln_firestarter_stage3_end_b"
	}
	self.firestarter_3.music = "heist"
	self.firestarter_3.package = "packages/narr_firestarter3"
	self.firestarter_3.cube = "cube_apply_heist_bank"
	self.firestarter_3.mission_data = {
		{mission = "default"}
	}
	self.firestarter_3.ghost_bonus = 0.05
	self.firestarter_3.max_bags = 54
	self.welcome_to_the_jungle_1 = {}
	self.welcome_to_the_jungle_1.name_id = "heist_welcome_to_the_jungle_1_hl"
	self.welcome_to_the_jungle_1.briefing_id = "heist_welcome_to_the_jungle_1_briefing"
	self.welcome_to_the_jungle_1.briefing_dialog = "Play_pln_bigoil_stage1_brief"
	self.welcome_to_the_jungle_1.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_welcome_to_the_jungle_1")
	self.welcome_to_the_jungle_1.world_name = "narratives/e_welcome_to_the_jungle/stage_1"
	self.welcome_to_the_jungle_1.intro_event = "Play_pln_bigoil_stage1_intro_a"
	self.welcome_to_the_jungle_1.outro_event = {
		"Play_pln_bigoil_stage1_end_a",
		"Play_pln_bigoil_stage1_end_b"
	}
	self.welcome_to_the_jungle_1.music = "heist"
	self.welcome_to_the_jungle_1.package = {
		"packages/narr_jungle1"
	}
	self.welcome_to_the_jungle_1.cube = "cube_apply_heist_bank"
	self.welcome_to_the_jungle_1.ghost_bonus = 0.15
	self.welcome_to_the_jungle_1.max_bags = 14
	self.welcome_to_the_jungle_1_night = deep_clone(self.welcome_to_the_jungle_1)
	self.welcome_to_the_jungle_1_night.env_params = {
		environment = "environments/pd2_env_night/pd2_env_night"
	}
	self.welcome_to_the_jungle_1_night.package = {
		"packages/narr_jungle1_night"
	}
	self.welcome_to_the_jungle_2 = {}
	self.welcome_to_the_jungle_2.name_id = "heist_welcome_to_the_jungle_2_hl"
	self.welcome_to_the_jungle_2.briefing_id = "heist_welcome_to_the_jungle_2_briefing"
	self.welcome_to_the_jungle_2.briefing_dialog = "Play_pln_bigoil_stage2_brief"
	self.welcome_to_the_jungle_2.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_welcome_to_the_jungle_2")
	self.welcome_to_the_jungle_2.world_name = "narratives/e_welcome_to_the_jungle/stage_2"
	self.welcome_to_the_jungle_2.intro_event = "Play_pln_bigoil_stage2_intro_a"
	self.welcome_to_the_jungle_2.outro_event = {
		"Play_pln_bigoil_stage2_end_a",
		"Play_pln_bigoil_stage2_end_b"
	}
	self.welcome_to_the_jungle_2.music = "heist"
	self.welcome_to_the_jungle_2.package = {
		"packages/narr_jungle2"
	}
	self.welcome_to_the_jungle_2.cube = "cube_apply_heist_bank"
	self.welcome_to_the_jungle_2.max_bags = 15
	self.ukrainian_job = {}
	self.ukrainian_job.name_id = "heist_ukrainian_job_hl"
	self.ukrainian_job.briefing_id = "heist_ukrainian_job_briefing"
	self.ukrainian_job.briefing_dialog = "Play_pln_ukranian_stage1_brief"
	self.ukrainian_job.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_quick_diamond")
	self.ukrainian_job.world_name = "narratives/vlad/ukrainian_job"
	self.ukrainian_job.intro_event = "Play_pln_ukranian_stage1_intro_a"
	self.ukrainian_job.outro_event = {
		"Play_pln_ukranian_stage1_end_a",
		"Play_pln_ukranian_stage1_end_b",
		"Play_pln_ukranian_stage1_end_c"
	}
	self.ukrainian_job.music = "heist"
	self.ukrainian_job.package = {
		"packages/ukrainian_job"
	}
	self.ukrainian_job.cube = "cube_apply_heist_bank"
	self.ukrainian_job.group_ai_preset = "small_urban"
	self.ukrainian_job.ghost_bonus = 0.05
	self.ukrainian_job.max_bags = 16
	self.four_stores = {}
	self.four_stores.name_id = "heist_four_stores_hl"
	self.four_stores.briefing_id = "heist_four_stores_briefing"
	self.four_stores.briefing_dialog = "Play_pln_fourstores_stage1_brief"
	self.four_stores.world_name = "narratives/vlad/four_stores"
	self.four_stores.intro_event = "Play_pln_fourstores_stage1_intro_a"
	self.four_stores.outro_event = {
		"Play_pln_fourstores_stage1_end_a",
		"Play_pln_fourstores_stage1_end_b"
	}
	self.four_stores.music = "heist"
	self.four_stores.package = "packages/vlad_four_stores"
	self.four_stores.cube = "cube_apply_heist_bank"
	self.four_stores.ghost_bonus = 0.05
	self.four_stores.max_bags = 5
	self.jewelry_store = {}
	self.jewelry_store.name_id = "heist_jewelry_store_hl"
	self.jewelry_store.briefing_id = "heist_jewelry_store_briefing"
	self.jewelry_store.briefing_dialog = "pln_jewelerystore_stage1_brief"
	self.jewelry_store.world_name = "narratives/vlad/jewelry_store"
	self.jewelry_store.intro_event = {
		"pln_jewelrystore_stage1_intro_01",
		"pln_jewelrystore_stage1_intro_02",
		"pln_jewelrystore_stage1_intro_03",
		"pln_jewelrystore_stage1_intro_04",
		"pln_jewelrystore_stage1_intro_05",
		"pln_jewelrystore_stage1_intro_06"
	}
	self.jewelry_store.outro_event = "pln_jewelerystore_stage1_end"
	self.jewelry_store.music = "heist"
	self.jewelry_store.package = "packages/ukrainian_job"
	self.jewelry_store.cube = "cube_apply_heist_bank"
	self.jewelry_store.ghost_bonus = 0.05
	self.jewelry_store.max_bags = 16
	self.mallcrasher = {}
	self.mallcrasher.name_id = "heist_mallcrasher_hl"
	self.mallcrasher.briefing_id = "heist_mallcrasher_briefing"
	self.mallcrasher.briefing_dialog = "Play_pln_mallcrasch_stage1_brief"
	self.mallcrasher.world_name = "narratives/vlad/mallcrasher"
	self.mallcrasher.intro_event = "Play_pln_mallcrasch_stage1_intro_a"
	self.mallcrasher.outro_event = {
		"Play_pln_mallcrasch_stage1_end_a",
		"Play_pln_mallcrasch_stage1_end_b"
	}
	self.mallcrasher.music = "heist"
	self.mallcrasher.package = "packages/vlad_mallcrasher"
	self.mallcrasher.cube = "cube_apply_heist_bank"
	self.mallcrasher.max_bags = 12
	self.nightclub = {}
	self.nightclub.name_id = "heist_nightclub_hl"
	self.nightclub.briefing_id = "heist_nightclub_briefing"
	self.nightclub.briefing_dialog = "Play_pln_nightclub_stage1_brief"
	self.nightclub.world_name = "narratives/vlad/nightclub"
	self.nightclub.intro_event = "Play_pln_nightclub_stage1_intro_a"
	self.nightclub.outro_event = {
		"Play_pln_nightclub_stage1_end_a",
		"Play_pln_nightclub_stage1_end_b"
	}
	self.nightclub.music = "heist"
	self.nightclub.package = "packages/vlad_nightclub"
	self.nightclub.cube = "cube_apply_heist_bank"
	self.nightclub.ghost_bonus = 0.1
	self.nightclub.max_bags = 28
	self.branchbank = {}
	self.branchbank.name_id = "heist_branchbank_hl"
	self.branchbank.briefing_id = "heist_branchbank_briefing"
	self.branchbank.briefing_dialog = "Play_pln_branchbank_random_stage1_brief"
	self.branchbank.world_name = "narratives/h_firestarter/stage_3"
	self.branchbank.intro_event = {
		"Play_pln_branchbank_random_a_intro_a",
		"Play_pln_branchbank_gold_a_intro_a",
		"Play_pln_branchbank_depositbox_a_intro_a",
		"Play_pln_branchbank_cash_stage1_intro_a"
	}
	self.branchbank.outro_event = "Play_pln_branchbank_stage1_end"
	self.branchbank.ghost_bonus = 0.1
	self.branchbank.max_bags = 24
	self.branchbank.music = "heist"
	self.branchbank.package = "packages/narr_firestarter3"
	self.branchbank.cube = "cube_apply_heist_bank"
	self.branchbank.mission_data = {
		{mission = "standalone"}
	}
	self.escape_cafe_day = {}
	self.escape_cafe_day.name_id = "heist_escape_cafe_hl"
	self.escape_cafe_day.briefing_id = "heist_escape_cafe_briefing"
	self.escape_cafe_day.briefing_dialog = "nothing"
	self.escape_cafe_day.world_name = "narratives/escapes/escape_cafe_day"
	self.escape_cafe_day.intro_event = "Play_dr1_a01"
	self.escape_cafe_day.outro_event = "nothing"
	self.escape_cafe_day.music = "heist"
	self.escape_cafe_day.package = "packages/escape_cafe"
	self.escape_cafe_day.cube = "cube_apply_heist_bank"
	self.escape_park_day = {}
	self.escape_park_day.name_id = "heist_escape_park_hl"
	self.escape_park_day.briefing_id = "heist_escape_park_briefing"
	self.escape_park_day.briefing_dialog = "nothing"
	self.escape_park_day.world_name = "narratives/escapes/escape_park_day"
	self.escape_park_day.intro_event = "Play_dr1_a01"
	self.escape_park_day.outro_event = "nothing"
	self.escape_park_day.music = "heist"
	self.escape_park_day.package = "packages/escape_park"
	self.escape_park_day.cube = "cube_apply_heist_bank"
	self.escape_cafe = {}
	self.escape_cafe.name_id = "heist_escape_cafe_hl"
	self.escape_cafe.briefing_id = "heist_escape_cafe_briefing"
	self.escape_cafe.briefing_dialog = "nothing"
	self.escape_cafe.world_name = "narratives/escapes/escape_cafe"
	self.escape_cafe.intro_event = "Play_dr1_a01"
	self.escape_cafe.outro_event = "nothing"
	self.escape_cafe.music = "heist"
	self.escape_cafe.package = "packages/escape_cafe"
	self.escape_cafe.cube = "cube_apply_heist_bank"
	self.escape_park = {}
	self.escape_park.name_id = "heist_escape_park_hl"
	self.escape_park.briefing_id = "heist_escape_park_briefing"
	self.escape_park.briefing_dialog = "nothing"
	self.escape_park.world_name = "narratives/escapes/escape_park"
	self.escape_park.intro_event = "Play_dr1_a01"
	self.escape_park.outro_event = "nothing"
	self.escape_park.music = "heist"
	self.escape_park.package = "packages/escape_park"
	self.escape_park.cube = "cube_apply_heist_bank"
	self.escape_street = {}
	self.escape_street.name_id = "heist_escape_street_hl"
	self.escape_street.briefing_id = "heist_escape_street_briefing"
	self.escape_street.briefing_dialog = "nothing"
	self.escape_street.world_name = "narratives/escapes/escape_street"
	self.escape_street.intro_event = "Play_dr1_a01"
	self.escape_street.outro_event = "nothing"
	self.escape_street.music = "heist"
	self.escape_street.package = "packages/escape_street"
	self.escape_street.cube = "cube_apply_heist_bank"
	self.escape_overpass = {}
	self.escape_overpass.name_id = "heist_escape_overpass_hl"
	self.escape_overpass.briefing_id = "heist_escape_overpass_briefing"
	self.escape_overpass.briefing_dialog = "nothing"
	self.escape_overpass.world_name = "narratives/escapes/escape_overpass"
	self.escape_overpass.intro_event = "Play_dr1_a01"
	self.escape_overpass.outro_event = "nothing"
	self.escape_overpass.music = "heist"
	self.escape_overpass.package = "packages/escape_overpass"
	self.escape_overpass.cube = "cube_apply_heist_bank"
	self.escape_overpass_night = deep_clone(self.escape_overpass)
	self.escape_garage = {}
	self.escape_garage.name_id = "heist_escape_garage_hl"
	self.escape_garage.briefing_id = "heist_escape_garage_briefing"
	self.escape_garage.briefing_dialog = "nothing"
	self.escape_garage.world_name = "narratives/escapes/escape_garage"
	self.escape_garage.intro_event = "Play_dr1_a01"
	self.escape_garage.outro_event = "nothing"
	self.escape_garage.music = "heist"
	self.escape_garage.package = "packages/escape_garage"
	self.escape_garage.cube = "cube_apply_heist_bank"
	self.safehouse = {}
	self.safehouse.name_id = "heist_safehouse_hl"
	self.safehouse.briefing_id = "heist_safehouse_briefing"
	self.safehouse.briefing_dialog = "Play_pln_sh_intro"
	self.safehouse.world_name = "narratives/safehouse"
	self.safehouse.intro_event = "nothing"
	self.safehouse.outro_event = "nothing"
	self.safehouse.music = "heist"
	self.safehouse.package = "packages/safehouse"
	self.safehouse.cube = "cube_apply_heist_bank"
	self.safehouse.team_ai_off = true
	self.crojob2 = {}
	self.crojob2.name_id = "heist_crojob2_hl"
	self.crojob2.briefing_id = "heist_crojob2_briefing"
	self.crojob2.briefing_dialog = "Play_pln_cr2_brf_01"
	self.crojob2.world_name = "narratives/butcher/thebomb/stage_2"
	self.crojob2.intro_event = "Play_pln_cr2_intro_01"
	self.crojob2.outro_event = {
		"butcher_cr1_debrief_01",
		"butcher_cr1_debrief_02"
	}
	self.crojob2.music = "heist"
	self.crojob2.package = {
		"packages/dlcs/the_bomb/crojob_stage_2"
	}
	self.crojob2.cube = "cube_apply_heist_bank"
	self.crojob2.ghost_bonus = 0.2
	self.crojob2.max_bags = 21
	self.crojob3 = {}
	self.crojob3.name_id = "heist_crojob3_hl"
	self.crojob3.briefing_id = "heist_crojob3_briefing"
	self.crojob3.briefing_dialog = "Play_pln_cr3_brf_01"
	self.crojob3.world_name = "narratives/butcher/thebomb/stage_3"
	self.crojob3.intro_event = "Play_pln_cr3_intro_01"
	self.crojob3.outro_event = "lol"
	self.crojob3.music = "heist"
	self.crojob3.package = {
		"packages/dlcs/the_bomb/crojob_stage_3"
	}
	self.crojob3.cube = "cube_apply_heist_bank"
	self.crojob3.max_bags = 16
	self.crojob3_night = deep_clone(self.crojob3)
	self.crojob3_night.env_params = {
		environment = "environments/pd2_env_cro_night/pd2_env_cro_night"
	}
	self.crojob3_night.package = {
		"packages/dlcs/the_bomb/crojob_stage_3_night"
	}
	self.arm_cro = {}
	self.arm_cro.name_id = "heist_arm_cro_hl"
	self.arm_cro.briefing_id = "heist_arm_cro_briefing"
	self.arm_cro.briefing_dialog = "Play_pln_at1_brf_01"
	self.arm_cro.world_name = "narratives/armadillo/arm_cro"
	self.arm_cro.intro_event = "Play_pln_at1_intro_02"
	self.arm_cro.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_cro.music = "heist"
	self.arm_cro.package = "packages/narr_arm_cro"
	self.arm_cro.cube = "cube_apply_heist_bank"
	self.arm_cro.max_bags = 22
	self.arm_und = {}
	self.arm_und.name_id = "heist_arm_und_hl"
	self.arm_und.briefing_id = "heist_arm_und_briefing"
	self.arm_und.briefing_dialog = "Play_pln_at1_brf_05"
	self.arm_und.world_name = "narratives/armadillo/arm_und"
	self.arm_und.intro_event = "Play_pln_at1_intro_06"
	self.arm_und.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_und.music = "heist"
	self.arm_und.package = "packages/narr_arm_und"
	self.arm_und.cube = "cube_apply_heist_bank"
	self.arm_und.max_bags = 22
	self.arm_hcm = {}
	self.arm_hcm.name_id = "heist_arm_hcm_hl"
	self.arm_hcm.briefing_id = "heist_arm_hcm_briefing"
	self.arm_hcm.briefing_dialog = "Play_pln_at1_brf_02"
	self.arm_hcm.world_name = "narratives/armadillo/arm_hcm"
	self.arm_hcm.intro_event = "Play_pln_at1_intro_03"
	self.arm_hcm.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_hcm.music = "heist"
	self.arm_hcm.package = "packages/narr_arm_hcm"
	self.arm_hcm.cube = "cube_apply_heist_bank"
	self.arm_hcm.max_bags = 22
	self.arm_par = {}
	self.arm_par.name_id = "heist_arm_par_hl"
	self.arm_par.briefing_id = "heist_arm_par_briefing"
	self.arm_par.briefing_dialog = "Play_pln_at1_brf_04"
	self.arm_par.world_name = "narratives/armadillo/arm_par"
	self.arm_par.intro_event = "Play_pln_at1_intro_05"
	self.arm_par.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_par.music = "heist"
	self.arm_par.package = "packages/narr_arm_par"
	self.arm_par.cube = "cube_apply_heist_bank"
	self.arm_par.max_bags = 22
	self.arm_fac = {}
	self.arm_fac.name_id = "heist_arm_fac_hl"
	self.arm_fac.briefing_id = "heist_arm_fac_briefing"
	self.arm_fac.briefing_dialog = "Play_pln_at1_brf_03"
	self.arm_fac.world_name = "narratives/armadillo/arm_fac"
	self.arm_fac.intro_event = "Play_pln_at1_intro_04"
	self.arm_fac.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_fac.music = "heist"
	self.arm_fac.package = "packages/narr_arm_fac"
	self.arm_fac.cube = "cube_apply_heist_bank"
	self.arm_fac.max_bags = 22
	self.arm_for = {}
	self.arm_for.name_id = "heist_arm_for_hl"
	self.arm_for.briefing_id = "heist_arm_for_briefing"
	self.arm_for.briefing_dialog = "Play_pln_tr1_brf_01"
	self.arm_for.world_name = "narratives/armadillo/arm_for"
	self.arm_for.intro_event = "Play_pln_tr1_intro_01"
	self.arm_for.outro_event = {
		"Play_pln_tr1_end_01",
		"Play_pln_tr1_end_02"
	}
	self.arm_for.music = "heist"
	self.arm_for.package = "packages/narr_arm_for"
	self.arm_for.cube = "cube_apply_heist_bank"
	self.arm_for.bonus_escape = true
	self.arm_for.max_bags = 30
	self.arm_for.ghost_bonus = 0.1
	self.family = {}
	self.family.name_id = "heist_family_hl"
	self.family.briefing_id = "heist_family_briefing"
	self.family.briefing_dialog = "pln_fj1_brf_01"
	self.family.world_name = "narratives/bain/diamond_store"
	self.family.intro_event = "Play_pln_fj1_intro_01"
	self.family.outro_event = {
		"Play_pln_fj1_end_01",
		"Play_pln_fj1_end_02"
	}
	self.family.music = "heist"
	self.family.package = "packages/narr_family"
	self.family.cube = "cube_apply_heist_bank"
	self.family.ghost_bonus = 0.05
	self.family.max_bags = 24
	self.big = {}
	self.big.name_id = "heist_big_hl"
	self.big.briefing_id = "heist_big_briefing"
	self.big.briefing_dialog = "Play_pln_bb1_brf_01"
	self.big.world_name = "narratives/bain/big"
	self.big.intro_event = "Play_pln_bb1_intro_01"
	self.big.outro_event = {
		"Play_pln_bb1_end_01",
		"Play_pln_bb1_end_02",
		"Play_pln_bb1_end_03",
		"Play_pln_bb1_end_04"
	}
	self.big.music = "big_bank"
	self.big.package = "packages/narr_big"
	self.big.cube = "cube_apply_heist_bank"
	self.big.ghost_bonus = 0.15
	self.big.max_bags = 28
	if SystemInfo:platform() == Idstring("WIN32") then
		self.roberts = {}
		self.roberts.name_id = "heist_roberts_hl"
		self.roberts.briefing_id = "heist_roberts_briefing"
		self.roberts.briefing_dialog = "Play_pln_cs1_brf"
		self.roberts.world_name = "narratives/bain/roberts"
		self.roberts.intro_event = "Play_pln_cs1_intro_01"
		self.roberts.outro_event = {
			"Play_pln_cs1_end_01",
			"Play_pln_cs1_end_02",
			"Play_pln_cs1_end_03"
		}
		self.roberts.music = "heist"
		self.roberts.package = "packages/narr_roberts"
		self.roberts.cube = "cube_apply_heist_bank"
		self.roberts.ghost_bonus = 0.1
		self.roberts.max_bags = 14
	end
	self.haunted = {}
	self.haunted.name_id = "heist_haunted_hl"
	self.haunted.briefing_id = "heist_haunted_briefing"
	self.haunted.world_name = "narratives/haunted_safehouse"
	self.haunted.intro_event = "lol"
	self.haunted.outro_event = {"lol", "lolo"}
	self.haunted.music = "heist"
	self.haunted.package = "packages/narr_haunted"
	self.haunted.cube = "cube_apply_heist_bank"
	self.mia_1 = {}
	self.mia_1.name_id = "heist_mia_1_hl"
	self.mia_1.briefing_id = "heist_mia_1_briefing"
	self.mia_1.briefing_dialog = "Play_pln_hm1_brf_01"
	self.mia_1.world_name = "narratives/dentist/mia/stage1"
	self.mia_1.intro_event = "Play_pln_hm1_intro_01"
	self.mia_1.outro_event = "Play_pln_hm1_end_01"
	self.mia_1.music = "heist"
	self.mia_1.package = "packages/narr_mia_1"
	self.mia_1.cube = "cube_apply_heist_bank"
	self.mia_1.max_bags = 15
	self.mia_2 = {}
	self.mia_2.name_id = "heist_mia_2_hl"
	self.mia_2.briefing_id = "heist_mia_2_briefing"
	self.mia_2.briefing_dialog = "Play_pln_hm2_brf_01"
	self.mia_2.world_name = "narratives/dentist/mia/stage2"
	self.mia_2.intro_event = "Play_pln_hm2_intro_01"
	self.mia_2.outro_event = {
		"dentist_hm1_debrief"
	}
	self.mia_2.music = "heist"
	self.mia_2.package = "packages/narr_mia_2"
	self.mia_2.cube = "cube_apply_heist_bank"
	self.mia_2.max_bags = 20
	self.mia_2.teams = {
		criminal1 = {
			foes = {
				mobster1 = true,
				law1 = true,
				mobster_boss = true
			}
		},
		law1 = {
			foes = {
				mobster1 = true,
				criminal1 = true,
				converted_enemy = true
			}
		},
		mobster1 = {
			foes = {
				law1 = true,
				criminal1 = true,
				converted_enemy = true
			}
		},
		mobster_boss = {
			foes = {criminal1 = true, converted_enemy = true}
		},
		converted_enemy = {
			foes = {
				mobster1 = true,
				law1 = true,
				mobster_boss = true
			}
		},
		neutral1 = {
			foes = {}
		},
		hacked_turret = {
			foes = {mobster1 = true, law1 = true}
		}
	}
	self.mia2_new = {}
	self.mia2_new.name_id = "heist_mia2_new_hl"
	self.mia2_new.briefing_id = "heist_mia_2_briefing"
	self.mia2_new.briefing_dialog = "Play_pln_hm2_brf_01"
	self.mia2_new.world_name = "narratives/dentist/mia/stage2"
	self.mia2_new.intro_event = "Play_pln_hm2_intro_01"
	self.mia2_new.outro_event = {
		"Play_gus_hm1_debrief_01",
		"Play_gus_hm1_debrief_01"
	}
	self.mia2_new.music = "heist"
	self.mia2_new.package = "packages/narr_mia_2"
	self.mia2_new.cube = "cube_apply_heist_bank"
	self.mia2_new.teams = self.mia_2.teams
	self.kosugi = {}
	self.kosugi.name_id = "heist_kosugi_hl"
	self.kosugi.briefing_id = "heist_kosugi_briefing"
	self.kosugi.briefing_dialog = "Play_pln_ko1_brf_01"
	self.kosugi.world_name = "narratives/bain/shadow_raid"
	self.kosugi.intro_event = "Play_pln_ko1_intro_01"
	self.kosugi.outro_event = {
		"Play_pln_ko1_end_01"
	}
	self.kosugi.music = "no_music"
	self.kosugi.music_ext = "kosugi_music"
	self.kosugi.music_ext_start = "suspense_1"
	self.kosugi.package = "packages/kosugi"
	self.kosugi.cube = "cube_apply_heist_bank"
	self.kosugi.ghost_bonus = 0.05
	self.kosugi.max_bags = 30
	self.gallery = deep_clone(self.framing_frame_1)
	self.gallery.name_id = "heist_gallery_hl"
	self.gallery.briefing_id = "heist_gallery_briefing"
	self.gallery.intro_event = "Play_pln_art_intro"
	self.gallery.outro_event = {
		"Play_pln_art_end"
	}
	self.gallery.briefing_dialog = "Play_pln_art_brf"
	self.hox_1 = {}
	self.hox_1.name_id = "heist_hox_1_hl"
	self.hox_1.briefing_id = "heist_hox_1_briefing"
	self.hox_1.briefing_dialog = "Play_pln_hb1_brf_01"
	self.hox_1.world_name = "narratives/dentist/hox/stage_1"
	self.hox_1.intro_event = "Play_pln_hb1_intro_01"
	self.hox_1.outro_event = {
		"Play_pln_hb1_end_01"
	}
	self.hox_1.music = "heist"
	self.hox_1.package = "packages/narr_hox_1"
	self.hox_1.cube = "cube_apply_heist_bank"
	self.hox_1.block_AIs = {old_hoxton = true}
	self.hox_2 = {}
	self.hox_2.name_id = "heist_hox_2_hl"
	self.hox_2.briefing_id = "heist_hox_2_briefing"
	self.hox_2.briefing_dialog = "Play_rb5_hb2_brf_01"
	self.hox_2.world_name = "narratives/dentist/hox/stage_2"
	self.hox_2.intro_event = "Play_rb5_hb2_intro_01"
	self.hox_2.outro_event = {
		"Play_rb5_hb2_end_01"
	}
	self.hox_2.music = "heist"
	self.hox_2.package = "packages/narr_hox_2"
	self.hox_2.cube = "cube_apply_heist_bank"
	self.hox_2.block_AIs = {old_hoxton = true}
	self.pines = {}
	self.pines.name_id = "heist_pines_hl"
	self.pines.briefing_id = "heist_pines_briefing"
	self.pines.briefing_dialog = "Play_pln_cp1_brf_01"
	self.pines.world_name = "narratives/vlad/pines"
	self.pines.intro_event = "Play_pln_cp1_intro_01"
	self.pines.outro_event = "Play_vld_cp1_end"
	self.pines.music = "heist"
	self.pines.package = "packages/narr_pines"
	self.pines.cube = "cube_apply_heist_bank"
	self.pines.max_bags = 1200
	self.mus = {}
	self.mus.name_id = "heist_mus_hl"
	self.mus.briefing_id = "heist_mus_briefing"
	self.mus.briefing_dialog = "Play_pln_hd1_brf_01"
	self.mus.world_name = "narratives/dentist/mus"
	self.mus.intro_event = "Play_pln_hd1_intro_01"
	self.mus.outro_event = {
		"dentist_hd1_debrief_01",
		"dentist_hd1_debrief_02"
	}
	self.mus.music = "heist"
	self.mus.package = "packages/narr_mus"
	self.mus.cube = "cube_apply_heist_bank"
	self.mus.max_bags = 30
	self.mus.ghost_bonus = 0.15
	self.cage = {}
	self.cage.name_id = "heist_cage_hl"
	self.cage.briefing_id = "heist_cage_briefing"
	self.cage.briefing_dialog = "Play_pln_ch1_brf_01"
	self.cage.world_name = "narratives/bain/cage"
	self.cage.intro_event = "Play_pln_ch1_intro_01"
	self.cage.outro_event = "Play_pln_ch1_end_01"
	self.cage.music = "heist"
	self.cage.package = "packages/narr_cage"
	self.cage.cube = "cube_apply_heist_bank"
	self.cage.max_bags = 6
	self.hox_3 = {}
	self.hox_3.name_id = "heist_hox_3_hl"
	self.hox_3.briefing_id = "heist_hox_3_briefing"
	self.hox_3.briefing_dialog = "Play_pln_hb3_brf_01"
	self.hox_3.world_name = "narratives/bain/revenge"
	self.hox_3.intro_event = "Play_pln_hb3_01"
	self.hox_3.outro_event = "lol"
	self.hox_3.music = "heist"
	self.hox_3.package = "packages/narr_hox_3"
	self.hox_3.cube = "cube_apply_heist_bank"
	self.hox_3.max_bags = 10
	self.hox_3.ghost_bonus = 0.1
	self.rat = {}
	self.rat.name_id = "heist_rat_hl"
	self.rat.briefing_id = "heist_rat_briefing"
	self.rat.briefing_dialog = "Play_pln_rt1b_brf_01"
	self.rat.world_name = "narratives/bain/rat"
	self.rat.intro_event = "Play_pln_rt1b_intro_01"
	self.rat.outro_event = {
		"Play_pln_rt1b_end_01",
		"Play_pln_rt1b_end_02",
		"Play_pln_rt1b_end_03",
		"Play_pln_rt1b_end_04"
	}
	self.rat.music = "heist"
	self.rat.package = "packages/narr_alex1"
	self.rat.cube = "cube_apply_heist_bank"
	self.rat.max_bags = 1200
	self.shoutout_raid = {}
	self.shoutout_raid.name_id = "heist_shoutout_raid_hl"
	self.shoutout_raid.briefing_id = "heist_shoutout_raid_briefing"
	self.shoutout_raid.briefing_dialog = "Play_pln_ko1b_brf_01"
	self.shoutout_raid.world_name = "narratives/vlad/shout"
	self.shoutout_raid.intro_event = "Play_pln_ko1b_intro_01"
	self.shoutout_raid.outro_event = "Play_vld_ko1b_end_01"
	self.shoutout_raid.music = "heist"
	self.shoutout_raid.package = "packages/vlad_shout"
	self.shoutout_raid.cube = "cube_apply_heist_bank"
	self.shoutout_raid.max_bags = 20
	self.arena = {}
	self.arena.name_id = "heist_arena_hl"
	self.arena.briefing_id = "heist_arena_briefing"
	self.arena.briefing_dialog = "Play_pln_al1_brf_01"
	self.arena.world_name = "narratives/bain/arena"
	self.arena.intro_event = "Play_pln_al1_intro_01"
	self.arena.outro_event = {
		"Play_pln_al1_54",
		"Play_pln_al1_55"
	}
	self.arena.music = "no_music"
	self.arena.death_track = "track_01"
	self.arena.death_event = "music_heist_assault"
	self.arena.package = "packages/narr_arena"
	self.arena.cube = "cube_apply_heist_bank"
	self.arena.max_bags = 25
	self.arena.ghost_bonus = 0.1
	self.kenaz = {}
	self.kenaz.name_id = "heist_kenaz_hl"
	self.kenaz.briefing_id = "heist_kenaz_briefing"
	self.kenaz.briefing_dialog = "Play_pln_ca1_brf_01"
	self.kenaz.world_name = "narratives/dentist/cas"
	self.kenaz.intro_event = {
		"Play_pln_ca1_intro_01",
		"Play_pln_ca1_intro_02"
	}
	self.kenaz.outro_event = {
		"butcher_cr1_debrief_01",
		"butcher_cr1_debrief_02"
	}
	self.kenaz.music = "heist"
	self.kenaz.package = {
		"packages/kenaz"
	}
	self.kenaz.cube = "cube_apply_heist_bank"
	self.kenaz.ghost_bonus = 0.1
	self.kenaz.max_bags = 40
	self._level_index = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"welcome_to_the_jungle_2",
		"framing_frame_1",
		"framing_frame_2",
		"framing_frame_3",
		"election_day_1",
		"election_day_2",
		"election_day_3",
		"election_day_3_skip1",
		"election_day_3_skip2",
		"watchdogs_1",
		"watchdogs_2",
		"watchdogs_1_night",
		"watchdogs_2_day",
		"alex_1",
		"alex_2",
		"alex_3",
		"firestarter_1",
		"firestarter_2",
		"firestarter_3",
		"ukrainian_job",
		"jewelry_store",
		"four_stores",
		"mallcrasher",
		"nightclub",
		"branchbank",
		"escape_cafe",
		"escape_park",
		"escape_cafe_day",
		"escape_park_day",
		"escape_street",
		"escape_overpass",
		"escape_garage",
		"escape_overpass_night",
		"safehouse",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_cro",
		"arm_und",
		"arm_for",
		"family",
		"big",
		"mia_1",
		"mia_2",
		"mia2_new",
		"kosugi",
		"gallery",
		"hox_1",
		"hox_2",
		"pines",
		"cage",
		"hox_3",
		"mus",
		"crojob2",
		"crojob3",
		"crojob3_night",
		"rat",
		"shoutout_raid",
		"arena",
		"kenaz"
	}
	if SystemInfo:platform() == Idstring("WIN32") then
		table.insert(self._level_index, "roberts")
	end
	self.escape_levels = {
		"escape_cafe",
		"escape_park",
		"escape_street",
		"escape_overpass",
		"escape_garage",
		"escape_overpass_night",
		"escape_cafe_day",
		"escape_park_day",
		"election_day_3",
		"arm_for",
		"escape_hell",
		"blueharvest_3"
	}
end
function LevelsTweakData:get_level_index()
	return self._level_index
end
function LevelsTweakData:get_world_name_from_index(index)
	if not self._level_index[index] then
		return
	end
	return self[self._level_index[index]].world_name
end
function LevelsTweakData:get_level_name_from_index(index)
	return self._level_index[index]
end
function LevelsTweakData:get_index_from_world_name(world_name)
	for index, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return index
		end
	end
end
function LevelsTweakData:get_index_from_level_id(level_id)
	for index, entry_name in ipairs(self._level_index) do
		if entry_name == level_id then
			return index
		end
	end
end
function LevelsTweakData:requires_dlc(level_id)
	return self[level_id].dlc
end
function LevelsTweakData:requires_dlc_by_index(index)
	return self[self._level_index[index]].dlc
end
function LevelsTweakData:get_level_name_from_world_name(world_name)
	for _, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return entry_name
		end
	end
end
function LevelsTweakData:get_localized_level_name_from_world_name(world_name)
	for _, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return managers.localization:text(self[entry_name].name_id)
		end
	end
end
function LevelsTweakData:get_localized_level_name_from_level_id(level_id)
	for _, entry_name in ipairs(self._level_index) do
		if level_id == entry_name then
			return managers.localization:text(self[entry_name].name_id)
		end
	end
end
function LevelsTweakData:get_music_switches()
	if not Global.level_data then
		return nil
	end
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music_id = level_data and level_data.music or "default"
	if music_id == "no_music" then
		return nil
	end
	local switches = {}
	if not Global.music_manager.loadout_selection then
		switches = managers.music:jukebox_random_all()
	elseif Global.music_manager.loadout_selection == "global" then
		switches = deep_clone(managers.music:playlist())
	elseif Global.music_manager.loadout_selection == "heist" then
		local track = managers.music:jukebox_heist_specific()
		if track == "all" then
			switches = managers.music:jukebox_random_all()
		elseif track == "playlist" then
			switches = deep_clone(managers.music:playlist())
		else
			table.insert(switches, track)
		end
	elseif Global.music_manager.loadout_selection == "server" then
		if Network:is_server() then
			switches = managers.music:jukebox_random_all()
		else
			table.insert(switches, Global.music_manager.synced_track)
		end
	else
		table.insert(switches, Global.music_manager.loadout_selection)
	end
	if #switches == 0 then
		Application:error("[LevelsTweakData:get_music_switches] Failed to find a track. JOB_ID = " .. (Global.job_manager.current_job and Global.job_manager.current_job.job_id or "[Missing]") .. ", SELECTION = " .. Global.music_manager.loadout_selection)
	end
	return switches
end
function LevelsTweakData:get_music_event(stage)
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music_id = level_data and level_data.music or "default"
	if music_id == "no_music" then
		return nil
	end
	return tweak_data.music[music_id][stage]
end
function LevelsTweakData:get_music_event_ext()
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music = level_data and level_data.music_ext
	local music_start = level_data and level_data.music_ext_start
	return music, music_start
end
function LevelsTweakData:get_default_team_ID(type)
	local lvl_tweak = self[Global.level_data.level_id]
	if lvl_tweak and lvl_tweak.default_teams and lvl_tweak.default_teams[type] then
		if lvl_tweak.teams[lvl_tweak.default_teams[type]] then
			return lvl_tweak.default_teams[type]
		else
			debug_pause("[LevelsTweakData:get_default_player_team_ID] Team not defined ", lvl_tweak.default_teams[type], "in", Global.level_data.level_id)
		end
	end
	if type == "player" then
		return "criminal1"
	elseif type == "combatant" then
		return "law1"
	elseif type == "non_combatant" then
		return "neutral1"
	else
		return "mobster1"
	end
end
function LevelsTweakData:get_team_setup()
	local lvl_tweak
	if Application:editor() and managers.editor then
		lvl_tweak = self[managers.editor:layer("Level Settings"):get_setting("simulation_level_id")]
	else
		lvl_tweak = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]
	end
	local teams = lvl_tweak and lvl_tweak.teams
	if teams then
		teams = deep_clone(teams)
	else
		teams = {
			criminal1 = {
				foes = {mobster1 = true, law1 = true}
			},
			law1 = {
				foes = {
					mobster1 = true,
					criminal1 = true,
					converted_enemy = true
				}
			},
			mobster1 = {
				foes = {
					law1 = true,
					criminal1 = true,
					converted_enemy = true
				}
			},
			converted_enemy = {
				foes = {mobster1 = true, law1 = true}
			},
			neutral1 = {
				foes = {}
			},
			hacked_turret = {
				foes = {mobster1 = true, law1 = true}
			}
		}
		for id, team in pairs(teams) do
			team.id = id
		end
	end
	return teams
end
function LevelsTweakData:get_default_team_IDs()
	local lvl_tweak
	if Application:editor() and managers.editor then
		lvl_tweak = self[managers.editor:layer("Level Settings"):get_setting("simulation_level_id")]
	else
		lvl_tweak = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]
	end
	local default_team_IDs = lvl_tweak and lvl_tweak.default_teams
	default_team_IDs = default_team_IDs or {
		player = self:get_default_team_ID("player"),
		combatant = self:get_default_team_ID("combatant"),
		non_combatant = self:get_default_team_ID("non_combatant"),
		gangster = self:get_default_team_ID("gangster")
	}
	return default_team_IDs
end
function LevelsTweakData:get_team_names_indexed()
	local teams_index = self._teams_index
	if not teams_index then
		teams_index = {}
		local teams = self:get_team_setup()
		for team_id, team_data in pairs(teams) do
			table.insert(teams_index, team_id)
		end
		table.sort(teams_index)
		self._teams_index = teams_index
	end
	return teams_index
end
function LevelsTweakData:get_team_index(team_id)
	local teams_index = self:get_team_names_indexed()
	for index, test_team_id in ipairs(teams_index) do
		if team_id == test_team_id then
			return index
		end
	end
end
