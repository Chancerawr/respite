ITEM.name = "Plastic Onion"
ITEM.prefix = "Plastic"
ITEM.desc = "A plastic bulbous plant known to have layers."
ITEM.uniqueID = "food_onion_plastic"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 3
ITEM.price = 2

ITEM.attrib = { 
	["str"] = 1,
	["stm"] = 1,
	["accuracy"] = 1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Vegetable"] = true,
	["Plastic"] = true,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["str"] = 1,
			["stm"] = 1,
			["accuracy"] = 1,
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65, 55, 40),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}
