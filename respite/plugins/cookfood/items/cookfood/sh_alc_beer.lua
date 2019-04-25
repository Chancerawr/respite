ITEM.name = "Beer"
ITEM.uniqueID = "alc_beer"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.hungerAmount = 4
ITEM.desc = "A glass bottle filled with liquid, it smells of alcohol."
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_beer"
ITEM.color = Color(139,69,19)

--3 str
ITEM.attribBoosts = { 
	["str"] = 5,
	["end"] = 5,
	["perception"] = -5,
	["accuracy"] = -5
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}
