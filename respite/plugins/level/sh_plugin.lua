local PLUGIN = PLUGIN
PLUGIN.name = "Levels"
PLUGIN.author = "Chancer"
PLUGIN.desc = "Levelling and experience."

nut.config.add("levelOffset", 25, "How many stat points you need to be considered level 0.", nil, {
	data = {min = 1, max = 2000},
	category = "Level"
})

--attributes to exclude
PLUGIN.exclude = {
	["medical"] = true,
}

if(CLIENT) then
	function PLUGIN:CreateCharInfoText(panel, suppress)
		--people dont need to see this
		--[[
		panel.level = panel.info:Add("DLabel")
		panel.level:Dock(TOP)
		panel.level:SetFont("nutMediumFont")
		panel.level:SetTextColor(color_white)
		panel.level:SetText("")
		panel.level:SetExpensiveShadow(1, Color(0, 0, 0, 150))
		panel.level:DockMargin(0, 10, 0, 0)
		
		if (panel.level) then
			local char = LocalPlayer():getChar()
			if(char) then	
				local level, extra = PLUGIN:getLevel(char)
				panel.level:SetText("Level: " ..level.. "(+" ..(extra).. ")")
			end
		end
		--]]
	end
end

local playerMeta = FindMetaTable("Player")

function playerMeta:getLevel()
	local char = self:getChar()
	local attribs = att or char:getAttribs()
	
	local level = 0	
	for k, v in pairs(attribs) do
		if(PLUGIN.exclude[k]) then continue end --skip excluded attributes
		level = level + v
	end

	level = level - nut.config.get("levelOffset", 25)
	
	if(char) then
		level = level + char:getData("points", 0)
	end
	
	level = math.max(level, 0) --can't be negative

	return level
end

function playerMeta:canLevel()
	local char = self:getChar()

	if(char) then
		local level = char:getData("points", 0)
		if(level > 0) then
			return level
		end
	end

	return false
end

function PLUGIN:getLevelThresh(level)
	return (level * 100) + 100
end

function playerMeta:XPtoLevel()
	local char = self:getChar()

	if(char) then
		local xp = char:getData("xp", 0)
		local charLevel = self:getLevel(char)
		local points = char:getData("points", 0)
		
		thresh = PLUGIN:getLevelThresh(charLevel)
		while (xp >= thresh) do
			xp = xp - thresh
			charLevel = charLevel + 1
			points = points + 1
			thresh = PLUGIN:getLevelThresh(charLevel)
		end
		
		char:setData("points", points)
		char:setData("xp", xp)
		
		if(points > 1) then
			char:getPlayer():notify("You have unassigned attribute points.")
		end
	end
end

function playerMeta:XPPrediction(experience)
	local char = self:getChar()

	if(char) then
		local xp = experience
		local charLevel = self:getLevel(char)
		local points = 0
		
		thresh = PLUGIN:getLevelThresh(charLevel)
		while (xp >= thresh) do
			xp = xp - thresh
			charLevel = charLevel + 1
			points = points + 1
			thresh = PLUGIN:getLevelThresh(charLevel)
		end
		
		local remain = math.Round(xp / thresh, 2)
		
		return (points + remain)
	end
end

nut.command.add("xppredict", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local experience = tonumber(arguments[2])
			
			target:XPPrediction(experience)
		end
	end
})

nut.command.add("level", {
	adminOnly = true,
	syntax = "<string name>",
	onRun = function(client, arguments)	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			client:notify(target:getLevel())
		end
	end
})

nut.command.add("charaddxp", {
	adminOnly = true,
	syntax = "<string name> <number amount>",
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No amount specified.")
			return false
		end	
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()
			local xp = char:getData("xp", 0)
			
			local newXP = tonumber(arguments[2])
			
			char:setData("xp", xp + newXP)
			
			local requestString = "Are you sure you want to give " ..target:Name().. " " ..newXP.. " experience?\nThey will gain " ..target:XPPrediction(newXP).. " levels."
			
			client:requestQuery(requestString, "Add Experience", function(text)
				target:XPtoLevel()
				client:notify("Increased " ..target:Name().. "'s experience by " ..tonumber(arguments[2]).. ".")
				target:notify("You have gained experience.")
			end)
		end
	end
})

nut.command.add("charaddlevel", {
	adminOnly = true,
	syntax = "<string name> <number amount>",
	onRun = function(client, arguments)
		if(!arguments[2]) then
			client:notify("No amount specified.")
			return false
		end
	
		local target = nut.command.findPlayer(client, arguments[1])
		if(IsValid(target) and target:getChar()) then
			local char = target:getChar()
			local points = char:getData("points", 0)
			
			char:setData("points", points + tonumber(arguments[2]))
			
			client:notify("Increased " ..target:Name().. "'s level by " ..tonumber(arguments[2]).. ".")
		end
	end
})

nut.command.add("xparea", {
	adminOnly = true,
	syntax = "<number area> <number xp>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No area specified.")
			return false
		end
		
		if(!arguments[2]) then
			client:notify("No XP amount specified.")
			return false
		end
		
		local newXP = tonumber(arguments[2])
		local requestString = "Are you sure you want to give " ..newXP.. " experience to each person?\n"
	
		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		local foundPlayers = ents.FindInSphere(hitpos, arguments[1] or 100)
		
		for k, v in pairs(foundPlayers) do
			if(v == client) then continue end
			if (IsValid(v) and v:IsPlayer()) then
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then continue end
			
				local char = v:getChar()
				if(char) then
					requestString = requestString.. " " ..v:Name()..  " will gain " ..v:XPPrediction(newXP).. " levels."
					
					if(k < #foundPlayers) then
						requestString = requestString.. "\n"
					end
				end
			end
		end
		
		client:requestQuery(requestString, "Add Experience", function(text)
			for k, v in pairs(foundPlayers) do
				if(v == client) then continue end
				if (IsValid(v) and v:IsPlayer()) then
					local char = v:getChar()
					if(char) then
						local xp = char:getData("xp", 0)
						
						char:setData("xp", xp + newXP)
						
						v:XPtoLevel()
						v:notify("You have gained experience.")
						client:notify("Increased " ..v:Name().. "'s experience by " ..tonumber(arguments[2]).. ".")
					end
				end
			end
		end)		
	end
})

nut.command.add("xpareadistrib", {
	adminOnly = true,
	syntax = "<number area> <number xp>",
	onRun = function(client, arguments)
		if(!arguments[1]) then
			client:notify("No area specified.")
			return false
		end
		
		if(!arguments[2]) then
			client:notify("No XP amount specified.")
			return false
		end

		local trace = client:GetEyeTraceNoCursor()
		local hitpos = trace.HitPos + trace.HitNormal*5
		
		local entities = ents.FindInSphere(hitpos, arguments[1] or 100)
		local players = {}
		for k, v in pairs(entities) do
			if(v:IsPlayer()) then
				if(v != client) then --exclude the person running the command.
					players[#players+1] = v
				end
			end
		end
		
		local playerCount = math.max(#players, 1)
		local split = tonumber(arguments[2]) / playerCount
		
		local requestString = "Are you sure you want to give " ..split.. " experience to each person?\n"
		
		for k, v in pairs(players) do
			if (IsValid(v) and v:IsPlayer()) then
				if(v:GetMoveType() == MOVETYPE_NOCLIP) then continue end
			
				local char = v:getChar()
				if(char) then
					requestString = requestString.. " " ..v:Name()..  " will gain " ..v:XPPrediction(split).. " levels."
					
					if(k < #players) then
						requestString = requestString.. "\n"
					end
				end
			end
		end
		
		client:requestQuery(requestString, "Add Experience", function(text)
			for k, v in pairs(players) do
				local char = v:getChar()
				if(char) then
					local xp = char:getData("xp", 0)
					
					char:setData("xp", xp + split)
					
					v:XPtoLevel()
					v:notify("You have gained experience.")
					client:notify("Increased " ..v:Name().. "'s experience by " ..split.. ".")
				end
			end
		end)		
	end
})

if(SERVER) then
	netstream.Hook("statIncrease", function(client, attrib, value)
		local char = client:getChar()
		local points = char:getData("points", 0)
		
		if(points > 0) then
			char:setData("points", points - 1, false, player.GetAll())
			char:setAttrib(attrib, value)
			
			client:notify("You have increased your " ..(nut.attribs.list[attrib] and nut.attribs.list[attrib].name).. ".")
			
			nut.log.addRaw(client:Name().. " increased their " ..(nut.attribs.list[attrib] and (nut.attribs.list[attrib].name or "Unknown attrib?")).. " from " ..(value-1).. " to " ..value.. ".")
		end
	end)
end