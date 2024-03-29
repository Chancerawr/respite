ITEM.name = "Makeshift Chain Armor"
ITEM.desc = "A crude vest crafted in a style similar to that of medieval chain mail. Instead of using individual chain links, circular pieces of scrap metal with hole drilled through them have been woven into the fabric, providing a fair amount of chest protection against slashing and low-velocity munitions."
ITEM.model = "models/tnb/items/shirt_rebel_molle.mdl"
ITEM.slot = "Chest"

ITEM.armor = 30

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
	["Slash"] = 20,
	["Pierce"] = 10,
	["Pistol"] = 10,
	["Electric"] = -10,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Liner"] = 1,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 7,
	["j_scrap_metals"] = 10
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}