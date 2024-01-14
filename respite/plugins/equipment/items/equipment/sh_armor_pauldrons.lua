ITEM.name = "PL-8 Pauldrons"
ITEM.desc = "Pauldrons that protect the shoulders crafted from old license plates. The plates are fastened together through the use of zipties in holes that once housed screws, and provide a small amount of protection against firearms on the shoulders. The plates are vulnerable to blunt strikes, but impervious to stabbing and slashing."
ITEM.model = "models/tnb/items/shirt_rebel1.mdl"
ITEM.slot = "Shoulder"

ITEM.armor = 20

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["shoulder"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["stm"] = -2,
}

ITEM.res = {
	["Pierce"] = 12,
	["Slash"] = 12,
	["Fire"] = -5,
	["Electric"] = -10,
}

ITEM.upgradeSlots = { 
	["Dream"] = 2,
}

ITEM.salvage = {
	["j_scrap_metals"] = 10
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}