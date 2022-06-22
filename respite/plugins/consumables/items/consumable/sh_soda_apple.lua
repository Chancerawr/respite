ITEM.name = "Apple Soda"
ITEM.desc = "An aluminium can filled with a carbonated soda."
ITEM.uniqueID = "food_apple_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["stm"] = 3 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 3,
	["Soda"] = 2,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["stm"] = 3 
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}
