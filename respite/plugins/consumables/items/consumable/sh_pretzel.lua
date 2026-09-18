ITEM.name = "Pretzel"
ITEM.prefix = "Pretzel"
ITEM.desc = "A baked pastry that has the shape of a knot."
ITEM.uniqueID = "food_pretzel"
ITEM.model = "models/foodnhouseholditems/pretzel.mdl"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.width = 1

ITEM.attrib = { 
	["fortitude"] = 2,
	["end"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Bread"] = 10,
	["Food"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 2,
			["end"] = 4
		},
		
		res = {
			["Bleed"] = 10,
		}
	},
}