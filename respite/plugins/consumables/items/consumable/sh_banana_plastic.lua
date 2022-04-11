ITEM.name = "Plastic Banana"
ITEM.prefix = "Plastic"
ITEM.desc = "A curved plastic fruit."
ITEM.uniqueID = "food_banana_plastic"
ITEM.model = "models/props/cs_italy/bananna.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 1
ITEM.price = 2
ITEM.container = "j_scrap_plastics"

ITEM.attrib = { 
	["perception"] = 1 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Fruit"] = true,
	["Plastic"] = true,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["perception"] = 1 
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 3),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}
