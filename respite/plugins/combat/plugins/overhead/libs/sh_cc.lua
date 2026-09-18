local PLUGIN = PLUGIN

--checks if an entity can do a thing
function PLUGIN:checkCapable(entity, data)
	if(isvector(data)) then --position data implies movement
		local reqAP = PLUGIN:distanceToAP(entity:GetPos():Distance(data))
	
		if(entity:getAP() < 1) then
			return "Not enough AP."
		end
	elseif(istable(data)) then --more complex data
		if(data.target and !data.costs) then --regular attack, probably merge with data.costs if statement
			if(entity:getAP() < 1) then
				return "Not enough AP."
			end
		elseif(data.costs) then
			if(data.costs.ap) then --AP cost
				if(entity:getAP() < data.costs.ap) then
					return "Not enough AP."
				end
			end
			
			if(data.costs.mp) then --MP cost
				if(entity:getMP() < data.costs.mp) then
					return "Not enough MP."
				end
			end
			
			if(data.costs.hp) then --HP cost
				if(entity:getHP() < data.costs.hp) then
					return "Not enough HP."
				end
			end
		end
	end
end

--checks if a client can control and select an entity
function PLUGIN:checkOwner(client, entity)

end

function PLUGIN:isSelectable(client, entity)
	--if(IsValid(entity) and (entity.combat or entity:IsPlayer())) then
	if(IsValid(entity) and (entity.combat)) then
		return true
	end
end

--turns a distance value into an AP cost
function PLUGIN:distanceToAP(distance)
	local AP = (distance / 500)
	AP = math.Round(AP) --whole numbers only
	AP = math.max(AP, 1) --at least 1 ap if you do any moving
	
	return AP
end