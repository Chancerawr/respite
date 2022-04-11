ITEM.name = "Wooden Shield"
ITEM.uniqueID = "shield_wood"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.material = "models/props/cs_militia/roofbeams01"
ITEM.desc = "A makeshift wooden shield."

ITEM.width = 2
ITEM.height = 3
ITEM.slot = "Shield"

ITEM.armor = 15

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["shield"] = true,
}

ITEM.dmg = {
	["Blunt"] = 1,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["end"] = 4,
	["stm"] = -2,
}

ITEM.salvage = {
	["j_scrap_wood"] = 10
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}
