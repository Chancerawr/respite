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