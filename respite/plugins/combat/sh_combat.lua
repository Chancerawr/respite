local PLUGIN = PLUGIN

--these are used for the npcs, so they might be slightly different.
local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(140, 150, 140)
local CHATCOLOR_RESIST = Color(160, 150, 130)
local CHATCOLOR_SPECIAL = Color(150, 120, 100)

local CHATCOLOR_RED = Color(160, 60, 60)
local CHATCOLOR_GREEN = Color(60, 160, 60)

nut.command.add("cent", {
	adminOnly = true,
	syntax = "<String command>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a command for the entity to run.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			if(!entity:runCMD(client, arguments[1])) then
				client:notify("Invalid command.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centname", {
	adminOnly = true,
	syntax = "<String name>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a name for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("name", arguments[1])
			client:notify("Entity's name has been changed to " ..arguments[1].. ".")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centdesc", {
	adminOnly = true,
	syntax = "<String description>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a desc for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("desc", arguments[1])
			client:notify("Entity's description has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centmodel", {
	adminOnly = true,
	syntax = "<String model path>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a model for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:SetModel(arguments[1])
			client:notify("Entity's model has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centkill", {
	adminOnly = true,
	syntax = "<String model path>",
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:die()
			client:notify(entity:getNetVar("name").. " has been slain.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattrib", {
	adminOnly = true,
	syntax = "<String attribute> <number value>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a model for the entity.")
		end
		
		if(!arguments[2]) then
			client:notify("Specify a number value.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local attrib = string.lower(arguments[1])

			if(string.find("agility", attrib)) then
				entity.agil = arguments[2]
			elseif(string.find("strength", attrib)) then
				entity.stre = arguments[2]
			elseif(string.find("accuracy", attrib)) then
				entity.accu = arguments[2]
			elseif(string.find("craftiness", attrib)) then
				entity.craf = arguments[2]
			elseif(string.find("endurance", attrib)) then
				entity.endu = arguments[2]
			elseif(string.find("luck", attrib)) then
				entity.luck = arguments[2]
			elseif(string.find("perception", attrib)) then
				entity.perc = arguments[2]
			elseif(string.find("fortitude", attrib)) then
				entity.fort = arguments[2]
			else
				client:notify("Invalid attribute.")
			end	
			
			client:notify(arguments[1].. " set to " ..arguments[2].. ".")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.chat.register("react_fail", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RED, text)
	end,
	color = CHATCOLOR_RED,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("react_success", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_GREEN, text)
	end,
	color = CHATCOLOR_GREEN,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})


nut.chat.register("melee_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_MELEE, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("react_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_REACT, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("resist_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RESIST, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("firearms_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RANGED, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})

nut.chat.register("special_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_SPECIAL, text)
	end,
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})