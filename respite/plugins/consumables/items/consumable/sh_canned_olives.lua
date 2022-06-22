ITEM.name = "Canned Olives"
ITEM.prefix = "Olive"
ITEM.desc = "A small tin can containing olives."
ITEM.uniqueID = "food_olives"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["perception"] = 1,
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
			["perception"] = 2,
			["accuracy"] = 1,
		},
		
		res = {
			["Disease"] = 5,
			["Poison"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}