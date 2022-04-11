ITEM.name = "Bourbon"
ITEM.desc = "A glass bottle filled with liquid, it smells of alcohol."
ITEM.uniqueID = "alc_bourbon"
ITEM.model = "models/props_junk/garbage_glassbottle002a.mdl"
ITEM.material = "models/props/cs_militia/roofedges"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_bourbon"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["str"] = 3,
	["end"] = 3,
	["perception"] = -3,
	["accuracy"] = -3
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
			["Mind"] = -6,
			["Pain"] = 12,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}
