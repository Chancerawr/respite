ITEM.name = "Clay Pot"
ITEM.desc = "A well rounded, sturdy clay pot."
ITEM.model = "models/props/de_inferno/claypot02.mdl"
ITEM.class = "respite_clay_pot"
ITEM.uniqueID = "hl2_m_claypot"
ITEM.slot = "melee"
ITEM.width = 2
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
	["Blunt"] = 8,
}

ITEM.scaling = {
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_concrete"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 26),
	ang = Angle(0, -0, 0),
	fov = 10,
}