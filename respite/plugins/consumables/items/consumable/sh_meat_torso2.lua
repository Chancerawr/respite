ITEM.name = "Human Torso Chunk"
ITEM.prefix = "Torso"
ITEM.desc = "The torso of a human being."
ITEM.uniqueID = "food_human_torso2"
ITEM.model = "models/dismemberment/gibs/torso/torso_left_upper.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 5

ITEM.organicScrap = 7

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
	pos = Vector(1.5, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 5,
}