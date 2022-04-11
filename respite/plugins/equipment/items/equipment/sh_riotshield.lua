ITEM.name = "Riotshield"
ITEM.uniqueID = "j_riotshield"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.desc = "A lightweight protection device deployed by police and some military organizations. Riot shields are almost exclusively long enough to cover an average sized man from the top of the head to the knees. Some riot shields are designed to be bullet resistant against low velocity handgun and shotgun ammunition, however most are not."
ITEM.width = 2
ITEM.height = 3
ITEM.slot = "Shield"

ITEM.armor = 50

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["shield"] = true,
}

ITEM.dmg = {
	["Blunt"] = 2,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["end"] = 6,
	["stm"] = -4,
}

ITEM.salvage = {
	["j_scrap_plastics"] = 8
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}