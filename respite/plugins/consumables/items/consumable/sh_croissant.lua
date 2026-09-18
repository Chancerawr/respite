ITEM.name = "Croissant"
ITEM.prefix = "Croissant"
ITEM.desc = "A crescent shaped pastry."
ITEM.uniqueID = "food_croissant"
ITEM.model = "models/foodnhouseholditems/croissant.mdl"
ITEM.quantity2 = 3
ITEM.price = 4
ITEM.width = 1

ITEM.attrib = { 
	["accuracy"] = 2,
	["end"] = 3
}

ITEM.loot = {
	["Consumable"] = 10,
	["Bread"] = 10,
	["Food"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["accuracy"] = 2,
			["end"] = 3
		},
		
		res = {
			["Bleed"] = 6,
		}
	},
}