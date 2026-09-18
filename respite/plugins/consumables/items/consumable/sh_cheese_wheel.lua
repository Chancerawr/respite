ITEM.name = "Cheese Wheel"
ITEM.prefix = "Cheese"
ITEM.desc = "A very large hunk of cheese."
ITEM.uniqueID = "food_cheese_wheel"
ITEM.model = "models/foodnhouseholditems/cheesewheel1a.mdl"
--ITEM.material = "models/props_c17/furniturefabric001a"
ITEM.quantity2 = 16
ITEM.price = 15

ITEM.attrib = { 
	["medical"] = 10
}

ITEM.loot = {
	["Cheese"] = 1,
	["Consumable"] = 1,
	["Food"] = 1,
	["Special"] = 1,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["medical"] = 10
		},
		
		res = {
			["Weak"] = 15,
			["Time"] = 10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 9,
}