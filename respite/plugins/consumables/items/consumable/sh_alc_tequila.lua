ITEM.name = "Tequila"
ITEM.desc = "A glass bottle filled with liquid, it smells of alcohol."
ITEM.uniqueID = "alc_tequila"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_tequila"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["str"] = 4,
	["end"] = 2,
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
			["str"] = 4,
			["end"] = 2,
			["perception"] = -3,
			["accuracy"] = -3
		},
		
		res = {
			["Mind"] = -9,
			["Pain"] = 16,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 5,
}
