--AMMO
local PLUGIN = PLUGIN

//
RECIPE = {}
RECIPE.uid = "nut_ammo_919"
RECIPE.name = "9x19mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxsrounds.mdl"
RECIPE.desc = "Makeshift 9x19mm ammo made from scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_919"] = 10
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_22lr"
RECIPE.name = ".22 LR Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxsrounds.mdl"
RECIPE.desc = "Makeshift .22 LR Ammo made from scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_22lr"] = 10
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_45"
RECIPE.name = ".45 ACP Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift .45 ACP ammo made from scrap materials."
RECIPE.stackedResults = true

RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_45"] = 10
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_40sw"
RECIPE.name = ".40 S&W Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .40 S&W ammo made from scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 12,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_40sw"] = 8
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_5728"
RECIPE.name = "5.7x28mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.7x28mm ammo made from scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_5728"] = 10
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_357"
RECIPE.name = ".357 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .357 rounds made from scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 14,
	["cube_chip"] = 3
}
RECIPE.result = {
	["ammo_357"] = 8
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_12g"
RECIPE.name = "12 Gauge Shells"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxbuckshot.mdl"
RECIPE.desc = "Makeshift 12 gauge shells made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_12g"] = 5
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_concrete"
RECIPE.name = "Concrete Slugs"
RECIPE.category = "Ammunition"
RECIPE.model = "models/Items/boxbuckshot.mdl"
RECIPE.desc = "Makeshift slugs made out of concrete."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_concrete"] = 12,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_concrete"] = 5
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_sawblade"
RECIPE.name = "Sawblade"
RECIPE.category = "Ammunition"
RECIPE.model = "models/props_junk/sawblade001a.mdl"
RECIPE.desc = "A single, small sawblade."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 10,
	["cube_chip"] = 1
}
RECIPE.result = {
	["ammo_sawblade"] = 2
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_44"
RECIPE.name = ".44 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .44 ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 17,
	["cube_chip"] = 3
}
RECIPE.result = {
	["ammo_44"] = 10
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_50ae"
RECIPE.name = ".50 AE Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .50 AE ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 17,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_50ae"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_500"
RECIPE.name = ".500 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/357ammo.mdl"
RECIPE.desc = "Makeshift .500 ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_500"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_4570"
RECIPE.name = ".45-70 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .45-70 ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 24,
	["cube_chip"] = 4
}
RECIPE.result = {
	["ammo_4570"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_54539"
RECIPE.name = "5.45x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.45x39mm ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_54539"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_55645"
RECIPE.name = "5.56x45mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.56x45mm ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_55645"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_55639"
RECIPE.name = "5.56x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 5.56x39mm ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 20,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_55639"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76239"
RECIPE.name = "7.62x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x39mm ammo made of scrap materials."
RECIPE.stackedResults = true

RECIPE.items = {
	["j_scrap_metals"] = 24,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_76239"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_939"
RECIPE.name = "9x39mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 9x39mm ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 5
}
RECIPE.result = {
	["ammo_939"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76251"
RECIPE.name = "7.62x51mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x51mm ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE.result = {
	["ammo_76251"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_76254"
RECIPE.name = "7.62x54mm Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift 7.62x54mm ammo made of scrap materials."
RECIPE.stackedResults = true

RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 6
}
RECIPE.result = {
	["ammo_76254"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_3006"
RECIPE.name = ".30-06 Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/boxmrounds.mdl"
RECIPE.desc = "Makeshift .30-06 ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 7
}
RECIPE.result = {
	["ammo_3006"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_338"
RECIPE.name = ".338 LM Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .338 LM ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 7
}
RECIPE.result = {
	["ammo_338"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_408"
RECIPE.name = ".408 Cheytac Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .408 Cheytac ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 22,
	["cube_chip"] = 8
}
RECIPE.result = {
	["ammo_408"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_50bmg"
RECIPE.name = ".50 BMG Ammo"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/sniper_round_box.mdl"
RECIPE.desc = "Makeshift .50 BMG ammo made of scrap materials."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_metals"] = 25,
	["cube_chip"] = 8
}
RECIPE.result = {
	["ammo_50bmg"] = 6
}
RECIPES:Register( RECIPE )
//
RECIPE = {}
RECIPE.uid = "nut_ammo_battery"
RECIPE.name = "Charged Battery"
RECIPE.category = "Ammunition"
RECIPE.model = "models/items/battery.mdl"
RECIPE.desc = "A single, seemingly enhanced battery."
RECIPE.stackedResults = true
 
RECIPE.items = {
	["j_scrap_battery"] = 2,
	["cube_chip"] = 2
}
RECIPE.result = {
	["ammo_battery"] = 1
}
RECIPES:Register( RECIPE )