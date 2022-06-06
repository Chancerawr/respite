ITEM.name = "Bone Shiv"
ITEM.desc = "A makeshift shiv made out of bones."
ITEM.model = "models/gibs/hgibs_scapula.mdl"
ITEM.class = "hl2_m_boneshiv"
ITEM.uniqueID = "hl2_m_boneshiv"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 8,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_bone"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 1, 0.5),
	ang = Angle(0, -0, 90),
	fov = 4,
}