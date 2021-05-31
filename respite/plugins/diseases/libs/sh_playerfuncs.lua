local PLUGIN = PLUGIN
local playerMeta = FindMetaTable("Player")

if(SERVER) then
	--gives a specific disease to a player
	function playerMeta:giveDisease(disease, noPrint)
		if(!disease) then return false end --invalid input
		
		local char = self:getChar()
		if(!char) then return false end --no character

		local disData = char:getData("diseases", {}) --char's disease data
		disData[disease] = CurTime()
		char:setData("diseases", disData) --saves the data
		
		local disTable = DISEASES.diseases[disease]
		if(!disTable) then return end --no disease table so we can stop here
		
		--things that are supposed to happen when you catch it
		local catchRun = disTable.catch and table.Random(disTable.catch)
		if(catchRun) then
			if(istable(catchRun)) then --if it's a table it gets fancier
				if(catchRun.func) then
					catchRun.func(client)
				end
			
				if(catchRun.text and !noPrint) then
					nut.chat.send(self, "body", catchRun.text)
				end
			else --if it's not a table it's just text
				if(!noPrint) then
					nut.chat.send(self, "body", catchRun)
				end
			end
		end
		
		--for straight +/- attribute debuffs
		if(disTable.buff) then
			for k, v in pairs(disTable.buff) do
				char:addBoost(disTable.uid, k, v)
			end
		end
		
		--for scaling buffs/debuffs
		if(disTable.buffScale) then
			for k, v in pairs(disTable.buffScale) do			
				char:addBoost(disTable.uid .. "s", k, v * char:getAttrib(k, 0))
			end
		end
	end	
	
	--removes a disease from a player
	function playerMeta:removeDisease(disease, noPrint)
		if(!disease) then return end
		
		local char = self:getChar()
		if(!char) then return end

		local disData = char:getData("diseases", {}) --char's disease data
		disData[disease] = nil
		char:setData("diseases", disData) --saves the data
		
		local disTable = DISEASES.diseases[disease]
		if(!disTable) then return end
		
		--things that are supposed to happen when you cure it
		local cureRun = disTable.cure and table.Random(disTable.cure)
		if(cureRun) then
			if(istable(cureRun)) then
				if(cureRun.func) then
					cureRun.func(client)
				end
			
				if(cureRun.text and !noPrint) then
					nut.chat.send(self, "body", cureRun.text)
				end
			else
				if(!noPrint) then
					nut.chat.send(self, "body", cureRun)
				end
			end
		end
		
		--for straight +/- attribute debuffs removal
		if(disTable.buff) then
			for k, v in pairs(disTable.buff) do
				char:removeBoost(disTable.uid, k)
			end
		end
		
		--for scaling buffs/debuffs removal
		if(disTable.buffScale) then
			for k, v in pairs(disTable.buffScale) do			
				char:removeBoost(disTable.uid.. "s", k)
			end
		end	
	end
	
	--clears all diseases
	function playerMeta:resetDiseases()
		local char = self:getChar()
		if(!char) then return end

		char:setData("diseases", nil)
	end	
end

--checks a player's immunity
function playerMeta:checkImmunity()
	local char = self:getChar()
	if(!char) then return false end

	local disProt = char:getVar("disProt")
	
	--disease protection
	if(disProt) then
		if(disProt < CurTime()) then
			return true --yes they're immune
		else
			if(SERVER) then
				char:setVar("disProt", nil)
			end
		end
	end
	
	return false --no they are not
end

--checks if the player can be infected, only used for diseases that spread randomly or from other people
function playerMeta:canInfect()
	local char = self:getChar()
	if(!char) then return false end
	
	--checks for disease immunity from items, or other stuff
	if(self:checkImmunity()) then
		return false
	end
	
	local infect = {}
	for k, disease in pairs(DISEASES.diseases) do
		if(disease.infect) then
			infect[#infect + 1] = disease.uid
		end
	end
	
	--dont let them get infected if they're already infected with something
	for k, disease in pairs(infect) do
		if(self:hasDisease(disease)) then
			return false
		end
	end
end

--returns all diseases the player has
function playerMeta:getDiseases()
	local char = self:getChar()
	if(!char) then return end

	return char:getData("diseases", {})
end

--checks if a player has a disease, if run from client can only check your own diseases (probably)
function playerMeta:hasDisease(disease)
	local char = self:getChar()
	if(!char) then return end

	local disData = char:getData("diseases", {})
	
	if(disData[disease]) then
		return true
	else
		return false
	end
end