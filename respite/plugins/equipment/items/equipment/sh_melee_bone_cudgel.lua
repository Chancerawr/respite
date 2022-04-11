ITEM.name = "Bone Cudgel"
ITEM.desc = "A makeshift melee weapon made out of bones."
ITEM.model = "models/gibs/hgibs_spine.mdl"
ITEM.class = "hl2_m_bonecudgel"
ITEM.uniqueID = "hl2_m_bonecudgel"
ITEM.slot = "melee"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 5,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_bone"] = 4
}

ITEM.iconCam = {
	pos = Vector(-200, -0.5, 1.5),
	ang = Angle(0, -0, 90),
	fov = 4,
}