--GRENADES
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_grenade_yin"
RECIPE.name = "Yin Yang"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"
RECIPE.desc = "A makeshift bomb that creates a large shockwave from its detonation area. Generally non-lethal, but typically stunning and disorienting, capable of knocking down most drifters and even fairly large creatures."
 
RECIPE.items = {
	["ichor"] = 1,
	["blight"] = 1,
	["j_scrap_metals"] = 5,
}
RECIPE.result = {
	["tfa_yinyang"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_nail"
RECIPE.name = "Makeshift Nail Bomb"
RECIPE.category = "Grenades"
RECIPE.model = "models/items/grenadeammo.mdl"
RECIPE.desc = "A makeshift shrapnel bomb that uses nails and other sharp pieces of metal to damage foes."
 
RECIPE.items = {
	["j_scrap_nails"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_chems"] = 1,
}
RECIPE.result = {
	["tfa_nailbomb"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_haze"
RECIPE.name = "Blue Haze Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A haze grenade that disorients those caught in its fumes."
 
RECIPE.items = {
	["haze_bottled"] = 1,
	["j_scrap_metals"] = 5,
	["cube_chip"] = 2
}
RECIPE.result = {
	["nut_haze"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_molotov"
RECIPE.name = "Molotov Cocktail"
RECIPE.category = "Grenades"
RECIPE.model = "models/props_junk/garbage_glassbottle003a.mdl"
RECIPE.desc = "A molotov cocktail."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_glass"] = 2,
	["j_scrap_cloth"] = 1
}
RECIPE.result = {
	["molotov"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_beacon_red"
RECIPE.name = "Beacon - Red"
RECIPE.category = "Light Sources"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A red beacon used for signalling or illumination."
 
RECIPE.items = {
	["j_scrap_elecs"] = 1,
	["j_scrap_metals"] = 5,
}
RECIPE.result = {
	["nut_beacon"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_frag"
RECIPE.name = "Explosive Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "An explosive grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_explosivegrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_tear"
RECIPE.name = "Tear Gas Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A tear gas grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 2,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_teargas"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_smoke"
RECIPE.name = "Smoke Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A smoke grenade."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_smokegrenade"] = 1
}
RECIPES:Register( RECIPE )

//
RECIPE = {}
RECIPE.uid = "nut_grenade_dark"
RECIPE.name = "Dark Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeammo.mdl"
RECIPE.desc = "A grenade that will temporarily prevent all light from entering an area."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
	["blight"] = 2
}
RECIPE.result = {
	["nut_darkgrenade"] = 1
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_grenade_flash"
RECIPE.name = "Flash Grenade"
RECIPE.category = "Grenades"
RECIPE.model = "models/Items/grenadeAmmo.mdl"
RECIPE.desc = "A grenade used for stunning and disorienting those affected."
 
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
RECIPE.desc = "A flare."
 
RECIPE.items = {
	["j_scrap_chems"] = 1,
	["j_scrap_metals"] = 5,
	["j_scrap_adhesive"] = 1,
}
RECIPE.result = {
	["nut_flare"] = 1
}
RECIPES:Register( RECIPE )
