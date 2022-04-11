ITEM.name = "Depressant Soda"
ITEM.desc = "An aluminium can filled with something sad."
ITEM.uniqueID = "food_soda_depress"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["fortitude"] = -3,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Soda"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["fortitude"] = -3,
			["stm"] = 1,
		},
		
		res = {
			["Fear"] = 5,
			["Pain"] = 5,
			["Sleep"] = 10,
			["Slow"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}