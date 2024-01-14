ITEM.name = "Candy"
ITEM.desc = "A box of delicious candies."
ITEM.uniqueID = "food_candy"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_c17/FurnitureFabric003a"
ITEM.quantity2 = 1
ITEM.price = 6
ITEM.container = "j_empty_candy_box"

ITEM.attrib = { 
	["stm"] = 3,
	["fortitude"] = 2
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
			["stm"] = 3,
			["fortitude"] = 2
		},
		
		res = {
			["Sleep"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(89.43, 74.9, 54.5),
	ang = Angle(25, 220, 0),
	fov = 5,
}