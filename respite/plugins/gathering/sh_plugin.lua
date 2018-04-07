local PLUGIN = PLUGIN
PLUGIN.name = "Gathering"
PLUGIN.author = "La Corporativa"
PLUGIN.desc = "Adds resources and ways to get them."
PLUGIN.resEntities = {"nut_tree", "nut_rock"}
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
	["crystal"] = {
		["default"] = {
			["iron_ore"] = 10,
			["coal"] = 3,
			["sulphur"] = 3,
			["iron_copper"] = 8
		}
	},
	["tree"] = {
		["default"] = {
			["wood"] = 15
		}
	},	
	["tree_dark"] = {
		["default"] = {
			["wood"] = 15
		}
	},
	["car"] = {
		["default"] = {
			["metal"] = 15
		}
	},
	["portal"] = {
		["default"] = {
			["metal"] = 15
		}
	},
	["concrete"] = {
		["default"] = {
			["metal"] = 15
		}
	}
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
				if gatherSpawnTime <= CurTime() then
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

	local function getRandomModel()
		local trees = {
			"models/props_foliage/tree_poplar_01.mdl",
			"models/props_foliage/tree_springers_01a-lod.mdl",
			"models/props_foliage/tree_springers_01a.mdl",
			"models/props_foliage/tree_deciduous_03b.mdl",
			"models/props_foliage/tree_deciduous_03a.mdl",
			"models/props_foliage/tree_deciduous_02a.mdl",
			"models/props_foliage/tree_deciduous_01a.mdl",
			"models/props_foliage/tree_deciduous_01a-lod.mdl",
			"models/props_foliage/tree_cliff_01a.mdl",
		}
		local random = math.random(1,table.getn(trees))
		return trees[random]
	end

	function PLUGIN:setGathering(point)
		local entity = ents.Create("nut_"..point[2])
		entity:SetPos(point[1])
		entity:setNetVar("resTable", point[3])
		entity:SetAngles(entity:GetAngles())

		if (point[2] == "rock") then
			entity:SetModel("models/props_wasteland/rockgranite02a.mdl")
		elseif (point[2] == "tree") then
			entity:SetModel(getRandomModel())
		end

		entity:Spawn()
		table.insert(self.spawnedGathers, {entity, point})
	end

	function PLUGIN:removeInvalidGathers()
		for k, v in ipairs(self.spawnedGathers) do
			if !IsValid(v[1]) then
				table.remove(self.spawnedGathers, k)
			end
		end
	end
end

local function give(client, item)
	local given = false
	given = client:getChar():getInv():add(item.uniqueID)
	return given
end

local function getGatheredItem(client, ent)
	local randomZ = math.Rand(0,100)
	local localProb = 0
	for k, v in pairs(gatherItems[string.sub(ent:GetClass(), 5)]) do
		if k == ent:getNetVar("resTable") then
			for k2,v2 in pairs(v) do
				-- randomZ must be between localProb and the sum of the localProb and the probability of each good
				if localProb <= randomZ and (v2+localProb) > randomZ then
					return k2
				end
				localProb = localProb + v2
			end
		end
	end
	return nil
end

local function getItemEntity(item)
	for k, v in SortedPairs(nut.item.list) do
		if (item == v.uniqueID) then
			return v
		end
	end
	return nil
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
	syntax = "<string entity> <string table>",
	onRun = function(client, arguments)
		if (!arguments[1]) then
			return "@lc_noEntity"
		end
		if (!arguments[2]) then
			return "@lc_noTable"
		else
			for k, v in pairs(gatherItems[arguments[1]]) do
				if k == arguments[2] then
					local trace = client:GetEyeTraceNoCursor()
					local hitpos = trace.HitPos + Vector(trace.HitNormal*5)
					table.insert(PLUGIN.gatherPoints, {hitpos, arguments[1], arguments[2]})
					PLUGIN:setGathering(PLUGIN.gatherPoints[#PLUGIN.gatherPoints])
					client:notifyLocalized("lc_gatherSpawn")
				else
					client:notifyLocalized("lc_noTableName")
				end
			end
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
