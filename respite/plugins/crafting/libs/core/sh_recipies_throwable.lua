--GRENADES
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_grenade_yin"
RECIPE.name = "Yin Yang"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"

RECIPE.items = {
	["ichor"] = 1,
	["blight"] = 1,
	["j_scrap_metals"] = 5,
}
RECIPE.result = {
	["tfa_yinyang"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_nail"
RECIPE.name = "Makeshift Nail Bomb"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"

RECIPE.items = {
	["j_scrap_nails"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_chems"] = 1,
}
RECIPE.result = {
	["tfa_nailbomb"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_haze"
RECIPE.name = "Blue Haze Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"

RECIPE.items = {
	["haze_bottled"] = 1,
	["j_scrap_metals"] = 5,
	["cube_chip"] = 2
}
RECIPE.result = {
	["nut_haze"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_molotov"
RECIPE.name = "Molotov Cocktail"
RECIPE.category = "Grenades"
RECIPE.model = "models/props_junk/garbage_glassbottle003a.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_glass"] = 2,
	["j_scrap_cloth"] = 1
}
RECIPE.result = {
	["molotov"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_beacon_red"
RECIPE.name = "Beacon - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/Items/grenadeammo.mdl"

RECIPE.items = {
	["j_scrap_elecs"] = 1,
	["j_scrap_metals"] = 5,
}
RECIPE.result = {
	["nut_beacon"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_frag"
RECIPE.name = "Explosive Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_explosivegrenade"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_blood"
RECIPE.name = "Blood Bomb"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["food_blood"] = 5,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_bloodbomb"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_tear"
RECIPE.name = "Tear Gas Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_teargas"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_smoke"
RECIPE.name = "Smoke Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_smokegrenade"] = 1
}
RECIPES:Register(RECIPE)

//
RECIPE = {}
RECIPE.uid = "nut_grenade_dark"
RECIPE.name = "Dark Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
	["blight"] = 2
}
RECIPE.result = {
	["nut_darkgrenade"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "nut_grenade_flash"
RECIPE.name = "Flash Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1
}
RECIPE.result = {
	["nut_flashgrenade"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_flare_red"
RECIPE.name = "Flare - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/Items/grenadeAmmo.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_flare"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_war"
RECIPE.name = "War Mine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_combine/combine_mine01.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 4,
	["j_scrap_metals"] = 10,
	["j_scrap_elecs"] = 15,
}
RECIPE.result = {
	["trap_warmine"] = 1
}
RECIPES:Register(RECIPE)

//
local RECIPE = {}
RECIPE.uid = "nut_trap_mine_m"
RECIPE.name = "Makeshift Mine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_wasteland/prison_lamp001c.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_plastics"] = 5,
	["j_scrap_elecs"] = 3,
}
RECIPE.result = {
	["trap_mine_makeshift"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_landmine_3"
RECIPE.name = "Large Landmine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_pipes/pipe03_connector01.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 3,
	["j_scrap_metals"] = 7,
	["j_scrap_elecs"] = 8,
}
RECIPE.result = {
	["trap_landmine_3"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_landmine_2"
RECIPE.name = "Medium Landmine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_pipes/pipe02_connector01.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 5,
	["j_scrap_elecs"] = 5,
}
RECIPE.result = {
	["trap_landmine_2"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_landmine_1"
RECIPE.name = "Small Landmine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_pipes/pipe01_connector01.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 4,
	["j_scrap_elecs"] = 2,
}
RECIPE.result = {
	["trap_landmine_1"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_grenade"
RECIPE.name = "Tripwire Grenade"
RECIPE.category = "Traps"
RECIPE.model = "models/weapons/w_eq_fraggrenade.mdl"

RECIPE.items = {
	["nut_explosivegrenade"] = 1,
	["j_scrap_cloth"] = 3
}
RECIPE.result = {
	["trap_grenade"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_gas"
RECIPE.name = "Makeshift Gas Mine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_interiors/pot01a.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 4,
	["j_scrap_plastics"] = 10,
	["j_scrap_elecs"] = 2,
}
RECIPE.result = {
	["trap_gasmine"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_bouncing"
RECIPE.name = "Makeshift Bouncing Mine"
RECIPE.category = "Traps"
RECIPE.model = "models/props_junk/glassjug01.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_plastics"] = 10,
	["j_scrap_elecs"] = 5,
}
RECIPE.result = {
	["trap_bouncingmine_makeshift"] = 1
}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
RECIPE.uid = "nut_trap_bounding"
RECIPE.name = "Bounding Mine"
RECIPE.category = "Traps"
RECIPE.model = "models/XQM/cylinderx1.mdl"

RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 4,
	["j_scrap_elecs"] = 6,
}
RECIPE.result = {
	["trap_boundingmine"] = 1
}
RECIPES:Register(RECIPE)