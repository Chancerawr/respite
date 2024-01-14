ITEM.name = "Voltaic Armor"
ITEM.desc = "A type of chest armor composed mostly of rubber with some sort of light metal component lining the outside. Upon making physical contact with another conductive surface, it will discharge its electricity, injuring and potentially stunning a creature if it has the misfortune of touching it.\nCannot discharge on the wearer.\nMust be recharged with a charged battery after each discharge."
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

ITEM.attrib = {
	["stm"] = -4,
}

ITEM.res = {
	["Electric"] = 25,
	["Fire"] = 10,
}

ITEM.upgradeSlots = { 
	["Dream"] = 5,
	["Liner"] = 1,
}

ITEM.salvage = {
	["j_scrap_rubber"] = 8,
	["j_scrap_metals"] = 10
}

ITEM.actions = {
	"charged_armor",
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}