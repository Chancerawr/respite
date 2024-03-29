PLUGIN.name = "Extra Commands"
PLUGIN.author = "Chancer & Angelsaur"
PLUGIN.desc = "A few useful commands."

nut.command.add("setnick", {
	syntax = "[String Nickname]",
	onRun = function(client, arguments)
		if (arguments[1]) then
			if (!string.find(client:Name(), "'")) then
				local name = string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[2]
				
				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			else
				local name = string.Split(client:getChar():getName(), " ")
				string.Split(client:getChar():getName(), " ")
				local newName = name[1].." '"..arguments[1].."' "..name[3]
				
				client:getChar():setName(newName)
				client:ChatPrint("Your name is now "..newName..".")
			end;
		else
			client:ChatPrint("You need to enter a nickname.")
		end;
	end;
})

nut.command.add("removenick", {
	syntax = "",
	onRun = function(client, arguments)
		if (!string.find(client:Name(), "'")) then
			client:ChatPrint("No nickname was detected.")
		else
			local name = string.Split(client:getChar():getName(), " ")
			string.Split(client:getChar():getName(), " ")
			local newName = name[1].." "..name[3]
			
			client:getChar():setName(newName)
			client:ChatPrint("Your name is now "..newName..".")
		end;
	end;
})

nut.command.add("charselectskin", {
	syntax = "[number skin]",
	onRun = function(client, arguments)
		local skin = tonumber(arguments[1])
		local target = client

		if (IsValid(target) and target:getChar()) then
			target:getChar():setData("skin", skin)
			target:SetSkin(skin or 0)

			--nut.util.notifyLocalized("cChangeSkin", nil, client:Name(), target:Name(), skin or 0)
		end
	end
})

nut.command.add("charselectbodygroup", {
	syntax = "<string bodyGroup> [number value]",
	onRun = function(client, arguments)
		local value = tonumber(arguments[2])
		
		if(!arguments[1]) then
			client:notify("No bodygroup specified.")
			return false
		end
		
		if (IsValid(client) and client:getChar()) then
			local index = client:FindBodygroupByName(arguments[1])

			if (index > -1) then
				if (value and value < 1) then
					value = nil
				end

				local groups = client:getChar():getData("groups", {})
				groups[index] = value
				client:getChar():setData("groups", groups)
				client:SetBodygroup(index, value or 0)

				client:notify("Bodygroup changed successfully")
				--nut.util.notifyLocalized("cChangeGroups", nil, client:Name(), target:Name(), arguments[2], value or 0)
			else
				return "@invalidArg", 2
			end
		end
	end
})

nut.command.add("cleanitems", {
	syntax = "[number range]",
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
		
		if(!arguments[1]) then
			client:requestQuery("Are you sure you want delete all items on the map?", "Clean Items", function(text) --confirmation message
				for k, v in pairs(ents.FindByClass("nut_item")) do
					count = count + 1
					v:Remove()
				end
				
				client:notify(count.. " items have been cleaned up from the map.")
			end)
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do	
				if IsValid(v) and (v:GetClass() == "nut_item") then
					count = count + 1
					v:Remove()
				end
			end
			
			client:notify(count.. " items have been cleaned up from the map.")
		end
	end
})

nut.command.add("cleaneditors", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.FindByClass("edit_fog")) do
				count = count + 1
				v:Remove()
			end
			
			for k, v in pairs(ents.FindByClass("edit_sky")) do
				count = count + 1
				v:Remove()
			end
			
			for k, v in pairs(ents.FindByClass("edit_sun")) do
				count = count + 1
				v:Remove()
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do	
				if IsValid(v) and (v:GetClass() == "edit_fog" or v:GetClass() == "edit_sky" or v:GetClass() == "edit_sun") then
					count = count + 1
					v:Remove()
				end
			end
		end
		
		client:notify(count.. " editors have been cleaned up from the map.")
	end
})

nut.command.add("cleannpcs", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.GetAll()) do
				if IsValid(v) and (v:IsNPC() or (v:IsNextBot() and v.respite)) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
					v:Remove()
				end
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do
				if IsValid(v) and (v:IsNPC() or (v:IsNextBot() and v.respite)) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
					v:Remove()
				end
			end
		end
		
		client:notify(count.. " NPCs and Nextbots have been cleaned up from the map.")
	end
})

nut.command.add("cleananomalies", {
	syntax = "[number range]",
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		local anomalies = {
			["anom_bead"] = true,
			["anom_bubble"] = true,
			["anom_burner"] = true,
			["anom_damage"] = true,
			["anom_deathfog"] = true,
			["anom_divide"] = true,
			["anom_electro"] = true,
			["anom_evade"] = true,
			["anom_heat"] = true,
			["anom_hoverstone"] = true,
			["anom_hydro"] = true,
			["anom_mystic"] = true,
			["anom_static"] = true,
			["anom_trapper"] = true,
			["anom_vortex"] = true,
			["anom_whirlgig"] = true,
			["anom_bigvortex"] = true,
		}

		if(!arguments[1]) then
			client:requestQuery("Are you sure you want delete all anomalies on the map?", "Clean Anomalies", function(text) --confirmation message
				for k, v in ipairs(ents.GetAll()) do
					if(IsValid(v)) then
						if(anomalies[v:GetClass()]) then
							count = count + 1
							SafeRemoveEntity(v)
						end
					end
				end
				
				client:notify(count.. " anomalies have been cleaned up from the map.")
			end)
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do	
				if(IsValid(v)) then
					if(anomalies[v:GetClass()]) then
						count = count + 1
						SafeRemoveEntity(v)
					end
				end
			end
			
			client:notify(count.. " anomalies have been cleaned up from the map.")
		end
	end
})

nut.command.add("checknpcs", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.GetAll()) do
				if IsValid(v) and (v:IsNPC() or v.chance) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
				end
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do
				if IsValid(v) and (v:IsNPC() or v.chance) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
				end
			end
		end
		
		client:notify(count.. " NPCs and Nextbots are currently on the map.")
	end
})

nut.command.add("checkitems", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.FindByClass("nut_item")) do
				count = count + 1
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do	
				if IsValid(v) and (v:GetClass() == "nut_item") then
					count = count + 1
				end
			end
		end
		
		client:notify(count.. " item entities are currently on the map.")
	end
})

nut.command.add("spawnitem", {
	adminOnly = true,
	syntax = "<string item> <number amount>",
	onRun = function(client, arguments)
		if(!arguments[1]) then 
			client:notify("No item specified.")
			return false
		end
	
		if(IsValid(client)) then
			local uniqueID = arguments[1]:lower()

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end

			if(nut.item.list[uniqueID]) then
				local aimPos = client:GetEyeTraceNoCursor().HitPos 
				aimPos:Add(Vector(0, 0, 10))  
			
				local amount = math.min(tonumber(arguments[2]) or 1, 10)
			
				for i = 1, amount do
					nut.item.spawn(uniqueID, aimPos)
				end
            else
				client:notify("Invalid Item")
			end
		end
	end
})

nut.command.add("chargetmodel", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			client:notify(target:GetModel())
		else
			client:notify("Invalid Target")
		end
	end
})

nut.command.add("chargetmoney", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()
			client:notify(char:getMoney())
		else
			client:notify("Invalid Target")
		end
	end
})

-- Roll information in chat.
nut.chat.register("flip", {
	format = "%s flipped a coin and it landed on %s.",
	color = Color(155, 111, 176),
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280),
	deadCanChat = true
})

nut.command.add("flip", {
	onRun = function(client, arguments)
		local roll = math.random(0,1)
	
		if(roll == 1) then
			nut.chat.send(client, "flip", "Heads")
		else
			nut.chat.send(client, "flip", "Tails")
		end
	end
})

-- Roll information in chat.
nut.chat.register("rolld", {
	format = "%s %s.",
	color = Color(155, 111, 176),
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280),
	deadCanChat = true
})

nut.command.add("rolld", {
	syntax = "<number dice> <number pips> <number bonus>",
	onRun = function(client, arguments)
		local dice = math.Clamp((tonumber(arguments[1]) or 1), 1, 100)
		local pips = math.Clamp((tonumber(arguments[2]) or 6), 1, 100)
		local bonus = (tonumber(arguments[3]) or nil)
	
		if(bonus) then
			bonus = math.Clamp(bonus, 0, 1000000)
		end
	
		local total = 0
		local dmsg = ""
		for i = 1, dice do
			local roll = math.random(1, pips)
			total = total + roll
			if(i > 1) then
				dmsg = dmsg..", "
			end
			dmsg = dmsg..roll
		end

		local msg = ""
		
		if(bonus) then
			total = total + bonus
		
			msg = msg.. " + " ..bonus
		end
		
		msg = "has rolled " ..total.. " [" ..dmsg.. "]" .. " on " ..dice.. "d" ..pips..msg
		
		nut.chat.send(client, "rolld", msg)
	end
})

nut.command.add("card", {
	syntax = "<none>",
	onRun = function(client, arguments)
		local inventory = client:getChar():getInv()
		if (!inventory:hasItem("j_cards")) then
			client:notify("You do not have a deck of cards.")
			return
		end

		local cards = {"1","2","3","4","5","6","7","8","9","10","Ace","Queen","King","Jack"}
		local family = {"Spades", "Hearts", "Diamonds", "Clubs"}
		
		local msg = "draws the " ..table.Random(cards).. " of " ..table.Random(family)
		
		nut.chat.send(client, "rolld", msg)
	end
})

nut.command.add("musicstopglobal", {
	adminOnly = true,
	onRun = function(client, arguments)
	for k, v in pairs( player.GetAll() ) do
	v:ConCommand("wmcp_stop")
	client:notify("Music stopped for everyone.")
	end
end
})

nut.command.add("charsetspeed", {
	adminOnly = true,
	syntax = "<string name> <number speed>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local speed = tonumber(arguments[2]) or nut.config.get("walkSpeed")
		if(IsValid(target) and target:getChar()) then
			target:SetRunSpeed(speed)
		else
			client:notify("Invalid Target")
		end
	end
})

nut.command.add("charsetjump", {
	adminOnly = true,
	syntax = "<string name> <number power>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		local power = tonumber(arguments[2]) or 200
		if(IsValid(target) and target:getChar()) then
			target:SetJumpPower(power)
		end
	end
})

nut.command.add("charforceunequip", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local inventory = target:getChar():getInv()
			
			for k, item in pairs(inventory:getItems()) do
				if(item:getData("equip")) then
					item:setData("equip", false)
				end
			end
		end
	end
})

nut.command.add("charforcedropall", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local inventory = target:getChar():getInv()
			
			for k, item in pairs(inventory:getItems()) do
				item:removeFromInventory(true)
					:next(function() item:spawn(client) end)
				nut.log.add(target, "itemDrop", (item.getName and item:getName()) or item.name, 1)
			end
		end
	end
})

--this command only really works for my nextbot base currently
nut.command.add("npcrally", {
	adminOnly = true,
	onRun = function(client, arguments)
		local aimPos = client:GetEyeTraceNoCursor().HitPos
	
		for k, entity in ipairs(ents.GetAll()) do
			if(IsValid(entity) and entity.respite and entity.SetEnemy) then
				entity.rallyPoint = aimPos
				
				--[[
				local tempEnt = ents.Create("info_particle_system")
				tempEnt:SetParent(self)
				tempEnt:SetPos(aimPos)
				
				entity:SetEnemy(tempEnt, 1)
				
				timer.Simple(5, function()
					SafeRemoveEntity(tempEnt)
				end)
				--]]
			end
		end
	end
})

nut.command.add("notarget", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			if(!target:IsFlagSet(FL_NOTARGET)) then
				target:SetNoTarget(true)
				client:notify("Notarget enabled.")
			else
				target:SetNoTarget(false)
				client:notify("Notarget disabled.")
			end
		end
	end
})

nut.command.add("rocket", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local rocketVelo = Vector(0,0,5000)
			target:SetVelocity(rocketVelo)
			
			timer.Simple(1.5, function()
				local explode=EffectData()
				explode:SetOrigin(target:GetPos())
				explode:SetScale(1)
				explode:SetRadius(1)
				--explode:SetNormal(vector_up)
				util.Effect("explosion", explode, true, true)
				
				target:TakeDamage(5000, self, self)
			end)
		end
	end
})

nut.command.add("ai_ignoreplayers", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)
		local ignorePlayers = GetConVar("ai_ignoreplayers")
	
		local bool = ignorePlayers:GetBool()
		
		if(bool) then
			RunConsoleCommand("ai_ignoreplayers", 0)
			client:notify("ai_ignoreplayers toggled off.")
		else
			RunConsoleCommand("ai_ignoreplayers", 1)
			client:notify("ai_ignoreplayers toggled on.")
		end
	end
})