ITEM.name = "Rebar Club"
ITEM.desc = "A spike of rebar with a chunk of concrete on it."
ITEM.model = "models/props_debris/rebar003b_48.mdl"
ITEM.class = "respite_rebar"
ITEM.uniqueID = "hl2_m_rebar"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 1
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["makeshift"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 24,
}

ITEM.scaling = {
	["str"] = 0.25,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4,
	["j_scrap_concrete"] = 2
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 15,
}