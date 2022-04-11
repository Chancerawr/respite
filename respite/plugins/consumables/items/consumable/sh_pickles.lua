ITEM.name = "Pickles"
ITEM.desc = "A jar filled with pickles."
ITEM.uniqueID = "food_pickles"
ITEM.model = "models/props_lab/jar01a.mdl"
ITEM.material = "models/XQM/WoodPlankTexture"
ITEM.quantity2 = 10
ITEM.price = 8
--ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["perception"] = 3,
	["medical"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["perception"] = 3,
			["medical"] = 3
		},
		
		res = {
			["Taunt"] = 5,
			["Mind"] = 5,
			["Fear"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}