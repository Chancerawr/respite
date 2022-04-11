ITEM.name = "Potato"
ITEM.desc = "A brown vegetable, it has a rough exterior."
ITEM.uniqueID = "food_potato"
ITEM.model = "models/props_phx/misc/potato.mdl"
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = {
	["str"] = 2,
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Vegetable"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 2,
		},
		
		res = {
			["Disease"] = 5,
			["Bleed"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(63.86, 54.79, 38.88),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}