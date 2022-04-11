--COOKING
local PLUGIN = PLUGIN

if(SERVER) then
	function PLUGIN:InitPostEntity()
		-- For dynamic crafting
		local LOOT = {}
		for uniqueID, item in pairs(nut.item.list) do
			if(item.loot and item.loot["Cooked"]) then
				LOOT = {}
				LOOT.uniqueID = uniqueID
				LOOT.name = item.name
				LOOT.desc = item.desc
				LOOT.model = item.model
				LOOT.material = item.material
				LOOT.attrib = item.attrib
				LOOT.rarity = item.rarity
				LOOT.lootTags = item.loot

				LOOTGEN:Register(LOOT)
			end
		end
	end
end

local RECIPE = {}
	RECIPE.uid = "cook_meal"
	RECIPE.name = "Meal"
	RECIPE.desc = "A simple meal made out of a few ingredients."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/garbage_metalcan002a.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 3,
	}
	RECIPE.result = {
		["cook_meal"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_sandwich"
	RECIPE.name = "Sandwich"
	RECIPE.desc = ""
	RECIPE.category = "Cooking"
	RECIPE.model = "models/squad/sf_plates/sf_plate1x1.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Bread"] = 1,
		["Consumable"] = 2,
	}
	RECIPE.result = {
		["cook_sandwich"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_soup"
	RECIPE.name = "Soup"
	RECIPE.desc = "Some kind of soup."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/terracotta01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Drink"] = 2,
		["Consumable"] = 2,
	}
	RECIPE.result = {
		["cook_soup"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_smoothie"
	RECIPE.name = "Smoothie"
	RECIPE.desc = "A thick, smooth drink."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/garbage_plasticbottle003a.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Drink"] = 1,
		["Fruit"] = 2,
	}
	RECIPE.result = {
		["cook_smoothie"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_drink_mixed"
	RECIPE.name = "Mixed Drink"
	RECIPE.desc = "A drink made from multiple drinks."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/garbage_plasticbottle003a.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Drink"] = 3,
		["Consumable"] = 1,
	}
	RECIPE.result = {
		["cook_smoothie"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_stew"
	RECIPE.name = "Stew"
	RECIPE.desc = "Some kind of stew."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/terracotta01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 2,
		["Drink"] = 2,
	}
	RECIPE.result = {
		["cook_stew"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_sausage"
	RECIPE.name = "Sausage"
	RECIPE.desc = "A meaty sausage."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/gibs/antlion_gib_small_2.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 2,
	}
	RECIPE.result = {
		["cook_sausage"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_patty"
	RECIPE.name = "Patty"
	RECIPE.desc = "A meaty patty."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/gibs/antlion_gib_small_2.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 3,
	}
	RECIPE.result = {
		["cook_patty"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_steak"
	RECIPE.name = "Steak"
	RECIPE.desc = "A meaty steak."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/gibs/antlion_gib_small_2.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 2,
		["Consumable"] = 1,
	}
	RECIPE.result = {
		["cook_patty"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_sushi"
	RECIPE.name = "Sushi"
	RECIPE.desc = "Fish that has been prepared in a fancy way."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props/cs_militia/fishriver01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Fish"] = 2,
		["Consumable"] = 1,
	}
	RECIPE.result = {
		["cook_sushi"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_kebab"
	RECIPE.name = "Kebab"
	RECIPE.desc = "Food served on a stick."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/wood_crate001a_chunk05.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 2,
		["Consumable"] = 2,
	}
	RECIPE.result = {
		["cook_kebab"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_sticks"
	RECIPE.name = "Sticks"
	RECIPE.desc = "Food fashioned into stick form."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/wood_crate001a_chunk05.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Meat"] = 4,
	}
	RECIPE.result = {
		["cook_sticks"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_tartare"
	RECIPE.name = "Tartare"
	RECIPE.desc = "Raw fish that has been seasoned and shaped into small cakes."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props/cs_militia/fishriver01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Fish"] = 2,
		["Consumable"] = 1,
	}
	RECIPE.result = {
		["cook_tartare"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_pie"
	RECIPE.name = "Pie"
	RECIPE.desc = "It is a pie."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/terracotta01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Vegetable"] = 2,
		["Bread"] = 1,
		["Consumable"] = 2,
	}
	RECIPE.result = {
		["cook_pie"] = 1
	}
RECIPES:Register(RECIPE)

RECIPE = {}
	RECIPE.uid = "cook_salad"
	RECIPE.name = "Salad"
	RECIPE.desc = "It is a salad."
	RECIPE.category = "Cooking"
	RECIPE.model = "models/props_junk/terracotta01.mdl"
	RECIPE.special = true
	RECIPE.noAverage = true
	RECIPE.items = {
		["Consumable"] = 1,
		["Vegetable"] = 2,
	}
	RECIPE.result = {
		["cook_salad"] = 1
	}
RECIPES:Register(RECIPE)