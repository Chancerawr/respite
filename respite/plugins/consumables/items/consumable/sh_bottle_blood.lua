ITEM.name = "Bottled Blood"
ITEM.prefix = "Blood"
ITEM.desc = "A bottle filled with human blood."
ITEM.uniqueID = "food_blood"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.skin = 1
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_water_blood"
ITEM.color = Color(150,50,50)

ITEM.attrib = { 
	["fortitude"] = 3,
	["end"] = -1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Blood"] = true,
}

ITEM.craft = {
	hp = 5,
	mp = -5,

	buffTbl = {
		attrib = {
			["fortitude"] = 3,
			["end"] = -1,
		},
		
		res = {
			["Mind"] = -5,
			["Bleed"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}