--EQUIPMENT
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_helmet_gasmask"
RECIPE.name = "Gas Mask"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/gasmask.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elastic"] = 1,
	["j_scrap_glass"] = 2
}
RECIPE.result = {
	["gasmask"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_beanie"
RECIPE.name = "Beanie"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/beanie.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["j_beanie"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_ushanka"
RECIPE.name = "Ushanka"
RECIPE.category = "Clothing"
RECIPE.model = "models/ushanka.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 10
}
RECIPE.result = {
	["j_ushanka"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_boonie"
RECIPE.name = "Leather Boonie"
RECIPE.category = "Clothing"
RECIPE.model = "models/warz/leatherboonie.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 10,
	["j_scrap_organic"] = 2
}
RECIPE.result = {
	["j_boonie"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_gloves"
RECIPE.name = "Gloves"
RECIPE.category = "Clothing"
RECIPE.model = "models/tnb/items/gloves.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["j_gloves"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_helmet_makeshift"
RECIPE.name = "Makeshift Helmet"
RECIPE.category = "Armor"
RECIPE.model = "models/helm_04.mdl"

RECIPE.items = {
	["j_scrap_metals"] = 5,
	["j_scrap_cloth"] = 5
}
RECIPE.result = {
	["helmet_makeshift"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_chain"
RECIPE.name = "Makeshift Chain Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel_molle.mdl"

RECIPE.items = {
	["j_scrap_metals"] = 25,
	["j_scrap_elastic"] = 4,
	["j_scrap_cloth"] = 15,
	["j_tshirts"] = 1
}
RECIPE.result = {
	["armor_chain"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_gambeson"
RECIPE.name = "Crude Gambeson"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebelmetrocop.mdl"

RECIPE.items = {
	["j_scrap_cloth"] = 30,
	["j_tshirts"] = 2
}
RECIPE.result = {
	["armor_gambeson"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_tread"
RECIPE.name = "Tread Warrior's Guard"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"

RECIPE.items = {
	["j_scrap_rubber"] = 15,
	["j_scrap_screws"] = 4,
	["j_scrap_elastic"] = 2,
	["j_tire"] = 2
}
RECIPE.result = {
	["armor_tread"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_charged"
RECIPE.name = "Voltaic Armor"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"

RECIPE.items = {
	["j_scrap_rubber"] = 15,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 10,
	["j_scrap_elecs"] = 10,
	["ammo_battery"] = 2,
	["j_scrap_energy"] = 1
}
RECIPE.result = {
	["armor_charged"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_pauldrons"
RECIPE.name = "PL-8 Pauldrons"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"

RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_cloth"] = 5,
	["j_scrap_plastics"] = 5,
	["j_scrap_elastic"] = 2,
	["j_scrap_metals"] = 30
}
RECIPE.result = {
	["armor_pauldrons"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_wood"
RECIPE.name = "Drifter-Wood"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebel1.mdl"

RECIPE.items = {
	["j_scrap_rubber"] = 4,
	["j_scrap_wood"] = 20,
	["j_scrap_cloth"] = 8,
	["j_scrap_elastic"] = 1
}
RECIPE.result = {
	["armor_wood"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_armor_sapper"
RECIPE.name = "Sapper's Friend"
RECIPE.category = "Armor"
RECIPE.model = "models/tnb/items/shirt_rebeloverwatch.mdl"

RECIPE.items = {
	["j_scrap_metals"] = 30,
	["j_scrap_rubber"] = 4,
	["j_scrap_cloth"] = 10,
	["j_scrap_screws"] = 4,
	["j_car_door"] = 1
}
RECIPE.result = {
	["armor_sapper"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_shield_wood"
RECIPE.name = "Makeshift Shield (Wood)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"

RECIPE.items = {
	["j_scrap_wood"] = 20
}
RECIPE.result = {
	["shield_wood"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_shield_metal"
RECIPE.name = "Makeshift Shield (Scrap Metal)"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/glassholdshield.mdl"

RECIPE.items = {
	["j_scrap_metals"] = 20
}
RECIPE.result = {
	["shield_metal"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_shield_ballistic"
RECIPE.name = "Ballistic Shield"
RECIPE.category = "Shields"
RECIPE.model = "models/cloud/ballisticshield_mod.mdl"

RECIPE.items = {
	["j_scrap_plastics"] = 25,
	["j_scrap_rubber"] = 10,
	["j_scrap_chems"] = 10,
	["j_scrap_steel"] = 5,
	["cube_chip"] = 15,
}
RECIPE.result = {
	["shield_ballistic"] = 1
}
RECIPES:Register(RECIPE)