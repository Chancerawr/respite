ITEM.name = "Human Meat"
ITEM.prefix = "Mystery Meat"
ITEM.desc = "Meat ripped from the body of a human, it smells disgusting."
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.uniqueID = "food_human_meat"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 1

ITEM.organicScrap = 3

ITEM.attrib = { 
	["fortitude"] = 5
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
			["fortitude"] = 5
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
			["Taunt"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0.5, -0.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
}