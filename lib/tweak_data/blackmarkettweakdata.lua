BlackMarketTweakData = BlackMarketTweakData or class()
local is_nextgen_console = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1")
function BlackMarketTweakData:init(tweak_data)
	self:_init_colors()
	self:_init_materials()
	self:_init_textures()
	self:_init_masks()
	self:_init_characters()
	self:_init_cash()
	self:_init_xp()
	self:_init_weapon_mods(tweak_data)
	self:_init_armors()
	self:_init_deployables(tweak_data)
	self:_init_projectiles()
	self:_init_melee_weapons()
end
function BlackMarketTweakData:print_missing_strings(skip_print_id)
	if Application:production_build() then
		local ignore_name = {"xp", "cash"}
		local ignore_desc = {
			"xp",
			"cash",
			"weapon_mods",
			"melee_weapons"
		}
		for id, data in pairs(self) do
			for i, d in pairs(data) do
				if id ~= "weapon_mods" or tweak_data.weapon.factory.parts[i].pc or tweak_data.weapon.factory.parts[i].pcs then
					local name_id = d.name_id
					if not table.contains(ignore_name, id) and name_id and not managers.localization:exists(name_id) then
						if skip_print_id then
							Application:debug(name_id)
						else
							Application:debug(name_id, "", "", id)
						end
					end
					local desc_id = d.desc_id
					if not table.contains(ignore_desc, id) and desc_id and not managers.localization:exists(desc_id) then
						if skip_print_id then
							Application:debug(desc_id)
						else
							Application:debug(desc_id, "", "", id)
						end
					end
				end
			end
		end
	end
end
function BlackMarketTweakData:_add_desc_from_name_macro(tweak_data)
	for id, data in pairs(tweak_data) do
		if data.name_id and not data.desc_id then
			data.desc_id = tostring(data.name_id) .. "_desc"
		end
		if not data.name_id then
		end
	end
end
function BlackMarketTweakData:_init_weapon_mods(tweak_data)
	self.weapon_mods = {}
	for id, data in pairs(tweak_data.weapon.factory.parts) do
		if is_nextgen_console then
			data.is_a_unlockable = nil
		end
		self.weapon_mods[id] = {
			max_in_inventory = data.is_a_unlockable and 1 or 2,
			pc = data.pc,
			pcs = data.pcs,
			dlc = data.dlc,
			dlcs = data.dlcs,
			name_id = data.name_id,
			desc_id = data.desc_id,
			infamous = data.infamous,
			value = data.stats and data.stats.value or 1,
			weight = data.weight,
			texture_bundle_folder = data.texture_bundle_folder,
			is_a_unlockable = data.is_a_unlockable
		}
	end
	self:_add_desc_from_name_macro(self.weapon_mods)
	if Application:production_build() and managers.lootdrop then
		managers.lootdrop:add_qlvl_to_weapon_mods(self.weapon_mods)
	end
end
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
	if SystemInfo:platform() == Idstring("PS3") then
		self.masks.sweettooth = {}
		self.masks.sweettooth.unit = "units/payday2/masks/msk_sweettooth/msk_sweettooth"
		self.masks.sweettooth.name_id = "bm_msk_sweettooth"
		self.masks.sweettooth.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.sweettooth.dlc = "sweettooth"
		self.masks.sweettooth.value = 1
	elseif SystemInfo:platform() == Idstring("X360") then
		self.masks.thespian = {}
		self.masks.thespian.unit = "units/pd2_thespian_mask/msk_thespian"
		self.masks.thespian.name_id = "bm_msk_thespian"
		self.masks.thespian.pcs = {}
		self.masks.thespian.value = 0
		self.masks.thespian.type = "helmet"
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
	end
	self:_add_desc_from_name_macro(self.masks)
end
function BlackMarketTweakData:_init_characters()
	self.characters = {}
	self.characters.locked = {}
	self.characters.locked.fps_unit = "units/payday2/characters/fps_mover/fps_mover"
	self.characters.locked.npc_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1"
	self.characters.locked.menu_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1_menu"
	self.characters.locked.sequence = "var_material_01"
	self.characters.locked.name_id = "bm_character_locked"
	self.characters.locked.dallas = {
		sequence = "var_mtr_dallas"
	}
	self.characters.locked.wolf = {
		sequence = "var_mtr_wolf"
	}
	self.characters.locked.hoxton = {
		sequence = "var_mtr_hoxton"
	}
	self.characters.locked.chains = {
		sequence = "var_mtr_chains"
	}
	self.characters.locked.jowi = {
		sequence = "var_mtr_john_wick",
		dlc = "pd2_clan"
	}
	self.characters.locked.old_hoxton = {
		sequence = "var_mtr_old_hoxton",
		dlc = "freed_old_hoxton",
		locks = {dlc = "pd2_clan", achievement = "bulldog_1"}
	}
	self.characters.locked.dragan = {
		sequence = "var_mtr_dragan",
		texture_bundle_folder = "character_pack_dragan",
		dlc = "character_pack_dragan"
	}
	self.characters.locked.jacket = {
		sequence = "var_mtr_jacket",
		texture_bundle_folder = "hlm2",
		dlc = "hlm2_deluxe"
	}
	self.characters.locked.sokol = {
		sequence = "var_mtr_sokol",
		mask_on_sequence = "mask_on_sokol",
		mask_off_sequence = "mask_off_sokol",
		texture_bundle_folder = "character_pack_sokol",
		dlc = "character_pack_sokol"
	}
	self.characters.locked.dragon = {
		sequence = "var_mtr_jiro",
		texture_bundle_folder = "dragon",
		dlc = "dragon"
	}
	self.characters.female_1 = {}
	self.characters.female_1.fps_unit = "units/payday2/characters/fps_mover/fps_female_1_mover"
	self.characters.female_1.npc_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1"
	self.characters.female_1.menu_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1_menu"
	self.characters.female_1.texture_bundle_folder = "character_pack_clover"
	self.characters.female_1.sequence = "var_mtr_fem1"
	self.characters.female_1.mask_on_sequence = "mask_on"
	self.characters.female_1.mask_off_sequence = "mask_off"
	self.characters.female_1.name_id = "bm_character_female_1"
	self.characters.female_1.dlc = "character_pack_clover"
	self.characters.bonnie = {}
	self.characters.bonnie.fps_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fps_bonnie_mover"
	self.characters.bonnie.npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie"
	self.characters.bonnie.menu_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie_menu"
	self.characters.bonnie.texture_bundle_folder = "character_pack_bonnie"
	self.characters.bonnie.sequence = "var_mtr_bonnie"
	self.characters.bonnie.mask_on_sequence = "bonnie_mask_on"
	self.characters.bonnie.mask_off_sequence = "bonnie_mask_off"
	self.characters.bonnie.name_id = "bm_character_bonnie"
	self.characters.bonnie.dlc = "pd2_clan"
	self.characters.ai_hoxton = {}
	self.characters.ai_hoxton.npc_unit = "units/payday2/characters/npc_criminals_suit_1/hoxton/npc_criminal_suit_hoxton"
	self.characters.ai_hoxton.sequence = "var_mtr_hoxton"
	self.characters.ai_hoxton.name_id = "bm_character_ai_hoxton"
	self.characters.ai_chains = {}
	self.characters.ai_chains.npc_unit = "units/payday2/characters/npc_criminals_suit_1/chains/npc_criminal_suit_chains"
	self.characters.ai_chains.sequence = "var_mtr_chains"
	self.characters.ai_chains.name_id = "bm_character_ai_chains"
	self.characters.ai_dallas = {}
	self.characters.ai_dallas.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dallas/npc_criminal_suit_dallas"
	self.characters.ai_dallas.sequence = "var_mtr_dallas"
	self.characters.ai_dallas.name_id = "bm_character_ai_dallas"
	self.characters.ai_wolf = {}
	self.characters.ai_wolf.npc_unit = "units/payday2/characters/npc_criminals_suit_1/wolf/npc_criminal_suit_wolf"
	self.characters.ai_wolf.sequence = "var_mtr_wolf"
	self.characters.ai_wolf.name_id = "bm_character_ai_/wolf"
	self.characters.ai_jowi = {}
	self.characters.ai_jowi.npc_unit = "units/payday2/characters/npc_criminals_suit_1/jowi/npc_criminal_suit_jowi"
	self.characters.ai_jowi.sequence = "var_mtr_john_wick"
	self.characters.ai_jowi.name_id = "bm_character_ai_jowi"
	self.characters.ai_old_hoxton = {}
	self.characters.ai_old_hoxton.npc_unit = "units/payday2/characters/npc_criminals_suit_1/old_hoxton/npc_criminal_suit_old_hoxton"
	self.characters.ai_old_hoxton.sequence = "var_mtr_old_hoxton"
	self.characters.ai_old_hoxton.name_id = "bm_character_ai_old_hoxton"
	self.characters.ai_female_1 = {}
	self.characters.ai_female_1.npc_unit = "units/payday2/characters/npc_criminal_female_1/fem1/npc_criminal_female_fem1"
	self.characters.ai_female_1.sequence = "var_mtr_fem1"
	self.characters.ai_female_1.mask_on_sequence = "mask_on"
	self.characters.ai_female_1.mask_off_sequence = "mask_off"
	self.characters.ai_female_1.name_id = "bm_character_ai_female_1"
	self.characters.ai_dragan = {}
	self.characters.ai_dragan.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragan/npc_criminal_suit_dragan"
	self.characters.ai_dragan.sequence = "var_mtr_dragan"
	self.characters.ai_dragan.name_id = "bm_character_ai_dragan"
	self.characters.ai_jacket = {}
	self.characters.ai_jacket.npc_unit = "units/payday2/characters/npc_criminals_suit_1/jacket/npc_criminal_suit_jacket"
	self.characters.ai_jacket.sequence = "var_mtr_jacket"
	self.characters.ai_jacket.name_id = "bm_character_ai_jacket"
	self.characters.ai_bonnie = {}
	self.characters.ai_bonnie.npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fem1/npc_criminal_female_bonnie_1"
	self.characters.ai_bonnie.sequence = "var_mtr_bonnie"
	self.characters.ai_bonnie.mask_on_sequence = "bonnie_mask_on"
	self.characters.ai_bonnie.mask_off_sequence = "bonnie_mask_off"
	self.characters.ai_bonnie.name_id = "bm_character_ai_bonnie"
	self.characters.ai_sokol = {}
	self.characters.ai_sokol.npc_unit = "units/payday2/characters/npc_criminals_suit_1/sokol/npc_criminal_suit_sokol"
	self.characters.ai_sokol.sequence = "var_mtr_sokol"
	self.characters.ai_sokol.mask_on_sequence = "mask_on_sokol"
	self.characters.ai_sokol.mask_off_sequence = "mask_off_sokol"
	self.characters.ai_sokol.name_id = "bm_character_ai_sokol"
	self.characters.ai_dragon = {}
	self.characters.ai_dragon.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragon/npc_criminal_suit_dragon"
	self.characters.ai_dragon.sequence = "var_mtr_jiro"
end
function BlackMarketTweakData:_init_colors()
	self.colors = {}
	local white = Color.white
	local black = Color.black
	local red = Color.red
	local green = Color.green
	local blue = Color.blue
	local yellow = Color.yellow
	local magenta = Color(255, 255, 0, 255) / 255
	local cyan = Color(255, 0, 255, 255) / 255
	local light_gray = Color(255, 191, 191, 191) / 255
	local gray = Color(255, 128, 128, 128) / 255
	local dark_gray = Color(255, 64, 64, 64) / 255
	local blood_red = Color(255, 138, 17, 9) / 255
	local orange = Color(255, 255, 94, 15) / 255
	local light_brown = Color(255, 204, 115, 35) / 255
	local bright_yellow = Color(255, 255, 207, 76) / 255
	local lime_green = Color(255, 0, 166, 81) / 255
	local purple = Color(255, 154, 68, 220) / 255
	local pink = Color(255, 255, 122, 230) / 255
	local brown = Color(255, 128, 70, 13) / 255
	local navy_blue = Color(255, 40, 52, 86) / 255
	local matte_blue = Color(255, 56, 97, 168) / 255
	local olive_green = Color(255, 72, 90, 50) / 255
	local gray_blue = Color(255, 12, 68, 84) / 255
	local light_blue = Color(255, 126, 198, 238) / 255
	local bone_white = Color(255, 255, 238, 151) / 255
	local turquoise = Color(255, 0, 209, 157) / 255
	local matte_purple = Color(255, 107, 84, 144) / 255
	local coral_red = Color(255, 213, 36, 53) / 255
	local leaf_green = Color(255, 104, 191, 54) / 255
	local dark_green = Color(255, 7, 61, 9) / 255
	local warm_yellow = Color(255, 250, 157, 7) / 255
	local dark_red = Color(255, 110, 15, 22) / 255
	local cobalt_blue = Color(255, 0, 93, 199) / 255
	local toxic_green = Color(255, 167, 248, 87) / 255
	local nothing = Color(0, 0, 0, 0) / 255
	self.colors.white_solid = {}
	self.colors.white_solid.colors = {white, white}
	self.colors.white_solid.name_id = "bm_clr_white_solid"
	self.colors.white_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_solid.value = 7
	self.colors.black_solid = {}
	self.colors.black_solid.colors = {black, black}
	self.colors.black_solid.name_id = "bm_clr_black_solid"
	self.colors.black_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_solid.infamous = true
	self.colors.black_solid.value = 10
	self.colors.red_solid = {}
	self.colors.red_solid.colors = {red, red}
	self.colors.red_solid.name_id = "bm_clr_red_solid"
	self.colors.red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_solid.value = 5
	self.colors.blue_solid = {}
	self.colors.blue_solid.colors = {blue, blue}
	self.colors.blue_solid.name_id = "bm_clr_blue_solid"
	self.colors.blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_solid.value = 8
	self.colors.green_solid = {}
	self.colors.green_solid.colors = {green, green}
	self.colors.green_solid.name_id = "bm_clr_green_solid"
	self.colors.green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_solid.value = 8
	self.colors.cyan_solid = {}
	self.colors.cyan_solid.colors = {cyan, cyan}
	self.colors.cyan_solid.name_id = "bm_clr_cyan_solid"
	self.colors.cyan_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_solid.value = 8
	self.colors.magenta_solid = {}
	self.colors.magenta_solid.colors = {magenta, magenta}
	self.colors.magenta_solid.name_id = "bm_clr_magenta_solid"
	self.colors.magenta_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_solid.infamous = true
	self.colors.magenta_solid.value = 7
	self.colors.yellow_solid = {}
	self.colors.yellow_solid.colors = {yellow, yellow}
	self.colors.yellow_solid.name_id = "bm_clr_yellow_solid"
	self.colors.yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_solid.value = 6
	self.colors.light_gray_solid = {}
	self.colors.light_gray_solid.colors = {light_gray, light_gray}
	self.colors.light_gray_solid.name_id = "bm_clr_light_gray_solid"
	self.colors.light_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_solid.value = 7
	self.colors.dark_gray_solid = {}
	self.colors.dark_gray_solid.colors = {dark_gray, dark_gray}
	self.colors.dark_gray_solid.name_id = "bm_clr_dark_gray_solid"
	self.colors.dark_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_solid.infamous = true
	self.colors.dark_gray_solid.value = 8
	self.colors.gray_solid = {}
	self.colors.gray_solid.colors = {gray, gray}
	self.colors.gray_solid.name_id = "bm_clr_gray_solid"
	self.colors.gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_solid.value = 6
	self.colors.pink_solid = {}
	self.colors.pink_solid.colors = {pink, pink}
	self.colors.pink_solid.name_id = "bm_clr_pink_solid"
	self.colors.pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_solid.infamous = true
	self.colors.pink_solid.value = 7
	self.colors.purple_solid = {}
	self.colors.purple_solid.colors = {purple, purple}
	self.colors.purple_solid.name_id = "bm_clr_purple_solid"
	self.colors.purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_solid.value = 8
	self.colors.blood_red_solid = {}
	self.colors.blood_red_solid.colors = {blood_red, blood_red}
	self.colors.blood_red_solid.name_id = "bm_clr_blood_red_solid"
	self.colors.blood_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_solid.infamous = true
	self.colors.blood_red_solid.value = 9
	self.colors.orange_solid = {}
	self.colors.orange_solid.colors = {orange, orange}
	self.colors.orange_solid.name_id = "bm_clr_orange_solid"
	self.colors.orange_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_solid.value = 8
	self.colors.light_brown_solid = {}
	self.colors.light_brown_solid.colors = {light_brown, light_brown}
	self.colors.light_brown_solid.name_id = "bm_clr_light_brown_solid"
	self.colors.light_brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_solid.value = 6
	self.colors.brown_solid = {}
	self.colors.brown_solid.colors = {brown, brown}
	self.colors.brown_solid.name_id = "bm_clr_brown_solid"
	self.colors.brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.brown_solid.value = 8
	self.colors.navy_blue_solid = {}
	self.colors.navy_blue_solid.colors = {navy_blue, navy_blue}
	self.colors.navy_blue_solid.name_id = "bm_clr_navy_blue_solid"
	self.colors.navy_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_solid.infamous = true
	self.colors.navy_blue_solid.value = 7
	self.colors.light_blue_solid = {}
	self.colors.light_blue_solid.colors = {light_blue, light_blue}
	self.colors.light_blue_solid.name_id = "bm_clr_light_blue_solid"
	self.colors.light_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_solid.value = 5
	self.colors.leaf_green_solid = {}
	self.colors.leaf_green_solid.colors = {leaf_green, leaf_green}
	self.colors.leaf_green_solid.name_id = "bm_clr_leaf_green_solid"
	self.colors.leaf_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_solid.value = 8
	self.colors.warm_yellow_solid = {}
	self.colors.warm_yellow_solid.colors = {warm_yellow, warm_yellow}
	self.colors.warm_yellow_solid.name_id = "bm_clr_warm_yellow_solid"
	self.colors.warm_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_solid.infamous = true
	self.colors.warm_yellow_solid.value = 6
	self.colors.dark_red_solid = {}
	self.colors.dark_red_solid.colors = {dark_red, dark_red}
	self.colors.dark_red_solid.name_id = "bm_clr_dark_red_solid"
	self.colors.dark_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_solid.value = 5
	self.colors.dark_green_solid = {}
	self.colors.dark_green_solid.colors = {dark_green, dark_green}
	self.colors.dark_green_solid.name_id = "bm_clr_dark_green_solid"
	self.colors.dark_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_green_solid.infamous = true
	self.colors.dark_green_solid.value = 6
	self.colors.nothing = {}
	self.colors.nothing.colors = {nothing, nothing}
	self.colors.nothing.name_id = "bm_clr_nothing"
	self.colors.nothing.value = 0
	self.colors.black_white = {}
	self.colors.black_white.colors = {black, white}
	self.colors.black_white.name_id = "bm_clr_black_white"
	self.colors.black_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_white.infamous = true
	self.colors.black_white.value = 3
	self.colors.red_black = {}
	self.colors.red_black.colors = {red, black}
	self.colors.red_black.name_id = "bm_clr_red_black"
	self.colors.red_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_black.dlc = "preorder"
	self.colors.red_black.value = 1
	self.colors.yellow_blue = {}
	self.colors.yellow_blue.colors = {yellow, blue}
	self.colors.yellow_blue.name_id = "bm_clr_yellow_blue"
	self.colors.yellow_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_blue.value = 5
	self.colors.red_blue = {}
	self.colors.red_blue.colors = {red, blue}
	self.colors.red_blue.name_id = "bm_clr_red_blue"
	self.colors.red_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_blue.value = 2
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {light_gray, dark_gray}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 3
	self.colors.magenta_cyan = {}
	self.colors.magenta_cyan.colors = {magenta, cyan}
	self.colors.magenta_cyan.name_id = "bm_clr_magenta_cyan"
	self.colors.magenta_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_cyan.value = 4
	self.colors.green_red = {}
	self.colors.green_red.colors = {green, red}
	self.colors.green_red.name_id = "bm_clr_green_red"
	self.colors.green_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_red.value = 2
	self.colors.orange_blue = {}
	self.colors.orange_blue.colors = {orange, blue}
	self.colors.orange_blue.name_id = "bm_clr_orange_blue"
	self.colors.orange_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_blue.value = 3
	self.colors.green_olive_green = {}
	self.colors.green_olive_green.colors = {green, olive_green}
	self.colors.green_olive_green.name_id = "bm_clr_green_olive_green"
	self.colors.green_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_olive_green.value = 4
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {yellow, orange}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 2
	self.colors.light_brown_matte_blue = {}
	self.colors.light_brown_matte_blue.colors = {light_brown, matte_blue}
	self.colors.light_brown_matte_blue.name_id = "bm_clr_light_brown_matte_blue"
	self.colors.light_brown_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_matte_blue.value = 3
	self.colors.turquoise_purple = {}
	self.colors.turquoise_purple.colors = {turquoise, purple}
	self.colors.turquoise_purple.name_id = "bm_clr_turquoise_purple"
	self.colors.turquoise_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_purple.value = 2
	self.colors.orange_gray_blue = {}
	self.colors.orange_gray_blue.colors = {orange, gray_blue}
	self.colors.orange_gray_blue.name_id = "bm_clr_orange_gray_blue"
	self.colors.orange_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_gray_blue.value = 4
	self.colors.coral_red_matte_blue = {}
	self.colors.coral_red_matte_blue.colors = {coral_red, matte_blue}
	self.colors.coral_red_matte_blue.name_id = "bm_clr_coral_red_matte_blue"
	self.colors.coral_red_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_matte_blue.value = 3
	self.colors.toxic_green_dark_green = {}
	self.colors.toxic_green_dark_green.colors = {toxic_green, dark_green}
	self.colors.toxic_green_dark_green.name_id = "bm_clr_toxic_green_dark_green"
	self.colors.toxic_green_dark_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_dark_green.value = 4
	self.colors.warm_yellow_matte_purple = {}
	self.colors.warm_yellow_matte_purple.colors = {warm_yellow, matte_purple}
	self.colors.warm_yellow_matte_purple.name_id = "bm_clr_warm_yellow_matte_purple"
	self.colors.warm_yellow_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_matte_purple.value = 3
	self.colors.bright_yellow_brown = {}
	self.colors.bright_yellow_brown.colors = {bright_yellow, brown}
	self.colors.bright_yellow_brown.name_id = "bm_clr_bright_yellow_brown"
	self.colors.bright_yellow_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_brown.value = 2
	self.colors.coral_red_lime_green = {}
	self.colors.coral_red_lime_green.colors = {coral_red, lime_green}
	self.colors.coral_red_lime_green.name_id = "bm_clr_coral_red_lime_green"
	self.colors.coral_red_lime_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_lime_green.value = 3
	self.colors.white_matte_blue = {}
	self.colors.white_matte_blue.colors = {white, matte_blue}
	self.colors.white_matte_blue.name_id = "bm_clr_white_matte_blue"
	self.colors.white_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_matte_blue.value = 4
	self.colors.red_dark_red = {}
	self.colors.red_dark_red.colors = {red, dark_red}
	self.colors.red_dark_red.name_id = "bm_clr_red_dark_red"
	self.colors.red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_dark_red.value = 2
	self.colors.bone_white_magenta = {}
	self.colors.bone_white_magenta.colors = {bone_white, magenta}
	self.colors.bone_white_magenta.name_id = "bm_clr_bone_white_magenta"
	self.colors.bone_white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_magenta.value = 3
	self.colors.cobalt_blue_navy_blue = {}
	self.colors.cobalt_blue_navy_blue.colors = {cobalt_blue, navy_blue}
	self.colors.cobalt_blue_navy_blue.name_id = "bm_clr_cobalt_blue_navy_blue"
	self.colors.cobalt_blue_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_navy_blue.value = 4
	self.colors.toxic_green_leaf_green = {}
	self.colors.toxic_green_leaf_green.colors = {toxic_green, leaf_green}
	self.colors.toxic_green_leaf_green.name_id = "bm_clr_toxic_green_leaf_green"
	self.colors.toxic_green_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_leaf_green.value = 2
	self.colors.light_brown_brown = {}
	self.colors.light_brown_brown.colors = {light_brown, brown}
	self.colors.light_brown_brown.name_id = "bm_clr_light_brown_brown"
	self.colors.light_brown_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_brown.value = 3
	self.colors.bright_yellow_turquoise = {}
	self.colors.bright_yellow_turquoise.colors = {bright_yellow, turquoise}
	self.colors.bright_yellow_turquoise.name_id = "bm_clr_bright_yellow_turquoise"
	self.colors.bright_yellow_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_turquoise.value = 4
	self.colors.light_blue_gray_blue = {}
	self.colors.light_blue_gray_blue.colors = {light_blue, gray_blue}
	self.colors.light_blue_gray_blue.name_id = "bm_clr_light_blue_gray_blue"
	self.colors.light_blue_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_gray_blue.value = 3
	self.colors.pink_matte_purple = {}
	self.colors.pink_matte_purple.colors = {pink, matte_purple}
	self.colors.pink_matte_purple.name_id = "bm_clr_pink_matte_purple"
	self.colors.pink_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_matte_purple.value = 2
	self.colors.bone_white_purple = {}
	self.colors.bone_white_purple.colors = {bone_white, purple}
	self.colors.bone_white_purple.name_id = "bm_clr_bone_white_purple"
	self.colors.bone_white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_purple.value = 4
	self.colors.light_blue_cobalt_blue = {}
	self.colors.light_blue_cobalt_blue.colors = {light_blue, cobalt_blue}
	self.colors.light_blue_cobalt_blue.name_id = "bm_clr_light_blue_cobalt_blue"
	self.colors.light_blue_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_cobalt_blue.value = 3
	self.colors.coral_red_gray_blue = {}
	self.colors.coral_red_gray_blue.colors = {coral_red, gray_blue}
	self.colors.coral_red_gray_blue.name_id = "bm_clr_coral_red_gray_blue"
	self.colors.coral_red_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_gray_blue.value = 2
	self.colors.leaf_green_blood_red = {}
	self.colors.leaf_green_blood_red.colors = {leaf_green, blood_red}
	self.colors.leaf_green_blood_red.name_id = "bm_clr_leaf_green_blood_red"
	self.colors.leaf_green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_blood_red.value = 3
	self.colors.cobalt_blue_pink = {}
	self.colors.cobalt_blue_pink.colors = {cobalt_blue, pink}
	self.colors.cobalt_blue_pink.name_id = "bm_clr_cobalt_blue_pink"
	self.colors.cobalt_blue_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_pink.value = 2
	self.colors.bright_yellow_olive_green = {}
	self.colors.bright_yellow_olive_green.colors = {bright_yellow, olive_green}
	self.colors.bright_yellow_olive_green.name_id = "bm_clr_bright_yellow_olive_green"
	self.colors.bright_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_olive_green.value = 1
	self.colors.bone_white_light_blue = {}
	self.colors.bone_white_light_blue.colors = {bone_white, light_blue}
	self.colors.bone_white_light_blue.name_id = "bm_clr_bone_white_light_blue"
	self.colors.bone_white_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_light_blue.value = 1
	self.colors.coral_red_dark_red = {}
	self.colors.coral_red_dark_red.colors = {coral_red, dark_red}
	self.colors.coral_red_dark_red.name_id = "bm_clr_coral_red_dark_red"
	self.colors.coral_red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_dark_red.value = 2
	self.colors.turquoise_pink = {}
	self.colors.turquoise_pink.colors = {turquoise, pink}
	self.colors.turquoise_pink.name_id = "bm_clr_turquoise_pink"
	self.colors.turquoise_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_pink.value = 1
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {white, brown}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 1
	self.colors.blue_light_blue = {}
	self.colors.blue_light_blue.colors = {blue, light_blue}
	self.colors.blue_light_blue.name_id = "bm_clr_blue_light_blue"
	self.colors.blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_light_blue.value = 2
	self.colors.toxic_green_matte_purple = {}
	self.colors.toxic_green_matte_purple.colors = {toxic_green, matte_purple}
	self.colors.toxic_green_matte_purple.name_id = "bm_clr_toxic_green_matte_purple"
	self.colors.toxic_green_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_matte_purple.value = 2
	self.colors.orange_matte_blue = {}
	self.colors.orange_matte_blue.colors = {orange, matte_blue}
	self.colors.orange_matte_blue.name_id = "bm_clr_orange_matte_blue"
	self.colors.orange_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_matte_blue.value = 3
	self.colors.warm_yellow_navy_blue = {}
	self.colors.warm_yellow_navy_blue.colors = {warm_yellow, navy_blue}
	self.colors.warm_yellow_navy_blue.name_id = "bm_clr_warm_yellow_navy_blue"
	self.colors.warm_yellow_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_navy_blue.value = 3
	self.colors.bright_yellow_dark_gray = {}
	self.colors.bright_yellow_dark_gray.colors = {bright_yellow, dark_gray}
	self.colors.bright_yellow_dark_gray.name_id = "bm_clr_bright_yellow_dark_gray"
	self.colors.bright_yellow_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_dark_gray.value = 2
	self.colors.white_magenta = {}
	self.colors.white_magenta.colors = {white, magenta}
	self.colors.white_magenta.name_id = "bm_clr_white_magenta"
	self.colors.white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_magenta.value = 4
	self.colors.cyan_purple = {}
	self.colors.cyan_purple.colors = {cyan, purple}
	self.colors.cyan_purple.name_id = "bm_clr_cyan_purple"
	self.colors.cyan_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_purple.value = 5
	self.colors.white_black = {}
	self.colors.white_black.colors = {white, black}
	self.colors.white_black.name_id = "bm_clr_white_black"
	self.colors.white_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_black.infamous = true
	self.colors.white_black.value = 3
	self.colors.light_gray_blood_red = {}
	self.colors.light_gray_blood_red.colors = {light_gray, blood_red}
	self.colors.light_gray_blood_red.name_id = "bm_clr_light_gray_blood_red"
	self.colors.light_gray_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_blood_red.value = 6
	self.colors.blood_red_white = {}
	self.colors.blood_red_white.colors = {blood_red, white}
	self.colors.blood_red_white.name_id = "bm_clr_blood_red_white"
	self.colors.blood_red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_white.infamous = true
	self.colors.blood_red_white.value = 6
	self.colors.bone_white_navy_blue = {}
	self.colors.bone_white_navy_blue.colors = {bone_white, navy_blue}
	self.colors.bone_white_navy_blue.name_id = "bm_clr_bone_white_navy_blue"
	self.colors.bone_white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_navy_blue.value = 5
	self.colors.warm_yellow_olive_green = {}
	self.colors.warm_yellow_olive_green.colors = {warm_yellow, olive_green}
	self.colors.warm_yellow_olive_green.name_id = "bm_clr_warm_yellow_olive_green"
	self.colors.warm_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_olive_green.value = 4
	self.colors.cyan_orange = {}
	self.colors.cyan_orange.colors = {cyan, orange}
	self.colors.cyan_orange.name_id = "bm_clr_cyan_orange"
	self.colors.cyan_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_orange.value = 3
	self.colors.dark_gray_orange = {}
	self.colors.dark_gray_orange.colors = {dark_gray, orange}
	self.colors.dark_gray_orange.name_id = "bm_clr_dark_gray_orange"
	self.colors.dark_gray_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_orange.value = 2
	self.colors.light_brown_navy_blue = {}
	self.colors.light_brown_navy_blue.colors = {light_brown, navy_blue}
	self.colors.light_brown_navy_blue.name_id = "bm_clr_light_brown_navy_blue"
	self.colors.light_brown_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_navy_blue.value = 2
	self.colors.orange_purple = {}
	self.colors.orange_purple.colors = {orange, purple}
	self.colors.orange_purple.name_id = "bm_clr_orange_purple"
	self.colors.orange_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_purple.value = 2
	self.colors.light_blue_brown = {}
	self.colors.light_blue_brown.colors = {light_blue, brown}
	self.colors.light_blue_brown.name_id = "bm_clr_light_blue_brown"
	self.colors.light_blue_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_brown.value = 3
	self.colors.green_blood_red = {}
	self.colors.green_blood_red.colors = {green, blood_red}
	self.colors.green_blood_red.name_id = "bm_clr_green_blood_red"
	self.colors.green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_blood_red.value = 4
	self.colors.cyan_blue = {}
	self.colors.cyan_blue.colors = {cyan, blue}
	self.colors.cyan_blue.name_id = "bm_clr_cyan_blue"
	self.colors.cyan_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_blue.value = 5
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {yellow, orange}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 6
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {light_gray, dark_gray}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 2
	self.colors.gray_black = {}
	self.colors.gray_black.colors = {gray, black}
	self.colors.gray_black.name_id = "bm_clr_gray_black"
	self.colors.gray_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_black.value = 3
	self.colors.white_dark_gray = {}
	self.colors.white_dark_gray.colors = {white, dark_gray}
	self.colors.white_dark_gray.name_id = "bm_clr_white_dark_gray"
	self.colors.white_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_dark_gray.value = 6
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {white, brown}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 3
	self.colors.white_navy_blue = {}
	self.colors.white_navy_blue.colors = {white, navy_blue}
	self.colors.white_navy_blue.name_id = "bm_clr_white_navy_blue"
	self.colors.white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_navy_blue.value = 4
	self.colors.white_purple = {}
	self.colors.white_purple.colors = {white, purple}
	self.colors.white_purple.name_id = "bm_clr_white_purple"
	self.colors.white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_purple.value = 2
	self.colors.black_coral_red = {}
	self.colors.black_coral_red.colors = {black, coral_red}
	self.colors.black_coral_red.name_id = "bm_clr_black_coral_red"
	self.colors.black_coral_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_coral_red.value = 3
	self.colors.black_orange = {}
	self.colors.black_orange.colors = {black, orange}
	self.colors.black_orange.name_id = "bm_clr_black_orange"
	self.colors.black_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_orange.value = 4
	self.colors.black_cobalt_blue = {}
	self.colors.black_cobalt_blue.colors = {black, cobalt_blue}
	self.colors.black_cobalt_blue.name_id = "bm_clr_black_cobalt_blue"
	self.colors.black_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_cobalt_blue.value = 2
	self.colors.black_leaf_green = {}
	self.colors.black_leaf_green.colors = {black, leaf_green}
	self.colors.black_leaf_green.name_id = "bm_clr_black_leaf_green"
	self.colors.black_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_leaf_green.value = 3
	self.colors.red_white = {}
	self.colors.red_white.colors = {red, white}
	self.colors.red_white.name_id = "bm_clr_red_white"
	self.colors.red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_white.value = 4
	self.colors.leaf_green_white = {}
	self.colors.leaf_green_white.colors = {leaf_green, white}
	self.colors.leaf_green_white.name_id = "bm_clr_leaf_green_white"
	self.colors.leaf_green_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_white.value = 2
	self.colors.orange_white = {}
	self.colors.orange_white.colors = {orange, white}
	self.colors.orange_white.name_id = "bm_clr_orange_white"
	self.colors.orange_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_white.value = 3
	self.colors.cobalt_blue_white = {}
	self.colors.cobalt_blue_white.colors = {cobalt_blue, white}
	self.colors.cobalt_blue_white.name_id = "bm_clr_cobalt_blue_white"
	self.colors.cobalt_blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_white.value = 4
	self.colors.warm_yellow_white = {}
	self.colors.warm_yellow_white.colors = {warm_yellow, white}
	self.colors.warm_yellow_white.name_id = "bm_clr_warm_yellow_white"
	self.colors.warm_yellow_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_white.value = 3
	self.colors.black_bright_yellow = {}
	self.colors.black_bright_yellow.colors = {black, bright_yellow}
	self.colors.black_bright_yellow.name_id = "bm_clr_black_bright_yellow"
	self.colors.black_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_bright_yellow.value = 2
	self.colors.warm_yellow_bright_yellow = {}
	self.colors.warm_yellow_bright_yellow.colors = {warm_yellow, bright_yellow}
	self.colors.warm_yellow_bright_yellow.name_id = "bm_clr_warm_yellow_bright_yellow"
	self.colors.warm_yellow_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_bright_yellow.value = 3
	self.colors.black_magenta = {}
	self.colors.black_magenta.colors = {black, magenta}
	self.colors.black_magenta.name_id = "bm_clr_black_magenta"
	self.colors.black_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_magenta.value = 4
	self.colors.navy_blue_light_blue = {}
	self.colors.navy_blue_light_blue.colors = {navy_blue, light_blue}
	self.colors.navy_blue_light_blue.name_id = "bm_clr_navy_blue_light_blue"
	self.colors.navy_blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_light_blue.value = 2
	self.colors.dark_red_orange = {}
	self.colors.dark_red_orange.colors = {dark_red, orange}
	self.colors.dark_red_orange.name_id = "bm_clr_dark_red_orange"
	self.colors.dark_red_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_orange.value = 3
end
function BlackMarketTweakData:_init_materials()
	self.materials = {}
	self.materials.plastic = {}
	self.materials.plastic.name_id = "bm_mtl_plastic"
	self.materials.plastic.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.plastic.value = 0
	self.materials.titanium = {}
	self.materials.titanium.name_id = "bm_mtl_titanium"
	self.materials.titanium.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.titanium.texture = "units/payday2/matcaps/matcap_titanium_df"
	self.materials.titanium.infamous = true
	self.materials.titanium.value = 5
	self.materials.mercury = {}
	self.materials.mercury.name_id = "bm_mtl_mercury"
	self.materials.mercury.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mercury.texture = "units/payday2/matcaps/matcap_mercury_df"
	self.materials.mercury.value = 3
	self.materials.oxide_bronze = {}
	self.materials.oxide_bronze.name_id = "bm_mtl_oxide_bronze"
	self.materials.oxide_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oxide_bronze.texture = "units/payday2/matcaps/matcap_oxide_bronze_df"
	self.materials.oxide_bronze.value = 4
	self.materials.deep_bronze = {}
	self.materials.deep_bronze.name_id = "bm_mtl_deep_bronze"
	self.materials.deep_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.deep_bronze.texture = "units/payday2/matcaps/matcap_deep_bronze_df"
	self.materials.deep_bronze.infamous = true
	self.materials.deep_bronze.value = 5
	self.materials.slime = {}
	self.materials.slime.name_id = "bm_mtl_slime"
	self.materials.slime.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.slime.texture = "units/payday2/matcaps/matcap_slime_df"
	self.materials.slime.infamous = true
	self.materials.slime.value = 2
	self.materials.gold_clean = {}
	self.materials.gold_clean.name_id = "bm_mtl_gold_clean"
	self.materials.gold_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gold_clean.texture = "units/payday2/matcaps/matcap_gold_clean_df"
	self.materials.gold_clean.infamous = true
	self.materials.gold_clean.value = 10
	self.materials.concrete1 = {}
	self.materials.concrete1.name_id = "bm_mtl_concrete1"
	self.materials.concrete1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.concrete1.texture = "units/payday2/matcaps/matcap_concrete1_df"
	self.materials.concrete1.material_amount = 0
	self.materials.concrete1.value = 2
	self.materials.rock1 = {}
	self.materials.rock1.name_id = "bm_mtl_rock1"
	self.materials.rock1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock1.texture = "units/payday2/matcaps/matcap_rock1_df"
	self.materials.rock1.material_amount = 0
	self.materials.rock1.value = 3
	self.materials.rock2 = {}
	self.materials.rock2.name_id = "bm_mtl_rock2"
	self.materials.rock2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock2.texture = "units/payday2/matcaps/matcap_rock2_df"
	self.materials.rock2.material_amount = 0
	self.materials.rock2.value = 2
	self.materials.rock3 = {}
	self.materials.rock3.name_id = "bm_mtl_rock3"
	self.materials.rock3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock3.texture = "units/payday2/matcaps/matcap_rock3_df"
	self.materials.rock3.material_amount = 0
	self.materials.rock3.value = 2
	self.materials.whiterock = {}
	self.materials.whiterock.name_id = "bm_mtl_whiterock"
	self.materials.whiterock.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.whiterock.texture = "units/payday2/matcaps/matcap_whiterock_df"
	self.materials.whiterock.material_amount = 0
	self.materials.whiterock.value = 3
	self.materials.metal1 = {}
	self.materials.metal1.name_id = "bm_mtl_metal1"
	self.materials.metal1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.metal1.texture = "units/payday2/matcaps/matcap_metal1_df"
	self.materials.metal1.material_amount = 0
	self.materials.metal1.value = 6
	self.materials.cracks1 = {}
	self.materials.cracks1.name_id = "bm_mtl_cracks1"
	self.materials.cracks1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cracks1.texture = "units/payday2/matcaps/matcap_cracks1_df"
	self.materials.cracks1.material_amount = 0
	self.materials.cracks1.value = 2
	self.materials.wicker1 = {}
	self.materials.wicker1.name_id = "bm_mtl_wicker1"
	self.materials.wicker1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.wicker1.texture = "units/payday2/matcaps/matcap_wicker1_df"
	self.materials.wicker1.material_amount = 0
	self.materials.wicker1.value = 3
	self.materials.scales = {}
	self.materials.scales.name_id = "bm_mtl_scales"
	self.materials.scales.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.scales.texture = "units/payday2/matcaps/matcap_scales_df"
	self.materials.scales.infamous = true
	self.materials.scales.material_amount = 0
	self.materials.scales.value = 7
	self.materials.oldbronze = {}
	self.materials.oldbronze.name_id = "bm_mtl_oldbronze"
	self.materials.oldbronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oldbronze.texture = "units/payday2/matcaps/matcap_oldbronze_df"
	self.materials.oldbronze.material_amount = 0
	self.materials.oldbronze.infamous = true
	self.materials.oldbronze.value = 8
	self.materials.bark1 = {}
	self.materials.bark1.name_id = "bm_mtl_bark1"
	self.materials.bark1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark1.texture = "units/payday2/matcaps/matcap_bark1_df"
	self.materials.bark1.material_amount = 0
	self.materials.bark1.value = 4
	self.materials.bark2 = {}
	self.materials.bark2.name_id = "bm_mtl_bark2"
	self.materials.bark2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark2.texture = "units/payday2/matcaps/matcap_bark2_df"
	self.materials.bark2.material_amount = 0
	self.materials.bark2.value = 3
	self.materials.bark3 = {}
	self.materials.bark3.name_id = "bm_mtl_bark3"
	self.materials.bark3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark3.texture = "units/payday2/matcaps/matcap_bark3_df"
	self.materials.bark3.material_amount = 0
	self.materials.bark3.value = 2
	self.materials.carbon = {}
	self.materials.carbon.name_id = "bm_mtl_carbon"
	self.materials.carbon.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.carbon.texture = "units/payday2/matcaps/matcap_carbon_df"
	self.materials.carbon.material_amount = 0
	self.materials.carbon.value = 6
	self.materials.leather = {}
	self.materials.leather.name_id = "bm_mtl_leather1"
	self.materials.leather.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.leather.texture = "units/payday2/matcaps/matcap_leather1_df"
	self.materials.leather.material_amount = 0
	self.materials.leather.value = 6
	self.materials.bloodred = {}
	self.materials.bloodred.name_id = "bm_mtl_bloodred"
	self.materials.bloodred.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bloodred.texture = "units/payday2/matcaps/matcap_bloodred_df"
	self.materials.bloodred.value = 8
	self.materials.waterblue = {}
	self.materials.waterblue.name_id = "bm_mtl_waterblue"
	self.materials.waterblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.waterblue.texture = "units/payday2/matcaps/matcap_waterblue_df"
	self.materials.waterblue.value = 4
	self.materials.matteblack = {}
	self.materials.matteblack.name_id = "bm_mtl_matteblack"
	self.materials.matteblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.matteblack.texture = "units/payday2/matcaps/matcap_matteblack_df"
	self.materials.matteblack.value = 9
	self.materials.pianoblack = {}
	self.materials.pianoblack.name_id = "bm_mtl_pianoblack"
	self.materials.pianoblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.pianoblack.texture = "units/payday2/matcaps/matcap_pianoblack_df"
	self.materials.pianoblack.infamous = true
	self.materials.pianoblack.value = 10
	self.materials.twoblue = {}
	self.materials.twoblue.name_id = "bm_mtl_twoblue"
	self.materials.twoblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.twoblue.texture = "units/payday2/matcaps/matcap_twoblue_df"
	self.materials.twoblue.value = 6
	self.materials.rainbow = {}
	self.materials.rainbow.name_id = "bm_mtl_rainbow"
	self.materials.rainbow.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rainbow.texture = "units/payday2/matcaps/matcap_rainbow_df"
	self.materials.rainbow.infamous = true
	self.materials.rainbow.value = 3
	self.materials.magma = {}
	self.materials.magma.name_id = "bm_mtl_magma"
	self.materials.magma.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.magma.texture = "units/payday2/matcaps/matcap_magma_df"
	self.materials.magma.value = 6
	self.materials.radioactive = {}
	self.materials.radioactive.name_id = "bm_mtl_radioactive"
	self.materials.radioactive.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.radioactive.texture = "units/payday2/matcaps/matcap_radioactive_df"
	self.materials.radioactive.infamous = true
	self.materials.radioactive.value = 7
	self.materials.bismuth = {}
	self.materials.bismuth.name_id = "bm_mtl_bismuth"
	self.materials.bismuth.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bismuth.texture = "units/payday2/matcaps/matcap_bismuth_df"
	self.materials.bismuth.value = 3
	self.materials.greygloss = {}
	self.materials.greygloss.name_id = "bm_mtl_greygloss"
	self.materials.greygloss.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.greygloss.texture = "units/payday2/matcaps/matcap_greygloss_df"
	self.materials.greygloss.value = 5
	self.materials.finewood = {}
	self.materials.finewood.name_id = "bm_mtl_finewood"
	self.materials.finewood.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.finewood.texture = "units/payday2/matcaps/matcap_finewood_df"
	self.materials.finewood.material_amount = 0
	self.materials.finewood.value = 8
	self.materials.skin = {}
	self.materials.skin.name_id = "bm_mtl_skin"
	self.materials.skin.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.skin.texture = "units/payday2/matcaps/matcap_skin_df"
	self.materials.skin.material_amount = 0
	self.materials.skin.value = 6
	self.materials.alligator = {}
	self.materials.alligator.name_id = "bm_mtl_alligator"
	self.materials.alligator.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.alligator.texture = "units/payday2/matcaps/matcap_alligator_df"
	self.materials.alligator.material_amount = 0
	self.materials.alligator.value = 6
	self.materials.denim = {}
	self.materials.denim.name_id = "bm_mtl_denim"
	self.materials.denim.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.denim.texture = "units/payday2/matcaps/matcap_denim_df"
	self.materials.denim.material_amount = 0
	self.materials.denim.value = 2
	self.materials.candy = {}
	self.materials.candy.name_id = "bm_mtl_candy"
	self.materials.candy.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.candy.texture = "units/payday2/matcaps/matcap_candy_df"
	self.materials.candy.value = 5
	self.materials.chrome_purple = {}
	self.materials.chrome_purple.name_id = "bm_mtl_chrome_purple"
	self.materials.chrome_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.chrome_purple.texture = "units/payday2/matcaps/matcap_chrome_purple_df"
	self.materials.chrome_purple.value = 5
	self.materials.hot_cold = {}
	self.materials.hot_cold.name_id = "bm_mtl_hot_cold"
	self.materials.hot_cold.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.hot_cold.texture = "units/payday2/matcaps/matcap_hot_cold_df"
	self.materials.hot_cold.value = 5
	self.materials.orchish = {}
	self.materials.orchish.name_id = "bm_mtl_orchish"
	self.materials.orchish.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.orchish.texture = "units/payday2/matcaps/matcap_orcish_df"
	self.materials.orchish.value = 5
	self.materials.cash = {}
	self.materials.cash.name_id = "bm_mtl_cash"
	self.materials.cash.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cash.texture = "units/pd2_dlc1/matcaps/matcap_cash_df"
	self.materials.cash.material_amount = 0
	self.materials.cash.value = 5
	self.materials.cash.dlc = "armored_transport"
	self.materials.jade = {}
	self.materials.jade.name_id = "bm_mtl_jade"
	self.materials.jade.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.jade.texture = "units/pd2_dlc1/matcaps/matcap_jade_df"
	self.materials.jade.value = 5
	self.materials.jade.dlc = "armored_transport"
	self.materials.redwhiteblue = {}
	self.materials.redwhiteblue.name_id = "bm_mtl_redwhiteblue"
	self.materials.redwhiteblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.redwhiteblue.texture = "units/pd2_dlc1/matcaps/matcap_redwhiteblue_df"
	self.materials.redwhiteblue.value = 5
	self.materials.redwhiteblue.dlc = "armored_transport"
	self.materials.marble = {}
	self.materials.marble.name_id = "bm_mtl_marble"
	self.materials.marble.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.marble.texture = "units/pd2_dlc1/matcaps/matcap_marble_df"
	self.materials.marble.value = 5
	self.materials.marble.dlc = "armored_transport"
	self.materials.fur = {}
	self.materials.fur.name_id = "bm_mtl_fur"
	self.materials.fur.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.fur.texture = "units/pd2_dlc_dec5/matcaps/matcap_fur_df"
	self.materials.fur.material_amount = 0
	self.materials.fur.value = 5
	self.materials.fur.dlc = "gage_pack"
	self.materials.galvanized = {}
	self.materials.galvanized.name_id = "bm_mtl_galvanized"
	self.materials.galvanized.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.galvanized.texture = "units/pd2_dlc_dec5/matcaps/matcap_galvanized_df"
	self.materials.galvanized.material_amount = 0
	self.materials.galvanized.value = 5
	self.materials.galvanized.dlc = "gage_pack"
	self.materials.heavymetal = {}
	self.materials.heavymetal.name_id = "bm_mtl_heavymetal"
	self.materials.heavymetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.heavymetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_heavymetal_df"
	self.materials.heavymetal.material_amount = 0
	self.materials.heavymetal.value = 5
	self.materials.heavymetal.dlc = "gage_pack"
	self.materials.oilmetal = {}
	self.materials.oilmetal.name_id = "bm_mtl_oilmetal"
	self.materials.oilmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oilmetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_oilmetal_df"
	self.materials.oilmetal.value = 5
	self.materials.oilmetal.dlc = "gage_pack"
	self.materials.gunmetal = {}
	self.materials.gunmetal.name_id = "bm_mtl_gunmetal"
	self.materials.gunmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gunmetal.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_gunmetal_df"
	self.materials.gunmetal.value = 5
	self.materials.gunmetal.dlc = "gage_pack_lmg"
	self.materials.mud = {}
	self.materials.mud.name_id = "bm_mtl_mud"
	self.materials.mud.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mud.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_mud_df"
	self.materials.mud.material_amount = 0
	self.materials.mud.value = 5
	self.materials.mud.dlc = "gage_pack_lmg"
	self.materials.splinter = {}
	self.materials.splinter.name_id = "bm_mtl_splinter"
	self.materials.splinter.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.splinter.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_splinter_df"
	self.materials.splinter.material_amount = 0
	self.materials.splinter.value = 5
	self.materials.splinter.dlc = "gage_pack_lmg"
	self.materials.erdl = {}
	self.materials.erdl.name_id = "bm_mtl_erdl"
	self.materials.erdl.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.erdl.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_erdl_df"
	self.materials.erdl.material_amount = 0
	self.materials.erdl.value = 5
	self.materials.erdl.dlc = "gage_pack_lmg"
	self.materials.arizona = {}
	self.materials.arizona.name_id = "bm_mtl_arizona"
	self.materials.arizona.pcs = {}
	self.materials.arizona.texture = "units/pd2_dlc_infamy/matcaps/matcap_arizona_df"
	self.materials.arizona.value = 0
	self.materials.arizona.global_value = "infamy"
	self.materials.arizona.infamy_lock = "infamy_maskpack_destroyer"
	self.materials.baby = {}
	self.materials.baby.name_id = "bm_mtl_baby"
	self.materials.baby.pcs = {}
	self.materials.baby.texture = "units/pd2_dlc_infamy/matcaps/matcap_baby_df"
	self.materials.baby.value = 0
	self.materials.baby.global_value = "infamy"
	self.materials.baby.infamy_lock = "infamy_maskpack_lurker"
	self.materials.alien_slime = {}
	self.materials.alien_slime.name_id = "bm_mtl_alien_slime"
	self.materials.alien_slime.pcs = {}
	self.materials.alien_slime.texture = "units/pd2_dlc_infamy/matcaps/matcap_alien_slime_df"
	self.materials.alien_slime.value = 0
	self.materials.alien_slime.global_value = "infamy"
	self.materials.alien_slime.infamy_lock = "infamy_maskpack_ranger"
	self.materials.eye = {}
	self.materials.eye.name_id = "bm_mtl_eye"
	self.materials.eye.pcs = {}
	self.materials.eye.texture = "units/pd2_dlc_infamy/matcaps/matcap_eye_df"
	self.materials.eye.value = 0
	self.materials.eye.global_value = "infamy"
	self.materials.eye.infamy_lock = "infamy_maskpack_balaclava"
	self.materials.hades = {}
	self.materials.hades.name_id = "bm_mtl_hades"
	self.materials.hades.pcs = {}
	self.materials.hades.texture = "units/pd2_dlc_infamy/matcaps/matcap_hades_df"
	self.materials.hades.value = 0
	self.materials.hades.global_value = "infamy"
	self.materials.hades.infamy_lock = "infamy_maskpack_pain"
	self.materials.punk = {}
	self.materials.punk.name_id = "bm_mtl_punk"
	self.materials.punk.pcs = {}
	self.materials.punk.texture = "units/pd2_dlc_infamy/matcaps/matcap_punk_df"
	self.materials.punk.value = 0
	self.materials.punk.global_value = "infamy"
	self.materials.punk.infamy_lock = "infamy_maskpack_punk"
	self.materials.haze = {}
	self.materials.haze.name_id = "bm_mtl_haze"
	self.materials.haze.pcs = {}
	self.materials.haze.texture = "units/pd2_dlc_infamy/matcaps/matcap_haze_df"
	self.materials.haze.value = 0
	self.materials.haze.global_value = "infamy"
	self.materials.haze.infamy_lock = "infamy_maskpack_daft"
	self.materials.plastic_hood = {}
	self.materials.plastic_hood.name_id = "bm_mtl_plastic_hood"
	self.materials.plastic_hood.pcs = {}
	self.materials.plastic_hood.texture = "units/pd2_dlc_infamy/matcaps/matcap_plastic_hood_df"
	self.materials.plastic_hood.value = 0
	self.materials.plastic_hood.global_value = "infamy"
	self.materials.plastic_hood.infamy_lock = "infamy_maskpack_hood"
	self.materials.copper = {}
	self.materials.copper.name_id = "bm_mtl_copper"
	self.materials.copper.pcs = {}
	self.materials.copper.texture = "units/pd2_dlc_infamy/matcaps/matcap_copper_df"
	self.materials.copper.material_amount = 0
	self.materials.copper.value = 0
	self.materials.copper.global_value = "infamy"
	self.materials.copper.infamy_lock = "infamy_enforcer"
	self.materials.dark_leather = {}
	self.materials.dark_leather.name_id = "bm_mtl_dark_leather"
	self.materials.dark_leather.pcs = {}
	self.materials.dark_leather.texture = "units/pd2_dlc_infamy/matcaps/matcap_dark_leather_df"
	self.materials.dark_leather.material_amount = 0
	self.materials.dark_leather.value = 0
	self.materials.dark_leather.global_value = "infamy"
	self.materials.dark_leather.infamy_lock = "infamy_mastermind"
	self.materials.sinister = {}
	self.materials.sinister.name_id = "bm_mtl_sinister"
	self.materials.sinister.pcs = {}
	self.materials.sinister.texture = "units/pd2_dlc_infamy/matcaps/matcap_sinister_df"
	self.materials.sinister.value = 0
	self.materials.sinister.global_value = "infamy"
	self.materials.sinister.infamy_lock = "infamy_ghost"
	self.materials.electric = {}
	self.materials.electric.name_id = "bm_mtl_electric"
	self.materials.electric.pcs = {}
	self.materials.electric.texture = "units/pd2_dlc_infamy/matcaps/matcap_electric_df"
	self.materials.electric.value = 0
	self.materials.electric.global_value = "infamy"
	self.materials.electric.infamy_lock = "infamy_technician"
	self.materials.bugshell = {}
	self.materials.bugshell.name_id = "bm_mtl_bugshell"
	self.materials.bugshell.pcs = {}
	self.materials.bugshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_bugshell_df"
	self.materials.bugshell.material_amount = 0
	self.materials.bugshell.value = 0
	self.materials.bugshell.dlc = "gage_pack_snp"
	self.materials.carapace = {}
	self.materials.carapace.name_id = "bm_mtl_carapace"
	self.materials.carapace.pcs = {}
	self.materials.carapace.texture = "units/pd2_dlc_gage_snp/materials/matcap_carapace_df"
	self.materials.carapace.value = 0
	self.materials.carapace.dlc = "gage_pack_snp"
	self.materials.hardshell = {}
	self.materials.hardshell.name_id = "bm_mtl_hardshell"
	self.materials.hardshell.pcs = {}
	self.materials.hardshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_hardshell_df"
	self.materials.hardshell.material_amount = 0
	self.materials.hardshell.value = 0
	self.materials.hardshell.dlc = "gage_pack_snp"
	self.materials.insectoid = {}
	self.materials.insectoid.name_id = "bm_mtl_insectoid"
	self.materials.insectoid.pcs = {}
	self.materials.insectoid.texture = "units/pd2_dlc_gage_snp/materials/matcap_insectoid_df"
	self.materials.insectoid.value = 0
	self.materials.insectoid.dlc = "gage_pack_snp"
	self.materials.blackmetal = {}
	self.materials.blackmetal.name_id = "bm_mtl_blackmetal"
	self.materials.blackmetal.pcs = {}
	self.materials.blackmetal.texture = "units/pd2_poetry_winners/materials/matcap_blackmetal_df"
	self.materials.blackmetal.material_amount = 0
	self.materials.blackmetal.value = 0
	self.materials.blackmetal.dlc = "poetry_soundtrack"
	self.materials.blackmetal.global_value = "poetry_soundtrack"
	self.materials.carbongrid = {}
	self.materials.carbongrid.name_id = "bm_mtl_carbongrid"
	self.materials.carbongrid.pcs = {}
	self.materials.carbongrid.texture = "units/pd2_poetry_winners/materials/matcap_carbongrid_df"
	self.materials.carbongrid.material_amount = 0
	self.materials.carbongrid.value = 0
	self.materials.carbongrid.dlc = "poetry_soundtrack"
	self.materials.carbongrid.global_value = "poetry_soundtrack"
	self.materials.cosmoline = {}
	self.materials.cosmoline.name_id = "bm_mtl_cosmoline"
	self.materials.cosmoline.pcs = {}
	self.materials.cosmoline.texture = "units/pd2_poetry_winners/materials/matcap_cosmoline_df"
	self.materials.cosmoline.value = 0
	self.materials.cosmoline.dlc = "poetry_soundtrack"
	self.materials.cosmoline.global_value = "poetry_soundtrack"
	self.materials.electronic = {}
	self.materials.electronic.name_id = "bm_mtl_electronic"
	self.materials.electronic.pcs = {}
	self.materials.electronic.texture = "units/pd2_poetry_winners/materials/matcap_electronic_df"
	self.materials.electronic.material_amount = 0
	self.materials.electronic.value = 0
	self.materials.electronic.dlc = "poetry_soundtrack"
	self.materials.electronic.global_value = "poetry_soundtrack"
	self.materials.gemstone = {}
	self.materials.gemstone.name_id = "bm_mtl_gemstone"
	self.materials.gemstone.pcs = {}
	self.materials.gemstone.texture = "units/pd2_dlc_big/matcaps/matcap_gemstone_df"
	self.materials.gemstone.value = 0
	self.materials.gemstone.dlc = "big_bank"
	self.materials.old = {}
	self.materials.old.name_id = "bm_mtl_old"
	self.materials.old.pcs = {}
	self.materials.old.texture = "units/pd2_dlc_big/matcaps/matcap_old_df"
	self.materials.old.value = 0
	self.materials.old.dlc = "big_bank"
	self.materials.clay = {}
	self.materials.clay.name_id = "bm_mtl_clay"
	self.materials.clay.pcs = {}
	self.materials.clay.texture = "units/pd2_dlc_big/matcaps/matcap_clay_df"
	self.materials.clay.material_amount = 0
	self.materials.clay.value = 0
	self.materials.clay.dlc = "big_bank"
	self.materials.parchment = {}
	self.materials.parchment.name_id = "bm_mtl_parchment"
	self.materials.parchment.pcs = {}
	self.materials.parchment.texture = "units/pd2_dlc_big/matcaps/matcap_parchment_df"
	self.materials.parchment.material_amount = 0
	self.materials.parchment.value = 0
	self.materials.parchment.dlc = "big_bank"
	self.materials.sparks = {}
	self.materials.sparks.name_id = "bm_mtl_sparks"
	self.materials.sparks.pcs = {}
	self.materials.sparks.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_sparks_df"
	self.materials.sparks.value = 0
	self.materials.sparks.dlc = "gage_pack_shotgun"
	self.materials.explosive = {}
	self.materials.explosive.name_id = "bm_mtl_explosive"
	self.materials.explosive.pcs = {}
	self.materials.explosive.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_explosive_df"
	self.materials.explosive.value = 0
	self.materials.explosive.dlc = "gage_pack_shotgun"
	self.materials.bananapeel = {}
	self.materials.bananapeel.name_id = "bm_mtl_bananapeel"
	self.materials.bananapeel.pcs = {}
	self.materials.bananapeel.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_bananapeel_df"
	self.materials.bananapeel.material_amount = 0
	self.materials.bananapeel.value = 0
	self.materials.bananapeel.dlc = "gage_pack_shotgun"
	self.materials.leaf = {}
	self.materials.leaf.name_id = "bm_mtl_leaf"
	self.materials.leaf.pcs = {}
	self.materials.leaf.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_leaf_df"
	self.materials.leaf.material_amount = 0
	self.materials.leaf.value = 0
	self.materials.leaf.dlc = "gage_pack_shotgun"
	self.materials.bone = {}
	self.materials.bone.name_id = "bm_mtl_bone"
	self.materials.bone.pcs = {}
	self.materials.bone.texture = "units/pd2_dlc_gage_assault/materials/matcap_bone_df"
	self.materials.bone.material_amount = 0
	self.materials.bone.value = 0
	self.materials.bone.dlc = "gage_pack_assault"
	self.materials.frost = {}
	self.materials.frost.name_id = "bm_mtl_frost"
	self.materials.frost.pcs = {}
	self.materials.frost.texture = "units/pd2_dlc_gage_assault/materials/matcap_frost_df"
	self.materials.frost.material_amount = 0
	self.materials.frost.value = 0
	self.materials.frost.dlc = "gage_pack_assault"
	self.materials.evil = {}
	self.materials.evil.name_id = "bm_mtl_evil"
	self.materials.evil.pcs = {}
	self.materials.evil.texture = "units/pd2_dlc_gage_assault/materials/matcap_evil_df"
	self.materials.evil.value = 0
	self.materials.evil.dlc = "gage_pack_assault"
	self.materials.void = {}
	self.materials.void.name_id = "bm_mtl_void"
	self.materials.void.pcs = {}
	self.materials.void.texture = "units/pd2_dlc_gage_assault/materials/matcap_void_df"
	self.materials.void.value = 0
	self.materials.void.dlc = "gage_pack_assault"
	self.materials.sunset = {}
	self.materials.sunset.name_id = "bm_mtl_sunset"
	self.materials.sunset.pcs = {}
	self.materials.sunset.texture = "units/pd2_dlc_miami/matcaps/matcap_sunset_df"
	self.materials.sunset.value = 0
	self.materials.sunset.dlc = "hl_miami"
	self.materials.chromescape = {}
	self.materials.chromescape.name_id = "bm_mtl_chromescape"
	self.materials.chromescape.pcs = {}
	self.materials.chromescape.texture = "units/pd2_dlc_miami/matcaps/matcap_chromescape_df"
	self.materials.chromescape.value = 0
	self.materials.chromescape.dlc = "hl_miami"
	self.materials.rubber = {}
	self.materials.rubber.name_id = "bm_mtl_rubber"
	self.materials.rubber.pcs = {}
	self.materials.rubber.texture = "units/pd2_dlc_miami/matcaps/matcap_rubber_df"
	self.materials.rubber.value = 0
	self.materials.rubber.dlc = "hl_miami"
	self.materials.error = {}
	self.materials.error.name_id = "bm_mtl_error"
	self.materials.error.pcs = {}
	self.materials.error.texture = "units/pd2_dlc_miami/matcaps/matcap_error_df"
	self.materials.error.material_amount = 0
	self.materials.error.value = 0
	self.materials.error.dlc = "hl_miami"
	self.materials.rug = {}
	self.materials.rug.name_id = "bm_mtl_rug"
	self.materials.rug.pcs = {}
	self.materials.rug.texture = "units/pd2_dlc_miami/matcaps/matcap_rug_df"
	self.materials.rug.material_amount = 0
	self.materials.rug.value = 0
	self.materials.rug.dlc = "hlm_game"
	self.materials.cushion = {}
	self.materials.cushion.name_id = "bm_mtl_cushion"
	self.materials.cushion.pcs = {}
	self.materials.cushion.texture = "units/pd2_dlc_miami/matcaps/matcap_cushion_df"
	self.materials.cushion.material_amount = 0
	self.materials.cushion.value = 0
	self.materials.cushion.dlc = "hlm_game"
	self.materials.hatred = {}
	self.materials.hatred.name_id = "bm_mtl_hatred"
	self.materials.hatred.pcs = {}
	self.materials.hatred.texture = "units/pd2_dlc_miami/matcaps/matcap_hatred_df"
	self.materials.hatred.value = 0
	self.materials.hatred.dlc = "hlm_game"
	self.materials.neon = {}
	self.materials.neon.name_id = "bm_mtl_neon"
	self.materials.neon.pcs = {}
	self.materials.neon.texture = "units/pd2_dlc_miami/matcaps/matcap_neon_df"
	self.materials.neon.value = 0
	self.materials.neon.dlc = "hlm_game"
	self.materials.armygreen = {}
	self.materials.armygreen.name_id = "bm_mtl_armygreen"
	self.materials.armygreen.pcs = {}
	self.materials.armygreen.texture = "units/pd2_dlc_gage_historical/materials/matcap_armygreen_df"
	self.materials.armygreen.material_amount = 0
	self.materials.armygreen.value = 0
	self.materials.armygreen.dlc = "gage_pack_historical"
	self.materials.gunsmoke = {}
	self.materials.gunsmoke.name_id = "bm_mtl_gunsmoke"
	self.materials.gunsmoke.pcs = {}
	self.materials.gunsmoke.texture = "units/pd2_dlc_gage_historical/materials/matcap_gunsmoke_df"
	self.materials.gunsmoke.value = 0
	self.materials.gunsmoke.dlc = "gage_pack_historical"
	self.materials.patriot = {}
	self.materials.patriot.name_id = "bm_mtl_patriot"
	self.materials.patriot.pcs = {}
	self.materials.patriot.texture = "units/pd2_dlc_gage_historical/materials/matcap_patriot_df"
	self.materials.patriot.material_amount = 0
	self.materials.patriot.value = 0
	self.materials.patriot.dlc = "gage_pack_historical"
	self.materials.redsun = {}
	self.materials.redsun.name_id = "bm_mtl_redsun"
	self.materials.redsun.pcs = {}
	self.materials.redsun.texture = "units/pd2_dlc_gage_historical/materials/matcap_redsun_df"
	self.materials.redsun.value = 0
	self.materials.redsun.dlc = "gage_pack_historical"
	self.materials.diamond = {}
	self.materials.diamond.name_id = "bm_mtl_diamond"
	self.materials.diamond.pcs = {}
	self.materials.diamond.texture = "units/pd2_indiana/materials/matcap_diamond_df"
	self.materials.diamond.value = 0
	self.materials.diamond.dlc = "hope_diamond"
	self.materials.bandages = {}
	self.materials.bandages.name_id = "bm_mtl_bandages"
	self.materials.bandages.pcs = {}
	self.materials.bandages.texture = "units/pd2_indiana/materials/matcap_bandages_df"
	self.materials.bandages.material_amount = 0
	self.materials.bandages.value = 0
	self.materials.bandages.dlc = "hope_diamond"
	self.materials.rust = {}
	self.materials.rust.name_id = "bm_mtl_dark_rust"
	self.materials.rust.pcs = {}
	self.materials.rust.texture = "units/pd2_indiana/materials/matcap_rust_df"
	self.materials.rust.material_amount = 0
	self.materials.rust.value = 0
	self.materials.rust.dlc = "hope_diamond"
	self.materials.sand = {}
	self.materials.sand.name_id = "bm_mtl_dark_sand"
	self.materials.sand.pcs = {}
	self.materials.sand.texture = "units/pd2_indiana/materials/matcap_sand_df"
	self.materials.sand.material_amount = 0
	self.materials.sand.value = 0
	self.materials.sand.dlc = "hope_diamond"
	self.materials.meat = {}
	self.materials.meat.name_id = "bm_mtl_meat"
	self.materials.meat.pcs = {}
	self.materials.meat.texture = "units/pd2_dlc_cro/matcaps/matcaps_meat_df"
	self.materials.meat.material_amount = 0
	self.materials.meat.value = 0
	self.materials.meat.dlc = "the_bomb"
	self.materials.meat.texture_bundle_folder = "the_bomb"
	self.materials.plywood = {}
	self.materials.plywood.name_id = "bm_mtl_plywood"
	self.materials.plywood.pcs = {}
	self.materials.plywood.texture = "units/pd2_dlc_cro/matcaps/matcaps_plywood_df"
	self.materials.plywood.material_amount = 0
	self.materials.plywood.value = 0
	self.materials.plywood.dlc = "the_bomb"
	self.materials.plywood.texture_bundle_folder = "the_bomb"
	self.materials.rhino_skin = {}
	self.materials.rhino_skin.name_id = "bm_mtl_rhino"
	self.materials.rhino_skin.pcs = {}
	self.materials.rhino_skin.texture = "units/pd2_dlc_cro/matcaps/matcaps_rhino_df"
	self.materials.rhino_skin.material_amount = 0
	self.materials.rhino_skin.value = 0
	self.materials.rhino_skin.dlc = "the_bomb"
	self.materials.rhino_skin.texture_bundle_folder = "the_bomb"
	self.materials.rock_marble = {}
	self.materials.rock_marble.name_id = "bm_mtl_rock_marble"
	self.materials.rock_marble.pcs = {}
	self.materials.rock_marble.texture = "units/pd2_dlc_cro/matcaps/matcaps_rock_marble_df"
	self.materials.rock_marble.material_amount = 0
	self.materials.rock_marble.value = 0
	self.materials.rock_marble.dlc = "the_bomb"
	self.materials.rock_marble.texture_bundle_folder = "the_bomb"
	self.materials.dawn = {}
	self.materials.dawn.name_id = "bm_mtl_dawn"
	self.materials.dawn.pcs = {}
	self.materials.dawn.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_dawn_df"
	self.materials.dawn.value = 0
	self.materials.dawn.dlc = "akm4_pack"
	self.materials.dawn.texture_bundle_folder = "dlc_akm4"
	self.materials.prehistoric = {}
	self.materials.prehistoric.name_id = "bm_mtl_prehistoric"
	self.materials.prehistoric.pcs = {}
	self.materials.prehistoric.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_prehistoric_df"
	self.materials.prehistoric.value = 0
	self.materials.prehistoric.dlc = "akm4_pack"
	self.materials.prehistoric.texture_bundle_folder = "dlc_akm4"
	self.materials.fossil = {}
	self.materials.fossil.name_id = "bm_mtl_fossil"
	self.materials.fossil.pcs = {}
	self.materials.fossil.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_fossil_df"
	self.materials.fossil.material_amount = 0
	self.materials.fossil.value = 0
	self.materials.fossil.dlc = "akm4_pack"
	self.materials.fossil.texture_bundle_folder = "dlc_akm4"
	self.materials.feathers = {}
	self.materials.feathers.name_id = "bm_mtl_feathers"
	self.materials.feathers.pcs = {}
	self.materials.feathers.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_feathers_df"
	self.materials.feathers.material_amount = 0
	self.materials.feathers.value = 0
	self.materials.feathers.dlc = "akm4_pack"
	self.materials.feathers.texture_bundle_folder = "dlc_akm4"
	self.materials.candlelight = {}
	self.materials.candlelight.name_id = "bm_mtl_candlelight"
	self.materials.candlelight.pcs = {}
	self.materials.candlelight.texture = "units/pd2_dlc_bbq/materials/matcap_candlelight_df"
	self.materials.candlelight.value = 0
	self.materials.candlelight.dlc = "bbq"
	self.materials.candlelight.texture_bundle_folder = "bbq"
	self.materials.burn = {}
	self.materials.burn.name_id = "bm_mtl_burn"
	self.materials.burn.pcs = {}
	self.materials.burn.texture = "units/pd2_dlc_bbq/materials/matcap_burn_df"
	self.materials.burn.value = 0
	self.materials.burn.dlc = "bbq"
	self.materials.burn.texture_bundle_folder = "bbq"
	self.materials.toast = {}
	self.materials.toast.name_id = "bm_mtl_toast"
	self.materials.toast.pcs = {}
	self.materials.toast.texture = "units/pd2_dlc_bbq/materials/matcap_toast_df"
	self.materials.toast.value = 0
	self.materials.toast.material_amount = 0
	self.materials.toast.dlc = "bbq"
	self.materials.toast.texture_bundle_folder = "bbq"
	self.materials.coal = {}
	self.materials.coal.name_id = "bm_mtl_coal"
	self.materials.coal.pcs = {}
	self.materials.coal.texture = "units/pd2_dlc_bbq/materials/matcap_coal_df"
	self.materials.coal.value = 0
	self.materials.coal.material_amount = 0
	self.materials.coal.dlc = "bbq"
	self.materials.coal.texture_bundle_folder = "bbq"
	self.materials.goldfever = {}
	self.materials.goldfever.name_id = "bm_mtl_goldfever"
	self.materials.goldfever.pcs = {}
	self.materials.goldfever.texture = "units/pd2_dlc_west/masks/materials/matcap_goldfever_df"
	self.materials.goldfever.dlc = "west"
	self.materials.goldfever.value = 0
	self.materials.westernsunset = {}
	self.materials.westernsunset.name_id = "bm_mtl_westernsunset"
	self.materials.westernsunset.pcs = {}
	self.materials.westernsunset.texture = "units/pd2_dlc_west/masks/materials/matcap_westernsunset_df"
	self.materials.westernsunset.dlc = "west"
	self.materials.westernsunset.value = 0
	self.materials.scorpion = {}
	self.materials.scorpion.name_id = "bm_mtl_scorpion"
	self.materials.scorpion.pcs = {}
	self.materials.scorpion.texture = "units/pd2_dlc_west/masks/materials/matcap_scorpion_df"
	self.materials.scorpion.dlc = "west"
	self.materials.scorpion.material_amount = 0
	self.materials.scorpion.value = 0
	self.materials.cactus = {}
	self.materials.cactus.name_id = "bm_mtl_cactus"
	self.materials.cactus.pcs = {}
	self.materials.cactus.texture = "units/pd2_dlc_west/masks/materials/matcap_cactus_df"
	self.materials.cactus.dlc = "west"
	self.materials.cactus.material_amount = 0
	self.materials.cactus.value = 0
	self.materials.stained_glass = {}
	self.materials.stained_glass.name_id = "bm_mtl_stained_glass"
	self.materials.stained_glass.pcs = {}
	self.materials.stained_glass.texture = "units/pd2_dlc_arena/masks/materials/matcap_stained_glass_df"
	self.materials.stained_glass.dlc = "arena"
	self.materials.stained_glass.material_amount = 0
	self.materials.stained_glass.value = 0
	self.materials.bionic = {}
	self.materials.bionic.name_id = "bm_mtl_bionic"
	self.materials.bionic.pcs = {}
	self.materials.bionic.texture = "units/pd2_dlc_arena/masks/materials/matcap_bionic_df"
	self.materials.bionic.dlc = "arena"
	self.materials.bionic.material_amount = 0
	self.materials.bionic.value = 0
	self.materials.enlightment = {}
	self.materials.enlightment.name_id = "bm_mtl_enlightment"
	self.materials.enlightment.pcs = {}
	self.materials.enlightment.texture = "units/pd2_dlc_arena/masks/materials/matcap_enlightment_df"
	self.materials.enlightment.dlc = "arena"
	self.materials.enlightment.value = 0
	self.materials.dimblue = {}
	self.materials.dimblue.name_id = "bm_mtl_dimblue"
	self.materials.dimblue.pcs = {}
	self.materials.dimblue.texture = "units/pd2_dlc_arena/masks/materials/matcap_dimblue_df"
	self.materials.dimblue.dlc = "arena"
	self.materials.dimblue.value = 0
	self.materials.carpet = {}
	self.materials.carpet.name_id = "bm_mtl_carpet"
	self.materials.carpet.pcs = {}
	self.materials.carpet.texture = "units/pd2_dlc_casino/matcaps/matcap_carpet_df"
	self.materials.carpet.material_amount = 0
	self.materials.carpet.value = 0
	self.materials.carpet.dlc = "kenaz"
	self.materials.carpet.texture_bundle_folder = "kenaz"
	self.materials.casino = {}
	self.materials.casino.name_id = "bm_mtl_casino"
	self.materials.casino.pcs = {}
	self.materials.casino.texture = "units/pd2_dlc_casino/matcaps/matcap_casino_df"
	self.materials.casino.value = 0
	self.materials.casino.dlc = "kenaz"
	self.materials.casino.texture_bundle_folder = "kenaz"
	self.materials.plush = {}
	self.materials.plush.name_id = "bm_mtl_plush"
	self.materials.plush.pcs = {}
	self.materials.plush.texture = "units/pd2_dlc_casino/matcaps/matcap_plush_df"
	self.materials.plush.material_amount = 0
	self.materials.plush.value = 0
	self.materials.plush.dlc = "kenaz"
	self.materials.plush.texture_bundle_folder = "kenaz"
	self.materials.stars = {}
	self.materials.stars.name_id = "bm_mtl_stars"
	self.materials.stars.pcs = {}
	self.materials.stars.texture = "units/pd2_dlc_casino/matcaps/matcap_stars_df"
	self.materials.stars.value = 0
	self.materials.stars.dlc = "kenaz"
	self.materials.stars.texture_bundle_folder = "kenaz"
	self.materials.still_waters = {}
	self.materials.still_waters.name_id = "bm_mtl_still_waters"
	self.materials.still_waters.pcs = {}
	self.materials.still_waters.texture = "units/pd2_dlc_turtles/masks/materials/matcap_still_waters_df"
	self.materials.still_waters.value = 0
	self.materials.still_waters.dlc = "turtles"
	self.materials.sakura = {}
	self.materials.sakura.name_id = "bm_mtl_sakura"
	self.materials.sakura.pcs = {}
	self.materials.sakura.texture = "units/pd2_dlc_turtles/masks/materials/matcap_sakura_df"
	self.materials.sakura.value = 0
	self.materials.sakura.dlc = "turtles"
	self.materials.bamboo = {}
	self.materials.bamboo.name_id = "bm_mtl_bamboo"
	self.materials.bamboo.pcs = {}
	self.materials.bamboo.texture = "units/pd2_dlc_turtles/masks/materials/matcap_bamboo_df"
	self.materials.bamboo.material_amount = 0
	self.materials.bamboo.value = 0
	self.materials.bamboo.dlc = "turtles"
	self.materials.origami = {}
	self.materials.origami.name_id = "bm_mtl_origami"
	self.materials.origami.pcs = {}
	self.materials.origami.texture = "units/pd2_dlc_turtles/masks/materials/matcap_origami_df"
	self.materials.origami.material_amount = 0
	self.materials.origami.value = 0
	self.materials.origami.dlc = "turtles"
end
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
end
function BlackMarketTweakData:_init_cash()
	self.cash = {}
	self.cash.cash10 = {}
	self.cash.cash10.name_id = "bm_csh_cash10"
	self.cash.cash10.value_id = "cash10"
	self.cash.cash10.multiplier = 1
	self.cash.cash10.pcs = {10, 40}
	self.cash.cash20 = {}
	self.cash.cash20.name_id = "bm_csh_cash20"
	self.cash.cash20.value_id = "cash20"
	self.cash.cash20.multiplier = 1
	self.cash.cash20.pcs = {20, 40}
	self.cash.cash30 = {}
	self.cash.cash30.name_id = "bm_csh_cash30"
	self.cash.cash30.multiplier = 1
	self.cash.cash30.value_id = "cash30"
	self.cash.cash30.pcs = {30, 40}
	self.cash.cash40 = {}
	self.cash.cash40.name_id = "bm_csh_cash40"
	self.cash.cash40.multiplier = 1
	self.cash.cash40.value_id = "cash40"
	self.cash.cash40.pcs = {
		20,
		30,
		40
	}
	self.cash.cash50 = {}
	self.cash.cash50.name_id = "bm_csh_cash50"
	self.cash.cash50.multiplier = 1
	self.cash.cash50.value_id = "cash50"
	self.cash.cash50.pcs = {
		30,
		40,
		50
	}
	self.cash.cash60 = {}
	self.cash.cash60.name_id = "bm_csh_cash60"
	self.cash.cash60.value_id = "cash60"
	self.cash.cash60.multiplier = 1
	self.cash.cash60.pcs = {
		40,
		50,
		60
	}
	self.cash.cash70 = {}
	self.cash.cash70.name_id = "bm_csh_cash70"
	self.cash.cash70.value_id = "cash70"
	self.cash.cash70.multiplier = 1
	self.cash.cash70.pcs = {
		50,
		60,
		70
	}
	self.cash.cash80 = {}
	self.cash.cash80.name_id = "bm_csh_cash80"
	self.cash.cash80.value_id = "cash80"
	self.cash.cash80.multiplier = 1
	self.cash.cash80.pcs = {
		60,
		70,
		80
	}
	self.cash.cash90 = {}
	self.cash.cash90.name_id = "bm_csh_cash90"
	self.cash.cash90.value_id = "cash90"
	self.cash.cash90.multiplier = 1
	self.cash.cash90.pcs = {
		70,
		80,
		90
	}
	self.cash.cash100 = {}
	self.cash.cash100.name_id = "bm_csh_cash100"
	self.cash.cash100.value_id = "cash100"
	self.cash.cash100.multiplier = 1
	self.cash.cash100.pcs = {
		80,
		90,
		100
	}
	self.cash.cash_preorder = {}
	self.cash.cash_preorder.name_id = "bm_csh_cash_preorder"
	self.cash.cash_preorder.value_id = "cash_preorder"
	self.cash.cash_preorder.multiplier = 1.2
	self.cash.cash_preorder.dlc = "preorder"
end
function BlackMarketTweakData:_init_xp()
	self.xp = {}
	self.xp.xp10 = {}
	self.xp.xp10.name_id = "bm_exp_xp10"
	self.xp.xp10.value_id = "xp10"
	self.xp.xp10.multiplier = 1
	self.xp.xp10.pcs = {10, 40}
	self.xp.xp20 = {}
	self.xp.xp20.name_id = "bm_exp_xp20"
	self.xp.xp20.value_id = "xp20"
	self.xp.xp20.multiplier = 1
	self.xp.xp20.pcs = {20, 40}
	self.xp.xp30 = {}
	self.xp.xp30.name_id = "bm_exp_xp30"
	self.xp.xp30.multiplier = 1
	self.xp.xp30.value_id = "xp30"
	self.xp.xp30.pcs = {30, 40}
	self.xp.xp40 = {}
	self.xp.xp40.name_id = "bm_exp_xp40"
	self.xp.xp40.multiplier = 1
	self.xp.xp40.value_id = "xp40"
	self.xp.xp40.pcs = {
		20,
		30,
		40
	}
	self.xp.xp50 = {}
	self.xp.xp50.name_id = "bm_exp_xp50"
	self.xp.xp50.multiplier = 1
	self.xp.xp50.value_id = "xp50"
	self.xp.xp50.pcs = {
		30,
		40,
		50
	}
	self.xp.xp60 = {}
	self.xp.xp60.name_id = "bm_exp_xp60"
	self.xp.xp60.value_id = "xp60"
	self.xp.xp60.multiplier = 1
	self.xp.xp60.pcs = {
		40,
		50,
		60
	}
	self.xp.xp70 = {}
	self.xp.xp70.name_id = "bm_exp_xp70"
	self.xp.xp70.value_id = "xp70"
	self.xp.xp70.multiplier = 1
	self.xp.xp70.pcs = {
		50,
		60,
		70
	}
	self.xp.xp80 = {}
	self.xp.xp80.name_id = "bm_exp_xp80"
	self.xp.xp80.value_id = "xp80"
	self.xp.xp80.multiplier = 1
	self.xp.xp80.pcs = {
		60,
		70,
		80
	}
	self.xp.xp90 = {}
	self.xp.xp90.name_id = "bm_exp_xp90"
	self.xp.xp90.value_id = "xp90"
	self.xp.xp90.multiplier = 1
	self.xp.xp90.pcs = {
		70,
		80,
		90
	}
	self.xp.xp100 = {}
	self.xp.xp100.name_id = "bm_exp_xp100"
	self.xp.xp100.value_id = "xp100"
	self.xp.xp100.multiplier = 1
	self.xp.xp100.pcs = {
		80,
		90,
		100
	}
end
function BlackMarketTweakData:_init_armors()
	self.armors = {}
	self.armors.level_1 = {}
	self.armors.level_1.name_id = "bm_armor_level_1"
	self.armors.level_1.sequence = "var_model_01"
	self.armors.level_1.upgrade_level = 1
	self.armors.level_2 = {}
	self.armors.level_2.name_id = "bm_armor_level_2"
	self.armors.level_2.sequence = "var_model_02"
	self.armors.level_2.upgrade_level = 2
	self.armors.level_3 = {}
	self.armors.level_3.name_id = "bm_armor_level_3"
	self.armors.level_3.sequence = "var_model_03"
	self.armors.level_3.upgrade_level = 3
	self.armors.level_4 = {}
	self.armors.level_4.name_id = "bm_armor_level_4"
	self.armors.level_4.sequence = "var_model_04"
	self.armors.level_4.upgrade_level = 4
	self.armors.level_5 = {}
	self.armors.level_5.name_id = "bm_armor_level_5"
	self.armors.level_5.sequence = "var_model_05"
	self.armors.level_5.upgrade_level = 5
	self.armors.level_6 = {}
	self.armors.level_6.name_id = "bm_armor_level_6"
	self.armors.level_6.sequence = "var_model_06"
	self.armors.level_6.upgrade_level = 6
	self.armors.level_7 = {}
	self.armors.level_7.name_id = "bm_armor_level_7"
	self.armors.level_7.sequence = "var_model_07"
	self.armors.level_7.upgrade_level = 7
	self:_add_desc_from_name_macro(self.armors)
end
function BlackMarketTweakData:_init_deployables(tweak_data)
	self.deployables = {}
	self.deployables.doctor_bag = {}
	self.deployables.doctor_bag.name_id = "bm_equipment_doctor_bag"
	self.deployables.ammo_bag = {}
	self.deployables.ammo_bag.name_id = "bm_equipment_ammo_bag"
	self.deployables.ecm_jammer = {}
	self.deployables.ecm_jammer.name_id = "bm_equipment_ecm_jammer"
	self.deployables.sentry_gun = {}
	self.deployables.sentry_gun.name_id = "bm_equipment_sentry_gun"
	self.deployables.trip_mine = {}
	self.deployables.trip_mine.name_id = "bm_equipment_trip_mine"
	self.deployables.armor_kit = {}
	self.deployables.armor_kit.name_id = "bm_equipment_armor_kit"
	self.deployables.first_aid_kit = {}
	self.deployables.first_aid_kit.name_id = "bm_equipment_first_aid_kit"
	self.deployables.bodybags_bag = {}
	self.deployables.bodybags_bag.name_id = "bm_equipment_bodybags_bag"
	self:_add_desc_from_name_macro(self.deployables)
end
function BlackMarketTweakData:_init_projectiles()
	self.projectiles = {}
	self.projectiles.frag = {}
	self.projectiles.frag.name_id = "bm_grenade_frag"
	self.projectiles.frag.unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade"
	self.projectiles.frag.unit_dummy = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_husk"
	self.projectiles.frag.sprint_unit = "units/payday2/weapons/wpn_frag_grenade/wpn_frag_grenade_sprint"
	self.projectiles.frag.icon = "frag_grenade"
	self.projectiles.frag.dlc = "gage_pack"
	self.projectiles.frag.throwable = true
	self.projectiles.frag.max_amount = 3
	self.projectiles.frag.anim_global_param = "projectile_frag"
	self.projectiles.frag.throw_allowed_expire_t = 0.1
	self.projectiles.frag.expire_t = 1.1
	self.projectiles.frag.repeat_expire_t = 1.5
	self.projectiles.frag.is_a_grenade = true
	self.projectiles.molotov = {}
	self.projectiles.molotov.name_id = "bm_grenade_molotov"
	self.projectiles.molotov.unit = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_third"
	self.projectiles.molotov.unit_dummy = "units/pd2_dlc_bbq/weapons/molotov_cocktail/wpn_molotov_husk"
	self.projectiles.molotov.icon = "molotov_grenade"
	self.projectiles.molotov.dlc = "bbq"
	self.projectiles.molotov.no_cheat_count = true
	self.projectiles.molotov.impact_detonation = true
	self.projectiles.molotov.time_cheat = 1
	self.projectiles.molotov.throwable = true
	self.projectiles.molotov.max_amount = 3
	self.projectiles.molotov.texture_bundle_folder = "bbq"
	self.projectiles.molotov.physic_effect = Idstring("physic_effects/molotov_throw")
	self.projectiles.molotov.anim_global_param = "projectile_molotov"
	self.projectiles.molotov.throw_allowed_expire_t = 0.1
	self.projectiles.molotov.expire_t = 1.1
	self.projectiles.molotov.repeat_expire_t = 1.5
	self.projectiles.molotov.is_a_grenade = true
	self.projectiles.dynamite = {}
	self.projectiles.dynamite.name_id = "bm_dynamite"
	self.projectiles.dynamite.unit = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite"
	self.projectiles.dynamite.unit_dummy = "units/pd2_dlc_west/weapons/wpn_gre_dynamite/wpn_gre_dynamite_husk"
	self.projectiles.dynamite.icon = "dynamite_grenade"
	self.projectiles.dynamite.dlc = "west"
	self.projectiles.dynamite.texture_bundle_folder = "west"
	self.projectiles.dynamite.max_amount = 3
	self.projectiles.dynamite.throwable = true
	self.projectiles.dynamite.anim_global_param = "projectile_molotov"
	self.projectiles.dynamite.throw_allowed_expire_t = 0.1
	self.projectiles.dynamite.expire_t = 1.1
	self.projectiles.dynamite.repeat_expire_t = 1.5
	self.projectiles.dynamite.is_a_grenade = true
	self.projectiles.wpn_prj_four = {}
	self.projectiles.wpn_prj_four.name_id = "bm_wpn_prj_four"
	self.projectiles.wpn_prj_four.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four"
	self.projectiles.wpn_prj_four.unit_dummy = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_husk"
	self.projectiles.wpn_prj_four.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_four/wpn_prj_four_local"
	self.projectiles.wpn_prj_four.icon = "four_projectile"
	self.projectiles.wpn_prj_four.throw_shout = true
	self.projectiles.wpn_prj_four.no_cheat_count = true
	self.projectiles.wpn_prj_four.impact_detonation = true
	self.projectiles.wpn_prj_four.client_authoritative = true
	self.projectiles.wpn_prj_four.add_trail_effect = true
	self.projectiles.wpn_prj_four.throwable = true
	self.projectiles.wpn_prj_four.texture_bundle_folder = "turtles"
	self.projectiles.wpn_prj_four.dlc = "turtles"
	self.projectiles.wpn_prj_four.max_amount = 10
	self.projectiles.wpn_prj_four.anim_global_param = "projectile_four"
	self.projectiles.wpn_prj_four.throw_allowed_expire_t = 0.15
	self.projectiles.wpn_prj_four.expire_t = 1.1
	self.projectiles.wpn_prj_four.repeat_expire_t = 0.5
	self.projectiles.wpn_prj_ace = {}
	self.projectiles.wpn_prj_ace.name_id = "bm_wpn_prj_ace"
	self.projectiles.wpn_prj_ace.unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace"
	self.projectiles.wpn_prj_ace.unit_dummy = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_husk"
	self.projectiles.wpn_prj_ace.local_unit = "units/pd2_dlc_cake/weapons/wpn_prj_ace/wpn_prj_ace_local"
	self.projectiles.wpn_prj_ace.icon = "ace_projectile"
	self.projectiles.wpn_prj_ace.throw_shout = true
	self.projectiles.wpn_prj_ace.no_cheat_count = true
	self.projectiles.wpn_prj_ace.impact_detonation = true
	self.projectiles.wpn_prj_ace.client_authoritative = true
	self.projectiles.wpn_prj_ace.add_trail_effect = true
	self.projectiles.wpn_prj_ace.throwable = true
	self.projectiles.wpn_prj_ace.dlc = "pd2_clan"
	self.projectiles.wpn_prj_ace.max_amount = 21
	self.projectiles.wpn_prj_ace.anim_global_param = "projectile_four"
	self.projectiles.wpn_prj_ace.throw_allowed_expire_t = 0.15
	self.projectiles.wpn_prj_ace.expire_t = 1.1
	self.projectiles.wpn_prj_ace.repeat_expire_t = 0.3
	self.projectiles.launcher_frag = {}
	self.projectiles.launcher_frag.name_id = "bm_launcher_frag"
	self.projectiles.launcher_frag.unit = "units/pd2_dlc_gage_assault/weapons/wpn_launcher_frag_grenade/wpn_launcher_frag_grenade"
	self.projectiles.launcher_frag.weapon_id = "gre_m79"
	self.projectiles.launcher_frag.no_cheat_count = true
	self.projectiles.launcher_frag.impact_detonation = true
	self.projectiles.launcher_frag.time_cheat = 1
	self.projectiles.rocket_frag = {}
	self.projectiles.rocket_frag.name_id = "bm_rocket_frag"
	self.projectiles.rocket_frag.unit = "units/pd2_dlc_overkill_pack/weapons/wpn_third_rpg7_fired_rocket/wpn_third_rpg7_fired_rocket"
	self.projectiles.rocket_frag.weapon_id = "rpg7"
	self.projectiles.rocket_frag.no_cheat_count = true
	self.projectiles.rocket_frag.impact_detonation = true
	self.projectiles.rocket_frag.time_cheat = 1
	self.projectiles.rocket_frag.physic_effect = Idstring("physic_effects/anti_gravitate")
	self.projectiles.rocket_frag.adjust_z = 0
	self.projectiles.launcher_incendiary = {}
	self.projectiles.launcher_incendiary.name_id = "bm_launcher_incendiary"
	self.projectiles.launcher_incendiary.unit = "units/pd2_dlc_bbq/weapons/wpn_launcher_incendiary_grenade/wpn_launcher_incendiary_grenade"
	self.projectiles.launcher_incendiary.weapon_id = "gre_m79"
	self.projectiles.launcher_incendiary.no_cheat_count = true
	self.projectiles.launcher_incendiary.impact_detonation = true
	self.projectiles.launcher_incendiary.time_cheat = 1
	self.projectiles.launcher_frag_m32 = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_m32.weapon_id = "m32"
	self.projectiles.west_arrow = {}
	self.projectiles.west_arrow.name_id = "bm_launcher_frag"
	self.projectiles.west_arrow.unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow"
	self.projectiles.west_arrow.local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_local"
	self.projectiles.west_arrow.weapon_id = "plainsrider"
	self.projectiles.west_arrow.no_cheat_count = true
	self.projectiles.west_arrow.impact_detonation = true
	self.projectiles.west_arrow.client_authoritative = true
	self.projectiles.west_arrow_exp = {}
	self.projectiles.west_arrow_exp.name_id = "bm_launcher_frag"
	self.projectiles.west_arrow_exp.unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp"
	self.projectiles.west_arrow_exp.local_unit = "units/pd2_dlc_west/weapons/wpn_prj_west_arrow/wpn_prj_west_arrow_exp_local"
	self.projectiles.west_arrow_exp.weapon_id = "plainsrider"
	self.projectiles.west_arrow_exp.no_cheat_count = true
	self.projectiles.west_arrow_exp.impact_detonation = true
	self.projectiles.west_arrow_exp.client_authoritative = true
	self.projectiles.bow_poison_arrow = {}
	self.projectiles.bow_poison_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow"
	self.projectiles.bow_poison_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_bow_poison_arrow/wpn_prj_bow_poison_arrow_local"
	self.projectiles.bow_poison_arrow.weapon_id = "plainsrider"
	self.projectiles.bow_poison_arrow.no_cheat_count = true
	self.projectiles.bow_poison_arrow.impact_detonation = true
	self.projectiles.bow_poison_arrow.client_authoritative = true
	self.projectiles.crossbow_arrow = {}
	self.projectiles.crossbow_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow"
	self.projectiles.crossbow_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow/wpn_prj_crossbow_arrow_local"
	self.projectiles.crossbow_arrow.weapon_id = "hunter"
	self.projectiles.crossbow_arrow.no_cheat_count = true
	self.projectiles.crossbow_arrow.impact_detonation = true
	self.projectiles.crossbow_arrow.client_authoritative = true
	self.projectiles.crossbow_poison_arrow = {}
	self.projectiles.crossbow_poison_arrow.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow"
	self.projectiles.crossbow_poison_arrow.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_poison_arrow/wpn_prj_crossbow_poison_arrow_local"
	self.projectiles.crossbow_poison_arrow.weapon_id = "hunter"
	self.projectiles.crossbow_poison_arrow.no_cheat_count = true
	self.projectiles.crossbow_poison_arrow.impact_detonation = true
	self.projectiles.crossbow_poison_arrow.client_authoritative = true
	self.projectiles.crossbow_arrow_exp = {}
	self.projectiles.crossbow_arrow_exp.unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp"
	self.projectiles.crossbow_arrow_exp.local_unit = "units/pd2_dlc_turtles/weapons/wpn_prj_crossbow_arrow_exp/wpn_prj_crossbow_arrow_exp_local"
	self.projectiles.crossbow_arrow_exp.weapon_id = "hunter"
	self.projectiles.crossbow_arrow_exp.no_cheat_count = true
	self.projectiles.crossbow_arrow_exp.impact_detonation = true
	self.projectiles.crossbow_arrow_exp.client_authoritative = true
	self._projectiles_index = {
		"frag",
		"launcher_frag",
		"rocket_frag",
		"molotov",
		"launcher_incendiary",
		"launcher_frag_m32",
		"west_arrow",
		"west_arrow_exp",
		"dynamite",
		"bow_poison_arrow",
		"crossbow_arrow",
		"crossbow_poison_arrow",
		"crossbow_arrow_exp",
		"wpn_prj_four",
		"wpn_prj_ace"
	}
	self:_add_desc_from_name_macro(self.projectiles)
end
function BlackMarketTweakData:get_projectiles_index()
	return self._projectiles_index
end
function BlackMarketTweakData:get_index_from_projectile_id(projectile_id)
	for index, entry_name in ipairs(self._projectiles_index) do
		if entry_name == projectile_id then
			return index
		end
	end
	return 0
end
function BlackMarketTweakData:get_projectile_name_from_index(index)
	return self._projectiles_index[index]
end
function BlackMarketTweakData:_init_melee_weapons()
	self.melee_weapons = {}
	self.melee_weapons.weapon = {}
	self.melee_weapons.weapon.name_id = "bm_melee_weapon"
	self.melee_weapons.weapon.type = "weapon"
	self.melee_weapons.weapon.unit = nil
	self.melee_weapons.weapon.animation = nil
	self.melee_weapons.weapon.instant = true
	self.melee_weapons.weapon.free = true
	self.melee_weapons.weapon.stats = {}
	self.melee_weapons.weapon.stats.min_damage = 1.5
	self.melee_weapons.weapon.stats.max_damage = 1.5
	self.melee_weapons.weapon.stats.min_damage_effect = 1.75
	self.melee_weapons.weapon.stats.max_damage_effect = 1.75
	self.melee_weapons.weapon.stats.charge_time = 0
	self.melee_weapons.weapon.stats.range = 150
	self.melee_weapons.weapon.stats.weapon_type = "blunt"
	self.melee_weapons.weapon.expire_t = 0.6
	self.melee_weapons.weapon.repeat_expire_t = 0.6
	self.melee_weapons.weapon.sounds = {}
	self.melee_weapons.weapon.sounds.hit_body = "melee_hit_body"
	self.melee_weapons.weapon.sounds.hit_gen = "melee_hit_gen"
	self.melee_weapons.fists = {}
	self.melee_weapons.fists.name_id = "bm_melee_fists"
	self.melee_weapons.fists.type = "fists"
	self.melee_weapons.fists.unit = nil
	self.melee_weapons.fists.animation = nil
	self.melee_weapons.fists.free = true
	self.melee_weapons.fists.stats = {}
	self.melee_weapons.fists.stats.min_damage = 1
	self.melee_weapons.fists.stats.max_damage = 3
	self.melee_weapons.fists.stats.min_damage_effect = 5.35
	self.melee_weapons.fists.stats.max_damage_effect = 2.89
	self.melee_weapons.fists.stats.charge_time = 1
	self.melee_weapons.fists.stats.range = 150
	self.melee_weapons.fists.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fists.stats.weapon_type = "blunt"
	self.melee_weapons.fists.anim_global_param = "melee_fist"
	self.melee_weapons.fists.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.fists.expire_t = 1
	self.melee_weapons.fists.repeat_expire_t = 0.55
	self.melee_weapons.fists.melee_damage_delay = 0.2
	self.melee_weapons.fists.melee_charge_shaker = "player_melee_charge_fist"
	self.melee_weapons.fists.sounds = {}
	self.melee_weapons.fists.sounds.equip = "fist_equip"
	self.melee_weapons.fists.sounds.hit_air = "fist_hit_air"
	self.melee_weapons.fists.sounds.hit_gen = "fist_hit_gen"
	self.melee_weapons.fists.sounds.hit_body = "fist_hit_body"
	self.melee_weapons.fists.sounds.charge = "fist_charge"
	self.melee_weapons.fists.stats.concealment = 30
	self.melee_weapons.kabar = {}
	self.melee_weapons.kabar.name_id = "bm_melee_kabar"
	self.melee_weapons.kabar.type = "knife"
	self.melee_weapons.kabar.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_kabar/wpn_fps_mel_kabar"
	self.melee_weapons.kabar.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_kabar/wpn_third_mel_kabar"
	self.melee_weapons.kabar.animation = nil
	self.melee_weapons.kabar.dlc = "gage_pack_lmg"
	self.melee_weapons.kabar.texture_bundle_folder = "gage_pack_lmg"
	self.melee_weapons.kabar.stats = {}
	self.melee_weapons.kabar.stats.min_damage = 1.5
	self.melee_weapons.kabar.stats.max_damage = 7
	self.melee_weapons.kabar.stats.min_damage_effect = 0.7
	self.melee_weapons.kabar.stats.max_damage_effect = 0.525
	self.melee_weapons.kabar.stats.charge_time = 1.8
	self.melee_weapons.kabar.stats.range = 185
	self.melee_weapons.kabar.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.kabar.stats.weapon_type = "sharp"
	self.melee_weapons.kabar.anim_global_param = "melee_knife"
	self.melee_weapons.kabar.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.kabar.repeat_expire_t = 0.6
	self.melee_weapons.kabar.expire_t = 1.1
	self.melee_weapons.kabar.melee_damage_delay = 0.1
	self.melee_weapons.kabar.sounds = {}
	self.melee_weapons.kabar.sounds.equip = "knife_equip"
	self.melee_weapons.kabar.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.kabar.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.kabar.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.kabar.sounds.charge = "knife_charge"
	self.melee_weapons.kabar.stats.concealment = 29
	self.melee_weapons.rambo = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.rambo.name_id = "bm_melee_rambo"
	self.melee_weapons.rambo.type = "knife"
	self.melee_weapons.rambo.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_rambo/wpn_fps_mel_rambo"
	self.melee_weapons.rambo.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_rambo/wpn_third_mel_rambo"
	self.melee_weapons.rambo.stats.min_damage = 2.2
	self.melee_weapons.rambo.stats.max_damage = 10
	self.melee_weapons.rambo.stats.min_damage_effect = 0.61
	self.melee_weapons.rambo.stats.max_damage_effect = 0.4
	self.melee_weapons.rambo.anim_global_param = "melee_knife2"
	self.melee_weapons.rambo.repeat_expire_t = 0.5
	self.melee_weapons.rambo.expire_t = 1
	self.melee_weapons.rambo.stats.charge_time = 2
	self.melee_weapons.rambo.stats.range = 200
	self.melee_weapons.rambo.stats.concealment = 29
	self.melee_weapons.gerber = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.gerber.name_id = "bm_melee_gerber"
	self.melee_weapons.gerber.type = "knife"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_dmf/wpn_fps_mel_dmf"
	self.melee_weapons.gerber.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_dmf/wpn_third_mel_dmf"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.repeat_expire_t = 0.5
	self.melee_weapons.gerber.expire_t = 1
	self.melee_weapons.gerber.stats.min_damage = 2
	self.melee_weapons.gerber.stats.max_damage = 5.2
	self.melee_weapons.gerber.stats.min_damage_effect = 1
	self.melee_weapons.gerber.stats.max_damage_effect = 0.58
	self.melee_weapons.gerber.stats.charge_time = 1.3
	self.melee_weapons.gerber.stats.range = 160
	self.melee_weapons.gerber.stats.concealment = 30
	self.melee_weapons.kampfmesser = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.kampfmesser.name_id = "bm_melee_kampfmesser"
	self.melee_weapons.kampfmesser.type = "knife"
	self.melee_weapons.kampfmesser.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_km2000/wpn_fps_mel_km2000"
	self.melee_weapons.kampfmesser.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_km2000/wpn_third_mel_km2000"
	self.melee_weapons.kampfmesser.stats.min_damage = 1.5
	self.melee_weapons.kampfmesser.stats.max_damage = 7.5
	self.melee_weapons.kampfmesser.stats.min_damage_effect = 1
	self.melee_weapons.kampfmesser.stats.max_damage_effect = 0.445
	self.melee_weapons.kampfmesser.stats.charge_time = 1.5
	self.melee_weapons.kampfmesser.stats.range = 185
	self.melee_weapons.kampfmesser.stats.concealment = 29
	self.melee_weapons.brass_knuckles = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.brass_knuckles.name_id = "bm_melee_brass_knuckles"
	self.melee_weapons.brass_knuckles.free = nil
	self.melee_weapons.brass_knuckles.type = "fists"
	self.melee_weapons.brass_knuckles.dlc = "pd2_clan"
	self.melee_weapons.brass_knuckles.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.brass_knuckles.unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_fps_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.third_unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_third_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.stats.min_damage = 1.5
	self.melee_weapons.brass_knuckles.stats.max_damage = 3.5
	self.melee_weapons.brass_knuckles.stats.min_damage_effect = 3.7
	self.melee_weapons.brass_knuckles.stats.max_damage_effect = 2.675
	self.melee_weapons.brass_knuckles.stats.charge_time = 1.3
	self.melee_weapons.brass_knuckles.stats.range = 150
	self.melee_weapons.brass_knuckles.sounds.hit_gen = "knuckles_hit_gen"
	self.melee_weapons.brass_knuckles.sounds.hit_body = "knuckles_hit_body"
	self.melee_weapons.brass_knuckles.stats.concealment = 30
	self.melee_weapons.tomahawk = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.tomahawk.name_id = "bm_melee_tomahawk"
	self.melee_weapons.tomahawk.dlc = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.texture_bundle_folder = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.anim_global_param = "melee_axe"
	self.melee_weapons.tomahawk.type = "axe"
	self.melee_weapons.tomahawk.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.tomahawk.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tomahawk/wpn_fps_mel_tomahawk"
	self.melee_weapons.tomahawk.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tomahawk/wpn_third_mel_tomahawk"
	self.melee_weapons.tomahawk.stats.weapon_type = "sharp"
	self.melee_weapons.tomahawk.stats.min_damage = 4
	self.melee_weapons.tomahawk.stats.max_damage = 6.64
	self.melee_weapons.tomahawk.stats.min_damage_effect = 0.5
	self.melee_weapons.tomahawk.stats.max_damage_effect = 0.6
	self.melee_weapons.tomahawk.stats.charge_time = 2.2
	self.melee_weapons.tomahawk.stats.range = 225
	self.melee_weapons.tomahawk.expire_t = 1.1
	self.melee_weapons.tomahawk.repeat_expire_t = 0.8
	self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
	self.melee_weapons.tomahawk.sounds = {}
	self.melee_weapons.tomahawk.sounds.equip = "tomahawk_equip"
	self.melee_weapons.tomahawk.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.tomahawk.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.tomahawk.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.tomahawk.sounds.charge = "tomahawk_charge"
	self.melee_weapons.tomahawk.stats.concealment = 26
	self.melee_weapons.baton = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.baton.name_id = "bm_melee_baton"
	self.melee_weapons.baton.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_baton/wpn_fps_mel_baton"
	self.melee_weapons.baton.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_baton/wpn_third_mel_baton"
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.stats.min_damage = 0.68
	self.melee_weapons.baton.stats.max_damage = 1.68
	self.melee_weapons.baton.stats.min_damage_effect = 12
	self.melee_weapons.baton.stats.max_damage_effect = 8.8
	self.melee_weapons.baton.stats.charge_time = 2
	self.melee_weapons.baton.stats.range = 250
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.sounds = {}
	self.melee_weapons.baton.sounds.equip = "baton_equip"
	self.melee_weapons.baton.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.baton.sounds.hit_gen = "baton_hit_gen"
	self.melee_weapons.baton.sounds.hit_body = "baton_hit_body"
	self.melee_weapons.baton.sounds.charge = "baton_charge"
	self.melee_weapons.baton.stats.concealment = 30
	self.melee_weapons.shovel = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.shovel.name_id = "bm_melee_shovel"
	self.melee_weapons.shovel.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_combat/wpn_fps_mel_combat"
	self.melee_weapons.shovel.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_combat/wpn_third_mel_combat"
	self.melee_weapons.shovel.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.stats.min_damage = 1.34
	self.melee_weapons.shovel.stats.max_damage = 2.64
	self.melee_weapons.shovel.stats.min_damage_effect = 4.75
	self.melee_weapons.shovel.stats.max_damage_effect = 5.06
	self.melee_weapons.shovel.stats.charge_time = 2.2
	self.melee_weapons.shovel.stats.range = 250
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.sounds = {}
	self.melee_weapons.shovel.sounds.equip = "shovel_equip"
	self.melee_weapons.shovel.sounds.hit_air = "shovel_hit_air"
	self.melee_weapons.shovel.sounds.hit_gen = "shovel_hit_gen"
	self.melee_weapons.shovel.sounds.hit_body = "shovel_hit_body"
	self.melee_weapons.shovel.sounds.charge = "shovel_charge"
	self.melee_weapons.shovel.stats.concealment = 24
	self.melee_weapons.becker = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.becker.name_id = "bm_melee_becker"
	self.melee_weapons.becker.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tac/wpn_fps_mel_tac"
	self.melee_weapons.becker.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tac/wpn_third_mel_tac"
	self.melee_weapons.becker.stats.min_damage = 1.68
	self.melee_weapons.becker.stats.max_damage = 11.68
	self.melee_weapons.becker.stats.min_damage_effect = 0.4
	self.melee_weapons.becker.stats.max_damage_effect = 0.345
	self.melee_weapons.becker.stats.charge_time = 3
	self.melee_weapons.becker.stats.range = 200
	self.melee_weapons.becker.repeat_expire_t = 0.6
	self.melee_weapons.becker.sounds = {}
	self.melee_weapons.becker.sounds.equip = "becker_equip"
	self.melee_weapons.becker.sounds.hit_air = "becker_hit_air"
	self.melee_weapons.becker.sounds.hit_gen = "becker_hit_gen"
	self.melee_weapons.becker.sounds.hit_body = "becker_hit_body"
	self.melee_weapons.becker.sounds.charge = "knife_charge"
	self.melee_weapons.becker.stats.concealment = 28
	self.melee_weapons.moneybundle = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.moneybundle.name_id = "bm_melee_moneybundle"
	self.melee_weapons.moneybundle.dlc = "pd2_clan"
	self.melee_weapons.moneybundle.texture_bundle_folder = "pd2_million"
	self.melee_weapons.moneybundle.free = nil
	self.melee_weapons.moneybundle.anim_global_param = "melee_axe"
	self.melee_weapons.moneybundle.type = "axe"
	self.melee_weapons.moneybundle.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.moneybundle.unit = "units/pd2_million/weapons/wpn_fps_mel_moneybundle/wpn_fps_mel_moneybundle"
	self.melee_weapons.moneybundle.third_unit = "units/pd2_million/weapons/wpn_third_mel_moneybundle/wpn_third_mel_moneybundle"
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.stats.min_damage = 0.2
	self.melee_weapons.moneybundle.stats.max_damage = 1
	self.melee_weapons.moneybundle.stats.min_damage_effect = 15
	self.melee_weapons.moneybundle.stats.max_damage_effect = 10
	self.melee_weapons.moneybundle.stats.charge_time = 1
	self.melee_weapons.moneybundle.stats.range = 150
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.sounds = {}
	self.melee_weapons.moneybundle.repeat_expire_t = 0.5
	self.melee_weapons.moneybundle.sounds.equip = "cash_equip"
	self.melee_weapons.moneybundle.sounds.hit_air = "cash_hit_air"
	self.melee_weapons.moneybundle.sounds.hit_gen = "cash_hit_gen"
	self.melee_weapons.moneybundle.sounds.hit_body = "cash_hit_body"
	self.melee_weapons.moneybundle.sounds.charge = "cash_charge"
	self.melee_weapons.moneybundle.stats.concealment = 30
	self.melee_weapons.barbedwire = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.barbedwire.name_id = "bm_melee_baseballbat"
	self.melee_weapons.barbedwire.dlc = "pd2_clan"
	self.melee_weapons.barbedwire.texture_bundle_folder = "washington_reveal"
	self.melee_weapons.barbedwire.free = nil
	self.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat"
	self.melee_weapons.barbedwire.type = "axe"
	self.melee_weapons.barbedwire.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.barbedwire.unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_fps_mel_barbedwire"
	self.melee_weapons.barbedwire.third_unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_third_mel_barbedwire"
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.stats.min_damage = 4
	self.melee_weapons.barbedwire.stats.max_damage = 6.64
	self.melee_weapons.barbedwire.stats.min_damage_effect = 4
	self.melee_weapons.barbedwire.stats.max_damage_effect = 3.2
	self.melee_weapons.barbedwire.stats.charge_time = 3
	self.melee_weapons.barbedwire.stats.range = 275
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.sounds = {}
	self.melee_weapons.barbedwire.repeat_expire_t = 1
	self.melee_weapons.barbedwire.expire_t = 1.2
	self.melee_weapons.barbedwire.sounds.equip = "bat_equip"
	self.melee_weapons.barbedwire.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.barbedwire.sounds.hit_gen = "bat_hit_gen"
	self.melee_weapons.barbedwire.sounds.hit_body = "bat_hit_body"
	self.melee_weapons.barbedwire.sounds.charge = "bat_charge"
	self.melee_weapons.barbedwire.melee_damage_delay = 0.2
	self.melee_weapons.barbedwire.stats.concealment = 21
	self.melee_weapons.x46 = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.x46.name_id = "bm_melee_x46"
	self.melee_weapons.x46.type = "knife"
	self.melee_weapons.x46.dlc = "gage_pack_assault"
	self.melee_weapons.x46.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.x46.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.x46.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_fps_mel_x46"
	self.melee_weapons.x46.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_third_mel_x46"
	self.melee_weapons.x46.stats.min_damage = 2.5
	self.melee_weapons.x46.stats.max_damage = 6
	self.melee_weapons.x46.stats.min_damage_effect = 1
	self.melee_weapons.x46.stats.max_damage_effect = 1
	self.melee_weapons.x46.stats.charge_time = 1.5
	self.melee_weapons.x46.stats.range = 185
	self.melee_weapons.x46.stats.concealment = 30
	self.melee_weapons.dingdong = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.dingdong.name_id = "bm_melee_dingdong"
	self.melee_weapons.dingdong.anim_global_param = "melee_baseballbat"
	self.melee_weapons.dingdong.type = "axe"
	self.melee_weapons.dingdong.dlc = "gage_pack_assault"
	self.melee_weapons.dingdong.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.dingdong.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.dingdong.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_fps_mel_dingdong"
	self.melee_weapons.dingdong.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_third_mel_dingdong"
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.stats.min_damage = 3
	self.melee_weapons.dingdong.stats.max_damage = 9.2
	self.melee_weapons.dingdong.stats.min_damage_effect = 4
	self.melee_weapons.dingdong.stats.max_damage_effect = 3.2
	self.melee_weapons.dingdong.stats.charge_time = 2.5
	self.melee_weapons.dingdong.stats.range = 275
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.sounds = {}
	self.melee_weapons.dingdong.repeat_expire_t = 1
	self.melee_weapons.dingdong.expire_t = 1.2
	self.melee_weapons.dingdong.sounds.equip = "ding_dong_equip"
	self.melee_weapons.dingdong.sounds.hit_air = "ding_dong_hit_air"
	self.melee_weapons.dingdong.sounds.hit_gen = "ding_dong_hit_gen"
	self.melee_weapons.dingdong.sounds.hit_body = "ding_dong_hit_body"
	self.melee_weapons.dingdong.sounds.charge = "knife_charge"
	self.melee_weapons.dingdong.melee_damage_delay = 0.2
	self.melee_weapons.dingdong.stats.concealment = 20
	self.melee_weapons.bayonet = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bayonet.name_id = "bm_melee_bayonet"
	self.melee_weapons.bayonet.type = "knife"
	self.melee_weapons.bayonet.dlc = "gage_pack_assault"
	self.melee_weapons.bayonet.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bayonet.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.bayonet.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_fps_mel_bayonet"
	self.melee_weapons.bayonet.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_third_mel_bayonet"
	self.melee_weapons.bayonet.anim_global_param = "melee_knife2"
	self.melee_weapons.bayonet.repeat_expire_t = 0.5
	self.melee_weapons.bayonet.expire_t = 1
	self.melee_weapons.bayonet.stats.min_damage = 2
	self.melee_weapons.bayonet.stats.max_damage = 8
	self.melee_weapons.bayonet.stats.min_damage_effect = 1
	self.melee_weapons.bayonet.stats.max_damage_effect = 0.445
	self.melee_weapons.bayonet.stats.charge_time = 1.5
	self.melee_weapons.bayonet.stats.range = 185
	self.melee_weapons.bayonet.stats.concealment = 29
	self.melee_weapons.bullseye = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bullseye.name_id = "bm_melee_bullseye"
	self.melee_weapons.bullseye.anim_global_param = "melee_axe"
	self.melee_weapons.bullseye.type = "axe"
	self.melee_weapons.bullseye.dlc = "gage_pack_assault"
	self.melee_weapons.bullseye.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bullseye.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.bullseye.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_fps_mel_bullseye"
	self.melee_weapons.bullseye.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_third_mel_bullseye"
	self.melee_weapons.bullseye.sounds = {}
	self.melee_weapons.bullseye.sounds.equip = "bullseye_equip"
	self.melee_weapons.bullseye.sounds.hit_air = "bullseye_hit_air"
	self.melee_weapons.bullseye.sounds.hit_gen = "bullseye_hit_gen"
	self.melee_weapons.bullseye.sounds.hit_body = "bullseye_hit_body"
	self.melee_weapons.bullseye.sounds.charge = "bullseye_charge"
	self.melee_weapons.bullseye.stats.min_damage = 3
	self.melee_weapons.bullseye.stats.max_damage = 8
	self.melee_weapons.bullseye.stats.min_damage_effect = 0.5
	self.melee_weapons.bullseye.stats.max_damage_effect = 0.6
	self.melee_weapons.bullseye.stats.charge_time = 1.6
	self.melee_weapons.bullseye.stats.range = 185
	self.melee_weapons.bullseye.stats.concealment = 27
	self.melee_weapons.baseballbat = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.baseballbat.name_id = "bm_melee_bat"
	self.melee_weapons.baseballbat.anim_global_param = "melee_baseballbat_miami"
	self.melee_weapons.baseballbat.dlc = "hl_miami"
	self.melee_weapons.baseballbat.texture_bundle_folder = "hl_miami"
	self.melee_weapons.baseballbat.type = "axe"
	self.melee_weapons.baseballbat.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.baseballbat.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_fps_mel_baseballbat"
	self.melee_weapons.baseballbat.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_third_mel_baseballbat"
	self.melee_weapons.baseballbat.sounds = {}
	self.melee_weapons.baseballbat.sounds.equip = "bat_equip"
	self.melee_weapons.baseballbat.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.baseballbat.sounds.hit_gen = "baseballbat_hit_gen"
	self.melee_weapons.baseballbat.sounds.hit_body = "baseballbat_hit_body"
	self.melee_weapons.baseballbat.sounds.charge = "bat_charge"
	self.melee_weapons.baseballbat.stats.min_damage = 3.5
	self.melee_weapons.baseballbat.stats.max_damage = 6
	self.melee_weapons.baseballbat.stats.min_damage_effect = 4
	self.melee_weapons.baseballbat.stats.max_damage_effect = 3.2
	self.melee_weapons.baseballbat.stats.charge_time = 2.4
	self.melee_weapons.baseballbat.stats.range = 250
	self.melee_weapons.baseballbat.stats.concealment = 24
	self.melee_weapons.baseballbat.repeat_expire_t = 0.9
	self.melee_weapons.baseballbat.expire_t = 1.2
	self.melee_weapons.baseballbat.melee_damage_delay = 0.2
	self.melee_weapons.cleaver = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.cleaver.name_id = "bm_melee_cleaver"
	self.melee_weapons.cleaver.anim_global_param = "melee_cleaver"
	self.melee_weapons.cleaver.dlc = "hl_miami"
	self.melee_weapons.cleaver.texture_bundle_folder = "hl_miami"
	self.melee_weapons.cleaver.type = "axe"
	self.melee_weapons.cleaver.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.cleaver.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_fps_mel_cleaver"
	self.melee_weapons.cleaver.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_third_mel_cleaver"
	self.melee_weapons.cleaver.sounds = {}
	self.melee_weapons.cleaver.sounds.equip = "cleaver_equip"
	self.melee_weapons.cleaver.sounds.hit_air = "cleaver_hit_air"
	self.melee_weapons.cleaver.sounds.hit_gen = "cleaver_hit_gen"
	self.melee_weapons.cleaver.sounds.hit_body = "cleaver_hit_body"
	self.melee_weapons.cleaver.sounds.charge = "cleaver_charge"
	self.melee_weapons.cleaver.stats.min_damage = 3
	self.melee_weapons.cleaver.stats.max_damage = 9.5
	self.melee_weapons.cleaver.stats.min_damage_effect = 0.5
	self.melee_weapons.cleaver.stats.max_damage_effect = 0.6
	self.melee_weapons.cleaver.stats.charge_time = 2.5
	self.melee_weapons.cleaver.stats.range = 185
	self.melee_weapons.cleaver.stats.concealment = 26
	self.melee_weapons.fireaxe = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fireaxe.name_id = "bm_melee_fireaxe"
	self.melee_weapons.fireaxe.anim_global_param = "melee_fireaxe"
	self.melee_weapons.fireaxe.dlc = "hl_miami"
	self.melee_weapons.fireaxe.texture_bundle_folder = "hl_miami"
	self.melee_weapons.fireaxe.type = "axe"
	self.melee_weapons.fireaxe.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fireaxe.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_fps_mel_fireaxe"
	self.melee_weapons.fireaxe.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_third_mel_fireaxe"
	self.melee_weapons.fireaxe.sounds = {}
	self.melee_weapons.fireaxe.sounds.equip = "fire_axe_equip"
	self.melee_weapons.fireaxe.sounds.hit_air = "fire_axe_hit_air"
	self.melee_weapons.fireaxe.sounds.hit_gen = "fire_axe_hit_gen"
	self.melee_weapons.fireaxe.sounds.hit_body = "fire_axe_hit_body"
	self.melee_weapons.fireaxe.sounds.charge = "knife_charge"
	self.melee_weapons.fireaxe.stats.min_damage = 9
	self.melee_weapons.fireaxe.stats.max_damage = 14
	self.melee_weapons.fireaxe.stats.min_damage_effect = 1
	self.melee_weapons.fireaxe.stats.max_damage_effect = 1
	self.melee_weapons.fireaxe.stats.charge_time = 3.5
	self.melee_weapons.fireaxe.stats.range = 275
	self.melee_weapons.fireaxe.stats.concealment = 20
	self.melee_weapons.fireaxe.repeat_expire_t = 1.6
	self.melee_weapons.fireaxe.expire_t = 1.8
	self.melee_weapons.fireaxe.melee_damage_delay = 0.4
	self.melee_weapons.machete = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.machete.name_id = "bm_melee_machete"
	self.melee_weapons.machete.anim_global_param = "melee_machete"
	self.melee_weapons.machete.dlc = "hl_miami"
	self.melee_weapons.machete.texture_bundle_folder = "hl_miami"
	self.melee_weapons.machete.type = "axe"
	self.melee_weapons.machete.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.machete.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_fps_mel_machete"
	self.melee_weapons.machete.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_third_mel_machete"
	self.melee_weapons.machete.sounds = {}
	self.melee_weapons.machete.sounds.equip = "machete_equip"
	self.melee_weapons.machete.sounds.hit_air = "machete_hit_air"
	self.melee_weapons.machete.sounds.hit_gen = "machete_hit_gen"
	self.melee_weapons.machete.sounds.hit_body = "machete_hit_body"
	self.melee_weapons.machete.sounds.charge = "machete_charge"
	self.melee_weapons.machete.stats.min_damage = 4
	self.melee_weapons.machete.stats.max_damage = 8.5
	self.melee_weapons.machete.stats.min_damage_effect = 0.5
	self.melee_weapons.machete.stats.max_damage_effect = 0.6
	self.melee_weapons.machete.stats.charge_time = 2.7
	self.melee_weapons.machete.stats.range = 225
	self.melee_weapons.machete.expire_t = 1.1
	self.melee_weapons.machete.repeat_expire_t = 0.8
	self.melee_weapons.machete.stats.concealment = 24
	self.melee_weapons.briefcase = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.briefcase.name_id = "bm_melee_briefcase"
	self.melee_weapons.briefcase.anim_global_param = "melee_briefcase"
	self.melee_weapons.briefcase.dlc = "hlm_game"
	self.melee_weapons.briefcase.texture_bundle_folder = "hl_miami"
	self.melee_weapons.briefcase.type = "axe"
	self.melee_weapons.briefcase.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.briefcase.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_fps_mel_briefcase"
	self.melee_weapons.briefcase.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_third_mel_briefcase"
	self.melee_weapons.briefcase.sounds = {}
	self.melee_weapons.briefcase.sounds.equip = "suitcase_equip"
	self.melee_weapons.briefcase.sounds.hit_air = "suitcase_hit_air"
	self.melee_weapons.briefcase.sounds.hit_gen = "suitcase_hit_gen"
	self.melee_weapons.briefcase.sounds.hit_body = "suitcase_hit_body"
	self.melee_weapons.briefcase.sounds.charge = "suitcase_charge"
	self.melee_weapons.briefcase.stats.min_damage = 0.68
	self.melee_weapons.briefcase.stats.max_damage = 1.68
	self.melee_weapons.briefcase.stats.min_damage_effect = 10
	self.melee_weapons.briefcase.stats.max_damage_effect = 10
	self.melee_weapons.briefcase.stats.charge_time = 2
	self.melee_weapons.briefcase.stats.range = 185
	self.melee_weapons.briefcase.stats.concealment = 30
	self.melee_weapons.briefcase.repeat_expire_t = 1
	self.melee_weapons.briefcase.expire_t = 1.2
	self.melee_weapons.briefcase.melee_damage_delay = 0.2
	self.melee_weapons.kabartanto = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.kabartanto.name_id = "bm_melee_kabar_tanto"
	self.melee_weapons.kabartanto.dlc = "pd2_clan"
	self.melee_weapons.kabartanto.texture_bundle_folder = nil
	self.melee_weapons.kabartanto.type = "knife"
	self.melee_weapons.kabartanto.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_mel_kabar_tanto/wpn_fps_mel_kabar_tanto"
	self.melee_weapons.kabartanto.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_mel_kabar_tanto/wpn_third_mel_kabar_tanto"
	self.melee_weapons.kabartanto.stats.min_damage = 2
	self.melee_weapons.kabartanto.stats.max_damage = 8
	self.melee_weapons.kabartanto.stats.min_damage_effect = 0.8
	self.melee_weapons.kabartanto.stats.max_damage_effect = 0.5
	self.melee_weapons.kabartanto.stats.charge_time = 1.7
	self.melee_weapons.kabartanto.stats.range = 185
	self.melee_weapons.kabartanto.stats.concealment = 30
	self.melee_weapons.toothbrush = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.toothbrush.name_id = "bm_melee_toothbrush"
	self.melee_weapons.toothbrush.dlc = "pd2_clan"
	self.melee_weapons.toothbrush.locks = {dlc = "pd2_clan", achievement = "bulldog_1"}
	self.melee_weapons.toothbrush.texture_bundle_folder = nil
	self.melee_weapons.toothbrush.free = nil
	self.melee_weapons.toothbrush.anim_global_param = "melee_stab"
	self.melee_weapons.toothbrush.type = "knife"
	self.melee_weapons.toothbrush.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.toothbrush.unit = "units/pd2_crimefest_2014/oct27/weapons/wpn_fps_mel_toothbrush_shiv/wpn_fps_mel_toothbrush_shiv"
	self.melee_weapons.toothbrush.third_unit = "units/pd2_crimefest_2014/oct27/weapons/wpn_fps_mel_toothbrush_shiv/wpn_third_mel_toothbrush_shiv"
	self.melee_weapons.toothbrush.stats.weapon_type = "sharp"
	self.melee_weapons.toothbrush.stats.min_damage = 2.5
	self.melee_weapons.toothbrush.stats.max_damage = 4
	self.melee_weapons.toothbrush.stats.min_damage_effect = 0.1
	self.melee_weapons.toothbrush.stats.max_damage_effect = 1
	self.melee_weapons.toothbrush.stats.charge_time = 1.5
	self.melee_weapons.toothbrush.stats.range = 150
	self.melee_weapons.toothbrush.sounds = {}
	self.melee_weapons.toothbrush.sounds.equip = "toothbrush_equip"
	self.melee_weapons.toothbrush.sounds.hit_air = "toothbrush_hit_air"
	self.melee_weapons.toothbrush.sounds.hit_gen = "toothbrush_hit_gen"
	self.melee_weapons.toothbrush.sounds.hit_body = "toothbrush_hit_body"
	self.melee_weapons.toothbrush.sounds.charge = "toothbrush_charge"
	self.melee_weapons.toothbrush.repeat_expire_t = 0.3
	self.melee_weapons.toothbrush.stats.concealment = 30
	self.melee_weapons.chef = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.chef.name_id = "bm_melee_chef"
	self.melee_weapons.chef.dlc = "pd2_clan"
	self.melee_weapons.chef.texture_bundle_folder = nil
	self.melee_weapons.chef.free = nil
	self.melee_weapons.chef.anim_global_param = "melee_psycho"
	self.melee_weapons.chef.type = "knife"
	self.melee_weapons.chef.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.chef.unit = "units/pd2_halloween/weapons/wpn_fps_mel_chef/wpn_fps_mel_chef"
	self.melee_weapons.chef.third_unit = "units/pd2_halloween/weapons/wpn_fps_mel_chef/wpn_third_mel_chef"
	self.melee_weapons.chef.stats.weapon_type = "sharp"
	self.melee_weapons.chef.stats.min_damage = 2.8
	self.melee_weapons.chef.stats.max_damage = 14
	self.melee_weapons.chef.stats.min_damage_effect = 1
	self.melee_weapons.chef.stats.max_damage_effect = 1
	self.melee_weapons.chef.stats.charge_time = 4
	self.melee_weapons.chef.stats.range = 150
	self.melee_weapons.chef.sounds = {}
	self.melee_weapons.chef.sounds.equip = "tomahawk_equip"
	self.melee_weapons.chef.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.chef.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.chef.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.chef.sounds.charge = "halloween_charge"
	self.melee_weapons.chef.repeat_expire_t = 0.36
	self.melee_weapons.chef.stats.concealment = 28
	self.melee_weapons.fairbair = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fairbair.name_id = "bm_melee_fairbair"
	self.melee_weapons.fairbair.dlc = "gage_pack_historical"
	self.melee_weapons.fairbair.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.fairbair.free = nil
	self.melee_weapons.fairbair.anim_global_param = "melee_stab"
	self.melee_weapons.fairbair.type = "knife"
	self.melee_weapons.fairbair.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fairbair.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_fairbair/wpn_fps_mel_fairbair"
	self.melee_weapons.fairbair.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_fairbair/wpn_third_mel_fairbair"
	self.melee_weapons.fairbair.stats.weapon_type = "sharp"
	self.melee_weapons.fairbair.stats.min_damage = 3
	self.melee_weapons.fairbair.stats.max_damage = 5
	self.melee_weapons.fairbair.stats.min_damage_effect = 0.2
	self.melee_weapons.fairbair.stats.max_damage_effect = 1
	self.melee_weapons.fairbair.stats.charge_time = 2
	self.melee_weapons.fairbair.stats.range = 175
	self.melee_weapons.fairbair.sounds = {}
	self.melee_weapons.fairbair.sounds.equip = "knife_equip"
	self.melee_weapons.fairbair.sounds.hit_air = "fairbairn_hit_air"
	self.melee_weapons.fairbair.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.fairbair.sounds.hit_body = "fairbairn_hit_body"
	self.melee_weapons.fairbair.sounds.charge = "knife_charge"
	self.melee_weapons.fairbair.repeat_expire_t = 0.3
	self.melee_weapons.fairbair.stats.concealment = 30
	self.melee_weapons.freedom = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.freedom.name_id = "bm_melee_freedom"
	self.melee_weapons.freedom.dlc = "gage_pack_historical"
	self.melee_weapons.freedom.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.freedom.free = nil
	self.melee_weapons.freedom.anim_global_param = "melee_freedom"
	self.melee_weapons.freedom.type = "flag"
	self.melee_weapons.freedom.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.freedom.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_freedom/wpn_fps_mel_freedom"
	self.melee_weapons.freedom.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_mel_freedom/wpn_third_mel_freedom"
	self.melee_weapons.freedom.stats.weapon_type = "sharp"
	self.melee_weapons.freedom.stats.min_damage = 7
	self.melee_weapons.freedom.stats.max_damage = 16
	self.melee_weapons.freedom.stats.min_damage_effect = 1
	self.melee_weapons.freedom.stats.max_damage_effect = 1
	self.melee_weapons.freedom.stats.charge_time = 4
	self.melee_weapons.freedom.stats.range = 275
	self.melee_weapons.freedom.sounds = {}
	self.melee_weapons.freedom.sounds.equip = "freedom_equip"
	self.melee_weapons.freedom.sounds.hit_air = "freedom_hit_air"
	self.melee_weapons.freedom.sounds.hit_gen = "freedom_hit_gen"
	self.melee_weapons.freedom.sounds.hit_body = "freedom_hit_body"
	self.melee_weapons.freedom.sounds.charge = "freedom_charge"
	self.melee_weapons.freedom.repeat_expire_t = 0.9
	self.melee_weapons.freedom.expire_t = 1.3
	self.melee_weapons.freedom.stats.concealment = 18
	self.melee_weapons.freedom.melee_damage_delay = 0.35
	self.melee_weapons.model24 = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.model24.name_id = "bm_melee_model24"
	self.melee_weapons.model24.dlc = "gage_pack_historical"
	self.melee_weapons.model24.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.model24.free = nil
	self.melee_weapons.model24.anim_global_param = "melee_blunt"
	self.melee_weapons.model24.type = "knife"
	self.melee_weapons.model24.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.model24.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_model24/wpn_fps_mel_model24"
	self.melee_weapons.model24.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_model24/wpn_third_mel_model24"
	self.melee_weapons.model24.stats.weapon_type = "sharp"
	self.melee_weapons.model24.stats.min_damage = 3
	self.melee_weapons.model24.stats.max_damage = 6.1
	self.melee_weapons.model24.stats.min_damage_effect = 3.2
	self.melee_weapons.model24.stats.max_damage_effect = 1.5
	self.melee_weapons.model24.stats.charge_time = 2
	self.melee_weapons.model24.stats.range = 185
	self.melee_weapons.model24.sounds = {}
	self.melee_weapons.model24.sounds.equip = "grenade_equip"
	self.melee_weapons.model24.sounds.hit_air = "grenade_hit_air"
	self.melee_weapons.model24.sounds.hit_gen = "grenade_hit_gen"
	self.melee_weapons.model24.sounds.hit_body = "grenade_hit_body"
	self.melee_weapons.model24.sounds.charge = "bat_charge"
	self.melee_weapons.model24.repeat_expire_t = 0.8
	self.melee_weapons.model24.stats.concealment = 27
	self.melee_weapons.swagger = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.swagger.name_id = "bm_melee_swagger"
	self.melee_weapons.swagger.dlc = "gage_pack_historical"
	self.melee_weapons.swagger.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.swagger.free = nil
	self.melee_weapons.swagger.anim_global_param = "melee_axe"
	self.melee_weapons.swagger.type = "knife"
	self.melee_weapons.swagger.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.swagger.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_swagger/wpn_fps_mel_swagger"
	self.melee_weapons.swagger.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_mel_swagger/wpn_third_mel_swagger"
	self.melee_weapons.swagger.stats.weapon_type = "sharp"
	self.melee_weapons.swagger.stats.min_damage = 2
	self.melee_weapons.swagger.stats.max_damage = 3.5
	self.melee_weapons.swagger.stats.min_damage_effect = 3.8
	self.melee_weapons.swagger.stats.max_damage_effect = 4
	self.melee_weapons.swagger.stats.charge_time = 2.2
	self.melee_weapons.swagger.stats.range = 225
	self.melee_weapons.swagger.sounds = {}
	self.melee_weapons.swagger.sounds.equip = "grenade_equip"
	self.melee_weapons.swagger.sounds.hit_air = "grenade_hit_air"
	self.melee_weapons.swagger.sounds.hit_gen = "swagger_hit_gen"
	self.melee_weapons.swagger.sounds.hit_body = "swagger_hit_body"
	self.melee_weapons.swagger.sounds.charge = "bat_charge"
	self.melee_weapons.swagger.repeat_expire_t = 0.8
	self.melee_weapons.swagger.stats.concealment = 27
	self.melee_weapons.alien_maul = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.alien_maul.name_id = "bm_melee_alien_maul"
	self.melee_weapons.alien_maul.anim_global_param = "melee_baseballbat"
	self.melee_weapons.alien_maul.type = "axe"
	self.melee_weapons.alien_maul.texture_bundle_folder = "alienware_alpha"
	self.melee_weapons.alien_maul.dlc = "alienware_alpha_promo"
	self.melee_weapons.alien_maul.free = nil
	self.melee_weapons.alien_maul.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.alien_maul.unit = "units/pd2_dlc_alienware/weapons/wpn_fps_mel_maul/wpn_fps_mel_maul"
	self.melee_weapons.alien_maul.third_unit = "units/pd2_dlc_alienware/weapons/wpn_fps_mel_maul/wpn_third_mel_maul"
	self.melee_weapons.alien_maul.stats.weapon_type = "blunt"
	self.melee_weapons.alien_maul.stats.min_damage = 2.9
	self.melee_weapons.alien_maul.stats.max_damage = 6
	self.melee_weapons.alien_maul.stats.min_damage_effect = 3.9
	self.melee_weapons.alien_maul.stats.max_damage_effect = 3.1
	self.melee_weapons.alien_maul.stats.charge_time = 2
	self.melee_weapons.alien_maul.stats.range = 275
	self.melee_weapons.alien_maul.stats.weapon_type = "blunt"
	self.melee_weapons.alien_maul.sounds = {}
	self.melee_weapons.alien_maul.repeat_expire_t = 1
	self.melee_weapons.alien_maul.expire_t = 1.2
	self.melee_weapons.alien_maul.sounds.equip = "alpha_equip"
	self.melee_weapons.alien_maul.sounds.hit_air = "alpha_hit_air"
	self.melee_weapons.alien_maul.sounds.hit_gen = "alpha_hit_gen"
	self.melee_weapons.alien_maul.sounds.hit_body = "alpha_hit_body"
	self.melee_weapons.alien_maul.sounds.charge = "alpha_charge"
	self.melee_weapons.alien_maul.melee_damage_delay = 0.2
	self.melee_weapons.alien_maul.stats.concealment = 20
	self.melee_weapons.shillelagh = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.shillelagh.name_id = "bm_melee_shillelagh"
	self.melee_weapons.shillelagh.dlc = "character_pack_clover"
	self.melee_weapons.shillelagh.texture_bundle_folder = "character_pack_clover"
	self.melee_weapons.shillelagh.free = nil
	self.melee_weapons.shillelagh.anim_global_param = "melee_blunt"
	self.melee_weapons.shillelagh.type = "knife"
	self.melee_weapons.shillelagh.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shillelagh.unit = "units/pd2_dlc_clover/weapons/wpn_fps_mel_shillelagh/wpn_fps_mel_shillelagh"
	self.melee_weapons.shillelagh.third_unit = "units/pd2_dlc_clover/weapons/wpn_fps_mel_shillelagh/wpn_third_mel_shillelagh"
	self.melee_weapons.shillelagh.stats.weapon_type = "sharp"
	self.melee_weapons.shillelagh.stats.min_damage = 3.5
	self.melee_weapons.shillelagh.stats.max_damage = 6.5
	self.melee_weapons.shillelagh.stats.min_damage_effect = 4
	self.melee_weapons.shillelagh.stats.max_damage_effect = 3
	self.melee_weapons.shillelagh.stats.charge_time = 2
	self.melee_weapons.shillelagh.stats.range = 185
	self.melee_weapons.shillelagh.sounds = {}
	self.melee_weapons.shillelagh.sounds.equip = "shillelagh_equip"
	self.melee_weapons.shillelagh.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.shillelagh.sounds.hit_gen = "shillelagh_hit_gen"
	self.melee_weapons.shillelagh.sounds.hit_body = "shillelagh_hit_body"
	self.melee_weapons.shillelagh.sounds.charge = "baton_charge"
	self.melee_weapons.shillelagh.repeat_expire_t = 0.8
	self.melee_weapons.shillelagh.stats.concealment = 26
	self.melee_weapons.boxing_gloves = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.boxing_gloves.name_id = "bm_melee_boxing_gloves"
	self.melee_weapons.boxing_gloves.free = nil
	self.melee_weapons.boxing_gloves.type = "fists"
	self.melee_weapons.boxing_gloves.dlc = nil
	self.melee_weapons.boxing_gloves.texture_bundle_folder = "pd2_hw_boxing"
	self.melee_weapons.boxing_gloves.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.boxing_gloves.graphic_objects = {a_weapon_left = "g_glove_2", a_weapon_right = "g_glove_1"}
	self.melee_weapons.boxing_gloves.unit = "units/pd2_hw_boxing/weapons/wpn_fps_mel_boxing_gloves/wpn_fps_mel_boxing_gloves"
	self.melee_weapons.boxing_gloves.third_unit = "units/pd2_hw_boxing/weapons/wpn_fps_mel_boxing_gloves/wpn_third_mel_boxing_gloves"
	self.melee_weapons.boxing_gloves.menu_scene_anim = "menu"
	self.melee_weapons.boxing_gloves.menu_scene_params = {loop = false, start_time = -1}
	self.melee_weapons.boxing_gloves.anim_global_param = "melee_boxing"
	self.melee_weapons.boxing_gloves.stats.min_damage = 1.5
	self.melee_weapons.boxing_gloves.stats.max_damage = 3.5
	self.melee_weapons.boxing_gloves.stats.min_damage_effect = 4
	self.melee_weapons.boxing_gloves.stats.max_damage_effect = 3
	self.melee_weapons.boxing_gloves.stats.charge_time = 1.3
	self.melee_weapons.boxing_gloves.stats.range = 150
	self.melee_weapons.boxing_gloves.sounds.hit_gen = "boxing_hit_gen"
	self.melee_weapons.boxing_gloves.sounds.hit_body = "boxing_hit_body"
	self.melee_weapons.boxing_gloves.sounds.equip = "boxing_equip"
	self.melee_weapons.boxing_gloves.sounds.hit_air = "fist_hit_air"
	self.melee_weapons.boxing_gloves.sounds.charge = "boxing_charge"
	self.melee_weapons.boxing_gloves.stats.concealment = 30
	self.melee_weapons.meat_cleaver = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.meat_cleaver.name_id = "bm_melee_meat_cleaver"
	self.melee_weapons.meat_cleaver.anim_global_param = "melee_axe"
	self.melee_weapons.meat_cleaver.dlc = "character_pack_dragan"
	self.melee_weapons.meat_cleaver.texture_bundle_folder = "character_pack_dragan"
	self.melee_weapons.meat_cleaver.type = "axe"
	self.melee_weapons.meat_cleaver.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.meat_cleaver.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_mel_meat_cleaver/wpn_fps_mel_meat_cleaver"
	self.melee_weapons.meat_cleaver.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_mel_meat_cleaver/wpn_third_mel_meat_cleaver"
	self.melee_weapons.meat_cleaver.sounds = {}
	self.melee_weapons.meat_cleaver.sounds.equip = "cleaver_equip"
	self.melee_weapons.meat_cleaver.sounds.hit_air = "cleaver_hit_air"
	self.melee_weapons.meat_cleaver.sounds.hit_gen = "cleaver_hit_gen"
	self.melee_weapons.meat_cleaver.sounds.hit_body = "cleaver_hit_body"
	self.melee_weapons.meat_cleaver.sounds.charge = "cleaver_charge"
	self.melee_weapons.meat_cleaver.stats.min_damage = 3
	self.melee_weapons.meat_cleaver.stats.max_damage = 7.5
	self.melee_weapons.meat_cleaver.stats.min_damage_effect = 0.5
	self.melee_weapons.meat_cleaver.stats.max_damage_effect = 0.6
	self.melee_weapons.meat_cleaver.stats.charge_time = 2
	self.melee_weapons.meat_cleaver.stats.range = 195
	self.melee_weapons.meat_cleaver.stats.concealment = 26
	self.melee_weapons.hammer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.hammer.name_id = "bm_melee_hammer"
	self.melee_weapons.hammer.dlc = "hlm2_deluxe"
	self.melee_weapons.hammer.texture_bundle_folder = "hlm2"
	self.melee_weapons.hammer.free = nil
	self.melee_weapons.hammer.anim_global_param = "melee_blunt"
	self.melee_weapons.hammer.type = "axe"
	self.melee_weapons.hammer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.hammer.unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_mel_hammer/wpn_fps_mel_hammer"
	self.melee_weapons.hammer.third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_mel_hammer/wpn_third_mel_hammer"
	self.melee_weapons.hammer.stats.weapon_type = "blunt"
	self.melee_weapons.hammer.stats.min_damage = 3
	self.melee_weapons.hammer.stats.max_damage = 6.1
	self.melee_weapons.hammer.stats.min_damage_effect = 3.2
	self.melee_weapons.hammer.stats.max_damage_effect = 1.6
	self.melee_weapons.hammer.stats.charge_time = 2
	self.melee_weapons.hammer.stats.range = 185
	self.melee_weapons.hammer.sounds = {}
	self.melee_weapons.hammer.sounds.equip = "hammer_equip"
	self.melee_weapons.hammer.sounds.hit_air = "hammer_hit_air"
	self.melee_weapons.hammer.sounds.hit_gen = "hammer_hit_gen"
	self.melee_weapons.hammer.sounds.hit_body = "hammer_hit_body"
	self.melee_weapons.hammer.sounds.charge = "hammer_charge"
	self.melee_weapons.hammer.repeat_expire_t = 0.8
	self.melee_weapons.hammer.stats.concealment = 27
	self.melee_weapons.whiskey = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.whiskey.name_id = "bm_melee_whiskey"
	self.melee_weapons.whiskey.dlc = "pd2_clan"
	self.melee_weapons.whiskey.texture_bundle_folder = "character_pack_bonnie"
	self.melee_weapons.whiskey.free = nil
	self.melee_weapons.whiskey.anim_global_param = "melee_blunt"
	self.melee_weapons.whiskey.type = "axe"
	self.melee_weapons.whiskey.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.whiskey.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_mel_whiskey/wpn_fps_mel_whiskey"
	self.melee_weapons.whiskey.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_mel_whiskey/wpn_third_mel_whiskey"
	self.melee_weapons.whiskey.stats.weapon_type = "blunt"
	self.melee_weapons.whiskey.stats.min_damage = 3
	self.melee_weapons.whiskey.stats.max_damage = 5.5
	self.melee_weapons.whiskey.stats.min_damage_effect = 3
	self.melee_weapons.whiskey.stats.max_damage_effect = 2
	self.melee_weapons.whiskey.stats.charge_time = 2
	self.melee_weapons.whiskey.stats.range = 185
	self.melee_weapons.whiskey.sounds = {}
	self.melee_weapons.whiskey.sounds.equip = "whiskey_equip"
	self.melee_weapons.whiskey.sounds.hit_air = "whiskey_hit_air"
	self.melee_weapons.whiskey.sounds.hit_gen = "whiskey_hit_gen"
	self.melee_weapons.whiskey.sounds.hit_body = "whiskey_hit_body"
	self.melee_weapons.whiskey.sounds.charge = "whiskey_charge"
	self.melee_weapons.whiskey.repeat_expire_t = 0.8
	self.melee_weapons.whiskey.stats.concealment = 27
	self.melee_weapons.fork = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fork.name_id = "bm_melee_fork"
	self.melee_weapons.fork.dlc = "bbq"
	self.melee_weapons.fork.texture_bundle_folder = "bbq"
	self.melee_weapons.fork.anim_global_param = "melee_stab"
	self.melee_weapons.fork.type = "axe"
	self.melee_weapons.fork.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fork.unit = "units/pd2_dlc_bbq/weapons/fork/wpn_fps_mel_fork"
	self.melee_weapons.fork.third_unit = "units/pd2_dlc_bbq/weapons/fork/wpn_third_mel_fork"
	self.melee_weapons.fork.stats.weapon_type = "sharp"
	self.melee_weapons.fork.stats.min_damage = 4
	self.melee_weapons.fork.stats.max_damage = 9
	self.melee_weapons.fork.stats.min_damage_effect = 0.25
	self.melee_weapons.fork.stats.max_damage_effect = 0.5
	self.melee_weapons.fork.stats.charge_time = 2
	self.melee_weapons.fork.stats.range = 185
	self.melee_weapons.fork.sounds = {}
	self.melee_weapons.fork.sounds.equip = "bbq_fork_equip"
	self.melee_weapons.fork.sounds.hit_air = "bbq_fork_hit_air"
	self.melee_weapons.fork.sounds.hit_gen = "bbq_fork_hit_gen"
	self.melee_weapons.fork.sounds.hit_body = "bbq_fork_hit_body"
	self.melee_weapons.fork.sounds.charge = "bbq_fork_charge"
	self.melee_weapons.fork.repeat_expire_t = 0.3
	self.melee_weapons.fork.stats.concealment = 27
	self.melee_weapons.poker = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.poker.name_id = "bm_melee_poker"
	self.melee_weapons.poker.dlc = "bbq"
	self.melee_weapons.poker.texture_bundle_folder = "bbq"
	self.melee_weapons.poker.anim_global_param = "melee_blunt"
	self.melee_weapons.poker.type = "axe"
	self.melee_weapons.poker.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.poker.unit = "units/pd2_dlc_bbq/weapons/poker/wpn_fps_mel_poker"
	self.melee_weapons.poker.third_unit = "units/pd2_dlc_bbq/weapons/poker/wpn_third_mel_poker"
	self.melee_weapons.poker.stats.weapon_type = "blunt"
	self.melee_weapons.poker.stats.min_damage = 6
	self.melee_weapons.poker.stats.max_damage = 12
	self.melee_weapons.poker.stats.min_damage_effect = 1.7
	self.melee_weapons.poker.stats.max_damage_effect = 2
	self.melee_weapons.poker.stats.charge_time = 3
	self.melee_weapons.poker.stats.range = 185
	self.melee_weapons.poker.sounds = {}
	self.melee_weapons.poker.sounds.equip = "bbq_poker_equip"
	self.melee_weapons.poker.sounds.hit_air = "bbq_poker_hit_air"
	self.melee_weapons.poker.sounds.hit_gen = "bbq_poker_hit_gen"
	self.melee_weapons.poker.sounds.hit_body = "bbq_poker_hit_body"
	self.melee_weapons.poker.sounds.charge = "bbq_poker_charge"
	self.melee_weapons.poker.repeat_expire_t = 0.8
	self.melee_weapons.poker.stats.concealment = 27
	self.melee_weapons.spatula = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.spatula.name_id = "bm_melee_spatula"
	self.melee_weapons.spatula.dlc = "bbq"
	self.melee_weapons.spatula.texture_bundle_folder = "bbq"
	self.melee_weapons.spatula.anim_global_param = "melee_axe"
	self.melee_weapons.spatula.type = "axe"
	self.melee_weapons.spatula.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.spatula.unit = "units/pd2_dlc_bbq/weapons/spatula/wpn_fps_mel_spatula"
	self.melee_weapons.spatula.third_unit = "units/pd2_dlc_bbq/weapons/spatula/wpn_third_mel_spatula"
	self.melee_weapons.spatula.stats.weapon_type = "blunt"
	self.melee_weapons.spatula.stats.min_damage = 2
	self.melee_weapons.spatula.stats.max_damage = 3
	self.melee_weapons.spatula.stats.min_damage_effect = 1.5
	self.melee_weapons.spatula.stats.max_damage_effect = 2
	self.melee_weapons.spatula.stats.charge_time = 1
	self.melee_weapons.spatula.stats.range = 185
	self.melee_weapons.spatula.sounds = {}
	self.melee_weapons.spatula.sounds.equip = "bbq_spatula_equip"
	self.melee_weapons.spatula.sounds.hit_air = "bbq_spatula_hit_air"
	self.melee_weapons.spatula.sounds.hit_gen = "bbq_spatula_hit_gen"
	self.melee_weapons.spatula.sounds.hit_body = "bbq_spatula_hit_body"
	self.melee_weapons.spatula.sounds.charge = "bbq_spatula_charge"
	self.melee_weapons.spatula.repeat_expire_t = 0.8
	self.melee_weapons.spatula.stats.concealment = 27
	self.melee_weapons.tenderizer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.tenderizer.name_id = "bm_melee_tenderizer"
	self.melee_weapons.tenderizer.dlc = "bbq"
	self.melee_weapons.tenderizer.texture_bundle_folder = "bbq"
	self.melee_weapons.tenderizer.anim_global_param = "melee_blunt"
	self.melee_weapons.tenderizer.type = "axe"
	self.melee_weapons.tenderizer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.tenderizer.unit = "units/pd2_dlc_bbq/weapons/wpn_mel_tenderizer/wpn_fps_mel_tenderizer"
	self.melee_weapons.tenderizer.third_unit = "units/pd2_dlc_bbq/weapons/wpn_mel_tenderizer/wpn_third_mel_tenderizer"
	self.melee_weapons.tenderizer.stats.weapon_type = "blunt"
	self.melee_weapons.tenderizer.stats.min_damage = 3
	self.melee_weapons.tenderizer.stats.max_damage = 9
	self.melee_weapons.tenderizer.stats.min_damage_effect = 2
	self.melee_weapons.tenderizer.stats.max_damage_effect = 1.6
	self.melee_weapons.tenderizer.stats.charge_time = 3
	self.melee_weapons.tenderizer.stats.range = 185
	self.melee_weapons.tenderizer.sounds = {}
	self.melee_weapons.tenderizer.sounds.equip = "bbq_tenderizer_equip"
	self.melee_weapons.tenderizer.sounds.hit_air = "bbq_tenderizer_hit_air"
	self.melee_weapons.tenderizer.sounds.hit_gen = "bbq_tenderizer_hit_gen"
	self.melee_weapons.tenderizer.sounds.hit_body = "bbq_tenderizer_hit_body"
	self.melee_weapons.tenderizer.sounds.charge = "bbq_tenderizer_charge"
	self.melee_weapons.tenderizer.repeat_expire_t = 0.8
	self.melee_weapons.tenderizer.stats.concealment = 27
	self.melee_weapons.scalper = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.scalper.name_id = "bm_melee_scalper"
	self.melee_weapons.scalper.dlc = "west"
	self.melee_weapons.scalper.texture_bundle_folder = "west"
	self.melee_weapons.scalper.anim_global_param = "melee_axe"
	self.melee_weapons.scalper.type = "axe"
	self.melee_weapons.scalper.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.scalper.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_scalper/wpn_fps_mel_scalper"
	self.melee_weapons.scalper.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_scalper/wpn_third_mel_scalper"
	self.melee_weapons.scalper.stats.weapon_type = "sharp"
	self.melee_weapons.scalper.stats.min_damage = 4
	self.melee_weapons.scalper.stats.max_damage = 6.64
	self.melee_weapons.scalper.stats.min_damage_effect = 0.5
	self.melee_weapons.scalper.stats.max_damage_effect = 0.6
	self.melee_weapons.scalper.stats.charge_time = 2
	self.melee_weapons.scalper.stats.range = 200
	self.melee_weapons.scalper.expire_t = 1.1
	self.melee_weapons.scalper.repeat_expire_t = 0.8
	self.melee_weapons.scalper.attack_allowed_expire_t = 0.1
	self.melee_weapons.scalper.sounds = {}
	self.melee_weapons.scalper.sounds.equip = "tomahawk_equip"
	self.melee_weapons.scalper.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.scalper.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.scalper.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.scalper.sounds.charge = "tomahawk_charge"
	self.melee_weapons.scalper.stats.concealment = 25
	self.melee_weapons.mining_pick = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.mining_pick.name_id = "bm_melee_mining_pick"
	self.melee_weapons.mining_pick.dlc = "west"
	self.melee_weapons.mining_pick.texture_bundle_folder = "west"
	self.melee_weapons.mining_pick.anim_global_param = "melee_pickaxe"
	self.melee_weapons.mining_pick.type = "axe"
	self.melee_weapons.mining_pick.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.mining_pick.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_miningpick/wpn_fps_mel_miningpick"
	self.melee_weapons.mining_pick.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_miningpick/wpn_third_mel_miningpick"
	self.melee_weapons.mining_pick.stats.weapon_type = "sharp"
	self.melee_weapons.mining_pick.stats.min_damage = 3.5
	self.melee_weapons.mining_pick.stats.max_damage = 8
	self.melee_weapons.mining_pick.stats.min_damage_effect = 0.5
	self.melee_weapons.mining_pick.stats.max_damage_effect = 0.6
	self.melee_weapons.mining_pick.stats.charge_time = 3
	self.melee_weapons.mining_pick.stats.range = 225
	self.melee_weapons.mining_pick.expire_t = 1.1
	self.melee_weapons.mining_pick.repeat_expire_t = 0.8
	self.melee_weapons.mining_pick.attack_allowed_expire_t = 0.1
	self.melee_weapons.mining_pick.sounds = {}
	self.melee_weapons.mining_pick.sounds.equip = "mining_pick_equip"
	self.melee_weapons.mining_pick.sounds.hit_air = "mining_pick_hit_air"
	self.melee_weapons.mining_pick.sounds.hit_gen = "mining_pick_hit_gen"
	self.melee_weapons.mining_pick.sounds.hit_body = "mining_pick_hit_body"
	self.melee_weapons.mining_pick.sounds.charge = "mining_pick_charge"
	self.melee_weapons.mining_pick.stats.concealment = 20
	self.melee_weapons.branding_iron = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.branding_iron.name_id = "bm_melee_branding_iron"
	self.melee_weapons.branding_iron.dlc = "west"
	self.melee_weapons.branding_iron.texture_bundle_folder = "west"
	self.melee_weapons.branding_iron.anim_global_param = "melee_blunt"
	self.melee_weapons.branding_iron.type = "axe"
	self.melee_weapons.branding_iron.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.branding_iron.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_branding/wpn_fps_mel_branding"
	self.melee_weapons.branding_iron.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_branding/wpn_third_mel_branding"
	self.melee_weapons.branding_iron.stats.weapon_type = "sharp"
	self.melee_weapons.branding_iron.stats.min_damage = 3
	self.melee_weapons.branding_iron.stats.max_damage = 6.1
	self.melee_weapons.branding_iron.stats.min_damage_effect = 3.2
	self.melee_weapons.branding_iron.stats.max_damage_effect = 1.6
	self.melee_weapons.branding_iron.stats.charge_time = 2
	self.melee_weapons.branding_iron.stats.range = 225
	self.melee_weapons.branding_iron.expire_t = 1.1
	self.melee_weapons.branding_iron.repeat_expire_t = 0.8
	self.melee_weapons.branding_iron.attack_allowed_expire_t = 0.1
	self.melee_weapons.branding_iron.sounds = {}
	self.melee_weapons.branding_iron.sounds.equip = "branding_iron_equip"
	self.melee_weapons.branding_iron.sounds.hit_air = "branding_iron_hit_air"
	self.melee_weapons.branding_iron.sounds.hit_gen = "branding_iron_hit_gen"
	self.melee_weapons.branding_iron.sounds.hit_body = "branding_iron_hit_body"
	self.melee_weapons.branding_iron.sounds.charge = "branding_iron_charge"
	self.melee_weapons.branding_iron.stats.concealment = 20
	self.melee_weapons.bowie = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.bowie.name_id = "bm_melee_bowie"
	self.melee_weapons.bowie.dlc = "west"
	self.melee_weapons.bowie.texture_bundle_folder = "west"
	self.melee_weapons.bowie.anim_global_param = "melee_knife"
	self.melee_weapons.bowie.type = "knife"
	self.melee_weapons.bowie.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.bowie.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_bowie/wpn_fps_mel_bowie"
	self.melee_weapons.bowie.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_bowie/wpn_third_mel_bowie"
	self.melee_weapons.bowie.stats.weapon_type = "sharp"
	self.melee_weapons.bowie.stats.min_damage = 3
	self.melee_weapons.bowie.stats.max_damage = 6.1
	self.melee_weapons.bowie.stats.min_damage_effect = 3.2
	self.melee_weapons.bowie.stats.max_damage_effect = 1.5
	self.melee_weapons.bowie.stats.charge_time = 2
	self.melee_weapons.bowie.stats.range = 225
	self.melee_weapons.bowie.expire_t = 1.1
	self.melee_weapons.bowie.repeat_expire_t = 0.8
	self.melee_weapons.bowie.attack_allowed_expire_t = 0.1
	self.melee_weapons.bowie.sounds = {}
	self.melee_weapons.bowie.sounds.equip = "knife_equip"
	self.melee_weapons.bowie.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.bowie.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.bowie.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.bowie.sounds.charge = "knife_charge"
	self.melee_weapons.bowie.stats.concealment = 27
	self.melee_weapons.microphone = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.microphone.name_id = "bm_melee_microphone"
	self.melee_weapons.microphone.dlc = "arena"
	self.melee_weapons.microphone.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.microphone.anim_global_param = "melee_axe"
	self.melee_weapons.microphone.type = "axe"
	self.melee_weapons.microphone.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.microphone.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_microphone/wpn_fps_mel_microphone"
	self.melee_weapons.microphone.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_microphone/wpn_third_mel_microphone"
	self.melee_weapons.microphone.stats.weapon_type = "sharp"
	self.melee_weapons.microphone.stats.min_damage = 1.5
	self.melee_weapons.microphone.stats.max_damage = 3.5
	self.melee_weapons.microphone.stats.min_damage_effect = 4
	self.melee_weapons.microphone.stats.max_damage_effect = 3
	self.melee_weapons.microphone.stats.charge_time = 1.3
	self.melee_weapons.microphone.stats.range = 150
	self.melee_weapons.microphone.expire_t = 1.1
	self.melee_weapons.microphone.repeat_expire_t = 0.8
	self.melee_weapons.microphone.attack_allowed_expire_t = 0.1
	self.melee_weapons.microphone.sounds = {}
	self.melee_weapons.microphone.sounds.equip = "microphone_equip"
	self.melee_weapons.microphone.sounds.hit_air = "microphone_hit_air"
	self.melee_weapons.microphone.sounds.hit_gen = "microphone_hit_gen"
	self.melee_weapons.microphone.sounds.hit_body = "microphone_hit_body"
	self.melee_weapons.microphone.sounds.charge = "microphone_charge"
	self.melee_weapons.microphone.stats.concealment = 30
	self.melee_weapons.detector = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.detector.name_id = "bm_melee_detector"
	self.melee_weapons.detector.dlc = "arena"
	self.melee_weapons.detector.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.detector.anim_global_param = "melee_axe"
	self.melee_weapons.detector.type = "axe"
	self.melee_weapons.detector.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.detector.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_detector/wpn_fps_mel_detector"
	self.melee_weapons.detector.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_detector/wpn_third_mel_detector"
	self.melee_weapons.detector.stats.weapon_type = "sharp"
	self.melee_weapons.detector.stats.min_damage = 3
	self.melee_weapons.detector.stats.max_damage = 5.5
	self.melee_weapons.detector.stats.min_damage_effect = 3
	self.melee_weapons.detector.stats.max_damage_effect = 2
	self.melee_weapons.detector.stats.charge_time = 2
	self.melee_weapons.detector.stats.range = 225
	self.melee_weapons.detector.expire_t = 1.1
	self.melee_weapons.detector.repeat_expire_t = 0.8
	self.melee_weapons.detector.attack_allowed_expire_t = 0.1
	self.melee_weapons.detector.sounds = {}
	self.melee_weapons.detector.sounds.equip = "metal_detector_equip"
	self.melee_weapons.detector.sounds.hit_air = "metal_detector_hit_air"
	self.melee_weapons.detector.sounds.hit_gen = "metal_detector_hit_gen"
	self.melee_weapons.detector.sounds.hit_body = "metal_detector_hit_body"
	self.melee_weapons.detector.sounds.charge = "metal_detector_charge"
	self.melee_weapons.detector.stats.concealment = 26
	self.melee_weapons.micstand = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.micstand.name_id = "bm_melee_micstand"
	self.melee_weapons.micstand.dlc = "arena"
	self.melee_weapons.micstand.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.micstand.anim_global_param = "melee_pickaxe"
	self.melee_weapons.micstand.type = "axe"
	self.melee_weapons.micstand.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.micstand.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_micstand/wpn_fps_mel_micstand"
	self.melee_weapons.micstand.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_micstand/wpn_third_mel_micstand"
	self.melee_weapons.micstand.stats.weapon_type = "sharp"
	self.melee_weapons.micstand.stats.min_damage = 2
	self.melee_weapons.micstand.stats.max_damage = 3
	self.melee_weapons.micstand.stats.min_damage_effect = 1.5
	self.melee_weapons.micstand.stats.max_damage_effect = 2
	self.melee_weapons.micstand.stats.charge_time = 1
	self.melee_weapons.micstand.stats.range = 250
	self.melee_weapons.micstand.expire_t = 1.1
	self.melee_weapons.micstand.repeat_expire_t = 0.8
	self.melee_weapons.micstand.attack_allowed_expire_t = 0.1
	self.melee_weapons.micstand.sounds = {}
	self.melee_weapons.micstand.sounds.equip = "mic_stand_equip"
	self.melee_weapons.micstand.sounds.hit_air = "mic_stand_hit_air"
	self.melee_weapons.micstand.sounds.hit_gen = "mic_stand_hit_gen"
	self.melee_weapons.micstand.sounds.hit_body = "mic_stand_hit_body"
	self.melee_weapons.micstand.sounds.charge = "mic_stand_charge"
	self.melee_weapons.micstand.stats.concealment = 24
	self.melee_weapons.oldbaton = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.oldbaton.name_id = "bm_melee_oldbaton"
	self.melee_weapons.oldbaton.dlc = "arena"
	self.melee_weapons.oldbaton.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.oldbaton.anim_global_param = "melee_blunt"
	self.melee_weapons.oldbaton.type = "axe"
	self.melee_weapons.oldbaton.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.oldbaton.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_oldbaton/wpn_fps_mel_oldbaton"
	self.melee_weapons.oldbaton.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_oldbaton/wpn_third_mel_oldbaton"
	self.melee_weapons.oldbaton.stats.weapon_type = "sharp"
	self.melee_weapons.oldbaton.stats.min_damage = 0.68
	self.melee_weapons.oldbaton.stats.max_damage = 1.68
	self.melee_weapons.oldbaton.stats.min_damage_effect = 12
	self.melee_weapons.oldbaton.stats.max_damage_effect = 8.8
	self.melee_weapons.oldbaton.stats.charge_time = 2
	self.melee_weapons.oldbaton.stats.range = 250
	self.melee_weapons.oldbaton.expire_t = 1.1
	self.melee_weapons.oldbaton.repeat_expire_t = 0.8
	self.melee_weapons.oldbaton.attack_allowed_expire_t = 0.1
	self.melee_weapons.oldbaton.sounds = {}
	self.melee_weapons.oldbaton.sounds.equip = "copbaton_equip"
	self.melee_weapons.oldbaton.sounds.hit_air = "copbaton_hit_air"
	self.melee_weapons.oldbaton.sounds.hit_gen = "copbaton_hit_gen"
	self.melee_weapons.oldbaton.sounds.hit_body = "copbaton_hit_body"
	self.melee_weapons.oldbaton.sounds.charge = "copbaton_charge"
	self.melee_weapons.oldbaton.stats.concealment = 27
	self.melee_weapons.hockey = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.hockey.name_id = "bm_melee_hockey"
	self.melee_weapons.hockey.dlc = "character_pack_sokol"
	self.melee_weapons.hockey.texture_bundle_folder = "character_pack_sokol"
	self.melee_weapons.hockey.anim_global_param = "melee_pickaxe"
	self.melee_weapons.hockey.type = "axe"
	self.melee_weapons.hockey.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.hockey.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_mel_hockey/wpn_fps_mel_hockey"
	self.melee_weapons.hockey.third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_mel_hockey/wpn_third_mel_hockey"
	self.melee_weapons.hockey.stats.weapon_type = "sharp"
	self.melee_weapons.hockey.stats.min_damage = 3.5
	self.melee_weapons.hockey.stats.max_damage = 6
	self.melee_weapons.hockey.stats.min_damage_effect = 4
	self.melee_weapons.hockey.stats.max_damage_effect = 3.2
	self.melee_weapons.hockey.stats.charge_time = 2.4
	self.melee_weapons.hockey.stats.range = 250
	self.melee_weapons.hockey.expire_t = 1.1
	self.melee_weapons.hockey.repeat_expire_t = 0.8
	self.melee_weapons.hockey.attack_allowed_expire_t = 0.1
	self.melee_weapons.hockey.sounds = {}
	self.melee_weapons.hockey.sounds.equip = "bat_equip"
	self.melee_weapons.hockey.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.hockey.sounds.hit_gen = "hockeystick_hit_gen"
	self.melee_weapons.hockey.sounds.hit_body = "hockeystick_hit_body"
	self.melee_weapons.hockey.sounds.charge = "bat_charge"
	self.melee_weapons.hockey.stats.concealment = 24
	self.melee_weapons.switchblade = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.switchblade.name_id = "bm_melee_switchblade"
	self.melee_weapons.switchblade.anim_global_param = "melee_stab"
	self.melee_weapons.switchblade.dlc = "kenaz"
	self.melee_weapons.switchblade.texture_bundle_folder = "kenaz"
	self.melee_weapons.switchblade.type = "knife"
	self.melee_weapons.switchblade.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.switchblade.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_switchblade/wpn_fps_mel_switchblade"
	self.melee_weapons.switchblade.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_switchblade/wpn_third_mel_switchblade"
	self.melee_weapons.switchblade.sounds = {}
	self.melee_weapons.switchblade.sounds.equip = "toothbrush_equip"
	self.melee_weapons.switchblade.sounds.hit_air = "toothbrush_hit_air"
	self.melee_weapons.switchblade.sounds.hit_gen = "toothbrush_hit_gen"
	self.melee_weapons.switchblade.sounds.hit_body = "toothbrush_hit_body"
	self.melee_weapons.switchblade.sounds.charge = "toothbrush_charge"
	self.melee_weapons.switchblade.stats.min_damage = 3
	self.melee_weapons.switchblade.stats.max_damage = 5
	self.melee_weapons.switchblade.stats.min_damage_effect = 0.2
	self.melee_weapons.switchblade.stats.max_damage_effect = 1
	self.melee_weapons.switchblade.stats.charge_time = 2
	self.melee_weapons.switchblade.stats.range = 175
	self.melee_weapons.switchblade.stats.concealment = 30
	self.melee_weapons.switchblade.repeat_expire_t = 0.3
	self.melee_weapons.switchblade.expire_t = 0.8
	self.melee_weapons.switchblade.melee_damage_delay = 0.1
	self.melee_weapons.taser = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.taser.name_id = "bm_melee_taser"
	self.melee_weapons.taser.info_id = "bm_melee_taser_info"
	self.melee_weapons.taser.anim_global_param = "melee_taser"
	self.melee_weapons.taser.dlc = "kenaz"
	self.melee_weapons.taser.texture_bundle_folder = "kenaz"
	self.melee_weapons.taser.type = "knife"
	self.melee_weapons.taser.special_weapon = "taser"
	self.melee_weapons.taser.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.taser.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_taser/wpn_fps_mel_taser"
	self.melee_weapons.taser.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_taser/wpn_third_mel_taser"
	self.melee_weapons.taser.sounds = {}
	self.melee_weapons.taser.sounds.equip = "buzzer_detector_equip"
	self.melee_weapons.taser.sounds.hit_air = "buzzer_detector_hit_air"
	self.melee_weapons.taser.sounds.hit_gen = "buzzer_detector_hit_gen"
	self.melee_weapons.taser.sounds.hit_body = "buzzer_detector_hit_body"
	self.melee_weapons.taser.sounds.charge = "buzzer_charge"
	self.melee_weapons.taser.stats.min_damage = 2
	self.melee_weapons.taser.stats.max_damage = 2
	self.melee_weapons.taser.stats.min_damage_effect = 1
	self.melee_weapons.taser.stats.max_damage_effect = 1
	self.melee_weapons.taser.stats.charge_time = 3.5
	self.melee_weapons.taser.stats.range = 200
	self.melee_weapons.taser.stats.concealment = 30
	self.melee_weapons.taser.expire_t = 1
	self.melee_weapons.taser.repeat_expire_t = 0.7
	self.melee_weapons.taser.melee_damage_delay = 0.1
	self.melee_weapons.slot_lever = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.slot_lever.name_id = "bm_melee_slot_lever"
	self.melee_weapons.slot_lever.anim_global_param = "melee_axe"
	self.melee_weapons.slot_lever.dlc = "kenaz"
	self.melee_weapons.slot_lever.texture_bundle_folder = "kenaz"
	self.melee_weapons.slot_lever.type = "knife"
	self.melee_weapons.slot_lever.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.slot_lever.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_slot_lever/wpn_fps_mel_slot_lever"
	self.melee_weapons.slot_lever.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_slot_lever/wpn_third_mel_slot_lever"
	self.melee_weapons.slot_lever.sounds = {}
	self.melee_weapons.slot_lever.sounds.equip = "slot_lever_equip"
	self.melee_weapons.slot_lever.sounds.hit_air = "slot_lever_hit_air"
	self.melee_weapons.slot_lever.sounds.hit_gen = "slot_lever_hit_gen"
	self.melee_weapons.slot_lever.sounds.hit_body = "slot_lever_hit_body"
	self.melee_weapons.slot_lever.sounds.charge = "slot_lever_charge"
	self.melee_weapons.slot_lever.stats.min_damage = 3
	self.melee_weapons.slot_lever.stats.max_damage = 6.1
	self.melee_weapons.slot_lever.stats.min_damage_effect = 3.2
	self.melee_weapons.slot_lever.stats.max_damage_effect = 1.6
	self.melee_weapons.slot_lever.stats.charge_time = 2
	self.melee_weapons.slot_lever.stats.range = 225
	self.melee_weapons.slot_lever.stats.concealment = 20
	self.melee_weapons.slot_lever.expire_t = 1
	self.melee_weapons.slot_lever.repeat_expire_t = 0.7
	self.melee_weapons.slot_lever.melee_damage_delay = 0.1
	self.melee_weapons.croupier_rake = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.croupier_rake.name_id = "bm_melee_croupier_rake"
	self.melee_weapons.croupier_rake.anim_global_param = "melee_axe"
	self.melee_weapons.croupier_rake.dlc = "kenaz"
	self.melee_weapons.croupier_rake.texture_bundle_folder = "kenaz"
	self.melee_weapons.croupier_rake.type = "knife"
	self.melee_weapons.croupier_rake.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.croupier_rake.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_croupier_rake/wpn_fps_mel_croupier_rake"
	self.melee_weapons.croupier_rake.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_croupier_rake/wpn_third_mel_croupier_rake"
	self.melee_weapons.croupier_rake.sounds = {}
	self.melee_weapons.croupier_rake.sounds.equip = "croupier_stick_equip"
	self.melee_weapons.croupier_rake.sounds.hit_air = "croupier_stick_hit_air"
	self.melee_weapons.croupier_rake.sounds.hit_gen = "croupier_stick_hit_gen"
	self.melee_weapons.croupier_rake.sounds.hit_body = "croupier_stick_hit_body"
	self.melee_weapons.croupier_rake.sounds.charge = "croupier_stick_charge"
	self.melee_weapons.croupier_rake.stats.min_damage = 0.68
	self.melee_weapons.croupier_rake.stats.max_damage = 1.68
	self.melee_weapons.croupier_rake.stats.min_damage_effect = 12
	self.melee_weapons.croupier_rake.stats.max_damage_effect = 8.8
	self.melee_weapons.croupier_rake.stats.charge_time = 2
	self.melee_weapons.croupier_rake.stats.range = 250
	self.melee_weapons.croupier_rake.stats.concealment = 28
	self.melee_weapons.croupier_rake.expire_t = 1
	self.melee_weapons.croupier_rake.repeat_expire_t = 0.7
	self.melee_weapons.croupier_rake.melee_damage_delay = 0.1
	self.melee_weapons.fight = {}
	self.melee_weapons.fight.name_id = "bm_melee_fight"
	self.melee_weapons.fight.type = "fists"
	self.melee_weapons.fight.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_fight/wpn_fps_mel_fight"
	self.melee_weapons.fight.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_fight/wpn_fps_mel_fight"
	self.melee_weapons.fight.no_inventory_preview = true
	self.melee_weapons.fight.free = nil
	self.melee_weapons.fight.dlc = "turtles"
	self.melee_weapons.fight.texture_bundle_folder = "turtles"
	self.melee_weapons.fight.stats = {}
	self.melee_weapons.fight.stats.min_damage = 1.5
	self.melee_weapons.fight.stats.max_damage = 3
	self.melee_weapons.fight.stats.min_damage_effect = 3
	self.melee_weapons.fight.stats.max_damage_effect = 3
	self.melee_weapons.fight.stats.charge_time = 1
	self.melee_weapons.fight.stats.range = 150
	self.melee_weapons.fight.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fight.stats.weapon_type = "blunt"
	self.melee_weapons.fight.anim_global_param = "melee_fight"
	self.melee_weapons.fight.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4",
		"var5"
	}
	self.melee_weapons.fight.expire_t = 1
	self.melee_weapons.fight.repeat_expire_t = 0.55
	self.melee_weapons.fight.melee_damage_delay = 0.1
	self.melee_weapons.fight.melee_charge_shaker = "player_melee_charge_fist"
	self.melee_weapons.fight.sounds = {}
	self.melee_weapons.fight.sounds.equip = "fight_equip"
	self.melee_weapons.fight.sounds.hit_air = "fight_hit_air"
	self.melee_weapons.fight.sounds.hit_gen = "fight_hit_gen"
	self.melee_weapons.fight.sounds.hit_body = "fight_hit_body"
	self.melee_weapons.fight.sounds.charge = "fight_charge"
	self.melee_weapons.fight.stats.concealment = 30
	self.melee_weapons.tiger = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.tiger.name_id = "bm_melee_tiger"
	self.melee_weapons.tiger.free = nil
	self.melee_weapons.tiger.type = "fists"
	self.melee_weapons.tiger.dlc = "turtles"
	self.melee_weapons.tiger.texture_bundle_folder = "turtles"
	self.melee_weapons.tiger.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.tiger.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_tiger/wpn_fps_mel_tiger"
	self.melee_weapons.tiger.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_tiger/wpn_third_mel_tiger"
	self.melee_weapons.tiger.anim_global_param = "melee_tiger"
	self.melee_weapons.tiger.stats.min_damage = 3.5
	self.melee_weapons.tiger.stats.max_damage = 5
	self.melee_weapons.tiger.stats.min_damage_effect = 0.3
	self.melee_weapons.tiger.stats.max_damage_effect = 0.3
	self.melee_weapons.tiger.stats.charge_time = 2
	self.melee_weapons.tiger.stats.range = 150
	self.melee_weapons.tiger.melee_damage_delay = 0.1
	self.melee_weapons.tiger.sounds.equip = "tiger_equip"
	self.melee_weapons.tiger.sounds.hit_air = "tiger_hit_air"
	self.melee_weapons.tiger.sounds.hit_gen = "tiger_hit_gen"
	self.melee_weapons.tiger.sounds.hit_body = "tiger_hit_body"
	self.melee_weapons.tiger.sounds.charge = "tiger_charge"
	self.melee_weapons.tiger.stats.concealment = 27
	self.melee_weapons.cqc = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.cqc.name_id = "bm_melee_cqc"
	self.melee_weapons.cqc.info_id = "bm_melee_cqc_info"
	self.melee_weapons.cqc.dlc = "turtles"
	self.melee_weapons.cqc.texture_bundle_folder = "turtles"
	self.melee_weapons.cqc.free = nil
	self.melee_weapons.cqc.anim_global_param = "melee_stab"
	self.melee_weapons.cqc.type = "knife"
	self.melee_weapons.cqc.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.cqc.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_cqc/wpn_fps_mel_cqc"
	self.melee_weapons.cqc.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_cqc/wpn_third_mel_cqc"
	self.melee_weapons.cqc.dot_data = {
		type = "poison",
		custom_data = {dot_length = 1, hurt_animation_chance = 0.7}
	}
	self.melee_weapons.cqc.stats.weapon_type = "sharp"
	self.melee_weapons.cqc.stats.min_damage = 2
	self.melee_weapons.cqc.stats.max_damage = 4
	self.melee_weapons.cqc.stats.min_damage_effect = 0.5
	self.melee_weapons.cqc.stats.max_damage_effect = 0.5
	self.melee_weapons.cqc.stats.charge_time = 1
	self.melee_weapons.cqc.stats.range = 150
	self.melee_weapons.cqc.sounds = {}
	self.melee_weapons.cqc.sounds.equip = "cqc_equip"
	self.melee_weapons.cqc.sounds.hit_air = "cqc_hit_air"
	self.melee_weapons.cqc.sounds.hit_gen = "cqc_hit_gen"
	self.melee_weapons.cqc.sounds.hit_body = "cqc_hit_body"
	self.melee_weapons.cqc.sounds.charge = "cqc_charge"
	self.melee_weapons.cqc.repeat_expire_t = 0.3
	self.melee_weapons.cqc.stats.concealment = 30
	self.melee_weapons.twins = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.twins.name_id = "bm_melee_twins"
	self.melee_weapons.twins.dlc = "turtles"
	self.melee_weapons.twins.texture_bundle_folder = "turtles"
	self.melee_weapons.twins.free = nil
	self.melee_weapons.twins.anim_global_param = "melee_twins"
	self.melee_weapons.twins.type = "knife"
	self.melee_weapons.twins.align_objects = {
		"a_weapon_right",
		"a_weapon_left"
	}
	self.melee_weapons.twins.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_twin/wpn_fps_mel_twin"
	self.melee_weapons.twins.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_twin/wpn_third_mel_twin"
	self.melee_weapons.twins.stats.weapon_type = "sharp"
	self.melee_weapons.twins.stats.min_damage = 3
	self.melee_weapons.twins.stats.max_damage = 4
	self.melee_weapons.twins.stats.min_damage_effect = 0.5
	self.melee_weapons.twins.stats.max_damage_effect = 0.5
	self.melee_weapons.twins.stats.charge_time = 1
	self.melee_weapons.twins.stats.range = 200
	self.melee_weapons.twins.sounds = {}
	self.melee_weapons.twins.sounds.equip = "twin_equip"
	self.melee_weapons.twins.sounds.hit_air = "twin_hit_air"
	self.melee_weapons.twins.sounds.hit_gen = "twin_hit_gen"
	self.melee_weapons.twins.sounds.hit_body = "twin_hit_body"
	self.melee_weapons.twins.sounds.charge = "twin_charge"
	self.melee_weapons.twins.repeat_expire_t = 0.6
	self.melee_weapons.twins.stats.concealment = 28
	self.melee_weapons.sandsteel = {}
	self.melee_weapons.sandsteel.name_id = "bm_melee_sandsteel"
	self.melee_weapons.sandsteel.animation = nil
	self.melee_weapons.sandsteel.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.sandsteel.anim_global_param = "melee_sandsteel"
	self.melee_weapons.sandsteel.dlc = "dragon"
	self.melee_weapons.sandsteel.texture_bundle_folder = "dragon"
	self.melee_weapons.sandsteel.type = "axe"
	self.melee_weapons.sandsteel.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.sandsteel.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_mel_sandsteel/wpn_fps_mel_sandsteel"
	self.melee_weapons.sandsteel.third_unit = "units/pd2_dlc_dragon/weapons/wpn_fps_mel_sandsteel/wpn_third_mel_sandsteel"
	self.melee_weapons.sandsteel.sounds = {}
	self.melee_weapons.sandsteel.sounds.equip = "sandsteel_equip"
	self.melee_weapons.sandsteel.sounds.hit_air = "sandsteel_hit_air"
	self.melee_weapons.sandsteel.sounds.hit_gen = "sandsteel_hit_gen"
	self.melee_weapons.sandsteel.sounds.hit_body = "sandsteel_hit_body"
	self.melee_weapons.sandsteel.sounds.charge = "sandsteel_charge"
	self.melee_weapons.sandsteel.stats = {}
	self.melee_weapons.sandsteel.stats.weapon_type = "sharp"
	self.melee_weapons.sandsteel.stats.min_damage = 7
	self.melee_weapons.sandsteel.stats.max_damage = 45
	self.melee_weapons.sandsteel.stats.min_damage_effect = 0.1
	self.melee_weapons.sandsteel.stats.max_damage_effect = 0.1
	self.melee_weapons.sandsteel.stats.charge_time = 4
	self.melee_weapons.sandsteel.stats.range = 275
	self.melee_weapons.sandsteel.stats.concealment = 26
	self.melee_weapons.sandsteel.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.sandsteel.repeat_expire_t = 0.5
	self.melee_weapons.sandsteel.expire_t = 0.85
	self.melee_weapons.sandsteel.melee_damage_delay = 0.1
	self:_add_desc_from_name_macro(self.melee_weapons)
end
