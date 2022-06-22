ITEM.name = "Plastic Watermelon"
ITEM.prefix = "Plastic"
ITEM.desc = "A hard-shelled plastic fruit."
ITEM.uniqueID = "food_melon_plastic"
ITEM.model = "models/props_junk/watermelon01.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 6
ITEM.price = 3
ITEM.width = 2
ITEM.height = 2

ITEM.attrib = { 
	["end"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 8,
	["Fruit"] = 8,
	["Plastic"] = 8,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["end"] = 1,
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6,
}