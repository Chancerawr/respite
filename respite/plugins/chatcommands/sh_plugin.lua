local PLUGIN = PLUGIN
PLUGIN.name = "Extra Chat Commands"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Screaming, long ranged /me, long ranged /it, etc."

--overwriting default commands needs to be done in sh_chatbox, so this is for new things
-- scream out loud.
nut.chat.register("s", {
	format = "%s screams \"%s\"",
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
					
		chat.AddText(Color(200, 20, 20), speako.. " screams \""..text.."\"")
	end,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	prefix = {"/s", "/scream"}
})

nut.chat.register("me's", {
	format = "**%s's %s",
	onCanHear = nut.config.get("chatRange", 280),
	onChatAdd = function(speaker, text, anonymous)
		local speako = anonymous and "Someone" or hook.Run("GetDisplayedName", speaker, "ic") or (IsValid(speaker) and speaker:Name() or "Console")
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end

		texCol = Color(texCol.r, texCol.g, texCol.b)
		
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
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
		
		texCol = Color(texCol.r - 35, texCol.g - 35, texCol.b - 35)
		
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r - 15, tempCol.b - 15, tempCol.g - 15)
		end
	
		chat.AddText(texCol, "**"..text)		
	end,
	onCanHear = nut.config.get("chatRange", 280) * 0.25,
	prefix = {"/itclose", "/itw"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
})

-- it far.
nut.chat.register("itfar", {
	onChatAdd = function(speaker, text)
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
		
		texCol = Color(texCol.r + 35, texCol.g + 35, texCol.b + 35)
		
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r + 55, tempCol.b + 55, tempCol.g + 55)
		end
	
		chat.AddText(texCol, "**"..text)
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
		local texCol = nut.config.get("chatColor")
		if (LocalPlayer():GetEyeTrace().Entity == speaker) then
			texCol = nut.config.get("chatListenColor")
		end
		
		texCol = Color(texCol.r + 45, texCol.g + 45, texCol.b + 45)
		
		if(LocalPlayer() == speaker) then
			local tempCol = nut.config.get("chatListenColor")
					
			texCol = Color(tempCol.r + 65, tempCol.b + 65, tempCol.g + 55)
		end
	
		chat.AddText(texCol, "**"..text)
	end,
	onCanHear = nut.config.get("chatRange", 280) * 4,
	prefix = {"/itfarfar", "ityy"},
	font = "nutChatFontItalics",
	filter = "actions",
	deadCanChat = true
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

--Admin help
nut.chat.register("admin", {
	onCanSay =  function(speaker, text)
		return true
	end,
	onCanHear =  function(speaker, listener)
		if(listener:IsAdmin() or listener == speaker) then
			return true
		else
			return false
		end
	end,
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200, 50, 50), "[HELP] ".. speaker:GetName(), color_white, ": " ..text)
	end,
	prefix = {"/admin", "/help", "/report"}
})