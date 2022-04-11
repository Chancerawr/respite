local PLUGIN = PLUGIN

local playerMeta = FindMetaTable("Player")

--gets all buffs
function playerMeta:getBuffs()
	local char = self:getChar()
	
	if(char) then
		return (char.buffs or {})
	else
		return {}
	end
end

--goes through all buffs and returns the modifications to a specific thing
function playerMeta:getBuffAttribute(buffAttribute)
	local modify = 0
	for k, buff in pairs(self:getBuffs()) do
		if(buff[buffAttribute]) then
			modify = modify + buff[buffAttribute]
		end
	end
	
	return modify
end

--goes through all buffs and returns the modifications to a specific thing, but this one's for tables
function playerMeta:getBuffAttributeTbl(buffAttribute)
	local modify = {}
	for _, buff in pairs(self:getBuffs()) do
		if(buff[buffAttribute]) then
			for k, v in pairs(buff[buffAttribute]) do
				modify[k] = (modify[k] or 0) + v
			end
		end
	end
	
	return modify
end

--adds a buff to a player
function playerMeta:addBuff(buff, id)
	local buffs = self:getBuffs()
	buffs[id or buff.uid] = buff
	
	local char = self:getChar()
	char.buffs = buffs

	if(buff.attrib) then
		for k, v in pairs(buff.attrib) do
			char:addBoost(buff.name or buff.uid, k, v)
		end
	end

	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "buffNetworkAll", self, util.TableToJSON(buff), id)
	end
end

--removes a buff from a player
function playerMeta:removeBuff(buff, id)
	local buffs = self:getBuffs()
	
	local char = self:getChar()
	char.buffs = buffs
	
	local buff = buff or buffs[id or buff.uid] or {}
	
	if(buff.attrib) then
		for k, v in pairs(buff.attrib) do
			char:removeBoost(buff.name or buff.uid, k)
		end
	end
	
	buffs[id or buff.uid] = nil
	
	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "buffNetworkAll", self, 0, id or buff.uid)
	end
end

--when the buff holder is hit
function playerMeta:buffGetHit()
	local buffs = self:getBuffs()
	for buffID, buffTbl in pairs(buffs) do
		if(buffTbl.hitsDef) then
			buffTbl.hitsDef = buffTbl.hitsDef - 1
			
			if(buffTbl.hitsDef == 0) then
				self:removeBuff(buffTbl)
			end
		end
	end
end

--when the buff holder hits
function playerMeta:buffOnHit()
	local buffs = self:getBuffs()
	for buffID, buffTbl in pairs(buffs) do
		if(buffTbl.hitsAttack) then
			buffTbl.hitsAttack = buffTbl.hitsAttack - 1
			
			if(buffTbl.hitsAttack == 0) then
				self:removeBuff(buffTbl)
			end
		end
	end
end

--clears all of a player's buffs
function playerMeta:clearBuffs()
	local char = self:getChar()
	char.buffs = nil
end

if(SERVER) then

else
	function PLUGIN:DrawCharInfo(client, character, info)
		if(!LocalPlayer():IsAdmin()) then return end
		
		local buffs = character.buffs
		if(buffs and !table.IsEmpty(buffs)) then
			local buffText = ""
			
			for k, v in pairs(buffs) do
				if(v.name) then
					buffText = buffText.. " " ..v.name.. "."
				end
			end

			info[#info + 1] = {buffText, color_white}
		end		
	end

	netstream.Hook("buffNetwork", function(data)
		local client = LocalPlayer()
		client:getChar().buffs = util.JSONToTable(data)
	end)
	
	netstream.Hook("buffNetworkAll", function(entity, buff, buffID)
		if(IsValid(entity) and entity.getBuffs) then
			local buffTbl
			if(buff != 0) then
				buffTbl = util.JSONToTable(buff)
			end

			if(entity:IsPlayer()) then
				local char = entity:getChar()
				
				if(char) then
					char.buffs = entity:getBuffs()
					char.buffs[buffID or buffTbl.uid] = buffTbl
				end
			else
				entity.buffs = entity:getBuffs()
				entity.buffs[buffID or buffTbl.uid] = buffTbl
			end
		end
	end)
end