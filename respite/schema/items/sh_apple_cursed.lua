ITEM.name = "Cursed Apple"
ITEM.desc = "A spherical green fruit, this one glows in the dark."
ITEM.uniqueID = "food_apple_cursed"
ITEM.model = "models/props/de_inferno/crate_fruit_break_gib2.mdl"
ITEM.material = "models/props_lab/xencrystal_sheet"
ITEM.price = 1
ITEM.flag = "v"
ITEM.color = Color(20, 100, 20)

ITEM.iconCam = {
	pos = Vector(65.475, 54.94, 39.856),
	ang = Angle(25, 220, 0),
	fov = 4.25,
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
		
		local ranAttrib = table.Random(nut.attribs.list)
		
		if(roll > 40) then --60% chance (without luck factor)
			client:notify("The apple is delicious, you feel like you've become something more.")
			char:updateAttrib(ranAttrib, 1)
		else
			client:notify("The apple is rotten to the core, you feel like you lost something.")
			char:updateAttrib(ranAttrib, -0.9)
		end
	end,
	onCanRun = function(item)		
		return (!IsValid(item.entity))
	end
}