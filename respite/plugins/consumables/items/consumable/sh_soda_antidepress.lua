ITEM.name = "Antidepressant Soda"
ITEM.desc = "An aluminium can filled with something not sad."
ITEM.uniqueID = "food_soda_antidepress"
ITEM.model = "models/props_junk/popcan01a.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.quantity2 = 2
ITEM.price = 4
ITEM.container = "j_empty_soda_can"
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"

ITEM.cures = {
	["fort_nost"] = true,
}

ITEM.attrib = { 
	["fortitude"] = 3,
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = true,
	["Drink"] = true,
	["Soda"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 4,

	buffTbl = {
		attrib = {
			["fortitude"] = 3,
			["stm"] = 1,
		},
		
		res = {
			["Mind"] = 5,
			["Sleep"] = 10,
			["Slow"] = 20,
			["Fear"] = -5,
			["Pain"] = -5,
		}
	},
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 255, 255, 255), 3, 0)
end

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 2.5,
}