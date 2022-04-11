ITEM.name = "Ham"
ITEM.desc = "Delicious ham."
ITEM.uniqueID = "food_ham"
ITEM.model = "models/gibs/antlion_gib_small_2.mdl"
ITEM.material = "models/flesh"
ITEM.quantity2 = 2
ITEM.price = 0
--ITEM.color = Color(150,50,50)

ITEM.organicScrap = 3

ITEM.attrib = { 
	["str"] = 3,
	["fortitude"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Meat"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 3,
			["fortitude"] = 3 
		},
		
		res = {
			["Fire"] = 5,
			["Cold"] = 5,
			["Electric"] = 5,
			["Acid"] = 5,
			["Poison"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0.5, -0.25, 200),
	ang = Angle(90, 0, 0),
	fov = 2.75,
}