ITEM.name = "Liver"
ITEM.desc = "An entire liver."
ITEM.uniqueID = "food_liver"
ITEM.model = "models/gibs/humans/liver_gib.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 5

ITEM.organicScrap = 4

ITEM.attrib = { 
	["fortitude"] = 10 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 0.1,
	["Meat"] = 1,
	["Organ"] = 10,
	["Corpse"] = 4,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 10 
		},
		
		res = {
			["Disease"] = -15,
			["Poison"] = -15,
			["Bleed"] = -15,
			["Fear"] = 15,
			["Pain"] = 15,
			["Knockdown"] = 15,
			["Slow"] = 15,
			["Root"] = 15,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, -0.5, 0),
	ang = Angle(0, -0, 0),
	fov = 3,
}