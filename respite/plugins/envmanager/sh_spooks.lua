local PLUGIN = PLUGIN

local function dist1(client)
	client:ConCommand("mat_corrupt")
	
	timer.Simple(math.random(5,7), function() 
		client:ConCommand("mat_repair")
	end)
end

local function flicker(client)
	local char = client:getChar()
	local times = math.random(3,6)
	
	if(char and !char:getInv():getFirstItemOfType("flashlight_shard")) then
		flashlightFlicker(client, times)
	end
end

local function whisper(client)
	local whispers = {
		"chorror/emily_reversed1.wav",
		"chorror/emily_reversed3.wav",
		"chorror/emily_reversed5.wav",
		"chorror/emily_reversed9.wav",
		"chorror/psstleft.wav",
		"chorror/psstright.wav"
	}
	
	client:ConCommand( "play " ..table.Random(whispers))
end

local randSounds = {
	"horror/screech.mp3",
	"horror/fz_alert_close1.mp3",
	"chorror/cryscreams.mp3",
	"ambient/misc/equipment_stress1.wav",
	"ambient/levels/labs/teleport_weird_voices1.wav",
	"ambient/levels/labs/teleport_weird_voices2.wav",
	"chorror/emily_reversed1.wav",
	"po/musicbox.mp3",
	"weapons/brightmp5/mp5-1.wav",
	"weapons/fokku_tc_m14/sg550-1.wav",
	"weapons/tact870/m3-1.wav",
	"ambient/creatures/rats4.wav",
	"deadzone/lepotitsa/attack1.wav",
	"npc/wheelchair/wc_wheel3.wav",
	"npc/wheelchair/wc_alert.wav",
	"ambient/atmosphere/hole_hit1.wav",
	"ambient/atmosphere/hole_hit2.wav",
	"ambient/levels/prison/inside_battle1.wav",
	"ambient/levels/prison/inside_battle4.wav",
	"doors/door_locked2.wav",
	"ambient/alarms/train_horn_distant1.wav",
	"ambient/atmosphere/tone_quiet.wav",
	"ambient/atmosphere/pipe1.wav",
	"ambient/atmosphere/noise2.wav",
}

local function propNoise(client)
	local position = client:GetPos()
	local object = ents.Create("prop_physics")
	object:SetModel("models/props_interiors/Furniture_Lamp01a.mdl")
	
	local randX = math.random(-1,1)
	local randY = math.random(-1,1)
	local randZ = math.random(-1,1)
	
	local xPos = 1500 * randX
	local yPos = 1500 * randY
	local zPos = 1500 * randZ
	
	object:SetPos(position + Vector(xPos, yPos, randZ))
	
	--object:Spawn()
	object:EmitSound(table.Random(randSounds), 75)
	
	SafeRemoveEntity(object)
end

local function blindTeleport(client)
	client:ConCommand("hellend")
	timer.Simple(3, function()
		local newPos = client:GetPos()
		
		for k, v in pairs(ents.GetAll()) do
			if(v.chance) then
				newPos = v:GetPos()
				v:SetPos(client:GetPos())
				break
			end
		end
		
		client:SetPos(newPos)
	end)
end

local function scAppear(client)
	if(IsValid(client)) then	
		if(math.random(1,2) == 1) then
			net.Start("MannStart")
		else
			net.Start("MannStart2")
		end
		
		net.WriteEntity(client)
		net.Send(client) 
		client:Freeze(true)
		
		timer.Simple(2.2, function() 
			net.Start("MannEnd")
			net.WriteEntity(client)
			net.Send(client) 
			client:Freeze(false)			
		end)
	end
end

local chatWhisps = {
	"Don't turn around.",
	"I know what you did.",
	"I see you.",
	"Stop.",
	"Don't move.",
	"Can you hear it?",
	"Get away.",
	"Don't leave.",
	"Run.",
	"You are nothing.",
}

local chatSays = {
	"Don't look at me.",
	"Look out.",
	"Watch your back.",
	"Be careful.",
	"Did you hear that?",
	"What was that?",
	"There's something out there.",
	"I remember you.",
	"I'm sorry.",
}

local chatYells = {
	"Close your eyes!",
	"Look out!",
	"Help!",
	"It's coming!",
	"Run!",
	"It's here!",
	"Get away!",
	"Why!?",
}

local chatIts = {
	"A soft crying can be heard nearby, it sounds like an infant.",
	"A soft crying can be heard nearby, it sounds like a young woman.",
	"You hear a far off scream, it echoes through the area.",
	"You hear irregular footsteps nearby.",
	"A hushed whispering comes from nearby.",
	"An inhuman screech echoes throughout the area, it sounded far away.",
	"A single gunshot rings out from far away.",
	"You hear a man yelling from somewhere far off, he sounds panicked.",
	"The ground around you shakes slightly for no identifiable reason."
}

local function chatSpook(client)
	local chatType = math.random(1,4)
	if(chatType == 1) then
		nut.chat.send(client, "whisper_npc", "Someone whispers, \"" ..table.Random(chatWhisps).. "\"")
	elseif(chatType == 2) then
		nut.chat.send(client, "say_npc", "Someone says, \"" ..table.Random(chatSays).. "\"")
	elseif(chatType == 3) then
		nut.chat.send(client, "yell_npc", "Someone yells, \"" ..table.Random(chatYells).. "\"")	
	else
		nut.chat.send(client, "whisper_npc", "**" ..table.Random(chatIts))
	end
end

local function enemySpawn(client)
	local creatures = {
		"resp_dolly_shade",
		"shade_crawlsmoke",
		"nz_undead_shade",
		"resp_babu_shade",
		"resp_belmer",
		"nz_haunt",
		"nz_phantom",
		"resp_babu_wraith"
	}

	local ent = ents.Create(table.Random(creatures))
		
	if (ent:IsValid()) then
		ent:SetPos(client:GetPos())
		local pos = ent:FindSpot( "random", { type = 'hiding', radius = 5000 } )
		if(pos) then
			ent:SetPos(pos)
			ent:Spawn()
			
			timer.Simple(0.5, function()
				ent:SetEnemy(client)
			end)
		else
			ent:Remove()
		end
	end
end

PLUGIN.minorSpooks = {
	chatSpook,
	propNoise,
	flicker
}

PLUGIN.majorSpooks = {
	whisper,
	blindTeleport,
	dist1,
	enemySpawn,
	scAppear
}

nut.command.add("envspook", {
	syntax = "<string target>",
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if (IsValid(target)) then
			if(math.random(1,10) < 8) then --higher chance to do a less severe thing
				table.Random(PLUGIN.minorSpooks)(target)
			else --lower chance to do a really annoying thing
				table.Random(PLUGIN.majorSpooks)(target)
			end
			
			client:notify("Player spooked.")
		else
			client:notify("Look at a valid player.")
		end
	end
})

nut.command.add("envteleport", {
	syntax = "<string target>",
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if (IsValid(target)) then
			blindTeleport(target)
			
			client:notify("Player teleported and swapped.")
		else
			client:notify("Look at a valid player.")
		end
	end
})