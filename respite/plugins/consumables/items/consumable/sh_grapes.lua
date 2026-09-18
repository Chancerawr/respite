ITEM.name = "Grapes"
ITEM.desc = "A bundle of purple berries."
ITEM.uniqueID = "food_grapes"
ITEM.model = "models/foodnhouseholditems/grapes1.mdl"
ITEM.quantity2 = 6
ITEM.price = 3

ITEM.attrib = { 
	["stm"] = 2,
	["perception"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 2,
			["perception"] = 2,
		},
		
		res = {
			["Slow"] = 5,
			["Pain"] = 5,
		},
	},
}