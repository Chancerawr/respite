ITEM.name = "Banana"
ITEM.desc = "A curved yellow fruit."
ITEM.uniqueID = "food_banana"
ITEM.model = "models/props/cs_italy/bananna.mdl"
ITEM.quantity2 = 1
ITEM.price = 3
ITEM.container = "j_bananaskin"

ITEM.attrib = { 
	["perception"] = 2
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["perception"] = 2
		},
		
		res = {
			["Blind"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 3),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}