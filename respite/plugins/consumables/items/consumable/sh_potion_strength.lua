ITEM.name = "Potion - Strength"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nThis potion enhances a user's muscle mass, making them far stronger for a short period of time."
ITEM.uniqueID = "potion_strength"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.price = 75
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 3000

ITEM.disease = "dis_poti"
ITEM.disChance = 5

ITEM.stomach = false

ITEM.attrib = {
	["str"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}