local PLUGIN = PLUGIN
PLUGIN.name = "Searching"
PLUGIN.author = "Chessnut"
PLUGIN.desc = "Adds the ability to search other players."

function PLUGIN:CanPlayerSearch(client, target)
	return client:GetNetVar("tied") != true and target:GetNetVar("tied") == true
end