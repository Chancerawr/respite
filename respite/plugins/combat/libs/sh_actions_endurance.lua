local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "hunker"
ACT.name = "Hunker Down"
ACT.desc = "Hunker down and prepare for incoming damage. Increases armor for the next hit you take."
ACT.category = "Endurance"
ACT.attackString = "hunkers down"
ACT.CD = 3
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["end"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Hunker Down",
		effect = "armor",
		duration = 2,
		strength = 1,
		
		hitsDef = 1,
		
		armor = 300,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "shield_bash"
ACT.name = "Shield Bash"
ACT.desc = "Hit an enemy with your shield (you need a shield). Can push enemies backwards. Does not count as an attack."
ACT.category = "Endurance"
ACT.attackString = "shield bashes"
ACT.CD = 4
ACT.dmg = 0
ACT.weaponMult = 2
ACT.reqStats = {
	["end"] = 15,
}
ACT.mult = {
	["end"] = 0.25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Forced Move",
		effect = "move",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "racket"
ACT.name = "Racket"
ACT.desc = "Make a lot of really annoying noise, which may draw the attention of enemies."
ACT.category = "Endurance"
ACT.attackString = "makes a ton of noise"
ACT.CD = 6
ACT.radius = 100
ACT.notarget = true
ACT.noSelf = true
ACT.reqStats = {
	["end"] = 20,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Taunt",
		effect = "taunt",
		duration = 1,
		strength = 1,
		
		chance = 75,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "endure_cleanse"
ACT.name = "Endure"
ACT.desc = "Cleanse yourself of most weak debuffs."
ACT.category = "Endurance"
ACT.attackString = "powers through pain and fatigue"
ACT.selfOnly = true
ACT.notarget = true
ACT.CD = 8
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Endure",
		effect = "strength",
		duration = 0,

		buff = true,
	}
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity

	local altPressed
	if(attacker.KeyDown and attacker:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end

	local buffs = target:getBuffs()
	for k, v in pairs(buffs) do
		if(v.debuff and v.strength <= 1) then
			target:removeBuff(v)
		end
	end
end
ACT.reqStats = {
	["end"] = 25,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "bolster"
ACT.name = "Bolster"
ACT.desc = "Double the armor of your target for 3 turns."
ACT.CD = 6
ACT.category = "Endurance"
ACT.attackString = "bolsters the defenses of their target"
ACT.reqStats = {
	["end"] = 30,
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end

	local armor = target:getArmor()

	local counter = {
		uid = actionTbl.uid,
		
		name = "Bolster",
		effect = "armor",
		duration = 3,
		strength = 1,

		armor = armor*2,
		
		buff = true,
	}
	target:addBuff(counter)
end
ACTS:Register(ACT)