ITEM.name = "Canned Garlic"
ITEM.prefix = "Garlic"
ITEM.desc = "A small tin can containing garlic."
ITEM.uniqueID = "food_garlic"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["end"] = 1,
	["accuracy"] = 1
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Canned"] = 1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["end"] = 2,
			["accuracy"] = 1,
		},
		
		res = {
			["Fire"] = 5,
		},
		
		amp = {
			["Poison"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}