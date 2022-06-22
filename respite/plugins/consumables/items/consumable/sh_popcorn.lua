ITEM.name = "Popcorn"
ITEM.desc = "Some delicious buttery popcorn."
ITEM.uniqueID = "food_popcorn"
ITEM.model = "models/props_junk/MetalBucket01a.mdl"
ITEM.material = "models/props_debris/plasterwall039c"
ITEM.quantity2 = 8
ITEM.price = 10

ITEM.attrib = { 
	["fortitude"] = 5,
	["end"] = 5,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
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