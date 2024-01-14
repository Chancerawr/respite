ITEM.name = "Wooden Sign"
ITEM.desc = "A wooden sign with something written in big red letters across it."
ITEM.model = "models/props_lab/bewaredog.mdl"
ITEM.class = "respite_sign_wood"
ITEM.uniqueID = "hl2_m_woodensign"
ITEM.slot = "melee"
ITEM.width = 1
ITEM.height = 2
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
	["j_scrap_wood"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(200, 0, 22),
	ang = Angle(180, 0, 180),
	fov = 9,
}