ITEM.name = "Tier 1 Vest"
ITEM.desc = "This bulletproof vest offers a lower amount of protection than its counterparts, but it's better than nothing. It will stop up to .22LR cartridges, and maybe some lighter pistol calibers from more diminutive machine pistols like the Skorpion vz 83 or MAC11.  If the enemy is concealing their pistol, this vest may save your life."
ITEM.model = "models/tnb/items/shirt_rebel1.mdl"
ITEM.slot = "Chest"

ITEM.armor = 40

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["chest"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.attrib = {
	["stm"] = -3,
}

ITEM.res = {
	["Shotgun"] = 1,
	["Rifle"] = 2,
	["Magnum"] = 6,
	["Pistol"] = 10,
	
	["Pierce"] = 3,
	["Blunt"] = 3,
	["Slash"] = 8,
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