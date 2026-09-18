ITEM.name = "Ketchup"
ITEM.desc = "A bottle of ketchup."
ITEM.uniqueID = "food_ketchup"
ITEM.model = "models/foodnhouseholditems/ketchup.mdl"
ITEM.quantity2 = 5
ITEM.price = 10

ITEM.attrib = { 
	["str"] = 2,
	["fortitude"] = 1,
	["end"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 3,
	["Meat"] = 10,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["str"] = 2,
			["fortitude"] = 1,
			["end"] = 1,
		},
		
		res = {
			["Slow"] = 8,
		}
	},
}