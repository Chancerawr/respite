ITEM.name = "Tier 2A Vest"
ITEM.desc = "This bulletproof vest is a substantial upgrade over the first tier in terms of the different calibers it can stop. On top of the protection offered by Tier 1, this vest provides resistance to ubiquitous pistol cartridges like 9MM Parabellum and .45 ACP, along with the less common .40 Smith and Wesson."
ITEM.model = "models/tnb/items/shirt_rebel_molle.mdl"
ITEM.slot = "Chest"

ITEM.armor = 50

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
	["Magnum"] = 8,
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