ITEM.name = "Potato Soda"
ITEM.desc = "Potato soda? Really?"
ITEM.uniqueID = "food_potato_soda"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "phoenix_storms/potato"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["str"] = 2,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 2,
	["Soda"] = 5,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["str"] = 2,
			["stm"] = 1,
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 10,
			["Disease"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}