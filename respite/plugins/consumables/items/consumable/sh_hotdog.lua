ITEM.name = "Hot Dog"
ITEM.desc = "A tasty looking hot dog."
ITEM.uniqueID = "food_hotdog"
ITEM.model = "models/food/hotdog.mdl"
ITEM.quantity2 = 2
ITEM.price = 7

ITEM.attrib = { 
	["str"] = 3 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Meat"] = true,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["str"] = 3 
		},
		
		res = {
			["Taunt"] = 5,
			["Mind"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 90),
	fov = 4.75,
}