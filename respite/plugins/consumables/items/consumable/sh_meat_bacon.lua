ITEM.name = "Bacon"
ITEM.desc = "Some sort of bacon, it looks pretty tasty."
ITEM.model = "models/gibs/wood_gib01e.mdl"
ITEM.material = "models/flesh"
ITEM.uniqueID = "food_bacon"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.attrib = { 
	["fortitude"] = 4, 
	["str"] = 3
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
			["fortitude"] = 4, 
			["str"] = 3 
		},
		
		res = {
			["Fear"] = 5,
			["Pain"] = 5,
			["Fire"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.5,
}