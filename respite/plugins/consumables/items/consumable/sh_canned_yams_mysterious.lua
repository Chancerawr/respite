ITEM.name = "Mysterious Yams"
ITEM.prefix = "Mysterious"
ITEM.desc = "Who are you really?"
ITEM.uniqueID = "food_yams_mysterious"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_lab/security_screens2"
ITEM.quantity2 = 3
ITEM.price = 0
ITEM.color = Color(0, 128, 128)
ITEM.container = "j_tinc"

ITEM.disease = "fort_nost"

ITEM.attrib = { 
	["fortitude"] = -5, 
	["endurance"] = -5 
}

ITEM.loot = {
	["Consumable"] = true,
	["Food"] = true,
	["Canned"] = true,
	["Special"] = true,
}

ITEM.craft = {
	mp = 10,

	buffTbl = {
		attrib = {
			["fortitude"] = -5, 
			["endurance"] = -5 
		},
		
		res = {
			["Mind"] = 100,
			["Taunt"] = 100,
			["Blind"] = 100,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}

ITEM.extraFunc = function(item, client)
	nut.chat.send(client, "body", "Your mind fills with images of a life you do not remember.")
	nut.chat.send(client, "body", "You are in someone else's body, in a more peaceful world.")
	nut.chat.send(client, "body", "It feels nostalgic somehow.")
end