ITEM.name = "Cookies"
ITEM.prefix = "Cookie"
ITEM.desc = "A box of delicious cookies."
ITEM.uniqueID = "food_cookies"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_wasteland/wood_fence01a_skin2"
ITEM.quantity2 = 1
ITEM.price = 7
ITEM.container = "j_empty_chocolate_box"

ITEM.attrib = { 
	["stm"] = 3,
	["end"] = 1
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["end"] = 1,
		},
		
		res = {
			["Slow"] = 10,
			["Stun"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}