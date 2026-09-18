ITEM.name = "Honey"
ITEM.desc = "A jar of sweet honey."
ITEM.uniqueID = "food_honey"
ITEM.model = "models/foodnhouseholditems/honey_jar.mdl"
ITEM.quantity2 = 4
ITEM.price = 6

ITEM.attrib = { 
	["stm"] = 2,
	["perception"] = 2,
	["luck"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 2,
	["Dessert"] = 4,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["stm"] = 2,
			["perception"] = 2,
			["luck"] = 2,
		},
		
		res = {
			["Slow"] = 4,
			["Fear"] = 4,
			["Sleep"] = 4,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65, 55, 40),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}
