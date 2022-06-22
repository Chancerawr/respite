ITEM.name = "Bottled Mountain Spring Water"
ITEM.prefix = "Water"
ITEM.desc = "A bottle of clear water."
ITEM.uniqueID = "food_water_mountain"
ITEM.model = "models/props/cs_office/water_bottle.mdl"
ITEM.quantity2 = 2
ITEM.price = 30
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_mountain_spring"

ITEM.attrib = { 
	["stm"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 10,
	["Water"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 2,
		},
		
		res = {
			["Fire"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4,
}