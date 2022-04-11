ITEM.name = "Bottled Soda"
ITEM.prefix = "Soda"
ITEM.desc = "A plastic bottle filled with a carbonated drink."
ITEM.uniqueID = "food_soda_bottled"
ITEM.model = "models/props_junk/garbage_plasticbottle003a.mdl"
ITEM.quantity2 = 2
ITEM.price = 10
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_soda_bottle"

ITEM.attrib = { 
	["stm"] = 4,
	["end"] = -1
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Soda"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 4,
			["end"] = -1
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6,
}