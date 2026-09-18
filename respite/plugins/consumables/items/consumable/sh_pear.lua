ITEM.name = "Pear"
ITEM.desc = "A yellowish fruit."
ITEM.uniqueID = "food_pear"
ITEM.model = "models/foodnhouseholditems/pear.mdl"
ITEM.quantity2 = 6
ITEM.price = 5

ITEM.attrib = { 
	["stm"] = 3,
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
			["stm"] = 3,
			["perception"] = 2,
		},
		
		res = {
			["Slow"] = 5,
		},
	},
}