ITEM.name = "Industrial Fan"
ITEM.desc = "An old industrial fan."
ITEM.model = "models/props_silo/fanoff.mdl"
ITEM.class = "hl2_m_fan"
ITEM.uniqueID = "j_industrial_fan"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 3
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
	["Blunt"] = 6,
	["Slash"] = 6,
}

ITEM.scaling = {
	["stm"] = 0.15,
	["str"] = 0.15,
}

ITEM.salvage = {
	["j_scrap_metals"] = 5
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 16,
}