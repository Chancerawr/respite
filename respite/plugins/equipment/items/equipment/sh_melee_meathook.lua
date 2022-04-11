ITEM.name = "Meat Hook"
ITEM.desc = "A metal instrument usually used to hang meat."
ITEM.model = "models/props_junk/meathook001a.mdl"
ITEM.class = "hl2_m_meathook"
ITEM.uniqueID = "hl2_m_meathook"
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
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 12,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 14,
}