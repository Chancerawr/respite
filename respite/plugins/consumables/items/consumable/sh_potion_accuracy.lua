ITEM.name = "Potion - Accuracy"
ITEM.prefix = "Accurate"
ITEM.desc = "A strange vial that is filled with some bright liquid.\nThis potion enhances a person's senses, and helps steady their hands."
ITEM.uniqueID = "potion_accuracy"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.price = 75
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 3000
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.disease = "dis_poti"
ITEM.disChance = 5

ITEM.stomach = false

ITEM.attrib = {
	["accuracy"] = 10,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Poition"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["accuracy"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}