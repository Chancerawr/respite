ITEM.name = "Rib"
ITEM.uniqueID = "j_rib"
ITEM.model = "models/gibs/hgibs_rib.mdl"
ITEM.desc = "A rib from some humanoid."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_bone"] = 1
}

ITEM.loot = {
	["Consumable"] = 0.01,
	["Junk"] = 0.1,
	["Bone"] = 10,
	["Corpse"] = 5,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["end"] = 1,
		},
		
		res = {
			["Blunt"] = -2,
			["Slash"] = 2,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5.5,
}