ITEM.name = "Coconut"
ITEM.desc = "A very hard shelled nut."
ITEM.uniqueID = "food_coconut"
ITEM.model = "models/props_phx/misc/smallcannonball.mdl"
ITEM.material = "models/props/CS_militia/roofbeams03"
ITEM.quantity2 = 4
ITEM.price = 7

ITEM.attrib = { 
	["end"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Fruit"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["end"] = 3
		},
		
		res = {
			["Slash"] = 8,
			["Pierce"] = 8,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(143, 126, 91),
	ang = Angle(25, 220, 0),
	fov = 4.55,
}