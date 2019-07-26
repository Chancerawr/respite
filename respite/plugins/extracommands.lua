PLUGIN.name = "Extra Commands"
PLUGIN.author = "Luna"
PLUGIN.desc = "A few useful commands."

nut.command.add("fixpac", {
	syntax = "<No Input>",
	onRun = function(client, arguments)
		timer.Simple(0, function()
			if (IsValid(client)) then
				client:ConCommand("pac_clear_parts")
			end
		end)
		timer.Simple(0.5, function()
			if (IsValid(client)) then
				client:ConCommand("pac_urlobj_clear_cache")
				client:ConCommand("pac_urltex_clear_cache")
			end
		end)
		timer.Simple(1.0, function()
			if (IsValid(client)) then				
				client:ConCommand("pac_restart")						
			end
		end)
		timer.Simple(1.5, function()
			if (IsValid(client)) then				
				client:ChatPrint("PAC has been successfully restarted. You might need to run this command twice!")							
			end
		end)
    end
})

-- nut.command.add("refreshfonts", {
	-- syntax = "<No Input>",
	-- onRun = function(client, arguments)
	-- RunConsoleCommand("fixchatplz")
	-- hook.Run("LoadFonts", nut.config.get("font"))
	-- client:ChatPrint("Fonts have been refreshed!")		
    -- end
-- })


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
	syntax = "[No Input]",
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
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.FindByClass("nut_item")) do
				count = count + 1
				v:Remove()
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do	
				if IsValid(v) and (v:GetClass() == "nut_item") then
					count = count + 1
					v:Remove()
				end
			end
		end
		
		client:notify(count.. " items have been cleaned up from the map.")
	end
})

nut.command.add("cleannpcs", {
	adminOnly = true,
	onRun = function(client, arguments)
		local count = 0
	
		if(!arguments[1]) then
			for k, v in pairs(ents.GetAll()) do
				if IsValid(v) and (v:IsNPC() or v.chance) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
					v:Remove()
				end
			end
		else
			local trace = client:GetEyeTraceNoCursor()
			local hitpos = trace.HitPos + trace.HitNormal*5
			for k, v in pairs(ents.FindInSphere(hitpos, arguments[1] or 100)) do
				if IsValid(v) and (v:IsNPC() or v.chance) and !IsFriendEntityName(v:GetClass()) then
					count = count + 1
					v:Remove()
				end
			end
		end
		
		client:notify(count.. " NPCs and Nextbots have been cleaned up from the map.")
	end
})

nut.command.add("spawnitem", {
	adminOnly = true,
	syntax = "<string item> <number amount>",
	onRun = function(client, arguments)

		if (IsValid(client) and client:getChar()) then
			local uniqueID = arguments[1]:lower()

			if (!nut.item.list[uniqueID]) then
				for k, v in SortedPairs(nut.item.list) do
					if (nut.util.stringMatches(v.name, uniqueID)) then
						uniqueID = k

						break
					end
				end
			end

            local aimPos = client:GetEyeTraceNoCursor().HitPos 

            aimPos:Add(Vector(0, 0, 10))  

			if(nut.item.list[uniqueID]) then
				local amount = tonumber(arguments[2]) or 1
				if(amount > 10) then
					amount = 10
				end
			
				for i = 1, amount or 1 do
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
	format = "%s has %s.",
	color = Color(155, 111, 176),
	filter = "actions",
	font = "nutChatFontItalics",
	onCanHear = nut.config.get("chatRange", 280),
	deadCanChat = true
})

nut.command.add("rolld", {
	syntax = "<number dice> <number pips> <number bonus>",
	onRun = function(client, arguments)
		local dice = (tonumber(arguments[1]) or 1)
		local pips = (tonumber(arguments[2]) or 6)
		local bonus = (tonumber(arguments[3]) or nil)
	
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
		
		msg = "rolled " ..total.. " [" ..dmsg.. "]" .. " on " ..dice.. "d" ..pips..msg
		
		nut.chat.send(client, "rolld", msg)
	end
})

nut.command.add("forums", {
    syntax = "<No Input>",
	onRun = function(client, arguments)
		client:SendLua([[gui.OpenURL("http://2119rp.boards.net/")]])
	end
})

nut.command.add("content", {
    syntax = "<No Input>",
	onRun = function(client, arguments)
		client:SendLua([[gui.OpenURL("https://steamcommunity.com/sharedfiles/filedetails/?id=814760758")]])
	end
})