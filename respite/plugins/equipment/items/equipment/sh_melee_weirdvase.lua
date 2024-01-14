ITEM.name = "Vase"
ITEM.desc = "An oddly rigid and solid vase. Looks like it can take a few hits."
ITEM.model = "models/props_c17/pottery08a.mdl"
ITEM.class = "respite_vase"
ITEM.uniqueID = "hl2_m_weirdvase"
ITEM.slot = "melee"
ITEM.width = 1
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
	pos = Vector(-200, 0, 18),
	ang = Angle(0, -0, 0),
	fov = 5.5,
}