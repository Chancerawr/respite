ITEM.name = "Melon Juice"
ITEM.desc = "A bottle filled with melon juice."
ITEM.uniqueID = "food_melon_juice"
ITEM.model = "models/props_junk/garbage_glassbottle001a.mdl"
ITEM.material = "phoenix_storms/pack2/interior_sides"
ITEM.quantity2 = 3
ITEM.price = 6
ITEM.container = "j_empty_juice_bottle"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["end"] = 4
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Juice"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["end"] = 4
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