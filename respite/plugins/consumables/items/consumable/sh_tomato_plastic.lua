ITEM.name = "Plastic Tomato"
ITEM.desc = "A plastic fruit."
ITEM.uniqueID = "food_tomato_plastic"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 2
ITEM.price = 3
ITEM.plastic = true --for plastic converter

ITEM.attrib = { 
	["fortitude"] = 0.5,
	["end"] = 0.5,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 10,
	["Fruit"] = 10,
	["Plastic"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 0.5,
			["end"] = 0.5,
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