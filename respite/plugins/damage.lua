local PLUGIN = PLUGIN
PLUGIN.name = "Damage Effects"
PLUGIN.author = "Pokernut & Luna"
PLUGIN.desc = "Adds effects for getting hurt."

local painSounds = {
	Sound("vo/npc/male01/pain01.wav"),
	Sound("vo/npc/male01/pain02.wav"),
	Sound("vo/npc/male01/pain03.wav"),
	Sound("vo/npc/male01/pain04.wav"),
	Sound("vo/npc/male01/pain05.wav"),
	Sound("vo/npc/male01/pain06.wav")
}

local drownSounds = {
	Sound("player/pl_drown1.wav"),
	Sound("player/pl_drown2.wav"),
	Sound("player/pl_drown3.wav"),
}


if SERVER then

function PLUGIN:PlayerHurt(client, attacker, health, damage)
	if ((client.nutNextPain or 0) < CurTime()) then
		local painSound = hook.Run("GetPlayerPainSound", client) or table.Random(painSounds)

		if (client:isFemale() and !painSound:find("female")) then
			painSound = painSound:gsub("male", "female")
		end
        -- client:EmitSound("affects/tinnitus3a.mp3", 35)	
        -- client:EmitSound("affects/tinnitus6a.mp3", 50)	
        -- client:EmitSound("affects/actor_heartbeat_fast.mp3", 50)
		
		client:EmitSound(painSound)
		
		client.nutNextPain = CurTime() + 1.0
	 end
   end
end

--[[
function PLUGIN:EntityTakeDamage(entity, dmgInfo)
    if entity:IsPlayer() then	
       entity:ScreenFade( 1, Color(0, 0, 0, 210), 0.3 * dmgInfo:GetDamage(), 0.2 * dmgInfo:GetDamage())
       entity:ViewPunch( Angle(2 * dmgInfo:GetDamage(), 9 * dmgInfo:GetDamage(), 1 * dmgInfo:GetDamage()) )
	end
end
--]]

  