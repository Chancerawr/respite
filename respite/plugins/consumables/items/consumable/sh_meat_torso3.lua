ITEM.name = "Human Torso Chunk"
ITEM.prefix = "Torso"
ITEM.uniqueID = "food_human_torso3"
ITEM.desc = "The torso of a human being."
ITEM.model = "models/dismemberment/gibs/torso/torso_right_upper.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 5

ITEM.organicScrap = 6

ITEM.attrib = { 
	["fortitude"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Meat"] = 5,
	["Corpse"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 4,
		},
		
		res = {
			["Disease"] = -5,
			["Poison"] = -5,
			["Bleed"] = -5,
			["Fear"] = 5,
			["Pain"] = 5,
			["Knockdown"] = 5,
			["Slow"] = 5,
			["Root"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, -1.5, 3),
	ang = Angle(0, -0, 0),
	fov = 4,
}