ITEM.name = "Canned Spinach"
ITEM.prefix = "Spinach"
ITEM.desc = "A can filled with spinach."
ITEM.uniqueID = "food_spinach"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["str"] = 2
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Canned"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 4,
		},
		
		res = {
			["Slow"] = 5,
			["Stun"] = 5,
			["Root"] = 5,
			["Fear"] = 5,
			["Pain"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}