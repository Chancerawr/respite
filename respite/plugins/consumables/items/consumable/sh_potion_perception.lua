ITEM.name = "Potion - Perception"
ITEM.prefix = "Perceptive"
ITEM.desc = "A vial filled with some sort of bright green liquid.\nDrinking this potion makes the user more perceptive, both in analysis and simple observation."
ITEM.uniqueID = "potion_perception"
ITEM.model = "models/healthvial.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.price = 75
ITEM.container = "j_empty_vial"
ITEM.color = Color(50, 255, 50)
ITEM.duration = 1800
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.stomach = false

ITEM.buffTbl = {
	attrib = {
		["perception"] = 10,
	},
	
	duration = 3,
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
			["perception"] = 5,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 4.75),
	ang = Angle(0, -0, 0),
	fov = 3.6,
}