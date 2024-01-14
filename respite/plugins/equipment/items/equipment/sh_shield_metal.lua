ITEM.name = "Metal Shield"
ITEM.desc = "A makeshift metal shield."
ITEM.uniqueID = "shield_metal"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"

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

ITEM.res = {
	["Slash"] = 10,
	["Blunt"] = 10,
	["Pierce"] = 5,
	
	["Fire"] = 5,
	["Cold"] = 5,
	["Electric"] = -5,
}

ITEM.upgradeSlots = { 
	["Dream"] = 2,
	["Barrel"] = 1,
}

ITEM.actions = {
	"shield_hunker",
}

ITEM.salvage = {
	["j_scrap_metals"] = 10
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}