ITEM.name = "Apple Juice"
ITEM.desc = "A bottle filled with apple juice."
ITEM.uniqueID = "food_apple_juice"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 3
ITEM.price = 6
ITEM.container = "j_empty_juice_bottle"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["stm"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 5,
	["Juice"] = 10,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 4
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