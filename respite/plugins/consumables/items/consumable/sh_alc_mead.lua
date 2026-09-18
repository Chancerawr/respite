ITEM.name = "Mead"
ITEM.desc = "A glass bottle filled with mead."
ITEM.uniqueID = "alc_mead"
ITEM.model = "models/foodnhouseholditems/winebottle2.mdl"
ITEM.quantity2 = 2
ITEM.price = 2
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_mead"
ITEM.color = Color(139,69,19)

ITEM.attrib = { 
	["stm"] = 3,
	["str"] = 3,
	["perception"] = -1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 1,
	["Alcohol"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 3,
			["str"] = 3,
			["perception"] = -1,
		},
		
		res = {
			["Blind"] = -5,
			["Pain"] = 5,
			["Disease"] = 10,
			["Time"] = 10,
		}
	},
}