--MEDICAL
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_medicalkit"
RECIPE.name = "First-Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "A standard medical kit used to apply first aid."
 
RECIPE.items = {
	["j_scrap_plastics"] = 10,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 1,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE.result = {
	["medical_kit"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medicalkit_plastic"
RECIPE.name = "Plastic Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "A standard medical kit used to apply first aid."
 
RECIPE.items = {
	["j_scrap_plastics"] = 20,
	["food_water_misc"] = 2,
}
RECIPE.result = {
	["first_aid_plastic"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_purification_tablet"
RECIPE.name = "Water Purification Tablet"
RECIPE.category = "Medical"
RECIPE.model = "models/gibs/metal_gib4.mdl"
RECIPE.desc = "A small tablet, it says 'PURIFY' on the side of it."
 
RECIPE.items = {
	["j_scrap_metals"] = 4,
	["drug_depress"] = 1
}
RECIPE.result = {
	["purifier_water_tablet"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antibiotics"
RECIPE.name = "Antibiotics"
RECIPE.category = "Medical"
RECIPE.model = "models/healthvial.mdl"
RECIPE.desc = "A bottle filled with antibiotics."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 2,
	["drug_depress"] = 3
}
RECIPE.result = {
	["drug_antibiotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_steroid"
RECIPE.name = "Steroid"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with medical steroids."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 2,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_steroid"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_rubbingalcohol"
RECIPE.name = "Rubbing Alcohol"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with rubbing alcohol."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_rubbingalcohol"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_sleepingpills"
RECIPE.name = "Sleeping Pills"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_sleepingpills"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_painkillers"
RECIPE.name = "Painkillers"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 1,
	["drug_depress"] = 3
}
RECIPE.result = {
	["drug_painkillers"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_burnointment"
RECIPE.name = "Burn Ointment"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with burn ointment."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_burnointment"] = 1
}
RECIPES:Register( RECIPE )

//
RECIPE = {}
RECIPE.uid = "nut_disinfectant"
RECIPE.name = "Disinfectant"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with some kind of disinfectant."
 
RECIPE.items = {
	["j_scrap_chems"] = 3,
	["food_water"] = 1,
	["drug_depress"] = 2
}
RECIPE.result = {
	["drug_disinfectant"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antidepressants"
RECIPE.name = "Antidepressants"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some pills."
 
RECIPE.items = {
	["drug_depress"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antidepressants"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_gauze"
RECIPE.name = "Gauze"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "Some makeshift gauze."
 
RECIPE.items = {
	["j_scrap_cloth"] = 20
}
RECIPE.result = {
	["medical_gauze"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ivbag"
RECIPE.name = "Makeshift IV Bag"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/garbage_bag001a.mdl"
RECIPE.desc = "Fluids not included."
 
RECIPE.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_adhesive"] = 1
}
RECIPE.result = {
	["medical_iv"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_splint"
RECIPE.name = "Makeshift Splint"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/wood_crate001a_chunk05.mdl"
RECIPE.desc = "A makeshift splint for medical use."
 
RECIPE.items = {
	["j_scrap_wood"] = 10
}
RECIPE.result = {
	["medical_splint"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bandages"
RECIPE.name = "Bandages"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A box of bandages."
 
RECIPE.items = {
	["j_scrap_cloth"] = 8
}
RECIPE.result = {
	["medical_bandages"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_bandages_memory"
RECIPE.name = "Memory Wraps"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled with some strange wrappings.\nThese wrappings help deal with numbness caused by blight damage."
 
RECIPE.items = {
	["medical_bandages"] = 2,
	["j_scrap_memory"] = 2
}
RECIPE.result = {
	["medical_memory"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_suture"
RECIPE.name = "Makeshift Suture Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled tools and sutures."
 
RECIPE.items = {
	["j_scrap_plastics"] = 15,
	["j_scrap_cloth"] = 15,
	["j_scrap_metals"] = 10
}
RECIPE.result = {
	["medical_suture"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medical_plastic"
RECIPE.name = "Plastic Dust"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/box01a.mdl"
RECIPE.desc = "A small box filled with some sort of plasic dust."
 
RECIPE.items = {
	["j_scrap_plastics"] = 7
}
RECIPE.result = {
	["medical_plastic"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_drug_energy"
RECIPE.name = "Energy Pills"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with some sort of vibrating pills."
 
RECIPE.items = {
	["drug_antidepressants"] = 2,
	["haze_bottled"] = 1,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_energy"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_venom"
RECIPE.name = "Venom"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with some sort of liquid."
 
RECIPE.items = {
	["drug_depress"] = 2,
	["j_scrap_chems"] = 6,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_venom"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_psychotics"
RECIPE.name = "Psychotics"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A bottle filled with numerous pills."
 
RECIPE.items = {
	["drug_depress"] = 3,
	["j_scrap_chems"] = 5,
	["food_water"] = 1
}
RECIPE.result = {
	["drug_psychotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antivenom"
RECIPE.name = "Antivenom"
RECIPE.category = "Medical"
RECIPE.model = "models/props_lab/jar01b.mdl"
RECIPE.desc = "A small bottle filled with some sort of liquid."
 
RECIPE.items = {
	["drug_venom"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antivenom"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_antipsychotics"
RECIPE.name = "Antipsychotics"
RECIPE.category = "Medical"
RECIPE.model = "models/props_junk/glassjug01.mdl"
RECIPE.desc = "A bottle filled with numerous pills."
 
RECIPE.items = {
	["drug_psychotics"] = 1,
	["blight"] = 1
}
RECIPE.result = {
	["drug_antipsychotics"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_medicalkitrefill"
RECIPE.name = "Refill First-Aid Kit"
RECIPE.category = "Medical"
RECIPE.model = "models/items/healthkit.mdl"
RECIPE.desc = "Refill an empty first aid kit with new supplies."
 
RECIPE.items = {
	["j_used_first_aid_kit"] = 1,
	["j_scrap_chems"] = 2,
	["j_scrap_adhesive"] = 2,
	["medical_bandages"] = 2,
	["medical_gauze"] = 1
}
RECIPE.result = {
	["medical_kit"] = 1
}
RECIPES:Register( RECIPE )