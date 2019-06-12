PLUGIN.name = "Ambient Sound Destroyer"
PLUGIN.author = "Chancer"
PLUGIN.desc = "This tries to turn off ambient noises on the map, can be helpful with lots of things."

nut.config.add("ambienceOff", false, "Whether or not to kill ambient sound entities.", nil, {
	category = "Map"
})

function PLUGIN:Think()
	if(nut.config.get("ambienceOff", false)) then
		if((!self.cleanedSounds)) then
			local list = ents.FindByClass("ambient_generic")
			for k, v in pairs(list) do
				SafeRemoveEntity(v)
			end
			
			list = ents.FindByClass("env_soundscape_triggerable")
			for k, v in pairs(list) do
				SafeRemoveEntity(v)
			end
			
			self.cleanedSounds = true
		end
	end
end

nut.command.add("ambiencekill", {
	adminOnly = true,
	onRun = function(client, arguments)
		local list = ents.FindByClass("ambient_generic")

		local count = 0
		for k, v in pairs(list) do
			count = count + 1
			SafeRemoveEntity(v)
		end
		
		list = ents.FindByClass("env_soundscape_triggerable")
		for k, v in pairs(list) do
			count = count + 1
			SafeRemoveEntity(v)
		end
		
		client:notify("Removed " ..count.. " entities.")
	end
})