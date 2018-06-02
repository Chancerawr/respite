local PLUGIN = PLUGIN
PLUGIN.name = "Combat"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A combat system based off of stats and rolling. Inspired by CWPNP."

local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(130, 150, 130)
local CHATCOLOR_RESIST = Color(160, 150, 130)

--potential parts to hit with random shots
	bParts = {}
    bParts[1] = "Skull"
    bParts[2] = "Head Glance"
    bParts[3] = "Left Eye"
    bParts[4] = "Nose"
    bParts[5] = "Mouth"
    bParts[6] = "Neck Flesh"
    bParts[7] = "Neck"
    bParts[8] = "Larynx"
    bParts[9] = "Neck Spine"
    bParts[10] = "Base of Neck"
    bParts[11] = "Left Shoulder"
    bParts[12] = "Right Shoulder"
    bParts[13] = "Left Shoulder Socket"
    bParts[14] = "Right Shoulder Socket"
    bParts[15] = "Left Shoulder Glance"
    bParts[16] = "Right Shoulder Glance"
    bParts[17] = "Left Upper Arm Bone"
    bParts[18] = "Right Upper Arm Bone"
    bParts[19] = "Left Upper Arm Flesh"
    bParts[20] = "Right Upper Arm Flesh"
    bParts[21] = "Left Arm Glance"
    bParts[22] = "Right Arm Glance"
	bParts[23] = "Left Elbow"
	bParts[24] = "Right Elbow"
	bParts[25] = "Left Forearm Flesh"
	bParts[26] = "Right Forearm Flesh"
	bParts[27] = "Left Forearm Bone"
	bParts[28] = "Right Forearm Bone"
	bParts[29] = "Left Hand"
	bParts[30] = "Right Hand"
	bParts[31] = "Left Scapula"
	bParts[32] = "Right Scapula"
	bParts[33] = "Heart"
	bParts[34] = "Left Lung"
	bParts[35] = "Right Lung"
	bParts[36] = "Upper Chest Spine"
	bParts[37] = "Lower Chest Spine"
	bParts[38] = "Abdomen Spine"
	bParts[39] = "Left Upper Chest Rib"
	bParts[40] = "Right Upper Chest Rib"
	bParts[41] = "Left Lower Chest Rib"
	bParts[42] = "Right Lower Chest Rib"
	bParts[43] = "Liver"
	bParts[44] = "Kidney"
	bParts[45] = "Stomach"
	bParts[46] = "Spleen"
	bParts[47] = "Large Intestine"
	bParts[48] = "Small Intestine"
	bParts[49] = "Left Pelvis"
	bParts[50] = "Center Pelvis"
	bParts[51] = "Right Pelvis"
	bParts[52] = "Torso Glance"
	bParts[53] = "Left Hip"
	bParts[54] = "Right Hip"
	bParts[55] = "Left Hip Socket"
	bParts[56] = "Right Hip Socket"
	bParts[57] = "Left Upper Leg Flesh"
	bParts[58] = "Right Upper Leg Flesh"
	bParts[59] = "Left Upper Leg Femur"
	bParts[60] = "Right Upper Leg Femur"
	bParts[61] = "Left Leg Glance"
	bParts[62] = "Right Leg Glance"
	bParts[63] = "Left Knee"
	bParts[64] = "Right Knee"
	bParts[65] = "Left Shin Flesh"
	bParts[66] = "Right Shin Flesh"
	bParts[67] = "Left Tibia"
	bParts[68] = "Right Tibia"
	bParts[69] = "Left Ankle"
	bParts[70] = "Right Ankle"
	bParts[71] = "Left Foot"
	bParts[72] = "Right Foot"
	bParts[73] = "Right Eye"
	bParts[74] = "Groin"
	bParts[75] = "Left Ear"
	bParts[76] = "Right Ear"
	bParts[77] = "Weapon"

local function traitModify(client, command, rolled)
	local char = client:getChar()
	local charTraits = char:getData("traits", {}) --the traits the character has
	local traits = TRAITS.traits --data for all traits
	
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData and traitData.modifier and traitData.modifier[command]) then --if the trait has a modifier for this command
				rolled = rolled * traitData.modifier[command] --modify it
			end
		end
	end
	
	return rolled
end

local function critModify(client, command) --ran when crits are computed
	local char = client:getChar()

	local base = char:getAttrib("luck") + 10 --base chance of crit ((luck + 10) / 1000
	local multi = 1.5 + char:getAttrib("luck")/25 --base crit multiplier
	
	local charTraits = char:getData("traits", {}) --the traits the character has
	if(charTraits) then 
		for k, v in pairs(charTraits) do --go through all of char's traits
			local traitData = traits[k] --the actual info of the trait
			if(traitData.critChance) then --if the trait has a modifier for this command
				base = base * traitData.critChance --modify it
			end			
			if(traitData.critMulti) then --if the trait has a modifier for this command
				multi = multi * traitData.critMulti --modify it
			end
		end
	end
	
	return base, multi
end
	
--calculates rolls for most basic rolling commands.
local function combatRollPart(client, attr, debuff, msg, command)
	local char = client:getChar()
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (char:getAttrib("luck", 0) + 10)) then
		crit = (1.5 + char:getAttrib("luck", 0)/25)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 5) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end

	local rolled = math.abs(attr + math.random(-10,10)) * crit
	rolled = rolled * debuff --reduction for command
	
	rolled = traitModify(client, command, rolled)
	
	local part = bParts[math.random(1, 77)]
	
	nut.log.addRaw(client:Name().." has rolled \""..rolled .." ".. part.."\".", 2)
	nut.chat.send(client, "firearms", "has rolled " .. rolled .. critmsg .. " for " .. msg .. part .. ".")
end

--calculates rolls for most basic rolling commands.
local function combatRoll(client, attr, debuff, msg, category, command, noPrint) --this is way too many parameters, it's killing me.
	local char = client:getChar()
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (char:getAttrib("luck", 0) + 10)) then
		crit = (1.5 + char:getAttrib("luck", 0)/25)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 5) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end

	local rolled = math.abs(attr + math.random(-10,10)) * crit
	rolled = rolled * debuff --reduction for command
	
	rolled = traitModify(client, command, rolled)
	
	local part = bParts[math.random(1, 77)]
	
	nut.log.addRaw(client:Name().." rolled \""..rolled.."\".", 2)
	if(!noPrint) then
		nut.chat.send(client, category, "has rolled " .. rolled .. critmsg .. " for " .. msg)
	end
	
	return rolled
end

--used for rolling for things other than yourself (drones, npcs, etc) VERY WIP
local function combatRollOther(client, attr, debuff, name, msg)
	local char = client:getChar()
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (char:getAttrib("luck", 0) + 10)) then
		crit = (1.5 + char:getAttrib("luck", 0)/25)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 5) then
			crit = 0
			critmsg = "(Fail!)"
		else
			crit = 1
		end
	end

	local rolled = math.abs(2.5 + math.random(-10,10)) * crit
	rolled = rolled * debuff --reduction for command
	
	rolled = traitModify(client, "drone", rolled)
	
	local part = bParts[math.random(1, 77)]
	
	nut.log.addRaw(client:Name().." has rolled \""..rolled .." ".. part.."\".", 2)
	nut.chat.send(client, "firearms", "'s " .. name .. " has rolled " .. rolled .. critmsg .. " for " .. msg .. part .. ".")
end

local function autoResolve(client, target, rollA, category, command)
	local char = target:getChar()
	local roll
	
	local dodge = char:getAttrib("stm", 0)* 0.5
	local block = (char:getAttrib("end", 0) * 0.3) + (char:getAttrib("str", 0) * 0.2)
	
	local evade
	
	dodge = combatRoll(target, dodge, 0.8, "a dodge/miss.", "react", "dodge", true)
	block = combatRoll(target, block, 0.8, "a block attempt.", "react", "block", true)
	
	--chooses better potential roll
	if(dodge > block) then --dodge
		roll = dodge
		evade = true
	else --block
		roll = block
		evade = false
	end
	
	if(rollA > roll) then
		nut.chat.send(client, category, "has hit " .. target:GetName() .. " with a " ..command.. " attack. (" .. rollA .. " : " .. roll .. ")")
	else
		if(evade) then
			nut.chat.send(target, "react", "has dodged " .. client:GetName() .. "'s " ..command.. " attack. (" .. rollA .. " : " .. roll .. ")")
		else
			nut.chat.send(target, "react", "has blocked " .. client:GetName() .. "'s " ..command.. " attack. (" .. rollA .. " : " .. roll .. ")")
		end
	end
end
	
--chat for colors and formatting.
nut.chat.register("melee", {
	format = "%s %s",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("react", { --reaction roll
	format = "%s %s",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})
	
nut.chat.register("firearms", {
	format = "%s %s",
	--most of the formatting is handled by roll command.
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("firearmsburst", {
	format = "%s has rolled %s for a burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("firearmsburstaimed", {
	format = "%s has rolled %s for an aimed burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("part", {
	format = "%s's projectile flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("partb", {
	format = "%s's burst shot flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("scavenge", {
	format = "%s has rolled %s for scavenging.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("fortitude", {
	format = "%s has rolled %s for fortitude.",
	color = CHATCOLOR_RESIST,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

--Bob has attempted to use an ability: genital strike, and rolled 69.
nut.chat.register("fortattack", {
	format = "%s has attempted to use an ability: %s.",
	color = Color(200,200,200),
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("endure", {
	format = "%s has rolled %s for enduring.",
	color = CHATCOLOR_RESIST,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("will", {
	format = "%s has rolled %s for willpower.",
	color = CHATCOLOR_RESIST,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

--actual commands
nut.command.add("drone", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = 5 --just has preset stats
		combatRollOther(client, attr, 1, "Drone", "a shot at target's ")
	end
})

nut.command.add("reflexes", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = (char:getAttrib("stm", 0)* 0.5)
		combatRoll(client, attr, 1, "reflexes.", "react", "reflexes")
	end
})

nut.command.add("flee", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = (char:getAttrib("stm", 0)* 0.5)
		combatRoll(client, attr, 1, "a flee attempt.", "react", "flee")
	end
})

nut.command.add("dodge", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = (char:getAttrib("stm", 0)* 0.5)
		combatRoll(client, attr, 0.8, "a dodge/miss.", "react", "dodge")
	end
})

nut.command.add("block", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("end", 0) * 0.3) + (char:getAttrib("str", 0) * 0.2))
		combatRoll(client, attr, 0.8, "a block attempt.", "react", "block")
	end
})

nut.command.add("defend", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.15) + (char:getAttrib("accuracy", 0) * 0.15) + (char:getAttrib("stm", 0) * 0.15))
		combatRoll(client, attr, 0.85, "defending a target.", "react", "defend")
	end
})

nut.command.add("firearms", {
	onRun = function(client, arguments)
		local char = client:getChar()
		
		if(arguments[1]) then
			local target = nut.command.findPlayer(client, arguments[1])
			
			if(!target) then
				client:notify("Target does not exist!")
				return false
			end
			
			local distance = client:GetPos():Distance(target:GetPos())
			
			local tarChar = target:getChar()
			local char = client:getChar()
			if(tarChar) then
				local part = bParts[math.random(1, 77)]
				--compares accuracy and strength to target's agility. Forms a roll based on the discrepancy.
				--accuracy / tarAgility = chance to hit (capped at a max of 85%) and then multiplied by range factor.
				--crit and crit fail
				local rangeRoll = math.Clamp(char:getAttrib("accuracy", 0) / tarChar:getAttrib("stm", 0) * (200 / distance), 0, 0.85)
				
				if(math.random(1,100) <= rangeRoll * 100) then
					--uses target's luck to determine critical miss (luck save)
					if(rangeRoll != 0.85 and math.random(1,1000) < tarChar:getAttrib("luck", 0) + 10) then
						--print("LuckSave!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and (unfortunately) MISSED! ("..math.Round(rangeRoll*100).."%)")
						nut.log.addRaw(client:Name().." missed \""..target:Name(), 2)
						--format = "%s has fired %s.",
					else
						--print("Success!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and HIT! ("..math.Round(rangeRoll*100)..")")
						nut.log.addRaw(client:Name().." hit \""..target:Name().. " in " .. part .. "\"", 2)
					end
				else
					--uses own luck to dtermine lucky shot if first attempt misses. (luck save)
					if(rangeRoll != 0 and math.random(1,1000) < char:getAttrib("luck", 0) + 10) then
						--print("LuckHit!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and (luckily) HIT! ("..math.Round(rangeRoll*100)..")")
						nut.log.addRaw(client:Name().." hit(luck) \""..target:Name().. " in " .. part .. "\"", 2)
					else
						--print("Failure!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and MISSED! ("..math.Round(rangeRoll*100)..")")
						nut.log.addRaw(client:Name().." missed \""..target:Name(), 2)
					end
				end
				nut.chat.send(client, "part", part)
			else
				client:notify("Target does not exist!")
				return false
			end
		else --firearms without specified target
			local attr = ((char:getAttrib("accuracy", 0) * 0.4) + (char:getAttrib("str", 0) * 0.1))
			combatRollPart(client, attr, 0.85, "a shot at target's ", "firearms")
		end
	end
})

nut.command.add("quickdraw", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("accuracy", 0) * 0.25) + (char:getAttrib("stm", 0) * 0.25))
		combatRollPart(client, attr, 0.5, "a quickdraw shot at target's ", "quickdraw")
	end
})

nut.command.add("firearmsaimed", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("accuracy", 0) * 0.4) + (char:getAttrib("str", 0) * 0.1))
		combatRoll(client, attr, 1.2, "an aimed shot.", "firearms", "firearmsaimed")
	end
})

nut.command.add("execute", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("accuracy", 0) * 0.4) + (char:getAttrib("str", 0) * 0.1))
		combatRoll(client, attr, 2, "an execution shot.", "firearms", "execute")
	end
})

nut.command.add("throw", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("accuracy", 0) * 0.25) + (char:getAttrib("str", 0) * 0.25))
		combatRollPart(client, attr, 1, "throwing an object at target's ", "throw")
	end
})

nut.command.add("akimbo", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("accuracy", 0) * 0.3) + (char:getAttrib("str", 0) * 0.2))
		combatRollPart(client, attr, 0.4, "an akimbo shot at target's ", "akimbo")
		combatRollPart(client, attr, 0.4, "an akimbo shot at target's ", "akimbo")
	end
})

nut.command.add("firearmsburst", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck", 0) + 10)) then
			crit = (1.5 + char:getAttrib("luck", 0)/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = ((char:getAttrib("accuracy", 0) * 0.35) + math.random(-10, 10)) * crit
		local part = bParts[math.random(1, 77)]
		if(math.random(0,100) < 5) then
			rolled = 0
			critmsg = "(Fail!)"
		end
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "firearmsburst", rolled) --trait modifier
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled .. critmsg)
		nut.chat.send(client, "partb", part)
	
		rolled = rolled * math.Clamp((0.6 + ((char:getAttrib("str", 0) * 4) / 1000)), 0, 1)
		part = bParts[math.random(1, 77)]
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled)
		nut.chat.send(client, "partb", part)
	
		rolled = rolled * math.Clamp((0.4 + ((char:getAttrib("str", 0) * 6) / 1000)), 0, 1)
		part = bParts[math.random(1, 77)]
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)		
		nut.chat.send(client, "firearmsburst", rolled)
		nut.chat.send(client, "partb", part)
	end
})

nut.command.add("firearmsburstaimed", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck", 0) + 10)) then
			crit = (1.5 + char:getAttrib("luck", 0)/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = ((char:getAttrib("accuracy", 0) * 0.35) + math.random(-10, 10)) * crit
		if(math.random(0,100) < 3) then
			rolled = 0
			critmsg = "(Fail!)"
		end
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "firearmsburstaimed", rolled) --trait modifier
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled .. critmsg)
	
		rolled = rolled * math.Clamp((0.6 + ((char:getAttrib("str", 0) * 4) / 1000)), 0, 1)
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "firearmsburst", rolled)
	
		rolled = rolled * math.Clamp((0.4 + ((char:getAttrib("str", 0) * 6) / 1000)), 0, 1)
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "firearmsburst", rolled)
	end
})

nut.command.add("melee", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
	
		if(!arguments[1]) then -- no target specified
			local char = client:getChar()
			local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
			combatRoll(client, attr, 1, "a melee attack.", "melee", "melee")
		else
			local target = nut.command.findPlayer(client, arguments[1])
			--i do this since it rolls twice up there for both dodge and block, pretty stupid but i dont know a better solution atm.
			local rollA = combatRoll(client, attr, 1, "a melee attack.", "melee", "melee", true)
			local rollB = combatRoll(client, attr, 1, "a melee attack.", "melee", "melee", true)
			
			if(rollB > rollA) then
				rollA = rollB
			end
			
			autoResolve(client, target, rollA, "melee", "melee")
		end
	end
})

nut.command.add("meleedual", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
		
		if(!arguments[1]) then -- no target specified
			combatRoll(client, attr, 0.4, "a dual melee attack.", "melee", "meleedual")
			combatRoll(client, attr, 0.4, "a dual melee attack.", "melee", "meleedual")
		else
			for i = 1, 2 do
				local target = nut.command.findPlayer(client, arguments[1])
				--i do this since it rolls twice up there for both dodge and block, pretty stupid but i dont know a better solution atm.
				local rollA = combatRoll(client, attr, 0.4, "a dual melee attack.", "melee", "meleedual", true)
				local rollB = combatRoll(client, attr, 0.4, "a dual melee attack.", "melee", "meleedual", true)
				
				if(rollB > rollA) then
					rollA = rollB
				end
				
				autoResolve(client, target, rollA, "melee", "dual melee")
			end
		end
	end
})

nut.command.add("flail", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((math.random(0,char:getAttrib("luck", 0)) * 0.5))
		for i=0, math.random(1,2) do
			if(!arguments[1]) then -- no target specified
				combatRoll(client, attr, .25, "a flailing melee attack.", "melee", "flail")
			else
				local target = nut.command.findPlayer(client, arguments[1])
				--i do this since it rolls twice up there for both dodge and block, pretty stupid but i dont know a better solution atm.
				local rollA = combatRoll(client, attr, .25, "a flailing melee attack.", "melee", "flail", true)
				local rollB = combatRoll(client, attr, .25, "a flailing melee attack.", "melee", "flail", true)
				
				if(rollB > rollA) then
					rollA = rollB
				end
				
				autoResolve(client, target, rollA, "melee", "flailing melee")
			end
		end
	end
})

nut.command.add("parry", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.15) + (char:getAttrib("accuracy", 0) * 0.15) + (char:getAttrib("stm") * 0.15) + (char:getAttrib("perception") * 0.1))
		combatRoll(client, attr, 0.8, "parrying.", "react", "parry")
	end
})

nut.command.add("disarm", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("medical", 0) * 0.2) + (char:getAttrib("accuracy", 0) * 0.2))
		combatRoll(client, attr, 1, "disarming.", "melee", "disarm")
	end
})

nut.command.add("suppress", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.15))
		combatRoll(client, attr, 1.1, "suppressing fire.", "firearms", "suppress")
	end
})

nut.command.add("grapple", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
		
		if(!arguments[1]) then -- no target specified
			combatRoll(client, attr, 1, "a grapple.", "melee", "grapple")
		else
			local target = nut.command.findPlayer(client, arguments[1])
			--i do this since it rolls twice up there for both dodge and block, pretty stupid but i dont know a better solution atm.
			local rollA = combatRoll(client, attr, 1, "a grapple.", "melee", "grapple", true)
			local rollB = combatRoll(client, attr, 1, "a grapple.", "melee", "grapple", true)
			
			if(rollB > rollA) then
				rollA = rollB
			end
			
			autoResolve(client, target, rollA, "melee", "grappling")
		end
	end
})

--should integrate fear meter here
nut.command.add("sneak", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("stm", 0)* 0.5))
		combatRoll(client, attr, 0.75, "sneaking.", "react", "sneak")
	end
})

--This is used for detecting sneaking targets, or for finding secrets
nut.command.add("perception", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = (char:getAttrib("perception", 0) * 0.5)
		combatRoll(client, attr, 1, "perceiving.", "react", "perception")
	end
})

--for resisting mental attacks (hallucinations, panic, etc)
nut.command.add("fortitude", {
	onRun = function(client, arguments)
		--these rolls cannot crit
		local char = client:getChar()
		local rolled = (((char:getAttrib("fortitude", 0) * 0.4) + (char:getAttrib("end", 0) * 0.1)) + math.random(-10, 10))
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "fortitude", rolled) --trait modifier
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "fortitude", rolled)
	end
})
--for resisting physical things (drugs, sound attacks, knockouts, etc)
nut.command.add("endure", {
	onRun = function(client, arguments)
		--these rolls cannot crit
		local char = client:getChar()
		local rolled = (((char:getAttrib("end", 0) * 0.4) + (char:getAttrib("fortitude", 0) * 0.1)) + math.random(-10, 10))
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "endure", rolled) --trait modifier
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "endure", rolled)
	end
})

--for controlling forged (drifter created) aberrations and tamed abominations
nut.command.add("will", {
	onRun = function(client, arguments)
		--these rolls cannot crit
		local char = client:getChar()
		local rolled = (((char:getAttrib("end", 0) * 0.25) + (char:getAttrib("fortitude", 0) * 0.25)) + math.random(-10, 10))
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "will", rolled) --trait modifier
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "will", rolled)
	end
})

--for resisting mental attacks (hallucinations, panic, etc)
nut.command.add("fortattack", {
	syntax = "<string type>",
	onRun = function(client, arguments)
		--these rolls cannot crit
		local char = client:getChar()
		local rolled = ((char:getAttrib("fortitude", 0) * 0.6) + math.random(-10, 10))
		rolled = math.abs(rolled)-- this is probably bad
		
		rolled = traitModify(client, "fortattack", rolled) --trait modifier
		
		local ability = {
			confusion = 0,
			nostalgia = 0,
			panic = 0,
			headache = 0,
			whisper = 0,
			echo = 0,

			phase = 0.05,
			simple_weapon = 0.05,
			blight = 0.05,
			blight_blast = 0.05,
			blight_suicide = 0.05,
			direct = 0.05,

			hallucination = 0.1,
			suggestion = 0.1,
			migraine = 0.1,
			emotion = 0.1,
			sensory = 0.1,
			telekinesis = 0.1,
			conjure_firearm = 0.1,
			blight_chains = 0.1,
			blight_shockwave = 0.1,
			shadow_meld = 0.1,
			open_portal = 0.1,

			paralyze = 0.2,
			sleep = 0.2,
			illusions = 0.2,
			cloak = 0.2,
			teleport = 0.2,
			temperature = 0.2,
			lesser_shade = 0.2,
			darkness = 0.2,
			conjure_special = 0.2,
			
			betray = 0.4,
			regenerate = 0.4,
			smokescreen = 0.4,
			minor_shade = 0.4,
			lights_out = 0.4,
			possession = 0.4,
			haze = 0.4,
			open_respite = 0.4,

			reality_bend = 0.75,
			moderate_shade = 0.75,
			time_reversal = 0.75,
			shadow_plague = 0.75
		}
		
		local fancyStr = arguments[1]
		
		if(ability[arguments[1]]) then
			local fancyStr = arguments[1]
			fancyStr = string.gsub(fancyStr, "_", " ") --replaces _ with a space.
			fancyStr = string.upper(fancyStr) --capitalizes all of it
			fancyStr = "'" .. fancyStr .. "'" --puts apostrophes around it i guess
			
			rolled = tonumber(rolled) * (1 - tonumber(ability[arguments[1]]))
			rolled = fancyStr ..", and rolled ".. rolled
		end
		--Bob has attempted to use an ability: genital strike, and rolled 69
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "fortattack", rolled)
	end
})

--stat print
nut.command.add("chargetattrib", {
	adminOnly = true,
	syntax = "<string name> <string type>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local findAtt = arguments[2]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = target:getChar():getAttrib(attribName, 0)
			
				client:notifyLocalized(target:Name() .." ".. findAtt .. ": " .. value)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

nut.command.add("train", {
	syntax = "<string attribute> <Roleplay training before using this>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local findAtt = arguments[1]
		local attribName
		for k, v in pairs(nut.attribs.list) do
			if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
				attribName = k
			end
		end
		
		if(attribName) then
			local lastTrain = char:getData("lastTrain")
			
			if(!lastTrain) then
				char:setData("lastTrain", 0)
				lastTrain = 0
			end
			
			if(lastTrain and math.abs(tonumber(lastTrain) - tonumber(os.date("%d"))) >= 2) then -- train once every 2 days.
				local value = char:getAttrib(attribName, 0)
				char:setData("lastTrain", os.date("%d"))
				char:updateAttrib(attribName, 1)

				client:notifyLocalized("You have increased your " .. findAtt .. ".")
			else
				client:notifyLocalized("You can only train once every 2 days.")
			end
		else
			client:notifyLocalized("Invalid Attribute")
		end
	end
})

nut.chat.register("statcheck", {
	format = "%s %s.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

--stat print
nut.command.add("statcheck", {
	adminOnly = true,
	syntax = "<string attribute>",
	onRun = function(client, arguments)
		if(IsValid(client) and client:getChar()) then
			local findAtt = arguments[1]
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
					attribName = k
				end
			end
			if(attribName) then
				local value = client:getChar():getAttrib(attribName, 0)
				local name = nut.attribs.list[attribName].name
		
				nut.chat.send(client, "statcheck", "has " .. value .. " for " .. name)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

--I'll put this somewhere better later
local lootTable = {
	["garbage"] = {
		"hl2_m_rock",
		"hl2_m_stick",
		"hl2_m_branch",
		"j_old_shoe",
		"j_bananaskin",
		"j_empty_bread_box",
		"j_dollar",
		"j_bucket",
		"j_cereal_box",
		"j_empty_antidepressants",
		"j_empty_bandage",
		"j_empty_beer",
		"j_empty_beer2",
		"j_empty_bleach",
		"j_empty_soda_can",
		"j_empty_soda2",
		"j_empty_soda1",
		"j_plastic_bag",
		"j_empty_chocolate_box",
		"j_used_first_aid_kit",
		"j_empty_juice_bottle",
		"j_empty_milk_carton",
		"j_empty_milk_jug",
		"j_empty_mountain_spring",
		"j_empty_mre",
		"j_empty_soda_bottle",
		"j_empty_takeout",
		"j_empty_vegetable_oil",
		"j_empty_vial",
		"j_empty_vodka",
		"j_empty_water",
		"j_empty_water_blood",
		"j_empty_whiskey",
		"j_empty_paint_can",
		"j_baby_doll",
		"j_empty_wine"
	},	
	["junk"] = {
		"j_blanket",
		"j_cactus_plant",
		"j_cigs",
		"j_cinder_block",
		"j_fire_extinguisher",
		"j_gear",
		"j_glasses",
		"j_goggles",
		"j_goggles2",
		"j_guitar",
		"j_headphones",
		"j_hula",
		"j_industrial_fan",
		"j_life_preserver",
		"j_meat_grinder",
		"j_computer_mouse",
		"j_paint_can",
		"j_painting1",
		"j_pickaxe_head",
		"j_picture_1",
		"j_picture_2",
		"j_picture_3",
		"j_picture_4",
		"j_picture_5",
		"j_pillow",
		"j_pliers",
		"j_old_rag",
		"j_soccerball",
		"j_syringe",
		"j_telephone",
		"j_tbrushes",
		"j_traffic_cone",
		"j_traffic_light",
		"j_tshirts",
		"j_stuffed_turtle",
		"j_broken_tv",
		"j_empty_gas_can",
		"j_dollar",
		"j_holster",
		"j_empty_mug",
		"j_empty_teapot",
		"j_family_picture",
		"j_paper_towels",
		"j_broken_receiver",
		"j_remote_control",
		"j_newspaper",
		"j_newspaper_stack",
		"j_map",
		"j_mounted_fish",
		"j_wall_light",
		"hl2_m_brokenbottle",
		"hl2_m_claypot",
		"hl2_m_fencepost",
		"hl2_m_hhradio",
		"hl2_m_keyboard",
		"hl2_m_steeringwheel",
		"hl2_m_valve",
		"hl2_m_weirdvase",
		"hl2_m_woodensign",
		"j_cards",
		"j_baseball_cap",
		"j_military_cap",
		"j_ushanka",
		"j_binoculars",
		"helmet_hard",
		"helmet_fire",
		"j_boonie",
		"j_beanie",
		"j_gloves",
		"armor_football",
		"coin_10"
	},
	["food"] = {
		"food_water",
		"food_beans",
		"food_instant_potatoes",
		"food_canned_1",
		"food_tuna",
		"food_mre",
		"food_asparagus",
		"food_chicken",
		"food_chili",
		"food_corn",
		"food_mushrooms",
		"food_peaches",
		"food_pears",
		"food_peas",
		"food_ravioli",
		"food_sausage",
		"food_chickennoodle",
		"food_chowder",
		"food_spam",
		"food_tomatoes",
		"food_yams",
		"food_bread_box"
	},		
	["food2"] = {
		"food_soda_bottled",
		"food_water",
		"food_water_mountain",
		"food_chinese",
		"food_cereal",
		"food_chips",
		"food_chocolate",
		"food_egg",
		"food_fish",
		"food_fish2",
		"food_milk_carton",
		"food_milk_jug",
		"food_mre",
		"food_tea",
		"food_donut",
		"food_hamburger",
		"food_hotdog",
		"food_orange",
		"food_lemon",
		"food_potato",
		"food_pumpkin",
		"food_soda_blueberry",
		"food_soda_cherry",
		"food_soda_lemon",
		"food_melon",
		"food_apple",
		"food_banana"
	},	
	["resources"] = {
		"j_scrap_light",
		"j_scrap_nails",
		"j_scrap_cloth",
		"j_scrap_rubber",
		"j_scrap_glass",
		"j_scrap_metals",
		"j_scrap_wood",
		"j_scrap_plastics",
		"j_scrap_elecs",
		"j_scrap_elastic",
		"j_scrap_concrete",
		"j_scrap_adhesive",
		"j_scrap_screws",
		"j_scrap_battery",
		"coin_10"
	},	
	["resources2"] = {
		"j_scrap_adhesive",
		"j_scrap_screws",
		"j_scrap_chems"
	},
	["weapon"] = {
		"hl2_m_lamp",
		"flashlight",
		"hl2_m_bat",
		"hl2_m_bat_metal",
		"hl2_m_crowbar",
		"hl2_m_crowbar_alt",
		"hl2_m_monsterclaw",
		"hl2_m_monstertalon",
		"hl2_m_frying_pan",
		"melee_paddle",
		"hl2_m_pipe",
		"hl2_m_pot",
		"hl2_m_suitcase"
	},
	["weapon2"] = {
		"hl2_m_knife",
		"hl2_m_machete",
		"hl2_m_meathook",
		"hl2_m_pickaxe",
		"hl2_m_pickaxe_alt",
		"hl2_m_pitchfork",
		"hl2_m_hatchet",
		"hl2_m_shovel",
		"hl2_m_shovel_alt",
		"hl2_m_lumberaxe",
		"melee_fireaxe"
	},	
	["tool"] = { --all scav kit items
		"hl2_m_wrench",
		"hl2_m_hammer",
		"j_drill",
		"j_power_saw"
	},	
	["med"] = {
		"medical_bandages",
		"medical_plastic",
		"drug_disinfectant",
		"drug_rubbingalcohol",
		"drug_antivenom",
		"drug_burnointment"
	},		
	["drug"] = {
		"drug_depress",
		"drug_psychotics",
		"drug_sleepingpills",
		"drug_venom"
	},	
	["med2"] = {
		"medical_bandages",
		"medical_gauze",
		"medical_kit",
		"medical_iv",
		"medical_suture",
		"medical_plastic",
		"drug_antibiotics",
		"drug_antivenom",
		"drug_burnointment",
		"drug_disinfectant",
		"drug_rubbingalcohol",
		"drug_painkillers",
		"drug_antipsychotics",
		"drug_antidepressants",
		"drug_steroid"
	},	
	["weird"] = {
		"purifier_water_tablet",
		"salve_healing",
		"cube_chip_enhanced",
		"ammo_battery",
		"ammo_sawblade",
		"haze_bottled_blood",
		"haze_bottled",
		"haze_bottled_pink",
		"drug_energy",
		"food_apple_cursed",
		"potion_agility",
		"potion_strength",
		"potion_accuracy",
		"potion_endurance",
		"potion_luck",
		"potion_craftiness",
		"potion_perception",
		"potion_fortitude"
	}
}

function lootRoll(roll)
	local item = "food_banana"
	
	if(roll < 10) then
		item = table.Random(lootTable["garbage"])
	elseif(roll < 20) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["garbage"])
		else
			item = table.Random(lootTable["junk"])
		end
	elseif(roll < 30) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["junk"])
		else
			item = table.Random(lootTable["food"])
		end
	elseif(roll < 40) then
		local ran = math.random(1,2)
		if(ran == 1) then
			item = table.Random(lootTable["junk"])
		else
			item = table.Random(lootTable["food"])
		end
	elseif(roll < 50) then
		local ran = math.random(1,3)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food"])
		else
			item = table.Random(lootTable["drug"])
		end
	elseif(roll < 60) then
		local ran = math.random(1,4)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon"])
		else
			item = table.Random(lootTable["tool"])
		end
	elseif(roll < 70) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med"])
		elseif(ran == 3) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 4) then
			item = table.Random(lootTable["weapon"])
		else
			item = "blight"
		end
	elseif(roll < 80) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["food2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 3) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 4) then
			item = table.Random(lootTable["weapon"])
		else
			item = "blight"
		end
	elseif(roll < 90) then
		local ran = math.random(1,5)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 4) then
			item = table.Random(lootTable["tool"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon2"])
		end
	elseif(roll < 100) then
		local ran = math.random(1,4)
		if(ran == 1) then
			item = table.Random(lootTable["resources2"])
		elseif(ran == 2) then
			item = table.Random(lootTable["med2"])
		elseif(ran == 3) then
			item = table.Random(lootTable["weapon2"])
		else
			item = table.Random(lootTable["tool"])
		end
	elseif(roll < 101 and roll > 99) then
		local ran = math.random(1,3)
		if(ran == 1) then
			item = "shard_dust"
		elseif(ran == 2) then
			item = "chip_escape"
		else
			item = "cube_chip_enhanced"
		end
	elseif(roll < 500) then
		item = table.Random(lootTable["weird"])
	end

	return item
end

nut.command.add("scavenge", {
	syntax = "<Roleplay scavenging before using this>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local luckroll = math.random(0, math.Clamp(char:getAttrib("luck", 0), 0, 100))
		local rolled = math.random(luckroll, 100)

		rolled = traitModify(client, "scavenge", rolled) --trait modifier
		
		local lastScav = char:getData("ScavD", 0) --the last day that they scavenged
		local scavNum = char:getData("Scavs", 0) --number of times they've scavenged
		
		if(lastScav != tonumber(os.date("%d"))) then --once per day.		
			local position = client:getItemDropPos()
		
			char:setData("ScavD", lastScav - 1)
			
			local foundItem = lootRoll(rolled)
			
			nut.item.spawn(foundItem, position)
			
			local niceName = nut.item.list[foundItem].name
			if(niceName) then
				client:notifyLocalized("You have found a " .. niceName .. ".")
				
				nut.log.addRaw(client:Name().." rolled \""..rolled.."\" and received a " ..niceName.. ".", 2)		
				nut.chat.send(client, "scavenge", rolled)
			end
			
			if(scavNum < 3) then
				char:setData("Scavs", char:getData("Scavs", 0) + 1)
			else
				char:setData("Scavs", 0)
				char:setData("ScavD", tonumber(os.date("%d"))) --they scavenged today
			end
		else
			client:notifyLocalized("You can only scavenge four times every day.")
		end
	end
})

function PLUGIN:GetStartAttribPoints()
	return 25
end