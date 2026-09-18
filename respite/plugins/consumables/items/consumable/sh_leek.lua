ITEM.name = "Leek"
ITEM.prefix = "Leek"
ITEM.desc = "A long vegetable with an onion-like taste."
ITEM.uniqueID = "food_leek"
ITEM.model = "models/foodnhouseholditems/leek.mdl"
ITEM.quantity2 = 2
ITEM.price = 4

ITEM.attrib = { 
	["str"] = 2,
	["end"] = 2,
	["accuracy"] = 2,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Vegetable"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 2,
			["end"] = 2,
			["accuracy"] = 2,
		},
		
		res = {
			["Blind"] = -3,
			["Mind"] = 4,
			["Stun"] = 4,
			["Sleep"] = 4,
		}
	},
}