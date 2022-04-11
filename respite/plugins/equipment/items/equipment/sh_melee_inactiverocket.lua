ITEM.name = "Inactive Rocket"
ITEM.desc = "The shell of a rocket without any of the stuff that goes boom inside."
ITEM.model = "models/weapons/w_missile_launch.mdl"
ITEM.class = "hl2_m_inactiverocket"
ITEM.uniqueID = "hl2_m_inactiverocket"
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
	["Blunt"] = 4,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 5.5),
	ang = Angle(0, -0, 0),
	fov = 7,
}