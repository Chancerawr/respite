ITEM.name = "Wooden Pole"
ITEM.desc = "A long wooden pole. Great for cracking people over the head."
ITEM.model = "models/props_c17/signpole001.mdl"
ITEM.material = "models/props/cs_militia/roofbeams01"
ITEM.class = "respite_pole_wooden"
ITEM.uniqueID = "hl2_m_woodenpole"
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
	["Blunt"] = 12,
}

ITEM.scaling = {
	["stm"] = 0.2,
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
	pos = Vector(-200, 0, 54),
	ang = Angle(0, -0, 90),
	fov = 32,
}