ITEM.name = "Metal Shield"
ITEM.uniqueID = "shield_metal"
ITEM.model = "models/cloud/glassholdshield.mdl"
ITEM.material = "models/props_canal/canal_bridge_railing_01b"
ITEM.desc = "A makeshift metal shield."
ITEM.flag = "j"
ITEM.width = 2
ITEM.height = 3
ITEM.buffCategory = "Shield"

ITEM.salvItem = {
	["j_scrap_metals"] = 10
}

ITEM.attribBoosts = {
	["end"] = 8,
	["stm"] = -8,
}

ITEM.iconCam = {
	pos = Vector(-200, 3.5, 22),
	ang = Angle(0, -0, 0),
	fov = 10,
}