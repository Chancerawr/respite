ITEM.name = "Tea"
ITEM.desc = "A specialized pot, it is full of tea."
ITEM.uniqueID = "food_tea"
ITEM.model = "models/props_interiors/pot01a.mdl"
ITEM.quantity2 = 6
ITEM.price = 12
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_teapot"

ITEM.attrib = { 
	["end"] = 1, 
	["stm"] = 1, 
	["str"] = 1, 
	["perception"] = 2, 
	["fortitude"] = 2, 
	["luck"] = 1, 
	["accuracy"] = 1, 
	["medical"] = 1
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["end"] = 1, 
			["stm"] = 1, 
			["str"] = 1, 
			["perception"] = 2, 
			["fortitude"] = 2, 
			["luck"] = 1, 
			["accuracy"] = 1, 
			["medical"] = 1
		},
		
		res = {
			["Blight"] = 5,
			["Ichor"] = 5,
			["Shard"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4.5,
}