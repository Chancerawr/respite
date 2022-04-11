ITEM.name = "Plastic Apple"
ITEM.prefix = "Plastic"
ITEM.desc = "A spherical plastic fruit."
ITEM.uniqueID = "food_apple_plastic"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 2
ITEM.price = 2

ITEM.attrib = { 
	["stm"] = 1 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Fruit"] = true,
	["Plastic"] = true,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["stm"] = 1
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}
