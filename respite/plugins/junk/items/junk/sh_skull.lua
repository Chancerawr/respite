ITEM.name = "Skull"
ITEM.uniqueID = "j_skull"
ITEM.model = "models/Gibs/HGIBS.mdl"
ITEM.desc = "The skull of some humanoid."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_bone"] = 3
}

ITEM.loot = {
	["Consumable"] = 0.01,
	["Junk"] = 0.1,
	["Bone"] = 1,
	["Corpse"] = 2,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["fortitude"] = 3,
			["perception"] = 3,
		},
		
		res = {
			["Blunt"] = -3,
			["Slash"] = 3,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 2.5,
}