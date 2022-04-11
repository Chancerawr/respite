ITEM.name = "Canned Tomatoes"
ITEM.prefix = "Tomato"
ITEM.desc = "A can filled with tomatoes."
ITEM.uniqueID = "food_tomatoes"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["stm"] = 1 
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
			["stm"] = 1 
		},
		
		res = {
			["Poison"] = 5,
			["Bleed"] = -1,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}