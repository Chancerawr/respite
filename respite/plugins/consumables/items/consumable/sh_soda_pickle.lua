ITEM.name = "Pickle Soda"
ITEM.desc = "Please don't drink this."
ITEM.uniqueID = "food_pickle_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/XQM/WoodPlankTexture"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.skin = 2
ITEM.container = "j_empty_soda1"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["craftiness"] = 2,
	["medical"] = 2,
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
			["craftiness"] = 2,
			["medical"] = 2,
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
