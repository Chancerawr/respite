ITEM.name = "Canned Chicken Noodle Soup"
ITEM.prefix = "Chicken Noodle"
ITEM.desc = "A tin can filled with chicken noodle soup."
ITEM.uniqueID = "food_chickennoodle"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["stm"] = 1 
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
			["Disease"] = 4,
			["Poison"] = 4,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}