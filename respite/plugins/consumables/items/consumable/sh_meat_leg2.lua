ITEM.name = "Human Leg"
ITEM.prefix = "Leg"
ITEM.desc = "The upper leg of a human being."
ITEM.uniqueID = "food_human_leg2"
ITEM.model = "models/dismemberment/gibs/legs/upper_leg.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 10

ITEM.organicScrap = 6

ITEM.attrib = { 
	["fortitude"] = 8
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Meat"] = 5,
	["Corpse"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 8
		},
		
		res = {
			["Disease"] = -5,
			["Poison"] = -5,
			["Bleed"] = -5,
			["Fear"] = 5,
			["Pain"] = 5,
			["Knockdown"] = 8,
			["Slow"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-1.5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 5.75,
}