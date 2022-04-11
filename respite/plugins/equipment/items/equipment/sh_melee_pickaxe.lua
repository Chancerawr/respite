ITEM.name = "Pickaxe"
ITEM.desc = "A tool used for breaking rocks."
ITEM.model = "models/warz/melee/pickaxe.mdl"
ITEM.class = "hl2_m_pickaxe"
ITEM.uniqueID = "hl2_m_pickaxe"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 2
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
	["Blunt"] = 12,
	["Pierce"] = 4,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4,
	["j_scrap_wood"] = 3
}

ITEM.iconCam = {
	pos = Vector(1, 200, -8),
	ang = Angle(0, 270, 90),
	fov = 11,
}