ITEM.name = "Deck of Cards"
ITEM.uniqueID = "j_cards"
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/props_combine/metal_combinebridge001"
ITEM.desc = "A standard 52 card deck."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.salvage = {
	["j_scrap_cloth"] = 2
}

ITEM.attrib = {
	["luck"] = 2,
	["medical"] = 1,
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
}