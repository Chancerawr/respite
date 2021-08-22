--[[
local PLUGIN = PLUGIN
PLUGIN.name = "Combat"
PLUGIN.author = "Chancer"
PLUGIN.desc = "A combat system based off of stats and rolling. Inspired by CWPNP."

local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(130, 150, 130)
local CHATCOLOR_RESIST = Color(160, 150, 130)

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

nut.chat.register("reflexes", {
	format = "%s has rolled %s for reflexes.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("flee", {
	format = "%s has rolled %s for a flee attempt.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("dodge", {
	format = "%s has rolled %s for a dodge or miss.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("block", {
	format = "%s has rolled %s for a block.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("defend", {
	format = "%s has rolled %s for a defend.",
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

nut.chat.register("firearmsaimed", {
	format = "%s has rolled %s for an aimed shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("execute", {
	format = "%s has rolled %s for an execution shot.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("throw", {
	format = "%s has rolled %s for a throw.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("akimbo", {
	format = "%s has rolled %s for an akimbo shot.",
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

nut.chat.register("melee", {
	format = "%s has rolled %s for a melee attack.",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("flail", {
	format = "%s has rolled %s for a flailing melee attack.",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("parry", {
	format = "%s has rolled %s for a parry.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("suppress", {
	format = "%s has rolled %s for suppressing fire.",
	color = CHATCOLOR_RANGED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("grapple", {
	format = "%s has rolled %s for a grapple.",
	color = CHATCOLOR_MELEE,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("sneak", {
	format = "%s has rolled %s for sneaking.",
	color = CHATCOLOR_REACT,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("perception", {
	format = "%s has rolled %s for perception.",
	color = CHATCOLOR_REACT,
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

nut.command.add("reflexes", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		
		local rolled = (math.random(0, 20) * (char:getAttrib("stm")/100) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "reflexes", rolled .. critmsg)
	end
})

nut.command.add("flee", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("stm")/100) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "flee", rolled .. critmsg)
	end
})

nut.command.add("dodge", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("stm") * 0.014) + math.random(0, 9)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "dodge", rolled .. critmsg)
	end
})

nut.command.add("block", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.010) + (char:getAttrib("accuracy") * 0.005)) + math.random(0, 9)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "block", rolled .. critmsg)
	end
})

nut.command.add("defend", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.005) + (char:getAttrib("accuracy") * 0.005) + (char:getAttrib("stm") * 0.004)) + math.random(0, 9)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "defend", rolled .. critmsg)
	end
})

nut.command.add("firearms", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local part = bParts[math.random(1, 77)]
		
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
				--compares accuracy and strength to target's agility. Forms a roll based on the discrepancy.
				--accuracy / tarAgility = chance to hit (capped at a max of 85%) and then multiplied by range factor.
				--crit and crit fail
				local rangeRoll = math.Clamp(char:getAttrib("accuracy") / tarChar:getAttrib("stm") * (200 / distance), 0, 0.85)
				
				if(math.random(1,100) <= rangeRoll * 100) then
					--uses target's luck to determine critical miss (luck save)
					if(rangeRoll != 0.85 and math.random(1,1000) < tarChar:getAttrib("luck") + 10) then
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
					if(rangeRoll != 0 and math.random(1,1000) < char:getAttrib("luck") + 10) then
						--print("LuckHit!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and (luckily) HIT! ("..math.Round(rangeRoll*100)..")")
						nut.log.addRaw(client:Name().." hit(luck) \""..target:Name().. " in " .. part .. "\"", 2)
					else
						--print("Failure!")
						nut.chat.send(client, "firearms", "has fired at " .. target:getChar():getName() .. " and MISSED! ("..math.Round(rangeRoll*100)..")")
						nut.log.addRaw(client:Name().." missed \""..target:Name(), 2)
					end
				end
			else
				client:notify("Target does not exist!")
				return false
			end
		else
			local crit = math.random(1, 1000)
			local critmsg = ""
			if (crit <= (char:getAttrib("luck") + 10)) then
				crit = (1.5 + char:getAttrib("luck")/25)
				critmsg = " (Crit!)"
			else
				crit = 1
			end
			local rolled = (math.random(0, 20) * ((char:getAttrib("accuracy") * 0.018) + (char:getAttrib("str") * 0.002)) + math.random(0, 10)) * crit
		
			nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)
			nut.chat.send(client, "firearms", " has rolled " .. rolled .. critmsg .. " for a shot.")
		end
		
		nut.chat.send(client, "part", part)
	end
})

nut.command.add("quickdraw", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("accuracy") * 0.009) + (char:getAttrib("stm") * 0.009)) + math.random(0, 10)) * crit * (.3) --30% penalty
		local part = bParts[math.random(1, 77)]
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)
		nut.chat.send(client, "firearms", "has rolled " .. rolled .. critmsg .. " for a quickdraw.")
		nut.chat.send(client, "part", part)
	end
})

nut.command.add("firearmsaimed", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = ((math.random(0, 20) * ((char:getAttrib("accuracy") * 0.019) + (char:getAttrib("str") * 0.001)) + math.random(0, 10)) + 2) * crit

		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "firearmsaimed", rolled .. critmsg)
	end
})

nut.command.add("execute", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = ((math.random(0, 20) * ((char:getAttrib("accuracy") * 0.019) + (char:getAttrib("str") * 0.001)) + math.random(0, 10)) * 2) * crit

		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "execute", rolled .. critmsg)
	end
})

nut.command.add("throw", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("accuracy") * 0.01) + (char:getAttrib("str") * 0.01)) + math.random(0, 10)) * crit
		local part = bParts[math.random(1, 77)]
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)
		nut.chat.send(client, "throw", rolled .. critmsg)
		nut.chat.send(client, "part", part)
	end
})

nut.command.add("akimbo", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 16) * ((char:getAttrib("accuracy") * 0.009) + (char:getAttrib("str") * 0.009)) + math.random(0, 8)) * crit
		local part = bParts[math.random(1, 77)]
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)
		nut.chat.send(client, "akimbo", rolled .. critmsg)
		nut.chat.send(client, "part", part)
		
		rolled = (math.random(0, 20) * ((char:getAttrib("accuracy") * 0.009) + (char:getAttrib("str") * 0.004)) + math.random(0, 10)) * crit * (.4) --40% penalty
		part = bParts[math.random(1, 77)]	
		
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)		
		nut.chat.send(client, "akimbo", rolled .. critmsg)
		nut.chat.send(client, "part", part)
	end
})

nut.command.add("firearmsburst", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("accuracy") * 0.016) + math.random(0, 8)) * crit
		local part = bParts[math.random(1, 77)]
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled .. critmsg)
		nut.chat.send(client, "partb", part)
	
		rolled = rolled * math.Clamp((0.6 + ((char:getAttrib("str") * 4) / 1000)), 0, 1)
		part = bParts[math.random(1, 77)]
		nut.log.addRaw(client:Name().." rolled \""..rolled.. " " .. part .. "\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled)
		nut.chat.send(client, "partb", part)
	
		rolled = rolled * math.Clamp((0.4 + ((char:getAttrib("str") * 6) / 1000)), 0, 1)
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
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("accuracy") * 0.016) + math.random(0, 8)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)	
		nut.chat.send(client, "firearmsburst", rolled .. critmsg)
	
		rolled = rolled * math.Clamp((0.6 + ((char:getAttrib("str") * 4) / 1000)), 0, 1)
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "firearmsburst", rolled)
	
		rolled = rolled * math.Clamp((0.4 + ((char:getAttrib("str") * 6) / 1000)), 0, 1)
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "firearmsburst", rolled)
	end
})

nut.command.add("melee", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.014) + (char:getAttrib("accuracy") * 0.006)) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2, 2)
		nut.chat.send(client, "melee", rolled)
	end
})

nut.command.add("flail", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck")*2 + 10)) then
			crit = (1.5 + char:getAttrib("luck")/10)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.014) + (math.random(0,char:getAttrib("luck")) * 0.003)) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "flail", rolled .. critmsg)
	end
})

nut.command.add("parry", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.005) + (char:getAttrib("accuracy") * 0.005) + (char:getAttrib("stm") * 0.005) + (char:getAttrib("perception") * 0.002)) + math.random(0, 8)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "parry", rolled .. critmsg)
	end
})

nut.command.add("suppress", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.016) + (char:getAttrib("accuracy") * 0.005)) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "suppress", rolled .. critmsg)
	end
})

nut.command.add("grapple", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * ((char:getAttrib("str") * 0.018) + (char:getAttrib("accuracy") * 0.002)) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)
		nut.chat.send(client, "grapple", rolled .. critmsg)
	end
})

--should integrate fear meter here
nut.command.add("sneak", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("stm")* 0.014) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "sneak", rolled .. critmsg)
	end
})

--This is used for detecting sneaking targets, or for finding secrets
nut.command.add("perception", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local crit = math.random(1, 1000)
		local critmsg = ""
		if (crit <= (char:getAttrib("luck") + 10)) then
			crit = (1.5 + char:getAttrib("luck")/25)
			critmsg = " (Crit!)"
		else
			crit = 1
		end
		local rolled = (math.random(0, 20) * (char:getAttrib("perception") * 0.02) + math.random(0, 10)) * crit
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "perception", rolled .. critmsg)
	end
})

nut.command.add("scavenge", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local luckroll = math.random(0, math.Clamp(char:getAttrib("luck"), 0, 100))
		local rolled = math.random(luckroll, 100)
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "scavenge", rolled)
	end
})
--for resisting mental attacks (hallucinations, panic, etc)
nut.command.add("fortitude", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local rolled = (math.random(0, 20) * ((char:getAttrib("fortitude") * 0.017) + (char:getAttrib("end") * 0.004)) + math.random(0, 10))
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "fortitude", rolled)
	end
})
--for resisting physical things (drugs, sound attacks, knockouts, etc)
nut.command.add("endure", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local rolled = (math.random(0, 20) * ((char:getAttrib("end") * 0.017) + (char:getAttrib("fortitude") * 0.004)) + math.random(0, 10))
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "endure", rolled)
	end
})

--for controlling forged (drifter created) aberrations and tamed abominations
nut.command.add("will", {
	onRun = function(client, arguments)
		local char = client:getChar()
		local rolled = (math.random(0, 20) * ((char:getAttrib("end") * 0.01) + (char:getAttrib("fortitude") * 0.01)) + math.random(0, 10))
		nut.log.addRaw(client:Name().." rolled \""..rolled.."\"", 2)		
		nut.chat.send(client, "will", rolled)
	end
})

--for resisting mental attacks (hallucinations, panic, etc)
nut.command.add("fortattack", {
	syntax = "<string type>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local rolled = (math.random(0, 20) * (char:getAttrib("fortitude") * 0.025) + math.random(0, 10))
		
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
				local value = target:getChar():getAttrib(attribName)
			
				client:notifyLocalized(target:Name() .." ".. findAtt .. ": " .. value)
			else
				client:notifyLocalized("Invalid Attribute")
			end
		end
	end
})

--stat print
nut.command.add("train", {
	syntax = "<string attribute>",
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
				local value = char:getAttrib(attribName)
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

function PLUGIN:GetStartAttribPoints()
	return 25
end

--]]