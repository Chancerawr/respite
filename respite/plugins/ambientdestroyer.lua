PLUGIN.name = "Ambient Sound Destroyer"
PLUGIN.author = "Chancer"
PLUGIN.desc = "This tries to turn off ambient noises on the map, can be helpful with lots of things."

nut.config.add("ambienceOff", false, "Whether or not to kill ambient sound entities.", nil, {
	category = "Map"
})

local function killEnts()
	local count = 0

	local entsToKill = {
		["ambient_generic"] = true,
		["env_soundscape_triggerable"] = true,
		["soundent"] = true,
		["trigger_soundscape"] = true,
	}

	for k, v in pairs(ents.GetAll()) do
		if(!IsValid(v)) then continue end
	
		if(entsToKill[v:GetClass()]) then
			SafeRemoveEntity(v)
			count = count + 1
		end
	end
		
	return count
end

function PLUGIN:Think()
	if(nut.config.get("ambienceOff", false)) then
		if((!self.cleanedSounds)) then
			killEnts()
			
			self.cleanedSounds = true
		end
	end
end

nut.command.add("ambiencekill", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = killEnts()

		client:notify("Removed " ..count.. " entities.")
	end
})