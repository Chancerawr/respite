local PLUGIN = PLUGIN
PLUGIN.name = "HP Regeneration"
PLUGIN.author = "Chancer"
PLUGIN.desc = "People can regenerate HP if they meet some conditions."

nut.config.add("regen", true, "Whether regeneration is on at all.", nil, {
	category = "Regeneration"
})

nut.config.add("regenAmt", 5, "How much HP regenerates whenever it can.", nil, {
	data = {min = 1, max = 84600},
	category = "Regeneration"
})

nut.config.add("regenThink", 30, "How often it checks to regenerate health.", nil, {
	data = {min = 1, max = 84600},
	category = "Regeneration"
})

--change this if you want to change what lets people regenerate hp
local function canRegen(client)
	local char = client:getChar()
	if(char and char:getData("stomach", 0) > 2) then
		return true
	else
		return false
	end
end

function PLUGIN:Think()
	if(nut.config.get("regen", false)) then
		if(!self.nextThink) then self.nextThink = 0 end

		if(self.nextThink < CurTime()) then
			local players = player.GetAll()
			
			for k, v in pairs(players) do
				
				local hp = v:Health()
				local maxhp = v:GetMaxHealth()
				if(hp < maxhp) then
					local char = v:getChar()
					if(canRegen(v)) then
						local newHP = hp + nut.config.get("regenAmt", 1)
					
						v:SetHealth(math.Clamp(newHP, 0, maxhp))
					end
				end
			end
		
			self.nextThink = CurTime() + nut.config.get("regenThink", 60)
		end
	end
end