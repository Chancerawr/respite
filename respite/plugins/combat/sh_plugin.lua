local PLUGIN = PLUGIN
PLUGIN.name = "Combat"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A combat system based off of stats and rolling. Inspired by CWPNP."

local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(130, 150, 130)
local CHATCOLOR_RESIST = Color(160, 150, 130)
local CHATCOLOR_SPECIAL = Color(150, 120, 100)

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
	
--used for rolling for things other than yourself (drones, npcs, etc) VERY WIP
local function combatRollOther(client, attr, debuff, name, msg)
	local char = client:getChar()
	local crit = math.random(1, 1000)
	local critmsg = ""
	if (crit <= (char:getAttrib("luck", 0) + 10)) then
		crit = (1.5 + char:getAttrib("luck", 0)/25)
		critmsg = " (Crit!)"
	else
		if(math.random(1,100) <= 3) then
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
	
	return rolled, part
end


CMBT = {}
CMBT.commands = {}
function CMBT:Register( tbl )
	self.commands[ tbl.uid ] = tbl
end

function CMBT:GetAll()
	return self.commands
end

local function critCalc(char)
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
	
	return crit, critmsg
end

local function rollHandle(client, command, noPrint)
	local comTable = CMBT.commands[command]
	local char = client:getChar()
	
	local part
	local crit, critmsg = 1, ""
	
	local base = 0
	for k, v in pairs(comTable.stats) do
		base = base + char:getAttrib(k, 0) * v
	end
	
	local attribs = {}
	for k, v in pairs(nut.attribs.list) do
		attribs[k] = char:getAttrib(k, 0)
	end
	
	if(base < 0) then
		base = 0
	end
	
	local rolls = comTable.rolls(base, attribs)
	for k, roll in pairs(rolls) do
		roll = roll * comTable.mult
		roll = traitModify(client, command, roll)
		
		if(comTable.parts) then
			part = table.Random(bParts)
		end
		
		if(!comTable.noCrit) then
			crit, critmsg = critCalc(char)
			roll = roll * crit
		end
		
		if(!noPrint) then
			if(!comTable.print) then	
				--detects the currently held weapon and (hopefully) the item it's associated with
				local weapon = ""
				if(comTable.category == "melee" or comTable.category == "firearms") then
					local curWeapon = client:GetActiveWeapon():GetClass()
					if(curWeapon != "nut_hands" and curWeapon != "nut_keys") then
						local items = char:getInv():getItems()
						for k, v in pairs(items) do
							if(v.base == "base_weapons" and curWeapon == v.class and v:getData("equip", nil)) then
								weapon = " (" ..v:getName().. ")"
							end
						end
					end
				end
			
				if(!part) then
					nut.log.addRaw(client:Name().." rolled \""..roll.."\".", 2)
					nut.chat.send(client, comTable.category, "has rolled " ..roll..critmsg.. " for " ..comTable.attackString .. "." .. weapon)
				else
					nut.log.addRaw(client:Name().." has rolled \""..roll .." ".. part.."\".", 2)
					nut.chat.send(client, comTable.category, "has rolled " ..roll..critmsg.. " for " ..comTable.attackString.. " at target's " ..part.. "." .. weapon)
				end
			else
				comTable.print(rolls, part)
			end
		end
	end
	
	return rolls
end
	
--chat for colors and formatting.
nut.chat.register("melee", {
	format = "%s %s",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("react", { --reaction roll
	format = "%s %s",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("resist", {
	format = "%s %s",
	color = CHATCOLOR_RESIST,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})
	
nut.chat.register("firearms", {
	format = "%s %s",
	--most of the formatting is handled by roll command.
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})	

nut.chat.register("special", {
	format = "%s %s",
	color = CHATCOLOR_SPECIAL,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("firearmsburst", {
	format = "%s has rolled %s for a burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("firearmsburstaimed", {
	format = "%s has rolled %s for an aimed burst fire shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("part", {
	format = "%s's projectile flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("partb", {
	format = "%s's burst shot flies at the target's %s.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("scavenge", {
	format = "%s has rolled %s for scavenging.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

--Bob has attempted to use an ability: genital strike, and rolled 69.
nut.chat.register("fortattack", {
	format = "%s has attempted to use an ability: %s.",
	color = Color(200,200,200),
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

--actual commands
nut.command.add("drone", {
	onRun = function(client, arguments)
		local attr = 5 --just has preset stats
		combatRollOther(client, attr, 1, "Drone", "a shot at target's ")
	end
})

nut.command.add("reflexes", {
	onRun = function(client, arguments)
		rollHandle(client, "reflexes")
	end
})

nut.command.add("flee", {
	onRun = function(client, arguments)
		rollHandle(client, "flee")
	end
})

nut.command.add("dodge", {
	onRun = function(client, arguments)
		rollHandle(client, "dodge")
	end
})

nut.command.add("block", {
	onRun = function(client, arguments)
		rollHandle(client, "block")
	end
})

nut.command.add("defend", {
	onRun = function(client, arguments)
		if(!hasTrait(client, "defender")) then
			client:notify("You do not have the Defender trait.")
			return false
		end	
	
		rollHandle(client, "defend")
	end
})

nut.command.add("firearms", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "firearms", true)
			entity:reaction(client, rollA, "firearms", "shot", true)
		else
			rollHandle(client, "firearms")
		end
	end
})

nut.command.add("quickdraw", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "quickdraw", true)
			entity:reaction(client, rollA, "firearms", "quickdraw shot", true)
		else
			rollHandle(client, "quickdraw")
		end
	end
})

nut.command.add("firearmsaimed", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "firearmsaimed", true)
			entity:reaction(client, rollA, "firearms", "aimed shot")
		else
			rollHandle(client, "firearmsaimed")
		end
	end
})

nut.command.add("execute", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "execute", true)
			entity:reaction(client, rollA, "firearms", "execution shot")
		else	
			rollHandle(client, "execute")
		end
	end
})

nut.command.add("throw", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "throw", true)
			entity:reaction(client, rollA, "firearms", "thrown object", true)
		else
			rollHandle(client, "throw")
		end
	end
})

nut.command.add("akimbo", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "akimbo", true)
			entity:reaction(client, rollA, "firearms", "akimbo shot", true)
		else
			rollHandle(client, "akimbo")
		end
	end
})

nut.command.add("firearmsburst", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "firearmsburst", true)
			entity:reaction(client, rollA, "firearms", "burst shot", true)
		else			
			rollHandle(client, "firearmsburst")
		end
	end
})

nut.command.add("revolverburst", {
	onRun = function(client, arguments)
		if(!hasTrait(client, "fanthehammer")) then
			client:notify("You do not have the Fan the Hammer trait.")
			return false
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "revolverburst", true)
			entity:reaction(client, rollA, "firearms", "revolver rapid fire shot", true)
		else			
			rollHandle(client, "revolverburst")
		end
	end
})

nut.command.add("firearmsburstaimed", {
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "firearmsburstaimed", true)
			entity:reaction(client, rollA, "firearms", "aimed burst shot")
		else
			rollHandle(client, "firearmsburstaimed")
		end
	end
})

nut.command.add("melee", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "melee", true)
			entity:reaction(client, rollA, "melee", "melee attack")
		else
			rollHandle(client, "melee")
		end
	end
})

nut.command.add("meleedual", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "meleedual", true)
			entity:reaction(client, rollA, "melee", "dual melee attack")
		else
			rollHandle(client, "meleedual")
		end
	end
})

nut.command.add("flail", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((math.random(0,char:getAttrib("luck", 0)) * 0.5))
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "flail", true)
			entity:reaction(client, rollA, "melee", "flailing melee attack")
		else
			rollHandle(client, "flail")
		end
	end
})

nut.command.add("parry", {
	onRun = function(client, arguments)
		rollHandle(client, "parry")
	end
})

nut.command.add("disarm", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("medical", 0) * 0.2) + (char:getAttrib("accuracy", 0) * 0.2))
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "disarm", true)
			entity:reaction(client, rollA, "other", "disarming maneuver")
		else
			rollHandle(client, "disarm")
		end
	end
})

nut.command.add("suppress", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.15))
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "suppress", true)
			entity:reaction(client, rollA, "firearms", "suppression")
		else
			rollHandle(client, "suppress")
		end
	end
})

nut.command.add("grapple", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local attr = ((char:getAttrib("str", 0) * 0.4) + (char:getAttrib("accuracy", 0) * 0.1))
		
		if (IsValid(entity) and entity.combat) then
			local rollA = rollHandle(client, "grapple", true)
			entity:reaction(client, rollA, "melee", "grapple")
		else
			rollHandle(client, "grapple")
		end
	end
})

--should integrate fear meter here
nut.command.add("sneak", {
	onRun = function(client, arguments)
		rollHandle(client, "sneak")
	end
})

--This is used for detecting sneaking targets, or for finding secrets
nut.command.add("perception", {
	onRun = function(client, arguments)
		rollHandle(client, "perception")
	end
})

--for resisting mental attacks (hallucinations, panic, etc)
nut.command.add("fortitude", {
	onRun = function(client, arguments)
		rollHandle(client, "fortitude")
	end
})

--for resisting physical things (drugs, sound attacks, knockouts, etc)
nut.command.add("endure", {
	onRun = function(client, arguments)
		rollHandle(client, "endure")
	end
})

--for controlling forged (drifter created) aberrations and tamed abominations
nut.command.add("will", {
	onRun = function(client, arguments)
		rollHandle(client, "will")
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
				nut.log.addRaw(client:Name().." trained \""..attribName.."\".", 2)	
				
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
	onCanHear = nut.config.get("chatRange", 280) * 4,
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

function PLUGIN:GetStartAttribPoints()
	return 25
end

nut.util.include("sh_combat.lua")
nut.util.include("sh_scav.lua")
nut.util.include("sh_commands.lua")