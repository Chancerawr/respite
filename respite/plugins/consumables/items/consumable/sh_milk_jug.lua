ITEM.name = "Milk Jug"
ITEM.prefix = "Milk"
ITEM.desc = "A jug filled with milk."
ITEM.uniqueID = "food_milk_jug"
ITEM.model = "models/props_junk/garbage_milkcarton001a.mdl"
ITEM.quantity2 = 6
ITEM.price = 10
ITEM.container = "j_empty_milk_jug"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["accuracy"] = 2,
	["str"] = 2,
	["end"] = 2 
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Milk"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["accuracy"] = 3,
			["str"] = 3,
			["end"] = 3 
		},
		
		res = {
			["Disease"] = 7,
			["Poison"] = 7,
			["Sleep"] = 7,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5.5,
}
