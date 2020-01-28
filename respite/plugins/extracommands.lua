PLUGIN.name = "Extra Commands"
PLUGIN.author = "Chancer & Angelsaur"
PLUGIN.desc = "A few useful commands."

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

nut.command.add("forums", {
	onRun = function(client, arguments)
	 client:SendLua([[gui.OpenURL("http://spite.boards.net/")]])
	end
})

nut.command.add("content", {
	onRun = function(client, arguments)
	client:SendLua([[gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=773495550")]])
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
			
			for k, v in pairs(inventory:getItems()) do
				if(v:getData("equip")) then
					v:setData("equip", false)
				end
			end
		end
	end
})