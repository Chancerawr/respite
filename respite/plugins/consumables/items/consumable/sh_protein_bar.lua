ITEM.name = "Protein Bar"
ITEM.prefix = "Protein"
ITEM.desc = "A plastic wrapped bar made specifically to supply protein."
ITEM.uniqueID = "food_protein"
ITEM.model = "models/squad/sf_bars/sf_bar1.mdl"
ITEM.material = "models/props_c17/furniturefabric003a"
ITEM.quantity2 = 2
ITEM.price = 5

ITEM.attrib = { 
	["str"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Packaged"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 3
		},
		
		res = {
			["Slow"] = 5,
			["Stun"] = 5,
			["Root"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}