local PLUGIN = PLUGIN
PLUGIN.name = "Weird Bodies"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A weird body system, don't worry about it."

PLUGIN.parts = {
	["al"] = {
		"Left Arm", 
		50
	},
	["ar"] = {
		"Right Arm", 
		50
	},
	["ll"] = {
		"Left Leg", 
		75
	},
	["lr"] = {
		"Right Leg", 
		75
	},
	["t"] = {
		"Torso", 
		200
	},
	["el"] = {
		"Left Eye", 
		10
	},
	["er"] = {
		"Right Eye", 
		10
	},
	["zc"] = {
		"Circulatory System", 
		100
	},
	["zs"] = {
		"Skeletal System", 
		100
	},
	["h"] = {
		"Head", 
		100
	}
}

--determines which body part to apply the changes to.
--this is a big mess right now and ill probably make less shitty later
local function calculateSpread(parts, material)
	local part, id
	
	local percent = PLUGIN:calcPercent(parts)
	
	local potentialParts = {}

	--this is a disgusting mess, sorry about that.
	for k, v in pairs(PLUGIN.parts) do
		if(parts[k]) then --checks if the person has that part altered already.
			if(parts[k][1] >= v[2]) then --checks if it's maxed out, if it is we just skip it.
				continue
			
			elseif(parts[k][2] == material and parts[k][1] < v[2]) then --checks if the person has an incomplete part of the same material
				part, id = PLUGIN.parts[k], k --if they do, select it.

			end
		else
			if(k != "h") then --leave head out for last
				potentialParts[k] = v --adds it to the potential for random selection.
			end
		end
	end
	
	if(!part) then --if no selected viable part, we start on a new one.
		if(table.Count(potentialParts) > 0) then 
			part, id = table.Random(potentialParts) --choose a random part from our list of viable options

		else
			part, id = PLUGIN.parts["h"], "h" --head is always the last to go, so it's only started when everything else is gone.
		end
	end
	
	return part, id
end

function PLUGIN:partsAdd(client, amount, material)
	local char = client:getChar()
	local pTable = char:getData("parts", {})
	
	local randomPart, id = calculateSpread(pTable, material)
	
	pTable[id] = {math.Clamp((pTable[id] and pTable[id][1] or 0) + amount, 0, randomPart[2]), material}
	
	--pTable[id] = Amount, material.
	--sorry that it's different from the plugin table.
	
	char:setData("parts", pTable)
end

--calculates how much of a person's body is special
function PLUGIN:calcPercent(parts)
	local total = 0
	for k, v in pairs(self.parts) do
		total = total + v[2]
	end
	
	local total2 = 0
	for k, v in pairs(parts) do
		total2 = total2 + v[1]
	end
	
	return (total2 / total) * 100
end

local injuries = {
	[1] = {
		name = "Bruise",
		tags = {
			["External"] = true,
		},
		dmgT = {
			["Blunt"] = true,
		},
	},
	[2] = {
		name = "Fracture",
		tags = {
			["Bone"] = true,
		},
		dmgT = {
			["Blunt"] = true,
			["Slash"] = true,
		},
	},
	[3] = {
		name = "Burn",
		tags = {
			["External"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		},
		dmgT = {
			["Heat"] = true,
			["Acid"] = true,
		},
	},
	[4] = {
		name = "Laceration",
		tags = {
			["External"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		},
		dmgT = {
			["Blunt"] = true,
			["Slash"] = true,
		},
	},
	[5] = {
		name = "Puncture",
		tags = {
			["Internal"] = true,
			["External"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		},
		dmgT = {
			["Slash"] = true,
		},
	},
	[6] = {
		name = "Abrasion",
		tags = {
			["External"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		},
		dmgT = {
			["Slash"] = true,
			["Blunt"] = true,
		},
	},
	[7] = {
		name = "Bullet Wound",
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		},
		dmgT = {
			["Bullet"] = true,
		},
	},
}

local parts = {
	[1] = {
		name = "Left Arm", 
		total = 50,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	},
	[2] = {
		name = "Right Arm", 
		total = 50,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	},
	[3] = {
		name = "Left Leg", 
		total = 75,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	},
	[4] = {
		name = "Right Leg", 
		total = 75,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	},
	[5] = {
		name = "Torso",
		total = 200,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	},
	[6] = {
		name = "Left Eye", 
		total = 10,
		tags = {
			["External"] = true,
		}
	},
	[7] = {
		name = "Right Eye", 
		total = 10,
		tags = {
			["External"] = true,
		}
	},
	[8] = {
		name = "Head", 
		total = 100,
		tags = {
			["External"] = true,
			["Internal"] = true,
			["Bone"] = true,
			["Skin"] = true,
			["Muscle"] = true,
		}
	}
}

local playerMeta = FindMetaTable("Player")

--checks if the injury is compatible with the body part.
local function injuryCompatible(part, injury)
	local injuryTbl = injuries[injury]
	local partTbl = parts[part]
	
	if(injuryTbl and partTbl) then
		for k, v in pairs(partTbl.tags) do
			for k2, v2 in pairs(injuryTbl.tags) do
				if(k == k2) then
					return true
				end
			end
		end
	end
	
	return false
end

--finds injury from a partial string or id
local function injuryFromName(name)
	if(injuries[tonumber(name)]) then
		return tonumber(name)
	end
	
	local name = string.lower(name)
	
	local injury
	for k, v in pairs(injuries) do
		if(string.lower(v.name) == string.lower(name)) then
			injury = k
			break	
		elseif(string.find(string.lower(v.name), string.lower(name))) then
			injury = k
		end
	end
	
	return injury
end

--finds part from a partial string or id
local function partFromName(name)
	if(parts[tonumber(name)]) then
		return tonumber(name)
	end
	
	local name = string.lower(name)
	
	local part
	for k, v in pairs(parts) do
		if(string.lower(v.name) == string.lower(name)) then
			part = k
			break
		elseif(string.find(string.lower(v.name), string.lower(name))) then
			part = k
		end
	end
	
	return part
end

--adds a specified injury to a specified body part
function playerMeta:addInjury(part, injury)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		
		if(!injuries[part]) then
			injuries[part] = {}
		end
		
		injuries[part][injury] = true
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--removes a specified injury from a specified body part
function playerMeta:removeInjury(part, injury)
	local char = self:getChar()
	
	if(char) then
		local injuries = char:getData("inj", {})
		injuries[part][injury] = nil
		char:setData("inj", injuries)
		
		return true
	end
	
	return false
end

--removes all injuries on a specified part
function playerMeta:removeInjuryPart(part)
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
function playerMeta:getInjuryPart(part)
	local char = self:getChar()

	if(char) then
		local injuries = char:getData("inj", {})
		return injuries[part]
	end
	
	return false
end

--gets all of the injuries
function playerMeta:getInjuries()
	local char = self:getChar()
	local injuries = {}
	
	if(char) then
		injuries = char:getData("inj", {})
	end
	
	return injuries
end

--gets rid of all injury data for player
function playerMeta:clearInjuries()
	local char = self:getChar()
	
	if(char) then
		char:setData("inj", nil)
	end
end

nut.command.add("chargetpercent", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			client:notify(PLUGIN:calcPercent(target:getChar():getData("parts", {})).. " Percent.")
		end
	end
})

nut.command.add("charsetpart", {
	adminOnly = true,
	syntax = "<string target> <string part> <string material> <number percentage>",
	onRun = function(client, arguments)
		if(!arguments[1] or !arguments[2] or !arguments[3] or !arguments[4]) then
			client:notify("Invalid Arguments.")
			return false
		end
		
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			local id
			for k, v in pairs(PLUGIN.parts) do
				if(string.find(string.lower(v[1]), string.lower(arguments[2]) or "Left Eye")) then
					id = k
				end
			end
		
			local materials = {
				"Blight",
				"Ichor"
			}
		
			local material
			for k, v in pairs(materials) do
				if(string.find(string.lower(v), string.lower(arguments[3]) or "ichor")) then
					material = v
				end
			end
			
			if(!id) then
				client:notify("Invalid Body Part")
				return false
			end
			
			if(!material) then
				client:notify("Invalid Material.")
				return false
			end
			
			local amount = arguments[4]
			if(!amount) then
				client:notify("Invalid Amount.")
				return false
			end
			
			local char = target:getChar()
			local pTable = char:getData("parts", {})
			
			pTable[id] = {(math.Clamp((PLUGIN.parts[id][2] * amount / 100), 0, PLUGIN.parts[id][2])), material}
			char:setData("parts", pTable)
			
			client:notify("Part has been set.")
		end
	end
})

nut.command.add("charaddichor", {
	adminOnly = true,
	syntax = "<string target> <number amount>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			PLUGIN:partsAdd(target, arguments[2] or 0, "Ichor")
		end
	end
})

nut.command.add("charaddblight", {
	adminOnly = true,
	syntax = "<string target> <number amount>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(IsValid(target) and target:getChar()) then
			PLUGIN:partsAdd(target, arguments[2] or 0, "Blight")
		end
	end
})

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

nut.command.add("injuryadd", {
	adminOnly = true,
	syntax = "<string target> <string part> <string injury>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		if(!arguments[2]) then
			client:notify("Specify a part.")
			return false
		end
		
		local part = partFromName(arguments[2])

		if(!part) then
			client:notify("Invalid part specified.")
			return false
		end		
		
		if(!arguments[3]) then
			client:notify("Specify an injury.")
			return false
		end		
		
		local injury = injuryFromName(arguments[3])

		if(!injury) then
			client:notify("Invalid injury specified.")
			return false
		end
		
		if(IsValid(target) and target:getChar()) then
			target:addInjury(part, injury)
			
			client:notify(injuries[injury].name.. " successfully applied to " ..parts[part].name)
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
		
		local part = partFromName(arguments[2])

		if(!part) then
			client:notify("Invalid part specified.")
			return false
		end		
		
		if(!arguments[3]) then
			client:notify("Specify an injury.")
			return false
		end		
		
		local injury = injuryFromName(arguments[3])

		if(!injury) then
			client:notify("Invalid injury specified.")
			return false
		end
		
		if(IsValid(target) and target:getChar()) then
			target:removeInjury(part, injury)
			
			client:notify(injuries[injury].name.. " successfully removed from " ..parts[part].name)
		else
			client:notify("Invalid target.")
		end
	end
})

nut.command.add("injuryaddrand", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		
		local part = math.random(#parts)
		local injury = math.random(#injuries)
		
		if(IsValid(target) and target:getChar()) then
			target:addInjury(part, injury)
			
			client:notify("Random Injury successfully applied.")
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
			local injured = target:getInjuries()
			PrintTable(injuries)
			
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

--[[
local charData = char:getData("inj", {})
charData = {
	["legr"] = {1,2,3,4},
}

--]]

--chattype for the health printouts
nut.chat.register("health", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200,75,75), text)
	end,
	filter = "actions",
	font = "nutChatFontHealth",
	onCanHear = 1,
	deadCanChat = true
})

if(CLIENT) then
	--health font
	surface.CreateFont("nutChatFontHealth", {
		font = "Segoe UI",
		size = 30,
		extended = true,
		weight = 500,
		italic = true
	})
end