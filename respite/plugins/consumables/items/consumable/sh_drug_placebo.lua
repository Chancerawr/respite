ITEM.name = "Placebo"
ITEM.prefix = "Medical"
ITEM.desc = "A bottle filled with some kind of pill."
ITEM.uniqueID = "drug_placebo"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.category = "Drug"
ITEM.duration = 12000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = 1

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drug"] = true,
	["Special"] = true,
}

ITEM.craft = {
	mp = 1,

	buffTbl = {
		attrib = {
			["fortitude"] = 1,
		},
		
		res = {
			["Mind"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}