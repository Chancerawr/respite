ITEM.name = "Abomination Meat"
ITEM.prefix = "Meaty"
ITEM.desc = "Meat from some kind of abomination, it smells terrible. It has a rough texture and its quite hard to chew, especially uncooked. It doesn't taste as bad as it smells, but it's definitely worse than most other kinds of meat."
ITEM.uniqueID = "food_monster_meat"
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.quantity2 = 2
ITEM.price = 5
ITEM.color = Color(150,50,50)

ITEM.organicScrap = 3

ITEM.attrib = { 
	["end"] = 1,
	["fortitude"] = 2
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
			["end"] = 1,
			["fortitude"] = 2
		},
		
		res = {
			["Disease"] = -3,
			["Poison"] = -3,
			["Bleed"] = -3,
			["Fear"] = 3,
			["Pain"] = 3,
			["Knockdown"] = 3,
			["Slow"] = 3,
			["Root"] = 3,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0.5, -0.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
}