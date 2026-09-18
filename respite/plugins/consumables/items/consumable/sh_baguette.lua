ITEM.name = "Baguette"
ITEM.prefix = "Baguette"
ITEM.desc = "A long, thin type of bread."
ITEM.uniqueID = "food_baguette"
ITEM.model = "models/foodnhouseholditems/bagette.mdl"
ITEM.quantity2 = 6
ITEM.price = 7
ITEM.width = 3

ITEM.attrib = { 
	["fortitude"] = 3,
	["end"] = 4
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
			["fortitude"] = 3,
			["end"] = 4
		},
		
		res = {
			["Bleed"] = 6,
		}
	},
}