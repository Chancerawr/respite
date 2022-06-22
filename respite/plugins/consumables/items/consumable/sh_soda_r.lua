ITEM.name = "Cherry Soda"
ITEM.desc = "An aluminium can filled with a carbonated soda."
ITEM.uniqueID = "food_soda_cherry"
ITEM.model = "models/props_junk/PopCan01a.mdl"
ITEM.quantity2 = 2
ITEM.price = 7
ITEM.skin = 1
ITEM.container = "j_empty_soda2"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["accuracy"] = 2, 
	["str"] = 2, 
	["luck"] = 1 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 4,
	["Soda"] = 10,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["accuracy"] = 2, 
			["str"] = 2, 
			["luck"] = 1 
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