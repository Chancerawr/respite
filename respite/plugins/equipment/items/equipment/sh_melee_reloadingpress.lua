ITEM.name = "Reloading Press"
ITEM.desc = "A press used for reloading spent cartridges by hand."
ITEM.model = "models/props/cs_militia/reloadingpress01.mdl"
ITEM.class = "hl2_m_reloadingpress"
ITEM.uniqueID = "hl2_m_reloadingpress"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 12,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 200, 5),
	ang = Angle(0, 270, 90),
	fov = 9,
}