ITEM.name = "Banana Soda"
ITEM.desc = "An aluminium can filled with a carbonated soda."
ITEM.uniqueID = "food_banana_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/props_c17/furniturefabric001a"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["perception"] = 2,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 4,
	["Soda"] = 4,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["perception"] = 2,
			["stm"] = 1,
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