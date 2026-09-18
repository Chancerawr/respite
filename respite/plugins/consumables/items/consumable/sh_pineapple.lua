ITEM.name = "Pineapple"
ITEM.desc = "A large prickly fruit."
ITEM.uniqueID = "food_pineapple"
ITEM.model = "models/foodnhouseholditems/pineapple.mdl"
ITEM.quantity2 = 5
ITEM.price = 5

ITEM.attrib = { 
	["end"] = 5,
	["luck"] = 3,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["end"] = 5,
			["luck"] = 3,
		},
		
		armor = 10,
	},
}