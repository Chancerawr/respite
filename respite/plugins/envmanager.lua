local PLUGIN = PLUGIN
PLUGIN.name = "Environment Manager"
PLUGIN.author = "Chancer"
PLUGIN.desc = "It does some environmental things."
PLUGIN.thinkTime = 2
PLUGIN.spawnDelay = 1
PLUGIN.spawns = {}

nut.config.add("env_enabled", true, "Whether or not the environmental manager is on.", nil, {
	category = "Environmental Manager"
})

nut.config.add("env_thinkTime", 3600, "Rate at which items may turn into NPCs.", nil, {
	data = {min = 1, max = 84600},
	category = "Environmental Manager"
})

nut.config.add("env_spawnDelay", 5, "How much time there is between the warning the and npc spawn.", nil, {
	data = {min = 1, max = 84600},
	category = "Environmental Manager"
})

nut.config.add("env_maxSpawns", 10, "Max NPCs that are allowed to be created by this plugin at one time.", nil, {
	data = {min = 1, max = 84600},
	category = "Environmental Manager"
})

local function spawnNPC(npc, position)
	local ent = ents.Create(npc)
	if (ent:IsValid()) then
		ent:SetPos(position)
		ent:Spawn()
		
		table.insert(PLUGIN.spawns, ent)
		
		return ent
	end
end

--looks through the items on the map, and turns some of them into npcs
local function itemNPCs()
	local dolls = {
		"resp_dolly", 
		"resp_baby"
	}

	local shades = {
		"nz_undead_shade"
	}
	
	local wraiths = {
		"nz_phantom"
	}

	local items = ents.FindByClass("nut_item")
			
	for k, v in pairs(items) do
		local itemTable = v:getItemTable()
	
		if(itemTable and itemTable.uniqueID == "j_baby_doll") then
			if(v.mark) then --only converts marked objects (this means it'll take two thinks to turn an item into an npc)
				v.mark = false --not really necessary
				
				nut.chat.send(v, "it", "The baby doll begins to twist and contort, becoming something more sinister.")
				v:EmitSound("hczombie/ropp.wav")
				
				--delayed so that people have some time to react basically.
				timer.Simple(nut.config.get("env_spawnDelay", 5), function()
					SafeRemoveEntity(v)
					spawnNPC(table.Random(dolls), v:GetPos())
				end)
				
				break
			else
				v.mark = true
			end
		end
		
		if(itemTable and itemTable.uniqueID == "drug_depress") then
			if(v.mark) then --only converts marked objects (this means it'll take two thinks to turn an item into an npc)
				v.mark = false --not really necessary
				
				nut.chat.send(v, "it", "The depressants fade away into nothingness.")
				v:EmitSound("ambient/wind/wind_hit1.wav", 75, 60)
				
				--delayed so that people have some time to react basically.
				timer.Simple(nut.config.get("env_spawnDelay", 5), function()
					SafeRemoveEntity(v)
					spawnNPC(table.Random(shades), v:GetPos())
				end)
				
				break
			else
				v.mark = true
			end
		end		
		
		if(itemTable and itemTable.uniqueID == "ichor") then
			if(v.mark) then --only converts marked objects (this means it'll take two thinks to turn an item into an npc)
				v.mark = false --not really necessary
				
				nut.chat.send(v, "it", "The ichor frees itself from its container and takes a humanoid form.")
				v:EmitSound("ambient/wind/wind_hit1.wav", 75, 60)
				
				--delayed so that people have some time to react basically.
				timer.Simple(nut.config.get("env_spawnDelay", 5), function()
					SafeRemoveEntity(v)
					spawnNPC(table.Random(wraiths), v:GetPos())
				end)
				
				break
			else
				v.mark = true
			end
		end
	end
end

local function playerHandle()
	local players = player.GetAll()
	
	local ranPlayer = table.Random(players)
	
	if(!ranPlayer or !ranPlayer:getChar()) then return end --dont do it to people not on chars.
	
	local nearby = ents.FindInSphere(ranPlayer:GetPos(), 2000)
	table.RemoveByValue(nearby, ranPlayer)
	
	local alone = true
	for k, v in pairs(nearby) do
		if(v:IsPlayer()) then
			alone = false
		end
	end
	
	--they're near people, so don't do anything to them.
	if(alone) then
		--[[
		ranPlayer:ConCommand("mat_corrupt")
		
		timer.Simple(2, function() 
			ranPlayer:ConCommand("mat_repair")
		end)
		--]]
	end
end

if SERVER then
	function PLUGIN:Think()
		if(!nut.config.get("env_enabled", false)) then return end
		if(#player.GetAll() < 1) then return end -- do nothing if there's no players
		if(!self.nextThink) then self.nextThink = 0 end
		
		if(self.nextThink < CurTime()) then
			for k, v in pairs(PLUGIN.spawns) do
				if (!IsValid(v)) then
					table.RemoveByValue(PLUGIN.spawns, v)
				end
			end
			
			if(#PLUGIN.spawns < nut.config.get("env_maxSpawns", 20)) then
				itemNPCs()
			end
			
			playerHandle()
			
			self.nextThink = self.nextThink + (nut.config.get("env_thinkTime", 3600))
		end
	end

	function PLUGIN:LoadData()
		self.spawnpoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.spawnpoints)
	end
end