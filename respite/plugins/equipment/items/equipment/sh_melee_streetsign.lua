ITEM.name = "Street Sign"
ITEM.desc = "A huge street sign ripped straight from the pavement."
ITEM.model = "models/props/cs_assault/streetsign01.mdl"
ITEM.class = "respite_streetsign"
ITEM.uniqueID = "hl2_m_streetsign"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 5
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
	["j_scrap_metals"] = 5
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 60),
	ang = Angle(0, 0, 90),
	fov = 48,
}