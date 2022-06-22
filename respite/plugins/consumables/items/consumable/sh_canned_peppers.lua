ITEM.name = "Canned Peppers"
ITEM.prefix = "Pepper"
ITEM.desc = "A small tin can containing green peppers."
ITEM.uniqueID = "food_peppers"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["stm"] = 1,
	["medical"] = 1,
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
			["medical"] = 2,
			["stm"] = 1,
		},
		
		res = {
			["Pain"] = 5,
			["Blind"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}