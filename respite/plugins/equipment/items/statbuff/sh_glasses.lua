ITEM.name = "Glasses"
ITEM.uniqueID = "j_glasses"
ITEM.model = "models/glasses.mdl"
ITEM.desc = "A pair of old glasses."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.data = { scrapamount = 2 }
ITEM.salvItem = "j_scrap_glass"
ITEM.buffCategory = "accessory"

ITEM.attribBoosts = {
	["perception"] = 4,
	["medical"] = 4,
	["end"] = -2
}

ITEM.iconCam = {
	pos = Vector(0, 200, 1),
	ang = Angle(0, 270, 0),
	fov = 2.25,
}
