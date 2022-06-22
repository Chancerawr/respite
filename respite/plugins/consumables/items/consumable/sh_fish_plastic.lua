ITEM.name = "Plastic Fish"
ITEM.prefix = "Plastic"
ITEM.desc = "A plastic fish."
ITEM.uniqueID = "food_fish_plastic"
ITEM.model = "models/props/cs_militia/fishriver01.mdl"
ITEM.material = "phoenix_storms/mrref2"
ITEM.hungerAmount = 15
ITEM.quantity = 2
ITEM.price = 6
ITEM.width = 2
ITEM.height = 1
ITEM.plastic = true
ITEM.cookable = false
ITEM.color = Color(80, 80, 180)

ITEM.attrib = {
	["stm"] = 1
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 1,
	["Fish"] = 10,
	["Plastic"] = 10,
}

ITEM.craft = {
	hp = 1,

	buffTbl = {
		attrib = {
			["stm"] = 1,
		},
		
		res = {
			["Poison"] = 5,
			["Electric"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-1.5, 200, 0.5),
	ang = Angle(0, 270, 0),
	fov = 5,
}