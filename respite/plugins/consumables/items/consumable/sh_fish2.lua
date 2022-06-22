ITEM.name = "Fish"
ITEM.desc = "A common fish."
ITEM.uniqueID = "food_fish2"
ITEM.model = "models/props/de_inferno/goldfish.mdl"
ITEM.hungerAmount = 15
ITEM.quantity = 2
ITEM.price = 6
ITEM.width = 2
ITEM.height = 1
ITEM.color = Color(80, 80, 180)

ITEM.attrib = { 
	["stm"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Fish"] = 5,
	["Meat"] = 1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3,
		},
		
		res = {
			["Cold"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-3.5, 200, 0),
	ang = Angle(0, 270, 0),
	fov = 5,
}