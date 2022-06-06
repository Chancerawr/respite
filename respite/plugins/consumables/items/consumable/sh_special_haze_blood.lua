ITEM.name = "Bottled Blood Haze"
ITEM.prefix = "Blood Haze"
ITEM.desc = "A thick red gas, it attracts nearby Abominations to the area, but is not quite enough to distract them."
ITEM.uniqueID = "haze_bottled_blood"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/props_c17/furniturefabric002a"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(255, 60, 60)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.hp = 25
ITEM.mp = -5

ITEM.noEnhance = true

ITEM.attrib = {
	["fortitude"] = -5,
	["end"] = 4,
	["str"] = 4
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(255, 50, 50, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Gas"] = true,
	["Drug"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 25,
	mp = -5,

	buffTbl = {
		attrib = {
			["fortitude"] = -5,
			["end"] = 4,
			["str"] = 4
		},
		
		res = {
			["Mind"] = -15,
			["Move"] = 10,
			["Stun"] = 10,
		}
	},
}

ITEM.effect = {
	colorMod = {
		[ "$pp_colour_addr" ] = 0.1,
		[ "$pp_colour_addg" ] = 0,
		[ "$pp_colour_addb" ] = 0,
		[ "$pp_colour_brightness" ] = -0.1,
		[ "$pp_colour_contrast" ] = 1.5,
		[ "$pp_colour_colour" ] = 2,
		[ "$pp_colour_mulr" ] = 1,
		[ "$pp_colour_mulg" ] = 0,
		[ "$pp_colour_mulb" ] = 0
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
	
	duration = 60,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}