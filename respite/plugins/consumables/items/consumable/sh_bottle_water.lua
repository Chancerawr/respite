ITEM.name = "Bottled Water"
ITEM.prefix = "Water"
ITEM.uniqueID = "food_water"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.desc = "A bottle filled with clear water."
ITEM.quantity2 = 2
ITEM.price = 28
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_water"

ITEM.attrib = { 
	["stm"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 5,
	["Water"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 2,
		},
		
		buffTbl = {
			res = {
				["Fire"] = 5,
			}
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}