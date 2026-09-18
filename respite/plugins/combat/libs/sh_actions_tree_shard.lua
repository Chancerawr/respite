local PLUGIN = PLUGIN

//
local ACT
ACT = {}
ACT.uid = "shard_heal"
ACT.name = "Healing Light"
ACT.desc = "Blast your target with a regenerative, healing light. Heals for 50."
ACT.category = "Shard"
ACT.attackString = "projects a healing light"
ACT.CD = 5
ACT.trait = "tree_shard"
ACT.onEffect = function(actionTbl, action, attacker, info)
	local trace = info.trace
	local target = trace.Entity
	local client = info.client
	
	if(client.KeyDown and client:KeyDown(IN_WALK)) then --self targetting
		target = client
	end

	target:addHP(50)
end
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Heal",
		effect = "heal",
		duration = 0,
		strength = 1,
		
		buff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "shard_focus"
ACT.name = "Focus Shard"
ACT.desc = "Focuses a beam of shard-light directly at a target. Applies a blind."
ACT.category = "Shard"
ACT.attackString = "focuses an extremely bright light"
ACT.CD = 3
ACT.dmg = 25
ACT.dmgT = "Shard"
ACT.trait = "tree_shard"
ACT.mult = {
	["end"] = 1,
}
ACT.effects = {
	[1] = {
		uid = ACT.uid,
		
		name = "Blind",
		effect = "blind",
		duration = 1,
		strength = 1,
		
		accuracy = -15,
		
		debuff = true,
	}
}
ACTS:Register(ACT)
//
local ACT
ACT = {}
ACT.uid = "corpse_burst_shard"
ACT.name = "Corpse Burst"
ACT.desc = "Animate a ghoul from a corpse, deals damage in a small area around the corpse"
ACT.category = "Shard"
ACT.attackString = "animates a ghoul from a corpse"
ACT.CD = 1
ACT.dmg = 25
ACT.dmgT = "Burn"
ACT.radius = 100
ACT.notarget = true
ACT.summon = "nut_combat_kuszo_creeper"
ACT.trait = "tree_shard"
ACT.onCanAct = function(actionTbl, client, data)
	local trace = data.trace
	local target = trace.Entity

	if(IsValid(target) and target:GetClass() == "prop_ragdoll") then
		SafeRemoveEntity(target)
	
		return true
	end
end
ACTS:Register(ACT)