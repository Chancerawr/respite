ITEM.name = "Makeshift Helmet"
ITEM.desc = "A crude helmet fashioned out of scrap cloth and scrap metal. May protect the head from weaker melee blows to some extent, but likely not very bullet resistant."
ITEM.model = "models/helm_04.mdl"
ITEM.material = "models/props_wasteland/tugboat02"
ITEM.buffCategory = "Helmet"
ITEM.flag = "j"

ITEM.salvItem = {
	["j_scrap_cloth"] = 2,
	["j_scrap_metals"] = 2
}

ITEM.attribBoosts = {
	["perception"] = -1,
}

ITEM.iconCam = {
	pos = Vector(-200, -1, 5.5),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}