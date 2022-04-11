ITEM.name = "Beer"
ITEM.desc = "A glass bottle filled with liquid, it smells of alcohol."
ITEM.uniqueID = "alc_beer"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_beer"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["str"] = 2,
	["end"] = 2,
	["perception"] = -2,
	["accuracy"] = -2
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Alcohol"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 2,
			["end"] = 2,
			["perception"] = -2,
			["accuracy"] = -2 
		},
		
		res = {
			["Mind"] = -3,
			["Pain"] = 6,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}
