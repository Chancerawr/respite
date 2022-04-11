ITEM.name = "Whiskey"
ITEM.desc = "A glass bottle filled with liquid, it smells of alcohol."
ITEM.uniqueID = "alc_whiskey"
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_whiskey"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["str"] = 3,
	["end"] = 3,
	["perception"] = -3,
	["accuracy"] = -3
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
			["str"] = 3,
			["end"] = 3,
			["perception"] = -3,
			["accuracy"] = -3
		},
		
		res = {
			["Mind"] = -5,
			["Pain"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}