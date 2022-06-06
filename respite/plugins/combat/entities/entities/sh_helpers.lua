local PLUGIN = PLUGIN

function ENT:Name()
	return self:getNetVar("name", self.name or self.PrintName)
end

function ENT:Desc()
	return self:getNetVar("desc", self.desc)
end

function ENT:getHP()
	return self:getNetVar("hp", self:getMaxHP())
end

function ENT:getMaxHP()
	return self:getNetVar("hpMax", self.hp or 0)
end

function ENT:getMP()
	return self:getNetVar("mp", self:getMaxMP())
end

function ENT:getMaxMP()
	return self:getNetVar("mpMax", self.mp or 0)
end

function ENT:getAP()
	return self:getNetVar("ap", self:getAPMax())
end

function ENT:getAPMax()
	return self:getNetVar("apMax", self.apMax or 2)
end

function ENT:addHP(amount)
	local new = math.Round(math.Clamp(self:getHP() + amount, -1000, self:getMaxHP()), 2)
	
	self:setNetVar("hp", new)
	
	return new
end

function ENT:setHP(amount)
	local new = math.Round(math.Clamp(amount, -1000, self:getMaxHP()), 2)
	
	self:setNetVar("hp", new)
	
	return new
end

function ENT:setMaxHP(amount)
	self:setNetVar("hpMax", amount)
	
	return amount
end

function ENT:addMP(amount)
	local new = math.Round(math.Clamp(self:getMP() + amount, -1000, self:getMaxMP()), 2)
	
	self:setNetVar("mp", new)
	
	return new
end

function ENT:setMP(amount)
	local new = math.Round(math.Clamp(amount, -1000, self:getMaxMP()), 2)
	
	self:setNetVar("mp", new)
	
	return new
end

function ENT:setMaxMP(amount)
	self:setNetVar("mpMax", amount)
	
	return amount
end

-- Exists for ocnvenience
function ENT:getChar()
	return self
end

function ENT:getTags()
	return self.tags or {}
end

function ENT:getTagsBonus()
	return self.tagsBonus or {}
end

--makes it compatible with player functions
function ENT:getAttrib(attrib, default)
	return self.attribs[attrib] or default
end

--makes it compatible with player functions
function ENT:getChar()
	return self
end

--makes it compatible with player functions
function ENT:getInv()
	return self
end

--makes it compatible with player functions
function ENT:getItems()
	return {}
end