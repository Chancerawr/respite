local PLUGIN = PLUGIN

PLUGIN.turns = PLUGIN.turns or {}

--[[
--just some default turn tables for convenience
PLUGIN.turns[1] = {
	name = "Combat 1",
	entities = {

	},
	order = {
		[1] = "Adventurer",
		[2] = "Monster",
	},
	current = 1,
}

PLUGIN.turns[2] = {
	name = "Combat 2",
	entities = {
	
	},
	order = {
		[1] = "Adventurer",
		[2] = "Enemy",
	},
	current = 1,
}
--]]

PLUGIN.turns[1] = {
	name = "Combat 1",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[2] = {
	name = "Combat 2",
	entities = {

	},
	order = {
		[1] = "Player",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[3] = {
	name = "Combat 3",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[4] = {
	name = "Combat 4",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[5] = {
	name = "Combat 5",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[6] = {
	name = "Combat 6",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[7] = {
	name = "Combat 7",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[8] = {
	name = "Combat 8",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[9] = {
	name = "Combat 9",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

PLUGIN.turns[10] = {
	name = "Combat 10",
	entities = {

	},
	order = {
		[1] = "Drifter",
		[2] = "Enemy",
	},
	current = 1,
}

--adds an entity to a turn table
function PLUGIN:turnAdd(id, entity, team)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	PLUGIN.turns[id]["entities"] = PLUGIN.turns[id]["entities"] or {}
	
	PLUGIN.turns[id]["entities"][entity] = team --adds the entity to the table
	
	--entity:restoreAP()
end

--adds a team to a turn table
function PLUGIN:turnAddTeam(id, team)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	PLUGIN.turns[id]["order"] = PLUGIN.turns[id]["order"] or {}
	
	PLUGIN.turns[id]["order"][#PLUGIN.turns[id]["order"] + 1] = team --adds the team to the ordering table
end

--returns every member of the specified team in the table
function PLUGIN:turnGetTeam(id, team)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	PLUGIN.turns[id]["order"] = PLUGIN.turns[id]["order"] or {}
	
	local members = {}
	for k, v in pairs(PLUGIN.turns[id]["entities"]) do
		if(string.lower(v) == string.lower(team)) then
			members[k] = v
		end
	end
	
	return members
end

--removes an entity from a turn table
function PLUGIN:turnRemove(id, entity)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	PLUGIN.turns[id]["entities"] = PLUGIN.turns[id]["entities"] or {}

	PLUGIN.turns[id]["entities"][entity] = nil
end

--removes a team from a turn table
function PLUGIN:turnRemoveTeam(id, teamID)
	PLUGIN.turns[id] = PLUGIN.turns[id] or {}
	PLUGIN.turns[id]["order"] = PLUGIN.turns[id]["order"] or {}
	
	PLUGIN.turns[id]["order"][teamID] = nil --adds the team to the ordering table
end

--advances the specified turn to the next team
function PLUGIN:turnAdvance(id, cur)
	local turn = PLUGIN.turns[id]
	if(!turn) then
		return false
	end
	
	if(!cur) then
		cur = turn.current
	end
	
	local newTurnID = (cur + 1) 
	if(newTurnID > #turn.order) then
		newTurnID = 1
	end
	
	local oldTurn = turn.order[cur]
	local newTurn = turn.order[newTurnID] --String name for whose turn it is
	
	turn.current = newTurnID
	
	for entity, team in pairs(turn.entities) do
		if(!IsValid(entity)) then continue end
	
		if(newTurn == turn.order[team]) then
			entity:turnProcess(newTurn, true) --each entity processes its turn	
		else
			entity:turnProcess(newTurn, false) --each entity processes its turn
		end
	end

	return newTurn
end	

--finds a turn table by its name
function PLUGIN:turnByName(name)
	local id
	for k, v in pairs(PLUGIN.turns) do
		if(string.lower(v.name) == string.lower(name)) then
			id = k
			break
		elseif(string.find(string.lower(v.name), string.lower(name))) then
			id = k
		end
	end
	
	return PLUGIN.turns[id], id
end

--checks to see if a turn table has the specified team or something close to it
function PLUGIN:turnHasTeam(id, team)
	local findTeam

	local teams = PLUGIN.turns[id].order
	for k, v in pairs(teams) do
		if(string.lower(v) == string.lower(team)) then
			return v
		elseif(string.find(string.lower(v), string.lower(team))) then
			findTeam = v
		end
	end
	
	return findTeam
end

--gets the current turn in the ordering
function PLUGIN:turnCurrent(id)
	if(PLUGIN.turns[id]) then
		return PLUGIN.turns[id].current
	end
	
	return 1
end

local playerMeta = FindMetaTable("Player")

--processes turns
PLUGIN.helperFuncs["turnProcess"] = function(self, turn, you)

--function playerMeta:turnProcess(turn, you)
	if(you) then
		if(self:GetMoveType() != MOVETYPE_NOCLIP) then
			self:setNetVar("showAPCircle", self:GetPos() + self:GetUp()) --puts a circle centered at current location
		end
	
		--self:restoreAP()

		local buffs = self:getBuffs() or {}
		for buffID, buff in pairs(buffs) do
			if(buff.func) then
			
			end
		
			if(buff.dmg) then --damaging spells
				local dmgT = buff.dmgT or "Blunt"
				local dmg = self:receiveDamage(buff.dmg, dmgT) --gets the damage based on their resistances
				self:addHP(dmg * -1) --reduce their hp by the dmg
				
				nut.chat.send(self, "turnchat", "You have taken " ..buff.dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
				--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You have taken " ..dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
			end
			
			if(buff.dmgP) then --damaging spells
				local dmgT = buff.dmgT or "Blunt"
				
				local dmg = self:receiveDamage(buff.dmgP * self:getMaxHP(), dmgT) --gets the damage based on their resistances
				self:addHP(dmg * -1) --reduce their hp by the dmg
				
				nut.chat.send(self, "turnchat", "You have taken " ..buff.dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
				--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You have taken " ..dmg.. " {" ..dmgT.. "} damage from " ..(buff.name or "Unknown").. ".")
			end

			if(buff.duration) then --counts down the duration
				if(buff.duration <= 0) then
					self:removeBuff(buff, buff.uid)
					
					if(self:IsPlayer()) then
						nut.chat.send(self, "turnchat", (buff.name or "Unknown").. " has worn off.")
					end
					--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", (buff.name or "Unknown").. " has worn off.")
				else
					if(self:IsPlayer()) then
						nut.chat.send(self, "turnchat", "You are affected by " ..(buff.name or "Unknown").. " for " ..(buff.duration or "Unknown").. " more turns.")
					end
					--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "You are affected by " ..(buff.name or "Unknown").. " for " ..(buff.duration or "Unknown").. " more turns.")
					
					buff.duration = buff.duration - 1
					
					local netBuff = {
						uid = buff.uid,
						name = buff.name,
						duration = buff.duration,
					}
					
					local JSONTbl = util.TableToJSON(netBuff)
					
					--local turnPlayers = {}
					--for k, v in pairs(turnPlayers) do
						nut.plugin.list["combat"]:buffNetworkAll(self, self, JSONTbl, buffID)
					--end
				end
			end
		end	
		
		local cooldowns = self:getCooldowns() or {}
		for spell, duration in pairs(cooldowns) do
			duration = duration - 1
		
			if(duration <= 0) then
				self:removeCooldown(spell)
			else
				cooldowns[spell] = duration

				nut.plugin.list["combat"]:cdNetworkAll(self, spell, duration)
			end
		end
	
		if(turn) then
			if(self:IsPlayer()) then
				nut.chat.send(self, "turnchat", "Turn Change: " ..turn.. "'s turns. (YOU)")
			end
			
			--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "Turn Change: " ..turn.. "'s turns. (YOU)")
		end
	else
		self:setNetVar("showAPCircle", nil)
	
		if(turn) then
			if(self:IsPlayer()) then
				nut.chat.send(self, "turnchat", "Turn Change: " ..turn.. "'s turns.")
			end
			--nut.plugin.list["chatboxextra"]:ChatboxSend(self, "turnchat", "Turn Change: " ..turn.. "'s turns.")
		end
	end
end

--these are old and dont work properly with the current version
--[[
--advances to the next turn
nut.command.add("turnnext", {
	adminOnly = true,
	onRun = function(client, arguments)
		local turns = client:getNetVar("turns")
		local current = PLUGIN:turnCurrent(turns)

		local team = PLUGIN:turnAdvance(turns, current)
		
		if(team) then
			client:notify(team.. "'s turn.")
		end
	end
})

--adds a specific person to the current turn
nut.command.add("turnadd", {
	syntax = "<string target> <string team>",
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No team specified.")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local turns = client:getNetVar("turns")
			
			if(turns) then
				local team = PLUGIN:turnHasTeam(turns, arguments[2])
				
				if(team) then
					PLUGIN:turnAdd(turns, target, team)
					client:notify("Successfully added " ..target:Name().. ".")
				else
					client:notify("Invalid team specified.")
					return false
				end
			else
				client:notify("You have not selected a turn table, use /turnselect")
				return false
			end
		else
			client:notify("Invalid target specified.")
			return false
		end
	end
})

--adds a specific CEnt to the current turn
nut.command.add("turnaddcent", {
	syntax = "<string team>",
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No team specified.")
		end
		
		local target = client:GetEyeTrace().Entity
		if(IsValid(target) and target.combat) then
			local turns = client:getNetVar("turns")
			
			if(turns) then
				local team = PLUGIN:turnHasTeam(turns, arguments[1])
				
				if(team) then
					PLUGIN:turnAdd(turns, target, team)
					client:notify("Successfully added " ..target:Name().. ".")
				else
					client:notify("Invalid team specified.")
					return false
				end
			else
				client:notify("You have not selected a turn table, use /turnselect")
				return false
			end
		else
			client:notify("Look at a valid Combat Entity.")
			return false
		end
	end
})

--adds a specific person to the current turn
nut.command.add("turnaddcentarea", {
	syntax = "<number area> <string team>",
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No team specified.")
			return false
		end
		
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
	
		local turns = client:getNetVar("turns")
		
		if(turns) then
			local team = PLUGIN:turnHasTeam(turns, arguments[2])
			
			if(!team) then
				client:notify("Invalid team specified.")
				return false
			end
			
			local targets = ents.FindInSphere(hitpos, arguments[1] or 100)
			for k, target in pairs(targets) do
				if(IsValid(target) and target.combat) then
					PLUGIN:turnAdd(turns, target, team)
					client:notify("Successfully added " ..target:Name().. ".")
				end
			end
		else
			client:notify("You have not selected a turn table, use /turnselect")
			return false
		end
	end
})

--adds a specific person to the current turn
nut.command.add("turnaddarea", {
	syntax = "<number area> <string team>",
	adminOnly = true,
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No team specified.")
			return false
		end
		
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
	
		local turns = client:getNetVar("turns")
		
		if(turns) then
			local team = PLUGIN:turnHasTeam(turns, arguments[2])
			
			if(!team) then
				client:notify("Invalid team specified.")
				return false
			end
			
			local targets = ents.FindInSphere(hitpos, arguments[1] or 100)
			for k, target in pairs(targets) do
				if(IsValid(target) and target:IsPlayer()) then
					PLUGIN:turnAdd(turns, target, team)
					client:notify("Successfully added " ..target:Name().. ".")
				end
			end
		else
			client:notify("You have not selected a turn table, use /turnselect")
			return false
		end
	end
})

--removes a specific person from the turn order
nut.command.add("turnremove", {
	syntax = "<string target>",
	adminOnly = true,
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local turns = client:getNetVar("turns")
			
			if(turns) then
				PLUGIN:turnRemove(turns, target)
			else
				client:notify("You have not selected a turn table, use /turnselect")
				return false
			end
		else
			client:notify("Invalid target specified.")
			return false
		end
	end
})

--selects which turn the admin is managing
nut.command.add("turnselect", {
	syntax = "<string name>",
	adminOnly = true,
	onRun = function(client, arguments)	
		if(!arguments[1]) then
			client:notify("No turn table specified.")
			return false
		end
		
		local turn, turnID = PLUGIN:turnByName(arguments[1])
		if(!turn) then
			client:notify("Invalid turn table specified.")
			return false
		end
		
		client:setNetVar("turns", turnID)
		client:notify(turn.name.. " selected successfully.")
	end
})
--]]

--[[
--starts the turn system for now
nut.command.add("turncombatstart", {
	adminOnly = true,
	onRun = function(client, arguments)	

	end
})

--ends the turn system for now
nut.command.add("turncombatend", {
	adminOnly = true,
	onRun = function(client, arguments)	
		
	end
})
--]]

nut.command.add("turnpass", {
	onRun = function(client, arguments)	
		client:turnProcess(nil, true)
	end
})

nut.command.add("centturnpass", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:turnProcess(nil, true)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("apcircle", {
	onRun = function(client, arguments)	
		local apCircle = client:getNetVar("showAPCircle", nil)
		
		if(apCircle) then
			client:setNetVar("showAPCircle", nil)
		else
			client:setNetVar("showAPCircle", client:GetPos() + client:GetUp())
		end
	end
})

--chattype for turn changing messages
nut.chat.register("turnchat", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(150,75,75), text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = 1,
	deadCanChat = true
})

if CLIENT then
	function PLUGIN:PostDrawOpaqueRenderables()
		local client = LocalPlayer()
		
		local circlePos = client:getNetVar("showAPCircle")
		if (circlePos) then
			local circleRad = 250
			
			cam.Start3D2D(circlePos,Angle(0,0,0),1)
				--surface.DrawCircle(0,0,circleRad*1,255,255,255,255)
				--surface.DrawCircle(0,0,circleRad*2,255,255,255,255)
				
				render.DrawLine(Vector(0,0,0),Vector(0,0,60),255,255,255,255)
			cam.End3D2D()
			--
			
			circlePos = circlePos + Vector(0,0,40)
			cam.Start3D2D(circlePos,Angle(0,0,0),1)
				surface.DrawCircle(0,0,circleRad*1,255,255,255,255)
				surface.DrawCircle(0,0,circleRad*2,255,255,255,255)
			cam.End3D2D()
		end
	end
end