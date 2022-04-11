ITEM.name = "Pot"
ITEM.desc = "Common kitchen pot for boiling food and stuff."
ITEM.model = "models/props_interiors/pot02a.mdl"
ITEM.class = "hl2_m_pot"
ITEM.uniqueID = "hl2_m_pot"
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
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}