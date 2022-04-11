ITEM.name = "Makeshift Glaive"
ITEM.desc = "A makeshift glaive made out of multiple pieces of scrap."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.class = "hl2_m_makeshift_glaive"
ITEM.uniqueID = "hl2_m_makeshift_glaive"
ITEM.slot = "melee"
ITEM.width = 5
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
	["Slash"] = 10,
	["Pierce"] = 10,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}