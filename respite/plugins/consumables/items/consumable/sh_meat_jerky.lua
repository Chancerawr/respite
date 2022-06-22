ITEM.name = "Jerky"
ITEM.desc = "Dried jerky, it's tasty."
ITEM.model = "models/gibs/wood_gib01e.mdl"
ITEM.material = "models/flesh"
ITEM.uniqueID = "food_jerky"
ITEM.quantity2 = 2
ITEM.price = 10

ITEM.attrib = { 
	["end"] = 4, 
	["str"] = 2
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 4,
	["Meat"] = 1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["end"] = 4, 
			["str"] = 2
		},
		
		res = {
			["Disease"] = 7,
			["Poison"] = 7,
			["Bleed"] = 7,
			["Cold"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.5,
}