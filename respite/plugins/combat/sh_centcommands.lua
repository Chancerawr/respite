local PLUGIN = PLUGIN

--these are used for the npcs, so they might be slightly different.
local CHATCOLOR_MELEE = Color(155, 130, 130)
local CHATCOLOR_RANGED = Color(130, 130, 150)
local CHATCOLOR_REACT = Color(140, 150, 140)
local CHATCOLOR_GRAZE = Color(140, 100, 50)
local CHATCOLOR_RESIST = Color(160, 150, 130)
local CHATCOLOR_SPECIAL = Color(150, 120, 100)

local CHATCOLOR_RED = Color(160, 60, 60)
local CHATCOLOR_GREEN = Color(60, 160, 60)

nut.command.add("cent", {
	--adminOnly = true,
	syntax = "<string command>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a command for the entity to run.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			if(!entity:runCMD(client, arguments[1], arguments[2])) then
				client:notify("Invalid command.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centfa", {
	--adminOnly = true,
	syntax = "<string command>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a command for the entity to run.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:fortAttack(arguments[1])
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centname", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a name for the entity.")
			return false
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

nut.command.add("centsay", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "say_npc", entity:getNetVar("name", (entity.name or entity.PrintName)) .. " says, \"" ..msg.."\"")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centwhisper", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "whisper_npc", entity:Name().. " whispers \"" ..msg.."\"")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centyell", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "yell_npc", entity:Name().. " yells \"" ..msg.."\"")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centscream", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "scream_npc", entity:Name().. " yells \"" ..msg.."\"")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centme", {
	adminOnly = true,
	syntax = "<string action>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to do.")
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "say_npc", "**" ..entity:getNetVar("name", (entity.name or entity.PrintName)).. " " ..msg)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centdesc", {
	adminOnly = true,
	syntax = "<string description>",
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
	syntax = "<string model>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify a model for the entity.")
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:SetModel(arguments[1])
			
			for k, v in ipairs(entity:GetSequenceList()) do
				if (v:lower():find("idle") and v != "idlenoise") then
					entity:ResetSequence(k)
					break
				end
			end
			
			client:notify("Entity's model has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centkill", {
	adminOnly = true,
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

nut.command.add("centinvadd", {
	adminOnly = true,
	syntax = "<string item>",
	onRun = function(client, arguments)		
		if(!arguments[1]) then
			client:notify("Specify an item.")
			return
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local uniqueID = arguments[1]
		
			if(!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end
			
			if(!nut.item.list[uniqueID]) then
				client:notify("Invalid item.")
				return
			end
			
			table.insert(entity.inv, uniqueID)
			client:notify(nut.item.list[uniqueID].name.. " added to entity's inventory.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centinvremove", {
	adminOnly = true,
	syntax = "<string item>",
	onRun = function(client, arguments)		
		if(!arguments[1]) then
			client:notify("Specify an item.")
			return
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local uniqueID = arguments[1]
		
			if(!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end
			
			if(!nut.item.list[uniqueID]) then
				client:notify("Invalid item.")
				return
			end
			
			if(table.RemoveByValue(entity.inv, uniqueID)) then
				client:notify(nut.item.list[uniqueID].name.. " removed from entity's inventory.")
			else
				client:notify(nut.item.list[uniqueID].name.. " not found.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattrib", {
	adminOnly = true,
	syntax = "<string attribute> <number value>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify an attribute.")
			return
		end
		
		if(!arguments[2]) then
			client:notify("Specify a number value.")
			return
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local attrib = string.lower(arguments[1])
			local entAttribs = entity.attribs
			
			local attribKey
			local attribName
			for k, v in pairs(nut.attribs.list) do
				if (nut.util.stringMatches(v.name, attrib) or nut.util.stringMatches(k, attrib)) then
					attribKey = k
					attribName = v.name
				end
			end
			
			if(attribKey) then
				entAttribs[attribKey] = arguments[2]
				
				client:notify(attribName.. " set to " ..arguments[2].. ".")
			else
				client:notify("Invalid attribute specified.")
			end
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centattribs", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			
			local attribs = entity.attribs
			
			netstream.Start(client, "ShowAttribs", client, attribs)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centclone", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local clone = ents.Create(entity:GetClass()) --the new clone entity
			clone:SetPos(entity:GetPos()) --set its position
			clone:SetAngles(entity:GetAngles()) --set its angles
			
			clone:Spawn() --spawn it
			
			clone:SetModel(entity:GetModel()) --set its model
			clone:SetMaterial(entity:GetMaterial() or "") --set its material
			clone:SetColor(entity:GetColor() or Color(255,255,255))
			
			--sets its animation
			timer.Simple(1, function()
				if(IsValid(clone)) then
					clone:ResetSequence(entity:GetSequence())
				end
			end)
			
			clone:setNetVar("name", entity:getNetVar("name", entity.PrintName)) --set its custom name
			clone:setNetVar("desc", entity:getNetVar("desc", "")) --set its description			
			
			clone.inv = entity.inv
			
			--set its attributes
			clone.attribs = entity.attribs
			
			clone:SetCreator(client) --prop protection

			local name = entity:getNetVar("name", entity.PrintName)
			client:notify(name.. " has been cloned.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centcopy", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)
			local info = {
				class = entity:GetClass(),
				ang = entity:GetAngles(),
				mdl = entity:GetModel(),
				mat = entity:GetMaterial(),
				col = entity:GetColor(),
				name = entity:getNetVar("name", entity.PrintName),
				desc = entity:getNetVar("desc", ""),
				ani = entity:GetSequence(),
				inv = entity.inv,
				attribs = entity.attribs
			}	

			client.CEntC = info
			local name = entity:getNetVar("name", entity.PrintName)
			client:notify(name.. " has been copied.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("You must be looking at a combat entity.")
		end
	end
})

--clones a target Cent
nut.command.add("centpaste", {
	adminOnly = true,
	onRun = function(client, arguments)
		local info = client.CEntC
		if(info) then
			local clone = ents.Create(info.class) --the new clone entity
			clone:SetPos(client:GetEyeTrace().HitPos) --set its position
			clone:SetAngles(info.ang) --set its angles
			
			clone:Spawn() --spawn it
			
			clone:SetModel(info.mdl) --set its model
			clone:SetMaterial(info.mat) --set its material
			clone:SetColor(info.col)
			
			--sets its animation
			timer.Simple(1, function()
				if(IsValid(clone)) then
					clone:ResetSequence(info.ani)
				end
			end)
			
			clone:setNetVar("name", info.name) --set its custom name
			clone:setNetVar("desc", info.desc) --set its description			
			
			clone.inv = info.inv
			
			local attrib = info.attribs
			--set its attributes
			clone.attribs = info.attribs
			
			clone:SetCreator(client) --prop protection

			local name = clone:getNetVar("name", clone.PrintName)
			client:notify(name.. " has been pasted.") --notify the player
		end
	end
})

--creates a CEnt with mirrored stats from a player
nut.command.add("centmirror", {
	adminOnly = true,
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity --entity that we're looking at
		
		if (IsValid(entity) and entity:IsPlayer()) then --makes sure it's a CEnt (Combat Entity)
			local clone = ents.Create("nut_combat_dummy") --the new clone entity
			
			clone:SetPos(entity:GetPos())
			clone:SetAngles(entity:GetAngles())
			
			clone:Spawn() --spawn it
			
			clone:setNetVar("name", entity:Name()) --set its custom name
			clone:setNetVar("desc", entity:getChar():getDesc()) --set its description			
	
			clone:SetModel(entity:GetModel())
			clone:SetMaterial(entity:GetMaterial())
			
			clone:SetColor(entity:GetColor())
			
			clone.attribs = entity:getChar():getAttribs()

			clone:SetCreator(client) --prop protection
			
			local name = entity:Name()
			client:notify(name.. " has been mirrored.") --notify the player
		else --called if they aren't looking at the right thing
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
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_success", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_GREEN, text)
	end,
	color = CHATCOLOR_GREEN,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})


nut.chat.register("melee_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_MELEE, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("fort_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200,200,200), text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_REACT, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("graze_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_GRAZE, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("resist_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RESIST, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("firearms_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_RANGED, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("special_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(CHATCOLOR_SPECIAL, text)
	end,
	filter = "actions",
	font = "nutChatFontCombat",
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("whisper_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r - 35, color.g - 35, color.b - 35), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280) * 0.25,
	deadCanChat = true
})

nut.chat.register("say_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r, color.g, color.b), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280),
	deadCanChat = true
})

nut.chat.register("yell_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")
		
		chat.AddText(Color(color.r + 35, color.g + 35, color.b + 35), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280) * 2,
	deadCanChat = true
})

nut.chat.register("scream_npc", {
	onChatAdd = function(speaker, text)
		local color = nut.config.get("chatColor")

		chat.AddText(Color(200, 20, 20), text)
	end,
	filter = "actions",
	font = "nutChatFont",
	onCanHear = nut.config.get("chatRange", 280) * 4,
	deadCanChat = true
})