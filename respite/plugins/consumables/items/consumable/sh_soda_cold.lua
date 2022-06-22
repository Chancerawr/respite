ITEM.name = "Cold Can"
ITEM.prefix = "Cold"
ITEM.desc = "The can is cold to the touch. The liquid inside is some kind of slushy substance, it is incredibly tasty, but also very, very cold."
ITEM.uniqueID = "food_soda_cold"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/props/cs_office/clouds"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.sound = "hl1/ambience/steamburst1.wav"
ITEM.container = "j_empty_soda_can"

ITEM.attrib = { 
	["stm"] = -3,
	["fortitude"] = 5,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(150, 150, 150, 100), 2, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 1,
	["Soda"] = 1,
	["Special"] = 2,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["stm"] = -3,
			["fortitude"] = 5,
		},
		
		res = {
			["Fire"] = 10,
			["Cold"] = -10,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}