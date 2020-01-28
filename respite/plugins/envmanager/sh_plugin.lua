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

nut.config.add("env_npcClean", false, "Whether or not to delete npcs when there's no players on.", nil, {
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

--env manager will leave people in these factions alone
timer.Simple(1, function() --this timer makes it so it sets this after the factions are loaded, kind of annoying.
	PLUGIN.factions = {
		--i put these numbers here to stop errors if these factions don't exist
		[FACTION_SHADE or 99] = true,
		[FACTION_ABOM or 100] = true,
		[FACTION_ABER or 101] = true
	}
end)

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
	
	for k, v in pairs(players) do
		local char = v:getChar()
	
		if(!char or v:GetMoveType() == MOVETYPE_NOCLIP or v:InVehicle()) then --don't screw with these people
			table.RemoveByValue(players, v)
		end

		if(char) then
			local faction = char:getFaction()
			if(PLUGIN.factions[faction]) then --doesn't mess with certain factions
				table.RemoveByValue(players, v)
			end
		end
	end
	
	--this runs through all legitimate players, and checks if they're near other players.
	--if they are, it ignores them
	--if they are not, then it marks them as "alone"
	--next think, if it detects that they are alone again, it will do things to them.
	--AKA there will be about 2 think times between each random spooky thing for any one player
	--I should think of a more efficient way to tell if someone is alone or not since this may get quite expensive.
	
	for k, v in pairs(players) do
		local nearby = ents.FindInSphere(v:GetPos(), 2000)
		table.RemoveByValue(nearby, v) --removes self

		local friend
		for k2, v2 in pairs(nearby) do
			if(v2:IsPlayer()) then
				v.alone = false
				v2.alone = false
				friend = true
				table.RemoveByValue(players, v2)
			end
		end
		
		if(!friend and v.alone) then
			if(math.random(1,10) < 8) then --higher chance to do a less severe thing
				table.Random(PLUGIN.minorSpooks)(v)
			else --lower chance to do a really annoying thing
				table.Random(PLUGIN.majorSpooks)(v)
			end		
		elseif(!friend and !v.alone) then
			v.alone = true
		end
	end

	--since it just checks a single random player, its a lot less likely to get one when there's many on
end

if SERVER then
	function PLUGIN:Think()
		if(!nut.config.get("env_enabled", false)) then return end		
		if(!self.nextThink) then self.nextThink = 60 end
		
		if(self.nextThink < CurTime()) then
			self.nextThink = self.nextThink + (nut.config.get("env_thinkTime", 3600))
			
			local players = player.GetAll()
			if(#players < 1) then 
				if(nut.config.get("env_npcClean", false) and #players == 0) then
					for k, v in pairs(ents.GetAll()) do
						if (IsValid(v) and (v:IsNPC() or v.chance)) then
							v:Remove()
						end
					end
				end
			
				return --don't need to do anything else if there's no players
			end
		
			for k, v in pairs(PLUGIN.spawns) do
				if (!IsValid(v)) then
					table.RemoveByValue(PLUGIN.spawns, v)
				end
			end
			
			if(#PLUGIN.spawns < nut.config.get("env_maxSpawns", 20)) then
				itemNPCs()
			end
			
			playerHandle()
		end
	end

	function PLUGIN:LoadData()
		self.spawnpoints = self:getData() or {}
	end

	function PLUGIN:SaveData()
		self:setData(self.spawnpoints)
	end
end

nut.command.add("env_move", {
	adminOnly = true,
	onRun = function(client, arguments)
		local position = client:GetEyeTrace().HitPos
		
		local prop = ents.Create("prop_physics")
		prop:SetPos(position)
		
		for k, v in pairs(ents.GetAll())do
			if(v.chance and IsValid(v)) then
				local oldRad = v.SearchRadius
				v.SearchRadius = 10000
				v:SetEnemy(prop, 10)
				
				timer.Simple(0.5, function()
					if(IsValid(v) and !v.Enemy) then
						v.SearchRadius = oldRad
						SafeRemoveEntity(prop)
					end
				end)
			end
		end
	end
})

nut.util.include("sh_spooks.lua")