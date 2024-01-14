ITEM.name = "Fence Post"
ITEM.desc = "A wooden post formerly used to string up a fence of some sort."
ITEM.model = "models/props/de_inferno/wood_fence_end.mdl"
ITEM.class = "respite_fencepost"
ITEM.uniqueID = "hl2_m_fencepost"
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
	["blunt"] = true,
}

ITEM.dmg = {
	["Blunt"] = 14,
}

ITEM.scaling = {
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
	pos = Vector(-200, 0, 21.5),
	ang = Angle(0, -0, 90),
	fov = 13.5,
}