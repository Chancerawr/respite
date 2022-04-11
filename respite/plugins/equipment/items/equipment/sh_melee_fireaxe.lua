ITEM.name = "Fire Axe"
ITEM.desc = "A sharp tool made out of metal and wood, used for chopping."
ITEM.model = "models/warz/melee/fireaxe.mdl"
ITEM.class = "hl2_m_fireaxe"
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
	["factory"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 20,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, -1, -3),
	ang = Angle(0, -0, 90),
	fov = 11,
}