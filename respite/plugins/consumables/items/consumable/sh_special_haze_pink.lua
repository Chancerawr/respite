ITEM.name = "Bottled Pink Haze"
ITEM.prefix = "Pink Haze"
ITEM.desc = "A gaseous substance that disorients the user and distorts their senses severely. This can be very painful for the afflicted's entire body. Those who inhale this substance may have their senses 'swapped' for a few hours before returning to normal."
ITEM.uniqueID = "haze_bottled_pink"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/props_combine/tprings_globe"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(255, 108, 180)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.stomach = false
ITEM.noEnhance = true

ITEM.attrib = {
	["fortitude"] = -3,
	["str"] = -3,
	["stm"] = -3,
	["end"] = -3,
	["accuracy"] = -3,
	["perception"] = -3
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 108, 180, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = 10,
	["Gas"] = 2,
	["Drug"] = 1,
	["Special"] = 5,
}

ITEM.craft = {
	hp = -10,
	mp = -5,

	buffTbl = {
		attrib = {
			["fortitude"] = -3,
			["str"] = -3,
			["stm"] = -3,
			["end"] = -3,
			["accuracy"] = -3,
			["perception"] = -3
		},
		
		res = {
			["Weak"] = -50,
			["Pain"] = -100,
			["Fear"] = 50,
			["Mind"] = 25,
			["Taunt"] = 25,
			["Silence"] = 25,
			["Break"] = 25,
		}
	},
}

ITEM.effect = {
	colorMod = {
		[ "$pp_colour_addr" ] = 0.1,
		[ "$pp_colour_addg" ] = 0.05,
		[ "$pp_colour_addb" ] = 0.05,
		[ "$pp_colour_brightness" ] = 0.1,
		[ "$pp_colour_contrast" ] = 3,
		[ "$pp_colour_colour" ] = 3,
		[ "$pp_colour_mulr" ] = 1,
		[ "$pp_colour_mulg" ] = 0.8,
		[ "$pp_colour_mulb" ] = 0.8
	},
	
	bloom = {
		darken = 0.7,
		mult = 0.2,
		sizeX = 9,
		sizeY = 9,
		passes = 1,
		colorMult = 1,
		r = 1,
		g = 0.8,
		b = 0.8
	},
	
	motionblur = {
		addAlpha = 0.4,
		drawAlpha = 0.8,
		delay = 0.01,
	},
	
	duration = 30,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}