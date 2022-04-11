ITEM.name = "Crowbar"
ITEM.desc = "A tool made out of metal, used for prying."
ITEM.model = "models/warz/melee/crowbar.mdl"
ITEM.class = "hl2_m_crowbar"
ITEM.uniqueID = "hl2_m_crowbar"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 14,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0.5, -1.5),
	ang = Angle(0, -0, 90),
	fov = 7,
}
