local PLUGIN = PLUGIN
PLUGIN.name = "Extra Chat Commands"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Screaming, long ranged /me, long ranged /it, etc."

--regular chat replacement
nut.chat.register("ic", {
	format = "%s says \"%s\"",
	onGetColor = function(speaker, text)
		-- If you are looking at the speaker, make it greener to easier identify who is talking.
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			return nut.config.get("chatListenColor")
		end

		-- Otherwise, use the normal chat color.
		return nut.config.get("chatColor")
	end,
	onCanHear = nut.config.get("chatRange", 280),
	onChatAdd = function(speaker, text)
		local suffix = string.sub(text, text:len())
		local teamColor = team.GetColor(speaker:getChar():getFaction())
		local speako = hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local pSay = string.upper(string.sub(text, 0, 1))..string.sub(text, 2)
		local pSayC = string.upper(string.sub(text, 0, 1))..string.sub(text, 2)-- fuck your period bullshit
		local nameCol = nut.config.get("chatColor")
		nameCol = Color(nameCol.r + 50, nameCol.g + 50, nameCol.b + 50)
		if suffix == "?" then
			if math.random(1, 2) == 1 then
				chat.AddText(nameCol, speako, nut.config.get("chatColor"), " asks \""..pSay.."\"")
			else
				chat.AddText(nut.config.get("chatColor"), "\""..pSay.."\" asks ", nameCol, speako)
			end
		elseif suffix == "!" then
			if math.random(1, 2) == 1 then
				chat.AddText(nameCol, speako, nut.config.get("chatColor"), " shouts \""..pSay.."\"")
			else
				chat.AddText(nut.config.get("chatColor"), "\""..pSay.."\" shouts ", nameCol, speako)
			end
		elseif suffix == "." then
			if math.random(1, 2) == 1 then
				chat.AddText(nameCol, speako, nut.config.get("chatColor"), " says \""..pSay.."\"")
			else
				chat.AddText(nut.config.get("chatColor"), "\""..pSay.."\" says ", nameCol, speako)
			end
		else
			chat.AddText(nut.config.get("chatColor"), speako, nut.config.get("chatColor"), " says \""..pSayC.."\"")
		end
	end
})

-- scream out loud.
nut.chat.register("s", {
	format = "%s screams \"%s\"",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
	-- Make the yell chat slightly brighter than IC chat.
	return Color(200, 20, 20)
end,
onCanHear = nut.config.get("chatRange", 280) * 4,
prefix = {"/s", "/scream"}
})

nut.chat.register("me's", {
	format = "**%s's %s",
	onGetColor = nut.chat.classes.ic.onGetColor,
	onCanHear = nut.config.get("chatRange", 280),
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r + 20, tempCol.b + 20, tempCol.g + 20)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako.."'s", texCol, " " ..text)
	end,
	prefix = {"/me's", "/action's"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
-- me close.
nut.chat.register("meclose", {
	format = "**%s %s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 0.25,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
				
		texCol = Color(texCol.r - 35, texCol.g - 35, texCol.b - 35)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r - 15, tempCol.b - 15, tempCol.g - 15)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako, texCol, " " ..text)
	end,
	prefix = {"/meclose", "/actionw", "/mew"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
nut.chat.register("meclose's", {
	format = "**%s's %s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r - 35, color.g - 35, color.b - 35)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 0.1,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
				
		texCol = Color(texCol.r - 35, texCol.g - 35, texCol.b - 35)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
			
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r - 15, tempCol.b - 15, tempCol.g - 15)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako.."'s", texCol, " " ..text)
	end,
	prefix = {"/meclose's", "/actionw's", "/mew's"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
-- me far.
nut.chat.register("mefar", {
	format = "**%s %s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
				
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end

		texCol = Color(texCol.r + 35, texCol.g + 35, texCol.b + 35)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
				
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
			
			texCol = Color(tempCol.r + 55, tempCol.b + 55, tempCol.g + 55)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako, texCol, " " ..text)
	end,
	prefix = {"/mefar", "/actiony", "/mey"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

nut.chat.register("mefar's", {
	format = "**%s' s%s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r + 35, color.g + 35, color.b + 35)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
				
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end

		texCol = Color(texCol.r + 35, texCol.g + 35, texCol.b + 35)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
				
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
			
			texCol = Color(tempCol.r + 55, tempCol.b + 55, tempCol.g + 55)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako.."'s", texCol, " " ..text)
	end,
	prefix = {"/mefar's", "/actiony's", "/mey's"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})		

-- me far far.
nut.chat.register("mefarfar", {
	format = "**%s %s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

				-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r + 45, color.g + 45, color.b + 45)
	end,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
				
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end

		texCol = Color(texCol.r + 45, texCol.g + 45, texCol.b + 45)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
				
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
			
			texCol = Color(tempCol.r + 65, tempCol.b + 65, tempCol.g + 65)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako, texCol, " " ..text)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	prefix = {"/mefarfar", "/actionyy", "/meyy"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
nut.chat.register("mefarfar's", {
	format = "**%s' s%s",
	onGetColor = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)

		-- Make the whisper chat slightly darker than IC chat.
		return Color(color.r + 45, color.g + 45, color.b + 45)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
				
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end

		texCol = Color(texCol.r + 45, texCol.g + 45, texCol.b + 45)
				
		local nameCol = Color(texCol.r + 30, texCol.g + 30, texCol.b + 30)
				
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
			
			texCol = Color(tempCol.r + 65, tempCol.b + 65, tempCol.g + 65)
			nameCol = Color(tempCol.r + 40, tempCol.b + 60, tempCol.g + 40)
		end
				
		chat.AddText(nameCol, "**"..speako.."'s", texCol, " " ..text)
	end,
	prefix = {"/mefarfar's", "/actionyy's", "/meyy's"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})


-- it close.
nut.chat.register("itclose", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(color.r - 35, color.g - 35, color.b - 35), "**"..text)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 0.25,
	prefix = {"/itclose", "itw"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- it far.
nut.chat.register("itfar", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(color.r + 35, color.g + 35, color.b + 35), "**"..text)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 2,
	prefix = {"/itfar", "ity"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})
		
-- it far far.
nut.chat.register("itfarfar", {
	onChatAdd = function(speaker, text)
		local color = nut.chat.classes.ic.onGetColor(speaker, text)
		chat.AddText(Color(color.r + 45, color.g + 45, color.b + 45), "**"..text)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	prefix = {"/itfarfar", "ityy"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- Private messages between players.
nut.chat.register("pm", {
	format = "[PM] %s: %s",
	color = Color(249, 211, 89),
	filter = "pm",
	deadCanChat = true
})

-- Out of character.
nut.chat.register("ooc", {
	onCanSay =  function(speaker, text)
		local delay = nut.config.get("oocDelay", 10)
		
		if (speaker:getChar():hasFlags("u")) then --ooc banning
			return false
		end

		-- Only need to check the time if they have spoken in OOC chat before.
		if (delay > 0 and speaker.nutLastOOC) then
			local lastOOC = CurTime() - speaker.nutLastOOC

			-- Use this method of checking time in case the oocDelay config changes.
			if (lastOOC <= delay) then
				speaker:notifyLocalized("oocDelay", delay - math.ceil(lastOOC))

				return false
			end
		end

		-- Save the last time they spoke in OOC.
		speaker.nutLastOOC = CurTime()
	end,
	onChatAdd = function(speaker, text)
		local icon = "icon16/user.png"
		local rank = "  "
		if (speaker:SteamID() == "STEAM_0:1:34930764") then
			icon = "icon16/script_gear.png"
			--rank = " "
		elseif (speaker:SteamID() == "STEAM_0:0:19814083") then
			icon = "icon16/gun.png"
			--rank = " "
		elseif (speaker:IsSuperAdmin()) then
			icon = "icon16/shield.png"
			--rank = "S"
		elseif (speaker:IsAdmin()) then
			icon = "icon16/star.png"
			--rank = "A"
		elseif (speaker:IsUserGroup("moderator") or speaker:IsUserGroup("operator")) then
			icon = "icon16/wrench.png"
			--rank = "M"
		elseif (speaker:IsUserGroup("vip") or speaker:IsUserGroup("donator") or speaker:IsUserGroup("donor")) then
			icon = "icon16/heart.png"
			--rank = "D"
		end

		icon = Material(hook.Run("GetPlayerIcon", speaker) or icon)

		chat.AddText(icon, Color(255, 50, 50), " [OOC] ", speaker, color_white, ": "..text)
	end,
	prefix = {"//", "/ooc"},
	noSpaceAfter = true,
	filter = "ooc"
})
		
-- Global events.
nut.chat.register("lev", {
	onCanSay =  function(speaker, text)
		return speaker:IsAdmin()
	end,
	onCanHear = nut.config.get("chatRange", 280) * 8,
	onChatAdd = function(speaker, text)
		chat.AddText(Color(225, 150, 20), text)
	end,
	prefix = {"/eventlocal", "/levent", "/lev"}
})