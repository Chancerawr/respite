ITEM.name = "Plank"
ITEM.desc = "A nice chunk of wood."
ITEM.model = "models/props_debris/wood_board04a.mdl"
ITEM.class = "hl2_m_plank"
ITEM.uniqueID = "hl2_m_plank"
ITEM.slot = "melee"
ITEM.width = 4
ITEM.height = 2
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
	["j_scrap_wood"] = 4,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 19,
}