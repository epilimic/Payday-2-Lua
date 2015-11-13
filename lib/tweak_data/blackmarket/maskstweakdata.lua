local is_nextgen_console = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1")
function BlackMarketTweakData:_init_masks()
	self.masks = {}
	self.masks.character_locked = {}
	self.masks.character_locked.name_id = "bm_msk_character_locked"
	self.masks.character_locked.inaccessible = true
	self.masks.character_locked.dallas = "dallas"
	self.masks.character_locked.wolf = "wolf"
	self.masks.character_locked.hoxton = "hoxton"
	self.masks.character_locked.chains = "chains"
	self.masks.character_locked.jowi = "jw_shades"
	self.masks.character_locked.old_hoxton = "old_hoxton"
	self.masks.character_locked.female_1 = "msk_grizel"
	self.masks.character_locked.dragan = "dragan"
	self.masks.character_locked.jacket = "richard_returns"
	self.masks.character_locked.bonnie = "bonnie"
	self.masks.character_locked.sokol = "sokol"
	self.masks.character_locked.dragon = "jiro"
	self.masks.skull = {}
	self.masks.skull.unit = "units/payday2/masks/msk_skull/msk_skull"
	self.masks.skull.name_id = "bm_msk_skull"
	self.masks.skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.skull.dlc = "preorder"
	self.masks.skull.value = 1
	self.masks.wolf_clean = {}
	self.masks.wolf_clean.unit = "units/payday2/masks/msk_wolf_clean/msk_wolf_clean"
	self.masks.wolf_clean.name_id = "bm_msk_wolf_clean"
	self.masks.wolf_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf_clean.infamous = true
	self.masks.wolf_clean.value = 9
	self.masks.wolf_clean.qlvl = 0
	self.masks.hoxton_clean = {}
	self.masks.hoxton_clean.unit = "units/payday2/masks/msk_hoxton_clean/msk_hoxton_clean"
	self.masks.hoxton_clean.name_id = "bm_msk_hoxton_clean"
	self.masks.hoxton_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton_clean.infamous = true
	self.masks.hoxton_clean.value = 9
	self.masks.hoxton_clean.qlvl = 0
	self.masks.dallas_clean = {}
	self.masks.dallas_clean.unit = "units/payday2/masks/msk_dallas_clean/msk_dallas_clean"
	self.masks.dallas_clean.name_id = "bm_msk_dallas_clean"
	self.masks.dallas_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas_clean.infamous = true
	self.masks.dallas_clean.value = 10
	self.masks.dallas_clean.qlvl = 0
	self.masks.chains_clean = {}
	self.masks.chains_clean.unit = "units/payday2/masks/msk_chains_clean/msk_chains_clean"
	self.masks.chains_clean.name_id = "bm_msk_chains_clean"
	self.masks.chains_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains_clean.infamous = true
	self.masks.chains_clean.value = 9
	self.masks.chains_clean.qlvl = 0
	self.masks.dallas = {}
	self.masks.dallas.unit = "units/payday2/masks/msk_dallas/msk_dallas"
	self.masks.dallas.name_id = "bm_msk_dallas"
	self.masks.dallas.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas.infamous = true
	self.masks.dallas.value = 7
	self.masks.hoxton = {}
	self.masks.hoxton.unit = "units/payday2/masks/msk_hoxton/msk_hoxton"
	self.masks.hoxton.name_id = "bm_msk_hoxton"
	self.masks.hoxton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton.infamous = true
	self.masks.hoxton.value = 7
	self.masks.chains = {}
	self.masks.chains.unit = "units/payday2/masks/msk_chains/msk_chains"
	self.masks.chains.name_id = "bm_msk_chains"
	self.masks.chains.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains.infamous = true
	self.masks.chains.value = 7
	self.masks.old_hoxton = {}
	self.masks.old_hoxton.unit = "units/pd2_dlc_old_hoxton/masks/old_hoxton/msk_old_hoxton"
	self.masks.old_hoxton.name_id = "bm_msk_old_hoxton"
	self.masks.old_hoxton.pcs = {}
	self.masks.old_hoxton.value = 0
	self.masks.old_hoxton.global_value = "infamous"
	self.masks.wolf = {}
	self.masks.wolf.unit = "units/payday2/masks/msk_wolf/msk_wolf"
	self.masks.wolf.name_id = "bm_msk_wolf"
	self.masks.wolf.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf.infamous = true
	self.masks.wolf.value = 7
	self.masks.dragan = {}
	self.masks.dragan.unit = "units/pd2_dlc_dragan/masks/dragan/msk_dragan"
	self.masks.dragan.name_id = "bm_msk_dragan"
	self.masks.dragan.pcs = {}
	self.masks.dragan.value = 0
	self.masks.dragan.texture_bundle_folder = "character_pack_dragan"
	self.masks.dragan.dlc = "character_pack_dragan"
	self.masks.dragan_begins = {}
	self.masks.dragan_begins.unit = "units/pd2_dlc_dragan/masks/dragan_begins/msk_dragan_begins"
	self.masks.dragan_begins.name_id = "bm_msk_dragan_begins"
	self.masks.dragan_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dragan_begins.value = 0
	self.masks.dragan_begins.texture_bundle_folder = "character_pack_dragan"
	self.masks.dragan_begins.dlc = "character_pack_dragan"
	self.masks.bonnie = {}
	self.masks.bonnie.unit = "units/pd2_dlc_bonnie/masks/bonnie/msk_bonnie"
	self.masks.bonnie.name_id = "bm_msk_bonnie"
	self.masks.bonnie.pcs = {}
	self.masks.bonnie.value = 0
	self.masks.bonnie.global_value = "infamous"
	self.masks.bonnie.texture_bundle_folder = "character_pack_bonnie"
	self.masks.bonnie_begins = {}
	self.masks.bonnie_begins.unit = "units/pd2_dlc_bonnie/masks/bonnie_begins/msk_bonnie_begins"
	self.masks.bonnie_begins.name_id = "bm_msk_bonnie_begins"
	self.masks.bonnie_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bonnie_begins.value = 0
	self.masks.bonnie_begins.global_value = "infamous"
	self.masks.bonnie_begins.texture_bundle_folder = "character_pack_bonnie"
	self.masks.cthulhu = {}
	self.masks.cthulhu.unit = "units/payday2/masks/msk_cthulhu/msk_cthulhu"
	self.masks.cthulhu.name_id = "bm_msk_cthulhu"
	self.masks.cthulhu.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cthulhu.infamous = true
	self.masks.cthulhu.value = 8
	self.masks.cthulhu.qlvl = 0
	self.masks.grin = {}
	self.masks.grin.unit = "units/payday2/masks/msk_grin/msk_grin"
	self.masks.grin.name_id = "bm_msk_grin"
	self.masks.grin.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.grin.infamous = true
	self.masks.grin.value = 8
	self.masks.grin.qlvl = 0
	self.masks.anonymous = {}
	self.masks.anonymous.unit = "units/payday2/masks/msk_anonymous/msk_anonymous"
	self.masks.anonymous.name_id = "bm_msk_anonymous"
	self.masks.anonymous.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.anonymous.infamous = true
	self.masks.anonymous.value = 6
	self.masks.anonymous.qlvl = 0
	self.masks.dillinger_death_mask = {}
	self.masks.dillinger_death_mask.unit = "units/payday2/masks/msk_dillinger_death_mask/msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.name_id = "bm_msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dillinger_death_mask.infamous = true
	self.masks.dillinger_death_mask.value = 9
	self.masks.dillinger_death_mask.qlvl = 0
	self.masks.alienware = {}
	self.masks.alienware.unit = "units/payday2/masks/msk_alienware/msk_alienware"
	self.masks.alienware.name_id = "bm_msk_alienware"
	self.masks.alienware.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.alienware.value = 3
	self.masks.greek_tragedy = {}
	self.masks.greek_tragedy.unit = "units/payday2/masks/msk_greek_tragedy/msk_greek_tragedy"
	self.masks.greek_tragedy.name_id = "bm_msk_greek_tragedy"
	self.masks.greek_tragedy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.greek_tragedy.value = 7
	self.masks.greek_tragedy.qlvl = 0
	self.masks.jaw = {}
	self.masks.jaw.unit = "units/payday2/masks/msk_jaw/msk_jaw"
	self.masks.jaw.name_id = "bm_msk_jaw"
	self.masks.jaw.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jaw.value = 4
	self.masks.hockey = {}
	self.masks.hockey.unit = "units/payday2/masks/msk_hockey_a/msk_hockey_a_mask"
	self.masks.hockey.name_id = "bm_msk_hockey"
	self.masks.hockey.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hockey.value = 5
	self.masks.troll = {}
	self.masks.troll.unit = "units/payday2/masks/msk_troll/msk_troll"
	self.masks.troll.name_id = "bm_msk_troll"
	self.masks.troll.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.troll.value = 3
	self.masks.gagball = {}
	self.masks.gagball.unit = "units/payday2/masks/msk_gagball/msk_gagball"
	self.masks.gagball.name_id = "bm_msk_gagball"
	self.masks.gagball.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gagball.value = 4
	self.masks.tounge = {}
	self.masks.tounge.unit = "units/payday2/masks/msk_tounge/msk_tounge"
	self.masks.tounge.name_id = "bm_msk_tounge"
	self.masks.tounge.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.tounge.value = 2
	self.masks.zipper = {}
	self.masks.zipper.unit = "units/payday2/masks/msk_zipper/msk_zipper"
	self.masks.zipper.name_id = "bm_msk_zipper"
	self.masks.zipper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zipper.value = 5
	self.masks.biglips = {}
	self.masks.biglips.unit = "units/payday2/masks/msk_biglips/msk_biglips"
	self.masks.biglips.name_id = "bm_msk_biglips"
	self.masks.biglips.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.biglips.value = 3
	self.masks.clowncry = {}
	self.masks.clowncry.unit = "units/payday2/masks/msk_clowncry/msk_clowncry"
	self.masks.clowncry.name_id = "bm_msk_clowncry"
	self.masks.clowncry.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clowncry.value = 4
	self.masks.mr_sinister = {}
	self.masks.mr_sinister.unit = "units/payday2/masks/msk_mr_sinister/msk_mr_sinister"
	self.masks.mr_sinister.name_id = "bm_msk_mr_sinister"
	self.masks.mr_sinister.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mr_sinister.value = 5
	self.masks.clown_56 = {}
	self.masks.clown_56.unit = "units/payday2/masks/msk_clown_56/msk_clown_56"
	self.masks.clown_56.name_id = "bm_msk_clown_56"
	self.masks.clown_56.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clown_56.value = 3
	self.masks.dripper = {}
	self.masks.dripper.unit = "units/payday2/masks/msk_dripper/msk_dripper"
	self.masks.dripper.name_id = "bm_msk_dripper"
	self.masks.dripper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dripper.value = 8
	self.masks.dripper.qlvl = 0
	self.masks.buha = {}
	self.masks.buha.unit = "units/payday2/masks/msk_buha/msk_buha"
	self.masks.buha.name_id = "bm_msk_buha"
	self.masks.buha.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.buha.value = 5
	self.masks.shogun = {}
	self.masks.shogun.unit = "units/payday2/masks/msk_shogun/msk_shogun"
	self.masks.shogun.name_id = "bm_msk_shogun"
	self.masks.shogun.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shogun.value = 6
	self.masks.oni = {}
	self.masks.oni.unit = "units/payday2/masks/msk_oni/msk_oni"
	self.masks.oni.name_id = "bm_msk_oni"
	self.masks.oni.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.oni.value = 4
	self.masks.monkeybiss = {}
	self.masks.monkeybiss.unit = "units/payday2/masks/msk_monkeybiss/msk_monkeybiss"
	self.masks.monkeybiss.name_id = "bm_msk_monkeybiss"
	self.masks.monkeybiss.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.monkeybiss.value = 5
	self.masks.babyrhino = {}
	self.masks.babyrhino.unit = "units/payday2/masks/msk_babyrhino/msk_babyrhino"
	self.masks.babyrhino.name_id = "bm_msk_babyrhino"
	self.masks.babyrhino.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.babyrhino.value = 3
	self.masks.hog = {}
	self.masks.hog.unit = "units/payday2/masks/msk_hog/msk_hog"
	self.masks.hog.name_id = "bm_msk_hog"
	self.masks.hog.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hog.value = 3
	self.masks.hog.qlvl = 0
	self.masks.outlandish_a = {}
	self.masks.outlandish_a.unit = "units/payday2/masks/msk_outlandish_a/msk_outlandish_a"
	self.masks.outlandish_a.name_id = "bm_msk_outlandish_a"
	self.masks.outlandish_a.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_a.value = 2
	self.masks.outlandish_b = {}
	self.masks.outlandish_b.unit = "units/payday2/masks/msk_outlandish_b/msk_outlandish_b"
	self.masks.outlandish_b.name_id = "bm_msk_outlandish_b"
	self.masks.outlandish_b.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_b.value = 3
	self.masks.outlandish_c = {}
	self.masks.outlandish_c.unit = "units/payday2/masks/msk_outlandish_c/msk_outlandish_c"
	self.masks.outlandish_c.name_id = "bm_msk_outlandish_c"
	self.masks.outlandish_c.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_c.value = 4
	self.masks.bullet = {}
	self.masks.bullet.unit = "units/payday2/masks/msk_bullet/msk_bullet"
	self.masks.bullet.name_id = "bm_msk_bullet"
	self.masks.bullet.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bullet.value = 3
	self.masks.shrunken = {}
	self.masks.shrunken.unit = "units/payday2/masks/msk_shrunken/msk_shrunken"
	self.masks.shrunken.name_id = "bm_msk_shrunken"
	self.masks.shrunken.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shrunken.value = 3
	self.masks.brainiack = {}
	self.masks.brainiack.unit = "units/payday2/masks/msk_brainiack/msk_brainiack"
	self.masks.brainiack.name_id = "bm_msk_brainiack"
	self.masks.brainiack.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.brainiack.value = 6
	self.masks.zombie = {}
	self.masks.zombie.unit = "units/payday2/masks/msk_zombie/msk_zombie"
	self.masks.zombie.name_id = "bm_msk_zombie"
	self.masks.zombie.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zombie.value = 3
	self.masks.scarecrow = {}
	self.masks.scarecrow.unit = "units/payday2/masks/msk_scarecrow/msk_scarecrow"
	self.masks.scarecrow.name_id = "bm_msk_scarecrow"
	self.masks.scarecrow.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.scarecrow.value = 7
	self.masks.scarecrow.qlvl = 0
	self.masks.mummy = {}
	self.masks.mummy.unit = "units/payday2/masks/msk_mummy/msk_mummy"
	self.masks.mummy.name_id = "bm_msk_mummy"
	self.masks.mummy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mummy.value = 3
	self.masks.vampire = {}
	self.masks.vampire.unit = "units/payday2/masks/msk_vampire/msk_vampire"
	self.masks.vampire.name_id = "bm_msk_vampire"
	self.masks.vampire.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.vampire.value = 2
	self.masks.day_of_the_dead = {}
	self.masks.day_of_the_dead.unit = "units/payday2/masks/msk_day_of_the_dead/msk_day_of_the_dead"
	self.masks.day_of_the_dead.name_id = "bm_msk_day_of_the_dead"
	self.masks.day_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.day_of_the_dead.value = 3
	self.masks.day_of_the_dead.qlvl = 0
	self.masks.dawn_of_the_dead = {}
	self.masks.dawn_of_the_dead.unit = "units/payday2/masks/msk_dawn_of_the_dead/msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.name_id = "bm_msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dawn_of_the_dead.value = 2
	self.masks.demon = {}
	self.masks.demon.unit = "units/payday2/masks/msk_demon/msk_demon"
	self.masks.demon.name_id = "bm_msk_demon"
	self.masks.demon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demon.value = 10
	self.masks.demon.qlvl = 0
	self.masks.stonekisses = {}
	self.masks.stonekisses.unit = "units/payday2/masks/msk_stonekisses/msk_stonekisses"
	self.masks.stonekisses.name_id = "bm_msk_stonekisses"
	self.masks.stonekisses.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.stonekisses.value = 4
	self.masks.demonictender = {}
	self.masks.demonictender.unit = "units/payday2/masks/msk_demonictender/msk_demonictender"
	self.masks.demonictender.name_id = "bm_msk_demonictender"
	self.masks.demonictender.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demonictender.value = 3
	self.masks.kawaii = {}
	self.masks.kawaii.unit = "units/payday2/masks/msk_kawaii/msk_kawaii"
	self.masks.kawaii.name_id = "bm_msk_kawaii"
	self.masks.kawaii.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.kawaii.value = 3
	self.masks.irondoom = {}
	self.masks.irondoom.unit = "units/payday2/masks/msk_irondoom/msk_irondoom"
	self.masks.irondoom.name_id = "bm_msk_irondoom"
	self.masks.irondoom.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.irondoom.value = 3
	self.masks.rubber_male = {}
	self.masks.rubber_male.unit = "units/payday2/masks/msk_rubber_male/msk_rubber_male"
	self.masks.rubber_male.name_id = "bm_msk_rubber_male"
	self.masks.rubber_male.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_male.value = 3
	self.masks.rubber_female = {}
	self.masks.rubber_female.unit = "units/payday2/masks/msk_rubber_female/msk_rubber_female"
	self.masks.rubber_female.name_id = "bm_msk_rubber_female"
	self.masks.rubber_female.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_female.value = 3
	self.masks.pumpkin_king = {}
	self.masks.pumpkin_king.unit = "units/payday2/masks/msk_pumpkin_king/msk_pumpkin_king"
	self.masks.pumpkin_king.name_id = "bm_msk_pumpkin_king"
	if is_nextgen_console then
		self.masks.pumpkin_king.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.pumpkin_king.pcs = nil
		self.masks.pumpkin_king.weight = 1000
		self.masks.pumpkin_king.got_item_weight_mod = 0.001
	end
	self.masks.pumpkin_king.global_value = "halloween"
	self.masks.pumpkin_king.value = 0
	self.masks.pumpkin_king.qlvl = 0
	self.masks.pumpkin_king.sort_number = 1
	self.masks.witch = {}
	self.masks.witch.unit = "units/payday2/masks/msk_witch/msk_witch"
	self.masks.witch.name_id = "bm_msk_witch"
	if is_nextgen_console then
		self.masks.witch.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.witch.pcs = nil
		self.masks.witch.weight = 1000
		self.masks.witch.got_item_weight_mod = 0.001
	end
	self.masks.witch.global_value = "halloween"
	self.masks.witch.value = 0
	self.masks.witch.qlvl = 0
	self.masks.witch.sort_number = 1
	self.masks.venomorph = {}
	self.masks.venomorph.unit = "units/payday2/masks/msk_venomorph/msk_venomorph"
	self.masks.venomorph.name_id = "bm_msk_venomorph"
	if is_nextgen_console then
		self.masks.venomorph.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.venomorph.pcs = nil
		self.masks.venomorph.weight = 1000
		self.masks.venomorph.got_item_weight_mod = 0.001
	end
	self.masks.venomorph.global_value = "halloween"
	self.masks.venomorph.value = 0
	self.masks.venomorph.qlvl = 0
	self.masks.venomorph.sort_number = 1
	self.masks.frank = {}
	self.masks.frank.unit = "units/payday2/masks/msk_frank/msk_frank"
	self.masks.frank.name_id = "bm_msk_frank"
	if is_nextgen_console then
		self.masks.frank.pcs = {
			10,
			20,
			30,
			40
		}
	else
		self.masks.frank.pcs = nil
		self.masks.frank.weight = 1000
		self.masks.frank.got_item_weight_mod = 0.001
	end
	self.masks.frank.global_value = "halloween"
	self.masks.frank.value = 0
	self.masks.frank.qlvl = 0
	self.masks.frank.sort_number = 1
	self.masks.brazil_baby = {}
	self.masks.brazil_baby.unit = "units/payday2/masks/msk_brazil_baby/msk_brazil_baby"
	self.masks.brazil_baby.name_id = "bm_msk_brazil_baby"
	self.masks.brazil_baby.global_value = "halloween"
	self.masks.brazil_baby.value = 0
	self.masks.brazil_baby.qlvl = 0
	self.masks.brazil_baby.sort_number = 2
	self.masks.baby_angry = {}
	self.masks.baby_angry.unit = "units/payday2/masks/msk_baby_angry/msk_baby_angry"
	self.masks.baby_angry.name_id = "bm_msk_baby_angry"
	self.masks.baby_angry.global_value = "halloween"
	self.masks.baby_angry.value = 0
	self.masks.baby_angry.qlvl = 0
	self.masks.baby_angry.sort_number = 2
	self.masks.baby_cry = {}
	self.masks.baby_cry.unit = "units/payday2/masks/msk_baby_cry/msk_baby_cry"
	self.masks.baby_cry.name_id = "bm_msk_baby_cry"
	self.masks.baby_cry.global_value = "halloween"
	self.masks.baby_cry.value = 0
	self.masks.baby_cry.qlvl = 0
	self.masks.baby_cry.sort_number = 2
	self.masks.baby_happy = {}
	self.masks.baby_happy.unit = "units/payday2/masks/msk_baby_happy/msk_baby_happy"
	self.masks.baby_happy.name_id = "bm_msk_baby_happy"
	self.masks.baby_happy.global_value = "halloween"
	self.masks.baby_happy.value = 0
	self.masks.baby_happy.qlvl = 0
	self.masks.baby_happy.sort_number = 2
	self.masks.the_one_below = {}
	self.masks.the_one_below.unit = "units/pd2_humble_halloween/masks/the_one_below/msk_the_one_below"
	self.masks.the_one_below.name_id = "bm_msk_onebelow"
	self.masks.the_one_below.pcs = {}
	self.masks.the_one_below.dlc = "humble_pack2"
	self.masks.the_one_below.value = 0
	self.masks.the_one_below.sort_number = 4
	self.masks.lycan = {}
	self.masks.lycan.unit = "units/pd2_humble_halloween/masks/lycan/msk_lycan"
	self.masks.lycan.name_id = "bm_msk_lycanwulf"
	self.masks.lycan.pcs = {}
	self.masks.lycan.dlc = "humble_pack2"
	self.masks.lycan.value = 0
	self.masks.lycan.sort_number = 4
	self.masks.krampus = {}
	self.masks.krampus.unit = "units/pd2_dlc_pines/masks/krampus/msk_krampus"
	self.masks.krampus.name_id = "bm_msk_krampus"
	self.masks.krampus.pcs = {}
	self.masks.krampus.value = 0
	self.masks.krampus.sort_number = 1
	self.masks.krampus.texture_bundle_folder = "pines"
	self.masks.mrs_claus = {}
	self.masks.mrs_claus.unit = "units/pd2_dlc_pines/masks/mrs_claus/msk_mrs_claus"
	self.masks.mrs_claus.name_id = "bm_msk_mrs_claus"
	self.masks.mrs_claus.pcs = {}
	self.masks.mrs_claus.value = 0
	self.masks.mrs_claus.sort_number = 1
	self.masks.mrs_claus.texture_bundle_folder = "pines"
	self.masks.strinch = {}
	self.masks.strinch.unit = "units/pd2_dlc_pines/masks/strinch/msk_the_strinch"
	self.masks.strinch.name_id = "bm_msk_the_strinch"
	self.masks.strinch.pcs = {}
	self.masks.strinch.type = "helmet"
	self.masks.strinch.value = 0
	self.masks.strinch.sort_number = 1
	self.masks.strinch.texture_bundle_folder = "pines"
	self.masks.almirs_beard = {}
	self.masks.almirs_beard.unit = "units/pd2_dlc_pines/masks/almirs_beard/msk_almirs_beard"
	self.masks.almirs_beard.name_id = "bm_msk_almirs_beard"
	self.masks.almirs_beard.pcs = {}
	self.masks.almirs_beard.type = "beard"
	self.masks.almirs_beard.skip_mask_on_sequence = true
	self.masks.almirs_beard.value = 0
	self.masks.almirs_beard.sort_number = 1
	self.masks.almirs_beard.texture_bundle_folder = "pines"
	self.masks.robo_santa = {}
	self.masks.robo_santa.unit = "units/pd2_dlc_pines/masks/robo_santa/msk_robo_santa"
	self.masks.robo_santa.name_id = "bm_msk_robo_santa"
	self.masks.robo_santa.pcs = {}
	self.masks.robo_santa.value = 0
	self.masks.robo_santa.sort_number = 1
	self.masks.robo_santa.texture_bundle_folder = "pines"
	self.masks.heat = {}
	self.masks.heat.unit = "units/pd2_dlc1/masks/msk_hockey_b/msk_hockey_b"
	self.masks.heat.name_id = "bm_msk_heat"
	self.masks.heat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.heat.value = 6
	self.masks.heat.dlc = "pd2_clan"
	self.masks.heat.sort_number = 2
	self.masks.bear = {}
	self.masks.bear.unit = "units/payday2/masks/msk_bear/msk_bear"
	self.masks.bear.name_id = "bm_msk_bear"
	self.masks.bear.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bear.value = 3
	self.masks.bear.qlvl = 0
	self.masks.bear.dlcs = {"pd2_clan"}
	self.masks.bear.sort_number = 1
	self.masks.clinton = {}
	self.masks.clinton.unit = "units/pd2_dlc1/masks/msk_clinton/msk_clinton"
	self.masks.clinton.name_id = "bm_msk_clinton"
	self.masks.clinton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clinton.value = 6
	self.masks.clinton.dlc = "armored_transport"
	self.masks.clinton.texture_bundle_folder = "dlc1"
	self.masks.bush = {}
	self.masks.bush.unit = "units/pd2_dlc1/masks/msk_bush/msk_bush"
	self.masks.bush.name_id = "bm_msk_bush"
	self.masks.bush.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bush.value = 6
	self.masks.bush.dlc = "armored_transport"
	self.masks.bush.texture_bundle_folder = "dlc1"
	self.masks.obama = {}
	self.masks.obama.unit = "units/pd2_dlc1/masks/msk_obama/msk_obama"
	self.masks.obama.name_id = "bm_msk_obama"
	self.masks.obama.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.obama.value = 6
	self.masks.obama.dlc = "armored_transport"
	self.masks.obama.texture_bundle_folder = "dlc1"
	self.masks.nixon = {}
	self.masks.nixon.unit = "units/pd2_dlc1/masks/msk_nixon/msk_nixon"
	self.masks.nixon.name_id = "bm_msk_nixon"
	self.masks.nixon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.nixon.value = 6
	self.masks.nixon.dlc = "armored_transport"
	self.masks.nixon.texture_bundle_folder = "dlc1"
	self.masks.goat = {}
	self.masks.goat.unit = "units/pd2_dlc_dec5/masks/msk_goat/msk_goat"
	self.masks.goat.name_id = "bm_msk_goat"
	self.masks.goat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.goat.value = 4
	self.masks.goat.texture_bundle_folder = "gage_pack"
	self.masks.goat.dlc = "gage_pack"
	self.masks.panda = {}
	self.masks.panda.unit = "units/pd2_dlc_dec5/masks/msk_panda/msk_panda"
	self.masks.panda.name_id = "bm_msk_panda"
	self.masks.panda.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.panda.value = 4
	self.masks.panda.texture_bundle_folder = "gage_pack"
	self.masks.panda.dlc = "gage_pack"
	self.masks.pitbull = {}
	self.masks.pitbull.unit = "units/pd2_dlc_dec5/masks/msk_pitbull/msk_pitbull"
	self.masks.pitbull.name_id = "bm_msk_pitbull"
	self.masks.pitbull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.pitbull.value = 4
	self.masks.pitbull.texture_bundle_folder = "gage_pack"
	self.masks.pitbull.dlc = "gage_pack"
	self.masks.eagle = {}
	self.masks.eagle.unit = "units/pd2_dlc_dec5/masks/msk_eagle/msk_eagle"
	self.masks.eagle.name_id = "bm_msk_eagle"
	self.masks.eagle.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.eagle.value = 4
	self.masks.eagle.qlvl = 0
	self.masks.eagle.texture_bundle_folder = "gage_pack"
	self.masks.eagle.dlc = "gage_pack"
	self.masks.santa_happy = {}
	self.masks.santa_happy.unit = "units/pd2_dlc2/masks/msk_santa_happy/msk_santa_happy"
	self.masks.santa_happy.name_id = "bm_msk_santa_happy"
	self.masks.santa_happy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_happy.value = 4
	self.masks.santa_happy.dlc = "pd2_clan"
	self.masks.santa_happy.global_value = "pd2_clan"
	self.masks.santa_happy.sort_number = 3
	self.masks.santa_mad = {}
	self.masks.santa_mad.unit = "units/pd2_dlc_xmas/masks/msk_santa_mad/msk_santa_mad"
	self.masks.santa_mad.name_id = "bm_msk_santa_mad"
	self.masks.santa_mad.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_mad.value = 4
	self.masks.santa_mad.dlc = "xmas_soundtrack"
	self.masks.santa_drunk = {}
	self.masks.santa_drunk.unit = "units/pd2_dlc_xmas/masks/msk_santa_drunk/msk_santa_drunk"
	self.masks.santa_drunk.name_id = "bm_msk_santa_drunk"
	self.masks.santa_drunk.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_drunk.value = 4
	self.masks.santa_drunk.dlc = "xmas_soundtrack"
	self.masks.santa_surprise = {}
	self.masks.santa_surprise.unit = "units/pd2_dlc_xmas/masks/msk_santa_suprise/msk_santa_suprise"
	self.masks.santa_surprise.name_id = "bm_msk_santa_surprise"
	self.masks.santa_surprise.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_surprise.value = 4
	self.masks.santa_surprise.dlc = "xmas_soundtrack"
	self.masks.aviator = {}
	self.masks.aviator.unit = "units/pd2_dlc_infamy/masks/msk_aviator/msk_aviator"
	self.masks.aviator.name_id = "bm_msk_aviator"
	self.masks.aviator.pcs = {}
	self.masks.aviator.value = 0
	self.masks.aviator.type = "glasses"
	self.masks.aviator.skip_mask_on_sequence = true
	self.masks.aviator.global_value = "infamy"
	self.masks.aviator.texture_bundle_folder = "infamous"
	self.masks.aviator.infamy_lock = "infamy_root"
	self.masks.ghost = {}
	self.masks.ghost.unit = "units/pd2_dlc_infamy/masks/msk_ghost/msk_ghost"
	self.masks.ghost.name_id = "bm_msk_ghost"
	self.masks.ghost.pcs = {}
	self.masks.ghost.value = 0
	self.masks.ghost.global_value = "infamy"
	self.masks.ghost.texture_bundle_folder = "infamous"
	self.masks.ghost.type = "helmet"
	self.masks.ghost.infamy_lock = "infamy_ghost"
	self.masks.welder = {}
	self.masks.welder.unit = "units/pd2_dlc_infamy/masks/msk_welder/msk_welder"
	self.masks.welder.name_id = "bm_msk_welder"
	self.masks.welder.pcs = {}
	self.masks.welder.value = 0
	self.masks.welder.global_value = "infamy"
	self.masks.welder.texture_bundle_folder = "infamous"
	self.masks.welder.infamy_lock = "infamy_enforcer"
	self.masks.plague = {}
	self.masks.plague.unit = "units/pd2_dlc_infamy/masks/msk_plague/msk_plague"
	self.masks.plague.name_id = "bm_msk_plague"
	self.masks.plague.pcs = {}
	self.masks.plague.value = 0
	self.masks.plague.global_value = "infamy"
	self.masks.plague.texture_bundle_folder = "infamous"
	self.masks.plague.infamy_lock = "infamy_mastermind"
	self.masks.smoker = {}
	self.masks.smoker.unit = "units/pd2_dlc_infamy/masks/msk_smoker/msk_smoker"
	self.masks.smoker.name_id = "bm_msk_smoker"
	self.masks.smoker.pcs = {}
	self.masks.smoker.value = 0
	self.masks.smoker.global_value = "infamy"
	self.masks.smoker.texture_bundle_folder = "infamous"
	self.masks.smoker.infamy_lock = "infamy_technician"
	self.masks.cloth_commander = {}
	self.masks.cloth_commander.unit = "units/pd2_dlc_gage_lmg/masks/cloth_commander/msk_cloth_commander"
	self.masks.cloth_commander.name_id = "bm_msk_cloth_commander"
	self.masks.cloth_commander.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cloth_commander.value = 4
	self.masks.cloth_commander.qlvl = 0
	self.masks.cloth_commander.dlc = "gage_pack_lmg"
	self.masks.cloth_commander.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade = {}
	self.masks.gage_blade.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_blade/msk_gage_blade"
	self.masks.gage_blade.name_id = "bm_msk_gage_blade"
	self.masks.gage_blade.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_blade.value = 4
	self.masks.gage_blade.qlvl = 0
	self.masks.gage_blade.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade.dlc = "gage_pack_lmg"
	self.masks.gage_rambo = {}
	self.masks.gage_rambo.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_rambo/msk_gage_rambo"
	self.masks.gage_rambo.name_id = "bm_msk_rambo"
	self.masks.gage_rambo.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_rambo.value = 4
	self.masks.gage_rambo.qlvl = 0
	self.masks.gage_rambo.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_rambo.dlc = "gage_pack_lmg"
	self.masks.gage_deltaforce = {}
	self.masks.gage_deltaforce.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_deltaforce/msk_gage_deltaforce"
	self.masks.gage_deltaforce.name_id = "bm_msk_deltaforce"
	self.masks.gage_deltaforce.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_deltaforce.value = 4
	self.masks.gage_deltaforce.qlvl = 0
	self.masks.gage_deltaforce.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_deltaforce.dlc = "gage_pack_lmg"
	self.masks.robberfly = {}
	self.masks.robberfly.unit = "units/pd2_dlc_gage_snp/masks/msk_robberfly/msk_robberfly"
	self.masks.robberfly.name_id = "bm_msk_robberfly"
	self.masks.robberfly.pcs = {}
	self.masks.robberfly.value = 0
	self.masks.robberfly.qlvl = 0
	self.masks.robberfly.texture_bundle_folder = "gage_pack_snp"
	self.masks.robberfly.dlc = "gage_pack_snp"
	self.masks.spider = {}
	self.masks.spider.unit = "units/pd2_dlc_gage_snp/masks/msk_spider/msk_spider"
	self.masks.spider.name_id = "bm_msk_spider"
	self.masks.spider.pcs = {}
	self.masks.spider.value = 0
	self.masks.spider.qlvl = 0
	self.masks.spider.texture_bundle_folder = "gage_pack_snp"
	self.masks.spider.dlc = "gage_pack_snp"
	self.masks.mantis = {}
	self.masks.mantis.unit = "units/pd2_dlc_gage_snp/masks/msk_mantis/msk_mantis"
	self.masks.mantis.name_id = "bm_msk_mantis"
	self.masks.mantis.pcs = {}
	self.masks.mantis.value = 0
	self.masks.mantis.qlvl = 0
	self.masks.mantis.texture_bundle_folder = "gage_pack_snp"
	self.masks.mantis.dlc = "gage_pack_snp"
	self.masks.wasp = {}
	self.masks.wasp.unit = "units/pd2_dlc_gage_snp/masks/msk_wasp/msk_wasp"
	self.masks.wasp.name_id = "bm_msk_wasp"
	self.masks.wasp.pcs = {}
	self.masks.wasp.value = 0
	self.masks.wasp.qlvl = 0
	self.masks.wasp.texture_bundle_folder = "gage_pack_snp"
	self.masks.wasp.dlc = "gage_pack_snp"
	self.masks.skullhard = {}
	self.masks.skullhard.unit = "units/payday2/masks/msk_skullhard/msk_skullhard"
	self.masks.skullhard.name_id = "bm_msk_skullhard"
	self.masks.skullhard.pcs = {}
	self.masks.skullhard.value = 0
	self.masks.skullhard.qlvl = 0
	self.masks.skullhard.infamous = true
	self.masks.skullveryhard = {}
	self.masks.skullveryhard.unit = "units/payday2/masks/msk_skullveryhard/msk_skullveryhard"
	self.masks.skullveryhard.name_id = "bm_msk_skullveryhard"
	self.masks.skullveryhard.pcs = {}
	self.masks.skullveryhard.value = 0
	self.masks.skullveryhard.qlvl = 0
	self.masks.skullveryhard.infamous = true
	self.masks.skulloverkill = {}
	self.masks.skulloverkill.unit = "units/payday2/masks/msk_skulloverkill/msk_skulloverkill"
	self.masks.skulloverkill.name_id = "bm_msk_skulloverkill"
	self.masks.skulloverkill.pcs = {}
	self.masks.skulloverkill.value = 0
	self.masks.skulloverkill.qlvl = 0
	self.masks.skulloverkill.infamous = true
	self.masks.skulloverkillplus = {}
	self.masks.skulloverkillplus.unit = "units/payday2/masks/msk_skulloverkillplus/msk_skulloverkillplus"
	self.masks.skulloverkillplus.name_id = "bm_msk_skulloverkillplus"
	self.masks.skulloverkillplus.pcs = {}
	self.masks.skulloverkillplus.value = 0
	self.masks.skulloverkillplus.qlvl = 0
	self.masks.skulloverkillplus.infamous = true
	self.masks.metalhead = {}
	self.masks.metalhead.unit = "units/pd2_poetry_winners/masks/veggie/msk_metalhead"
	self.masks.metalhead.name_id = "bm_msk_metalhead"
	self.masks.metalhead.pcs = {}
	self.masks.metalhead.value = 0
	self.masks.metalhead.dlc = "poetry_soundtrack"
	self.masks.metalhead.global_value = "poetry_soundtrack"
	self.masks.tcn = {}
	self.masks.tcn.unit = "units/pd2_poetry_winners/masks/tcn/msk_tcn"
	self.masks.tcn.name_id = "bm_msk_tcn"
	self.masks.tcn.pcs = {}
	self.masks.tcn.value = 0
	self.masks.tcn.dlc = "poetry_soundtrack"
	self.masks.tcn.global_value = "poetry_soundtrack"
	self.masks.surprise = {}
	self.masks.surprise.unit = "units/pd2_poetry_winners/masks/shaegro/msk_surprise"
	self.masks.surprise.name_id = "bm_msk_surprise"
	self.masks.surprise.pcs = {}
	self.masks.surprise.value = 0
	self.masks.surprise.dlc = "poetry_soundtrack"
	self.masks.surprise.global_value = "poetry_soundtrack"
	self.masks.optimist_prime = {}
	self.masks.optimist_prime.unit = "units/pd2_poetry_winners/masks/optimist_prime/msk_optimist_prime"
	self.masks.optimist_prime.name_id = "bm_msk_optimist_prime"
	self.masks.optimist_prime.pcs = {}
	self.masks.optimist_prime.value = 0
	self.masks.optimist_prime.dlc = "poetry_soundtrack"
	self.masks.optimist_prime.global_value = "poetry_soundtrack"
	self.masks.samurai = {}
	self.masks.samurai.unit = "units/payday2/masks/msk_samurai/msk_samurai"
	self.masks.samurai.name_id = "bm_msk_samurai"
	self.masks.samurai.pcs = {}
	self.masks.samurai.value = 0
	self.masks.samurai.qlvl = 0
	self.masks.samurai.infamous = true
	self.masks.twitch_orc = {}
	self.masks.twitch_orc.unit = "units/pd2_twitch_pack/masks/msk_twitch_orc/msk_twitch_orc"
	self.masks.twitch_orc.name_id = "bm_msk_twitch_orc"
	self.masks.twitch_orc.pcs = {}
	self.masks.twitch_orc.value = 0
	self.masks.twitch_orc.qlvl = 0
	self.masks.twitch_orc.texture_bundle_folder = "twitch_pack"
	self.masks.twitch_orc.dlc = "twitch_pack"
	self.masks.twitch_orc.sort_number = 3
	self.masks.ancient = {}
	self.masks.ancient.unit = "units/pd2_twitch_pack/masks/msk_ancient/msk_ancient"
	self.masks.ancient.name_id = "bm_msk_ancient"
	self.masks.ancient.pcs = {}
	self.masks.ancient.value = 0
	self.masks.ancient.qlvl = 0
	self.masks.ancient.texture_bundle_folder = "twitch_pack"
	self.masks.ancient.dlc = "twitch_pack"
	self.masks.ancient.sort_number = 3
	self.masks.unicorn = {}
	self.masks.unicorn.unit = "units/payday2/masks/msk_unicorn/msk_unicorn"
	self.masks.unicorn.name_id = "bm_msk_unicorn"
	self.masks.unicorn.pcs = {}
	self.masks.unicorn.value = 0
	self.masks.unicorn.dlc = "pd2_clan"
	self.masks.unicorn.global_value = "pd2_clan"
	self.masks.unicorn.sort_number = 4
	self.masks.franklin = {}
	self.masks.franklin.unit = "units/pd2_dlc_big/masks/msk_franklin/msk_franklin"
	self.masks.franklin.name_id = "bm_msk_franklin"
	self.masks.franklin.pcs = {}
	self.masks.franklin.value = 0
	self.masks.franklin.qlvl = 0
	self.masks.franklin.dlc = "big_bank"
	self.masks.franklin.texture_bundle_folder = "big_bank"
	self.masks.lincoln = {}
	self.masks.lincoln.unit = "units/pd2_dlc_big/masks/msk_lincoln/msk_lincoln"
	self.masks.lincoln.name_id = "bm_msk_lincoln"
	self.masks.lincoln.pcs = {}
	self.masks.lincoln.value = 0
	self.masks.lincoln.qlvl = 0
	self.masks.lincoln.dlc = "big_bank"
	self.masks.lincoln.texture_bundle_folder = "big_bank"
	self.masks.grant = {}
	self.masks.grant.unit = "units/pd2_dlc_big/masks/msk_grant/msk_grant"
	self.masks.grant.name_id = "bm_msk_grant"
	self.masks.grant.pcs = {}
	self.masks.grant.value = 0
	self.masks.grant.qlvl = 0
	self.masks.grant.dlc = "big_bank"
	self.masks.grant.texture_bundle_folder = "big_bank"
	self.masks.washington = {}
	self.masks.washington.unit = "units/pd2_dlc_big/masks/msk_washington/msk_washington"
	self.masks.washington.name_id = "bm_msk_washington"
	self.masks.washington.pcs = {}
	self.masks.washington.value = 0
	self.masks.washington.qlvl = 0
	self.masks.washington.dlc = "big_bank"
	self.masks.washington.texture_bundle_folder = "big_bank"
	self.masks.silverback = {}
	self.masks.silverback.unit = "units/pd2_dlc_gage_shot/masks/silverback/msk_silverback"
	self.masks.silverback.name_id = "bm_msk_silverback"
	self.masks.silverback.pcs = {}
	self.masks.silverback.value = 0
	self.masks.silverback.dlc = "gage_pack_shotgun"
	self.masks.silverback.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.mandril = {}
	self.masks.mandril.unit = "units/pd2_dlc_gage_shot/masks/mandrill/msk_mandril"
	self.masks.mandril.name_id = "bm_msk_mandril"
	self.masks.mandril.pcs = {}
	self.masks.mandril.value = 0
	self.masks.mandril.dlc = "gage_pack_shotgun"
	self.masks.mandril.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.skullmonkey = {}
	self.masks.skullmonkey.unit = "units/pd2_dlc_gage_shot/masks/skullmonkey/msk_skullmonkey"
	self.masks.skullmonkey.name_id = "bm_msk_skullmonkey"
	self.masks.skullmonkey.pcs = {}
	self.masks.skullmonkey.value = 0
	self.masks.skullmonkey.dlc = "gage_pack_shotgun"
	self.masks.skullmonkey.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.orangutang = {}
	self.masks.orangutang.unit = "units/pd2_dlc_gage_shot/masks/orangutang/msk_orangutang"
	self.masks.orangutang.name_id = "bm_msk_orangutang"
	self.masks.orangutang.pcs = {}
	self.masks.orangutang.value = 0
	self.masks.orangutang.dlc = "gage_pack_shotgun"
	self.masks.orangutang.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.galax = {}
	self.masks.galax.unit = "units/pd2_dlc_gage_assault/masks/msk_galax/msk_galax"
	self.masks.galax.name_id = "bm_msk_galax"
	self.masks.galax.pcs = {}
	self.masks.galax.value = 0
	self.masks.galax.dlc = "gage_pack_assault"
	self.masks.galax.texture_bundle_folder = "gage_pack_assault"
	self.masks.crowgoblin = {}
	self.masks.crowgoblin.unit = "units/pd2_dlc_gage_assault/masks/msk_crowgoblin/msk_crowgoblin"
	self.masks.crowgoblin.name_id = "bm_msk_crowgoblin"
	self.masks.crowgoblin.pcs = {}
	self.masks.crowgoblin.value = 0
	self.masks.crowgoblin.dlc = "gage_pack_assault"
	self.masks.crowgoblin.texture_bundle_folder = "gage_pack_assault"
	self.masks.evil = {}
	self.masks.evil.unit = "units/pd2_dlc_gage_assault/masks/msk_evil/msk_evil"
	self.masks.evil.name_id = "bm_msk_evil"
	self.masks.evil.pcs = {}
	self.masks.evil.value = 0
	self.masks.evil.dlc = "gage_pack_assault"
	self.masks.evil.texture_bundle_folder = "gage_pack_assault"
	self.masks.volt = {}
	self.masks.volt.unit = "units/pd2_dlc_gage_assault/masks/msk_volt/msk_volt"
	self.masks.volt.name_id = "bm_msk_volt"
	self.masks.volt.pcs = {}
	self.masks.volt.value = 0
	self.masks.volt.dlc = "gage_pack_assault"
	self.masks.volt.texture_bundle_folder = "gage_pack_assault"
	self.masks.white_wolf = {}
	self.masks.white_wolf.unit = "units/pd2_dlc_miami/masks/msk_white_wolf/msk_white_wolf"
	self.masks.white_wolf.name_id = "bm_msk_white_wolf"
	self.masks.white_wolf.pcs = {}
	self.masks.white_wolf.value = 0
	self.masks.white_wolf.dlc = "hl_miami"
	self.masks.white_wolf.texture_bundle_folder = "hl_miami"
	self.masks.owl = {}
	self.masks.owl.unit = "units/pd2_dlc_miami/masks/msk_owl/msk_owl"
	self.masks.owl.name_id = "bm_msk_owl"
	self.masks.owl.pcs = {}
	self.masks.owl.value = 0
	self.masks.owl.dlc = "hl_miami"
	self.masks.owl.texture_bundle_folder = "hl_miami"
	self.masks.rabbit = {}
	self.masks.rabbit.unit = "units/pd2_dlc_miami/masks/msk_rabbit/msk_rabbit"
	self.masks.rabbit.name_id = "bm_msk_rabbit"
	self.masks.rabbit.pcs = {}
	self.masks.rabbit.value = 0
	self.masks.rabbit.dlc = "hl_miami"
	self.masks.rabbit.texture_bundle_folder = "hl_miami"
	self.masks.pig = {}
	self.masks.pig.unit = "units/pd2_dlc_miami/masks/msk_pig/msk_pig"
	self.masks.pig.name_id = "bm_msk_pig"
	self.masks.pig.pcs = {}
	self.masks.pig.value = 0
	self.masks.pig.dlc = "hl_miami"
	self.masks.pig.texture_bundle_folder = "hl_miami"
	self.masks.panther = {}
	self.masks.panther.unit = "units/pd2_dlc_miami/masks/msk_panther/msk_panther"
	self.masks.panther.name_id = "bm_msk_panther"
	self.masks.panther.pcs = {}
	self.masks.panther.value = 0
	self.masks.panther.dlc = "hlm_game"
	self.masks.panther.texture_bundle_folder = "hl_miami"
	self.masks.rooster = {}
	self.masks.rooster.unit = "units/pd2_dlc_miami/masks/msk_rooster/msk_rooster"
	self.masks.rooster.name_id = "bm_msk_rooster"
	self.masks.rooster.pcs = {}
	self.masks.rooster.value = 0
	self.masks.rooster.dlc = "hlm_game"
	self.masks.rooster.texture_bundle_folder = "hl_miami"
	self.masks.horse = {}
	self.masks.horse.unit = "units/pd2_dlc_miami/masks/msk_horse/msk_horse"
	self.masks.horse.name_id = "bm_msk_horse"
	self.masks.horse.pcs = {}
	self.masks.horse.value = 0
	self.masks.horse.dlc = "hlm_game"
	self.masks.horse.texture_bundle_folder = "hl_miami"
	self.masks.tiger = {}
	self.masks.tiger.unit = "units/pd2_dlc_miami/masks/msk_tiger/msk_tiger"
	self.masks.tiger.name_id = "bm_msk_tiger"
	self.masks.tiger.pcs = {}
	self.masks.tiger.value = 0
	self.masks.tiger.dlc = "hlm_game"
	self.masks.tiger.texture_bundle_folder = "hl_miami"
	self.masks.combusto = {}
	self.masks.combusto.unit = "units/pd2_crimefest_2014/oct19/masks/combusto/msk_combusto"
	self.masks.combusto.name_id = "bm_msk_combusto"
	self.masks.combusto.pcs = {}
	self.masks.combusto.dlc = "pd2_clan"
	self.masks.combusto.value = 0
	self.masks.combusto.sort_number = 5
	self.masks.spackle = {}
	self.masks.spackle.unit = "units/pd2_crimefest_2014/oct19/masks/spackle/msk_spackle"
	self.masks.spackle.name_id = "bm_msk_spackle"
	self.masks.spackle.pcs = {}
	self.masks.spackle.dlc = "pd2_clan"
	self.masks.spackle.value = 0
	self.masks.spackle.sort_number = 5
	self.masks.jw_shades = {}
	self.masks.jw_shades.unit = "units/pd2_crimefest_2014/oct22/masks/jw_shades/msk_jw_shades"
	self.masks.jw_shades.name_id = "bm_msk_jw_shades"
	self.masks.jw_shades.value = 0
	self.masks.jw_shades.type = "glasses"
	self.masks.jw_shades.skip_mask_on_sequence = true
	self.masks.stoneface = {}
	self.masks.stoneface.unit = "units/pd2_crimefest_2014/oct22/masks/stoneface/msk_stoneface"
	self.masks.stoneface.name_id = "bm_msk_stoneface"
	self.masks.stoneface.pcs = {}
	self.masks.stoneface.value = 0
	self.masks.stoneface.dlc = "pd2_clan"
	self.masks.stoneface.type = "glasses"
	self.masks.stoneface.skip_mask_on_sequence = true
	self.masks.stoneface.sort_number = 7
	self.masks.wayfarer = {}
	self.masks.wayfarer.unit = "units/pd2_crimefest_2014/oct22/masks/wayfarer/msk_wayfarer"
	self.masks.wayfarer.name_id = "bm_msk_wayfarer"
	self.masks.wayfarer.pcs = {}
	self.masks.wayfarer.value = 0
	self.masks.wayfarer.dlc = "pd2_clan"
	self.masks.wayfarer.type = "glasses"
	self.masks.wayfarer.skip_mask_on_sequence = true
	self.masks.wayfarer.sort_number = 7
	self.masks.smiley = {}
	self.masks.smiley.unit = "units/pd2_crimefest_2014/oct23/masks/smiley/msk_smiley"
	self.masks.smiley.name_id = "bm_msk_smiley"
	self.masks.smiley.pcs = {}
	self.masks.smiley.dlc = "pd2_clan"
	self.masks.smiley.value = 0
	self.masks.smiley.sort_number = 6
	self.masks.gumbo = {}
	self.masks.gumbo.unit = "units/pd2_crimefest_2014/oct23/masks/gumbo/msk_gumbo"
	self.masks.gumbo.name_id = "bm_msk_gumbo"
	self.masks.gumbo.pcs = {}
	self.masks.gumbo.dlc = "pd2_clan"
	self.masks.gumbo.value = 0
	self.masks.gumbo.sort_number = 6
	self.masks.crazy_lion = {}
	self.masks.crazy_lion.unit = "units/pd2_crimefest_2014/oct26/masks/msk_crazy_lion/crazy_lion_mask"
	self.masks.crazy_lion.name_id = "bm_msk_crazy_lion"
	self.masks.crazy_lion.pcs = {}
	self.masks.crazy_lion.dlc = "pd2_clan"
	self.masks.crazy_lion.value = 0
	self.masks.crazy_lion.sort_number = 8
	self.masks.churchill = {}
	self.masks.churchill.unit = "units/pd2_dlc_gage_historical/masks/churchill/msk_churchill"
	self.masks.churchill.name_id = "bm_msk_churchill"
	self.masks.churchill.pcs = {}
	self.masks.churchill.value = 0
	self.masks.churchill.dlc = "gage_pack_historical"
	self.masks.churchill.texture_bundle_folder = "gage_pack_historical"
	self.masks.red_hurricane = {}
	self.masks.red_hurricane.unit = "units/pd2_dlc_gage_historical/masks/red_hurricane/msk_red_hurricane"
	self.masks.red_hurricane.name_id = "bm_msk_red_hurricane"
	self.masks.red_hurricane.pcs = {}
	self.masks.red_hurricane.value = 0
	self.masks.red_hurricane.dlc = "gage_pack_historical"
	self.masks.red_hurricane.texture_bundle_folder = "gage_pack_historical"
	self.masks.patton = {}
	self.masks.patton.unit = "units/pd2_dlc_gage_historical/masks/patton/msk_patton"
	self.masks.patton.name_id = "bm_msk_patton"
	self.masks.patton.pcs = {}
	self.masks.patton.value = 0
	self.masks.patton.dlc = "gage_pack_historical"
	self.masks.patton.texture_bundle_folder = "gage_pack_historical"
	self.masks.de_gaulle = {}
	self.masks.de_gaulle.unit = "units/pd2_dlc_gage_historical/masks/de_gaulle/msk_de_gaulle"
	self.masks.de_gaulle.name_id = "bm_msk_de_gaulle"
	self.masks.de_gaulle.pcs = {}
	self.masks.de_gaulle.value = 0
	self.masks.de_gaulle.dlc = "gage_pack_historical"
	self.masks.de_gaulle.texture_bundle_folder = "gage_pack_historical"
	self.masks.msk_grizel = {}
	self.masks.msk_grizel.unit = "units/pd2_dlc_clover/masks/msk_grizel/msk_grizel"
	self.masks.msk_grizel.name_id = "bm_msk_msk_grizel"
	self.masks.msk_grizel.pcs = {}
	self.masks.msk_grizel.value = 0
	self.masks.msk_grizel.dlc = "character_pack_clover"
	self.masks.msk_grizel.texture_bundle_folder = "character_pack_clover"
	self.masks.grizel_clean = {}
	self.masks.grizel_clean.unit = "units/pd2_dlc_clover/masks/msk_clover_begins/msk_clover_begins"
	self.masks.grizel_clean.name_id = "bm_msk_grizel_clean"
	self.masks.grizel_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.grizel_clean.value = 0
	self.masks.grizel_clean.dlc = "character_pack_clover"
	self.masks.grizel_clean.texture_bundle_folder = "character_pack_clover"
	self.masks.medusa = {}
	self.masks.medusa.unit = "units/pd2_indiana/masks/medusa/msk_medusa"
	self.masks.medusa.name_id = "bm_msk_medusa"
	self.masks.medusa.pcs = {}
	self.masks.medusa.value = 0
	self.masks.medusa.dlc = "hope_diamond"
	self.masks.medusa.texture_bundle_folder = "character_pack_clover"
	self.masks.anubis = {}
	self.masks.anubis.unit = "units/pd2_indiana/masks/anubis/msk_anubis"
	self.masks.anubis.name_id = "bm_msk_anubis"
	self.masks.anubis.type = "helmet"
	self.masks.anubis.pcs = {}
	self.masks.anubis.value = 0
	self.masks.anubis.dlc = "hope_diamond"
	self.masks.anubis.texture_bundle_folder = "character_pack_clover"
	self.masks.pazuzu = {}
	self.masks.pazuzu.unit = "units/pd2_indiana/masks/pazuzu/msk_pazuzu"
	self.masks.pazuzu.name_id = "bm_msk_pazuzu"
	self.masks.pazuzu.pcs = {}
	self.masks.pazuzu.value = 0
	self.masks.pazuzu.dlc = "hope_diamond"
	self.masks.pazuzu.texture_bundle_folder = "character_pack_clover"
	self.masks.cursed_crown = {}
	self.masks.cursed_crown.unit = "units/pd2_indiana/masks/msk_cursed_crown/msk_cursed_crown"
	self.masks.cursed_crown.name_id = "bm_msk_cursed_crown"
	self.masks.cursed_crown.pcs = {}
	self.masks.cursed_crown.value = 0
	self.masks.cursed_crown.dlc = "hope_diamond"
	self.masks.cursed_crown.texture_bundle_folder = "character_pack_clover"
	self.masks.butcher = {}
	self.masks.butcher.unit = "units/pd2_dlc_dragan/masks/butcher/msk_butcher"
	self.masks.butcher.name_id = "bm_msk_butcher"
	self.masks.butcher.pcs = {}
	self.masks.butcher.value = 0
	self.masks.butcher.dlc = "the_bomb"
	self.masks.butcher.texture_bundle_folder = "the_bomb"
	self.masks.doctor = {}
	self.masks.doctor.unit = "units/pd2_dlc_cro/masks/msk_doctor/msk_doctor"
	self.masks.doctor.name_id = "bm_msk_doctor"
	self.masks.doctor.pcs = {}
	self.masks.doctor.value = 0
	self.masks.doctor.dlc = "the_bomb"
	self.masks.doctor.type = "helmet"
	self.masks.doctor.texture_bundle_folder = "the_bomb"
	self.masks.doctor.skip_mask_on_sequence = true
	self.masks.tech_lion = {}
	self.masks.tech_lion.unit = "units/pd2_dlc_cro/masks/msk_tech_lion/msk_tech_lion"
	self.masks.tech_lion.name_id = "bm_msk_tech_lion"
	self.masks.tech_lion.pcs = {}
	self.masks.tech_lion.value = 0
	self.masks.tech_lion.dlc = "the_bomb"
	self.masks.tech_lion.texture_bundle_folder = "the_bomb"
	self.masks.lady_butcher = {}
	self.masks.lady_butcher.unit = "units/pd2_dlc_cro/masks/msk_butcher/msk_butcher"
	self.masks.lady_butcher.name_id = "bm_msk_lady_butcher"
	self.masks.lady_butcher.pcs = {}
	self.masks.lady_butcher.value = 0
	self.masks.lady_butcher.dlc = "the_bomb"
	self.masks.lady_butcher.texture_bundle_folder = "the_bomb"
	self.masks.nun_town = {}
	self.masks.nun_town.unit = "units/pd2_dlc_goty/masks/nun_town/msk_nun_town"
	self.masks.nun_town.name_id = "bm_msk_nun_town"
	self.masks.nun_town.pcs = {}
	self.masks.nun_town.value = 0
	self.masks.nun_town.dlc = "goty_heist_bundle_2014"
	self.masks.nun_town.dlc_list = {
		"armored_transport",
		"big_bank",
		"hl_miami",
		"hope_diamond"
	}
	self.masks.nun_town.texture_bundle_folder = "pd2_goty"
	self.masks.robo_arnold = {}
	self.masks.robo_arnold.unit = "units/pd2_dlc_goty/masks/robo_arnold/msk_robo_arnold"
	self.masks.robo_arnold.name_id = "bm_msk_robo_arnold"
	self.masks.robo_arnold.pcs = {}
	self.masks.robo_arnold.value = 0
	self.masks.robo_arnold.dlc = "goty_weapon_bundle_2014"
	self.masks.robo_arnold.dlc_list = {
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"gage_pack_historical"
	}
	self.masks.robo_arnold.texture_bundle_folder = "pd2_goty"
	self.masks.arch_nemesis = {}
	self.masks.arch_nemesis.unit = "units/pd2_dlc_goty/masks/arch_nemesis/msk_arch_nemesis"
	self.masks.arch_nemesis.name_id = "bm_msk_arch_nemesis"
	self.masks.arch_nemesis.pcs = {}
	self.masks.arch_nemesis.value = 0
	self.masks.arch_nemesis.type = "helmet"
	self.masks.arch_nemesis.default_blueprint = {
		textures = "no_color_full_material",
		materials = "deep_bronze"
	}
	self.masks.arch_nemesis.dlc = "goty_dlc_bundle_2014"
	self.masks.arch_nemesis.dlc_list = {
		"character_pack_clover",
		"xmas_soundtrack",
		"armored_transport",
		"big_bank",
		"hl_miami",
		"hope_diamond",
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"gage_pack_historical"
	}
	self.masks.arch_nemesis.texture_bundle_folder = "pd2_goty"
	self.masks.carnotaurus = {}
	self.masks.carnotaurus.unit = "units/pd2_dlc_akm4_modpack/masks/carnotaurus/msk_carnotaurus"
	self.masks.carnotaurus.name_id = "bm_msk_carnotaurus"
	self.masks.carnotaurus.pcs = {}
	self.masks.carnotaurus.value = 0
	self.masks.carnotaurus.texture_bundle_folder = "dlc_akm4"
	self.masks.carnotaurus.dlc = "akm4_pack"
	self.masks.triceratops = {}
	self.masks.triceratops.unit = "units/pd2_dlc_akm4_modpack/masks/triceratops/msk_triceratops"
	self.masks.triceratops.name_id = "bm_msk_triceratops"
	self.masks.triceratops.pcs = {}
	self.masks.triceratops.value = 0
	self.masks.triceratops.texture_bundle_folder = "dlc_akm4"
	self.masks.triceratops.dlc = "akm4_pack"
	self.masks.pachy = {}
	self.masks.pachy.unit = "units/pd2_dlc_akm4_modpack/masks/pachy/msk_pachy"
	self.masks.pachy.name_id = "bm_msk_pachy"
	self.masks.pachy.pcs = {}
	self.masks.pachy.value = 0
	self.masks.pachy.texture_bundle_folder = "dlc_akm4"
	self.masks.pachy.dlc = "akm4_pack"
	self.masks.velociraptor = {}
	self.masks.velociraptor.unit = "units/pd2_dlc_akm4_modpack/masks/velociraptor/msk_velociraptor"
	self.masks.velociraptor.name_id = "bm_msk_velociraptor"
	self.masks.velociraptor.pcs = {}
	self.masks.velociraptor.value = 0
	self.masks.velociraptor.texture_bundle_folder = "dlc_akm4"
	self.masks.velociraptor.dlc = "akm4_pack"
	self.masks.champion_dallas = {}
	self.masks.champion_dallas.unit = "units/pd2_hw_boxing/masks/champion_dallas/msk_champion_dallas"
	self.masks.champion_dallas.name_id = "bm_msk_champion_dallas"
	self.masks.champion_dallas.pcs = {}
	self.masks.champion_dallas.value = 0
	self.masks.champion_dallas.dlc = nil
	self.masks.champion_dallas.texture_bundle_folder = "pd2_hw_boxing"
	self.masks.champion_dallas.sort_number = 10
	if SystemInfo:platform() == Idstring("WIN32") then
		self.masks.area51 = {}
		self.masks.area51.unit = "units/pd2_dlc_alienware/masks/area51/msk_area51"
		self.masks.area51.name_id = "bm_msk_area51"
		self.masks.area51.texture_bundle_folder = "alienware_alpha"
		self.masks.area51.pcs = {}
		self.masks.area51.value = 0
		self.masks.area51.dlc = "alienware_alpha"
		self.masks.area51.type = "helmet"
		self.masks.area51.sort_number = 5
		self.masks.alien_helmet = {}
		self.masks.alien_helmet.unit = "units/pd2_dlc_alienware/masks/alien_helmet/msk_alien_helmet"
		self.masks.alien_helmet.name_id = "bm_msk_alien_helmet"
		self.masks.alien_helmet.texture_bundle_folder = "alienware_alpha"
		self.masks.alien_helmet.pcs = {}
		self.masks.alien_helmet.value = 0
		self.masks.alien_helmet.dlc = "alienware_alpha"
		self.masks.alien_helmet.type = "helmet"
		self.masks.alien_helmet.default_blueprint = {
			textures = "no_color_full_material",
			materials = "gunmetal"
		}
		self.masks.alien_helmet.sort_number = 5
	end
	self.masks.infamy_lurker = {}
	self.masks.infamy_lurker.unit = "units/pd2_dlc_infamy/masks/msk_infamy_lurker/msk_infamy_lurker"
	self.masks.infamy_lurker.name_id = "bm_msk_infamy_lurker"
	self.masks.infamy_lurker.global_value = "infamy"
	self.masks.infamy_lurker.texture_bundle_folder = "infamous"
	self.masks.infamy_lurker.pcs = {}
	self.masks.infamy_lurker.value = 0
	self.masks.infamy_lurker.infamy_lock = "infamy_maskpack_lurker"
	self.masks.infamy_hood = {}
	self.masks.infamy_hood.unit = "units/pd2_dlc_infamy/masks/msk_infamy_hood/msk_infamy_hood"
	self.masks.infamy_hood.name_id = "bm_msk_infamy_hood"
	self.masks.infamy_hood.global_value = "infamy"
	self.masks.infamy_hood.texture_bundle_folder = "infamous"
	self.masks.infamy_hood.pcs = {}
	self.masks.infamy_hood.value = 0
	self.masks.infamy_hood.type = "helmet"
	self.masks.infamy_hood.infamy_lock = "infamy_maskpack_hood"
	self.masks.ranger = {}
	self.masks.ranger.unit = "units/pd2_dlc_infamy/masks/ranger/msk_ranger"
	self.masks.ranger.name_id = "bm_msk_ranger"
	self.masks.ranger.global_value = "infamy"
	self.masks.ranger.texture_bundle_folder = "infamous"
	self.masks.ranger.pcs = {}
	self.masks.ranger.value = 0
	self.masks.ranger.type = "helmet"
	self.masks.ranger.infamy_lock = "infamy_maskpack_ranger"
	self.masks.punk = {}
	self.masks.punk.unit = "units/pd2_dlc_infamy/masks/punk/msk_punk"
	self.masks.punk.name_id = "bm_msk_punk"
	self.masks.punk.global_value = "infamy"
	self.masks.punk.texture_bundle_folder = "infamous"
	self.masks.punk.pcs = {}
	self.masks.punk.value = 0
	self.masks.punk.infamy_lock = "infamy_maskpack_punk"
	self.masks.daft = {}
	self.masks.daft.unit = "units/pd2_dlc_infamy/masks/daft/msk_daft"
	self.masks.daft.name_id = "bm_msk_daft"
	self.masks.daft.global_value = "infamy"
	self.masks.daft.texture_bundle_folder = "infamous"
	self.masks.daft.pcs = {}
	self.masks.daft.value = 0
	self.masks.daft.infamy_lock = "infamy_maskpack_daft"
	self.masks.pain = {}
	self.masks.pain.unit = "units/pd2_dlc_infamy/masks/pain/msk_pain"
	self.masks.pain.name_id = "bm_msk_pain"
	self.masks.pain.global_value = "infamy"
	self.masks.pain.texture_bundle_folder = "infamous"
	self.masks.pain.pcs = {}
	self.masks.pain.value = 0
	self.masks.pain.type = "helmet"
	self.masks.pain.skip_mask_on_sequence = true
	self.masks.pain.infamy_lock = "infamy_maskpack_pain"
	self.masks.destroyer = {}
	self.masks.destroyer.unit = "units/pd2_dlc_infamy/masks/destroyer/msk_destroyer"
	self.masks.destroyer.name_id = "bm_msk_destroyer"
	self.masks.destroyer.global_value = "infamy"
	self.masks.destroyer.texture_bundle_folder = "infamous"
	self.masks.destroyer.pcs = {}
	self.masks.destroyer.value = 0
	self.masks.destroyer.infamy_lock = "infamy_maskpack_destroyer"
	self.masks.balaclava_chains = {}
	self.masks.balaclava_chains.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_chains/msk_balaclava_chains"
	self.masks.balaclava_chains.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_chains.type = "helmet"
	self.masks.balaclava_chains.inaccessible = true
	self.masks.balaclava_wolf = {}
	self.masks.balaclava_wolf.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_wolf/msk_balaclava_wolf"
	self.masks.balaclava_wolf.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_wolf.type = "helmet"
	self.masks.balaclava_wolf.inaccessible = true
	self.masks.balaclava_clover = {}
	self.masks.balaclava_clover.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_clover/msk_balaclava_clover"
	self.masks.balaclava_clover.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_clover.type = "helmet"
	self.masks.balaclava_clover.inaccessible = true
	self.masks.balaclava_dallas = {}
	self.masks.balaclava_dallas.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dallas/msk_balaclava_dallas"
	self.masks.balaclava_dallas.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_dallas.type = "helmet"
	self.masks.balaclava_dallas.inaccessible = true
	self.masks.balaclava_dragan = {}
	self.masks.balaclava_dragan.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dragan/msk_balaclava_dragan"
	self.masks.balaclava_dragan.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_dragan.type = "helmet"
	self.masks.balaclava_dragan.inaccessible = true
	self.masks.balaclava_hoxton = {}
	self.masks.balaclava_hoxton.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_hoxton/msk_balaclava_hoxton"
	self.masks.balaclava_hoxton.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_hoxton.type = "helmet"
	self.masks.balaclava_hoxton.inaccessible = true
	self.masks.balaclava_john_wick = {}
	self.masks.balaclava_john_wick.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_john_wick/msk_balaclava_john_wick"
	self.masks.balaclava_john_wick.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_john_wick.type = "helmet"
	self.masks.balaclava_john_wick.inaccessible = true
	self.masks.balaclava_sokol = {}
	self.masks.balaclava_sokol.unit = "units/pd2_dlc_character_sokol/masks/msk_balaclava_sokol/msk_balaclava_sokol"
	self.masks.balaclava_sokol.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_sokol.type = "helmet"
	self.masks.balaclava_sokol.inaccessible = true
	self.masks.balaclava = {}
	self.masks.balaclava.name_id = "bm_msk_balaclava"
	self.masks.balaclava.global_value = "infamy"
	self.masks.balaclava.value = 0
	self.masks.balaclava.pcs = {}
	self.masks.balaclava.type = "helmet"
	self.masks.balaclava.texture_bundle_folder = "infamous"
	self.masks.balaclava.infamy_lock = "infamy_maskpack_balaclava"
	self.masks.balaclava.characters = {
		dallas = "balaclava_dallas",
		wolf = "balaclava_wolf",
		hoxton = "balaclava_dragan",
		chains = "balaclava_chains",
		jowi = "balaclava_john_wick",
		old_hoxton = "balaclava_hoxton",
		female_1 = "balaclava_clover",
		dragan = "balaclava_dragan",
		jacket = "balaclava_wolf",
		bonnie = "balaclava_dallas",
		sokol = "balaclava_sokol",
		dragon = "balaclava_dallas"
	}
	self.masks.the_overkill_mask = {}
	self.masks.the_overkill_mask.unit = "units/pd2_dlc_overkill_pack/masks/msk_the_overkill_mask/msk_the_overkill_mask"
	self.masks.the_overkill_mask.name_id = "bm_msk_the_overkill_mask"
	self.masks.the_overkill_mask.pcs = {}
	self.masks.the_overkill_mask.value = 0
	self.masks.the_overkill_mask.dlc = "overkill_pack"
	self.masks.the_overkill_mask.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.the_overkill_mask.type = "glasses"
	self.masks.dallas_glow = {}
	self.masks.dallas_glow.unit = "units/pd2_dlc_cop/masks/msk_dallas_glow/msk_dallas_glow"
	self.masks.dallas_glow.name_id = "bm_msk_dallas_glow"
	self.masks.dallas_glow.pcs = {}
	self.masks.dallas_glow.dlc = "complete_overkill_pack"
	self.masks.dallas_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.dallas_glow.value = 0
	self.masks.wolf_glow = {}
	self.masks.wolf_glow.unit = "units/pd2_dlc_cop/masks/msk_wolf_glow/msk_wolf_glow"
	self.masks.wolf_glow.name_id = "bm_msk_wolf_glow"
	self.masks.wolf_glow.pcs = {}
	self.masks.wolf_glow.dlc = "complete_overkill_pack"
	self.masks.wolf_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.wolf_glow.value = 0
	self.masks.hoxton_glow = {}
	self.masks.hoxton_glow.unit = "units/pd2_dlc_cop/masks/msk_hoxton_glow/msk_hoxton_glow"
	self.masks.hoxton_glow.name_id = "bm_msk_hoxton_glow"
	self.masks.hoxton_glow.pcs = {}
	self.masks.hoxton_glow.dlc = "complete_overkill_pack"
	self.masks.hoxton_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.hoxton_glow.value = 0
	self.masks.chains_glow = {}
	self.masks.chains_glow.unit = "units/pd2_dlc_cop/masks/msk_chains_glow/msk_chains_glow"
	self.masks.chains_glow.name_id = "bm_msk_chains_glow"
	self.masks.chains_glow.pcs = {}
	self.masks.chains_glow.dlc = "complete_overkill_pack"
	self.masks.chains_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.chains_glow.value = 0
	self.masks.jake = {}
	self.masks.jake.unit = "units/pd2_dlc_hotline2/masks/jake/msk_jake"
	self.masks.jake.name_id = "bm_msk_jake"
	self.masks.jake.pcs = {}
	self.masks.jake.texture_bundle_folder = "hlm2"
	self.masks.jake.dlc = "hlm2"
	self.masks.jake.value = 0
	self.masks.richter = {}
	self.masks.richter.unit = "units/pd2_dlc_hotline2/masks/richter/msk_richter"
	self.masks.richter.name_id = "bm_msk_richter"
	self.masks.richter.pcs = {}
	self.masks.richter.texture_bundle_folder = "hlm2"
	self.masks.richter.dlc = "hlm2"
	self.masks.richter.value = 0
	self.masks.biker = {}
	self.masks.biker.unit = "units/pd2_dlc_hotline2/masks/biker/msk_biker"
	self.masks.biker.name_id = "bm_msk_biker"
	self.masks.biker.pcs = {}
	self.masks.biker.texture_bundle_folder = "hlm2"
	self.masks.biker.dlc = "hlm2"
	self.masks.biker.value = 0
	self.masks.biker.type = "helmet"
	self.masks.alex = {}
	self.masks.alex.unit = "units/pd2_dlc_hotline2/masks/alex/msk_alex"
	self.masks.alex.name_id = "bm_msk_alex"
	self.masks.alex.pcs = {}
	self.masks.alex.texture_bundle_folder = "hlm2"
	self.masks.alex.dlc = "hlm2"
	self.masks.alex.value = 0
	self.masks.corey = {}
	self.masks.corey.unit = "units/pd2_dlc_hotline2/masks/corey/msk_corey"
	self.masks.corey.name_id = "bm_msk_corey"
	self.masks.corey.pcs = {}
	self.masks.corey.texture_bundle_folder = "hlm2"
	self.masks.corey.dlc = "hlm2"
	self.masks.corey.value = 0
	self.masks.tonys_revenge = {}
	self.masks.tonys_revenge.unit = "units/pd2_dlc_hotline2/masks/tonys_revenge/msk_tonys_revenge"
	self.masks.tonys_revenge.name_id = "bm_msk_tonys_revenge"
	self.masks.tonys_revenge.pcs = {}
	self.masks.tonys_revenge.texture_bundle_folder = "hlm2"
	self.masks.tonys_revenge.dlc = "hlm2"
	self.masks.tonys_revenge.value = 0
	self.masks.richard_returns = {}
	self.masks.richard_returns.unit = "units/pd2_dlc_hotline2/masks/richard_returns/msk_richard_returns"
	self.masks.richard_returns.name_id = "bm_msk_richard_returns"
	self.masks.richard_returns.pcs = {}
	self.masks.richard_returns.texture_bundle_folder = "hlm2"
	self.masks.richard_returns.dlc = "hlm2_deluxe"
	self.masks.richard_returns.value = 0
	self.masks.richard_returns.type = "helmet"
	self.masks.richard_begins = {}
	self.masks.richard_begins.unit = "units/pd2_dlc_hotline2/masks/richard_begins/msk_richard_begins"
	self.masks.richard_begins.name_id = "bm_msk_richard_begins"
	self.masks.richard_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.richard_begins.texture_bundle_folder = "hlm2"
	self.masks.richard_begins.dlc = "hlm2_deluxe"
	self.masks.richard_begins.value = 0
	self.masks.richard_begins.type = "helmet"
	self.masks.simpson = {}
	self.masks.simpson.unit = "units/pd2_dlc_cage/masks/simpson/msk_simpson"
	self.masks.simpson.name_id = "bm_msk_simpson"
	self.masks.simpson.pcs = {}
	self.masks.simpson.type = "helmet"
	self.masks.simpson.value = 0
	self.masks.hothead = {}
	self.masks.hothead.unit = "units/pd2_speedrunners/masks/hothead/msk_hothead"
	self.masks.hothead.name_id = "bm_msk_hothead"
	self.masks.hothead.pcs = {}
	self.masks.hothead.texture_bundle_folder = "speedrunners"
	self.masks.hothead.dlc = "speedrunners"
	self.masks.hothead.value = 0
	self.masks.falcon = {}
	self.masks.falcon.unit = "units/pd2_speedrunners/masks/falcon/msk_falcon"
	self.masks.falcon.name_id = "bm_msk_falcon"
	self.masks.falcon.pcs = {}
	self.masks.falcon.type = "helmet"
	self.masks.falcon.texture_bundle_folder = "speedrunners"
	self.masks.falcon.dlc = "speedrunners"
	self.masks.falcon.value = 0
	self.masks.unic = {}
	self.masks.unic.unit = "units/pd2_speedrunners/masks/unic/msk_unic"
	self.masks.unic.name_id = "bm_msk_unic"
	self.masks.unic.pcs = {}
	self.masks.unic.type = "helmet"
	self.masks.unic.texture_bundle_folder = "speedrunners"
	self.masks.unic.dlc = "speedrunners"
	self.masks.unic.value = 0
	self.masks.speedrunner = {}
	self.masks.speedrunner.unit = "units/pd2_speedrunners/masks/speedrunner/msk_speedrunner"
	self.masks.speedrunner.name_id = "bm_msk_speedrunner"
	self.masks.speedrunner.pcs = {}
	self.masks.speedrunner.type = "helmet"
	self.masks.speedrunner.texture_bundle_folder = "speedrunners"
	self.masks.speedrunner.dlc = "speedrunners"
	self.masks.speedrunner.value = 0
	self.masks.hectors_helmet = {}
	self.masks.hectors_helmet.unit = "units/pd2_mcmansion/masks/msk_hectors_helmet/msk_hectors_helmet"
	self.masks.hectors_helmet.name_id = "bm_msk_hectors_helmet"
	self.masks.hectors_helmet.type = "helmet"
	self.masks.hectors_helmet.infamous = true
	self.masks.hectors_helmet.pcs = {}
	self.masks.hectors_helmet.value = 0
	self.masks.hectors_helmet.texture_bundle_folder = "hoxton_revenge"
	self.masks.old_hoxton_begins = {}
	self.masks.old_hoxton_begins.unit = "units/pd2_mcmansion/masks/old_hoxton_begins/msk_old_hoxton_begins"
	self.masks.old_hoxton_begins.name_id = "bm_msk_old_hoxton_begins"
	self.masks.old_hoxton_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.old_hoxton_begins.global_value = "infamous"
	self.masks.old_hoxton_begins.value = 0
	self.masks.old_hoxton_begins.texture_bundle_folder = "hoxton_revenge"
	self.masks.firedemon = {}
	self.masks.firedemon.unit = "units/pd2_dlc_bbq/masks/msk_firedemon/msk_firedemon"
	self.masks.firedemon.name_id = "bm_msk_firedemon"
	self.masks.firedemon.pcs = {}
	self.masks.firedemon.value = 0
	self.masks.firedemon.dlc = "bbq"
	self.masks.firedemon.texture_bundle_folder = "bbq"
	self.masks.gasmask = {}
	self.masks.gasmask.unit = "units/pd2_dlc_bbq/masks/msk_gasmask/msk_gasmask"
	self.masks.gasmask.name_id = "bm_msk_gasmask"
	self.masks.gasmask.pcs = {}
	self.masks.gasmask.value = 0
	self.masks.gasmask.dlc = "bbq"
	self.masks.gasmask.texture_bundle_folder = "bbq"
	self.masks.firemask = {}
	self.masks.firemask.unit = "units/pd2_dlc_bbq/masks/msk_firemask/msk_firemask"
	self.masks.firemask.name_id = "bm_msk_firemask"
	self.masks.firemask.pcs = {}
	self.masks.firemask.value = 0
	self.masks.firemask.dlc = "bbq"
	self.masks.firemask.texture_bundle_folder = "bbq"
	self.masks.chef_hat = {}
	self.masks.chef_hat.unit = "units/pd2_dlc_bbq/masks/msk_chef_hat/msk_chef_hat"
	self.masks.chef_hat.name_id = "bm_msk_chef_hat"
	self.masks.chef_hat.pcs = {}
	self.masks.chef_hat.value = 0
	self.masks.chef_hat.dlc = "bbq"
	self.masks.chef_hat.texture_bundle_folder = "bbq"
	self.masks.chef_hat.type = "helmet"
	self.masks.bandit = {}
	self.masks.bandit.unit = "units/pd2_dlc_west/masks/msk_bandit/msk_bandit"
	self.masks.bandit.name_id = "bm_msk_bandit"
	self.masks.bandit.pcs = {}
	self.masks.bandit.dlc = "west"
	self.masks.bandit.texture_bundle_folder = "west"
	self.masks.bandit.value = 0
	self.masks.bandit.type = "helmet"
	self.masks.bandit.skip_mask_on_sequence = true
	self.masks.bullskull = {}
	self.masks.bullskull.unit = "units/pd2_dlc_west/masks/msk_bullskull/msk_bullskull"
	self.masks.bullskull.name_id = "bm_msk_bullskull"
	self.masks.bullskull.pcs = {}
	self.masks.bullskull.dlc = "west"
	self.masks.bullskull.texture_bundle_folder = "west"
	self.masks.bullskull.value = 0
	self.masks.kangee = {}
	self.masks.kangee.unit = "units/pd2_dlc_west/masks/msk_kangee/msk_kangee"
	self.masks.kangee.name_id = "bm_msk_kangee"
	self.masks.kangee.pcs = {}
	self.masks.kangee.dlc = "west"
	self.masks.kangee.texture_bundle_folder = "west"
	self.masks.kangee.value = 0
	self.masks.lone = {}
	self.masks.lone.unit = "units/pd2_dlc_west/masks/msk_lone/msk_lone"
	self.masks.lone.name_id = "bm_msk_lone"
	self.masks.lone.pcs = {}
	self.masks.lone.dlc = "west"
	self.masks.lone.texture_bundle_folder = "west"
	self.masks.lone.value = 0
	self.masks.lone.type = "helmet"
	self.masks.lone.skip_mask_on_sequence = true
	self.masks.grendel = {}
	self.masks.grendel.unit = "units/pd2_dlc_shoutout_raid/masks/grendel/msk_grendel"
	self.masks.grendel.name_id = "bm_msk_grendel"
	self.masks.grendel.pcs = {}
	self.masks.grendel.value = 0
	self.masks.grendel.global_value = "infamous"
	self.masks.concert_male = {}
	self.masks.concert_male.unit = "units/pd2_dlc_arena/masks/concert_male/msk_concert_male"
	self.masks.concert_male.name_id = "bm_msk_concert_male"
	self.masks.concert_male.pcs = {}
	self.masks.concert_male.value = 0
	self.masks.concert_male.dlc = "arena"
	self.masks.concert_male.texture_bundle_folder = "dlc_arena"
	self.masks.concert_female = {}
	self.masks.concert_female.unit = "units/pd2_dlc_arena/masks/concert_female/msk_concert_female"
	self.masks.concert_female.name_id = "bm_msk_concert_female"
	self.masks.concert_female.pcs = {}
	self.masks.concert_female.value = 0
	self.masks.concert_female.dlc = "arena"
	self.masks.concert_female.texture_bundle_folder = "dlc_arena"
	self.masks.boombox = {}
	self.masks.boombox.unit = "units/pd2_dlc_arena/masks/boombox/msk_boombox"
	self.masks.boombox.name_id = "bm_msk_boombox"
	self.masks.boombox.pcs = {}
	self.masks.boombox.value = 0
	self.masks.boombox.dlc = "arena"
	self.masks.boombox.texture_bundle_folder = "dlc_arena"
	self.masks.cantus = {}
	self.masks.cantus.unit = "units/pd2_dlc_arena/masks/cantus/msk_cantus"
	self.masks.cantus.name_id = "bm_msk_cantus"
	self.masks.cantus.pcs = {}
	self.masks.cantus.value = 0
	self.masks.cantus.dlc = "arena"
	self.masks.cantus.texture_bundle_folder = "dlc_arena"
	self.masks.titan = {}
	self.masks.titan.unit = "units/pd2_dlc_humble_summer15/masks/titan/msk_titan"
	self.masks.titan.name_id = "bm_msk_titan"
	self.masks.titan.pcs = {}
	self.masks.titan.value = 0
	self.masks.titan.dlc = "humble_pack3"
	self.masks.titan.texture_bundle_folder = "humble_summer_2015"
	self.masks.titan.sort_number = 6
	self.masks.pokachu = {}
	self.masks.pokachu.unit = "units/pd2_dlc_humble_summer15/masks/pokachu/msk_pokachu"
	self.masks.pokachu.name_id = "bm_msk_pokachu"
	self.masks.pokachu.pcs = {}
	self.masks.pokachu.value = 0
	self.masks.pokachu.dlc = "humble_pack3"
	self.masks.pokachu.texture_bundle_folder = "humble_summer_2015"
	self.masks.pokachu.sort_number = 6
	self.masks.moon = {}
	self.masks.moon.unit = "units/pd2_dlc_humble_summer15/masks/moon/msk_moon"
	self.masks.moon.name_id = "bm_msk_moon"
	self.masks.moon.pcs = {}
	self.masks.moon.value = 0
	self.masks.moon.dlc = "humble_pack4"
	self.masks.moon.texture_bundle_folder = "humble_summer_2015"
	self.masks.moon.sort_number = 7
	self.masks.borsuk = {}
	self.masks.borsuk.unit = "units/pd2_dlc_humble_summer15/masks/borsuk/msk_borsuk"
	self.masks.borsuk.name_id = "bm_msk_borsuk"
	self.masks.borsuk.pcs = {}
	self.masks.borsuk.value = 0
	self.masks.borsuk.dlc = "humble_pack4"
	self.masks.borsuk.texture_bundle_folder = "humble_summer_2015"
	self.masks.borsuk.sort_number = 7
	self.masks.card_jack = {}
	self.masks.card_jack.unit = "units/pd2_dlc_playingcards/masks/msk_card_jack/msk_card_jack"
	self.masks.card_jack.name_id = "bm_msk_card_jack"
	self.masks.card_jack.pcs = {}
	self.masks.card_jack.dlc = "e3_s15a"
	self.masks.card_jack.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_jack.value = 0
	self.masks.card_jack.sort_number = 8
	self.masks.card_queen = {}
	self.masks.card_queen.unit = "units/pd2_dlc_playingcards/masks/msk_card_queen/msk_card_queen"
	self.masks.card_queen.name_id = "bm_msk_card_queen"
	self.masks.card_queen.pcs = {}
	self.masks.card_queen.dlc = "e3_s15b"
	self.masks.card_queen.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_queen.value = 0
	self.masks.card_queen.sort_number = 8
	self.masks.card_king = {}
	self.masks.card_king.unit = "units/pd2_dlc_playingcards/masks/msk_card_king/msk_card_king"
	self.masks.card_king.name_id = "bm_msk_card_king"
	self.masks.card_king.pcs = {}
	self.masks.card_king.dlc = "e3_s15c"
	self.masks.card_king.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_king.value = 0
	self.masks.card_king.sort_number = 8
	self.masks.card_joker = {}
	self.masks.card_joker.unit = "units/pd2_dlc_playingcards/masks/msk_card_joker/msk_card_joker"
	self.masks.card_joker.name_id = "bm_msk_card_joker"
	self.masks.card_joker.pcs = {}
	self.masks.card_joker.dlc = "e3_s15d"
	self.masks.card_joker.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_joker.value = 0
	self.masks.card_joker.sort_number = 8
	self.masks.sokol = {}
	self.masks.sokol.unit = "units/pd2_dlc_character_sokol/masks/sokol/msk_sokol"
	self.masks.sokol.name_id = "bm_msk_sokol"
	self.masks.sokol.pcs = {}
	self.masks.sokol.value = 0
	self.masks.sokol.texture_bundle_folder = "character_pack_sokol"
	self.masks.sokol.dlc = "character_pack_sokol"
	self.masks.sokol_begins = {}
	self.masks.sokol_begins.unit = "units/pd2_dlc_character_sokol/masks/sokol_begins/msk_sokol_begins"
	self.masks.sokol_begins.name_id = "bm_msk_sokol_begins"
	self.masks.sokol_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sokol_begins.value = 0
	self.masks.sokol_begins.texture_bundle_folder = "character_pack_sokol"
	self.masks.sokol_begins.dlc = "character_pack_sokol"
	self.masks.jiro = {}
	self.masks.jiro.unit = "units/pd2_dlc_dragon/masks/jiro/msk_jiro"
	self.masks.jiro.name_id = "bm_msk_jiro"
	self.masks.jiro.pcs = {}
	self.masks.jiro.value = 0
	self.masks.jiro.texture_bundle_folder = "dragon"
	self.masks.jiro.dlc = "dragon"
	self.masks.jiro_begins = {}
	self.masks.jiro_begins.unit = "units/pd2_dlc_dragon/masks/jiro_begins/msk_jiro_begins"
	self.masks.jiro_begins.name_id = "bm_msk_jiro_begins"
	self.masks.jiro_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jiro_begins.value = 0
	self.masks.jiro_begins.texture_bundle_folder = "dragon"
	self.masks.jiro_begins.dlc = "dragon"
	self.masks.croupier_hat = {}
	self.masks.croupier_hat.unit = "units/pd2_dlc_casino/masks/msk_croupier_hat/msk_croupier_hat"
	self.masks.croupier_hat.name_id = "bm_msk_croupier_hat"
	self.masks.croupier_hat.pcs = {}
	self.masks.croupier_hat.value = 0
	self.masks.croupier_hat.dlc = "kenaz"
	self.masks.croupier_hat.texture_bundle_folder = "kenaz"
	self.masks.croupier_hat.type = "glasses"
	self.masks.gladiator_helmet = {}
	self.masks.gladiator_helmet.unit = "units/pd2_dlc_casino/masks/msk_gladiator/msk_gladiator"
	self.masks.gladiator_helmet.name_id = "bm_msk_gladiator_helmet"
	self.masks.gladiator_helmet.pcs = {}
	self.masks.gladiator_helmet.value = 0
	self.masks.gladiator_helmet.dlc = "kenaz"
	self.masks.gladiator_helmet.texture_bundle_folder = "kenaz"
	self.masks.gladiator_helmet.type = "helmet"
	self.masks.the_king_mask = {}
	self.masks.the_king_mask.unit = "units/pd2_dlc_casino/masks/msk_the_king/msk_the_king"
	self.masks.the_king_mask.name_id = "bm_msk_the_king_mask"
	self.masks.the_king_mask.pcs = {}
	self.masks.the_king_mask.value = 0
	self.masks.the_king_mask.dlc = "kenaz"
	self.masks.the_king_mask.texture_bundle_folder = "kenaz"
	self.masks.the_king_mask.type = "helmet"
	self.masks.sports_utility_mask = {}
	self.masks.sports_utility_mask.unit = "units/pd2_dlc_casino/masks/msk_sports_utility/msk_sports_utility"
	self.masks.sports_utility_mask.name_id = "bm_msk_sports_utility_mask"
	self.masks.sports_utility_mask.pcs = {}
	self.masks.sports_utility_mask.value = 0
	self.masks.sports_utility_mask.dlc = "kenaz"
	self.masks.sports_utility_mask.texture_bundle_folder = "kenaz"
	self.masks.starvr = {}
	self.masks.starvr.unit = "units/pd2_dlc_humble_summer15/masks/starvr/msk_starvr"
	self.masks.starvr.name_id = "bm_msk_starvr"
	self.masks.starvr.pcs = {}
	self.masks.starvr.value = 0
	self.masks.starvr.infamous = true
	self.masks.starvr.texture_bundle_folder = "humble_summer_2015"
	self.masks.starvr.type = "helmet"
	self.masks.slicer = {}
	self.masks.slicer.unit = "units/pd2_dlc_turtles/masks/slicer/msk_slicer"
	self.masks.slicer.name_id = "bm_msk_slicer"
	self.masks.slicer.pcs = {}
	self.masks.slicer.value = 0
	self.masks.slicer.texture_bundle_folder = "turtles"
	self.masks.slicer.dlc = "turtles"
	self.masks.kage = {}
	self.masks.kage.unit = "units/pd2_dlc_turtles/masks/kage/msk_kage"
	self.masks.kage.name_id = "bm_msk_kage"
	self.masks.kage.pcs = {}
	self.masks.kage.value = 0
	self.masks.kage.texture_bundle_folder = "turtles"
	self.masks.kage.dlc = "turtles"
	self.masks.ninja_hood = {}
	self.masks.ninja_hood.unit = "units/pd2_dlc_turtles/masks/ninja_hood/msk_ninja_hood"
	self.masks.ninja_hood.name_id = "bm_msk_ninja_hood"
	self.masks.ninja_hood.pcs = {}
	self.masks.ninja_hood.value = 0
	self.masks.ninja_hood.type = "helmet"
	self.masks.ninja_hood.texture_bundle_folder = "turtles"
	self.masks.ninja_hood.dlc = "turtles"
	self.masks.shirai = {}
	self.masks.shirai.unit = "units/pd2_dlc_turtles/masks/shirai/msk_shirai"
	self.masks.shirai.name_id = "bm_msk_shirai"
	self.masks.shirai.pcs = {}
	self.masks.shirai.value = 0
	self.masks.shirai.type = "helmet"
	self.masks.shirai.skip_mask_on_sequence = true
	self.masks.shirai.texture_bundle_folder = "turtles"
	self.masks.shirai.dlc = "turtles"
	self.masks.bobblehead_dozer = {}
	self.masks.bobblehead_dozer.unit = "units/pd2_merchandise/masks/msk_bobblehead_dozer/msk_bobblehead_dozer"
	self.masks.bobblehead_dozer.name_id = "bm_msk_bobblehead_dozer"
	self.masks.bobblehead_dozer.pcs = {}
	self.masks.bobblehead_dozer.value = 0
	self.masks.bobblehead_dozer.texture_bundle_folder = "merchandise"
	self.masks.bobblehead_dozer.dlc = "bobblehead"
	self.masks.bobblehead_dozer.type = "helmet"
	self.masks.bobblehead_dozer.sort_number = 9
	self.masks.king_of_jesters = {}
	self.masks.king_of_jesters.unit = "units/pd2_dlc_paydaycon2015/masks/king_of_jesters/msk_king_of_jesters"
	self.masks.king_of_jesters.name_id = "bm_msk_king_of_jesters"
	self.masks.king_of_jesters.pcs = {}
	self.masks.king_of_jesters.dlc = "pdcon_2015"
	self.masks.king_of_jesters.value = 0
	self.masks.king_of_jesters.sort_number = 9
	self.masks.mason_knight_veteran = {}
	self.masks.mason_knight_veteran.unit = "units/pd2_dlc_steel/masks/mason_knight_veteran/msk_mason_knight_veteran"
	self.masks.mason_knight_veteran.name_id = "bm_msk_mason_knight_veteran"
	self.masks.mason_knight_veteran.pcs = {}
	self.masks.mason_knight_veteran.value = 0
	self.masks.mason_knight_veteran.dlc = "steel"
	self.masks.mason_knight_veteran.texture_bundle_folder = "steel"
	self.masks.mason_knight_veteran.type = "helmet"
	self.masks.agatha_knight = {}
	self.masks.agatha_knight.unit = "units/pd2_dlc_steel/masks/agatha_knight/msk_agatha_knight"
	self.masks.agatha_knight.name_id = "bm_msk_agatha_knight"
	self.masks.agatha_knight.pcs = {}
	self.masks.agatha_knight.value = 0
	self.masks.agatha_knight.dlc = "steel"
	self.masks.agatha_knight.texture_bundle_folder = "steel"
	self.masks.agatha_knight.type = "helmet"
	self.masks.agatha_vanguard_veteran = {}
	self.masks.agatha_vanguard_veteran.unit = "units/pd2_dlc_steel/masks/agatha_vanguard_veteran/msk_agatha_vanguard_veteran"
	self.masks.agatha_vanguard_veteran.name_id = "bm_msk_agatha_vanguard_veteran"
	self.masks.agatha_vanguard_veteran.pcs = {}
	self.masks.agatha_vanguard_veteran.value = 0
	self.masks.agatha_vanguard_veteran.dlc = "steel"
	self.masks.agatha_vanguard_veteran.texture_bundle_folder = "steel"
	self.masks.agatha_vanguard_veteran.type = "helmet"
	self.masks.mason_vanguard_veteran = {}
	self.masks.mason_vanguard_veteran.unit = "units/pd2_dlc_steel/masks/mason_vanguard_veteran/msk_mason_vanguard_veteran"
	self.masks.mason_vanguard_veteran.name_id = "bm_msk_mason_vanguard_veteran"
	self.masks.mason_vanguard_veteran.pcs = {}
	self.masks.mason_vanguard_veteran.value = 0
	self.masks.mason_vanguard_veteran.dlc = "steel"
	self.masks.mason_vanguard_veteran.texture_bundle_folder = "steel"
	self.masks.mason_vanguard_veteran.type = "helmet"
	self.masks.rus_hat = {}
	self.masks.rus_hat.unit = "units/pd2_crimefest_2015/update_2/masks/rus_hat/msk_rus_hat"
	self.masks.rus_hat.name_id = "bm_msk_rus_hat"
	self.masks.rus_hat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rus_hat.sort_number = 8
	self.masks.rus_hat.value = 0
	self.masks.rus_hat.type = "helmet"
	self.masks.sputnik = {}
	self.masks.sputnik.unit = "units/pd2_crimefest_2015/update_2/masks/sputnik/msk_sputnik"
	self.masks.sputnik.name_id = "bm_msk_sputnik"
	self.masks.sputnik.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sputnik.sort_number = 8
	self.masks.sputnik.value = 0
	self.masks.sputnik.type = "helmet"
	self.masks.tiara = {}
	self.masks.tiara.unit = "units/pd2_crimefest_2015/update_2/masks/tiara/msk_tiara"
	self.masks.tiara.name_id = "bm_msk_tiara"
	self.masks.tiara.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.tiara.sort_number = 8
	self.masks.tiara.value = 0
	self.masks.tiara.type = "tiara"
	self.masks.tiara.skip_mask_on_sequence = true
	self.masks.baba_yaga = {}
	self.masks.baba_yaga.unit = "units/pd2_crimefest_2015/update_2/masks/baba_yaga/msk_baba_yaga"
	self.masks.baba_yaga.name_id = "bm_msk_baba_yaga"
	self.masks.baba_yaga.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.baba_yaga.sort_number = 8
	self.masks.baba_yaga.value = 0
	self.masks.vlad_armor = {}
	self.masks.vlad_armor.unit = "units/pd2_crimefest_2015/update_2/masks/vlad_armor/msk_vlad_armor"
	self.masks.vlad_armor.name_id = "bm_msk_vlad_armor"
	self.masks.vlad_armor.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.vlad_armor.value = 0
	self.masks.vlad_armor.sort_number = 8
	self.masks.vlad_armor.type = "helmet"
	self.masks.lcv = {}
	self.masks.lcv.unit = "units/pd2_dlc_rave/masks/msk_lcv"
	self.masks.lcv.name_id = "bm_msk_lcv"
	self.masks.lcv.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.lcv.value = 0
	self.masks.lcv.sort_number = 9
	self.masks.lcv.texture_bundle_folder = "rave"
	self.masks.pirate_skull = {}
	self.masks.pirate_skull.unit = "units/pd2_crimefest_2015/update_8/masks/pirate_skull/msk_pirate_skull"
	self.masks.pirate_skull.name_id = "bm_msk_pirate_skull"
	self.masks.pirate_skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.pirate_skull.value = 0
	self.masks.pirate_skull.sort_number = 10
	self.masks.pirate_skull.type = "helmet"
	self.masks.fatboy = {}
	self.masks.fatboy.unit = "units/pd2_crimefest_2015/update_8/masks/msk_fatboy/msk_fatboy"
	self.masks.fatboy.name_id = "bm_msk_fatboy"
	self.masks.fatboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.fatboy.value = 0
	self.masks.fatboy.sort_number = 10
	self.masks.oliver = {}
	self.masks.oliver.unit = "units/pd2_crimefest_2015/update_8/masks/oliver/msk_oliver"
	self.masks.oliver.name_id = "bm_msk_oliver"
	self.masks.oliver.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.oliver.value = 0
	self.masks.oliver.sort_number = 10
	self.masks.oliver.default_blueprint = {
		textures = "no_color_full_material",
		materials = "deep_bronze"
	}
	self.masks.eggian = {}
	self.masks.eggian.unit = "units/pd2_crimefest_2015/update_8/masks/eggian/msk_eggian"
	self.masks.eggian.name_id = "bm_msk_eggian"
	self.masks.eggian.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.eggian.value = 0
	self.masks.eggian.sort_number = 10
	self.masks.groucho_glasses = {}
	self.masks.groucho_glasses.unit = "units/pd2_crimefest_2015/update_9/masks/msk_groucho_glasses/msk_groucho_glasses"
	self.masks.groucho_glasses.name_id = "bm_msk_groucho"
	self.masks.groucho_glasses.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.groucho_glasses.value = 0
	self.masks.groucho_glasses.type = "glasses"
	self.masks.groucho_glasses.sort_number = 11
	self.masks.groucho_glasses.skip_mask_on_sequence = true
	self.masks.glasses_tinted_love = {}
	self.masks.glasses_tinted_love.unit = "units/pd2_crimefest_2015/update_9/masks/msk_tinted_love/msk_glasses_tinted_love"
	self.masks.glasses_tinted_love.name_id = "bm_msk_tinted_love"
	self.masks.glasses_tinted_love.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.glasses_tinted_love.value = 0
	self.masks.glasses_tinted_love.type = "glasses"
	self.masks.glasses_tinted_love.sort_number = 11
	self.masks.glasses_tinted_love.skip_mask_on_sequence = true
	self.masks.baitface = {}
	self.masks.baitface.unit = "units/pd2_crimefest_2015/update_10/masks/baitface/msk_baitface"
	self.masks.baitface.name_id = "bm_msk_baitface"
	self.masks.baitface.pcs = {}
	self.masks.baitface.value = 0
	self.masks.baitface.sort_number = 12
	self.masks.nomegusta = {}
	self.masks.nomegusta.unit = "units/pd2_crimefest_2015/update_10/masks/nomegusta/msk_nomegusta"
	self.masks.nomegusta.name_id = "bm_msk_nomegusta"
	self.masks.nomegusta.pcs = {}
	self.masks.nomegusta.value = 0
	self.masks.nomegusta.sort_number = 12
	self.masks.rageface = {}
	self.masks.rageface.unit = "units/pd2_crimefest_2015/update_10/masks/rageface/msk_rageface"
	self.masks.rageface.name_id = "bm_msk_rageface"
	self.masks.rageface.pcs = {}
	self.masks.rageface.value = 0
	self.masks.rageface.sort_number = 12
	self.masks.dawg = {}
	self.masks.dawg.unit = "units/pd2_crimefest_2015/update_10/masks/msk_dawg/msk_dawg"
	self.masks.dawg.name_id = "bm_msk_dawg"
	self.masks.dawg.pcs = {}
	self.masks.dawg.value = 0
	self.masks.dawg.sort_number = 12
	self.masks.invader = {}
	self.masks.invader.unit = "units/pd2_dlc_nails/masks/invader/msk_invader"
	self.masks.invader.name_id = "bm_msk_invader"
	self.masks.invader.pcs = {}
	self.masks.invader.global_value = "halloween"
	self.masks.invader.texture_bundle_folder = "nails"
	self.masks.invader.sort_number = 3
	self.masks.invader.value = 0
	self.masks.satan = {}
	self.masks.satan.unit = "units/pd2_dlc_nails/masks/satan/msk_satan"
	self.masks.satan.name_id = "bm_msk_satan"
	self.masks.satan.pcs = {}
	self.masks.satan.global_value = "halloween"
	self.masks.satan.texture_bundle_folder = "nails"
	self.masks.satan.sort_number = 3
	self.masks.satan.value = 0
	self.masks.tormentor = {}
	self.masks.tormentor.unit = "units/pd2_dlc_tormentor_mask/masks/tormentor/msk_tormentor"
	self.masks.tormentor.name_id = "bm_msk_tormentor"
	self.masks.tormentor.pcs = {}
	self.masks.tormentor.value = 0
	self.masks.tormentor.sort_number = 12
	if SystemInfo:platform() == Idstring("PS3") then
		self.masks.sweettooth = {}
		self.masks.sweettooth.unit = "units/pd2_dlc_consoles/masks/msk_sweettooth/msk_sweettooth"
		self.masks.sweettooth.name_id = "bm_msk_sweettooth"
		self.masks.sweettooth.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.sweettooth.dlc = "sweettooth"
		self.masks.sweettooth.value = 1
		self.masks.sweettooth.texture_bundle_folder = "consoles"
	elseif SystemInfo:platform() == Idstring("X360") then
		self.masks.thespian = {}
		self.masks.thespian.unit = "units/pd2_dlc_consoles/masks/pd2_thespian_mask/msk_thespian"
		self.masks.thespian.name_id = "bm_msk_thespian"
		self.masks.thespian.pcs = {}
		self.masks.thespian.value = 0
		self.masks.thespian.type = "helmet"
		self.masks.thespian.texture_bundle_folder = "consoles"
	elseif SystemInfo:platform() == Idstring("PS4") then
		self.masks.finger = {}
		self.masks.finger.unit = "units/pd2_nextgen/masks/finger/msk_finger"
		self.masks.finger.name_id = "bm_msk_finger"
		self.masks.finger.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.finger.dlc = "preorder"
		self.masks.finger.value = 7
		self.masks.finger.texture_bundle_folder = "nextgen"
	elseif SystemInfo:platform() == Idstring("XB1") then
		self.masks.instinct = {}
		self.masks.instinct.unit = "units/pd2_nextgen/masks/instinct/msk_instinct"
		self.masks.instinct.name_id = "bm_msk_instinct"
		self.masks.instinct.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.instinct.dlc = "preorder"
		self.masks.instinct.value = 7
		self.masks.instinct.texture_bundle_folder = "nextgen"
		self.masks.unforsaken = {}
		self.masks.unforsaken.unit = "units/pd2_nextgen/masks/unforsaken/msk_unforsaken"
		self.masks.unforsaken.name_id = "bm_msk_unforsaken"
		self.masks.unforsaken.pcs = {}
		self.masks.unforsaken.value = 0
		self.masks.unforsaken.infamous = true
		self.masks.unforsaken.texture_bundle_folder = "nextgen"
	end
	self:_add_desc_from_name_macro(self.masks)
end
