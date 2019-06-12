ITEM.name = "Potion Base"
ITEM.model = "models/healthvial.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.desc = ""
ITEM.category = "Medical"
ITEM.flag = "v"
ITEM.color = Color(35, 140, 35)
ITEM.duration = 360

ITEM.functions._use = { 
	name = "Use",
	tip = "useTip",
	icon = "icon16/bug.png",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()
		if (char and client:Alive()) then
			if (item.attribBoosts) then
				for k, v in pairs(item.attribBoosts) do
					char:addBoost(item.uniqueID, k, v)
				end
			end
			
			local charID = char:getID()
			local name = item.name
			timer.Create("DrugEffect_" .. item.uniqueID .. "_" .. client:EntIndex(), item.duration, 1, function()
				if (client and IsValid(client)) then
					local curChar = client:getChar()
					if (curChar and curChar:getID() == charID) then
						client:notify(Format("%s has worn off.", name))

						if (item.attribBoosts) then
							for k, v in pairs(item.attribBoosts) do
								char:removeBoost(item.uniqueID, k)
							end
							
							if(math.random(0,4) == 0) then --20% chance of potion sickness.
								giveDisease(client, "dis_poti") --potion sickness
								client:notify("You have been afflicted with potion sickness.")
							end
						end
					end
				end
			end)
			return true
		end
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}

function ITEM:getDesc(partial)
	local desc = self.desc
	
	if(!partial) then
		local customData = self:getData("custom", {})
		if(customData.quality) then
			desc = desc .. "\nQuality: " ..customData.quality
		end
	end
	
	return Format(desc)
end