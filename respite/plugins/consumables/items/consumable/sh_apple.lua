ITEM.name = "Apple"
ITEM.desc = "A spherical green fruit."
ITEM.uniqueID = "food_apple"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = { 
	["stm"] = 2,
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
			["stm"] = 2
		},
		
		res = {
			["Slow"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}