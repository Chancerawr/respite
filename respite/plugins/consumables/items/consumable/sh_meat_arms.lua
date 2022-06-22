ITEM.name = "Human Arm"
ITEM.prefix = "Arm"
ITEM.desc = "The upper arm of a human being."
ITEM.uniqueID = "food_human_arms"
ITEM.model = "models/dismemberment/gibs/arms.mdl"
ITEM.quantity2 = 4
ITEM.price = 0
ITEM.width = 3
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 9

ITEM.organicScrap = 7

ITEM.attrib = { 
	["fortitude"] = 7
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Meat"] = 4,
	["Corpse"] = 4,
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
			["Disarm"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(1, 22, 200),
	ang = Angle(90, 0, 0),
	fov = 9,
}