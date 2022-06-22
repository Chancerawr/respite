ITEM.name = "Spine"
ITEM.uniqueID = "j_spine"
ITEM.model = "models/gibs/hgibs_spine.mdl"
ITEM.desc = "The spine of some humanoid."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1

ITEM.salvItem = {
	["j_scrap_bone"] = 2
}

ITEM.loot = {
	["Consumable"] = 0.01,
	["Junk"] = 0.1,
	["Bone"] = 2,
	["Corpse"] = 3,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["str"] = 1,
			["end"] = 1,
		},
		
		res = {
			["Blunt"] = -5,
			["Slash"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, -0.5, 1.5),
	ang = Angle(0, -0, 90),
	fov = 4,
}