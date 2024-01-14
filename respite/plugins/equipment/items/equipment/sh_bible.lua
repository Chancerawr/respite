ITEM.name = "Bible"
ITEM.uniqueID = "j_bible"
ITEM.model = "models/props_lab/bindergreen.mdl"
ITEM.desc = "A thick book filled with religious teachings."

ITEM.width = 1
ITEM.height = 1
ITEM.slot = "Accessory"

ITEM.armor = 1

ITEM.salvage = {
	["j_scrap_cloth"] = 2
}

ITEM.attrib = {
	["perception"] = -1,
	["fortitude"] = 3,
	["end"] = 1,
}

ITEM.upgradeSlots = { 
	["Dream"] = 1,
}

ITEM.iconCam = {
	pos = Vector(0, 200, 6),
	ang = Angle(0, 270, 0),
	fov = 4.5,
}

ITEM.functions.Read = {
	tip = "useTip",
	icon = "icon16/book_open.png",
	sound = "physics/cardboard/cardboard_box_impact_soft3.wav",
	onRun = function(item)
		local client = item.player
		local char = client:getChar()

		if (char and client:Alive()) then
			local charID = char:getID()
			local name = item:getName()

			local readBoost = {
				["fortitude"] = 2,
			}
			
			local dur = 7200

			for k, v in pairs(readBoost) do
				buffAmt = v
				if(TRAITS and client:hasTrait("zealot")) then
					buffAmt = buffAmt * 2
				end
				
				char:addBoost(item.uniqueID.."2", k, buffAmt)
			end
			
			--if we already have a thing for that buff, refresh it.
			if(timer.Exists("DrugEffect_" ..item.uniqueID.. "2_" .. client:EntIndex())) then 
				timer.Adjust("DrugEffect_" ..item.uniqueID.. "2_" .. client:EntIndex(), dur, 1, function()

					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (readBoost) then
								for k, v in pairs(readBoost) do
									char:removeBoost(item.uniqueID.."2", k)
								end
							end
						end
					end
				end)
			else				
				timer.Create("DrugEffect_" ..item.uniqueID.. "2_" .. client:EntIndex(), dur, 1, function()
					if (client and IsValid(client)) then
						local curChar = client:getChar()
						if (curChar and curChar:getID() == charID) then
							client:notify(Format("%s has worn off.", name))

							if (readBoost) then
								for k, v in pairs(readBoost) do
									char:removeBoost(item.uniqueID.."2", k)
								end
							end
						end
					end
				end)
			end
		end
		
		--item.player:EmitSound(item.sound)
		
		return false
	end,
	onCanRun = function(item)
		return (!IsValid(item.entity))
	end
}