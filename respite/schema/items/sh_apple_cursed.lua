ITEM.name = "Cursed Apple"
ITEM.desc = "A spherical green fruit, this one glows in the dark."
ITEM.uniqueID = "food_apple_cursed"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "models/props_lab/xencrystal_sheet"
ITEM.price = 1
ITEM.flag = "v"
ITEM.color = Color(20, 100, 20)

ITEM.iconCam = {
	pos = Vector(65.475090026855, 54.940116882324, 39.856090545654),
	ang = Angle(25, 220, 0),
	fov = 4.2514867803092,
}

ITEM.functions.Consume = {
	icon = "icon16/cup.png",
	sound = "npc/barnacle/neck_snap2.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		
		local luck = client:getChar():getAttrib("luck")
		local luckR = math.random(0, luck)
		local roll = math.random(luckR, 100)
		
		local attribs = {}
			attribs[0] = "str"
			attribs[1] = "stm"
			attribs[2] = "end"
			attribs[3] = "fortitude"
			attribs[4] = "accuracy"
			attribs[5] = "perception"
			attribs[6] = "medical"
			attribs[7] = "luck"
		
		local ranAttrib = attribs[math.random(0,7)]
		
		if(roll > 60) then --60% chance (without luck factor)
			client:notify("The apple is delicious, you feel like you've become something more.")
			char:updateAttrib(ranAttrib, 1)
		else
			client:notify("The apple is rotten to the core, you feel like you lost something.")
			char:updateAttrib(ranAttrib, -1.05)
		end
	end,
	onCanRun = function(item)		
		return (!IsValid(item.entity))
	end
}