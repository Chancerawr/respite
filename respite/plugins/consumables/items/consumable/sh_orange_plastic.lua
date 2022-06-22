ITEM.name = "Plastic Orange"
ITEM.prefix = "Plastic"
ITEM.desc = "A spherical plastic fruit."
ITEM.uniqueID = "food_orange_plastic"
ITEM.model = "models/props/cs_italy/orange.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 6
ITEM.price = 2

ITEM.attrib = { 
	["accuracy"] = 1 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 7,
	["Fruit"] = 10,
	["Plastic"] = 10,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["accuracy"] = 1,
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(82.7, 69.4, 50.33),
	ang = Angle(25, 220, 0),
	fov = 4.32,
}