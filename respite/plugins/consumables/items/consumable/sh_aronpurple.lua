ITEM.name = "Aronpurple"
ITEM.desc = "A spherical purple fruit."
ITEM.uniqueID = "food_aronpurple"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "models/props_c17/FurnitureFabric003a"
ITEM.color = Color(160, 42, 140)
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = { 
	["stm"] = 3,
	["accuracy"] = 3,
	["luck"] = -1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["accuracy"] = 3,
			["luck"] = -1,
		},
		
		res = {
			["Slow"] = 15,
			["Root"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}