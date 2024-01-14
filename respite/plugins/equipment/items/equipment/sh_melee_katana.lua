ITEM.name = "Katana"
ITEM.desc = "A very sharp sword."
ITEM.model = "models/warz/melee/katana1.mdl"
ITEM.class = "respite_katana"
ITEM.uniqueID = "hl2_m_katana"
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
	["j_scrap_metals"] = 4
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(378, 318, 235),
	ang = Angle(25, 220, 90),
	fov = 4,
}