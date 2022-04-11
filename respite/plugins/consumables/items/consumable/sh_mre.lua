ITEM.name = "Meal Ready to Eat"
ITEM.prefix = "MRE"
ITEM.desc = "A small box, it has 'M.R.E.' written on it. It contains a freeze dried meal."
ITEM.uniqueID = "food_mre"
ITEM.model = "models/weapons/w_package.mdl"
ITEM.quantity2 = 2
ITEM.price = 11
ITEM.container = "j_empty_mre"
 
ITEM.attrib = { 
	["stm"] = 3, 
	["str"] = 3, 
	["accuracy"] = 3
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Packaged"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3, 
			["str"] = 3, 
			["accuracy"] = 3
		},
		
		res = {
			["Bleed"] = 5,
			["Pistol"] = 5,
			["Rifle"] = 5,
			["Shell"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(4, -6, 200),
	ang = Angle(90, 0, 0),
	fov = 5.6,
}
