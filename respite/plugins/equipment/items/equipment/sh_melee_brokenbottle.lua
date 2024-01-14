ITEM.name = "Broken Bottle"
ITEM.desc = "A glass bottle that has been smashed open."
ITEM.model = "models/props_junk/glassbottle01a_chunk01a.mdl"
ITEM.class = "respite_broken_bottle"
ITEM.uniqueID = "hl2_m_brokenbottle"
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
	["Slash"] = 6,
	["Pierce"] = 4,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_glass"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}