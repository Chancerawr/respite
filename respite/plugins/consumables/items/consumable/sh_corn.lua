ITEM.name = "Corn"
ITEM.desc = "A cob of corn."
ITEM.uniqueID = "food_corn"
ITEM.model = "models/foodnhouseholditems/corn.mdl"
ITEM.quantity2 = 1
ITEM.price = 6

ITEM.attrib = { 
	["end"] = 3,
	["fortitude"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Vegetable"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["end"] = 3,
			["fortitude"] = 3
		},
		
		armor = 5,
	},
}