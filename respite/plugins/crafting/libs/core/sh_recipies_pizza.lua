--COOKING
local PLUGIN = PLUGIN

//
local RECIPE = {}
	RECIPE.uid = "cook_pizza1"
	RECIPE.name = "Personal Pizza"
	RECIPE.desc = "A small 4 slice pizza."
	RECIPE.category = "Pizza"
	RECIPE.model = "models/squad/sf_plates/sf_plate1x1.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 2,
	}
	RECIPE.result = {
		["cook_pizza1"] = 1
	}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
	RECIPE.uid = "cook_pizza2"
	RECIPE.name = "Small Pizza"
	RECIPE.desc = "A small 6 slice pizza."
	RECIPE.category = "Pizza"
	RECIPE.model = "models/squad/sf_plates/sf_plate2x2.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 3,
	}
	RECIPE.result = {
		["cook_pizza2"] = 1
	}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
	RECIPE.uid = "cook_pizza3"
	RECIPE.name = "Medium Pizza"
	RECIPE.desc = "A medium 8 slice pizza."
	RECIPE.category = "Pizza"
	RECIPE.model = "models/squad/sf_plates/sf_plate2x2.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 4,
	}
	RECIPE.result = {
		["cook_pizza3"] = 1
	}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
	RECIPE.uid = "cook_pizza4"
	RECIPE.name = "Large Pizza"
	RECIPE.desc = "A large 12 slice pizza."
	RECIPE.category = "Pizza"
	RECIPE.model = "models/squad/sf_plates/sf_plate3x3.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 6,
	}
	RECIPE.result = {
		["cook_pizza4"] = 1
	}
RECIPES:Register(RECIPE)
//
local RECIPE = {}
	RECIPE.uid = "cook_pizza5"
	RECIPE.name = "Massive Pizza"
	RECIPE.desc = "A large 20 slice pizza."
	RECIPE.category = "Pizza"
	RECIPE.model = "models/squad/sf_plates/sf_plate3x3.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 10,
	}
	RECIPE.result = {
		["cook_pizza5"] = 1
	}
RECIPES:Register(RECIPE)
//