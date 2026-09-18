ITEM.name = "Tomato"
ITEM.desc = "A red fruit."
ITEM.uniqueID = "food_tomato"
ITEM.model = "models/foodnhouseholditems/tomato.mdl"
--ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
--ITEM.material = "models/props_canal/metalcrate001d"
ITEM.quantity2 = 2
ITEM.price = 3

ITEM.attrib = { 
	["fortitude"] = 1,
	["end"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 5,
	["Fruit"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 1,
			["end"] = 1,
		},
		
		res = {
			["Slow"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(65.48, 54.94, 39.86),
	ang = Angle(25, 220, 0),
	fov = 4.25,
}