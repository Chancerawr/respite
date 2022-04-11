ITEM.name = "Canned Beef Stew"
ITEM.prefix = "Beef Stew"
ITEM.desc = "A tin can filled with beef stew."
ITEM.uniqueID = "food_beefstew"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.quantity2 = 3
ITEM.price = 5
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["stm"] = 1 
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
		},
		
		res = {
			["Move"] = 5,
			["Slow"] = 5,
			["Knockdown"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}