ITEM.name = "Heart"
ITEM.desc = "An entire human heart, that can't be normal."
ITEM.uniqueID = "food_heart"
ITEM.model = "models/gibs/humans/heart_gib.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 10

ITEM.organicScrap = 5

ITEM.attrib = { 
	["str"] = 5,
	["fortitude"] = 10 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Meat"] = true,
	["Organ"] = true,
	["Corpse"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 5,
			["fortitude"] = 10,
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
			["Weak"] = 40,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(200, 0, 0),
	ang = Angle(180, -0, 180),
	fov = 3.5,
}