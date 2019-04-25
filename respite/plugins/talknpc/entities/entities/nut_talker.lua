ENT.Type = "anim"
ENT.PrintName = "Talker"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.AutomaticFrameAdvance = true
ENT.isVendor = true

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/Humans/Group01/Male_04.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		self.items = {}
		self.messages = {}
		self.factions = {}
		self.classes = {}

		self:setNetVar("name", "John Doe")
		self:setNetVar("desc", "")

		--makes it so all factions are defaulted on.
		local facts = {}
		for k, v in pairs(nut.faction.indices) do
			facts[v.uniqueID] = 1
		end
		self:setNetVar("factiondata", facts)

		self.receivers = {}

		local physObj = self:GetPhysicsObject()
		
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:Sleep()
			physObj:EnableCollisions(false)
		end
	end

	timer.Simple(1, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end

function ENT:canAccess(client)
	if (client:IsAdmin()) then
		return true
	end

	local allowed = false
	local uniqueID = nut.faction.indices[client:Team()].uniqueID

	if (self.factions and table.Count(self.factions) > 0) then
		if (self.factions[uniqueID]) then
			allowed = true
		else
			return false
		end
	end

	if (allowed and self.classes and table.Count(self.classes) > 0) then
		local class = nut.class.list[client:getChar():getClass()]
		local uniqueID = class and class.uniqueID

		if (!self.classes[uniqueID]) then
			return false
		end
	end

	return true
end

function ENT:setAnim()
	if(self:getNetVar("anim")) then
		self:ResetSequence(self:getNetVar("anim"))
		return 
	end
	
	for k, v in ipairs(self:GetSequenceList()) do
		if (v:lower():find("idle") and v != "idlenoise") then
			return self:ResetSequence(k)
		end
	end

	self:ResetSequence(4)
end

function ENT:getStock(uniqueID)
	if (self.items[uniqueID] and self.items[uniqueID][VENDOR_MAXSTOCK]) then
		return self.items[uniqueID][VENDOR_STOCK] or 0, self.items[uniqueID][VENDOR_MAXSTOCK]
	end
end

function ENT:getPrice(uniqueID, selling)
	local price = nut.item.list[uniqueID] and self.items[uniqueID] and self.items[uniqueID][VENDOR_PRICE] or nut.item.list[uniqueID].price or 0

	if (selling) then
		price = math.floor(price * (self.scale or 0.5))
	end

	return price
end

function ENT:canSellToPlayer(client, uniqueID)
	local data = self.items[uniqueID]

	if (!data or !client:getChar() or !nut.item.list[uniqueID]) then
		return false
	end

	if (data[VENDOR_MODE] == VENDOR_BUYONLY) then
		return false
	end

	if (!client:getChar():hasMoney(self:getPrice(uniqueID))) then
		return false
	end

	if (data[VENDOR_STOCK] and data[VENDOR_STOCK] < 1) then
		return false
	end

	return true
end

function ENT:canBuyFromPlayer(client, uniqueID)
	local data = self.items[uniqueID]

	if (!data or !client:getChar() or !nut.item.list[uniqueID]) then
		return false
	end

	if (data[VENDOR_MODE] != VENDOR_SELLONLY) then
		return false
	end

	if (!self:hasMoney(data[VENDOR_PRICE] or nut.item.list[uniqueID].price or 0)) then
		return false
	end

	return true
end

function ENT:hasMoney(amount)
	-- Vendor not using money system so they can always afford it.
	if (!self.money) then
		return true
	end
	
	return self.money >= amount
end

if (CLIENT) then
	function ENT:Think()
	end

	function ENT:Draw()
		self:DrawModel()
	end

	function ENT:OnRemove()
	end
	
	netstream.Hook("nut_Dialogue", function(data)
		if (IsValid(nut.gui.dialogue)) then
			nut.gui.dialogue:Remove()
			return
		end
		nut.gui.dialogue = vgui.Create("Nut_Dialogue")
		nut.gui.dialogue:Center()
		nut.gui.dialogue:SetEntity(data)
		
		if LocalPlayer():IsAdmin() then
			if (IsValid(nut.gui.edialogue)) then
				nut.gui.edialogue:Remove()
				return
			end
			nut.gui.edialogue = vgui.Create("Nut_DialogueEditor")
			--nut.gui.edialogue:Center()
			nut.gui.edialogue:SetEntity(data)
		end
	end)
	
	function ENT:openQuest()
		if (IsValid(nut.gui.quest)) then
			nut.gui.quest:Remove()
			return
		end
		
		if (IsValid(nut.gui.dialogue)) then
			nut.gui.dialogue:Remove()
		end		
		
		nut.gui.quest = vgui.Create("Nut_Quest")
		nut.gui.quest:Center()
		nut.gui.quest:SetEntity(self)
		if LocalPlayer():IsAdmin() then
			if (IsValid(nut.gui.edialogueq)) then
				nut.gui.edialogueq:Remove()
				return
			end
			
			if (IsValid(nut.gui.edialogue)) then
				nut.gui.edialogue:Remove()
			end			
			
			nut.gui.edialogueq = vgui.Create("Nut_QuestEditor")
			--nut.gui.edialogueq:Center()
			nut.gui.edialogueq:SetEntity(self)
		end
	end
	
	local TEXT_OFFSET = Vector(0, 0, 20)
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)) + TEXT_OFFSET)
		local x, y = position.x, position.y
		local desc = self.getNetVar(self, "desc")

		drawText(self.getNetVar(self, "name", "John Doe"), x, y, colorAlpha(configGet("color"), alpha), 1, 1, nil, alpha * 0.65)

		if (desc) then
			drawText(desc, x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
		end
	end
	
	function ENT:getMoney()
		return self.money
	end	
else
	function ENT:Think()
		if(!self:IsPlayerHolding()) then
			local physObj = self:GetPhysicsObject()
			
			if(!physObj:IsAsleep()) then
				physObj:Sleep()
			end
		end
	end

	function ENT:Use(activator)
		local factionData = self:getNetVar("factiondata", {})
		if !factionData[nut.faction.indices[activator:Team()].uniqueID] and !activator:IsAdmin() then
			activator:ChatPrint(self:getNetVar( "name", "John Doe" )..": I don't want talk with you.")
			return
		end
		
		netstream.Start(activator, "nut_Dialogue", self)
	end

	netstream.Hook("nut_vendorMenuEX", function(client, data)
		local entity = data[1]
	
		entity.receivers[#entity.receivers + 1] = client
		
		local items = {}

		-- Only send what is needed.
		for k, v in pairs(entity.items) do
			if (table.Count(v) > 0 and (client:IsAdmin() or v[VENDOR_MODE])) then
				items[k] = v
			end
		end

		entity.scale = entity.scale or 0.5

		local data = {}
		data[1] = items
		data[2] = entity.money
		data[3] = entity.scale

		if (client:IsAdmin()) then
			data[4] = entity.messages
			data[5] = entity.factions
			data[6] = entity.classes
		end

		client.nutVendor = entity
		netstream.Start(client, "vendorOpen", entity:EntIndex(), unpack(data))
	end)
	
	netstream.Hook("nut_DialogueData", function(client, data)
		if (!client:IsAdmin()) then
			return
		end
		
		local entity = data[1]
		local dialogue = data[2]
		local factionData = data[3]
		local classData = data[4]
		local name = data[5]
		local desc = data[6]
		local model = data[7]
		local skin = data[8]
		local groups = data[9]
		local anim = data[10]
		
		if (IsValid(entity)) then
			entity:setNetVar("dialogue", dialogue)
			entity:setNetVar("factiondata", factionData)
			entity:setNetVar("classdata", classData)
			entity:setNetVar("name", name)
			entity:setNetVar("desc", desc)
			entity:setNetVar("anim", anim)
			entity:SetModel(model)
			entity:SetSkin(skin)
			entity:setAnim()
			
			if(groups) then
				entity:SetBodygroup(1, groups[1] or 0)
				entity:SetBodygroup(2, groups[2] or 0)
				entity:SetBodygroup(3, groups[3] or 0)
				entity:SetBodygroup(4, groups[4] or 0)
				entity:SetBodygroup(5, groups[5] or 0)
				entity:SetBodygroup(6, groups[6] or 0)
			end			

			client:notify("You have updated this talking npc's data.")
		end
	end)
	
	netstream.Hook("nut_QuestData", function(client, data)
		if (!client:IsAdmin()) then
			return
		end
		
		local entity = data[1]
		local quests = data[2]
		
		if (IsValid(entity)) then
			entity:setNetVar("quests", quests)

			client:notify("You have updated this talking npc's quest data.")
		end
	end)

	--vendor functions
	function ENT:setMoney(value)
		self.money = value

		netstream.Start(self.receivers, "vendorMoney", value)
	end

	function ENT:giveMoney(value)
		if (self.money) then
			self:setMoney(self:getMoney() + value)
		end
	end

	function ENT:takeMoney(value)
		if (self.money) then
			self:giveMoney(-value)
		end
	end

	function ENT:setStock(uniqueID, value)
		if (!self.items[uniqueID][VENDOR_MAXSTOCK]) then
			return
		end

		self.items[uniqueID] = self.items[uniqueID] or {}
		self.items[uniqueID][VENDOR_STOCK] = math.min(value, self.items[uniqueID][VENDOR_MAXSTOCK])

		netstream.Start(self.receivers, "vendorStock", uniqueID, value)
	end

	function ENT:addStock(uniqueID, value)
		if (!self.items[uniqueID][VENDOR_MAXSTOCK]) then
			return
		end

		self:setStock(uniqueID, self:getStock(uniqueID) + (value or 1))
	end

	function ENT:takeStock(uniqueID, value)
		if (!self.items[uniqueID][VENDOR_MAXSTOCK]) then
			return
		end

		self:addStock(uniqueID, -(value or 1))
	end
end
