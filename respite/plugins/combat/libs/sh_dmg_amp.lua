local PLUGIN = PLUGIN
PLUGIN.helperFuncs = PLUGIN.helperFuncs or {}

--function playerMeta:getAmp()
PLUGIN.helperFuncs["getAmp"] = function(self)
	local char = self:getChar()
	local inv = char:getInv()
	
	--amplifications, start with amp from buffs
	local amp = self:getNetVar("amp", self.amp or {})
	amp = table.Copy(amp)
	
	hook.Run("nut_OnGetAmp", self, amp)
	
	for k, v in pairs(amp) do
		amp[k] = v * 0.01
	end
	
	--amp from items
	for k, v in pairs(inv:getItems()) do
		if(v:getData("equip")) then
			for k2, v2 in pairs(v:getData("amp", {})) do
				if(amp[k2]) then
					amp[k2] = 1 - (1 - amp[k2]) * (1 - v2 * 0.01)
				else
					amp[k2] = 1 - (1 - v2 * 0.01)
				end
			end
		end
	end
	
	--rounds resistance so it isnt scary numbers
	for k, v in pairs(amp) do
		amp[k] = math.Round(v, 4)
	end
	
	return amp
end

hook.Add("nut_ActionAttackData", "nut_AmpModify", function(action, attacker, info)
	local amp = attacker:getAmp()
	
	if(amp) then
		if(amp[action.dmgT]) then
			action.dmg = action.dmg * (1 + amp[action.dmgT])
		elseif(amp["dmg"]) then --general damage amp
			action.dmg = action.dmg * (1 + amp["dmg"])
		end
	end
end)