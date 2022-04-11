ITEM.name = "Ice Cream"
ITEM.desc = "A medium sized bucket of ice cream, it is cold to the touch."
ITEM.uniqueID = "food_ice_cream"
ITEM.model = "models/props_junk/metal_paintcan001a.mdl"
ITEM.material = "phoenix_storms/black_brushes"
ITEM.quantity2 = 10
ITEM.price = 12
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.attrib = { 
	["fortitude"] = 5, 
	["luck"] = 3 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Drink"] = true,
	["Cold"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["fortitude"] = 5, 
			["luck"] = 3 
		},
		
		res = {
			["Cold"] = -5,
			["Fire"] = 8,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}