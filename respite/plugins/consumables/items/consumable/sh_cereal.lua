ITEM.name = "Cereal"
ITEM.desc = "Dried breakfast cereal in a convenient box."
ITEM.uniqueID = "food_cereal"
ITEM.model = "models/props_lab/harddrive02.mdl"
ITEM.material = "models/props_c17/furnituremetal001a"
ITEM.quantity2 = 5
ITEM.price = 6
ITEM.width = 1
ITEM.height = 1
ITEM.container = "j_cereal_box"
 
ITEM.attrib = { 
	["accuracy"] = 2, 
	["perception"] = 2 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Packaged"] = true,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["accuracy"] = 2, 
			["perception"] = 2 
		},
		
		res = {
			["Stun"] = 5,
			["Time"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 7,
}