ITEM.name = "Human Hand"
ITEM.prefix = "Hand"
ITEM.desc = "A hand that was once connected to a human being."
ITEM.uniqueID = "food_human_hand"
ITEM.model = "models/dismemberment/gibs/arms/hand.mdl"
ITEM.quantity2 = 1
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 5

ITEM.organicScrap = 2

ITEM.attrib = { 
	["fortitude"] = 3 
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
			["fortitude"] = 3 
		},
		
		res = {
			["Disease"] = -5,
			["Poison"] = -5,
			["Bleed"] = -5,
			["Mind"] = -5,
			["Fear"] = 5,
			["Pain"] = 5,
			["Knockdown"] = 5,
			["Slow"] = 5,
			["Root"] = 5,
			["Disarm"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 1.25, 200),
	ang = Angle(90, 0, 0),
	fov = 1.8,
}