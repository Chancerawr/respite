ITEM.name = "Canned Laughter"
ITEM.prefix = "Funny"
ITEM.desc = "A can filled with laughter?"
ITEM.uniqueID = "food_laugh"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.hungerAmount = 10
ITEM.quantity2 = 1
ITEM.price = 0

ITEM.sound = "vo/citadel/br_laugh01.wav"
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["fortitude"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Canned"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 3,
	mp = -1,

	buffTbl = {
		attrib = {
			["fortitude"] = 6,
		},
		
		res = {
			["Fear"] = 10,
			["Disease"] = 5,
			["Poison"] = 5,
			["Time"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}