ITEM.name = "Canned Pineapple"
ITEM.prefix = "Pineapple"
ITEM.desc = "A small tin can containing pineapple slices."
ITEM.uniqueID = "food_pineapple"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["stm"] = 1,
	["luck"] = 1,
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
			["stm"] = 2,
			["luck"] = 1,
		},
		
		res = {
			["Acid"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}