ITEM.name = "Bone Rattle"
ITEM.desc = "A small makeshift melee weapon made out of bones."
ITEM.model = "models/gibs/hgibs_spine.mdl"
ITEM.class = "hl2_m_bonerattle"
ITEM.uniqueID = "hl2_m_bonerattle"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_bone"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, -0.5, 1.5),
	ang = Angle(0, -0, 90),
	fov = 4,
}