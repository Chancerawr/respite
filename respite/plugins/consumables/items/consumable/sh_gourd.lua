ITEM.name = "Gourd"
ITEM.desc = "A large fruit with a hard skin."
ITEM.uniqueID = "food_gourd"
ITEM.model = "models/foodnhouseholditems/gourd.mdl"
ITEM.quantity2 = 5
ITEM.price = 3
ITEM.height = 2

ITEM.attrib = { 
	["end"] = 4,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 3,
}

ITEM.craft = {
	hp = 5,

	buffTbl = {
		attrib = {
			["end"] = 4,
		},
		
		res = {
			["Slow"] = -5,
			["Stun"] = 10,
		},
		
		armor = 10,
	},
}