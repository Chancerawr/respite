ITEM.name = "Milk Carton"
ITEM.prefix = "Milk"
ITEM.desc = "A carton filled with milk."
ITEM.uniqueID = "food_milk_carton"
ITEM.model = "models/props_junk/garbage_milkcarton002a.mdl"
ITEM.quantity2 = 3
ITEM.price = 7
ITEM.container = "j_empty_milk_carton"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["accuracy"] = 2,
	["str"] = 2,
	["end"] = 2,
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
			["accuracy"] = 2,
			["str"] = 2,
			["end"] = 2,
		},
		
		res = {
			["Disease"] = 5,
			["Poison"] = 5,
			["Sleep"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}