ITEM.name = "Double Axe"
ITEM.desc = "A double bitted axe, useful for cutting."
ITEM.model = "models/props/cs_militia/axe.mdl"
ITEM.class = "respite_lumberaxe2"
ITEM.uniqueID = "hl2_m_lumberaxe_2"
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
	["factory"] = true,
	["makeshift"] = true,
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 22,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 4,
	["j_scrap_wood"] = 3
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Blade"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(1, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 9.5,
}
