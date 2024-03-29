ITEM.name = "Tier 3 Vest"
ITEM.desc = "Sir Thomas More was the man for all seasons, and this is the vest for all engagements. Few calibers cannot be stopped by this vest, as it will stop both 7.62X39 and 7.62X51 millimeter fire. Even cartridges specially designed to penetrate a greater amount of armor such as the FN 5.7X28MM will fail when confronted by this plate."
ITEM.model = "models/tnb/items/shirt_rebeloverwatch.mdl"
ITEM.slot = "Chest"

ITEM.armor = 55

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["chest"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["stm"] = -5,
}

ITEM.res = {
	["Shotgun"] = 5,
	["Rifle"] = 10,
	["Magnum"] = 15,
	["Pistol"] = 15,
	
	["Pierce"] = 7,
	["Blunt"] = 7,
	["Slash"] = 14,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Plate"] = 2,
	["Liner"] = 1,
}

ITEM.salvage = {
	["j_scrap_cloth"] = 10,
	["j_scrap_metals"] = 10
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}