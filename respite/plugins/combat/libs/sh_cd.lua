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

	--for k, recipient in pairs(player.GetAll()) do
		PLUGIN:cdNetworkAll(self, self, spell, duration)
	--end
end

--removes a cooldown from a player
function playerMeta:removeCooldown(spell)
	local cooldowns = self:getCooldowns()
	
	local char = self:getChar()
	char.cooldowns = cooldowns
	
	cooldowns[spell] = nil
	
	--for k, recipient in pairs(player.GetAll()) do
		PLUGIN:cdNetworkAll(self, self, spell)
	--end
end

--clears all of a player's cooldowns
function playerMeta:clearCooldowns()
	local char = self:getChar()
	char.cooldowns = nil
end

if(SERVER) then
	PLUGIN.networkQueueCD = {}

	function PLUGIN:cdNetworkAll(recipient, entity, spell, duration)
		PLUGIN.networkQueueCD[recipient] = PLUGIN.networkQueueCD[recipient] or {}
		
		local tempTbl = {
			entity = entity, 
			spell = spell, 
			duration = duration,
		}
		
		table.insert(PLUGIN.networkQueueCD[recipient], tempTbl)
	end

	function PLUGIN:cdThink()
		if((self.nextNetworkCD or 0) > CurTime()) then return end
		self.nextNetworkCD = CurTime() + 1

		for k, client in pairs(player.GetAll()) do
			local clientNet = PLUGIN.networkQueueCD[client]
		
			if(clientNet and !table.IsEmpty(clientNet)) then
				local firstEntry = PLUGIN.networkQueueCD[client][1]
				
				netstream.Start(client, "cooldownNetworkAll", firstEntry.entity, firstEntry.spell, firstEntry.duration)
				
				table.remove(PLUGIN.networkQueueCD[client], 1)
			end
		end
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