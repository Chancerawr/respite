ITEM.name = "Granola Bar"
ITEM.prefix = "Granola"
ITEM.desc = "A plastic wrapped bar made out of granola"
ITEM.uniqueID = "food_granola"
ITEM.model = "models/squad/sf_bars/sf_bar1.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.quantity2 = 2
ITEM.price = 6

ITEM.attrib = { 
	["accuracy"] = 4 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Packaged"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["accuracy"] = 4 
		},
		
		res = {
			["Disease"] = 5,
			["Poison"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}