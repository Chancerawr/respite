ITEM.name = "Lobster"
ITEM.desc = "A red lobster."
ITEM.uniqueID = "food_lobster"
ITEM.model = "models/foodnhouseholditems/lobster.mdl"
ITEM.quantity2 = 6
ITEM.price = 3

ITEM.attrib = { 
	["fortitude"] = 5,
	["end"] = 5,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Seafood"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 5,
			["end"] = 5,
		},
		
		res = {
			["Mind"] = 10,
		}
	},
}