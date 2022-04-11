ITEM.name = "Metal Shiv"
ITEM.desc = "A makeshift tool used to shiv things."
ITEM.model = "models/gibs/glass_shard04.mdl"
ITEM.material = "models/props_canal/metalwall005b"
ITEM.class = "hl2_m_shiv_metal"
ITEM.uniqueID = "hl2_m_shiv_metal"
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
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 8,
	["Pierce"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}