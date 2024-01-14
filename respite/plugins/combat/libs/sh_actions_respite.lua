local PLUGIN = PLUGIN

local function critCalc(char)
	local mult = 1
	local critMsg = ""
	
	local luck = char:getAttrib("luck", 0)
	
	--base crit chance is 3% (30)
	local critChance = 40 + (luck * 4) -- Chance for critical success
	local failChance = 10 - (luck * 0.1) -- Chance for critical failure
	
	local critRoll = math.random(1, 1000)
	if(critRoll < critChance) then
		mult = 1.2 + luck * 0.01
		critMsg = "(Crit!) "
	else -- Fails can only happen on non-crits
		local failRoll = math.random(1, 1000)
		if(failRoll < failChance) then
			mult = 0.25
			critMsg = "(Fail!) "
		end
	end

	return mult, critMsg
end

local function basicRoll(actionTbl, client, trace)
	local char = client:getChar()

	local attribVal = 0
	-- Adds up the attributes used by the roll
	for attrib, value in pairs(actionTbl.attribs or {}) do
		attribVal = attribVal + char:getAttrib(attrib, 0) * value
	end
	
	-- Random roll. Increases the floor and the ceiling as value increases.
	local roll = math.Rand(-1 + (attribVal*0.5), 20 + attribVal)
	
	-- Command specific multiplier
	roll = roll * (actionTbl.mult or 1) 
	
	-- Crit calculation
	local crit = 1
	local critMsg = ""
	if(!actionTbl.noCrit) then
		crit, critMsg = critCalc(char)
		roll = roll * crit
	end
	
	-- Round it
	roll = math.Round(roll) 
	
	-- Chat printing
	local combatMsg = client:Name().. " rolls " ..actionTbl.name.. ": " ..critMsg..roll.. "."
	nut.chat.send(client, (actionTbl.chatType or "react_npc"), combatMsg)
	
	-- Console logging
	nut.log.addRaw(combatMsg, 2)
end

-- Respite specific commands
local respiteCommands = {
	--just uncomment if you want these
	--[[
	-- Offensive
	["melee"] = {
		name = "Melee",
		desc = "Used for melee weapons.",
		category = "Offensive",
		attribs = {
			["str"] = 1,
			["accuracy"] = 0.2,
		},
	},
	["firearms"] = {
		name = "Firearms",
		desc = "Used for firearms (pistols, rifles, etc).",
		category = "Offensive",
		attribs = {
			["accuracy"] = 1,
			["str"] = 0.2,
		},
	},
	["shotgun"] = {
		name = "Shotgun",
		desc = "Used for shotguns.",
		category = "Offensive",
		attribs = {
			["accuracy"] = 1,
			["str"] = 0.5,
		},
	},
	["tech"] = {
		name = "Tech",
		desc = "Used for special weapons (flamethrowers, electric guns, etc).",
		category = "Offensive",
		attribs = {
			["medical"] = 1,
			["accuracy"] = 0.2,
		},
	},
	["akimbo"] = {
		name = "Akimbo",
		desc = "Used for dual wielding firearms.",
		category = "Offensive",
		attribs = {
			["accuracy"] = 1,
			["stm"] = 0.5,
		},
	},
	["throw"] = {
		name = "Throw",
		desc = "Used for thowing things.",
		category = "Offensive",
		attribs = {
			["accuracy"] = 1,
			["str"] = 0.5,
		},
	},
	
	-- Reactive
	["dodge"] = {
		name = "Dodge",
		desc = "Used for not getting hit.",
		category = "Reactive",
		
		mult = 0.8,
		attribs = {
			["stm"] = 1,
			["perception"] = 0.1,
		},
	},
	["block"] = {
		name = "Block",
		desc = "Used for blocking things.",
		category = "Reactive",
		
		mult = 0.85,
		attribs = {
			["end"] = 1,
			["str"] = 0.5,
		},
	},
	["defend"] = {
		name = "Defend",
		desc = "Used to block a single attack from hitting an ally, if roll fails you get hit instead. You can only do this once per turn.",
		category = "Reactive",
		
		mult = 0.8,
		attribs = {
			["end"] = 1,
			["stm"] = 0.5,
			["perception"] = 0.5,
		},
	},
	["parry"] = {
		name = "Parry",
		desc = "Can be used to counter an enemy melee attack. You can only do this once per turn.",
		category = "Reactive",
		
		mult = 0.7,
		attribs = {
			["stm"] = 0.5,
			["str"] = 0.5,
			["perception"] = 0.5,
			["accuracy"] = 0.5,
		},
	},
	--]]
	
	-- Special
	["luckychance"] = {
		name = "Lucky Chance",
		desc = "It might do something good, it might do something bad, who knows? Can only be used once per combat. Does not cost an action.",
		category = "Special",
		
		attribs = {
			["luck"] = 1,
		},
	},
}

for k, action in pairs(respiteCommands) do
	local ACT

	ACT = {}
	ACT.uid = k
	ACT.name = action.name or "Unnamed Action"
	ACT.desc = action.desc or ""
	ACT.category = action.category or "Default"
	ACT.attribs = action.attribs
	ACT.mult = action.mult
	
	ACT.attackOverwrite = function(actionTbl, client, trace)
		basicRoll(actionTbl, client, trace)
	end
	
	ACTS:Register(ACT)

	-- Chat command
	nut.command.add(k, {
		--adminOnly = true,
		onRun = function(client, arguments)
			local data = {}
				data.start = client:GetShootPos()
				data.endpos = data.start + client:GetAimVector()*4096
				data.filter = {client, self}
			local trace = util.TraceLine(data)

			basicRoll(ACT, client, trace)
		end
	})
end

-- CEnt Chat command
nut.command.add("cent", {
	adminOnly = true,
	onRun = function(client, arguments)
		local action = arguments[1]
		
		if(!action) then
			client:notify("Specify an action.")
			return false
		end
	
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*4096
			data.filter = {client, self}
		local trace = util.TraceLine(data)

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local actionTbl = ACTS.actions[action]
			
			if(!actionTbl) then
				client:notify("Invalid action specified.")
				return false
			end
			
			actionTbl.attackOverwrite(actionTbl, entity, trace)
			--basicRoll(actionTbl, entity, trace)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

-- basic attacks that use numbers and stuff
nut.command.add("attack", {
	--adminOnly = true,
	onRun = function(client, arguments)
		local data = {}
			data.start = client:GetShootPos()
			data.endpos = data.start + client:GetAimVector()*4096
			data.filter = {client, self}
		local trace = util.TraceLine(data)

		local action = {
			name = "Attack",
			category = "Attack",
		}	
		PLUGIN:attackStart(client, client, trace, action)
	end
})

//
local ACT
ACT = {}
ACT.uid = "cover"
ACT.name = "Cover"
ACT.desc = "Defend an ally and boost their armor for 1 turn."
ACT.category = "Special"
ACT.attackString = "protects their target in some way"
ACT.CD = 5
ACT.noSelf = true
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Cover",
		effect = "armor",
		duration = 1,
		strength = 1,
		
		armor = 200,
		
		buff = true,
	}
}
ACTS:Register(ACT)