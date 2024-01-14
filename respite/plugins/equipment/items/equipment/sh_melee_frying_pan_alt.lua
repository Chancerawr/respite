ITEM.name = "Frying Pan"
ITEM.desc = "A frying pan, frypan, or skillet is a flat-bottomed pan used for frying, searing, and browning foods."
ITEM.model = "models/props_c17/metalPot002a.mdl"
ITEM.class = "respite_fryingpan2"
ITEM.uniqueID = "hl2_m_frying_pan_alt"
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
	["Blunt"] = 10,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 9,
}
