ITEM.name = "Bagel"
ITEM.prefix = "Bagel"
ITEM.desc = "A tasty roll of bread."
ITEM.uniqueID = "food_bagel"
ITEM.model = "models/foodnhouseholditems/bagel3.mdl"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.width = 1

ITEM.attrib = { 
	["stm"] = 2,
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
			["stm"] = 2,
			["end"] = 3
		},
		
		res = {
			["Bleed"] = 6,
		}
	},
}