ITEM.name = "Chocolate"
ITEM.desc = "A box of delicious chocolates."
ITEM.uniqueID = "food_chocolate"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_wasteland/wood_fence01a"
ITEM.quantity2 = 1
ITEM.price = 7
ITEM.container = "j_empty_chocolate_box"

ITEM.attrib = { 
	["stm"] = 2,
	["preception"] = 1
}

ITEM.loot = {
	["Consumable"] = 1,
	["Food"] = 1,
	["Candy"] = 10,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["stm"] = 2,
			["preception"] = 1
		},
		
		res = {
			["Sleep"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}