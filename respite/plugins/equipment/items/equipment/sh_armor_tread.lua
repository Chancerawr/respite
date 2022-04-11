ITEM.name = "Tread Warrior's Guard"
ITEM.desc = "A rubber chestplate that covers the breast and shoulders of the wearer through the ingenious use of repurposed tires. The thick treads covering the chest stop most melee attacks, but are vulnerable to strong thrusts and ranged weapons."
ITEM.model = "models/tnb/items/shirt_rebel1.mdl"
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

ITEM.salvage = {
	["j_scrap_rubber"] = 10
}

ITEM.attrib = {
	["stm"] = -5,
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}