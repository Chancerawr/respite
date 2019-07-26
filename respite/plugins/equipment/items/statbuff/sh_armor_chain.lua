ITEM.name = "Makeshift Chain Armor"
ITEM.desc = "A crude vest crafted in a style similar to that of medieval chain mail. Instead of using individual chain links, circular pieces of scrap metal with hole drilled through them have been woven into the fabric, providing a fair amount of chest protection against slashing and low-velocity munitions."
ITEM.model = "models/tnb/items/shirt_rebel_molle.mdl"
ITEM.buffCategory = "Chest"
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_cloth"] = 7,
	["j_scrap_metals"] = 10
}

ITEM.attribBoosts = {
	["stm"] = -4,
}

ITEM.iconCam = {
	pos = Vector(0, 5.5, 200),
	ang = Angle(90, 0, 0),
	fov = 8.5,
}