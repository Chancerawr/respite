ITEM.name = "Carrot"
ITEM.desc = "An orange carrot."
ITEM.uniqueID = "food_carrot"
ITEM.model = "models/props/cs_office/Snowman_nose.mdl"
ITEM.quantity2 = 1
ITEM.price = 1

ITEM.attrib = { 
	["accuracy"] = 1,
	["perception"] = 3,
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Vegetable"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["accuracy"] = 1,
			["perception"] = 3,
		},
		
		res = {
			["Blind"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 1.25,
}