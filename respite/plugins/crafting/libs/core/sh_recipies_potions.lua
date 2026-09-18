--POTIONS
local PLUGIN = PLUGIN

local RECIPE = {}
	RECIPE.uid = "potion_dynamic"
	RECIPE.name = "Concoction"
	RECIPE.category = "Potions"
	RECIPE.model = "models/healthvial.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.specMult = 1.5 --multiplies the ingredient values by this number
	RECIPE.items = {
		["Cursed Apple"] = 1,
		["Consumable"] = 3,
	}
	RECIPE.result = {
		["potion_dynamic"] = 1
	}
RECIPES:Register(RECIPE)

//
RECIPE = {}
RECIPE.uid = "potion_accuracy"
RECIPE.name = "Potion - Accuracy"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_accuracy"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_agility"
RECIPE.name = "Potion - Agility"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_agility"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_craftiness"
RECIPE.name = "Potion - Craftiness"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_craftiness"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_endurance"
RECIPE.name = "Potion - Endurance"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_endurance"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_fortitude"
RECIPE.name = "Potion - Fortitude"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_fortitude"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_luck"
RECIPE.name = "Potion - Luck"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_luck"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_perception"
RECIPE.name = "Potion - Perception"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_perception"] = 1
}
RECIPES:Register(RECIPE)
//
RECIPE = {}
RECIPE.uid = "potion_str"
RECIPE.name = "Potion - Strength"
RECIPE.category = "Potions"
RECIPE.model = "models/healthvial.mdl"

RECIPE.items = {
	["food_apple_cursed"] = 1
}
RECIPE.result = {
	["potion_strength"] = 1
}
RECIPES:Register(RECIPE)