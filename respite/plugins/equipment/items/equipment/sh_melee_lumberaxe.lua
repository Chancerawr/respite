ITEM.name = "Lumber Axe"
ITEM.desc = "A tool used for chopping lumber."
ITEM.model = "models/props/cs_militia/axe.mdl"
ITEM.class = "hl2_m_lumberaxe"
ITEM.uniqueID = "hl2_m_lumberaxe"
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
	["SLash"] = 18,
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
	pos = Vector(1, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 9.5,
}
