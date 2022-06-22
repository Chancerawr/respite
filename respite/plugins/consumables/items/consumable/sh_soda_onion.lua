ITEM.name = "Onion Soda"
ITEM.desc = "Tastes awful, what did you expect?"
ITEM.uniqueID = "food_onion_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["str"] = 2,
	["accuracy"] = 2,
	["stm"] = 1
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
			["str"] = 2,
			["accuracy"] = 2,
			["stm"] = 1
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