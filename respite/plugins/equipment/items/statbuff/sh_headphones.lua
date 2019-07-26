ITEM.name = "Headphones"
ITEM.uniqueID = "j_headphones"
ITEM.model = "models/headphones.mdl"
ITEM.desc = "A pair of headphones."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.buffCategory = "Accessory"

ITEM.salvItem = {
	["j_scrap_elecs"] = 1,
	["j_scrap_plastics"] = 2,
}

ITEM.attribBoosts = {
	["perception"] = -2,
	["fortitude"] = 4,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 4.5),
	ang = Angle(0, 270, 0),
	fov = 3.25,
}