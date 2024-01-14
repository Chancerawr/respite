ITEM.name = "Grog"
ITEM.desc = "Rum diluted with water with lemon juice."
ITEM.uniqueID = "alc_grog"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_beer2"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["str"] = 4,
	["end"] = 2,
	["perception"] = -2,
	["accuracy"] = -2
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 2,
	["Alcohol"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 4,
			["end"] = 2,
			["perception"] = -2,
			["accuracy"] = -2
		},
		
		res = {
			["Mind"] = -7,
			["Pain"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}