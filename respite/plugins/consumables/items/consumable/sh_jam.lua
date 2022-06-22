ITEM.name = "Jam"
ITEM.desc = "A jam made from berries."
ITEM.uniqueID = "food_jam"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["perception"] = 3, 
	["medical"] = 3,
	["luck"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Fruit"] = 5,
	["Food"] = 5,
	["Drink"] = 0.1,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["perception"] = 3, 
			["medical"] = 3,
			["luck"] = 3
		},
		
		res = {
			["Mind"] = 7,
			["Blind"] = 7,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}