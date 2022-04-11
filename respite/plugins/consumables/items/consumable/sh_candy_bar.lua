ITEM.name = "Candy Bar"
ITEM.prefix = "Candy"
ITEM.desc = "A plastic wrapped bar of delicious chocolate."
ITEM.uniqueID = "food_candybar"
ITEM.model = "models/squad/sf_bars/sf_bar1.mdl"
ITEM.material = "models/props_pipes/guttermetal01a"
ITEM.quantity2 = 2
ITEM.price = 5

ITEM.attrib = { 
	["stm"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Packaged"] = true,
	["Candy"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3
		},
		
		res = {
			["Sleep"] = 5,
			["Slow"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}