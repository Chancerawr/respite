ITEM.name = "Effect Test 1"
ITEM.desc = ""
ITEM.model = "models/props_combine/breenglobe.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.price = 30
ITEM.duration = 30

ITEM.effect = {
    colorMod = {
        [ "$pp_colour_addr" ] = 0.02,
        [ "$pp_colour_addg" ] = 0,
        [ "$pp_colour_addb" ] = 0,
        [ "$pp_colour_brightness" ] = -0.5,
        [ "$pp_colour_contrast" ] = 1,
        [ "$pp_colour_colour" ] = 0.5,
        [ "$pp_colour_mulr" ] = 0,
        [ "$pp_colour_mulg" ] = -0.5,
        [ "$pp_colour_mulb" ] = -0.5
    },
	
	bloom = {
		darken = 0.65, 
		mult = 2, 
		sizeX = 9, 
		sizeY = 9, 
		passes = 1, 
		colorMult = 4, 
		r = 1, 
		g = 1, 
		b = 1
	},
	
	duration = 5,
}

ITEM.funcStart = function(item)
	local client = item.player
	
	client:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	client:ScreenFade(1, Color(11, 11, 11, 0), 3, 0)
	client:ViewPunch(Angle(1, 0, 0))
end