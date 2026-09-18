ITEM.name = "Lettuce"
ITEM.prefix = "Lettuce"
ITEM.desc = "A green vegetable often used in salads."
ITEM.uniqueID = "food_lettuce"
ITEM.model = "models/foodnhouseholditems/lettuce.mdl"
ITEM.quantity2 = 2
ITEM.price = 4

ITEM.attrib = { 
	["medical"] = 1,
	["perception"] = 2,
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
			["medical"] = 1,
			["perception"] = 2,
		},
		
		res = {
			["Blind"] = 3,
		}
	},
}