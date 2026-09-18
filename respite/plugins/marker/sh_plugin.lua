local PLUGIN = PLUGIN
PLUGIN.name = "Map Markers"
PLUGIN.author = " "
PLUGIN.desc = "Markers that can be placed on the map."

PLUGIN.markers = PLUGIN.markers or {}

if(SERVER) then
	function PLUGIN:SaveMarkers()
		local data = {}
	
		for k, v in ipairs(PLUGIN.markers) do
			if(!IsValid(v)) then continue end
			if(v:GetClass() != "resp_marker") then continue end
			
			local entData = {
				pos = v:GetPos(),
				ang = v:GetAngles(),
				name = v:GetMarkerName(),
				color = v:GetMarkerColor(),
			}
		
			table.insert(data, entData)
		end

		self:setData(data)
	end
		
	function PLUGIN:loadMarkers()
		self.savedEnts = self:getData()
		
		for k, v in pairs(self.savedEnts) do
			local marker = ents.Create("resp_marker")
			marker:SetPos(v.pos)
			marker:SetAngles(v.ang)
			marker.loaded = true
			marker:Spawn()
			marker:SetMarkerName(v.name or "???")
			marker:SetMarkerColor(v.color)
		end
	end
	
	--[[
	function PLUGIN:InitPostEntity()
		timer.Simple(30, function()
			PLUGIN:loadMarkers()
		end)
	end
	--]]
	
	function PLUGIN:LoadData()
		pcall(function()
			PLUGIN:loadMarkers()
			self.loadedData = true
		end)
	end
end

if(CLIENT) then
	NUT_MARKERTOGGLE = CreateClientConVar("nut_marker", 1, true, true)

	local client, sx, sy, scrPos, marginx, marginy, x, y, markerColor, distance, factor, size, alpha
	local dimDistance = 16777216 -- 4096 * 4096
	function PLUGIN:HUDPaint()
		client = LocalPlayer()
		
		if(NUT_MARKERTOGGLE:GetBool()) then
			sx, sy = surface.ScreenWidth(), surface.ScreenHeight()
			
			for k, v in ipairs(PLUGIN.markers) do
				if(v:GetClass() != "resp_marker") then continue end
			
				local pos = v:GetPos()
				
				scrPos = pos:ToScreen()
				marginx, marginy = sy*.1, sy*.1
				x, y = scrPos.x, scrPos.y
				markerColor = v:GetMarkerColor()
				distance = client:GetPos():DistToSqr(pos)
				factor = 1 - math.Clamp(distance/dimDistance, 0, 1)
				size = math.max(10, 32*factor)
				alpha = math.Clamp(255*factor, 80, 255)

				local color = Color(markerColor.r*255, markerColor.g*255, markerColor.b*255)

				surface.SetDrawColor(color.r, color.g, color.b, alpha)
				--surface.DrawLine(sx * 0.5, sy * 0.5, x, y)
				surface.DrawRect(x - size/2, y - size/2, size, size)

				local name = v:GetMarkerName()

				nut.util.drawText(name, x, y - size, ColorAlpha(color, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, nil, alpha)
			end
		end
	end

	function PLUGIN:SetupQuickMenu(menu)
		local NUT_MARKERTOGGLE = menu:addCheck("Toggle Markers", function(panel, state)
			if (state) then
				RunConsoleCommand("nut_marker", "1")
			else
				RunConsoleCommand("nut_marker", "0")
			end
		end, NUT_MARKERTOGGLE:GetBool())

		menu:addSpacer()
	end
end

--caches markers so we can access them more efficiently
hook.Add("OnEntityCreated", "nut_cacheMarkerAdd", function(entity)
	local class = entity:GetClass()
	
	if(class == "resp_marker") then
		table.insert(PLUGIN.markers, entity)
	end
end)

--updates cache when entities are removed
hook.Add("EntityRemoved", "nut_cacheMarkerRemove", function(entity)
	local class = entity:GetClass()
	
	if(class == "resp_marker") then
		table.RemoveByValue(PLUGIN.markers, entity)
	end
end)

--[[
nut.command.add("markersave", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			PLUGIN:SaveMarkers()
			
			client:notify((#PLUGIN.markers).. " markers saved.")
		end
	end
})
--]]