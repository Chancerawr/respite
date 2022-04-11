ITEM.name = "Eggnog"
ITEM.desc = "A rich, chilled, sweetened, dairy-based beverage."
ITEM.uniqueID = "food_eggnog"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.material = "models/props_debris/plasterwall040c"
ITEM.quantity2 = 3
ITEM.price = 12
ITEM.container = "j_empty_juice_bottle"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["end"] = 3,
	["fortitude"] = 3,
	["medical"] = 2,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["end"] = 3,
			["fortitude"] = 3,
			["medical"] = 2,
		},
		
		res = {
			["Cold"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}