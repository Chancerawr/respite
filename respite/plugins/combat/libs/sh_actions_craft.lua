local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "tuneup"
ACT.name = "Tune-Up"
ACT.desc = "Tune up an ally's weapon. Increases damage of their next attack."
ACT.category = "Craftiness"
ACT.attackString = "tunes up an ally's weapon, increasing the damage of its next attack"
ACT.CD = 3
ACT.reqStats = {
	["medical"] = 10,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Tune-Up",
		effect = "amp",
		duration = 1,
		strength = 1,
		
		hitsAttack = 1,
		
		amp = {
			["dmg"] = 50,
		},
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "overload"
ACT.name = "Overload"
ACT.desc = "Use your technical know-how to get more from your weapon, at the cost it possibly falling apart."
ACT.category = "Craftiness"
ACT.attackString = "overloads their weapon"
ACT.CD = 3
ACT.dmg = 0
ACT.weaponMult = 3
ACT.reqStats = {
	["medical"] = 15,
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "theorize"
ACT.name = "Theorize"
ACT.desc = "Tell an enemy a plan (real or fake) in detail, they will act is if they are certain you are going to do it, possibly even if it makes no sense."
ACT.category = "Craftiness"
ACT.attackString = "rambles off some sort of plan"
ACT.CD = 6
ACT.radius = 200
ACT.notarget = true
ACT.reqStats = {
	["medical"] = 20,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Theory",
		effect = "fear",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "disarm_cr"
ACT.name = "Disarm (Weapon)"
ACT.desc = "Hit a weak point in an enemy's weapon, causing it to not function properly."
ACT.category = "Craftiness"
ACT.attackString = "fires at their target's weapon"
ACT.CD = 5
ACT.reqStats = {
	["medical"] = 25,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Disarm",
		effect = "disarm",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "stabilize"
ACT.name = "Stabilize"
ACT.desc = "Remove weaker debuffs from your target."
ACT.CD = 6
ACT.category = "Craftiness"
ACT.attackString = ""
ACT.reqStats = {
	["medical"] = 30,
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
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Cleanse",
		effect = "cleanse",
		duration = 1,
		strength = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "innovate"
ACT.name = "Innovate"
ACT.desc = "Give a plethora of buffs to a single target for 1 turn."
ACT.CD = 99
ACT.category = "Craftiness"
ACT.attackString = "innovates"
ACT.reqStats = {
	["medical"] = 35,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Innovate",
		effect = "innovate",
		duration = 1,
		strength = 1,
		
		accuracy = 100,
		evasion = 100,
		armor = 200,
		
		critC = 10,
		critM = 0.25,
		critF = -1,
		
		attrib = {
			["luck"] = 5,
			["stm"] = 5,
			["str"] = 5,
			["end"] = 5,
			["fortitude"] = 5,
			["accuracy"] = 5,
			["perception"] = 5,
			["medical"] = 5,
		},
		
		res = {
			["dmg"] = 10,
			["effect"] = 10,
		},
		
		amp = {
			["dmg"] = 10,
		},
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "vulnerability"
ACT.name = "Vulnerability"
ACT.desc = "Point out a vulnerability in the target's defenses, lowering their armor and accuracy by 50 percent for 3 turns."
ACT.category = "Craftiness"
ACT.attackString = "exposes vulnerabilities in their target"
ACT.CD = 8
ACT.reqStats = {
	["medical"] = 35,
}
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity

	local altPressed
	if(attacker.KeyDown and attacker:KeyDown(IN_WALK)) then --self targetting
		target = attacker
	end

	local evasion = target:getEvasion()
	local armor = target:getArmor()
	
	local buff = {
		uid = actionTbl.uid,
		
		name = "Vulnerable",
		effect = "weak",
		duration = 3,
		strength = 1,
		
		evasion = evasion*-0.5,
		armor = armor*-0.5,
		
		debuff = true,
	}
	
	target:addBuff(buff)
end
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "scheme"
ACT.name = "Scheme"
ACT.desc = "Pitch a scheme to an ally of your choice, both you and them receive a buff to accuracy, evasion and armor."
ACT.CD = 10
ACT.category = "Craftiness"
ACT.attackString = "pitches a scheme to their target"
ACT.reqStats = {
	["medical"] = 35,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Scheming",
		effect = "scheme",
		duration = 3,
		strength = 1,
		
		accuracy = 20,
		evasion = 25,
		armor = 100,
		
		buff = true,
	},
	[2] = {
		uid = ACT.uid,
		
		name = "Scheming",
		effect = "scheme",
		duration = 3,
		strength = 1,
		
		accuracy = 20,
		evasion = 25,
		armor = 50,
		
		selfApply = true,
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "convince"
ACT.name = "Convince"
ACT.desc = "Convince an enemy to not attack you."
ACT.category = "Craftiness"
ACT.attackString = "tries to convince their target not to attack them"
ACT.CD = 5
ACT.reqStats = {
	["medical"] = 40,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Convince",
		effect = "taunt",
		duration = 3,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "confound"
ACT.name = "Confound"
ACT.desc = "Do something very confusing, which will confound an enemy. It may make strange decisions afterwards."
ACT.category = "Craftiness"
ACT.attackString = "confuses an enemy, causing it to behave differently"
ACT.CD = 5
ACT.reqStats = {
	["medical"] = 40,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Confuse",
		effect = "fear",
		duration = 1,
		strength = 1,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "motivate_med"
ACT.name = "Motivational Speech"
ACT.desc = "Motivate everyone in an area, they become more accurate, and deal more damage."
ACT.category = "Craftiness"
ACT.attackString = "motivates everyone in an area"
ACT.CD = 6
ACT.radius = 200
ACT.notarget = true
ACT.reqStats = {
	["medical"] = 45,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Motivated",
		effect = "motivate",
		duration = 2,
		strength = 1,
		
		accuracy = 30,
		
		amp = {
			["dmg"] = 40,
		},
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "craft"
ACT.name = "Craft"
ACT.desc = "Make something out of objects that you have. May or may not bend reality to make something useful, even if it normally wouldn't. The thing you craft will likely fall apart immediately after use."
ACT.category = "Craftiness"
ACT.attackString = "crafts something"
ACT.CD = 10
ACT.selfOnly = true
ACT.notarget = true
ACT.reqStats = {
	["medical"] = 50,
}
ACTS:Register(ACT)