ITEM.name = "Toblerone"
ITEM.prefix = "Toblerone"
ITEM.desc = "A distinctively shaped swiss chocolate."
ITEM.uniqueID = "food_toblerone"
ITEM.model = "models/foodnhouseholditems/toblerone.mdl"
ITEM.quantity2 = 6
ITEM.price = 4
ITEM.width = 2

ITEM.attrib = { 
	["stm"] = 4,
	["accuracy"] = 4,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Chocolate"] = 7,
	["Candy"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 4,
			["accuracy"] = 4,
		},
		
		res = {
			["Poison"] = 5,
		}
	},
}