ITEM.name = "Chicken Nuggets"
ITEM.prefix = "Chicken"
ITEM.desc = "Delicious chicken nuggets."
ITEM.model = "models/props_lab/box01a.mdl"
ITEM.material = "models/antlion/antlion_innards"
ITEM.uniqueID = "food_nuggets"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.attrib = { 
	["fortitude"] = 4,
	["end"] = 2,
	["str"] = 1
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 2,
	["Meat"] = 0.1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 4,
			["end"] = 2,
			["str"] = 1
		},
		
		res = {
			["Root"] = 5,
			["Stun"] = 5,
			["Slow"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3
}