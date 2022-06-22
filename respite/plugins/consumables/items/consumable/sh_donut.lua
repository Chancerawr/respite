ITEM.name = "Donut"
ITEM.desc = "A tasty pastry."
ITEM.uniqueID = "food_donut"
ITEM.model = "models/noesis/donut.mdl"
ITEM.material = "models/props_c17/furniturefabric001a"
ITEM.quantity2 = 2
ITEM.price = 8

ITEM.modelScale = 0.5

ITEM.attrib = { 
	["luck"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["luck"] = 3
		},
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}