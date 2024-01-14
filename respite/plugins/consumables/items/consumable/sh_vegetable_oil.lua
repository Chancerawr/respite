ITEM.name = "Vegetable Oil"
ITEM.desc = "Oils extracted from seeds or from other parts of fruits."
ITEM.uniqueID = "food_vegetable_oil"
ITEM.model = "models/props_junk/garbage_plasticbottle002a.mdl"
ITEM.quantity2 = 2
ITEM.price = 10
ITEM.container = "j_empty_vegetable_oil"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["end"] = 2, 
	["stm"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 5,
}

ITEM.craft = {
	hp = 10,

	buffTbl = {
		attrib = {
			["end"] = 3, 
			["stm"] = 3, 
			["luck"] = 1 
		},
		
		res = {
			["Disease"] = 10,
			["Rot"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}