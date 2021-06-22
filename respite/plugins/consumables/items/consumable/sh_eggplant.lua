ITEM.name = "Eggplant"
ITEM.desc = "( ͡° ͜ʖ ͡°)"
ITEM.uniqueID = "food_eggplant"
ITEM.model = "models/props/cs_italy/bananna.mdl"
ITEM.material = "models/debug/debugwhite"
ITEM.quantity2 = 1
ITEM.price = 3
ITEM.width = 2
ITEM.color = Color(69, 0, 127)

ITEM.hp = 69

ITEM.modelColor = Color(69, 0, 127)

ITEM.iconCam = {
	pos = Vector(-200, 0, 3),
	ang = Angle(0, -0, 0),
	fov = 6.5,
}

ITEM.tags = {
	["Vegetable"] = true,
	["Ingredient"] = true,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		res = {
			["Charm"] = 5,
		},
	},
}