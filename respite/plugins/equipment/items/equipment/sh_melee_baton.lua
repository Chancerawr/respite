ITEM.name = "Baton"
ITEM.desc = "A tool used for justice."
ITEM.model = "models/warz/melee/policebaton.mdl"
ITEM.class = "hl2_m_baton"
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
	["Blunt"] = 9,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_plastics"] = 3
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5),
	ang = Angle(0, -0, 90),
	fov = 8,
}
