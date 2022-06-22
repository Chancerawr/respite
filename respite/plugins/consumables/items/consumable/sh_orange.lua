ITEM.name = "Orange"
ITEM.desc = "A spherical orange fruit."
ITEM.uniqueID = "food_orange"
ITEM.model = "models/props/cs_italy/orange.mdl"
ITEM.quantity2 = 6
ITEM.price = 3

ITEM.attrib = { 
	["accuracy"] = 2 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 10,
	["Fruit"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["accuracy"] = 2 
		},
		
		res = {
			["Slow"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(82.7, 69.4, 50.33),
	ang = Angle(25, 220, 0),
	fov = 4.32,
}