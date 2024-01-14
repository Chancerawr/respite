local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--gets all cooldowns
function playerMeta:getCooldowns()
	local char = self:getChar()
	
	if(char) then
		return (char.cooldowns or {})
	else
		return {}
	end
end

--adds a cooldown to a player
function playerMeta:addCooldown(spell, duration)
	local cooldowns = self:getCooldowns()
	cooldowns[spell] = duration
	
	local char = self:getChar()
	char.cooldowns = cooldowns

	PLUGIN:cdNetworkAll(self, spell, duration)
end

--removes a cooldown from a player
function playerMeta:removeCooldown(spell)
	local cooldowns = self:getCooldowns()
	
	local char = self:getChar()
	char.cooldowns = cooldowns
	
	cooldowns[spell] = nil

	PLUGIN:cdNetworkAll(self, spell)
end

--clears all of a player's cooldowns
function playerMeta:clearCooldowns()
	local char = self:getChar()
	char.cooldowns = nil
end

if(SERVER) then
	PLUGIN.networkQueueCD = {}

	function PLUGIN:cdNetworkAll(entity, spell, duration)
		PLUGIN.networkQueueCD = PLUGIN.networkQueueCD or {}
		
		local tempTbl = {
			entity = entity, 
			spell = spell, 
			duration = duration,
		}
		
		table.insert(PLUGIN.networkQueueCD, tempTbl)
	end

	function PLUGIN:cdThink()
		if((self.nextNetworkCD or 0) > CurTime()) then return end
		self.nextNetworkCD = CurTime() + 1

		if(table.IsEmpty(PLUGIN.networkQueueCD)) then return end

		for k, client in ipairs(player.GetAll()) do
			local netCD = PLUGIN.networkQueueCD[1]
			netstream.Start(client, "cooldownNetworkAll", netCD.entity, netCD.spell, netCD.duration)
		end
		
		table.remove(PLUGIN.networkQueueCD, 1)
	end
else
	netstream.Hook("cooldownNetwork", function(data)
		local client = LocalPlayer()
		client:getChar().cooldowns = util.JSONToTable(data)
	end)
	
	netstream.Hook("cooldownNetworkAll", function(entity, spell, duration)
		if(IsValid(entity) and entity.getCooldowns) then
			local char = entity:getChar()
			if(char) then
				char.cooldowns = entity:getCooldowns()
				char.cooldowns[spell] = duration
			end
		end
	end)
end