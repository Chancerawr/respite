ITEM.name = "Metal Shield"
ITEM.uniqueID = "shield_metal"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.desc = "A makeshift metal shield."

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
	["Blunt"] = 2.5,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["end"] = 6,
	["stm"] = -6,
}

ITEM.salvage = {
	["j_scrap_metals"] = 10
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}