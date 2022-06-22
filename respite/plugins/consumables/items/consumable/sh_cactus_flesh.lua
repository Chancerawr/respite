ITEM.name = "Cactus Flesh"
ITEM.prefix = "Cactus"
ITEM.desc = "Flesh of a cactus plant."
ITEM.uniqueID = "food_cactus"
ITEM.model = "models/props_wasteland/prison_toiletchunk01f.mdl"
ITEM.material = "models/xqm/woodplanktexture"
ITEM.quantity2 = 2
ITEM.price = 4

ITEM.attrib = { 
	["medical"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Vegetable"] = 2,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["medical"] = 3,
		},
		
		res = {
			["Blind"] = 3,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 3,
}