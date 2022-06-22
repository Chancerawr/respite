ITEM.name = "Pickle Juice"
ITEM.desc = "Please don't drink this."
ITEM.uniqueID = "food_pickle_juice"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.material = "models/XQM/WoodPlankTexture"
ITEM.quantity2 = 3
ITEM.price = 6
ITEM.container = "j_empty_juice_bottle"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["perception"] = 4,
	["medical"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 2,
	["Juice"] = 7,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["perception"] = 4,
			["medical"] = 4
		},
		
		res = {
			["Bleed"] = 5,
			["Poison"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}