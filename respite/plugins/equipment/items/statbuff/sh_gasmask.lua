ITEM.name = "Gas Mask"
ITEM.uniqueID = "gasmask"
ITEM.model = "models/tnb/items/gasmask.mdl"
ITEM.desc = "A mask placed on your head to filter gasses."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.buffCategory = "Accessory"

ITEM.salvItem = {
	["j_scrap_cloth"] = 4,
	["j_scrap_glass"] = 2,
	["j_scrap_plastics"] = 3
}

ITEM.attribBoosts = {
	["perception"] = -4,
	["end"] = 5,
}

ITEM.iconCam = {
	pos = Vector(-200, -1, 3),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}