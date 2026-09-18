local playerMeta = FindMetaTable("Player")
local PLUGIN = PLUGIN

PLUGIN.injuries = PLUGIN.injuries or {}

nut.config.add("injuryTick", 600, "How many seconds in between injury ticks.", nil, {
	data = {min = 1, max = 84600},
	category = "Injuries"
})

function PLUGIN:GetInjuryByID(id)
	return PLUGIN.injuries[id]
end

function PLUGIN:GetInjuryByName(partial)
	local partial = string.lower(partial)
	local find

	for k, v in pairs(PLUGIN.injuries) do
		local name = string.lower(v.name or v.id)
	
		if(name == partial) then
			return PLUGIN.injuries[v.id]
		elseif(string.find(name, partial)) then
			find = PLUGIN.injuries[v.id]
		end
	end
	
	return find
end

function PLUGIN:RegisterInjury(data)
	PLUGIN.injuries[data.id or data.name] = data
end

--checks if the injury is compatible with the body part.
function PLUGIN:CanInjure(part, injury)
	local partTbl = PLUGIN.parts[part]
	local injuryTbl = PLUGIN.injuries[injury]
	
	--makes sure it has all the necessary tags to apply the injury
	if(partTbl and injuryTbl) then
		for k, v in pairs(injuryTbl.tags) do
			if(!partTbl.tags[k]) then
				return false
			end
		end
	end
	
	return true
end

--checks if the injury can be treated by specified treatment
function PLUGIN:CanTreat(injury, treatment)
	local injuryTbl = PLUGIN:GetInjuryByID(injury)
	
	--makes sure it has all the necessary tags to apply the injury
	if(injuryTbl and injuryTbl.treatment) then
		if(injuryTbl.treatment[treatment]) then
			return true
		end
	end
	
	return false
end

--adds a specified injury to a specified body part
function playerMeta:InjuryAdd(part, injury, severity)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		
		if(!injuries[part]) then
			injuries[part] = {}
		end
		
		injuries[part][injury] = (injuries[part][injury] or 0) + (severity or 1)
		
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--removes a specified injury from a specified body part
function playerMeta:InjuryRemove(part, injury)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		injuries[part][injury] = nil
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--reduces a specified injury from a specified body part
function playerMeta:InjuryReduce(part, injury, severity)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		if(!injuries[part]) then return true end
		
		injuries[part][injury] = (injuries[part][injury] or 0) - severity

		if(injuries[part][injury] <= 0) then
			injuries[part][injury] = nil
		end
		
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--removes all injuries on a specified part
function playerMeta:InjuryRemovePart(part)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		injuries[part] = nil
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--gets all of the injuries on a specified part
function playerMeta:InjuryGetPart(part)
	local char = self:getChar()

	if(char) then
		local injuries = char:getData("inj", {})
		return injuries[part]
	end
	
	return false
end

--gets all of the injuries
function playerMeta:InjuryGetAll()
	local char = self:getChar()
	local injuries = {}
	
	if(char) then
		injuries = char:getData("inj", {})
	end
	
	return injuries
end

--gets rid of all injury data for player
function playerMeta:InjuryRemoveAll()
	local char = self:getChar()
	
	if(char) then
		char:setData("inj", nil)
	end
end

if(SERVER) then
	--handles treatments
	function PLUGIN:TreatmentTick(treater, client, partID, severity)
		--reduces severity of injuries on this limb
		local injuries = client:InjuryGetPart(partID)

		if(injuries) then
			for injuryID, severity in pairs(injuries) do
				local canTreat = PLUGIN:CanTreat(injuryID, treater.treats)
				if(canTreat) then
					--how much to reduce severity
					local treatAmt = treater.treatAmt or 1
					if(isfunction(treatAmt)) then
						treatAmt = treatAmt(client, partID, severity)
					elseif(istable(treatAmt)) then
						treatAmt = math.random(treatAmt[1], treatAmt[2])
					end
				
					client:InjuryReduce(partID, injuryID, treatAmt)
				end
				
				client:InjuryReduce(partID, treater.id, 1)
			end
		end
	end
	
	function PLUGIN:Think()
		if ((self.nextThink or 0) < CurTime()) then
			self.nextThink = CurTime() + nut.config.get("injuryTick", 600)

			for k, client in ipairs(player.GetAll()) do
				local char = client:getChar()
				if (!char) then continue end
				
				local injuries = client:InjuryGetAll()
				for partID, injury in pairs(injuries) do
					for injuryID, severity in pairs(injury) do
						local injuryTbl = PLUGIN:GetInjuryByID(injuryID)
						
						if(injuryTbl) then
							if(injuryTbl.think) then
								injuryTbl.think(client, partID, severity)
							end
							
							if(injuryTbl.treats) then
								PLUGIN:TreatmentTick(injuryTbl, client, partID, severity)
							end
						end
					end
				end
			end
		end
	end
end


nut.command.add("injuryadd", {
	adminOnly = true,
	syntax = "<string target> <string part> <string injury> <number severity>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(!arguments[2]) then
			client:notify("Specify a part.")
			return false
		end
		
		local part = PLUGIN:GetPartByName(arguments[2])

		if(!part) then
			client:notify("Invalid part specified.")
			return false
		end		
		
		if(!arguments[3]) then
			client:notify("Specify an injury.")
			return false
		end
		
		local injury = PLUGIN:GetInjuryByName(arguments[3])

		if(!injury) then
			client:notify("Invalid injury specified.")
			return false
		end
		
		local severity = tonumber(arguments[4])
		
		if(IsValid(target) and target:getChar()) then
			target:InjuryAdd(part.id, injury.id, tonumber(severity))
			
			client:notify(injury.name.. " successfully applied to " ..part.name)
		else
			client:notify("Invalid target.")
		end
	end
})

nut.command.add("injuryremove", {
	adminOnly = true,
	syntax = "<string target> <string part> <string injury>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(!arguments[2]) then
			client:notify("Specify a part.")
			return false
		end
		
		local part = PLUGIN:GetPartByName(arguments[2])

		if(!part) then
			client:notify("Invalid part specified.")
			return false
		end		
		
		if(!arguments[3]) then
			client:notify("Specify an injury.")
			return false
		end		
		
		local injury = PLUGIN:GetInjuryByName(arguments[3])

		if(!injury) then
			client:notify("Invalid injury specified.")
			return false
		end
		
		if(IsValid(target) and target:getChar()) then
			target:InjuryRemove(part, injury)
			
			client:notify(injuries[injury].name.. " successfully removed from " ..parts[part].name)
		else
			client:notify("Invalid target.")
		end
	end
})

nut.command.add("injuryclearall", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			target:clearInjuries()
			client:notify("Injuries successfully cleared.")
		else
			client:notify("Invalid target.")
		end
	end
})

nut.command.add("injurygetall", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local injured = target:InjuryGetAll()
			
			for part, injuryTable in pairs(injured) do
				local partString = parts[part].name.. ": "
				for injuryType, _ in pairs(injuryTable) do
					local injury = injuries[injuryType]
				
					partString = partString..injury.name.. ", "
				end
				
				nut.chat.send(client, "health", partString)
			end
		else
			client:notify("Invalid target.")
		end
	end
})
