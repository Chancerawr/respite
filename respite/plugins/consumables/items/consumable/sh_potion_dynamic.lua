ITEM.name = "Concoction"
ITEM.desc = "A potion made out of various ingredients."
ITEM.uniqueID = "potion_dynamic"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.quantity2 = 2

ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 1800
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.buffTbl = {
	duration = 3,
}

ITEM.loot = {
	["Cooked"] = 10,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}