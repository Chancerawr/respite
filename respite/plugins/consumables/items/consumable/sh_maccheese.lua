ITEM.name = "Mac & Cheese"
ITEM.desc = "A box of mac and cheese."
ITEM.uniqueID = "food_maccheese"
ITEM.model = "models/hunter/blocks/cube05x075x025.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.quantity2 = 2
ITEM.price = 12

ITEM.modelScale = 0.35

ITEM.attrib = { 
	["luck"] = 10
}

ITEM.loot = {
	["Cheese"] = 1,
	["Consumable"] = 10,
	["Food"] = 1,
}

ITEM.craft = {
	hp = 2,

	buffTbl = {
		attrib = {
			["medical"] = 10
		},
	},
}