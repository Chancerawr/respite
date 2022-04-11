ITEM.name = "Lemon"
ITEM.desc = "A spherical yellow fruit."
ITEM.uniqueID = "food_lemon"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = {
	["luck"] = 2
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Fruit"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["luck"] = 2
		},
		
		res = {
			["Acid"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}