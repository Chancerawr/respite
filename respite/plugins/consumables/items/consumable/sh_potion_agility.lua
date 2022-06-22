ITEM.name = "Potion - Agility"
ITEM.prefix = "Agile"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nThis potion enhances a person's agility, making them move more quickly temporarily."
ITEM.uniqueID = "potion_agility"
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
	["stm"] = 10,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 0.5,
	["Potion"] = 10,
	["Special"] = 1,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}