ITEM.name = "Tier 2 Vest"
ITEM.desc = "An upgrade to the Tier 2A Vest that isn't so much innovative as it is adaptive. On top of the 2A's offerings, the second tier now boasts protection against .357 Magnum and overpressure cartridges of 9MM."
ITEM.model = "models/tnb/items/shirt_rebel_molle.mdl"
ITEM.slot = "Chest"

ITEM.armor = 45

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["chest"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["stm"] = -4,
}

ITEM.res = {
	["Shotgun"] = 2,
	["Rifle"] = 5,
	["Magnum"] = 12,
	["Pistol"] = 12,
	
	["Pierce"] = 5,
	["Blunt"] = 5,
	["Slash"] = 10,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Plate"] = 2,
	["Liner"] = 1,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 10
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}