local PLUGIN = PLUGIN

--gets all cooldowns
function ENT:getCooldowns()
	return self.cooldowns or {}
end

--adds a cooldown to a player
function ENT:addCooldown(spell, duration)
	self.cooldowns = self:getCooldowns()
	
	self.cooldowns[spell] = duration

	PLUGIN:cdNetworkAll(self, spell, duration)
end

--removes a cooldown from a player
function ENT:removeCooldown(spell)
	self.cooldowns = self:getCooldowns()
	
	self.cooldowns[spell] = nil

	PLUGIN:cdNetworkAll(self, spell)
end

--clears all of a player's cooldowns
function ENT:clearCooldowns()
	self.cooldowns = nil
end