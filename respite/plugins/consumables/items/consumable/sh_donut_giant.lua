ITEM.name = "Giant Donut"
ITEM.desc = "A very large tasty pastry."
ITEM.uniqueID = "food_donut_giant"
ITEM.model = "models/noesis/donut.mdl"
ITEM.material = "models/props_c17/furniturefabric001a"
ITEM.quantity2 = 10
ITEM.price = 20
ITEM.width = 2
ITEM.height = 2

ITEM.attrib = { 
	["luck"] = 5
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["luck"] = 5
		},
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 7,
}