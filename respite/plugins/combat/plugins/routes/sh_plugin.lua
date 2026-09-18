local PLUGIN = PLUGIN
PLUGIN.name = "CEnt Patrol Routes Templater"
PLUGIN.author = " "
PLUGIN.desc = "Used to manage CEnt patrol routes."

PLUGIN.routes = PLUGIN.routes or {}

--[[
PLUGIN.routes = {
	["Example Route"] = {
		Vector(0,0,0),
		Vector(1,2,2),
		Vector(1,3,3),
	}
}
--]]

function PLUGIN:GetRoute(name)
	return PLUGIN.routes[name]
end

function PLUGIN:SaveRoutes()
	local data = PLUGIN.routes
	
	self:setData(data)
end

function PLUGIN:LoadRoutes()
	local data = self:getData()
	
	PLUGIN.routes = data
end

function PLUGIN:InitPostEntity()
	pcall(function()
		PLUGIN:LoadRoutes()
	end)
end

if(SERVER) then
	--send route data to player
	function PLUGIN:NetworkRouteData(client)
		netstream.Start(client, "nut_routeSend", PLUGIN.routes)
	end
	
	function PLUGIN:UpdateRoute(ID, data)
		PLUGIN.routes[ID] = data
		
		PLUGIN:SaveRoutes()
	end
	
	netstream.Hook("nut_routeSave", function(client, ID, data)
		if(client:GetWeapon("nut_patrolmarker")) then
			PLUGIN:UpdateRoute(ID, data)
		end
	end)
	
	--teleports a player to a patrol point
	netstream.Hook("nutRouteTP", function(client, pos)
		if(client:IsAdmin()) then
			client:SetPos(pos)
		end
	end)
else
	netstream.Hook("nut_routeSend", function(data)
		if(istable(data)) then
			PLUGIN.routes = data
		end
	end)
	

	--clientside route request
end