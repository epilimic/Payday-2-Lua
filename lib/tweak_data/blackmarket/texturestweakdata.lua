local is_nextgen_console = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1")
function BlackMarketTweakData:_init_textures()
	self.textures = {}
	self.textures.no_color_no_material = {}
	self.textures.no_color_no_material.name_id = "bm_txt_no_color_no_material"
	self.textures.no_color_no_material.texture = "units/payday2/masks/shared_textures/patterns/pattern_no_color_no_material_df"
	self.textures.no_color_no_material.value = 0
	self.textures.no_color_full_material = {}
	self.textures.no_color_full_material.name_id = "bm_txt_no_color_full_material"
	self.textures.no_color_full_material.texture = "units/payday2/masks/shared_textures/patterns/pattern_no_color_full_material_df"
	self.textures.no_color_full_material.value = 1
	self.textures.big_skull = {}
	self.textures.big_skull.name_id = "bm_txt_big_skull"
	self.textures.big_skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.big_skull.texture = "units/payday2/masks/shared_textures/patterns/pattern_big_skull_df"
	self.textures.big_skull.value = 4
	self.textures.eightball = {}
	self.textures.eightball.name_id = "bm_txt_eightball"
	self.textures.eightball.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.eightball.texture = "units/payday2/masks/shared_textures/patterns/pattern_eightball_df"
	self.textures.eightball.value = 8
	self.textures.zebra = {}
	self.textures.zebra.name_id = "bm_txt_zebra"
	self.textures.zebra.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.zebra.texture = "units/payday2/masks/shared_textures/patterns/pattern_zebra_df"
	self.textures.zebra.value = 3
	self.textures.overkill = {}
	self.textures.overkill.name_id = "bm_txt_overkill"
	self.textures.overkill.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.overkill.texture = "units/payday2/masks/shared_textures/patterns/pattern_overkill_df"
	self.textures.overkill.infamous = true
	self.textures.overkill.value = 10
	self.textures.spawn = {}
	self.textures.spawn.name_id = "bm_txt_spawn"
	self.textures.spawn.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spawn.texture = "units/payday2/masks/shared_textures/patterns/pattern_spawn_df"
	self.textures.spawn.infamous = true
	self.textures.spawn.value = 4
	self.textures.marv = {}
	self.textures.marv.name_id = "bm_txt_marv"
	self.textures.marv.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.marv.texture = "units/payday2/masks/shared_textures/patterns/pattern_marv_df"
	self.textures.marv.value = 5
	self.textures.starbreeze = {}
	self.textures.starbreeze.name_id = "bm_txt_starbreeze"
	self.textures.starbreeze.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.starbreeze.texture = "units/payday2/masks/shared_textures/patterns/pattern_starbreeze_df"
	self.textures.starbreeze.value = 3
	self.textures.cobrakai = {}
	self.textures.cobrakai.name_id = "bm_txt_cobrakai"
	self.textures.cobrakai.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cobrakai.texture = "units/payday2/masks/shared_textures/patterns/pattern_cobrakai_df"
	self.textures.cobrakai.infamous = true
	self.textures.cobrakai.value = 4
	self.textures.flames = {}
	self.textures.flames.name_id = "bm_txt_flames"
	self.textures.flames.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.flames.texture = "units/payday2/masks/shared_textures/patterns/pattern_flames_df"
	self.textures.flames.value = 6
	self.textures.tribal = {}
	self.textures.tribal.name_id = "bm_txt_tribal"
	self.textures.tribal.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tribal.texture = "units/payday2/masks/shared_textures/patterns/pattern_tribal_df"
	self.textures.tribal.value = 7
	self.textures.skull = {}
	self.textures.skull.name_id = "bm_txt_skull"
	self.textures.skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.skull.texture = "units/payday2/masks/shared_textures/patterns/pattern_skull_df"
	self.textures.skull.value = 8
	self.textures.arrow = {}
	self.textures.arrow.name_id = "bm_txt_arrow"
	self.textures.arrow.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.arrow.texture = "units/payday2/masks/shared_textures/patterns/pattern_arrow_df"
	self.textures.arrow.value = 3
	self.textures.usa = {}
	self.textures.usa.name_id = "bm_txt_usa"
	self.textures.usa.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.usa.texture = "units/payday2/masks/shared_textures/patterns/pattern_usa_df"
	self.textures.usa.value = 5
	self.textures.unionjack = {}
	self.textures.unionjack.name_id = "bm_txt_unionjack"
	self.textures.unionjack.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.unionjack.texture = "units/payday2/masks/shared_textures/patterns/pattern_unionjack_df"
	self.textures.unionjack.value = 6
	self.textures.fleur = {}
	self.textures.fleur.name_id = "bm_txt_fleur"
	self.textures.fleur.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fleur.texture = "units/payday2/masks/shared_textures/patterns/pattern_fleur_df"
	self.textures.fleur.value = 7
	self.textures.hearts = {}
	self.textures.hearts.name_id = "bm_txt_hearts"
	self.textures.hearts.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hearts.texture = "units/payday2/masks/shared_textures/patterns/pattern_hearts_df"
	self.textures.hearts.value = 4
	self.textures.electric = {}
	self.textures.electric.name_id = "bm_txt_electric"
	self.textures.electric.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.electric.texture = "units/payday2/masks/shared_textures/patterns/pattern_electric_df"
	self.textures.electric.value = 3
	self.textures.electric.infamous = true
	self.textures.puzzle = {}
	self.textures.puzzle.name_id = "bm_txt_puzzle"
	self.textures.puzzle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.puzzle.texture = "units/payday2/masks/shared_textures/patterns/pattern_puzzle_df"
	self.textures.puzzle.value = 5
	self.textures.swe_camo = {}
	self.textures.swe_camo.name_id = "bm_txt_swe_camo"
	self.textures.swe_camo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.swe_camo.texture = "units/payday2/masks/shared_textures/patterns/pattern_swe_camo_df"
	self.textures.swe_camo.value = 6
	self.textures.japan = {}
	self.textures.japan.name_id = "bm_txt_japan"
	self.textures.japan.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.japan.texture = "units/payday2/masks/shared_textures/patterns/pattern_japan_df"
	self.textures.japan.value = 7
	self.textures.celtic1 = {}
	self.textures.celtic1.name_id = "bm_txt_celtic1"
	self.textures.celtic1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.celtic1.texture = "units/payday2/masks/shared_textures/patterns/pattern_celtic1_df"
	self.textures.celtic1.value = 3
	self.textures.dragon_full = {}
	self.textures.dragon_full.name_id = "bm_txt_dragon_full"
	self.textures.dragon_full.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.dragon_full.texture = "units/payday2/masks/shared_textures/patterns/pattern_dragon_full_df"
	self.textures.dragon_full.infamous = true
	self.textures.dragon_full.value = 9
	self.textures.dragon_split = {}
	self.textures.dragon_split.name_id = "bm_txt_dragon_split"
	self.textures.dragon_split.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.dragon_split.texture = "units/payday2/masks/shared_textures/patterns/pattern_dragon_split_df"
	self.textures.dragon_split.value = 5
	self.textures.horizon_circle = {}
	self.textures.horizon_circle.name_id = "bm_txt_horizon_circle"
	self.textures.horizon_circle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.horizon_circle.texture = "units/payday2/masks/shared_textures/patterns/pattern_horizon_circle_df"
	self.textures.horizon_circle.value = 4
	self.textures.tribal2 = {}
	self.textures.tribal2.name_id = "bm_txt_tribal2"
	self.textures.tribal2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tribal2.texture = "units/payday2/masks/shared_textures/patterns/pattern_tribal2_df"
	self.textures.tribal2.value = 8
	self.textures.vertical = {}
	self.textures.vertical.name_id = "bm_txt_vertical"
	self.textures.vertical.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.vertical.texture = "units/payday2/masks/shared_textures/patterns/pattern_vertical_df"
	self.textures.vertical.value = 4
	self.textures.celtic2 = {}
	self.textures.celtic2.name_id = "bm_txt_celtic2"
	self.textures.celtic2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.celtic2.texture = "units/payday2/masks/shared_textures/patterns/pattern_celtic2_df"
	self.textures.celtic2.value = 2
	self.textures.beast = {}
	self.textures.beast.name_id = "bm_txt_beast"
	self.textures.beast.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.beast.texture = "units/payday2/masks/shared_textures/patterns/pattern_beast_df"
	self.textures.beast.value = 3
	self.textures.headshot = {}
	self.textures.headshot.name_id = "bm_txt_headshot"
	self.textures.headshot.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.headshot.texture = "units/payday2/masks/shared_textures/patterns/pattern_headshot_df"
	self.textures.headshot.value = 5
	self.textures.circuit = {}
	self.textures.circuit.name_id = "bm_txt_circuit"
	self.textures.circuit.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.circuit.texture = "units/payday2/masks/shared_textures/patterns/pattern_circuit_df"
	self.textures.circuit.value = 3
	self.textures.paint1 = {}
	self.textures.paint1.name_id = "bm_txt_paint1"
	self.textures.paint1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.paint1.texture = "units/payday2/masks/shared_textures/patterns/pattern_paint1_df"
	self.textures.paint1.value = 2
	self.textures.chains = {}
	self.textures.chains.name_id = "bm_txt_chains"
	self.textures.chains.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.chains.texture = "units/payday2/masks/shared_textures/patterns/pattern_chains_df"
	self.textures.chains.value = 4
	self.textures.yinyang = {}
	self.textures.yinyang.name_id = "bm_txt_yinyang"
	self.textures.yinyang.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.yinyang.texture = "units/payday2/masks/shared_textures/patterns/pattern_yinyang_df"
	self.textures.yinyang.value = 6
	self.textures.rorschach = {}
	self.textures.rorschach.name_id = "bm_txt_rorschach"
	self.textures.rorschach.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.rorschach.texture = "units/payday2/masks/shared_textures/patterns/pattern_rorschach_df"
	self.textures.rorschach.infamous = true
	self.textures.rorschach.value = 6
	self.textures.zipper = {}
	self.textures.zipper.name_id = "bm_txt_zipper"
	self.textures.zipper.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.zipper.texture = "units/payday2/masks/shared_textures/patterns/pattern_zipper_df"
	self.textures.zipper.value = 2
	self.textures.daniel = {}
	self.textures.daniel.name_id = "bm_txt_daniel"
	self.textures.daniel.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.daniel.texture = "units/payday2/masks/shared_textures/patterns/pattern_daniel_df"
	self.textures.daniel.value = 2
	self.textures.ouroboros = {}
	self.textures.ouroboros.name_id = "bm_txt_ouroboros"
	self.textures.ouroboros.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ouroboros.texture = "units/payday2/masks/shared_textures/patterns/pattern_ouroboros_df"
	self.textures.ouroboros.value = 7
	self.textures.ouro = {}
	self.textures.ouro.name_id = "bm_txt_ouro"
	self.textures.ouro.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ouro.texture = "units/payday2/masks/shared_textures/patterns/pattern_ouro_df"
	self.textures.ouro.value = 5
	self.textures.cat = {}
	self.textures.cat.name_id = "bm_txt_cat"
	self.textures.cat.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cat.texture = "units/payday2/masks/shared_textures/patterns/pattern_cat_df"
	self.textures.cat.infamous = true
	self.textures.cat.value = 6
	self.textures.clown = {}
	self.textures.clown.name_id = "bm_txt_clown"
	self.textures.clown.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.clown.texture = "units/payday2/masks/shared_textures/patterns/pattern_clown_df"
	self.textures.clown.value = 2
	self.textures.paint2 = {}
	self.textures.paint2.name_id = "bm_txt_paint2"
	self.textures.paint2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.paint2.texture = "units/payday2/masks/shared_textures/patterns/pattern_paint2_df"
	self.textures.paint2.value = 2
	self.textures.spider = {}
	self.textures.spider.name_id = "bm_txt_spider"
	self.textures.spider.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spider.texture = "units/payday2/masks/shared_textures/patterns/pattern_spider_df"
	self.textures.spider.value = 7
	self.textures.target = {}
	self.textures.target.name_id = "bm_txt_target"
	self.textures.target.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.target.texture = "units/payday2/masks/shared_textures/patterns/pattern_target_df"
	self.textures.target.value = 5
	self.textures.illuminati = {}
	self.textures.illuminati.name_id = "bm_txt_illuminati"
	self.textures.illuminati.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.illuminati.texture = "units/payday2/masks/shared_textures/patterns/pattern_illuminati_df"
	self.textures.illuminati.value = 7
	self.textures.hypnotic = {}
	self.textures.hypnotic.name_id = "bm_txt_hypnotic"
	self.textures.hypnotic.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hypnotic.texture = "units/payday2/masks/shared_textures/patterns/pattern_hypnotic_df"
	self.textures.hypnotic.value = 3
	self.textures.hexagon = {}
	self.textures.hexagon.name_id = "bm_txt_hexagon"
	self.textures.hexagon.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hexagon.texture = "units/payday2/masks/shared_textures/patterns/pattern_hexagon_df"
	self.textures.hexagon.value = 4
	self.textures.messatsu = {}
	self.textures.messatsu.name_id = "bm_txt_messatsu"
	self.textures.messatsu.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.messatsu.texture = "units/payday2/masks/shared_textures/patterns/pattern_messatsu_df"
	self.textures.messatsu.value = 2
	self.textures.shazam = {}
	self.textures.shazam.name_id = "bm_txt_shazam"
	self.textures.shazam.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.shazam.texture = "units/payday2/masks/shared_textures/patterns/pattern_shazam_df"
	self.textures.shazam.value = 2
	self.textures.emblem1 = {}
	self.textures.emblem1.name_id = "bm_txt_emblem1"
	self.textures.emblem1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem1.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem1_df"
	self.textures.emblem1.value = 1
	self.textures.emblem2 = {}
	self.textures.emblem2.name_id = "bm_txt_emblem2"
	self.textures.emblem2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem2.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem2_df"
	self.textures.emblem2.value = 2
	self.textures.emblem3 = {}
	self.textures.emblem3.name_id = "bm_txt_emblem3"
	self.textures.emblem3.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem3.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem3_df"
	self.textures.emblem3.value = 3
	self.textures.swirl = {}
	self.textures.swirl.name_id = "bm_txt_swirl"
	self.textures.swirl.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.swirl.texture = "units/payday2/masks/shared_textures/patterns/pattern_swirl_df"
	self.textures.swirl.value = 4
	self.textures.kabuki1 = {}
	self.textures.kabuki1.name_id = "bm_txt_kabuki1"
	self.textures.kabuki1.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.kabuki1.texture = "units/payday2/masks/shared_textures/patterns/pattern_kabuki1_df"
	self.textures.kabuki1.value = 5
	self.textures.ultimaterobber = {}
	self.textures.ultimaterobber.name_id = "bm_txt_ultimaterobber"
	self.textures.ultimaterobber.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ultimaterobber.texture = "units/payday2/masks/shared_textures/patterns/pattern_ultimaterobber_df"
	self.textures.ultimaterobber.infamous = true
	self.textures.ultimaterobber.value = 6
	self.textures.nuclear = {}
	self.textures.nuclear.name_id = "bm_txt_nuclear"
	self.textures.nuclear.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.nuclear.texture = "units/payday2/masks/shared_textures/patterns/pattern_nuclear_df"
	self.textures.nuclear.value = 7
	self.textures.gearhead = {}
	self.textures.gearhead.name_id = "bm_txt_gearhead"
	self.textures.gearhead.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.gearhead.texture = "units/payday2/masks/shared_textures/patterns/pattern_gearhead_df"
	self.textures.gearhead.value = 6
	self.textures.atom = {}
	self.textures.atom.name_id = "bm_txt_atom"
	self.textures.atom.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.atom.texture = "units/payday2/masks/shared_textures/patterns/pattern_atom_df"
	self.textures.atom.value = 5
	self.textures.hand = {}
	self.textures.hand.name_id = "bm_txt_hand"
	self.textures.hand.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hand.texture = "units/payday2/masks/shared_textures/patterns/pattern_hand_df"
	self.textures.hand.value = 4
	self.textures.scars = {}
	self.textures.scars.name_id = "bm_txt_scars"
	self.textures.scars.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.scars.texture = "units/payday2/masks/shared_textures/patterns/pattern_scars_df"
	self.textures.scars.value = 3
	self.textures.pirate = {}
	self.textures.pirate.name_id = "bm_txt_pirate"
	self.textures.pirate.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.pirate.texture = "units/payday2/masks/shared_textures/patterns/pattern_pirate_df"
	self.textures.pirate.value = 2
	self.textures.foot = {}
	self.textures.foot.name_id = "bm_txt_foot"
	self.textures.foot.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.foot.texture = "units/payday2/masks/shared_textures/patterns/pattern_foot_df"
	self.textures.foot.value = 7
	self.textures.star = {}
	self.textures.star.name_id = "bm_txt_star"
	self.textures.star.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.star.texture = "units/payday2/masks/shared_textures/patterns/pattern_star_df"
	self.textures.star.value = 8
	self.textures.portal = {}
	self.textures.portal.name_id = "bm_txt_portal"
	self.textures.portal.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.portal.texture = "units/payday2/masks/shared_textures/patterns/pattern_portal_df"
	self.textures.portal.value = 6
	self.textures.aperture = {}
	self.textures.aperture.name_id = "bm_txt_aperture"
	self.textures.aperture.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.aperture.texture = "units/payday2/masks/shared_textures/patterns/pattern_aperture_df"
	self.textures.aperture.value = 5
	self.textures.girlsandboys = {}
	self.textures.girlsandboys.name_id = "bm_txt_girlsandboys"
	self.textures.girlsandboys.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.girlsandboys.texture = "units/payday2/masks/shared_textures/patterns/pattern_girlsandboys_df"
	self.textures.girlsandboys.value = 4
	self.textures.loverboy = {}
	self.textures.loverboy.name_id = "bm_txt_loverboy"
	self.textures.loverboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.loverboy.texture = "units/payday2/masks/shared_textures/patterns/pattern_loverboy_df"
	self.textures.loverboy.value = 3
	self.textures.cogs = {}
	self.textures.cogs.name_id = "bm_txt_cogs"
	self.textures.cogs.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cogs.texture = "units/payday2/masks/shared_textures/patterns/pattern_cogs_df"
	self.textures.cogs.value = 4
	self.textures.ace = {}
	self.textures.ace.name_id = "bm_txt_ace"
	self.textures.ace.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ace.texture = "units/payday2/masks/shared_textures/patterns/pattern_ace_df"
	self.textures.ace.infamous = true
	self.textures.ace.value = 5
	self.textures.compass = {}
	self.textures.compass.name_id = "bm_txt_compass"
	self.textures.compass.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.compass.texture = "units/payday2/masks/shared_textures/patterns/pattern_compass_df"
	self.textures.compass.value = 2
	self.textures.fan = {}
	self.textures.fan.name_id = "bm_txt_fan"
	self.textures.fan.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fan.dlc = "preorder"
	self.textures.fan.texture = "units/payday2/masks/shared_textures/patterns/pattern_fan_df"
	self.textures.fan.value = 1
	self.textures.pd2 = {}
	self.textures.pd2.name_id = "bm_txt_pd2"
	self.textures.pd2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.pd2.texture = "units/payday2/masks/shared_textures/patterns/pattern_pd2_df"
	self.textures.pd2.value = 4
	self.textures.fingerprint = {}
	self.textures.fingerprint.name_id = "bm_txt_fingerprint"
	self.textures.fingerprint.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fingerprint.texture = "units/payday2/masks/shared_textures/patterns/pattern_fingerprint_df"
	self.textures.fingerprint.infamous = true
	self.textures.fingerprint.value = 3
	self.textures.biohazard = {}
	self.textures.biohazard.name_id = "bm_txt_biohazard"
	self.textures.biohazard.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.biohazard.texture = "units/payday2/masks/shared_textures/patterns/pattern_biohazard_df"
	self.textures.biohazard.value = 2
	self.textures.tf2 = {}
	self.textures.tf2.name_id = "bm_txt_tf2"
	self.textures.tf2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.tf2.texture = "units/payday2/masks/shared_textures/patterns/pattern_tf2_df"
	self.textures.tf2.value = 3
	self.textures.cake = {}
	self.textures.cake.name_id = "bm_txt_cake"
	self.textures.cake.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cake.texture = "units/payday2/masks/shared_textures/patterns/pattern_cake_df"
	self.textures.cake.value = 4
	self.textures.companioncube = {}
	self.textures.companioncube.name_id = "bm_txt_companioncube"
	self.textures.companioncube.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.companioncube.texture = "units/payday2/masks/shared_textures/patterns/pattern_companioncube_df"
	self.textures.companioncube.value = 6
	self.textures.two = {}
	self.textures.two.name_id = "bm_txt_two"
	self.textures.two.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.two.texture = "units/payday2/masks/shared_textures/patterns/pattern_two_df"
	self.textures.two.value = 5
	self.textures.striped = {}
	self.textures.striped.name_id = "bm_txt_striped"
	self.textures.striped.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.striped.texture = "units/payday2/masks/shared_textures/patterns/pattern_striped_df"
	self.textures.striped.value = 3
	self.textures.solidfirst = {}
	self.textures.solidfirst.name_id = "bm_txt_solidfirst"
	self.textures.solidfirst.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.solidfirst.texture = "units/payday2/masks/shared_textures/patterns/pattern_solidfirst_df"
	self.textures.solidfirst.infamous = true
	self.textures.solidfirst.value = 6
	self.textures.solidsecond = {}
	self.textures.solidsecond.name_id = "bm_txt_solidsecond"
	self.textures.solidsecond.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.solidsecond.texture = "units/payday2/masks/shared_textures/patterns/pattern_solidsecond_df"
	self.textures.solidsecond.infamous = true
	self.textures.solidsecond.value = 6
	self.textures.mantis = {}
	self.textures.mantis.name_id = "bm_txt_mantis"
	self.textures.mantis.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.mantis.texture = "units/payday2/masks/shared_textures/patterns/pattern_mantis_df"
	self.textures.mantis.value = 7
	self.textures.bite = {}
	self.textures.bite.name_id = "bm_txt_bite"
	self.textures.bite.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.bite.texture = "units/payday2/masks/shared_textures/patterns/pattern_bite_df"
	self.textures.bite.value = 3
	self.textures.wtf = {}
	self.textures.wtf.name_id = "bm_txt_wtf"
	self.textures.wtf.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.wtf.texture = "units/payday2/masks/shared_textures/patterns/pattern_wtf_df"
	self.textures.wtf.value = 4
	self.textures.bloodsucker = {}
	self.textures.bloodsucker.name_id = "bm_txt_bloodsucker"
	self.textures.bloodsucker.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.bloodsucker.texture = "units/payday2/masks/shared_textures/patterns/pattern_bloodsucker_df"
	self.textures.bloodsucker.value = 2
	self.textures.hawk = {}
	self.textures.hawk.name_id = "bm_txt_hawk"
	self.textures.hawk.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hawk.texture = "units/payday2/masks/shared_textures/patterns/pattern_hawk_df"
	self.textures.hawk.value = 4
	self.textures.magnet = {}
	self.textures.magnet.name_id = "bm_txt_magnet"
	self.textures.magnet.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.magnet.texture = "units/payday2/masks/shared_textures/patterns/pattern_magnet_df"
	self.textures.magnet.value = 2
	self.textures.diamond = {}
	self.textures.diamond.name_id = "bm_txt_diamond"
	self.textures.diamond.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.diamond.texture = "units/payday2/masks/shared_textures/patterns/pattern_diamond_df"
	self.textures.diamond.value = 3
	self.textures.luchador = {}
	self.textures.luchador.name_id = "bm_txt_luchador"
	self.textures.luchador.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.luchador.texture = "units/payday2/masks/shared_textures/patterns/pattern_luchador_df"
	self.textures.luchador.value = 1
	self.textures.maskedfalcon = {}
	self.textures.maskedfalcon.name_id = "bm_txt_maskedfalcon"
	self.textures.maskedfalcon.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.maskedfalcon.texture = "units/payday2/masks/shared_textures/patterns/pattern_maskedfalcon_df"
	self.textures.maskedfalcon.value = 3
	self.textures.grayson = {}
	self.textures.grayson.name_id = "bm_txt_grayson"
	self.textures.grayson.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.grayson.texture = "units/payday2/masks/shared_textures/patterns/pattern_grayson_df"
	self.textures.grayson.value = 2
	self.textures.sidestripe = {}
	self.textures.sidestripe.name_id = "bm_txt_sidestripe"
	self.textures.sidestripe.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.sidestripe.texture = "units/payday2/masks/shared_textures/patterns/pattern_sidestripe_df"
	self.textures.sidestripe.value = 5
	self.textures.gradient = {}
	self.textures.gradient.name_id = "bm_txt_gradient"
	self.textures.gradient.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.gradient.texture = "units/payday2/masks/shared_textures/patterns/pattern_gradient_df"
	self.textures.gradient.value = 4
	self.textures.spikes = {}
	self.textures.spikes.name_id = "bm_txt_spikes"
	self.textures.spikes.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.spikes.texture = "units/payday2/masks/shared_textures/patterns/pattern_spikes_df"
	self.textures.spikes.value = 3
	self.textures.barbarian = {}
	self.textures.barbarian.name_id = "bm_txt_barbarian"
	self.textures.barbarian.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.barbarian.texture = "units/payday2/masks/shared_textures/patterns/pattern_barbarian_df"
	self.textures.barbarian.value = 2
	self.textures.reaper = {}
	self.textures.reaper.name_id = "bm_txt_reaper"
	self.textures.reaper.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.reaper.texture = "units/payday2/masks/shared_textures/patterns/pattern_reaper_df"
	self.textures.reaper.value = 4
	self.textures.whiner = {}
	self.textures.whiner.name_id = "bm_txt_whiner"
	self.textures.whiner.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.whiner.texture = "units/payday2/masks/shared_textures/patterns/pattern_whiner_df"
	self.textures.whiner.value = 3
	self.textures.emblem4 = {}
	self.textures.emblem4.name_id = "bm_txt_emblem4"
	self.textures.emblem4.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.emblem4.texture = "units/payday2/masks/shared_textures/patterns/pattern_emblem4_df"
	self.textures.emblem4.value = 2
	self.textures.daft_heart = {}
	self.textures.daft_heart.name_id = "bm_txt_daft_heart"
	self.textures.daft_heart.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.daft_heart.texture = "units/payday2/masks/shared_textures/patterns/pattern_daft_heart_df"
	self.textures.daft_heart.value = 3
	self.textures.anarchy = {}
	self.textures.anarchy.name_id = "bm_txt_anarchy"
	self.textures.anarchy.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.anarchy.texture = "units/payday2/masks/shared_textures/patterns/pattern_anarchy_df"
	self.textures.anarchy.value = 4
	self.textures.molecule = {}
	self.textures.molecule.name_id = "bm_txt_molecule"
	self.textures.molecule.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.molecule.texture = "units/payday2/masks/shared_textures/patterns/pattern_molecule_df"
	self.textures.molecule.value = 3
	self.textures.fleur2 = {}
	self.textures.fleur2.name_id = "bm_txt_fleur2"
	self.textures.fleur2.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fleur2.texture = "units/payday2/masks/shared_textures/patterns/pattern_fleur2_df"
	self.textures.fleur2.infamous = true
	self.textures.fleur2.value = 3
	self.textures.trekronor = {}
	self.textures.trekronor.name_id = "bm_txt_trekronor"
	self.textures.trekronor.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.trekronor.texture = "units/payday2/masks/shared_textures/patterns/pattern_trekronor_df"
	self.textures.trekronor.value = 2
	self.textures.raster = {}
	self.textures.raster.name_id = "bm_txt_raster"
	self.textures.raster.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.raster.texture = "units/payday2/masks/shared_textures/patterns/pattern_raster_df"
	self.textures.raster.value = 1
	self.textures.flag = {}
	self.textures.flag.name_id = "bm_txt_flag"
	self.textures.flag.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.flag.texture = "units/payday2/masks/shared_textures/patterns/pattern_flag_df"
	self.textures.flag.value = 4
	self.textures.cracker = {}
	self.textures.cracker.name_id = "bm_txt_cracker"
	self.textures.cracker.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.cracker.texture = "units/payday2/masks/shared_textures/patterns/pattern_cracker_df"
	self.textures.cracker.value = 4
	self.textures.hellish = {}
	self.textures.hellish.name_id = "bm_txt_hellish"
	self.textures.hellish.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hellish.texture = "units/payday2/masks/shared_textures/patterns/pattern_hellish_df"
	self.textures.hellish.value = 4
	self.textures.poison = {}
	self.textures.poison.name_id = "bm_txt_poison"
	self.textures.poison.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.poison.texture = "units/payday2/masks/shared_textures/patterns/pattern_poison_df"
	self.textures.poison.value = 4
	self.textures.yggdrasil = {}
	self.textures.yggdrasil.name_id = "bm_txt_yggdrasil"
	self.textures.yggdrasil.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.yggdrasil.texture = "units/payday2/masks/shared_textures/patterns/pattern_yggdrasil_df"
	self.textures.yggdrasil.value = 4
	self.textures.pumpgrin = {}
	self.textures.pumpgrin.name_id = "bm_txt_pumpgrin"
	if is_nextgen_console then
		self.textures.pumpgrin.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.pumpgrin.weight = 3
	end
	self.textures.pumpgrin.texture = "units/payday2/masks/shared_textures/patterns/pattern_pumpgrin_df"
	self.textures.pumpgrin.global_value = "halloween"
	self.textures.pumpgrin.value = 5
	self.textures.shout = {}
	self.textures.shout.name_id = "bm_txt_shout"
	if is_nextgen_console then
		self.textures.shout.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.shout.weight = 3
	end
	self.textures.shout.texture = "units/payday2/masks/shared_textures/patterns/pattern_shout_df"
	self.textures.shout.global_value = "halloween"
	self.textures.shout.value = 5
	self.textures.webbed = {}
	self.textures.webbed.name_id = "bm_txt_webbed"
	if is_nextgen_console then
		self.textures.webbed.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.webbed.weight = 3
	end
	self.textures.webbed.texture = "units/payday2/masks/shared_textures/patterns/pattern_webbed_df"
	self.textures.webbed.global_value = "halloween"
	self.textures.webbed.value = 5
	self.textures.hannibalistic = {}
	self.textures.hannibalistic.name_id = "bm_txt_hannibalistic"
	if is_nextgen_console then
		self.textures.hannibalistic.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.hannibalistic.weight = 3
	end
	self.textures.hannibalistic.texture = "units/payday2/masks/shared_textures/patterns/pattern_hannibalistic_df"
	self.textures.hannibalistic.global_value = "halloween"
	self.textures.hannibalistic.value = 5
	self.textures.stitches = {}
	self.textures.stitches.name_id = "bm_txt_stitches"
	if is_nextgen_console then
		self.textures.stitches.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.stitches.weight = 3
	end
	self.textures.stitches.texture = "units/payday2/masks/shared_textures/patterns/pattern_stitches_df"
	self.textures.stitches.global_value = "halloween"
	self.textures.stitches.value = 4
	self.textures.doomweaver = {}
	self.textures.doomweaver.name_id = "bm_txt_doomweaver"
	if is_nextgen_console then
		self.textures.doomweaver.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.textures.doomweaver.weight = 3
	end
	self.textures.doomweaver.texture = "units/payday2/masks/shared_textures/patterns/pattern_doomweaver_df"
	self.textures.doomweaver.global_value = "halloween"
	self.textures.doomweaver.value = 4
	self.textures.racestripes = {}
	self.textures.racestripes.name_id = "bm_txt_racestripes"
	self.textures.racestripes.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.racestripes.texture = "units/pd2_dlc1/masks/patterns/pattern_racestripes_df"
	self.textures.racestripes.value = 4
	self.textures.racestripes.dlc = "armored_transport"
	self.textures.americaneagle = {}
	self.textures.americaneagle.name_id = "bm_txt_americaneagle"
	self.textures.americaneagle.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.americaneagle.texture = "units/pd2_dlc1/masks/patterns/pattern_americaneagle_df"
	self.textures.americaneagle.value = 4
	self.textures.americaneagle.dlc = "armored_transport"
	self.textures.stars = {}
	self.textures.stars.name_id = "bm_txt_stars"
	self.textures.stars.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.stars.texture = "units/pd2_dlc1/masks/patterns/pattern_stars_df"
	self.textures.stars.value = 4
	self.textures.stars.dlc = "armored_transport"
	self.textures.forestcamo = {}
	self.textures.forestcamo.name_id = "bm_txt_forestcamo"
	self.textures.forestcamo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.forestcamo.texture = "units/pd2_dlc1/masks/patterns/pattern_forestcamo_df"
	self.textures.forestcamo.value = 4
	self.textures.forestcamo.dlc = "armored_transport"
	self.textures.army = {}
	self.textures.army.name_id = "bm_txt_army"
	self.textures.army.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.army.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_army_df"
	self.textures.army.value = 4
	self.textures.army.dlc = "gage_pack"
	self.textures.commando = {}
	self.textures.commando.name_id = "bm_txt_commando"
	self.textures.commando.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.commando.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_commando_df"
	self.textures.commando.value = 4
	self.textures.commando.dlc = "gage_pack"
	self.textures.hunter = {}
	self.textures.hunter.name_id = "bm_txt_hunter"
	self.textures.hunter.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.hunter.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_hunter_df"
	self.textures.hunter.value = 4
	self.textures.hunter.dlc = "gage_pack"
	self.textures.digitalcamo = {}
	self.textures.digitalcamo.name_id = "bm_txt_digitalcamo"
	self.textures.digitalcamo.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.digitalcamo.texture = "units/pd2_dlc_dec5/masks/patterns/pattern_digitalcamo_df"
	self.textures.digitalcamo.value = 4
	self.textures.digitalcamo.dlc = "gage_pack"
	self.textures.ribcage = {}
	self.textures.ribcage.name_id = "bm_txt_ribcage"
	self.textures.ribcage.pcs = {}
	self.textures.ribcage.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_ribcage_df"
	self.textures.ribcage.value = 0
	self.textures.ribcage.global_value = "infamy"
	self.textures.ribcage.infamy_lock = "infamy_ghost"
	self.textures.toto = {}
	self.textures.toto.name_id = "bm_txt_toto"
	self.textures.toto.pcs = {}
	self.textures.toto.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_toto_df"
	self.textures.toto.value = 0
	self.textures.toto.global_value = "infamy"
	self.textures.toto.infamy_lock = "infamy_technician"
	self.textures.imperial = {}
	self.textures.imperial.name_id = "bm_txt_imperial"
	self.textures.imperial.pcs = {}
	self.textures.imperial.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_imperial_df"
	self.textures.imperial.value = 0
	self.textures.imperial.global_value = "infamy"
	self.textures.imperial.infamy_lock = "infamy_mastermind"
	self.textures.fatman = {}
	self.textures.fatman.name_id = "bm_txt_fatman"
	self.textures.fatman.pcs = {}
	self.textures.fatman.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_fatman_df"
	self.textures.fatman.value = 0
	self.textures.fatman.global_value = "infamy"
	self.textures.fatman.infamy_lock = "infamy_enforcer"
	self.textures.digital = {}
	self.textures.digital.name_id = "bm_txt_digital"
	self.textures.digital.pcs = {}
	self.textures.digital.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_digital_df"
	self.textures.digital.value = 0
	self.textures.digital.global_value = "infamy"
	self.textures.digital.infamy_lock = "infamy_maskpack_daft"
	self.textures.evileye = {}
	self.textures.evileye.name_id = "bm_txt_evileye"
	self.textures.evileye.pcs = {}
	self.textures.evileye.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_evileye_df"
	self.textures.evileye.value = 0
	self.textures.evileye.global_value = "infamy"
	self.textures.evileye.infamy_lock = "infamy_maskpack_hood"
	self.textures.exmachina = {}
	self.textures.exmachina.name_id = "bm_txt_exmachina"
	self.textures.exmachina.pcs = {}
	self.textures.exmachina.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_exmachina_df"
	self.textures.exmachina.value = 0
	self.textures.exmachina.global_value = "infamy"
	self.textures.exmachina.infamy_lock = "infamy_maskpack_destroyer"
	self.textures.hellsanchor = {}
	self.textures.hellsanchor.name_id = "bm_txt_hellsanchor"
	self.textures.hellsanchor.pcs = {}
	self.textures.hellsanchor.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_hellsanchor_df"
	self.textures.hellsanchor.value = 0
	self.textures.hellsanchor.global_value = "infamy"
	self.textures.hellsanchor.infamy_lock = "infamy_maskpack_lurker"
	self.textures.monstervisor = {}
	self.textures.monstervisor.name_id = "bm_txt_monstervisor"
	self.textures.monstervisor.pcs = {}
	self.textures.monstervisor.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_monstervisor_df"
	self.textures.monstervisor.value = 0
	self.textures.monstervisor.global_value = "infamy"
	self.textures.monstervisor.infamy_lock = "infamy_maskpack_ranger"
	self.textures.pain = {}
	self.textures.pain.name_id = "bm_txt_pain"
	self.textures.pain.pcs = {}
	self.textures.pain.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_pain_df"
	self.textures.pain.value = 0
	self.textures.pain.global_value = "infamy"
	self.textures.pain.infamy_lock = "infamy_maskpack_balaclava"
	self.textures.spook = {}
	self.textures.spook.name_id = "bm_txt_spook"
	self.textures.spook.pcs = {}
	self.textures.spook.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_spook_df"
	self.textures.spook.value = 0
	self.textures.spook.global_value = "infamy"
	self.textures.spook.infamy_lock = "infamy_maskpack_pain"
	self.textures.steampunk = {}
	self.textures.steampunk.name_id = "bm_txt_steampunk"
	self.textures.steampunk.pcs = {}
	self.textures.steampunk.texture = "units/pd2_dlc_infamy/masks/patterns/pattern_steampunk_df"
	self.textures.steampunk.value = 0
	self.textures.steampunk.global_value = "infamy"
	self.textures.steampunk.infamy_lock = "infamy_maskpack_punk"
	self.textures.styx = {}
	self.textures.styx.name_id = "bm_txt_styx"
	self.textures.styx.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.styx.texture = "units/pd2_dlc_gage_lmg/masks/patterns/styx_df"
	self.textures.styx.value = 4
	self.textures.styx.dlc = "gage_pack_lmg"
	self.textures.fingerpaint = {}
	self.textures.fingerpaint.name_id = "bm_txt_fingerpaint"
	self.textures.fingerpaint.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fingerpaint.texture = "units/pd2_dlc_gage_lmg/masks/patterns/fingerpaint_df"
	self.textures.fingerpaint.value = 4
	self.textures.fingerpaint.dlc = "gage_pack_lmg"
	self.textures.fighter = {}
	self.textures.fighter.name_id = "bm_txt_fighter"
	self.textures.fighter.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.fighter.texture = "units/pd2_dlc_gage_lmg/masks/patterns/fighter_df"
	self.textures.fighter.value = 4
	self.textures.fighter.dlc = "gage_pack_lmg"
	self.textures.warrior = {}
	self.textures.warrior.name_id = "bm_txt_warrior"
	self.textures.warrior.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.warrior.texture = "units/pd2_dlc_gage_lmg/masks/patterns/warrior_df"
	self.textures.warrior.value = 4
	self.textures.warrior.dlc = "gage_pack_lmg"
	self.textures.bugger = {}
	self.textures.bugger.name_id = "bm_txt_bugger"
	self.textures.bugger.pcs = {}
	self.textures.bugger.texture = "units/pd2_dlc_gage_snp/patterns/pattern_bugger_df"
	self.textures.bugger.value = 0
	self.textures.bugger.dlc = "gage_pack_snp"
	self.textures.spidereyes = {}
	self.textures.spidereyes.name_id = "bm_txt_spidereyes"
	self.textures.spidereyes.pcs = {}
	self.textures.spidereyes.texture = "units/pd2_dlc_gage_snp/patterns/pattern_spidereyes_df"
	self.textures.spidereyes.value = 0
	self.textures.spidereyes.dlc = "gage_pack_snp"
	self.textures.venomous = {}
	self.textures.venomous.name_id = "bm_txt_venomous"
	self.textures.venomous.pcs = {}
	self.textures.venomous.texture = "units/pd2_dlc_gage_snp/patterns/pattern_venomous_df"
	self.textures.venomous.value = 0
	self.textures.venomous.dlc = "gage_pack_snp"
	self.textures.wingsofdeath = {}
	self.textures.wingsofdeath.name_id = "bm_txt_wingsofdeath"
	self.textures.wingsofdeath.pcs = {}
	self.textures.wingsofdeath.texture = "units/pd2_dlc_gage_snp/patterns/pattern_wingsofdeath_df"
	self.textures.wingsofdeath.value = 0
	self.textures.wingsofdeath.dlc = "gage_pack_snp"
	self.textures.deathcube = {}
	self.textures.deathcube.name_id = "bm_txt_deathcube"
	self.textures.deathcube.pcs = {}
	self.textures.deathcube.texture = "units/pd2_poetry_winners/patterns/pattern_deathcube_df"
	self.textures.deathcube.value = 0
	self.textures.deathcube.dlc = "poetry_soundtrack"
	self.textures.deathcube.global_value = "poetry_soundtrack"
	self.textures.tcn = {}
	self.textures.tcn.name_id = "bm_txt_tcn"
	self.textures.tcn.pcs = {}
	self.textures.tcn.texture = "units/pd2_poetry_winners/patterns/pattern_tcn_df"
	self.textures.tcn.value = 0
	self.textures.tcn.dlc = "poetry_soundtrack"
	self.textures.tcn.global_value = "poetry_soundtrack"
	self.textures.tribalstroke = {}
	self.textures.tribalstroke.name_id = "bm_txt_tribalstroke"
	self.textures.tribalstroke.pcs = {}
	self.textures.tribalstroke.texture = "units/pd2_poetry_winners/patterns/pattern_tribalstroke_df"
	self.textures.tribalstroke.value = 0
	self.textures.tribalstroke.dlc = "poetry_soundtrack"
	self.textures.tribalstroke.global_value = "poetry_soundtrack"
	self.textures.kraken = {}
	self.textures.kraken.name_id = "bm_txt_kraken"
	self.textures.kraken.pcs = {}
	self.textures.kraken.texture = "units/pd2_poetry_winners/patterns/pattern_kraken_df"
	self.textures.kraken.value = 0
	self.textures.kraken.dlc = "poetry_soundtrack"
	self.textures.kraken.global_value = "poetry_soundtrack"
	self.textures.roman = {}
	self.textures.roman.name_id = "bm_txt_roman"
	self.textures.roman.pcs = {}
	self.textures.roman.texture = "units/pd2_dlc_big/masks/patterns/pattern_roman_df"
	self.textures.roman.value = 0
	self.textures.roman.dlc = "big_bank"
	self.textures.wargod = {}
	self.textures.wargod.name_id = "bm_txt_wargod"
	self.textures.wargod.pcs = {}
	self.textures.wargod.texture = "units/pd2_dlc_big/masks/patterns/pattern_wargod_df"
	self.textures.wargod.value = 0
	self.textures.wargod.dlc = "big_bank"
	self.textures.spartan = {}
	self.textures.spartan.name_id = "bm_txt_spartan"
	self.textures.spartan.pcs = {}
	self.textures.spartan.texture = "units/pd2_dlc_big/masks/patterns/pattern_spartan_df"
	self.textures.spartan.value = 0
	self.textures.spartan.dlc = "big_bank"
	self.textures.ruler = {}
	self.textures.ruler.name_id = "bm_txt_ruler"
	self.textures.ruler.pcs = {
		10,
		20,
		30,
		40
	}
	self.textures.ruler.texture = "units/pd2_dlc_big/masks/patterns/pattern_ruler_df"
	self.textures.ruler.value = 0
	self.textures.ruler.dlc = "big_bank"
	self.textures.banana = {}
	self.textures.banana.name_id = "bm_txt_banana"
	self.textures.banana.pcs = {}
	self.textures.banana.texture = "units/pd2_dlc_gage_shot/patterns/pattern_banana_df"
	self.textures.banana.value = 0
	self.textures.banana.dlc = "gage_pack_shotgun"
	self.textures.chief = {}
	self.textures.chief.name_id = "bm_txt_chief"
	self.textures.chief.pcs = {}
	self.textures.chief.texture = "units/pd2_dlc_gage_shot/patterns/pattern_chief_df"
	self.textures.chief.value = 0
	self.textures.chief.dlc = "gage_pack_shotgun"
	self.textures.monkeyskull = {}
	self.textures.monkeyskull.name_id = "bm_txt_monkeyskull"
	self.textures.monkeyskull.pcs = {}
	self.textures.monkeyskull.texture = "units/pd2_dlc_gage_shot/patterns/pattern_monkeyskull_df"
	self.textures.monkeyskull.value = 0
	self.textures.monkeyskull.dlc = "gage_pack_shotgun"
	self.textures.terror = {}
	self.textures.terror.name_id = "bm_txt_terror"
	self.textures.terror.pcs = {}
	self.textures.terror.texture = "units/pd2_dlc_gage_shot/patterns/pattern_terror_df"
	self.textures.terror.value = 0
	self.textures.terror.dlc = "gage_pack_shotgun"
	self.textures.muerte = {}
	self.textures.muerte.name_id = "bm_txt_muerte"
	self.textures.muerte.pcs = {}
	self.textures.muerte.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_muerte_df"
	self.textures.muerte.value = 0
	self.textures.muerte.dlc = "gage_pack_assault"
	self.textures.emperor = {}
	self.textures.emperor.name_id = "bm_txt_emperor"
	self.textures.emperor.pcs = {}
	self.textures.emperor.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_emperor_df"
	self.textures.emperor.value = 0
	self.textures.emperor.dlc = "gage_pack_assault"
	self.textures.vicious = {}
	self.textures.vicious.name_id = "bm_txt_vicious"
	self.textures.vicious.pcs = {}
	self.textures.vicious.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_vicious_df"
	self.textures.vicious.value = 0
	self.textures.vicious.dlc = "gage_pack_assault"
	self.textures.death = {}
	self.textures.death.name_id = "bm_txt_death"
	self.textures.death.pcs = {}
	self.textures.death.texture = "units/pd2_dlc_gage_assault/masks/patterns/pattern_death_df"
	self.textures.death.value = 0
	self.textures.death.dlc = "gage_pack_assault"
	self.textures.doodles = {}
	self.textures.doodles.name_id = "bm_txt_doodles"
	self.textures.doodles.pcs = {}
	self.textures.doodles.texture = "units/pd2_dlc_miami/masks/patterns/pattern_doodles_df"
	self.textures.doodles.value = 0
	self.textures.doodles.dlc = "hl_miami"
	self.textures.doodles.texture_bundle_folder = "hl_miami"
	self.textures.hiptobepolygon = {}
	self.textures.hiptobepolygon.name_id = "bm_txt_hiptobepolygon"
	self.textures.hiptobepolygon.pcs = {}
	self.textures.hiptobepolygon.texture = "units/pd2_dlc_miami/masks/patterns/pattern_hiptobepolygon_df"
	self.textures.hiptobepolygon.value = 0
	self.textures.hiptobepolygon.dlc = "hl_miami"
	self.textures.hiptobepolygon.texture_bundle_folder = "hl_miami"
	self.textures.palmtrees = {}
	self.textures.palmtrees.name_id = "bm_txt_palmtrees"
	self.textures.palmtrees.pcs = {}
	self.textures.palmtrees.texture = "units/pd2_dlc_miami/masks/patterns/pattern_palmtrees_df"
	self.textures.palmtrees.value = 0
	self.textures.palmtrees.dlc = "hl_miami"
	self.textures.palmtrees.texture_bundle_folder = "hl_miami"
	self.textures.bsomebody = {}
	self.textures.bsomebody.name_id = "bm_txt_bsomebody"
	self.textures.bsomebody.pcs = {}
	self.textures.bsomebody.texture = "units/pd2_dlc_miami/masks/patterns/pattern_bsomebody_df"
	self.textures.bsomebody.value = 0
	self.textures.bsomebody.dlc = "hl_miami"
	self.textures.bsomebody.texture_bundle_folder = "hl_miami"
	self.textures.hotline = {}
	self.textures.hotline.name_id = "bm_txt_hotline"
	self.textures.hotline.pcs = {}
	self.textures.hotline.texture = "units/pd2_dlc_miami/masks/patterns/pattern_hotline_df"
	self.textures.hotline.value = 0
	self.textures.hotline.dlc = "hlm_game"
	self.textures.hotline.texture_bundle_folder = "hl_miami"
	self.textures.leopard = {}
	self.textures.leopard.name_id = "bm_txt_leopard"
	self.textures.leopard.pcs = {}
	self.textures.leopard.texture = "units/pd2_dlc_miami/masks/patterns/pattern_leopard_df"
	self.textures.leopard.value = 0
	self.textures.leopard.dlc = "hlm_game"
	self.textures.leopard.texture_bundle_folder = "hl_miami"
	self.textures.shutupandbleed = {}
	self.textures.shutupandbleed.name_id = "bm_txt_shutupandbleed"
	self.textures.shutupandbleed.pcs = {}
	self.textures.shutupandbleed.texture = "units/pd2_dlc_miami/masks/patterns/pattern_shutupandbleed_df"
	self.textures.shutupandbleed.value = 0
	self.textures.shutupandbleed.dlc = "hlm_game"
	self.textures.shutupandbleed.texture_bundle_folder = "hl_miami"
	self.textures.uglyrug = {}
	self.textures.uglyrug.name_id = "bm_txt_uglyrug"
	self.textures.uglyrug.pcs = {}
	self.textures.uglyrug.texture = "units/pd2_dlc_miami/masks/patterns/pattern_uglyrug_df"
	self.textures.uglyrug.value = 0
	self.textures.uglyrug.dlc = "hlm_game"
	self.textures.uglyrug.texture_bundle_folder = "hl_miami"
	self.textures.captainwar = {}
	self.textures.captainwar.name_id = "bm_txt_captainwar"
	self.textures.captainwar.pcs = {}
	self.textures.captainwar.texture = "units/pd2_dlc_gage_historical/patterns/pattern_captainwar_df"
	self.textures.captainwar.value = 0
	self.textures.captainwar.dlc = "gage_pack_historical"
	self.textures.dazzle = {}
	self.textures.dazzle.name_id = "bm_txt_dazzle"
	self.textures.dazzle.pcs = {}
	self.textures.dazzle.texture = "units/pd2_dlc_gage_historical/patterns/pattern_dazzle_df"
	self.textures.dazzle.value = 0
	self.textures.dazzle.dlc = "gage_pack_historical"
	self.textures.deathdealer = {}
	self.textures.deathdealer.name_id = "bm_txt_deathdealer"
	self.textures.deathdealer.pcs = {}
	self.textures.deathdealer.texture = "units/pd2_dlc_gage_historical/patterns/pattern_deathdealer_df"
	self.textures.deathdealer.value = 0
	self.textures.deathdealer.dlc = "gage_pack_historical"
	self.textures.filthythirteen = {}
	self.textures.filthythirteen.name_id = "bm_txt_filthythirteen"
	self.textures.filthythirteen.pcs = {}
	self.textures.filthythirteen.texture = "units/pd2_dlc_gage_historical/patterns/pattern_filthythirteen_df"
	self.textures.filthythirteen.value = 0
	self.textures.filthythirteen.dlc = "gage_pack_historical"
	self.textures.hawkhelm = {}
	self.textures.hawkhelm.name_id = "bm_txt_hawkhelm"
	self.textures.hawkhelm.pcs = {}
	self.textures.hawkhelm.texture = "units/pd2_indiana/patterns/pattern_hawkhelm_df"
	self.textures.hawkhelm.value = 0
	self.textures.hawkhelm.dlc = "hope_diamond"
	self.textures.hieroglyphs = {}
	self.textures.hieroglyphs.name_id = "bm_txt_hieroglyphs"
	self.textures.hieroglyphs.pcs = {}
	self.textures.hieroglyphs.texture = "units/pd2_indiana/patterns/pattern_hieroglyphs_df"
	self.textures.hieroglyphs.value = 0
	self.textures.hieroglyphs.dlc = "hope_diamond"
	self.textures.horus = {}
	self.textures.horus.name_id = "bm_txt_horus"
	self.textures.horus.pcs = {}
	self.textures.horus.texture = "units/pd2_indiana/patterns/pattern_horus_df"
	self.textures.horus.value = 0
	self.textures.horus.dlc = "hope_diamond"
	self.textures.runes = {}
	self.textures.runes.name_id = "bm_txt_runes"
	self.textures.runes.pcs = {}
	self.textures.runes.texture = "units/pd2_indiana/patterns/pattern_runes_df"
	self.textures.runes.value = 0
	self.textures.runes.dlc = "hope_diamond"
	self.textures.cro_pattern_1 = {}
	self.textures.cro_pattern_1.name_id = "bm_txt_caduceus"
	self.textures.cro_pattern_1.pcs = {}
	self.textures.cro_pattern_1.texture = "units/pd2_dlc_cro/masks/patterns/caduceus"
	self.textures.cro_pattern_1.value = 0
	self.textures.cro_pattern_1.dlc = "the_bomb"
	self.textures.cro_pattern_1.texture_bundle_folder = "the_bomb"
	self.textures.cro_pattern_2 = {}
	self.textures.cro_pattern_2.name_id = "bm_txt_checkerboard"
	self.textures.cro_pattern_2.pcs = {}
	self.textures.cro_pattern_2.texture = "units/pd2_dlc_cro/masks/patterns/checkerboard"
	self.textures.cro_pattern_2.value = 0
	self.textures.cro_pattern_2.dlc = "the_bomb"
	self.textures.cro_pattern_2.texture_bundle_folder = "the_bomb"
	self.textures.cro_pattern_3 = {}
	self.textures.cro_pattern_3.name_id = "bm_txt_liongamelion"
	self.textures.cro_pattern_3.pcs = {}
	self.textures.cro_pattern_3.texture = "units/pd2_dlc_cro/masks/patterns/liongamelion"
	self.textures.cro_pattern_3.value = 0
	self.textures.cro_pattern_3.dlc = "the_bomb"
	self.textures.cro_pattern_3.texture_bundle_folder = "the_bomb"
	self.textures.cro_pattern_4 = {}
	self.textures.cro_pattern_4.name_id = "bm_txt_pleter"
	self.textures.cro_pattern_4.pcs = {}
	self.textures.cro_pattern_4.texture = "units/pd2_dlc_cro/masks/patterns/pleter"
	self.textures.cro_pattern_4.value = 0
	self.textures.cro_pattern_4.dlc = "the_bomb"
	self.textures.cro_pattern_4.texture_bundle_folder = "the_bomb"
	self.textures.dinoskull = {}
	self.textures.dinoskull.name_id = "bm_txt_dinoskull"
	self.textures.dinoskull.pcs = {}
	self.textures.dinoskull.texture = "units/pd2_dlc_akm4_modpack/patterns/pattern_dinoskull_df"
	self.textures.dinoskull.value = 0
	self.textures.dinoskull.texture_bundle_folder = "dlc_akm4"
	self.textures.dinoskull.dlc = "akm4_pack"
	self.textures.dinostripes = {}
	self.textures.dinostripes.name_id = "bm_txt_dinostripes"
	self.textures.dinostripes.pcs = {}
	self.textures.dinostripes.texture = "units/pd2_dlc_akm4_modpack/patterns/pattern_dinostripes_df"
	self.textures.dinostripes.value = 0
	self.textures.dinostripes.texture_bundle_folder = "dlc_akm4"
	self.textures.dinostripes.dlc = "akm4_pack"
	self.textures.predator = {}
	self.textures.predator.name_id = "bm_txt_predator"
	self.textures.predator.pcs = {}
	self.textures.predator.texture = "units/pd2_dlc_akm4_modpack/patterns/pattern_predator_df"
	self.textures.predator.value = 0
	self.textures.predator.texture_bundle_folder = "dlc_akm4"
	self.textures.predator.dlc = "akm4_pack"
	self.textures.dinoscars = {}
	self.textures.dinoscars.name_id = "bm_txt_dinoscars"
	self.textures.dinoscars.pcs = {}
	self.textures.dinoscars.texture = "units/pd2_dlc_akm4_modpack/patterns/pattern_scars_df"
	self.textures.dinoscars.value = 0
	self.textures.dinoscars.texture_bundle_folder = "dlc_akm4"
	self.textures.dinoscars.dlc = "akm4_pack"
	self.textures.fireborn = {}
	self.textures.fireborn.name_id = "bm_txt_fireborn"
	self.textures.fireborn.pcs = {}
	self.textures.fireborn.texture = "units/pd2_dlc_bbq/masks/patterns/pattern_fireborn_df"
	self.textures.fireborn.value = 0
	self.textures.fireborn.dlc = "bbq"
	self.textures.fireborn.texture_bundle_folder = "bbq"
	self.textures.flamer = {}
	self.textures.flamer.name_id = "bm_txt_flamer"
	self.textures.flamer.pcs = {}
	self.textures.flamer.texture = "units/pd2_dlc_bbq/masks/patterns/pattern_flamer_df"
	self.textures.flamer.value = 0
	self.textures.flamer.dlc = "bbq"
	self.textures.flamer.texture_bundle_folder = "bbq"
	self.textures.flammable = {}
	self.textures.flammable.name_id = "bm_txt_flammable"
	self.textures.flammable.pcs = {}
	self.textures.flammable.texture = "units/pd2_dlc_bbq/masks/patterns/pattern_flammable_df"
	self.textures.flammable.value = 0
	self.textures.flammable.dlc = "bbq"
	self.textures.flammable.texture_bundle_folder = "bbq"
	self.textures.hotflames = {}
	self.textures.hotflames.name_id = "bm_txt_hotflames"
	self.textures.hotflames.pcs = {}
	self.textures.hotflames.texture = "units/pd2_dlc_bbq/masks/patterns/pattern_hotflames_df"
	self.textures.hotflames.value = 0
	self.textures.hotflames.dlc = "bbq"
	self.textures.hotflames.texture_bundle_folder = "bbq"
	self.textures.coyote = {}
	self.textures.coyote.name_id = "bm_txt_coyote"
	self.textures.coyote.pcs = {}
	self.textures.coyote.texture = "units/pd2_dlc_west/masks/patterns/pattern_coyote_df"
	self.textures.coyote.dlc = "west"
	self.textures.coyote.value = 0
	self.textures.native = {}
	self.textures.native.name_id = "bm_txt_native"
	self.textures.native.pcs = {}
	self.textures.native.texture = "units/pd2_dlc_west/masks/patterns/pattern_native_df"
	self.textures.native.dlc = "west"
	self.textures.native.value = 0
	self.textures.pattern = {}
	self.textures.pattern.name_id = "bm_txt_pattern"
	self.textures.pattern.pcs = {}
	self.textures.pattern.texture = "units/pd2_dlc_west/masks/patterns/pattern_pattern_df"
	self.textures.pattern.dlc = "west"
	self.textures.pattern.value = 0
	self.textures.totem = {}
	self.textures.totem.name_id = "bm_txt_totem"
	self.textures.totem.pcs = {}
	self.textures.totem.texture = "units/pd2_dlc_west/masks/patterns/pattern_totem_df"
	self.textures.totem.dlc = "west"
	self.textures.totem.value = 0
	self.textures.soundwave = {}
	self.textures.soundwave.name_id = "bm_txt_soundwave"
	self.textures.soundwave.pcs = {}
	self.textures.soundwave.texture = "units/pd2_dlc_arena/masks/patterns/pattern_soundwave_df"
	self.textures.soundwave.dlc = "arena"
	self.textures.soundwave.value = 0
	self.textures.circle_raster = {}
	self.textures.circle_raster.name_id = "bm_txt_circle_raster"
	self.textures.circle_raster.pcs = {}
	self.textures.circle_raster.texture = "units/pd2_dlc_arena/masks/patterns/pattern_circle_raster_df"
	self.textures.circle_raster.dlc = "arena"
	self.textures.circle_raster.value = 0
	self.textures.arena_logo = {}
	self.textures.arena_logo.name_id = "bm_txt_arena_logo"
	self.textures.arena_logo.pcs = {}
	self.textures.arena_logo.texture = "units/pd2_dlc_arena/masks/patterns/pattern_arena_logo_df"
	self.textures.arena_logo.dlc = "arena"
	self.textures.arena_logo.value = 0
	self.textures.smoke = {}
	self.textures.smoke.name_id = "bm_txt_smoke"
	self.textures.smoke.pcs = {}
	self.textures.smoke.texture = "units/pd2_dlc_arena/masks/patterns/pattern_smoke_df"
	self.textures.smoke.dlc = "arena"
	self.textures.smoke.value = 0
	self.textures.dices = {}
	self.textures.dices.name_id = "bm_txt_dices"
	self.textures.dices.pcs = {}
	self.textures.dices.texture = "units/pd2_dlc_casino/masks/patterns/pattern_dices_df"
	self.textures.dices.value = 0
	self.textures.dices.dlc = "kenaz"
	self.textures.dices.texture_bundle_folder = "kenaz"
	self.textures.royale = {}
	self.textures.royale.name_id = "bm_txt_royale"
	self.textures.royale.pcs = {}
	self.textures.royale.texture = "units/pd2_dlc_casino/masks/patterns/pattern_royale_df"
	self.textures.royale.value = 0
	self.textures.royale.dlc = "kenaz"
	self.textures.royale.texture_bundle_folder = "kenaz"
	self.textures.cards = {}
	self.textures.cards.name_id = "bm_txt_cards"
	self.textures.cards.pcs = {}
	self.textures.cards.texture = "units/pd2_dlc_casino/masks/patterns/pattern_cards_df"
	self.textures.cards.value = 0
	self.textures.cards.dlc = "kenaz"
	self.textures.cards.texture_bundle_folder = "kenaz"
	self.textures.chips = {}
	self.textures.chips.name_id = "bm_txt_chips"
	self.textures.chips.pcs = {}
	self.textures.chips.texture = "units/pd2_dlc_casino/masks/patterns/pattern_chips_df"
	self.textures.chips.value = 0
	self.textures.chips.dlc = "kenaz"
	self.textures.chips.texture_bundle_folder = "kenaz"
	self.textures.starvr = {}
	self.textures.starvr.name_id = "bm_txt_starvr"
	self.textures.starvr.pcs = {}
	self.textures.starvr.texture = "units/pd2_dlc_humble_summer15/masks/patterns/pattern_starvr_df"
	self.textures.starvr.value = 0
	self.textures.starvr.infamous = true
	self.textures.youkai = {}
	self.textures.youkai.name_id = "bm_txt_youkai"
	self.textures.youkai.pcs = {}
	self.textures.youkai.texture = "units/pd2_dlc_turtles/masks/patterns/pattern_youkai_df"
	self.textures.youkai.value = 0
	self.textures.youkai.dlc = "turtles"
	self.textures.youkai.texture_bundle_folder = "turtles"
	self.textures.origami = {}
	self.textures.origami.name_id = "bm_txt_origami"
	self.textures.origami.pcs = {}
	self.textures.origami.texture = "units/pd2_dlc_turtles/masks/patterns/pattern_origami_df"
	self.textures.origami.value = 0
	self.textures.origami.dlc = "turtles"
	self.textures.origami.texture_bundle_folder = "turtles"
	self.textures.oni = {}
	self.textures.oni.name_id = "bm_txt_oni"
	self.textures.oni.pcs = {}
	self.textures.oni.texture = "units/pd2_dlc_turtles/masks/patterns/pattern_oni_df"
	self.textures.oni.value = 0
	self.textures.oni.dlc = "turtles"
	self.textures.oni.texture_bundle_folder = "turtles"
	self.textures.koi = {}
	self.textures.koi.name_id = "bm_txt_koi"
	self.textures.koi.pcs = {}
	self.textures.koi.texture = "units/pd2_dlc_turtles/masks/patterns/pattern_koi_df"
	self.textures.koi.value = 0
	self.textures.koi.dlc = "turtles"
	self.textures.koi.texture_bundle_folder = "turtles"
	self.textures.agatha = {}
	self.textures.agatha.name_id = "bm_txt_agatha"
	self.textures.agatha.pcs = {}
	self.textures.agatha.texture = "units/pd2_dlc_steel/masks/patterns/pattern_agatha_df"
	self.textures.agatha.value = 0
	self.textures.agatha.dlc = "steel"
	self.textures.checkered_out = {}
	self.textures.checkered_out.name_id = "bm_txt_checkered_out"
	self.textures.checkered_out.pcs = {}
	self.textures.checkered_out.texture = "units/pd2_dlc_steel/masks/patterns/pattern_checkered_out_df"
	self.textures.checkered_out.value = 0
	self.textures.checkered_out.dlc = "steel"
	self.textures.mason = {}
	self.textures.mason.name_id = "bm_txt_mason"
	self.textures.mason.pcs = {}
	self.textures.mason.texture = "units/pd2_dlc_steel/masks/patterns/pattern_mason_df"
	self.textures.mason.value = 0
	self.textures.mason.dlc = "steel"
	self.textures.med_pat = {}
	self.textures.med_pat.name_id = "bm_txt_med_pat"
	self.textures.med_pat.pcs = {}
	self.textures.med_pat.texture = "units/pd2_dlc_steel/masks/patterns/pattern_med_patt_df"
	self.textures.med_pat.value = 0
	self.textures.med_pat.dlc = "steel"
end
