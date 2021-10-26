local PLUGIN = PLUGIN

--the timer makes sure that all the attributes exist before it does its thing
timer.Simple(0, function()
	local ACT
	for attribID, attrib in pairs(nut.attribs.list) do
		ACT = {}
		ACT.uid = attribID
		ACT.name = attrib.name
		ACT.desc = "A roll that uses your " ..attrib.name.. " attribute."
		ACT.category = "Attributes"
		ACT.attackOverwrite = function(actionTbl, client, trace)
			local char = client:getChar()
		
			local attribVal = client:getChar():getAttrib(attribID, 0)
			
			--[[
			if(client:IsPlayer()) then
				attribVal = client:getChar():getAttrib(attribID, 0)
			else
				attribVal = client:getAttrib(attribID, 0)
			end
			--]]
		
			local roll = math.Rand(-1 + attribVal * 0.5, 20 + attribVal) --random roll
			roll = math.Round(roll) --round it
		
			local rollMsg = client:Name().. " rolls " ..attrib.name.. ": " ..roll.. "."
			
			nut.chat.send(client, "react_npc", rollMsg) --print it
			nut.log.addRaw(rollMsg, 2)
		end
		ACTS:Register(ACT)
		
		nut.command.add(attrib.name, {
		--adminOnly = true,
		onRun = function(client, arguments)
			local attribVal = client:getChar():getAttrib(attribID, 0)
		
			local roll = math.Rand(-1 + attribVal * 0.5, 20 + attribVal) --random roll
			roll = math.Round(roll) --round it
		
			local combatMsg = client:Name().. " rolls " ..attrib.name.. ": " ..roll.. "."
			
			nut.chat.send(client, "react_npc", combatMsg) --print it
			nut.log.addRaw(combatMsg, 2)
		end
	})
	end
end)