ITEM.name = "Strange Canned Laughter"
ITEM.prefix = "Funny"
ITEM.desc = "A can filled with weird laughter?"
ITEM.uniqueID = "food_laugh_p"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.hungerAmount = 10
ITEM.quantity2 = 3
ITEM.price = 0

ITEM.sound = ""
ITEM.soundURL = "http://respite7192.site.nfoservers.com/items/pekora.mp3"
ITEM.container = "j_tinc"

ITEM.attrib = { 
	["fortitude"] = -3
}

ITEM.loot = {
	["Consumable"] = 0.1,
	["Food"] = 0.1,
	["Canned"] = 1,
	["Special"] = 1,
}

ITEM.craft = {
	hp = 15,
	mp = -3,

	buffTbl = {
		attrib = {
			["luck"] = 3,
			["fortitude"] = -3,
		},
		
		res = {
			["Fear"] = 15,
			["Disease"] = 5,
			["Poison"] = 5,
			["Pain"] = -5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}