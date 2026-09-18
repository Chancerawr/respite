ITEM.name = "Bread"
ITEM.prefix = "Bread"
ITEM.desc = "A loaf of bread conveniently stored in a box."
ITEM.uniqueID = "food_bread"
ITEM.model = "models/foodnhouseholditems/bread-1.mdl"
ITEM.quantity2 = 8
ITEM.price = 7
ITEM.width = 1

ITEM.attrib = { 
	["stm"] = 3,
	["end"] = 2
}

ITEM.loot = {
	["Consumable"] = 10,
	["Bread"] = 10,
	["Food"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["end"] = 2
		},
		
		res = {
			["Bleed"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 6.5),
	ang = Angle(0, -0, 0),
	fov = 10,
}
