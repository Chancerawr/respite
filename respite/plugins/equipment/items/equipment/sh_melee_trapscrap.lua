ITEM.name = "Trap-scrap Sword"
ITEM.desc = "An odd sword/cleaver type weapon made of scrap metal."
ITEM.model = "models/props_c17/trappropeller_blade.mdl"
ITEM.class = "hl2_m_trapscrap"
ITEM.uniqueID = "hl2_m_trapscrap"
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
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 24,
}

ITEM.scaling = {
	["stm"] = 0.25,
	["str"] = 0.25,
}

ITEM.salvage = {
	["j_scrap_metals"] = 5
}

ITEM.iconCam = {
	pos = Vector(0, -20, 200),
	ang = Angle(90, 0, 0),
	fov = 35,
}