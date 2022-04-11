ITEM.name = "Riot Helmet"
ITEM.desc = "A type of helmet designed for law enforcement and military use to protect its wearer's head, face and eyes from handheld melee weapons, and thrown projectiles such as bricks."
ITEM.model = "models/helm_08.mdl"
ITEM.slot = "Helmet"

ITEM.armor = 20

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["helmet"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_glass"] = 2,
	["j_scrap_metals"] = 3
}

ITEM.attrib = {
	["perception"] = -2,
}

ITEM.iconCam = {
	pos = Vector(-200, -1.5, 5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}