ITEM.name = "Bottled Blue Haze"
ITEM.model = "models/props_junk/glassbottle01a.mdl"
ITEM.material = "models/xqm/boxfull_diffuse"
ITEM.desc = "A gaseous, hallucinogenic substance, individuals that make contact with the blue haze may see vivid hallucinations for an hour or so."
ITEM.duration = 6000
ITEM.uniqueID = "haze_bottled"
ITEM.price = 200
ITEM.color = Color(50, 50, 255)

ITEM.attribBoosts = {
	["fortitude"] = -15,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 5,
}

ITEM:hook("_use", function(item)
	local client = item.player

	client:EmitSound("hl1/ambience/steamburst1.wav")
	client:ScreenFade(1, Color(100, 255, 100, 255), 10, 0)
	
	timer.Simple(item.duration, function()
		if(math.random(1,10) == 1) then
			client:getChar():setData("addict_bh", CurTime())
		end
	end)
end)
