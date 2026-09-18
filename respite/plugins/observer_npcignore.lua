local PLUGIN = PLUGIN
PLUGIN.name = "NPCs Ignore Observer"
PLUGIN.author = " "
PLUGIN.desc = "NPCs will ignore admins in observer mode"


if(SERVER) then
	function PLUGIN:OnPlayerObserve(client, state)
		if(state) then
			client:AddFlags(FL_NOTARGET)
		else
			client:RemoveFlags(FL_NOTARGET)
		end
	end
end