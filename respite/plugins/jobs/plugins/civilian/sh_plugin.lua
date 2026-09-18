local PLUGIN = PLUGIN
PLUGIN.name = "Civilians"
PLUGIN.author = " "
PLUGIN.desc = "Civilians that do things."

PLUGIN.spawns = PLUGIN.spawns or {}

if(SERVER) then
	PLUGIN.civData = {
		["hungry"] = {
			tagChance = 25,
			items = {
				"cook_meal",
				"cook_sandwich",
				"cook_soup",
				"cook_smoothie",
				"cook_drink_mixed",
				"cook_stew",
				"cook_sausage",
				"cook_patty",
				"cook_steak",
				"cook_sushi",
				"cook_kebab",
				"cook_sticks",
				"cook_tartare",
				"cook_pie",
				"cook_cupcake",
				"cook_muffin",
				"cook_cake",
				"cook_salad",
				--"food_tea",
				--"food_cheese",
				"cook_pizza1",
				"cook_pizza2",
			},
			tags = {
				"Fruit",
				"Vegetable",
				"Alcohol",
				"Meat",
				"Cheese",
				--"Milk",
				--"Sour",
				--"Sweet",
				--"Salty",
			},
			reward = function()
				local rewardType
				local rewardAmt
			
				local roll = math.random(1,3)
				
				if(roll == 1) then
					rewardType = "money"
					rewardAmt = math.random(10,40)
				elseif(roll == 2) then
					rewardType = "cube_chip"
					rewardAmt = math.random(1,3)
				else
					rewardType = "j_dollar"
					rewardAmt = math.random(2,6)
				end
			
				return rewardType, rewardAmt
			end,
			--[[
			spawnPos = {
				Vector(2884.515137, -2859.053223, 760.031250),
				Vector(2274.458252, -2845.041016, 760.031250),
				Vector(-1599.122925, 128.311707, 696.031250),
				Vector(3885.035645, 1586.888916, 664.031250),
				Vector(3383.535645, 1630.092529, 664.031250),
				Vector(-2389.186768, 2387.282715, 839.622070),
				Vector(-2412.772461, 2106.682373, 840.027405),
			},
			standPos = {
				Vector(756.971802, -1461.968750, 712.031250),
				Vector(712.268311, -1461.973511, 712.031250),
				Vector(710.853333, -1396.269531, 712.031250),
			},
			exitPos = {
				Vector(2884.515137, -2859.053223, 760.031250),
				Vector(2274.458252, -2845.041016, 760.031250),
				Vector(-1599.122925, 128.311707, 696.031250),
				Vector(3885.035645, 1586.888916, 664.031250),
				Vector(3383.535645, 1630.092529, 664.031250),
				Vector(-2389.186768, 2387.282715, 839.622070),
				Vector(-2412.772461, 2106.682373, 840.027405),
			},
			--]]
		},
	}
end

function PLUGIN:GetCivilianSpawn(job)
	--recode this and cache it for speed
	local spawns = ents.FindByClass("resp_civilian_spawn")
	local ranSpawn = spawns[math.random(#spawns)]

	local pos
	if(ranSpawn) then
		pos = ranSpawn:GetPos() --navmesh.GetNearestNavArea(ranSpawn:GetPos(), true)
	end

	return pos
end

function PLUGIN:GetCivilianExit(job)
	--recode this and cache it for speed
	local spawns = ents.FindByClass("resp_civilian_exit")
	local ranSpawn = spawns[math.random(#spawns)]

	local pos
	if(ranSpawn) then
		pos = ranSpawn:GetPos() --navmesh.GetNearestNavArea(ranSpawn:GetPos(), true)
	end

	return pos
end

function PLUGIN:GetCivilianStand(job)
	--recode this and cache it for speed
	local spawns = ents.FindByClass("resp_civilian_stand")
	local ranSpawn = spawns[math.random(#spawns)]

	local pos
	if(ranSpawn) then
		pos = ranSpawn:GetPos() --navmesh.GetNearestNavArea(ranSpawn:GetPos(), true)
	end

	return pos
end

function PLUGIN:GetCivilianItem(job)
	local item

	if(job == "hungry") then
		items = {
			"cook_meal",
			"cook_sandwich",
			"cook_soup",
			"cook_smoothie",
			"cook_drink_mixed",
			"cook_stew",
			"cook_sausage",
			"cook_patty", --doesnt go well with tags
			"cook_steak",
			"cook_sushi",
			"cook_kebab",
			"cook_sticks",
			"cook_tartare",
			"cook_pie",
			"cook_cupcake",
			"cook_muffin",
			"cook_cake",
			"cook_salad",
			--"food_tea",
			--"food_cheese",
			"cook_pizza1",
			"cook_pizza2",
		}
		
		item = table.Random(items)
	else
		local spawngroup = nut.plugin.list["worlditemspawner"].spawngroups[job] or {"food_banana"}
	
		item = table.Random(spawngroup)
	end
	
	return item
end

function PLUGIN:GetCivilianReward(job)
	local rewardType
	local rewardAmt

	local roll = math.random(1,3)
	
	if(roll == 1) then
		rewardType = "money"
		rewardAmt = math.random(10,40)
	elseif(roll == 2) then
		rewardType = "cube_chip"
		rewardAmt = math.random(1,3)
	else
		rewardType = "j_dollar"
		rewardAmt = math.random(2,6)
	end

	return rewardType, rewardAmt
end

function PLUGIN:GenerateRequest(job)
	local civData = PLUGIN.civData[job] or {}

	local requestData = {}
	
	local item = PLUGIN:GetCivilianItem(job)--table.Random(civData.items)
	
	requestData.item = item
	
	if(civData.tagChance) then
		local roll = math.random(1, 100)
		if(roll <= civData.tagChance) then
			local ranTag = table.Random(civData.tags)
		
			requestData.tags = {ranTag}
		end
	end
	
	return requestData
end

function PLUGIN:CreateCivilian(job)
	--local civData = PLUGIN.civData[job]
	
	local spawnPos = PLUGIN:GetCivilianSpawn() --table.Random(civData.spawnPos)
	if(!spawnPos) then return end
	
	local civilian = ents.Create("resp_civilian")
	civilian:SetPos(spawnPos)
	civilian:Spawn()
	
	--sets the thing they want
	local request = PLUGIN:GenerateRequest(job)
	civilian:SetRequest(request)
	
	local rewardType, rewardAmt = PLUGIN:GetCivilianReward(job)
	
	if(rewardType) then
		if(request.tags) then
			rewardAmt = math.Round(rewardAmt * 1.5)
		end
		
		civilian:SetReward(rewardType, rewardAmt)
	end
	
	local name = nut.plugin.list["randomname"]:generateName()
	civilian:SetCharacterName(name)
	
	timer.Simple(0, function()
		local standPos = PLUGIN:GetCivilianStand() --table.Random(civData.standPos)
		civilian:SetStandPos(standPos)
		
		local exitPos = PLUGIN:GetCivilianExit()--table.Random(civData.exitPos)
		civilian:SetExitPos(exitPos)
	end)
end

PLUGIN.entities = PLUGIN.entities or {}

if(SERVER) then
	function PLUGIN:SaveEntities()
		local data = {}
	
		for k, v in ipairs(PLUGIN.entities) do
			if(!IsValid(v)) then continue end

			local entData = {
				class = v:GetClass(),
				pos = v:GetPos(),
				ang = v:GetAngles(),
			}
		
			table.insert(data, entData)
		end

		self:setData(data)
	end
		
	function PLUGIN:LoadEntities()
		self.savedEnts = self:getData()
		
		for k, v in pairs(self.savedEnts) do
			local marker = ents.Create(v.class)
			marker:SetPos(v.pos)
			marker:SetAngles(v.ang)
			marker:Spawn()
		end
	end

	function PLUGIN:LoadData()
		pcall(function()
			PLUGIN:LoadEntities()
			self.loadedData = true
		end)
	end
	
	PLUGIN.EntTypes = {
		["resp_civilian_exit"] = true,
		["resp_civilian_spawn"] = true,
		["resp_civilian_stand"] = true,
	}
	
	--caches markers so we can access them more efficiently
	function PLUGIN:OnEntityCreated(entity)
		local class = entity:GetClass()
		
		if(PLUGIN.EntTypes[class]) then
			table.insert(PLUGIN.entities, entity)
		end
	end

	--updates cache when entities are removed
	function PLUGIN:EntityRemoved(entity)
		local class = entity:GetClass()
		
		if(PLUGIN.EntTypes[class]) then
			table.RemoveByValue(PLUGIN.entities, entity)
		end
	end
end

--removes all the civilians that exist
nut.command.add("cleancivilians", {
	adminOnly = true,
	onRun = function(client, arguments)
		for k, v in ipairs(ents.FindByClass("resp_civilian")) do
			v:Remove()
		end
		
		client:notify("Cleaned all civilians.")
	end
})

--removes all the civilians that exist
nut.command.add("createcivilian", {
	adminOnly = true,
	onRun = function(client, arguments)
		local type = arguments[1]
	
		PLUGIN:CreateCivilian(type or "hungry")
	end
})