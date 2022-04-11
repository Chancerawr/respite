local PLUGIN = PLUGIN

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

nut.command.add("centname", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a name for the entity.")
			return false
		end
		
		local name = table.concat(arguments, " ")
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("name", name)
			client:notify("Entity's name has been changed to " ..name.. ".")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centdesc", {
	adminOnly = true,
	syntax = "<string description>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Specify a name for the entity.")
			return false
		end
		
		local desc = table.concat(arguments, " ")
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("desc", desc)
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
			return false
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

nut.command.add("centactionadd", {
	adminOnly = true,
	syntax = "<string action>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify an action to add.")
			return false
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local action = PLUGIN:actionFind(arguments[1])
		
			if(action) then
				local actions = entity.actions or {}
				actions[#actions + 1] = action.uid
				entity.actions = actions
				
				client:notify(entity:Name().. " now has the " ..(action.name or " ").. " action.")
			else
				client:notify("Invalid action.")
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

nut.command.add("centfollow", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if !(IsValid(entity) and entity.combat) then
			client:notify("You must be looking at a combat entity.")
			return false
		end
	
		if(!arguments[1]) then 
			entity.follow = nil
			client:notify(entity:Name().. " no longer following.")
			return
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target)) then
			entity.follow = target
			client:notify(entity:Name().. " is now following " ..target:Name().. ".")
		end
	end
})

nut.command.add("centfollowstop", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity.follow = nil
			client:notify(entity:Name().. " no longer following.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centrestore", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:SetHealth(entity:getMaxHP())
			
			client:notify("Health successfully restored.")
		end
	end
})

nut.command.add("centconfig", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			PLUGIN:CEnt_config(client, entity)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centres", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			PLUGIN:CEnt_configR(client, entity)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centdmg", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			PLUGIN:CEnt_configDMG(client, entity)
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.chat.register("react_fail", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_RED, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_success", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_GREEN, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})


nut.chat.register("melee_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_MELEE, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("fort_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(Color(200,200,200), text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("react_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_REACT, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("graze_npc", { --reaction roll
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_GRAZE, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("resist_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_RESIST, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("firearms_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_RANGED, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
	onCanHear = nut.config.get("chatRange", 280) * 5,
	deadCanChat = true
})

nut.chat.register("special_npc", {
	onChatAdd = function(speaker, text)
		chat.AddText(PLUGIN.CHATCOLOR_SPECIAL, text)
	end,
	filter = "actions",
	font = PLUGIN.COMBAT_FONT,
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

if(SERVER) then
	function PLUGIN:CEnt_config(client, entity)
		local config = {
			["name"] = {weight = 1, name = "Name", value = entity:Name()},
			["desc"] = {weight = 2, name = "Description", value = entity:Desc()},		
			["hp"] = {weight = 3, name = "Health", value = entity:getNetVar("hp", 0)},
			["hpMax"] = {weight = 4, name = "Max Health", value = entity:getNetVar("hpMax", 0)},
			["mp"] = {weight = 5, name = "Mana", value = entity:getNetVar("mp", 0)},
			["mpMax"] = {weight = 6, name = "Max Mana", value = entity:getNetVar("mpMax", 0)},
			--["magic"] = {weight = 7, name = "Magic Bonus", value = entity.magic},
			["armor"] = {weight = 7, name = "Armor", value = entity.armor},
			--["dmg"] = {weight = 8, name = "Base Damage", value = entity.dmg},
		}
		
		local extra = {}
		extra.attribs = entity.attribs
		--extra.dmgT = entity.dmgT
	
		netstream.Start(client, "CEnt_config", entity, config, extra)
	end
	
	function PLUGIN:CEnt_configR(client, entity)		
		local extra = {}
		extra.res = entity.res
	
		netstream.Start(client, "CEnt_configR", entity, extra)
	end
	
	function PLUGIN:CEnt_configDMG(client, entity)		
		local extra = {}
		extra.dmg = entity.dmg
	
		netstream.Start(client, "CEnt_configDMG", entity, extra)
	end
	
	netstream.Hook("CEnt_configF", function(client, entity, data)
		if(data.attribs) then		
			entity.attribs = data.attribs
		end
		
		if(data.name) then
			entity:setNetVar("name", data.name)
		end
		
		if(data.desc) then
			entity:setNetVar("desc", data.desc)
		end
		
		if(data.hp) then
			entity:setNetVar("hp", tonumber(data.hp))
		end		
		
		if(data.hpMax) then
			entity:setNetVar("hpMax", tonumber(data.hpMax))
		end
		
		if(data.mp) then
			entity:setNetVar("mp", tonumber(data.mp))
		end
		
		if(data.mpMax) then
			entity:setNetVar("mpMax", tonumber(data.mpMax))
		end
		
		if(data.armor) then
			entity.armor = tonumber(data.armor)
		end
	end)
	
	netstream.Hook("CEnt_configRF", function(client, entity, data)
		if(data) then
			entity.res = data
		end
	end)
	
	netstream.Hook("CEnt_configDMGF", function(client, entity, data)
		if(data) then
			entity.dmg = data
		end
	end)
else
	netstream.Hook("CEnt_config", function(entity, config, extra)
		local attribs = extra.attribs or {}
		
		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle("CEnt Configuration")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local configF = {}
		for k, v in SortedPairsByMemberValue(config, "weight") do
			local label = vgui.Create("DLabel", scroll)
			label:SetText(v.name)
			label:Dock(TOP)

			local entry = vgui.Create("DTextEntry", scroll)
			entry:SetText(v.value or "")
			entry:Dock(TOP)
			
			configF[k] = entry
		end
		
		local label = vgui.Create("DLabel", scroll)
		label:SetText("Attributes")
		label:Dock(TOP)
		
		local configA = {}
		for k, v in pairs(nut.attribs.list) do
			local label = vgui.Create("DLabel", scroll)
			label:SetText(v.name)
			label:Dock(TOP)

			local entry = vgui.Create("DNumberWang", scroll)
			entry:SetMax(1000)
			entry:SetValue(attribs[k] or 0)
			entry:Dock(TOP)
			
			configA[k] = entry
		end
		
		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local data = {}

			for k, v in pairs(configF) do
				data[k] = v:GetText()
			end
			
			data.attribs = {}
			for k, v in pairs(configA) do
				data.attribs[k] = tonumber(v:GetValue())
			end
			
			netstream.Start("CEnt_configF", entity, data)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end
	end)
	
	netstream.Hook("CEnt_configR", function(entity, extra)
		local res = extra.res or {}

		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle("CEnt Resistances")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local label = vgui.Create("DLabel", scroll)
		label:SetText("Resistances")
		label:Dock(TOP)
		
		local config = {}
		--damage type resistance customization
		for k, v in SortedPairsByMemberValue((PLUGIN.dmgTypes) or {}, "name") do
			local resL = vgui.Create("DLabel", scroll)
			resL:SetText(v.name)
			resL:Dock(TOP)
			
			local resC = vgui.Create("DNumberWang", scroll)
			resC.res = k
			resC:SetDecimals(2)
			resC:Dock(TOP)
			resC:SetMax(200)
			resC:SetMin(-200)
			resC:SetValue(res[k] or 0)
			
			config[k] = resC
		end
		
		--effect resistance
		--[[
		for k, v in pairs(EFFS.effects) do
			local resL = vgui.Create("DLabel", scroll)
			resL:SetText(v.name)
			resL:Dock(TOP)
			
			local resC = vgui.Create("DNumberWang", scroll)
			resC.resE = k
			resC:SetDecimals(2)
			resC:Dock(TOP)
			resC:SetMax(200)
			resC:SetMin(-200)
			resC:SetValue(res[k] or 0)
			
			config[k] = resC
		end
		--]]
		
		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local data = {}

			for k, v in pairs(config) do
				local value = tonumber(v:GetText())
				
				--exclude 0 values to not inflate data
				if(value and value != 0) then 
					data[k] = value
				end
			end
			
			netstream.Start("CEnt_configRF", entity, data)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end
	end)
	
	netstream.Hook("CEnt_configDMG", function(entity, extra)
		local dmg = extra.dmg or {}

		local frame = vgui.Create("DFrame")
		frame:SetSize(450, 600)
		frame:Center()
		frame:SetTitle("CEnt Damage")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local label = vgui.Create("DLabel", scroll)
		label:SetText("Damage Types")
		label:Dock(TOP)
		
		local config = {}
		--damage type resistance customization
		for k, v in SortedPairsByMemberValue((PLUGIN.dmgTypes) or {}, "name") do
			local dmgL = vgui.Create("DLabel", scroll)
			dmgL:SetText(v.name)
			dmgL:Dock(TOP)
			
			local dmgC = vgui.Create("DNumberWang", scroll)
			dmgC.dmg = k
			dmgC:SetDecimals(2)
			dmgC:Dock(TOP)
			dmgC:SetMax(200)
			dmgC:SetMin(-200)
			dmgC:SetValue(dmg[k] or 0)
			
			config[k] = dmgC
		end
		
		local finishB = vgui.Create("DButton", scroll)
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			local data = {}

			for k, v in pairs(config) do
				local value = tonumber(v:GetText())
				
				--exclude 0 values to not inflate data
				if(value and value != 0) then 
					data[k] = value
				end
			end
			
			netstream.Start("CEnt_configDMGF", entity, data)
			
			frame:Remove()
		end
		
		local cancelB = vgui.Create("DButton", scroll)
		cancelB:SetSize(60,20)
		cancelB:SetText("Cancel")
		cancelB:Dock(TOP)
		cancelB.DoClick = function()
			frame:Remove()
		end
	end)
end