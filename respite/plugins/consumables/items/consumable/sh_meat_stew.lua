ITEM.name = "Meaty Stew"
ITEM.prefix = "Meaty"
ITEM.desc = "A delicious meaty stew made out of a whole lotta meat."
ITEM.model = "models/props/cs_militia/paintbucket01.mdl"
ITEM.uniqueID = "food_meat_stew"
ITEM.quantity2 = 10
ITEM.price = 20
ITEM.width = 2
ITEM.height = 2

ITEM.attrib = { 
	["str"] = 4,
	["end"] = 4,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Meat"] = 0.1,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 4,
			["end"] = 4,
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 11.5),
	ang = Angle(0, -0, 0),
	fov = 8,
}