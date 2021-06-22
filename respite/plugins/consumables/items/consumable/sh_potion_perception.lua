ITEM.name = "Potion - Perception"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nDrinking this potion makes the user more perceptive, both in analysis and simple observation."
ITEM.uniqueID = "potion_perception"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.price = 75
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 3000

ITEM.disease = "dis_poti"
ITEM.disChance = 20

ITEM.stomach = false

ITEM.attrib = {
	["perception"] = 20,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}