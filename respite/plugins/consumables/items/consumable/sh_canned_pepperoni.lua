ITEM.name = "Canned Pepperoni"
ITEM.prefix = "Pepperoni"
ITEM.desc = "A small tin can containing sliced pepperonis."
ITEM.uniqueID = "food_pepperoni"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["str"] = 1,
	["fortitude"] = 1,
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
			["str"] = 2,
			["fortitude"] = 1,
		},
		
		res = {
			["Distortion"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}