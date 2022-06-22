ITEM.name = "Scapula"
ITEM.uniqueID = "j_scapula"
ITEM.model = "models/Gibs/HGIBS_scapula.mdl"
ITEM.desc = "A scapula bone from some humanoid."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_bone"] = 2
}

ITEM.loot = {
	["Consumable"] = 0.01,
	["Junk"] = 0.1,
	["Bone"] = 3,
	["Corpse"] = 3,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["stm"] = 2,
			["end"] = 2,
		},
		
		res = {
			["Blunt"] = -4,
			["Slash"] = 4,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 1, 0.5),
	ang = Angle(0, -0, 90),
	fov = 4,
}