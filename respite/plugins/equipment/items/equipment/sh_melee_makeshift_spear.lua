ITEM.name = "Makeshift Spear"
ITEM.desc = "A chunk of wood with a sharp piece of metal on the end."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.material = "models/props/cs_militia/roofbeams03"
ITEM.class = "hl2_m_makeshift_spear"
ITEM.uniqueID = "hl2_m_makeshift_spear"
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
	["Slash"] = 12,
	["Pierce"] = 6,
}

ITEM.scaling = {
	["stm"] = 0.2,
	["str"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 3,
	["j_scrap_wood"] = 4
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}
