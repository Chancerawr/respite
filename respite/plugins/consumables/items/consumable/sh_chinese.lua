ITEM.name = "Chinese Food"
ITEM.prefix = "Chinese"
ITEM.desc = "A takeout carton filled with chinese food."
ITEM.uniqueID = "food_chinese"
ITEM.model = "models/props_junk/garbage_takeoutcarton001a.mdl"
ITEM.quantity2 = 2
ITEM.price = 5

ITEM.attrib = { 
	["perception"] = 1, 
	["fortitude"] = 2,
	["end"] = 1
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["perception"] = 1, 
			["fortitude"] = 2,
			["end"] = 1
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4,
}