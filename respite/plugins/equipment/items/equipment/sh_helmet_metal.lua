ITEM.name = "Combat Helmet"
ITEM.desc = "A modern combat helmet that helps protect the head from small arms fire."
ITEM.model = "models/helm_04.mdl"
ITEM.slot = "Helmet"

ITEM.armor = 15

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["helmet"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 2,
	["j_scrap_metals"] = 3
}

ITEM.attrib = {
	["perception"] = -1,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-200, -1, 5.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}