ITEM.name = "Makeshift Sledgehammer"
ITEM.desc = "A large hammer usually used to distribute force over a wide area."
ITEM.model = "models/props_debris/wood_board02a.mdl"
ITEM.class = "respite_makeshift_sledgehammer"
ITEM.uniqueID = "hl2_m_sledgehammer"
ITEM.slot = "melee"
ITEM.width = 4
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
	["Blunt"] = 24,
}

ITEM.scaling = {
	["str"] = 0.3,
}

ITEM.salvage = {
	["j_scrap_concrete"] = 2,
	["j_scrap_wood"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 19,
}