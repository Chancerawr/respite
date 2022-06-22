ITEM.name = "Wine"
ITEM.desc = "A glass bottle filled with liquid, it smells of wine."
ITEM.uniqueID = "alc_wine"
ITEM.model = "models/props/cs_militia/bottle01.mdl"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_wine"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["stm"] = 3,
	["str"] = 3,
	["perception"] = -1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 1,
	["Alcohol"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["str"] = 3,
			["perception"] = -1,
		},
		
		res = {
			["Blind"] = -5,
			["Pain"] = 5,
			["Disease"] = 10,
			["Time"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 7),
	ang = Angle(0, -0, 0),
	fov = 5,
}