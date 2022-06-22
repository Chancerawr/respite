ITEM.name = "Taco"
ITEM.desc = "A weirdly shaped taco. It's got meat, and stuff."
ITEM.uniqueID = "food_taco"
ITEM.model = "models/hunter/triangles/025x025.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.attrib = { 
	["fortitude"] = 3, 
	["end"] = 2
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 0.1,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["fortitude"] = 3, 
			["end"] = 2
		},
		
		res = {
			["Slash"] = 2,
			["Blunt"] = -1,
		},
		
		amp = {
			["Slash"] = 2,
		},
	},
}