ITEM.name = "Knife"
ITEM.desc = "A sharp tool used to cut things."
ITEM.model = "models/warz/melee/knife.mdl"
ITEM.class = "hl2_m_knife"
ITEM.uniqueID = "hl2_m_knife"
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
}

ITEM.dmg = {
	["Slash"] = 10,
	["Pierce"] = 5,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.actions = {
	"weapon_slash",
	"weapon_stab",
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(0, 200, 1.75),
	ang = Angle(0, 270, 92),
	fov = 3.85,
}
