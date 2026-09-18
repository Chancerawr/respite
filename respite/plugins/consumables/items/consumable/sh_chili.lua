ITEM.name = "Chili Pepper"
ITEM.prefix = "Chili"
ITEM.desc = "A red pepper."
ITEM.uniqueID = "food_chili"
ITEM.model = "models/foodnhouseholditems/chili.mdl"
ITEM.quantity2 = 2
ITEM.price = 4

ITEM.attrib = { 
	["perception"] = -1,
	["stm"] = 3,
	["enc"] = 1,
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
			["perception"] = -1,
			["stm"] = 3,
			["end"] = 1,
		},
		
		res = {
			["Blind"] = 3,
		}
	},
}