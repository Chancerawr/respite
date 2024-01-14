--COOKING
local PLUGIN = PLUGIN

//
local RECIPE = {}
	RECIPE.uid = "cook_pizza1"
	RECIPE.name = "Personal Pizza"
	RECIPE.desc = "A small 4 slice pizza."
	RECIPE.category = "Cooking"
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
	RECIPE.category = "Cooking"
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