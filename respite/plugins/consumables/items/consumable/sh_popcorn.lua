ITEM.name = "Popcorn"
ITEM.desc = "Some delicious buttery popcorn."
ITEM.uniqueID = "food_popcorn"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.quantity2 = 8
ITEM.price = 10

ITEM.attrib = { 
	["fortitude"] = 5,
	["end"] = 5,
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 5,
			["end"] = 5,
		},
		
		res = {
			["Mind"] = -5,
			["Blind"] = 15,
		}
	},
}