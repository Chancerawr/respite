ITEM.name = "Cola"
ITEM.desc = "An aluminium can filled with a carbonated soda. It seems exceptionally good for some reason?"
ITEM.uniqueID = "food_soda_cola"
ITEM.model = "models/props_junk/PopCan01a.mdl"
ITEM.material = "models/props_lab/cornerunit_cloud"
ITEM.quantity2 = 2
ITEM.price = 8
ITEM.skin = 1
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["accuracy"] = 2, 
	["stm"] = 2, 
	["luck"] = 1
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Soda"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["accuracy"] = 2, 
			["stm"] = 2, 
			["luck"] = 1
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
			["Weak"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}