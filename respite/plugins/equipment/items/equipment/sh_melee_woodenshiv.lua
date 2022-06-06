ITEM.name = "Wooden Shiv"
ITEM.desc = "A sharpened piece of wood, clearly splintered off something bigger."
ITEM.model = "models/props_c17/FurnitureDrawer001a_Shard01.mdl"
ITEM.class = "hl2_m_woodenshiv"
ITEM.uniqueID = "hl2_m_woodenshiv"
ITEM.slot = "melee"
ITEM.width = 1
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
	["sharp"] = true,
}

ITEM.dmg = {
	["Slash"] = 4,
	["Blunt"] = 2,
}

ITEM.scaling = {
	["stm"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_wood"] = 2
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 90),
	fov = 5,
}