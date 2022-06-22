ITEM.name = "Plastic Potato"
ITEM.prefix = "Plastic"
ITEM.desc = "A plastic vegetable, it has a rough exterior."
ITEM.uniqueID = "food_potato_plastic"
ITEM.model = "models/props_phx/misc/potato.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.quantity2 = 2
ITEM.price = 2

ITEM.attrib = { 
	["str"] = 1 
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 10,
	["Vegetable"] = 10,
	["Plastic"] = 10,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["str"] = 1,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(63.86, 54.79, 38.88),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}