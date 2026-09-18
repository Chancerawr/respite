ITEM.name = "Apple Juice Box"
ITEM.desc = "A box filled with apple juice."
ITEM.uniqueID = "food_juice_box"
ITEM.model = "models/foodnhouseholditems/juicesmall.mdl"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.container = "j_empty_juice_box"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["stm"] = 3,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 5,
	["Juice"] = 10,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 3
		},
		
		res = {
			["Bleed"] = 4,
			["Poison"] = 4,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}