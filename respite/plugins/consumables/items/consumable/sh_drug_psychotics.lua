ITEM.name = "Psychotics"
ITEM.prefix = "Psychotic"
ITEM.desc = "A bottle filled with numerous pills."
ITEM.uniqueID = "drug_psychotics"
ITEM.model = "models/props_junk/glassjug01.mdl"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.mp = -5

ITEM.disease = "fort_insa"

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = -10,
	["str"] = 4,
	["stm"] = 4,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Drug"] = true,
}

ITEM.craft = {
	mp = -5,

	buffTbl = {
		attrib = {
			["fortitude"] = -10,
			["str"] = 5,
			["stm"] = 5,
		},
		
		res = {
			["Stun"] = 50,
			["Mind"] = -50,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4,
}