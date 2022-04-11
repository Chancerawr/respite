ITEM.name = "Hatchet"
ITEM.desc = "A sharp tool made out of metal and wood, used for chopping."
ITEM.model = "models/warz/melee/hatchet.mdl"
ITEM.class = "hl2_m_axe"
ITEM.uniqueID = "hl2_m_axe"
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
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 16,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 200, -2),
	ang = Angle(0, 270, 90),
	fov = 5.5,
}