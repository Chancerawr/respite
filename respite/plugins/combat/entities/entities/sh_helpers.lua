local PLUGIN = PLUGIN

function ENT:Name()
	return self:getNetVar("name", self.name or self.PrintName)
end

function ENT:Desc()
	return self:getNetVar("desc", self.desc)
end

function ENT:getAttackRange()
	return self:getNetVar("attackRange", self.attackRange) or 80
end

function ENT:getHP()
	return self:getNetVar("hp", self:getMaxHP())
end

function ENT:getMaxHP()
	local maxHP = self:getNetVar("hpMax", self.hp or 0)
	
	maxHP = maxHP + self:getBuffAttribute("maxHP")

	return maxHP
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

function ENT:setMaxHP(amount)
	self:setNetVar("hpMax", amount)
	
	return amount
end

function ENT:setMaxMP(amount)
	self:setNetVar("mpMax", amount)
	
	return amount
end

function ENT:getVar()
	return {}
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

function ENT:getBoosts()
	return self.boosts or {}
end

function ENT:addBoost(boostID, attribID, boostAmount)
	local boosts = self:getBoosts()

	boosts[attribID] = boosts[attribID] or {}
	boosts[attribID][boostID] = boostAmount

	self.boosts = boosts
end

function ENT:removeBoost(boostID, attribID)
	local boosts = self:getBoosts()

	boosts[attribID] = boosts[attribID] or {}
	boosts[attribID][boostID] = nil

	self.boosts = boosts
end

--makes it compatible with player functions
function ENT:getAttrib(attrib, default)
	local attribs = self:getNetVar("attribs", self.attribs)
	attribs = table.Copy(attribs)
	
	local value = attribs[attrib] or default
	value = tonumber(value) or default

	local buff = 0
	
	if(self.getBuffAttributeTbl) then
		local attribBuff = self:getBuffAttributeTbl("attrib")
		
		buff = buff + (attribBuff[attrib] or 0)
	end
	
	local boosts = self:getBoosts()
	if(boosts) then
		for attribID, attribBoosts in pairs(boosts) do
			if(attribID == attrib) then
				for k, boostAmt in pairs(attribBoosts) do
					buff = buff + boostAmt
				end
			end
		end
	end

	value = value + buff

	return value
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

--makes it compatible with player functions
function ENT:hasTrait(trait)
	return false
end

function ENT:GetPatrol()
	local routesPlugin = nut.plugin.list["routes"]
	if(!routesPlugin) then return {} end
	
	local patrol = self.patrol or {}
	local route
	if(patrol.name) then
		route = routesPlugin.routes[patrol.name]
	end
	
	patrol.route = route

	return patrol
end

function ENT:getDataFields()
	local saveData = self:getSaveData()

	local config = {
		{
			["name"] = {
				weight = 1, 
				name = "Name", 
				category = "Basic",
				value = saveData.name,
				updateType = "netVar",
			},
			["desc"] = {
				weight = 2, 
				name = "Description", 
				category = "Basic",
				value = saveData.desc,
				updateType = "netVar",
			},	
			["model"] = {
				weight = 13, 
				name = "Model", 
				category = "Basic",
				value = saveData.model,
				updateType = function(entity, data)
					local current = self:GetModel()
					if(current != data) then
						entity:SetModel(data)
						entity:physicsSetup()

						for k, v in ipairs(entity:GetSequenceList()) do
							if (v:lower():find("idle") and v != "idlenoise") then
								entity:ResetSequence(k)
								break
							end
						end
						
						entity:setNetVar("WalkAnim", nil)
						entity:setNetVar("RunAnim", nil)
						entity:setNetVar("IdleAnim", nil)
						entity:setNetVar("AttackAnim", nil)
						
						entity.WalkAnim = nil
						entity.RunAnim = nil
						entity.IdleAnim = nil
						entity.AttackAnim = nil
					end
				end,
			},
			["modelScale"] = {
				weight = 14, 
				name = "Model Scale", 
				category = "Basic",
				value = saveData.modelScale,
				numeric = true,
				updateType = function(entity, data)
					local current = self:GetModelScale()
					if(current != tonumber(data)) then
						entity:SetModelScale(data)
						entity:Activate()
					end
				end,
			},
			["material"] = {
				weight = 15, 
				name = "Material", 
				category = "Basic",
				value = saveData.mat,
				updateType = function(entity, data)
					entity:SetMaterial(data)
				end,
			},
			["bodygroups"] = {
				weight = 16, 
				name = "Bodygroups", 
				category = "Basic",
				value = saveData.bodygroups,
				extra = self:GetBodyGroups(),
				panelType = "DComboBox2",
				updateType = function(entity, data)
					--print(entity, data)
				end,
			},
			["color"] = {
				weight = 17, 
				name = "Color", 
				category = "Basic",
				value = saveData.color,
				panelType = "DColorMixer",
				updateType = function(entity, data)
					entity:SetColor(data)
				end,
			},
			["patrol"] = { --might need to be networked to work properly
				weight = 19, 
				name = "Patrol Route",
				category = "Basic",
				value = saveData.patrol,
				extra = nut.plugin.list["routes"].routes,
				panelType = "DComboBox",
				updateType = function(entity, data)
					if(data == "" or data == "None") then
						entity.patrol = {}
					else
						local route = nut.plugin.list["routes"].routes[data]
						if(route) then
							entity.patrol = {
								name = data,
								current = 1,
								wait = 1, --how long it waits before going to the next patrol point
								pause = false, --pauses the patrol, if it goes into combat or something
							}
						end
					end
				end,
			},
		},
		{
			["CurrentAnim"] = {
				weight = 1, 
				name = "Current", 
				category = "Animations",
				value = saveData.WalkAnim,
				extra = self:GetSequenceList(),
				panelType = "DComboBox",
				panelFunc = function(panel, data)
					for _, choice in pairs(data.extra) do
						panel:AddChoice(choice)
					end
				end,
				updateType = function(entity, data)
					local sequence = entity:LookupSequence(data)
					
					if(sequence) then
						entity:ResetSequence(sequence)
					end
				end,
			},
			["WalkAnim"] = {
				weight = 2, 
				name = "Walk", 
				category = "Animations",
				value = saveData.WalkAnim,
				extra = self:GetSequenceList(),
				panelType = "DComboBox",
				panelFunc = function(panel, data)
					for _, choice in pairs(data.extra) do
						panel:AddChoice(choice)
					end
				end,
				updateType = "netVar",
			},
			["RunAnim"] = {
				weight = 3, 
				name = "Run", 
				category = "Animations",
				value = saveData.RunAnim,
				extra = self:GetSequenceList(),
				panelType = "DComboBox",
				panelFunc = function(panel, data)
					for _, choice in pairs(data.extra) do
						panel:AddChoice(choice)
					end
				end,
				updateType = "netVar",
			},
			["IdleAnim"] = {
				weight = 4, 
				name = "Idle", 
				category = "Animations",
				value = saveData.IdleAnim,
				extra = self:GetSequenceList(),
				panelType = "DComboBox",
				panelFunc = function(panel, data)
					for _, choice in pairs(data.extra) do
						panel:AddChoice(choice)
					end
				end,
				updateType = "netVar",
			},
			["AttackAnim"] = {
				weight = 5, 
				name = "Attack", 
				category = "Animations",
				value = saveData.AttackAnim,
				extra = self:GetSequenceList(),
				panelType = "DComboBox",
				panelFunc = function(panel, data)
					for _, choice in pairs(data.extra) do
						panel:AddChoice(choice)
					end
				end,
				updateType = "netVar",
			},
		},
		{
			["hp"] = {
				weight = 3, 
				name = "Health",
				category = "Combat Stats",
				value = saveData.hp,
				updateType = "netVar",
				numeric = true,
			},
			["hpMax"] = {
				weight = 4, 
				name = "Max Health",
				category = "Combat Stats",
				value = saveData.hpMax,
				updateType = "netVar",
				numeric = true,
			},
			["mp"] = {
				weight = 5, 
				name = "Mana", 
				category = "Combat Stats",
				value = saveData.mp,
				updateType = "netVar",
				numeric = true,
			},
			["mpMax"] = {
				weight = 6, 
				name = "Max Mana", 
				category = "Combat Stats",
				value = saveData.mpMax,
				updateType = "netVar",
				numeric = true,
			},
			["armor"] = {
				weight = 7, 
				name = "Armor (Bonus)", 
				category = "Combat Stats",
				value = saveData.armor,
				updateType = "netVar",
				numeric = true,
			},
			["accuracy"] = {
				weight = 8, 
				name = "Accuracy (Bonus)", 
				category = "Combat Stats",
				value = saveData.accuracy,
				updateType = "netVar",
				numeric = true,
			},
			["evasion"] = {
				weight = 9, 
				name = "Evasion (Bonus)", 
				category = "Combat Stats",
				value = saveData.evasion,
				updateType = "netVar",
				numeric = true,
			},
		},
		{
			["attribs"] = {
				weight = 8, 
				name = "Attributes", 
				category = "Attributes",
				value = saveData.attribs,
				extra = nut.attribs.list,
				updateType = "netVar",
				numeric = true,
			},
		},
		{
			["res"] = {
				weight = 9, 
				name = "Resistances (Damage)", 
				category = "Resistances",
				value = saveData.res,
				extra = PLUGIN.dmgTypes, --needs effect types too
				updateType = "netVar",
				numeric = true,
			},
			["resEffect"] = {
				weight = 10, 
				name = "Resistances (Effects)", 
				category = "Resistances",
				value = saveData.res,
				extra = EFFS.effects, --needs effect types too
				--updateType = "netVar",
				numeric = true,
				updateType = function(entity, data)
					local res = entity:getNetVar("res", entity.res) or {}
					for k, v in pairs(data) do
						res[k] = v
					end
					
					entity:setNetVar("res", res)
				end,
			},
		},
		{
			["amp"] = {
				weight = 10, 
				name = "Amplifications", 
				category = "Amplifications",
				value = saveData.amp,
				extra = PLUGIN.dmgTypes,
				updateType = "netVar",
				numeric = true,
			},
		},
		{
			["dmg"] = {
				weight = 11, 
				name = "Damage Types/Values", 
				category = "Damage Values",
				value = saveData.dmg,
				extra = PLUGIN.dmgTypes,
				updateType = "netVar",
				numeric = true,
			},
		},
		--[[
		{
			["actions"] = {
				weight = 12, 
				name = "Actions", 
				category = "Actions",
				value = 1,--saveData.actions
				updateType = "netVar",
				--panelType = "DComboBox",
			},
		},
		--]]
	}
	
	return config
end

function ENT:CEntUpdateData(data)
	local fields = self:getDataFields()
	for _, dataFields in pairs(fields) do
		for id, v in pairs(dataFields) do
			if(data[id]) then
				if(isfunction(v.updateType)) then
					v.updateType(self, data[id])
				elseif(v.updateType == "netVar") then
					self:setNetVar(id, data[id])
				else
					self[id] = data[id]
				end
			end
		end
	end
end

if(SERVER) then
	netstream.Hook("nut_CEntUpdateData", function(client, entity, data)
		if(!IsValid(entity)) then return end
		
		entity:CEntUpdateData(data)
	end)
end