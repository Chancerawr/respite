local PLUGIN = PLUGIN

--melee commands
//
local COMMAND = {}
COMMAND.uid = "melee"
COMMAND.name = "Melee"
COMMAND.desc = "For basic melee attacks."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "melee attack"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Used to grab a target, preventing them from escaping or properly using weapons in most cases (situational). They use their turn to try and break free (/grapple vs /grapple)."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "grappling maneuver"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Two melee attacks at the same time on the same target."
COMMAND.category = "melee"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.1
}
COMMAND.mult = 0.6
COMMAND.attackString = "dual melee attack"
COMMAND.stringArt = "a "
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
COMMAND.desc = "A flailing melee attack, typically not the best choice."
COMMAND.category = "melee"
COMMAND.stats = {
	["luck"] = 0.5
}
COMMAND.mult = 0.4
COMMAND.attackString = "flailing melee attack"
COMMAND.stringArt = "a "
COMMAND.parts = true
COMMAND.rolls = function(base)
	local rolls = {}
	
	for i=1, math.random(1,4) do
		table.insert(rolls, math.abs(base + math.random(-10,10)))
	end
	
	return rolls
end

CMBT:Register( COMMAND )

--ranged commands
//
local COMMAND = {}
COMMAND.uid = "suppress"
COMMAND.name = "Suppressing Fire"
COMMAND.desc = "Determines if an enemy is hit by suppressing fire. A player rolls suppression against an enemy in cover. If the enemy attempts to use a weapon or move into the open, it will have to /dodge to avoid being hit. /dodge is rolled against the /suppress roll. Can only suppress one target at a time unless all parties agree otherwise in a case where it would make sense. If that is the case, suppression is only rolled once, and every /dodge is compared to that roll."
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.4,
	["accuracy"] = 0.15
}
COMMAND.mult = 1.1
COMMAND.attackString = "suppressing fire"
COMMAND.stringArt = ""
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
COMMAND.desc = "Standard ranged attack, can be used with any projectile weapon. Chooses a random body part to hit."
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "shot"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Aimed ranged attack, specify what body part you are aiming at with your roleplay. You must use a full turn to aim at a target, and then you can use this command on the next one. If the target moves after your aimed shot, you will have to aim again."
COMMAND.category = "firearms"
COMMAND.stats = {
	["perception"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 1.5
COMMAND.attackString = "aimed shot"
COMMAND.stringArt = "an "
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
COMMAND.desc = "Fires three shots with decreasing accuracy, can only be used with automatic weapons or burst fire weapons (not semi automatic.) Accuracy decreases based on your strength (Higher strength = less reduction.) Rolled against a single dodge."
COMMAND.category = "firearms"
COMMAND.stats = {
	["accuracy"] = 0.4
}
COMMAND.mult = 0.6
COMMAND.attackString = "burst shot"
COMMAND.stringArt = "a "
COMMAND.parts = true
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll,
		roll * math.Clamp((0.5 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.3 + ((attribs["str"] * 6) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "gatling"
COMMAND.name = "Gatling Shot"
COMMAND.desc = "Meant to be used only with gatling guns. Fires five successive shots. Gatling guns require half a turn to begin spinning up."
COMMAND.category = "firearms"
COMMAND.stats = {
	["accuracy"] = 0.4
}
COMMAND.mult = 0.55
COMMAND.attackString = "gatling shot"
COMMAND.stringArt = "a "
COMMAND.parts = true
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll * math.Clamp((0.55 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.5 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.45 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.4 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.35 + ((attribs["str"] * 4) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "firearmsburstaimed"
COMMAND.name = "Aimed Burst Shot"
COMMAND.desc = "An aimed burst, follows the same rules as regular aimed shots."
COMMAND.category = "firearms"
COMMAND.stats = {
	["accuracy"] = 0.25,
	["perception"] = 0.1
}
COMMAND.mult = 0.8
COMMAND.attackString = "aimed burst shot"
COMMAND.stringArt = "an "
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))

	local rolls = { 
		roll,
		roll * math.Clamp((0.5 + ((attribs["str"] * 4) / 1000)), 0, 1),
		roll * math.Clamp((0.3 + ((attribs["str"] * 6) / 1000)), 0, 1)
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "quickdraw"
COMMAND.name = "Quickdraw Shot"
COMMAND.desc = "Used to draw your weapon and fire it in the same turn. Can only be used with SMGs, Pistols, or one-handed melee weapons."
COMMAND.category = "firearms"
COMMAND.stats = {
	["stm"] = 0.25,
	["accuracy"] = 0.25
}
COMMAND.mult = 0.6
COMMAND.attackString = "quickdraw shot"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Ranged roll for throwing an object of any kind. Can be blocked like a melee attack."
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.2,
	["accuracy"] = 0.3
}
COMMAND.mult = 1
COMMAND.attackString = "thrown object"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Used in point blank firearm conditions where target is unlikely to be able to avoid it. You can use them when your target is being restrained, is incredibly incapacitated, stunned, or completely unable to move. You cannot use them just because you are very close or they got knocked down. You also cannot use this on targets that you yourself are restraining with grapple. It is generally assumed that in using this, you will hit your target. However, if you lose the roll, you can attribute it to a misfire, an erratic movement by the thing you're trying to execute, or incredibly bad luck on your part.\nRequires the Executioner trait."
COMMAND.category = "special"
COMMAND.trait = "executioner"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.4
}
COMMAND.mult = 2.5
COMMAND.attackString = "execution shot"
COMMAND.stringArt = "an "
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
COMMAND.desc = "Used when dual wielding one-handed firearms. Multiple targets can be chosen."
COMMAND.category = "firearms"
COMMAND.stats = {
	["str"] = 0.2,
	["accuracy"] = 0.3
}
COMMAND.mult = 0.85
COMMAND.attackString = "akimbo shot"
COMMAND.stringArt = "an "
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
COMMAND.desc = "Used for sneaking by a target. Rolled against /perception. Only works if it makes sense in the situation. No sneak attack bonus is provided, but you can use it to get to a better position. If sneaking by multiple targets, all applicable targets should roll /perception."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 0.8
COMMAND.attackString = "sneaking"
COMMAND.stringArt = ""
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
COMMAND.desc = "Used to detect sneaking targets. If successful, detector is alerted and can act accordingly."
COMMAND.category = "react"
COMMAND.stats = {
	["perception"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "perceiving"
COMMAND.stringArt = ""
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
COMMAND.desc = "Used to roll resistance against physical effects like flashbangs, tear gas, fire, poison, etc."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.4,
	["fortitude"] = 0.1
}
COMMAND.mult = 1
COMMAND.attackString = "endurance"
COMMAND.stringArt = ""
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
COMMAND.desc = "Used to control aberration items, limbs, or other constructs."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.25,
	["fortitude"] = 0.25
}
COMMAND.mult = 1
COMMAND.attackString = "willpower"
COMMAND.stringArt = ""
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
COMMAND.desc = "Used to roll resistance against mental and hallucination based effects like blue haze grenades, hallucinogens, fortitude based attacks, etc."
COMMAND.category = "resist"
COMMAND.stats = {
	["end"] = 0.1,
	["fortitude"] = 0.4
}
COMMAND.mult = 1
COMMAND.attackString = "fortitude"
COMMAND.stringArt = ""
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
COMMAND.desc = "Determines if an attack is dodged, or if the projectile fired at you will miss. Can also be used to avoid /grapple. Has a chance to turn into a 'graze', which only partially dodges an attack. If the spot being grazed is an organ, or is mostly inside of the body, you will be simply hit in the body nearby that part. Grazes are counted as full dodges if you are protected by cover at all in the direction of your attacker."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.35,
	["perception"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "dodge/miss"
COMMAND.stringArt = ""
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end
COMMAND.print = function(client, roll, part, critmsg)
	local name
	if(client:IsPlayer()) then
		name = client:Name()
	else
		name = client:getNetVar("name", "ENT")
	end
	
	if(math.random(1,10) <= 7) then --normal dodge
		nut.log.addRaw(name.." rolled \"" ..roll.. "\" for a dodge.", 2)
		if(client:IsPlayer()) then
			nut.chat.send(client, COMMAND.category, "has rolled " ..roll..critmsg.. " for " ..COMMAND.attackString.. ".")
		else
			nut.chat.send(client, COMMAND.category.."_npc", name.. " has rolled " ..roll..critmsg.. " for " ..COMMAND.attackString.. ".")	
		end
	else --grazes
		nut.log.addRaw(name.." rolled \"" ..roll.. "\" for a graze.", 2)
		if(client:IsPlayer()) then
			nut.chat.send(client, "graze", "has rolled " ..roll..critmsg.. " for a graze.")
		else
			nut.chat.send(client, "graze_npc", name.. " has rolled " ..roll..critmsg.. " for a graze.")
		end
	end
end

CMBT:Register(COMMAND)

//
local COMMAND = {}
COMMAND.uid = "block"
COMMAND.name = "Block"
COMMAND.desc = "Determines if an attack is blocked. Cannot be used against bullets. If a thrown object is blocked, it is mostly stopped or deflected."
COMMAND.category = "react"
COMMAND.stats = {
	["end"] = 0.3,
	["str"] = 0.2
}
COMMAND.mult = 0.85
COMMAND.attackString = "block"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Determines if an attack is blocked, and allows for a counter attack. Cannot be used against bullets. If a thrown object is blocked, it can be reflected (be reasonable). If the parry succeeds against an applicable attack, attacker must roll a defensive roll (block, dodge, parry) against the previous parry roll. If the defensive roll succeeds, the attack is only blocked and the counter attack is avoided."
COMMAND.category = "react"
COMMAND.stats = {
	["str"] = 0.1,
	["accuracy"] = 0.1,
	["stm"] = 0.1,
	["end"] = 0.1,
	["perception"] = 0.1
}
COMMAND.mult = 0.8
COMMAND.attackString = "parrying"
COMMAND.stringArt = ""
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
COMMAND.desc = "Used to attempt flight from the current combat. Enemies are allowed to counter your roll with anything that would reasonably stop you from getting away. If you beat all of their rolls, you can leave the area (unless prevented by present circumstances.) This command is likely to be reworked soon."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "flee attempt"
COMMAND.stringArt = "a "
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
COMMAND.desc = "Used at the beginning of the fight to determine turn order. Some events may not require this command at all, and some may use it for different purposes."
COMMAND.category = "react"
COMMAND.stats = {
	["stm"] = 0.5
}
COMMAND.mult = 1
COMMAND.attackString = "reflexes"
COMMAND.stringArt = ""
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
COMMAND.desc = "Same as /firearmsburst except can specifically be used with revolvers, requires the Fan the Hammer trait."
COMMAND.category = "special"
COMMAND.trait = "fanthehammer"
COMMAND.parts = true
COMMAND.stats = {
	["accuracy"] = 0.35
}
COMMAND.mult = 1
COMMAND.attackString = "rapid fire revolver shot"
COMMAND.stringArt = "a "
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
COMMAND.uid = "backstab"
COMMAND.name = "Backstab"
COMMAND.desc = "Used when behind a target that is not aware of you (is engaged with something else, can't react to you, or doesn't know you're there.) Can be used with any melee weapon that has a blade.\nRequires the Rogue trait."
COMMAND.category = "special"
COMMAND.trait = "rogue"
COMMAND.stats = {
	["str"] = 0.1,
	["perception"] = 0.15,
	["stm"] = 0.25
}
COMMAND.mult = 1.5
COMMAND.attackString = "backstab"
COMMAND.stringArt = "a "
COMMAND.rolls = function(base, attribs)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "rapidstab"
COMMAND.name = "Rapid Stabbing"
COMMAND.desc = "A flurry of stabs, can only be used with one handed stabbing weapons (knives, shivs, etc).\nRequires the Rapid Stabbing trait."
COMMAND.category = "special"
COMMAND.trait = "rapidstab"
COMMAND.stats = {
	["str"] = 0.2,
	["perception"] = 0.1,
	["stm"] = 0.2
}
COMMAND.mult = 1
COMMAND.attackString = "rapid stab"
COMMAND.stringArt = "a "
COMMAND.rolls = function(base, attribs)
	local roll = math.abs(base + math.random(-10,10))
	local rolls = { 
		roll, 
		roll * 0.8, 
		roll * 0.6, 
	}
	
	return rolls
end

CMBT:Register( COMMAND )

//
local COMMAND = {}
COMMAND.uid = "defend"
COMMAND.name = "Defend"
COMMAND.desc = "Allows you to block an incoming attack on an alley, either with a weapon or your body. You must be near the target you wish to defend. A failure of this roll means that you will be hit instead, but your target will be protected. This roll can be used against bullets, but you must be able to see the enemy firing at the person you are defending. In that case, you are getting hit by the bullets in place of the one you're defending. This ability requires the Defender trait."
COMMAND.category = "special"
COMMAND.trait = "defender"
COMMAND.stats = {
	["perception"] = 0.1,
	["end"] = 0.2,
	["stm"] = 0.2
}
COMMAND.mult = 0.8
COMMAND.attackString = "defending a target"
COMMAND.stringArt = ""
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "throwaimed"
COMMAND.name = "Aimed Throw"
COMMAND.desc = "Used for accurately throwing any kind of object, specify what body part you are aiming at with your roleplay. Can be blocked like a melee attack. You must use a full turn to aim at a target, and then you can use this command on the next one. If the target moves after your aimed shot, you will have to aim again.\nRequires the Throwing Specialist trait."
COMMAND.category = "firearms"
COMMAND.trait = "thrower"
COMMAND.stats = {
	["str"] = 0.2,
	["accuracy"] = 0.3
}
COMMAND.mult = 1.1
COMMAND.attackString = "aimed throw"
COMMAND.stringArt = "an "
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )
//
local COMMAND = {}
COMMAND.uid = "interact"
COMMAND.name = "Interact"
COMMAND.desc = "An extra command that has no direct use unless the person running the event has assigned it one. This will typically be used for interacting with objects such as computers, machines, etc."
COMMAND.category = "special"
COMMAND.stats = {
	["medical"] = 0.3,
	["perception"] = 0.3,
	["luck"] = 0.1,
}
COMMAND.mult = 1
COMMAND.attackString = "interacting with something"
COMMAND.stringArt = ""
COMMAND.rolls = function(base)
	local rolls = { 
		math.abs(base + math.random(-10,10))
	}
	
	return rolls
end

CMBT:Register( COMMAND )