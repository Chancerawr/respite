ITEM.name = "Gloves"
ITEM.uniqueID = "j_gloves"
ITEM.model = "models/tnb/items/gloves.mdl"
ITEM.desc = "A warm pair of gloves to protect against the cold."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.armor = 4

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["accessory"] = true,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 3
}

ITEM.attrib = {
	["end"] = 1,
	["luck"] = 1,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.iconCam = {
	pos = Vector(-0.5, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 2,
}