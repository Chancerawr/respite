ITEM.name = "Canned Madness"
ITEM.prefix = "Madness"
ITEM.desc = "A can filled with.. Something bad, probably."
ITEM.uniqueID = "food_madness"
ITEM.model = "models/props_junk/garbage_metalcan001a.mdl"
ITEM.material = "models/props_wasteland/tugboat01"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.color = Color(148, 0, 210)

ITEM.sound = "vo/citadel/br_laugh01.wav"
ITEM.soundPitch = 20
ITEM.container = "j_tinc"

--[[
ITEM.disease = "dis_mind"
ITEM.disChance = 100
--]]

ITEM.attrib = {
	["fortitude"] = -10,
}

ITEM.loot = {
	["Consumable"] = 1,
	["Food"] = 0.1,
	["Canned"] = 1,
	["Special"] = 1,
}

ITEM.craft = {
	mp = -10,

	buffTbl = {
		attrib = {
			["fortitude"] = -10,
		},
		
		res = {
			["Silence"] = 40,
			["Mind"] = 40,
			["Sleep"] = 40,
			["Fear"] = 40,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, -0.5),
	ang = Angle(0, -0, 0),
	fov = 2.25,
}

ITEM.extraFunc = function(item, client)
	client:ConCommand("hellstart")
end