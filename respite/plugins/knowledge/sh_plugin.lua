local playerMeta = FindMetaTable("Player")

local PLUGIN = PLUGIN
PLUGIN.name = "Knowledge"
PLUGIN.author = " "
PLUGIN.desc = "Players can learn information by doing stuff."

function playerMeta:GetKnowledge()
	local char = self:getChar()
	
	local know = {}
	
	if(char) then
		know = char:getData("know", {})
	end
	
	return know
end

function playerMeta:HasKnowledge(learn, level)
	local know = self:GetKnowledge()
	
	if(!level) then
		level = 0
	end
	
	local knowLevel = know[learn]
	if(knowLevel) then
		if(knowLevel >= level) then
			return knowLevel
		end
	end
	
	return false
end

function playerMeta:CensorKnowledge(word, learn, level)
	local check = self:HasKnowledge(learn, level)
	if(check) then
		return word
	else
		--need to put blocks here or something
		return false
	end
end

if(SERVER) then
	PLUGIN.monsters = {
		["resp_waste"] = {
			know = "Waste",
			max = 10,
			kill = 1,
		},
	}

	--when an npc is killed they should learn a bit about it
	function PLUGIN:OnNPCKilled(npc, attacker, inflictor)
		if(PLUGIN.monsters[npc]) then
			--do somethin' about it
		end
	end
	
	function playerMeta:SetKnowledge(data)
		local char = self:getChar()

		if(char) then
			char:setData("know", data)
			
			return true
		end
	end

	function playerMeta:AddKnowledge(learn, level)
		local char = self:getChar()

		if(char) then
			local know = self:GetKnowledge()
			know[learn] = (know[learn] or 0) + level
					
			if(know[learn] <= 0) then
				know[learn] = nil
			end
			
			self:setData("know", know)
			
			return true
		end
	end

	function playerMeta:RemoveKnowledge(learn, level)
		local char = self:getChar()

		if(char) then
			local know = self:GetKnowledge()
			know[learn] = nil
			
			self:setData("know", know)
			
			return true
		end
	end
end