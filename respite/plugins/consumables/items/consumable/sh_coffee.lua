ITEM.name = "Coffee"
ITEM.desc = "A cup of coffee, it's a little bitter."
ITEM.uniqueID = "food_coffee"
ITEM.model = "models/props_junk/garbage_coffeemug001a.mdl"
ITEM.quantity2 = 1
ITEM.price = 8
ITEM.container = "j_empty_mug"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["stm"] = 4,
	["fortitude"] = -5
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["end"] = 1,
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
			["Stun"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 2,
}