ITEM.name = "Pick-axe"
ITEM.desc = "A long pick-axe commonly used to assist extracting valuable ores from the earth."
ITEM.model = "models/props_mining/pickaxe01.mdl"
ITEM.class = "respite_pickaxe2"
ITEM.uniqueID = "hl2_m_pickaxe_alt"
ITEM.slot = "melee"
ITEM.width = 3
ITEM.height = 2
ITEM.price = 0
ITEM.flag = "v"
ITEM.category = "Weapons - Melee"

ITEM.rarity = 10
ITEM.lootTags = {
	["weapon"] = true,
	["melee"] = true,
	["sharp"] = true,
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 12,
	["Pierce"] = 4,
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
	["Bludgeon"] = 1,
	["Handle"] = 1
}

ITEM.iconCam = {
	pos = Vector(0, 200, 20),
	ang = Angle(0, 270, 90),
	fov = 12,
}