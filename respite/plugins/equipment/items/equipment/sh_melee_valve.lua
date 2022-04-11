ITEM.name = "Valve"
ITEM.desc = "A round valve taken from some kind of piping system."
ITEM.model = "models/props_borealis/door_wheel001a.mdl"
ITEM.class = "hl2_m_valve"
ITEM.uniqueID = "hl2_m_valve"
ITEM.slot = "melee"
ITEM.width = 1
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
	["Blunt"] = 6,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}