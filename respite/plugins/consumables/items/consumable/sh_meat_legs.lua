ITEM.name = "Human Leg"
ITEM.prefix = "Leg"
ITEM.desc = "A separated humanoid leg."
ITEM.uniqueID = "food_human_legs"
ITEM.model = "models/dismemberment/gibs/legs.mdl"
ITEM.quantity2 = 4
ITEM.price = 0
ITEM.width = 4
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 10

ITEM.organicScrap = 8

ITEM.attrib = { 
	["fortitude"] = 8
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 4,
	["Meat"] = 3,
	["Corpse"] = 7,
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
			["Knockdown"] = 10,
			["Slow"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-15, 200, 2.5),
	ang = Angle(0, 270, 0),
	fov = 14.5,
}