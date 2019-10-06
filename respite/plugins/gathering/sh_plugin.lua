local PLUGIN = PLUGIN
PLUGIN.name = "Gathering"
PLUGIN.author = "La Corporativa"
PLUGIN.desc = "Adds resources and ways to get them."
PLUGIN.spawnedGathers = PLUGIN.spawnedGathers or {}
PLUGIN.gatherPoints = PLUGIN.gatherPoints or {}

nut.config.add("gathering", true, "Whether gathering is active or not.", nil, {
	category = "Gathering"
})

nut.config.add("gDamage", true, "Whether the trees and rocks will deplete from gathering resources from them", nil, {
	category = "Gathering"
})

nut.config.add("gatheringSpawn", 3600, "How much time it will take for a gathering entity to spawn.", nil, {
	data = {min = 1, max = 84600},
	category = "Gathering"
})

nut.config.add("gMaxWorldGather", 12, "Number of gathering entitites the World will have.", nil, {
	data = {min = 1, max = 50},
	category = "Gathering"
})

nut.config.add("lifeDrain", 10, "How much life will be drain from the entities that are being gathered.", nil, {
	category = "Gathering",
	data = {min=1, max=200}
})

nut.config.add("treeLife", 150, "How much life the trees will have.", nil, {
	category = "Gathering",
	data = {min=1, max=2000}
})

nut.config.add("rockLife", 100, "How much life the rocks will have.", nil, {
	category = "Gathering",
	data = {min=1, max=2000}
})

local gatherItems = {
	["crystal"] = true,
	["tree"] = true,
	["tree_dark"] = true,
	["car"] = true,
	["memory"] = true,
	["concrete"] = true,
	
	["plant_berry"] = true,
	["plant_blight"] = true,
	["plant_blood"] = true,
	["plant_ichor"] = true,
	["plant_mem"] = true,
	["plant_mushroom"] = true,
	["plant_searing"] = true,
	["plant_purple"] = true,
	["plant_tea"] = true
}

if SERVER then
	function PLUGIN:SaveData()
		self:setData(self.gatherPoints)
	end

	function PLUGIN:LoadData()
		self.gatherPoints = self:getData()
		self:Initialize()
	end

	function PLUGIN:Initialize()
		if nut.config.get("gathering") then
			for k, v in pairs(self.gatherPoints) do
				self:setGathering(v)
			end
		end
	end

	local gatherSpawnTime = CurTime()
	function PLUGIN:Think()
		if nut.config.get("gathering") then
			self:removeInvalidGathers()
			if (#self.spawnedGathers <= nut.config.get("gMaxWorldGather")) then
				if (gatherSpawnTime <= CurTime()) then
					local point = table.Random(self.gatherPoints)
					
					if (!point) then return end

					for _, v in pairs(self.spawnedGathers) do
						if point == v[2] then 
							gatherSpawnTime = gatherSpawnTime + nut.config.get("gatheringSpawn")
							return 
						end
					end

					if #self.spawnedGathers >= nut.config.get("gMaxWorldGather") then return end
					
					self:setGathering(point)
					
					gatherSpawnTime = gatherSpawnTime + nut.config.get("gatheringSpawn")
				end
			end
		end
	end

	function PLUGIN:setGathering(point)
		if(!istable(point[2])) then
			local entity = ents.Create("nut_"..point[2])
			
			if(IsValid(entity)) then
				entity:SetPos(point[1])

				entity:Spawn()
				table.insert(self.spawnedGathers, {entity, point})
			else
				table.RemoveByValue(self.gatherPoints, point)
			end
		else
			local entity = ents.Create("nut_"..table.Random(point[2]))
			if(IsValid(entity)) then
				entity:SetPos(point[1])
				entity:Spawn()
				
				table.insert(self.spawnedGathers, {entity, point})
			else
				table.RemoveByValue(self.gatherPoints, point)
			end
		end
	end

	function PLUGIN:removeInvalidGathers()
		for k, v in ipairs(self.spawnedGathers) do
			if !IsValid(v[1]) then
				table.remove(self.spawnedGathers, k)
			end
		end
	end
end

netstream.Hook("nut_displayGatherSpawnPoints", function(data)
	for k, v in pairs(data) do
		local emitter = ParticleEmitter(v[1])
		local smoke = emitter:Add("sprites/glow04_noz", v[1])
		smoke:SetVelocity(Vector(0, 0, 1))
		smoke:SetDieTime(15)
		smoke:SetStartAlpha(255)
		smoke:SetEndAlpha(255)
		smoke:SetStartSize(64)
		smoke:SetEndSize(64)
		smoke:SetColor(255,0,0)
		smoke:SetAirResistance(300)
	end
end)

nut.command.add("gatherspawnadd", {
	adminOnly = true,
	syntax = "<string entity>",
	onRun = function(client, arguments)
		if (!arguments[1]) then
			return "@lc_noEntity"
		end

		if(gatherItems[arguments[1]]) then
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + Vector(trace.HitNormal*5)
			
			table.insert(PLUGIN.gatherPoints, {hitpos, arguments[1]})
			PLUGIN:setGathering(PLUGIN.gatherPoints[#PLUGIN.gatherPoints])
			
			client:notifyLocalized("lc_gatherSpawn")
		else
			client:notify("Invalid entity.")
		end
	end
})

nut.command.add("gatherspawnaddgroup", {
	adminOnly = true,
	syntax = "<string entities>",
	onRun = function(client, arguments)
		if (!arguments[1]) then
			return "@lc_noEntity"
		end

		local group = {}
		for k, v in pairs(arguments) do
			if(gatherItems[v]) then
				table.insert(group, v)
			end
		end
		
		if(gatherItems[arguments[1]] and #group > 0) then
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + Vector(trace.HitNormal*5)
			
			table.insert(PLUGIN.gatherPoints, {hitpos, group})
			PLUGIN:setGathering(PLUGIN.gatherPoints[#PLUGIN.gatherPoints])
			
			client:notifyLocalized("Gather group successfully added.")
		end
	end
})

nut.command.add("gatherspawnremove", {
	adminOnly = true,
	syntax = "<number distance>",
	onRun = function(client, arguments)
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local range = arguments[1] or 128
		local count = 0
		for k, v in pairs(PLUGIN.gatherPoints) do
			local distance = v[1]:Distance(hitpos)
			if distance <= tonumber(range) then
				PLUGIN.gatherPoints[k] = nil
				count = count+1
			end
		end
		client:notifyLocalized("lc_removedSpawners", count)
	end
})

nut.command.add("gatherspawndisplay", {
	adminOnly = true,
	onRun = function(client)
		if SERVER then
			netstream.Start(client, "nut_displayGatherSpawnPoints", PLUGIN.gatherPoints)
			client:notifyLocalized("lc_display")
		end
	end
})

--default models that can work for plants (hl2 & css)
--[[
Gathering - plants
	models/props/cs_office/plant01_p1.mdl

	models/props/de_inferno/fountain_bowl_p6.mdl
	models/props/de_inferno/fountain_bowl_p7.mdl
	models/props/de_inferno/fountain_bowl_p8.mdl
	models/props/de_inferno/fountain_bowl_p9.mdl
	models/props/de_inferno/fountain_bowl_p10.mdl

	models/props/de_inferno/largebush01.mdl
	models/props/de_inferno/largebush02.mdl
	models/props/de_inferno/largebush03.mdl
	models/props/de_inferno/largebush04.mdl
	models/props/de_inferno/largebush05.mdl
	models/props/de_inferno/largebush06.mdl

	models/props/de_inferno/potted_plant3_p1.mdl
	models/props/de_inferno/potted_plant2_p1.mdl
	models/props/de_inferno/potted_plant1_p1.mdl

	models/props/de_inferno/claypot03_damage_01.mdl
--]]