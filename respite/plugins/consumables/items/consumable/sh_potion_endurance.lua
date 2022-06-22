ITEM.name = "Potion - Endurance"
ITEM.prefix = "Endurant"
ITEM.desc = "A strange vial that is filled with some bright green liquid.\nDrinking this potion leaves the user feeling sturdier, and more resilient against pain."
ITEM.uniqueID = "potion_endurance"
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
	["end"] = 10,
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
			["end"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}