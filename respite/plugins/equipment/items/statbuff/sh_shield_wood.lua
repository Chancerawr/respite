ITEM.name = "Wooden Shield"
ITEM.uniqueID = "shield_wood"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.material = "models/props/cs_militia/roofbeams01"
ITEM.desc = "A makeshift wooden shield."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 3
ITEM.buffCategory = "Shield"

ITEM.salvItem = {
	["j_scrap_wood"] = 10
}

ITEM.attribBoosts = {
	["end"] = 5,
	["stm"] = -5,
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}
