ITEM.name = "Plastic Aronpurple"
ITEM.desc = "A spherical plastic fruit."
ITEM.uniqueID = "food_aronpurple_plastic"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 2
ITEM.price = 3
ITEM.plastic = true --for plastic converter

ITEM.attrib = { 
	["stm"] = 1,
	["accuracy"] = 1,
	["luck"] = -0.5,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Fruit"] = 1,
	["Plastic"] = 1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 1,
			["accuracy"] = 1,
			["luck"] = -0.5,
		},
		
		res = {
			["Electric"] = 5,
			["Poison"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}