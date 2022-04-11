ITEM.name = "Drifter-Wood"
ITEM.desc = "The simplest armor that man can come up with. Dried scraps of wood are cut and strapped together to provide some protection against slashes from light blades, light stabs, and lower velocity ammunition.  Blunt strikes, axe swings, thrusts into a grain, and larger calibers may cause the armor to splinter, rendering that panel useless until repaired."
ITEM.model = "models/tnb/items/shirt_rebel1.mdl"
ITEM.slot = "Chest"

ITEM.armor = 10

ITEM.rarity = 10
ITEM.lootTags = {
	["armor"] = true,
	["chest"] = true,
}

ITEM.scaling = {
	["end"] = 0.2,
}

ITEM.salvage = {
	["j_scrap_wood"] = 5,
	["j_scrap_rubber"] = 10
}

ITEM.attrib = {
	["stm"] = -3,
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}