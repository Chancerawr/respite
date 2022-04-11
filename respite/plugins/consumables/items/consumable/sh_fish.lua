ITEM.name = "Fish"
ITEM.desc = "A common fish."
ITEM.uniqueID = "food_fish"
ITEM.model = "models/props/cs_militia/fishriver01.mdl"
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
	["Consumable"] = true,
	["Food"] = true,
	["Fish"] = true,
	["Meat"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		evasion = 5,
		
		attrib = {
			["stm"] = 3,
		},
		
		res = {
			["Cold"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-1.5, 200, 0.5),
	ang = Angle(0, 270, 0),
	fov = 5,
}