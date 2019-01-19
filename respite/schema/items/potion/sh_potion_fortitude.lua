ITEM.name = "Potion - Fortitude"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 75
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nDrinking this potion strengthens the mind of the user, temporarily making them more resolute, and stable."
ITEM.flag = "V"
ITEM.uniqueID = "potion_fortitude"
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 3000
ITEM.attribBoosts = {
	["fortitude"] = 20,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}