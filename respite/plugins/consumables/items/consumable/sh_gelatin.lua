ITEM.name = "Gelatin Pudding"
ITEM.desc = "A jiggly wiggly tasty treat."
ITEM.uniqueID = "food_onion"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_lab/xencrystal_sheet"
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = { 
	["stm"] = 4,
	["end"] = 4,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 2,
	["Dessert"] = 4,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 4,
			["end"] = 4,
		},
		
		res = {
			["Slow"] = -5,
			["Stun"] = 8,
			["Sleep"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65, 55, 40),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}
