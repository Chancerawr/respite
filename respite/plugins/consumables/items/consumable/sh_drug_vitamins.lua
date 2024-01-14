ITEM.name = "Vitamins"
ITEM.prefix = "Nutritious"
ITEM.desc = "A dietary supplement with vitamins, dietary minerals, and other nutritional elements."
ITEM.uniqueID = "drug_vitamins"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "models/props/cs_assault/pylon"
ITEM.category = "Drug"
ITEM.duration = 6000
ITEM.price = 200
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.quantity2 = 10

ITEM.stomach = false

ITEM.attrib = {
	["str"] = 3,
	["stm"] = 3,
	["end"] = 3,
	["fortitude"] = 3,
	["medical"] = 3,
	["accuracy"] = 3,
	["perception"] = 3
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(0, 128, 128, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drug"] = 8,
}

ITEM.craft = {
	buffTbl = {
		attrib = {
			["str"] = 3,
			["stm"] = 3,
			["end"] = 3,
			["fortitude"] = 3,
			["medical"] = 3,
			["accuracy"] = 3,
			["perception"] = 3
		},
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}