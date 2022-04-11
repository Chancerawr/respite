local PLUGIN = PLUGIN
--a networked requestQuery thing

local playerMeta = FindMetaTable("Player")

-- Sends a Derma string request to the client.
function playerMeta:requestQuery(question, title, callback, default)
	local time = math.floor(os.time())

	self.nutStrReqs = self.nutStrReqs or {}
	self.nutStrReqs[time] = callback

	netstream.Start(self, "strQue", time, question, title, default)
end

if(SERVER) then
	netstream.Hook("strReq", function(client, time, text)
		if (client.nutStrReqs and client.nutStrReqs[time]) then
			client.nutStrReqs[time](text)
			client.nutStrReqs[time] = nil
		end
	end)
else
	netstream.Hook("strQue", function(time, question, title, default)
		Derma_Query(question, title, "Yes", function()
			netstream.Start("strReq", time, "Yes")
		end, "No")
	end)
end