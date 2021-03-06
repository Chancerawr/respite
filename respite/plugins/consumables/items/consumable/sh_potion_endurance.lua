ITEM.name = "Potion - Endurance"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nDrinking this potion leaves the user feeling sturdier, and more resilient against pain."
ITEM.uniqueID = "potion_endurance"
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
	["end"] = 20,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}