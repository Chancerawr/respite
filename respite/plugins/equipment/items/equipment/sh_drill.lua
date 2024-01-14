ITEM.name = "Power Drill"
ITEM.desc = "An electric drill."
ITEM.uniqueID = "j_drill"
ITEM.model = "models/warz/melee/powerdrill.mdl"

ITEM.width = 2
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.attrib = {
	["medical"] = 3,
}

ITEM.salvage = {
	["j_scrap_elecs"] = 2,
	["j_scrap_metals"] = 3,
	["j_scrap_screws"] = 3,
	["j_scrap_battery"] = 1
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.iconCam = {
	pos = Vector(3, 200, -2.5),
	ang = Angle(0, 270, 0),
	fov = 8,
}