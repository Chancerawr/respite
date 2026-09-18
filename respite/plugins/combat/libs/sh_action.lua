local playerMeta = FindMetaTable("Player")

local PLUGIN = PLUGIN

ACTS = {}
ACTS.actions = {}
function ACTS:Register(tbl)
	self.actions[tbl.uid] = tbl
end

function ACTS:GetAll()
	return self.actions
end

--helper function that finds (initialized) actions based on partial strings
function PLUGIN:actionFind(partial)
	local action
	
	for k, v in pairs(ACTS.actions) do
		if(!v.uid) then continue end
		
		if(string.lower(v.uid) == string.lower(partial)) then
			return v
		elseif(string.find(string.lower(v.uid), string.lower(partial))) then
			action = v
		elseif(string.find(string.lower(v.name), string.lower(partial))) then
			action = v
		end
	end
	
	return action
end

--[[
function playerMeta:getCustomSpells()
	local char = self:getChar()
	
	local spells = {}
	if(char) then
		local customSpells = char:getData("spells", {})
		for k, v in pairs(customSpells) do
			if(PLUGIN.spellList[k]) then
				spells[#spells + 1] = PLUGIN.spellList[k]
			end
		end
	end
	
	return spells
end
--]]