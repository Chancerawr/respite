ITEM.name = "Canned Pears"
ITEM.prefix = "Pear"
ITEM.desc = "A can filled with pears."
ITEM.uniqueID = "food_pears"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["stm"] = 1 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Canned"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 1,
		},
		
		res = {
			["Root"] = 5,
			["Stun"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}