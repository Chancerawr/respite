ITEM.name = "Wrench"
ITEM.desc = "A useful metal tool."
ITEM.model = "models/warz/melee/wrench.mdl"
ITEM.class = "hl2_m_wrench"
ITEM.uniqueID = "hl2_m_wrench"
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
	["factory"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 8,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.attrib = {
	["medical"] = 3,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -1),
	ang = Angle(0, -0, 90),
	fov = 3.5,
}