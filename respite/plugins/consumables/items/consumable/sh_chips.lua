ITEM.name = "Chips"
ITEM.desc = "A sealed plastic bag filled with semi-crushed potato chips."
ITEM.uniqueID = "food_chips"
ITEM.model = "models/props_junk/garbage_bag001a.mdl"
ITEM.material = "phoenix_storms/Blue_steel"
ITEM.quantity2 = 1
ITEM.price = 3
ITEM.container = "j_plastic_bag"

ITEM.attrib = { 
	["str"] = 3,
	["stm"] = -1
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
			["str"] = 3,
			["stm"] = -1,
		},
		
		res = {
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 170),
	fov = 5.5,
}