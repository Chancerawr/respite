ITEM.name = "Canned Spam"
ITEM.prefix = "Spam"
ITEM.desc = "A can of process meat."
ITEM.uniqueID = "food_spam"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["end"] = 2,
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Canned"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 1,
			["end"] = 2,
		},
		
		res = {
			["Move"] = 10,
			["Knockdown"] = 10,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}