ITEM.name = "Sweet roll"
ITEM.prefix = "Sweet"
ITEM.desc = "A sweet dessert."
ITEM.uniqueID = "food_sweetroll"
ITEM.model = "models/foodnhouseholditems/sweetroll.mdl"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.width = 1

ITEM.attrib = { 
	["end"] = 2,
	["fortitude"] = 2,
	["stm"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Bread"] = 2,
	["Food"] = 5,
	["Dessert"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["end"] = 2,
			["fortitude"] = 2,
			["stm"] = 4
		},
		
		res = {
			["Poison"] = 5,
		}
	},
}