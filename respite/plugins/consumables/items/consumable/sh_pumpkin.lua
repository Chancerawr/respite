ITEM.name = "Pumpkin"
ITEM.desc = "A large orange squash with a thick shell."
ITEM.uniqueID = "food_pumpkin"
ITEM.model = "models/props_outland/pumpkin01.mdl"
ITEM.quantity2 = 4
ITEM.price = 12
ITEM.width = 2

ITEM.attrib = { 
	["fortitude"] = 2, 
	["end"] = 1
}

ITEM.loot = {
	["Consumable"] = 10,
	["Vegetable"] = 7,
	["Food"] = 4,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 2, 
			["end"] = 1
		},
		
		res = {
			["Bleed"] = 5,
			["Poison"] = 5,
			["Disease"] = 5,
			["Cold"] = 5,
			["Fire"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 1),
	ang = Angle(0, -0, 0),
	fov = 9,
}