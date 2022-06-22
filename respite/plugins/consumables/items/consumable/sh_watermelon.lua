ITEM.name = "Watermelon"
ITEM.desc = "A hard-shelled green fruit."
ITEM.uniqueID = "food_melon"
ITEM.model = "models/props_junk/watermelon01.mdl"
ITEM.quantity2 = 6
ITEM.price = 7
ITEM.width = 2
ITEM.height = 2

ITEM.attrib = { 
	["end"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 4,
	["Fruit"] = 4,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["end"] = 2,
		},
		
		res = {
			["Bleed"] = 5,
			["Poison"] = 5,
			["Fire"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6,
}