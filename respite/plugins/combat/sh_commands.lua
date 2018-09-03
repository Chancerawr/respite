local PLUGIN = PLUGIN

--melee commands
//
local COMMAND = {}
COMMAND.uid = "melee"
COMMAND.name = "Melee"
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "grapple"
COMMAND.name = "Grapple"
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "a grappling maneuver"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "meleedual"
COMMAND.name = "Dual Melee"
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 0.4
COMMAND.attackString = "a dual melee attack"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10)),
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "flail"
COMMAND.name = "Flailing Melee"
COMMAND.category = "melee"
COMMAND.stats = {
	["luck"] = 0.5
}
COMMAND.mult = 0.25
COMMAND.attackString = "a flailing melee attack"
COMMAND.rolls = function(base)
	local rolls = {}
	
	for i=0, math.random(1,2) do
		table.insert(rolls, math.abs(base + math.random(-10,10)))
	end
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "disarm"
COMMAND.name = "Disarm"
COMMAND.category = "melee"
COMMAND.stats = {
	["medical"] = 0.2,
	["accuracy"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "a disarming maneuver"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

--ranged commands
//
local COMMAND = {}
COMMAND.uid = "suppress"
COMMAND.name = "Suppressing Fire"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.15
}
COMMAND.mult = 1.1
COMMAND.attackString = "suppressing fire"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "firearms"
COMMAND.name = "Standard Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "a shot"
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "firearmsaimed"
COMMAND.name = "Aimed Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 1.2
COMMAND.attackString = "an aimed shot"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "firearmsburst"
COMMAND.name = "Burst Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["accuracy"] = 0.35
}
COMMAND.mult = 1
COMMAND.attackString = "a burst shot"
COMMAND.parts = true
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll,
		roll * math.Clamp((0.6 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.4 + ((attribs["str"] * 6) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "firearmsburstaimed"
COMMAND.name = "Aimed Burst Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["accuracy"] = 0.35
}
COMMAND.mult = 1
COMMAND.attackString = "an aimed burst shot"
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll,
		roll * math.Clamp((0.6 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.4 + ((attribs["str"] * 6) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "quickdraw"
COMMAND.name = "Quickdraw Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["stm"] = 0.25,
	["accuracy"] = 0.25
}
COMMAND.mult = 0.5
COMMAND.attackString = "a quickdraw shot"
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "throw"
COMMAND.name = "Throw"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "a thrown object"
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "execute"
COMMAND.name = "Execution Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 2
COMMAND.attackString = "an execution shot"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "akimbo"
COMMAND.name = "Akimbo Shot"
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.2,
	["accuracy"] = 0.3
}
COMMAND.mult = 0.4
COMMAND.attackString = "an akimbo shot"
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10)),
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

--reaction/resist commands
//
local COMMAND = {}
COMMAND.uid = "sneak"
COMMAND.name = "Sneak"
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 0.75
COMMAND.attackString = "sneaking"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "perception"
COMMAND.name = "Perception"
COMMAND.category = "react"
COMMAND.stats = {
	["perception"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "perceiving"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "endure"
COMMAND.name = "Endure"
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.4,
	["fortitude"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "endurance"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "will"
COMMAND.name = "Will"
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.25,
	["fortitude"] = 0.25
}
COMMAND.mult = 1
COMMAND.attackString = "willpower"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "fortitude"
COMMAND.name = "Fortitude"
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.1,
	["fortitude"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "fortitude"
COMMAND.noCrit = true
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "dodge"
COMMAND.name = "Dodge"
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 0.8
COMMAND.attackString = "a dodge/miss"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "block"
COMMAND.name = "Block"
COMMAND.category = "react"
COMMAND.stats = {
	["end"] = 0.3,
	["str"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "a block"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "defend"
COMMAND.name = "Defend"
COMMAND.category = "special"
COMMAND.stats = {
	["end"] = 0.2,
	["stm"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "defending a target"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "parry"
COMMAND.name = "Parry"
COMMAND.category = "react"
COMMAND.stats = {
	["str"] = 0.15,
	["accuracy"] = 0.15,
	["stm"] = 0.15,
	["perception"] = 0.1
}
COMMAND.mult = 0.8
COMMAND.attackString = "parrying"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "flee"
COMMAND.name = "Flee"
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "a flee attempt"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "reflexes"
COMMAND.name = "Reflexes"
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "reflexes"
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

--special
//
local COMMAND = {}
COMMAND.uid = "revolverburst"
COMMAND.name = "Revolver Burst"
COMMAND.category = "special"
COMMAND.parts = true
COMMAND.stats = {
	["accuracy"] = 0.35
}
COMMAND.mult = 1
COMMAND.attackString = "a rapid fire revolver shot"
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll,
		roll * math.Clamp((0.6 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.4 + ((attribs["str"] * 6) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )