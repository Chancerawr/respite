local PLUGIN = PLUGIN
local INJURY

--given by shade attacks
--numbed, harder to use limb
--heals over time as it wears off, maybe even heals other injuries?
--memory wraps or shard dust to fix
INJURY = {}
INJURY.id = "blight"
INJURY.name = "Blighted"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Memory Wraps"] = true,
	["Shard"] = true,
}
INJURY.treats = "Blight"
INJURY.treatAmt = {0,6}
INJURY.think = function(client, partID, severity)
	--special exception for ichor
	--ichor + blight = shockwave
	--removes the ichor, causes more injuries

	local injuries = client:InjuryGetPart(partID)
	if(injuries) then
		if(injuries["ichor"]) then 
			client:InjuryReduce(partID, injuryID, severity)
			client:InjuryReduce(partID, INJURY.id, severity)
			
			local ranInjuries = {
				"fracture",
				"laceration",
				"puncture",
				"bruise",
			}

			for i = 1, 3 do
				local ranInjury = table.Random(ranInjuries)
			
				client:InjuryAdd(partID, ranInjury, math.random(severity*0.5, severity))
			end
		end
	end
end
PLUGIN:RegisterInjury(INJURY)

--memory monsters
--cause you to forget how to use your own limbs temporarily
--heals over time as you remember it, maybe leads to other memory related affliction
--memory wraps to fix
INJURY = {}
INJURY.id = "forgot"
INJURY.name = "Forgotten"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Memory Wraps"] = true
}
INJURY.think = function(self, client, partID, severity)
	--slowly fixes itself
	client:InjuryReduce(partID, INJURY.id, 1)
	
	local roll = math.random(1,100)
	if(roll < 1) then
		--give them a memory disease
	end
end
PLUGIN:RegisterInjury(INJURY)

--ichor has invaded the body part, making it difficult to use
--shard dust or venom to fix
INJURY = {}
INJURY.id = "ichor"
INJURY.name = "Ichor Infested"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Venom"] = true,
	["Shard"] = true,
}
INJURY.think = function(client, part)
	--should cause something
end
PLUGIN:RegisterInjury(INJURY)

--afflicted by certain attacks
--wastes only one i can think of right now
--health drops over time
--antibiotics to fix
INJURY = {}
INJURY.id = "rot"
INJURY.name = "Rotting"
INJURY.tags = {
	["External"] = true,
}
INJURY.treatment = {
	["Antibiotics"] = true,
}
INJURY.think = function(client, part)
	--damage player over time maybe?
end
PLUGIN:RegisterInjury(INJURY)