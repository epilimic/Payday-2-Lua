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
	self.materials.forged = {}
	self.materials.forged.name_id = "bm_mtl_forged"
	self.materials.forged.pcs = {}
	self.materials.forged.texture = "units/pd2_dlc_steel/masks/materials/matcap_forged_df"
	self.materials.forged.value = 0
	self.materials.forged.dlc = "steel"
	self.materials.blooded = {}
	self.materials.blooded.name_id = "bm_mtl_blooded"
	self.materials.blooded.pcs = {}
	self.materials.blooded.texture = "units/pd2_dlc_steel/masks/materials/matcap_blooded_df"
	self.materials.blooded.value = 0
	self.materials.blooded.dlc = "steel"
	self.materials.chain_armor = {}
	self.materials.chain_armor.name_id = "bm_mtl_chain_armor"
	self.materials.chain_armor.pcs = {}
	self.materials.chain_armor.texture = "units/pd2_dlc_steel/masks/materials/matcap_chain_armor_df"
	self.materials.chain_armor.material_amount = 0
	self.materials.chain_armor.value = 0
	self.materials.chain_armor.dlc = "steel"
	self.materials.scale_armor = {}
	self.materials.scale_armor.name_id = "bm_mtl_scale_armor"
	self.materials.scale_armor.pcs = {}
	self.materials.scale_armor.texture = "units/pd2_dlc_steel/masks/materials/matcap_scale_armor_df"
	self.materials.scale_armor.material_amount = 0
	self.materials.scale_armor.value = 0
	self.materials.scale_armor.dlc = "steel"
	self.materials.flow = {}
	self.materials.flow.name_id = "bm_mtl_flow"
	self.materials.flow.pcs = {}
	self.materials.flow.texture = "units/pd2_dlc_jerry/masks/materials/matcap_flow_df"
	self.materials.flow.dlc = "berry"
	self.materials.flow.material_amount = 0
	self.materials.flow.value = 0
	self.materials.sancti = {}
	self.materials.sancti.name_id = "bm_mtl_sancti"
	self.materials.sancti.pcs = {}
	self.materials.sancti.texture = "units/pd2_dlc_jerry/masks/materials/matcap_sancti_df"
	self.materials.sancti.dlc = "berry"
	self.materials.sancti.value = 0
	self.materials.glade = {}
	self.materials.glade.name_id = "bm_mtl_glade"
	self.materials.glade.pcs = {}
	self.materials.glade.texture = "units/pd2_dlc_jerry/masks/materials/matcap_glade_df"
	self.materials.glade.dlc = "berry"
	self.materials.glade.value = 0
	self.materials.wade = {}
	self.materials.wade.name_id = "bm_mtl_wade"
	self.materials.wade.pcs = {}
	self.materials.wade.texture = "units/pd2_dlc_jerry/masks/materials/matcap_wade_df"
	self.materials.wade.dlc = "berry"
	self.materials.wade.value = 0
end
