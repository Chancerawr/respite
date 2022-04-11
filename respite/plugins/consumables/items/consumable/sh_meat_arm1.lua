ITEM.name = "Human Arm"
ITEM.prefix = "Arm"
ITEM.desc = "The lower arm of a human being."
ITEM.uniqueID = "food_human_arm1"
ITEM.model = "models/dismemberment/gibs/arms/lower_arm.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 9

ITEM.organicScrap = 5

ITEM.attrib = { 
	["fortitude"] = 7
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Meat"] = true,
	["Corpse"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 7
		},
		
		res = {
			["Disease"] = -5,
			["Poison"] = -5,
			["Bleed"] = -5,
			["Mind"] = -5,
			["Fear"] = 5,
			["Pain"] = 5,
			["Slow"] = 5,
			["Root"] = 5,
			["Disarm"] = 7,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 4,
}