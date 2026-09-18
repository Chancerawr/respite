local PLUGIN = PLUGIN

nut.command.add("centsay", {
	adminOnly = true,
	syntax = "<string sentence>",
	onRun = function(client, arguments)
		if(!arguments) then
			client:notify("Put something for the CEnt to say.")
			return false
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
			return false
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
			return false
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
			return false
		end

		local msg = table.concat(arguments, " ")

		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			nut.chat.send(entity, "scream_npc", entity:Name().. " screams \"" ..msg.."\"")
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
			return false
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

nut.command.add("centnamerand", {
	adminOnly = true,
	syntax = "<bool lastname>",
	onRun = function(client, arguments)
		local name = nut.plugin.list["randomname"]:generateName()

		--only grab the first name
		if(!arguments[1]) then
			local nameTbl = string.Explode(" ", name)
			name = nameTbl[1]
		end
		
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
			
			if(entity.Type == "anim") then
				-- re-init the physics for prop CEnts
				entity:PhysicsInit(SOLID_VPHYSICS)
			end
			
			for k, v in ipairs(entity:GetSequenceList()) do
				if (v:lower():find("idle") and v != "idlenoise") then
					entity:ResetSequence(k)
					break
				end
			end
			
			entity.WalkAnim = nil
			entity.RunAnim = nil
			entity.IdleAnim = nil
			entity.AttackAnim = nil
			
			client:notify("Entity's model has been changed.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centmodelscale", {
	adminOnly = true,
	syntax = "<string model>",
	onRun = function(client, arguments)
		if(!tonumber(arguments[1])) then
			client:notify("Specify a model scale for the entity.")
			return false
		end
		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:SetModelScale(tonumber(arguments[1]))
			entity:Activate()
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
			client:notify(entity:Name().. " has been slain.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centrevive", {
	adminOnly = true,
	syntax = "<number health>",
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.deathData) then
			local deathData = entity.deathData
			local saveData = deathData.saveData
			
			local class = deathData.class
			
			local revive = ents.Create(class) --the new clone entity
			revive:SetPos(entity:GetPos() + Vector(0, 0, 10)) --set its position
			revive:SetAngles(Angle(0,0,0)) --set its angles
			
			revive:Spawn() --spawn it
			revive:loadSaveData(saveData)
			
			if(arguments[1]) then
				local newHealth = math.min(tonumber(arguments[1]), revive:getMaxHP())
				revive:setHP(newHealth)
			end

			SafeRemoveEntity(entity)

			client:notify((saveData.name or "CEnt").. " has been revived.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centstatue", {
	adminOnly = true,
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:statue()
			client:notify(entity:Name().. " has been turned into a statue.")
		else
			client:notify("You must be looking at a combat entity.")
		end
	end
})

nut.command.add("centplayercontrolled", {
	adminOnly = true,
	onRun = function(client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity.playerControlled = true
			client:notify(entity:Name().. " can now be selected by players.")
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

nut.command.add("centactionremove", {
	adminOnly = true,
	syntax = "<string action>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("Specify an action to remove.")
			return false
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			local action = PLUGIN:actionFind(arguments[1])
		
			if(action) then
				local actions = entity.actions or {}
				
				for k, v in pairs(actions) do
					if(v == action.uid) then
						actions[k] = nil
					end
				end

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

--creates a CEnt with mirrored stats from a player
nut.command.add("centmirror", {
	adminOnly = true,
	syntax = "<string target>",
	onRun = function(client, arguments)
		local entity = nut.command.findPlayer(client, arguments[1])
		if (IsValid(entity)) then --makes sure it's a CEnt (Combat Entity)
			local clone = ents.Create("nut_combat_drifter") --the new clone entity
			
			local char = entity:getChar()
			
			local trace = client:GetEyeTrace()
			if(!trace.HitPos) then return end
			
			clone:SetPos(trace.HitPos)
			clone:SetAngles(entity:GetAngles())
			
			clone:Spawn() --spawn it
			
			clone:setNetVar("name", entity:Name()) --set its custom name
			clone:setNetVar("desc", entity:getChar():getDesc()) --set its description			
	
			clone:SetModel(entity:GetModel())
			clone:SetMaterial(entity:GetMaterial())
			
			for k, v in pairs(entity:GetBodyGroups() or {}) do
				clone:SetBodygroup(v.id, entity:GetBodygroup(v.id))
			end
			
			clone:SetColor(entity:GetColor())
			
			clone.attribs = char:getAttribs()
			clone.res = entity:getRes()
			clone.amp = entity:getAmp()
			clone.armor = 0

			clone.dmg = {}

			for k, v in pairs(entity:getDamage()) do
				clone.dmg[v.dmgT] = v.dmg
			end
			
			clone.hp = entity:getHP()
			clone.hpMax = entity:getMaxHP()
			
			clone.mp = entity:getMP()
			clone.mpMax = entity:getMaxMP()

			clone:SetCreator(client) --prop protection
			
			clone:SetSequence(entity:GetSequence())
			
			local name = entity:Name()
			client:notify(name.. " has been mirrored.") --notify the player
		else --called if they aren't looking at the right thing
			client:notify("Specify a player.")
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
			entity:setHP(entity:getMaxHP())
			
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

nut.command.add("centmangle", {
	adminOnly = true,
	onRun = function(client, arguments)	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:setNetVar("mangled", true)
			
			local materials = {
				"models/flesh",
				"models/zombie_fast/fast_zombie_sheet",
				"models/skeleton/skeleton_bloody",
				"models/skeleton/skeleton",
			}
			
			--replace materials with random stuff
			for k, v in pairs(entity:GetMaterials()) do
				local roll = math.random(0,1)
				if(roll == 1) then --50% chance to replace a material
					local material = table.Random(materials)
				
					entity:SetSubMaterial(k-1, material)
				end
			end
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
	onGetColor = function(speaker, text)
		local client = LocalPlayer()
		local findName = client.Name and string.find(text, client:Name())
	
		if(speaker == client) then
			return PLUGIN.CHATCOLOR_REACT3
		elseif(findName) then
			return PLUGIN.CHATCOLOR_REACT2
		else
			return PLUGIN.CHATCOLOR_REACT
		end
	end,
	onChatAdd = function(speaker, text)
		-- If the player's name is in there, make the color different so they know it involves them.
		local client = LocalPlayer()
		local findName = client.Name and string.find(text, client:Name())
		
		if(speaker == client) then 
			chat.AddText(PLUGIN.CHATCOLOR_REACT3, text)
		elseif(findName) then
			chat.AddText(PLUGIN.CHATCOLOR_REACT2, text)
		else
			chat.AddText(PLUGIN.CHATCOLOR_REACT, text)
		end
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
		nut.plugin.list["routes"]:NetworkRouteData(self.Owner)
	
		local config = {
			["name"] = {weight = 1, name = "Name", value = entity:Name()},
			["desc"] = {weight = 2, name = "Description", value = entity:Desc()},		
			["hp"] = {weight = 3, name = "Health", value = entity:getHP()},
			["hpMax"] = {weight = 4, name = "Max Health", value = entity:getMaxHP()},
			["mp"] = {weight = 5, name = "Mana", value = entity:getMP()},
			["mpMax"] = {weight = 6, name = "Max Mana", value = entity:getMaxMP()},
			--["magic"] = {weight = 7, name = "Magic Bonus", value = entity.magic},
			["armor"] = {weight = 7, name = "Armor", value = entity.armor},
			--["dmg"] = {weight = 8, name = "Base Damage", value = entity.dmg},
		}
		
		local extra = {}
		extra.attribs = entity:getNetVar("attribs", entity.attribs)
		--extra.dmgT = entity.dmgT

		netstream.Start(client, "CEnt_config", entity, config, extra)
	end
	
	function PLUGIN:CEnt_configR(client, entity)	
		local extra = {}
		extra.res = entity:getNetVar("res", entity.res)
	
		netstream.Start(client, "CEnt_configR", entity, extra)
	end
	
	function PLUGIN:CEnt_configDMG(client, entity)		
		local extra = {}
		extra.dmg = entity:getNetVar("dmg", entity.dmg)
	
		netstream.Start(client, "CEnt_configDMG", entity, extra)
	end
	
	netstream.Hook("CEnt_configF", function(client, entity, data)
		if(data.attribs) then		
			entity:setNetVar("attribs", data.attribs)
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
		
		if(data.patrol) then
			if(data.patrol == "" or data.patrol == "None") then
				entity.patrol = {}
			else
				local route = nut.plugin.list["routes"].routes[data.patrol]
				if(route) then
					entity.patrol = {
						name = data.patrol,
						current = 1,
						wait = 1, --how long it waits before going to the next patrol point
						pause = false, --pauses the patrol, if it goes into combat or something
					}
				end
			end
		end
	end)
	
	netstream.Hook("CEnt_configRF", function(client, entity, data)
		if(data) then
			entity:setNetVar("res", data)
		end
	end)
	
	netstream.Hook("CEnt_configDMGF", function(client, entity, data)
		if(data) then
			entity:setNetVar("dmg", data)
		end
	end)
else
	netstream.Hook("CEnt_config", function(entity, config, extra)
		local command = vgui.Create("nutCombatCommand")
		command:CEntConfig(entity)
		
		--[[
		local attribs = extra.attribs or {}
		local patrol = extra.patrol or ""
		
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
			entry:SetMin(-1000)
			entry:SetValue(attribs[k] or 0)
			entry:Dock(TOP)
			
			configA[k] = entry
		end
		
		local routes = nut.plugin.list["routes"]
		if(routes) then
			local label = vgui.Create("DLabel", scroll)
			label:SetText("Patrol Route")
			label:Dock(TOP)
			
			configA["patrol"] = entry
			
			local entryP = vgui.Create("DComboBox", scroll)
			entryP:SetText(patrol or "None")
			entryP:Dock(TOP)
			entryP:AddChoice("None")
			for k, v in pairs(routes.routes) do
				entryP:AddChoice(k)
			end
			configF["patrol"] = entryP
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
		--]]
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
	
	local function dmgAddHelper(parent, line, dmg)
		local frame = vgui.Create("DFrame")
		frame:SetSize(200, 60)
		frame:Center()
		frame:SetTitle("Damage")
		frame:MakePopup()
		frame:ShowCloseButton(true)
		
		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local typeList = vgui.Create("DComboBox", scroll)
		typeList:SetPos(5, 30)
		typeList:SetSize(200, 20)
		typeList:Dock(TOP)
		
		for m, dmgTbl in pairs(PLUGIN.dmgTypes) do
			typeList:AddChoice(dmgTbl.name or dmgT, dmgT)
		end
		
		typeList.OnSelect = function(self, index, value, dmgT)
			Derma_StringRequest("Damage Value", "Damage Value", 1, function(dmgV)
				local newLine = parent:AddLine(dmgT, tonumber(dmgV))
				newLine.id = newLine:GetID()
				newLine.OnRightClick = line.OnRightClick
				
				dmg[dmgT] = tonumber(dmgV)
				
				frame:Remove()
			end)
		end
	end
	
	netstream.Hook("CEnt_configDMG", function(entity, extra)
		local dmg = extra.dmg or {}

		local frame = vgui.Create("DFrame")
		frame:SetSize(300, 240)
		frame:Center()
		frame:SetTitle("CEnt Damage")
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		frame.list = scroll:Add("DListView")
		frame.list:SetSize(60,160)
		frame.list:Dock(TOP)
		frame.list:DockMargin(0, 5, 0, 0)
		--self.list:EnableVerticalScrollbar()

		frame.list:AddColumn("Damage Type", 1)
		frame.list:AddColumn("Damage Value", 2)
	
		if(!dmg or table.IsEmpty(dmg)) then
			dmg = {
				["Slash"] = 1,
			}
		end

		for dmgT, dmgV in pairs(dmg) do
			local line = frame.list:AddLine(dmgT, dmgV)
			line.dmgT = dmgT
			line.dmgV = tonumber(dmgV)
			line.id = dmgT
			
			--options here, like add a new line or something
			line.OnRightClick = function(panel)
				-- Just make sure this is defined
				--self.areaData.music[panel.id] = self.areaData.music[panel.id] or {}
			
				local menu = DermaMenu()
				menu:AddOption("Edit Damage", function()
					Derma_StringRequest("Edit Damage", "Damage Value", panel.dmgV, function(text)
						local newDmg = tonumber(text)
						
						panel:SetValue(2, newDmg or panel.dmgV)
						panel.dmgV = newDmg
						
						dmg[panel.dmgT] = newDmg
					end)
				end):SetImage("icon16/textfield_add.png")
				menu:AddOption("Remove Entry", function()
					if(panel.dmgT) then
						dmg[panel.dmgT] = nil
					end

					panel:Remove()
				end):SetImage("icon16/textfield_delete.png")
				menu:AddOption( "Add Line", function()	
					dmgAddHelper(frame.list, panel, dmg)
				end):SetImage("icon16/textfield_add.png")
				
				menu:Open()
			end
		end
	
		local finishB = scroll:Add("DButton")
		finishB:SetSize(60,20)
		finishB:SetText("Complete")
		finishB:Dock(TOP)
		finishB.DoClick = function()
			netstream.Start("CEnt_configDMGF", entity, dmg)
			
			frame:Remove()
		end
	end)
end