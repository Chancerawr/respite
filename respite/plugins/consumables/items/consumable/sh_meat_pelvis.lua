ITEM.name = "Human Pelvis"
ITEM.prefix = "Pelvis"
ITEM.desc = "The pelvis of a human being."
ITEM.uniqueID = "food_human_pelvis"
ITEM.model = "models/dismemberment/gibs/torso/torso_pelvis.mdl"
ITEM.quantity2 = 3
ITEM.price = 0
ITEM.width = 2
ITEM.height = 2
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 10

ITEM.organicScrap = 8

ITEM.attrib = { 
	["fortitude"] = 8
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
			["fortitude"] = 8
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
	pos = Vector(1, 2, 200),
	ang = Angle(90, 0, 0),
	fov = 4.5,
}