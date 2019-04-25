ITEM.name = "Nightmare"
ITEM.model = "models/props_lab/jar01b.mdl"
ITEM.material = "phoenix_storms/bluemetal"
ITEM.desc = "A small bottle filled with a purple substance. Upon consumption, a person will fall asleep, and immediately have a very vivid nightmare that will last for at least five hours.\nThis substance is effective against all sentient creatures."
ITEM.duration = 7200
ITEM.price = 30
ITEM.uniqueID = "drug_nightmare"
ITEM.color = Color(148, 0, 210)

ITEM.attribBoosts = {
	["end"] = -10,
	["stm"] = -5,
}

ITEM.iconCam = {
	pos = Vector(-200, 0, 0),
	ang = Angle(0, -0, 0),
	fov = 3.75,
}

ITEM:hook("_use", function(item)
	local client = item.player

	client:notify("You begin to feel very sleepy.")
	client:EmitSound("npc/barnacle/barnacle_gulp1.wav")
	client:ScreenFade(1, Color(148, 0, 210, 255), 5, 0)
	
	if(client:getChar():getFaction() == FACTION_SURVIVOR) then --only happens to drifters
		giveDisease(client, "dis_eyes")
		
		if(math.random(1,5) == 5) then --20% chance of a secret.
			timer.Simple(1, function()
				nut.chat.send(client, "w", "You are a fake.", true)
			end)
			
			timer.Simple(2.5, function()
				nut.chat.send(client, "w", "You are empty.", true)
			end)
			
			timer.Simple(4, function()
				nut.chat.send(client, "w", "There is no home for you to return to.", true)
			end)
			
			timer.Simple(5.5, function()
				nut.chat.send(client, "w", "They created you, only for what's inside you.", true)
			end)
			
			timer.Simple(7, function()
				nut.chat.send(client, "w", "You are incomplete.", true)
			end)
			
			timer.Simple(8.5, function()
				nut.chat.send(client, "w", "You will suffer.", true)
			end)
			
			timer.Simple(10, function()
				nut.chat.send(client, "w", "There is no way out, only a hole to jump down.", true)
			end)
			
			timer.Simple(11.5, function()
				nut.chat.send(client, "w", "You are a fake.", true)
			end)
		end
	end
end)

if (CLIENT) then
	function ITEM:drawEntity(entity, item)
		entity:DrawModel()
		entity:SetModelScale(.7)
		entity:DrawShadow(false)
		
		local pos = entity:GetPos()
		local dlight = DynamicLight(entity:EntIndex())
		local perc = ( ( 9000000 - CurTime() )/ 9000000 )
		dlight.Pos = pos
		dlight.r = 140
		dlight.g = 0
		dlight.b = 210
		dlight.Brightness = 3
		dlight.Size = 32
		dlight.Decay = 128
		dlight.style = 5
		dlight.DieTime = CurTime() + .1	
	end
end