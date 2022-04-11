ITEM.name = "Cactus Soda"
ITEM.desc = "Tastes surprisingly delicious."
ITEM.uniqueID = "food_cactus_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/xqm/woodplanktexture"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["end"] = 2, 
	["fortitude"] = 2,
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
			["end"] = 2, 
			["fortitude"] = 2,
			["stm"] = 1,
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
			["Break"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}