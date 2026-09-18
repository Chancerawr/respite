ITEM.name = "Pancakes"
ITEM.desc = "An entire stack of fluffy discs."
ITEM.uniqueID = "food_pancake"
--ITEM.model = "models/props_c17/clock01.mdl"
ITEM.model = "models/foodnhouseholditems/pancakes.mdl"
--ITEM.material = "models/props_debris/plasterwall034a"
ITEM.quantity2 = 10
ITEM.price = 5

ITEM.attrib = { 
	["str"] = 2,
	["end"] = 2,
	["fortitude"] = 4
}

ITEM.loot = {
	["Consumable"] = 10,
	["Food"] = 2,
	["Breakfast"] = 10,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["str"] = 2,
			["end"] = 2,
			["fortitude"] = 4
		},
		
		res = {
			["Sleep"] = 10,
			["Slow"] = 5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(0, 0, 200),
	ang = Angle(90, 0, 0),
	fov = 5,
}