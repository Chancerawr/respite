ITEM.name = "Plastic Pumpkin"
ITEM.prefix = "Plastic"
ITEM.desc = "A large plastic squash with a thick shell."
ITEM.uniqueID = "food_pumpkin_plastic"
ITEM.model = "models/props_outland/pumpkin01.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 4
ITEM.price = 8
ITEM.width = 2

ITEM.attrib = { 
	["fortitude"] = 1 
}

ITEM.loot = {
	["Consumable"] = true,
	["Vegetable"] = true,
	["Food"] = true,
	["Plastic"] = true,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["fortitude"] = 1 
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 1),
	ang = Angle(0, -0, 0),
	fov = 9,
}