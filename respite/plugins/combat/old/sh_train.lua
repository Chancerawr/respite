local PLUGIN = PLUGIN

--disabled for now for an experiment
--[[
nut.command.add("train", {
	syntax = "<string attribute> <Roleplay training before using this>",
	onRun = function(client, arguments)
		local char = client:getChar()
		local findAtt = arguments[1]
		local attribName
		for k, v in pairs(nut.attribs.list) do
			if (nut.util.stringMatches(L(v.name, client), findAtt) or nut.util.stringMatches(k, findAtt)) then
				attribName = k
			end
		end
		
		if(attribName) then
			local lastTrain = char:getData("lastTrain")
			
			if(!lastTrain) then
				char:setData("lastTrain", 0)
				lastTrain = 0
			end
			
			local cooldown = math.abs(math.floor(char:getAttrib(attribName, 0) / 15)) + 1
			cooldown = math.Clamp(cooldown, 1, 7)
			
			if(lastTrain and math.abs(tonumber(lastTrain) - tonumber(os.date("%d"))) >= cooldown) then -- train once every 2 days.
				local value = char:getAttrib(attribName, 0)
				char:setData("lastTrain", os.date("%d"))
				char:updateAttrib(attribName, 1)
				nut.log.addRaw(client:Name().." trained \""..attribName.."\".", 2)	
				
				client:notify("You have trained your " .. findAtt .. ".")
				client:notify("You will be able to train again in " ..cooldown.. " days.")
			else
				local remaining = cooldown - (tonumber(lastTrain) - tonumber(os.date("%d")))
				client:notify("You cannot train for " ..remaining.. " day(s).")
				
				nut.log.addRaw(client:Name().." did not successfully train due to cooldown.", 2)	
			end
		else
			client:notifyLocalized("Invalid Attribute")
		end
	end
})
--]]