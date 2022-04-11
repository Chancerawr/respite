ITEM.name = "Bottled Fiend Blood"
ITEM.prefix = "Fiend Blood"
ITEM.desc = "A bottle filled with fiend blood."
ITEM.uniqueID = "food_blood_fiend"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.skin = 1
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_water_blood"
ITEM.color = Color(150,50,50)

ITEM.attrib = { 
	["fortitude"] = -3,
	["end"] = -3,
} 

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Blood"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 15,
	mp = -10,

	buffTbl = {
		attrib = {
			["fortitude"] = -3,
			["end"] = -3,
		},

		res = {
			["Mind"] = -15,
			["Bleed"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}