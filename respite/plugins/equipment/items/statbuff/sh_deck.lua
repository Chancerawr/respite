ITEM.name = "Deck of Cards"
ITEM.uniqueID = "j_cards"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_combine/metal_combinebridge001"
ITEM.desc = "A standard 52 card deck."
ITEM.flag = "j"
ITEM.width = 1
ITEM.height = 1
ITEM.buffCategory = "Accessory"

ITEM.salvItem = {
	["j_scrap_cloth"] = 2
}

ITEM.attribBoosts = {
	["luck"] = 3
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
}