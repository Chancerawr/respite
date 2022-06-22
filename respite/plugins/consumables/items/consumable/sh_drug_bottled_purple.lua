ITEM.name = "Bottled Purple Mist"
ITEM.prefix = "Purple Mist"
ITEM.desc = "A bottle filled with a purple gas, inhaling it makes you feel happy and lighter than air for a few hours.\nHeavy users may see strange visions."
ITEM.uniqueID = "bottled_purple"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/items/boxsniperrounds"
ITEM.category = "Drug"
ITEM.duration = 6200
ITEM.price = 200
ITEM.color = Color(155, 50, 200)

ITEM.sound = "hl1/ambience/steamburst1.wav"
ITEM.soundPitch = 50

ITEM.mp = 10

ITEM.stomach = false

ITEM.attrib = {
	["fortitude"] = 5,
	["perception"] = -5
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(155, 50, 200, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Gas"] = 7,
	["Drug"] = 2,
	["Special"] = 10,
}

ITEM.craft = {
	mp = 10,

	buffTbl = {
		attrib = {
			["fortitude"] = 5,
			["perception"] = -5
		},
		
		res = {
			["Blight"] = 8,
			
			["Mind"] = -5,
			["Fear"] = 10,
			["Pain"] = 5,
		}
	},
}

ITEM.effect = {
	colorMod = {
		[ "$pp_colour_addr" ] = 0.1,
		[ "$pp_colour_addg" ] = 0,
		[ "$pp_colour_addb" ] = 0.2,
		[ "$pp_colour_brightness" ] = -0.1,
		[ "$pp_colour_contrast" ] = 1.5,
		[ "$pp_colour_colour" ] = 2,
		[ "$pp_colour_mulr" ] = 0.9,
		[ "$pp_colour_mulg" ] = 0.8,
		[ "$pp_colour_mulb" ] = 1
	},
	
	bloom = {
		darken = 0.8,
		mult = 0.2,
		sizeX = 9,
		sizeY = 9,
		passes = 1,
		colorMult = 1,
		r = 1,
		g = 0.8,
		b = 1
	},
	
	duration = 60,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}