ITEM.name = "Cabbage"
ITEM.prefix = "Cabbage"
ITEM.desc = "A leafy green vegetable."
ITEM.uniqueID = "food_cabbage"
ITEM.model = "models/foodnhouseholditems/cabbage1.mdl"
ITEM.quantity2 = 3
ITEM.price = 5

ITEM.attrib = { 
	["medical"] = 2,
	["perception"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Vegetable"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["medical"] = 3,
			["perception"] = 2,
		},
		
		res = {
			["Blind"] = 3,
		}
	},
}