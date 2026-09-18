local PLUGIN = PLUGIN
PLUGIN.name = "Diving Gear"
PLUGIN.author = " "
PLUGIN.desc = "Adds diving gear that can be equipped to avoid drowning underwater."

if(SERVER) then
	function PLUGIN:ShouldPlayerDrown(client)
		if(client.DivingTank) then
			return false
		end
	end
end