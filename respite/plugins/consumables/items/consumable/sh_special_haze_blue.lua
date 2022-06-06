ITEM.name = "Bottled Blue Haze"
ITEM.prefix = "Blue Haze"
ITEM.desc = "A gaseous, hallucinogenic substance, individuals that make contact with the blue haze may see vivid hallucinations for an hour or so."
ITEM.uniqueID = "haze_bottled"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.duration = 6000
ITEM.price = 200
ITEM.color = Color(50, 50, 255)
ITEM.sound = "hl1/ambience/steamburst1.wav"

ITEM.disease = "addict_bh"
ITEM.disChance = 10

ITEM.stomach = false
ITEM.noEnhance = true

ITEM.attrib = {
	["fortitude"] = 4,
	["end"] = -2,
}

ITEM.extraFunc = function(item, client)
	client:ScreenFade(1, Color(100, 100, 255, 255), 10, 0)
end

ITEM.loot = {
	["Consumable"] = true,
	["Gas"] = true,
	["Drug"] = true,
	["Special"] = true,
}

ITEM.craft = {
	hp = 5,
	mp = 5,

	buffTbl = {
		attrib = {
			["fortitude"] = 4,
			["end"] = -2,
		},
		
		res = {
			["Mind"] = 15,
			["Stun"] = -10,
		}
	},
}

ITEM.effect = {
colorMod = {
		[ "$pp_colour_addr" ] = 0,
		[ "$pp_colour_addg" ] = 0,
		[ "$pp_colour_addb" ] = 0.1,
		[ "$pp_colour_brightness" ] = -0.1,
		[ "$pp_colour_contrast" ] = 1.5,
		[ "$pp_colour_colour" ] = 2,
		[ "$pp_colour_mulr" ] = 0,
		[ "$pp_colour_mulg" ] = 0,
		[ "$pp_colour_mulb" ] = 1
	},
	
	bloom = {
		darken = 0.9,
		mult = 0.2,
		sizeX = 9,
		sizeY = 9,
		passes = 1,
		colorMult = 1,
		r = 0.8,
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