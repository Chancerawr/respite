ITEM.name = "Carpenter Hammer"
ITEM.desc = "A blunt tool used to apply blunt force."
ITEM.model = "models/warz/melee/hammer.mdl"
ITEM.class = "hl2_m_hammer"
ITEM.uniqueID = "hl2_m_hammer"
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
	["Blunt"] = 16,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2,
	["j_scrap_wood"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 200, -4),
	ang = Angle(0, 270, 90),
	fov = 5,
}