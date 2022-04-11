ITEM.name = "Pitchfork"
ITEM.desc = "An agricultural tool."
ITEM.model = "models/warz/melee/pitchfork.mdl"
ITEM.class = "hl2_m_pitchfork"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Slash"] = 8,
	["Pierce"] = 8,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(0, 200, 2),
	ang = Angle(0, 270, 90),
	fov = 13,
}