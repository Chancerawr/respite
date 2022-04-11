local PLUGIN = PLUGIN

--gets all buffs
function ENT:getBuffs()
	return self.buffs or {}
end

--goes through all buffs and returns the modifications to a specific thing
function ENT:getBuffAttribute(buffAttribute)
	local modify = 0
	for k, buff in pairs(self:getBuffs()) do
		if(buff[buffAttribute]) then
			modify = modify + buff[buffAttribute]
		end
	end
	
	return modify
end

--goes through all buffs and returns the modifications to a specific thing, but this one's for tables
function ENT:getBuffAttributeTbl(buffAttribute)
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

function ENT:addBuff(buff)
	local buffs = self:getBuffs()
	buffs[buff.uid] = buff
	
	self.buffs = buffs
	
	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "buffNetworkAll", self, util.TableToJSON(buff))
	end
end

--removes a buff from a player
function ENT:removeBuff(buff, id)
	local buffs = self:getBuffs()
	buffs[id or buff.uid] = nil
	
	self.buffs = buffs
	
	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "buffNetworkAll", self, 0, id or buff.uid)
	end
end

--when the buff holder is hit
function ENT:buffGetHit()
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
function ENT:buffOnHit()
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
function ENT:clearBuffs()
	local char = self:getChar()
	char.buffs = nil
end