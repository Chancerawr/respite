local playerMeta = FindMetaTable("Player")
local PLUGIN = PLUGIN

PLUGIN.parts = PLUGIN.parts or {}



function PLUGIN:GetPartByID(id)
	return PLUGIN.parts[id]
end

function PLUGIN:GetPartByName(partial)
	local partial = string.lower(partial)
	local find

	for k, v in pairs(PLUGIN.parts) do
		local name = string.lower(v.name or v.id)
	
		if(name == partial) then
			return PLUGIN.parts[v.id]
		elseif(string.find(name, partial)) then
			find = PLUGIN.parts[v.id]
		end
	end
	
	return find
end

function PLUGIN:RegisterPart(data)
	PLUGIN.parts[data.id or data.name] = data
end

function PLUGIN:HumanBody()
	local humanBody = {
		"head",
		"torso",
		"arm_l",
		"arm_r",
		"leg_l",
		"leg_r",
		"eye_l",
		"eye_r",
	}

	return humanBody
end

--checks if a player has a specific injury
function playerMeta:GetBody()
	local char = self:getChar()

	if(char) then
		local body = char:getData("body", PLUGIN:HumanBody())

		return body
	end
	
	return {}
end

--checks if a player has a specific injury
function playerMeta:HasInjury(injuryID)
	local char = self:getChar()

	if(char) then
		local injuries = char:getData("inj", {})
		for partID, injuries in pairs(injuries) do
			if(injuries[injury]) then
				return partID
			end
		end
	end
	
	return false
end


nut.command.add("charresetbody", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			target:getChar():setData("parts", nil)
		end
	end
})

nut.command.add("chargetbody", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			for k, v in pairs(target:getChar():getData("parts", {})) do
				client:notify(PLUGIN.parts[k][1].. ": " ..v[1].. " " ..v[2].. ".")
			end
		end
	end
})
