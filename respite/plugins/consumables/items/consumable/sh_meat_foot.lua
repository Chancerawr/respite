ITEM.name = "Human Foot"
ITEM.prefix = "Foot"
ITEM.desc = "A foot that was once connected to a human being. \n You thought they smelled badly before."
ITEM.uniqueID = "food_human_foot"
ITEM.model = "models/dismemberment/gibs/legs/foot.mdl"
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
	["Consumable"] = 10,
	["Food"] = 0.1,
	["Meat"] = 1,
	["Corpse"] = 1,
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
			["Knockdown"] = 10,
			["Slow"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-2.5, 200, 1.5),
	ang = Angle(0, 270, -90),
	fov = 3,
}