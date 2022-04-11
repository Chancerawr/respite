ITEM.name = "Eyeball"
ITEM.desc = "A human eyeball, that can't be normal."
ITEM.uniqueID = "food_eye"
ITEM.model = "models/gibs/humans/eye_gib.mdl"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(150,50,50)

ITEM.disease = "trait_hunger"
ITEM.disChance = 4

ITEM.organicScrap = 1

ITEM.attrib = {
	["fortitude"] = 5 
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
			["fortitude"] = 5 
		},
		
		res = {
			["Disease"] = -10,
			["Poison"] = -10,
			["Bleed"] = -10,
			["Fear"] = 10,
			["Pain"] = 10,
			["Knockdown"] = 10,
			["Slow"] = 10,
			["Root"] = 10,
			["Blind"] = 40,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 1.25,
}