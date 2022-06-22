ITEM.name = "Canned Mushrooms"
ITEM.prefix = "Mushroom"
ITEM.desc = "An old tin can filled with mushrooms, the label is worn off."
ITEM.uniqueID = "food_mushrooms"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["perception"] = 1,
	["str"] = 1,
	["end"] = 2,
	["accuracy"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Canned"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 1,
		},
		
		res = {
			["Weak"] = 5,
			["Bleed"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}