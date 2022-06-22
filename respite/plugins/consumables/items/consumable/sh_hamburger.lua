ITEM.name = "Hamburger"
ITEM.desc = "A tasty looking hamburger."
ITEM.uniqueID = "food_hamburger"
ITEM.model = "models/food/burger.mdl"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.attrib = { 
	["str"] = 4, 
	["end"] = 5
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 3,
	["Meat"] = 10,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["str"] = 4, 
			["end"] = 5
		},
		
		res = {
			["Move"] = 5,
			["Slow"] = 5,
			["Stun"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 200, 14.5),
	ang = Angle(0, 270, 0),
	fov = 2
}
