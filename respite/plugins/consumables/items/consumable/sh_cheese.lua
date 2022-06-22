ITEM.name = "Cheese"
ITEM.desc = "A very large hunk of cheese."
ITEM.uniqueID = "food_cheese"
ITEM.model = "models/hunter/triangles/025x025.mdl"
ITEM.material = "models/props_c17/furniturefabric001a"
ITEM.quantity2 = 4
ITEM.price = 15

ITEM.attrib = { 
	["medical"] = 10 
}

ITEM.loot = {
	["Consumable"] = 2,
	["Food"] = 3,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["medical"] = 4
		},
		
		res = {
			["Weak"] = 5,
			["Time"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(6, -7, 200),
	ang = Angle(90, 0, 0),
	fov = 5
}