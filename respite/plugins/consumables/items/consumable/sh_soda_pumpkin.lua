ITEM.name = "Pumpkin Soda"
ITEM.desc = "An aluminium can filled with a pumpkin soda?"
ITEM.uniqueID = "food_pumpkin_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "phoenix_storms/fender_wood"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.skin = 2
ITEM.container = "j_empty_soda1"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["fortitude"] = 2,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 4,
	["Soda"] = 5,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["fortitude"] = 2,
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
