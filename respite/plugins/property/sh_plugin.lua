local PLUGIN = PLUGIN
PLUGIN.name = "Zones"
PLUGIN.author = " "
PLUGIN.desc = "A library for assigning zones that can be used for things."

PLUGIN.zones = PLUGIN.zones or {}

--[[
	Zone = {
		doors = {}, --optional
		bounds = {min,max},
		entities = {}, --use this for jobs possibly
		owner = charID, --for owning houses permanently
	}
--]]

if(SERVER) then
	function PLUGIN:GetZone(zoneID)
		return self.zones[zoneID]
	end
	
	function PLUGIN:AddZone(zoneData)
		PLUGIN.zones[zoneData.uid or zoneData.name] = zoneData
	end
	
	function PLUGIN:GetNearestZone(pos)
		local dist = math.huge
		local nearest
	
		for zoneID, zoneData in pairs(self.zones) do
			local min, max = zoneData.bounds[1], zoneData.bounds[2]
			
			local center = (max-min)*0.5
			
			local checkDist = pos:DistToSqr(center)
			if(checkDist < dist) then
				dist = checkDist
				nearest = zoneID
			end
		end
		
		return nearest
	end
	
	function PLUGIN:CanZoneAddEntity(zoneID, entity)
		local blacklist = {
			["nut_storage"] = true,
		}
		
		local class = entity:GetClass()
		
		if(blacklist[class]) then
			return false
		end
	
		return true
	end
	
	function PLUGIN:AddZoneEntity(zoneID, entity)
		local zone = PLUGIN:GetZone(zoneID)
		
		if(zone and IsValid(entity)) then
			local canZoneAddEntity = PLUGIN:CanZoneAddEntity(zoneID, entity)
		
			if(canZoneAddEntity) then
				if(entity.OnZoneAdded) then
					entity:OnZoneAdded(zoneID)
				end
			
				local entityData = {
					class = entity:GetClass(),
					pos = entity:GetPos(),
					ang = entity:GetAngles(),
				}
			
				local entities = zone.entities or {}
				table.insert(entities, entityData)
				zone.entities = entities
				
				--reload them. for ownership stuff
				PLUGIN:LoadZoneEntities(zoneID)
			end
		end
	end
	
	function PLUGIN:RemoveZoneEntity(zoneID, entityIndex)
		local zone = PLUGIN:GetZone(zoneID)
		
		if(zone and IsValid(entity)) then
			local canZoneAddEntity = PLUGIN:CanZoneAddEntity(zoneID, entity)
		
			if(canZoneAddEntity) then
				if(entity.OnZoneAdded) then
					entity:OnZoneAdded(zoneID)
				end
			
				local entityData = {
					class = entity:GetClass(),
					pos = entity:GetPos(),
					ang = entity:GetAngles(),
				}
			
				local entities = zone.entities or {}
				table.remove(entities, entityIndex)
				zone.entities = entities
				
				--reload them. for ownership stuff
				PLUGIN:LoadZoneEntities(zoneID)
			end
		end
	end

	function PLUGIN:AddZoneDoor(zoneID, entity)
		local zone = PLUGIN:GetZone(zoneID)
		
		if(zone and IsValid(entity)) then
			local mapCreationID = entity:MapCreationID()
			if(mapCreationID) then
				local doorData = {}
				
				local doors = zone.doors or {}
				doors[mapCreationID] = doorData
				
				--reload them. for ownership stuff
				PLUGIN:LoadZoneDoors(zoneID)
			end
		end
	end
	
	function PLUGIN:RemoveZoneDoor(zoneID, entity)
		local zone = PLUGIN:GetZone(zoneID)
		
		if(zone and IsValid(entity)) then
			local mapCreationID = entity:MapCreationID()
			if(mapCreationID) then
				zone.doors[mapCreationID] = nil
			end
		end
	end

	function PLUGIN:RemoveZone(zoneID)
		PLUGIN.zones[zoneID] = nil
	end

	function PLUGIN:SaveData()
		self:setData(self.zones)
	end

	function PLUGIN:LoadData()
		pcall(function()
			self.zones = self:getData()
			
			self:LoadZones()
		end)
	end
	
	function PLUGIN:LoadZoneEntities(zoneID, fullLoad)
		local zone = PLUGIN:GetZone(zoneID)
		if(!zone) then return end
		
		if(zone.entities) then
			--spawn the entities, if they need it
			--run whatever functions we need to
		end
	end
	
	--loads, or updates a zones doors
	function PLUGIN:LoadZoneDoors(zoneID, fullLoad)
		local zone = PLUGIN:GetZone(zoneID)
		if(!zone) then return end
		
		if(zone.doors) then
			for k, v in pairs(v.doors) do
				local door = ents.GetMapCreatedEntity(k)
				if(IsValid(door)) then
					if(zone.owner) then
						--if zone has owner then set door ownership to whoever owns the zone,
					else
						--set doors as unowned
					end
				end
			end
		end
	end
	
	function PLUGIN:LoadZones()
		for zoneID, zoneData in pairs(self.zones) do
			PLUGIN:LoadZoneEntities(zoneID, true)
			PLUGIN:LoadZoneDoors(zoneID, true)
		end
	end

	netstream.Hook("zoneEdit", function(client, areaID, editData)
		-- Only Admin can edit the area.
		if (!client:IsAdmin()) then
			return false
		end

		-- If area is valid, merge editData to areaData.
		local areaData = table.Copy(PLUGIN:GetZone(areaID))

		if (areaData) then
			client:notifyLocalized("areaModified", areaID)

			PLUGIN.zones[areaID] = table.Merge(areaData, editData)
			PLUGIN:saveAreas()
		end
	end)

	netstream.Hook("zoneTeleport", function(client, areaID, editData)
		-- Only Admin can do this.
		if (!client:IsAdmin()) then
			return false
		end

		local zoneData = PLUGIN:GetZone(areaID)--table.Copy(nut.area.getArea(areaID))

		if (zoneData) then
			local min, max = zoneData.bounds[1], zoneData.bounds[2]
			
			client:SetPos(min + (max - min)/2)
		end
	end)

	netstream.Hook("zoneAdd", function(client, name, vector1, vector2)
		-- Only Admin can edit the area.
		if (!client:IsAdmin() or !vector1 or !vector2 or !name) then
			return false
		end

		local areaData = {
			uid = os.time(),
			name = name,
			bounds = {vector1, vector2},
		}

		PLUGIN:AddZone(areaData)
	end)

	netstream.Hook("zoneRemove", function(client, areaID, editData)
		-- Only Admin can edit the area.
		if (!client:IsAdmin()) then
			return false
		end

		-- If area is valid, merge editData to areaData.
		local areaData = table.Copy(PLUGIN:GetZone(areaID))
		if (areaData) then
			client:notifyLocalized("areaRemoved", areaID)

			PLUGIN.areaTable[areaID] = nil
			PLUGIN:saveAreas()
		end
	end)
else --CLIENT
	netstream.Hook("nutZoneSync", function(zones)
		--print("nutZoneSync")
		--PrintTable(zones)
	
		PLUGIN.zones = zones
	end)
end

nut.command.add("zonemanager", {
	adminOnly = true,
	onRun = function(client, arguments)
		if (client:Alive()) then
			netstream.Start(client, "nutZoneManager", PLUGIN.zones)
		end
	end
})