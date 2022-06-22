ITEM.name = "Corrupted Water"
ITEM.prefix = "Water"
ITEM.desc = "Some sort of container that is filled to the brim with corrupted water. The water itself looks a little bit gray, and smells peculiar."
ITEM.uniqueID = "food_water_misc"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/player/player_chrome1"
ITEM.quantity2 = 2
ITEM.price = 6
ITEM.sound = "npc/barnacle/barnacle_gulp1.wav"
ITEM.container = "j_empty_water"
ITEM.color = Color(100, 100, 100)

ITEM.attrib = { 
	["stm"] = 1,
}

ITEM.loot = {
	["Consumable"] = 10,
	["Drink"] = 10,
	["Water"] = 10,
	["Blight"] = 10,
}

ITEM.craft = {
	hp = 1,
	
	buffTbl = {
		res = {
			["Fire"] = 5,
			["Blight"] = -5,
		}
	},
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}