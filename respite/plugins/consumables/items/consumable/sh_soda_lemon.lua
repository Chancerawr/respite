ITEM.name = "Lemon Soda"
ITEM.desc = "An aluminium can filled with a carbonated soda."
ITEM.uniqueID = "food_lemon_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.skin = 2
ITEM.container = "j_empty_soda1"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["luck"] = 2,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Soda"] = true,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["luck"] = 2,
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