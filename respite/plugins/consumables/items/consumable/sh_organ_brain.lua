ITEM.name = "Brain"
ITEM.desc = "An entire human brain, that can't be normal."
ITEM.uniqueID = "food_brain"
ITEM.model = "models/gibs/humans/brain_gib.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 20

ITEM.organicScrap = 6

ITEM.attrib = { 
	["fortitude"] = 10, 
	["perception"] = 4 
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
			["fortitude"] = 10, 
			["perception"] = 4 
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
			["Mind"] = 50,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, -0.85, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
}