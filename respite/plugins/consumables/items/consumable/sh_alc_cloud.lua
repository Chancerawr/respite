ITEM.name = "Bottled Cloud"
ITEM.prefix = "Cloud"
ITEM.desc = "A glass bottle filled with something strange."
ITEM.uniqueID = "alc_cloud"
ITEM.model = "models/props_junk/garbage_glassbottle003a.mdl"
ITEM.material = "models/props/cs_office/clouds"
ITEM.quantity2 = 2
ITEM.price = 0
ITEM.sound = "hl1/ambience/steamburst1.wav"
ITEM.container = "j_empty_beer"

ITEM.attrib = {
	["fortitude"] = 5, 
	["end"] = 2, 
	["stm"] = 2, 
	["str"] = -2,
	["perception"] = -2 
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Alcohol"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 3,

	buffTbl = {
		attrib = {
			["fortitude"] = 5, 
			["end"] = 2, 
			["stm"] = 2, 
			["str"] = -2,
			["perception"] = -2 
		},
		
		res = {
			["Slow"] = 10,
			["Root"] = 10,
		}
	},
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(150, 150, 150, 100), .4, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}