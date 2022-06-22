ITEM.name = "Canned Sadness"
ITEM.prefix = "Sad"
ITEM.desc = "A can filled with.. Something sad, if I had to guess."
ITEM.uniqueID = "food_sadness"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(148, 0, 210)
ITEM.sound = "ambient/creatures/town_muffled_cry1.wav"
ITEM.container = "j_tinc"
 
ITEM.attrib = { 
	["fortitude"] = 2,
	["end"] = 1
}
 
ITEM.notify = "You feel sad."

ITEM.loot = {
	["Consumable"] = 5,
	["Food"] = 1,
	["Canned"] = 5,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["stm"] = 1,
		},
		
		res = {
			["Mind"] = -5,
			["Taunt"] = -5,
			["Pain"] = 5,
			["Fear"] = 5,
			["Blind"] = 5,
			["Time"] = 5,
		}
	},
}
 
ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}