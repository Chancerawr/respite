ENT.Type = "anim"
ENT.PrintName = "Talker"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.AutomaticFrameAdvance = true
ENT.isVendor = true

NUT_VENDORS = NUT_VENDORS or {}

function ENT:SpawnFunction(client, trace)
	local angles = (trace.HitPos - client:GetPos()):Angle()
	angles.r = 0
	angles.p = 0
	angles.y = angles.y + 180

	local entity = ents.Create("nut_talker")
	entity:SetPos(trace.HitPos)
	entity:SetAngles(angles)
	entity:Spawn()

	return entity
end

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/Humans/Group01/Male_04.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_NONE)
		self:DrawShadow(true)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		self:setNetVar("name", "John Doe")
		self:setNetVar("desc", "")

		--makes it so all factions are defaulted on.
		local facts = {}
		for k, v in pairs(nut.faction.indices) do
			facts[v.uniqueID] = 1
		end
		self:setNetVar("factiondata", facts)

		self.receivers = {}

		NUT_VENDORS[self:EntIndex()] = self
		
		local physObj = self:GetPhysicsObject()
		
		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:EnableGravity(false)
			--physObj:Sleep()
			physObj:EnableCollisions(false)
		end
	end
	
	self.items = {}
	self.factions = {}
	self.messages = {}
	self.classes = {}
	self.hasSetupVars = true

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

		--rotates the npc towards whoever used it, off until I think of a way to do it better
		--[[
		if(self:LookupBone("ValveBiped.Bip01_Head1")) then
			self:PointAtEntity(activator)
			local angle = self:GetAngles()
			self:SetAngles(Angle(0, angle.y, 0))
		end
		--]]
		
		self.receivers[#self.receivers + 1] = activator
		activator.nutVendor = self
		
		--hook.Run("PlayerAccessVendor", activator, self)
	end
	
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

	-- Sets how much money the vendor has.
	function ENT:setMoney(value)
		if (not isnumber(value) or value < 0) then value = nil end
		self.money = value
		net.Start("nutVendorMoney")
			net.WriteInt(value or -1, 32)
		net.Send(self.receivers)
	end

	-- Adds the given value to the amount of money the vendor has.
	function ENT:giveMoney(value)
		if (self.money) then
			self:setMoney(self:getMoney() + value)
		end
	end

	-- Removes the given value from the amount of money the vendor has.
	function ENT:takeMoney(value)
		if (self.money) then
			self:giveMoney(-value)
		end
	end

	-- Sets how many items of the given type the vendor owns.
	-- The value can be nil to disable use of stock for the item.
	-- This is essentially having unlimited stock.
	function ENT:setStock(itemType, value)
		self.items[itemType] = self.items[itemType] or {}

		if (not self.items[itemType][VENDOR_MAXSTOCK]) then
			self:setMaxStock(itemType, value)
		end

		self.items[itemType][VENDOR_STOCK] = math.Clamp(
			value,
			0, self.items[itemType][VENDOR_MAXSTOCK]
		)

		net.Start("nutVendorStock")
			net.WriteString(itemType)
			net.WriteUInt(value, 32)
		net.Send(self.receivers)
	end

	-- Increments the stock of the specified item by the given value.
	-- However, if the item does not have a max stock set, nothing happens.
	function ENT:addStock(itemType, value)
		local current = self:getStock(itemType)
		if (not current) then return end

		self:setStock(itemType, self:getStock(itemType) + (value or 1))
	end

	-- Decrements the stock of the specified item by the given value.
	-- However, if the item does not have a max stock set, nothing happens.
	function ENT:takeStock(itemType, value)
		if (
			not self.items[itemType] or
			not self.items[itemType][VENDOR_MAXSTOCK]
		) then
			return
		end

		self:addStock(itemType, -(value or 1))
	end

	-- Sets the maximum stock for a specific item to the given value.
	-- If the value is nil or 0, then the vendor will not use the stock system
	-- for the item.
	function ENT:setMaxStock(itemType, value)
		if (value == 0 or not isnumber(value)) then
			value = nil
		end

		self.items[itemType] = self.items[itemType] or {}
		self.items[itemType][VENDOR_MAXSTOCK] = value

		net.Start("nutVendorMaxStock")
			net.WriteString(itemType)
			net.WriteUInt(value, 32)
		net.Send(self.receivers)
	end

	-- Forces a player to leave the trade with this vendor.
	function ENT:removeReceiver(client, requestedByPlayer)
		table.RemoveByValue(self.receivers, client)
		if (client.nutVendor == self) then
			client.nutVendor = nil
		end

		if (requestedByPlayer) then return end

		net.Start("nutVendorExit")
		net.Send(client)
	end

	local ALLOWED_MODES = {
		[1] = true,
		[2] = true,
		[3] = true
	}

	-- Sets the name of the vendor and updates it in the editor.
	function ENT:setName(name)
		self:setNetVar("name", name)
		net.Start("nutVendorEdit")
			net.WriteString("name")
		net.Send(self.receivers)
	end

	-- Sets the description of the vendor and updates it in the editor.
	function ENT:setDesc(desc)
		self:setNetVar("desc", desc)
		net.Start("nutVendorEdit")
			net.WriteString("desc")
		net.Send(self.receivers)
	end

	-- Sets how the item is traded between vendor and player.
	function ENT:setTradeMode(itemType, mode)
		if (not ALLOWED_MODES[mode]) then
			mode = nil
		end

		self.items[itemType] = self.items[itemType] or {}
		self.items[itemType][VENDOR_MODE] = mode

		net.Start("nutVendorMode")
			net.WriteString(itemType)
			net.WriteInt(mode or -1, 8)
		net.Send(self.receivers)
	end

	-- Sets the price for a particular item.
	-- If the value is not a number or is negative, then the item's price is used.
	function ENT:setItemPrice(itemType, value)
		if (not isnumber(value) or value < 0) then
			value = nil
		end

		self.items[itemType] = self.items[itemType] or {}
		self.items[itemType][VENDOR_PRICE] = value

		net.Start("nutVendorPrice")
			net.WriteString(itemType)
			net.WriteInt(value or -1, 32)
		net.Send(self.receivers)
	end

	-- Sets the stock for a particular item.
	-- If the value is not a number or is negative, then the item's price is used.
	function ENT:setItemStock(itemType, value)
		if (not isnumber(value) or value < 0) then
			value = nil
		end

		self.items[itemType] = self.items[itemType] or {}
		self.items[itemType][VENDOR_STOCK] = value

		net.Start("nutVendorStock")
			net.WriteString(itemType)
			net.WriteInt(value, 32)
		net.Send(self.receivers)
	end

	-- Sets the maximum stock for a particular item.
	-- If the value is not a number or is negative, then the item's price is used.
	function ENT:setItemMaxStock(itemType, value)
		if (not isnumber(value) or value < 0) then
			value = nil
		end

		self.items[itemType] = self.items[itemType] or {}
		self.items[itemType][VENDOR_MAXSTOCK] = value

		net.Start("nutVendorMaxStock")
			net.WriteString(itemType)
			net.WriteInt(value, 32)
		net.Send(self.receivers)
	end

	function ENT:OnRemove()
		NUT_VENDORS[self:EntIndex()] = nil

		if (nut.shuttingDown or self.nutIsSafe) then return end
	end

	-- Sets how much of the original price a player gets back for selling an item.
	-- Set the price scaling for when a player is selling an item to the vendor.
	function ENT:setSellScale(scale)
		assert(isnumber(scale), "scale must be a number")

		self:setNetVar("scale", scale)
		net.Start("nutVendorEdit")
			net.WriteString("scale")
		net.Send(self.receivers)
	end

	function ENT:sync(client)
		net.Start("nutVendorSync")
			net.WriteEntity(self)
			net.WriteInt(self:getMoney() or -1, 32)
			net.WriteUInt(table.Count(self.items), 16)
			for itemType, item in pairs(self.items) do
				net.WriteString(itemType)
				net.WriteInt(item[VENDOR_PRICE] or -1, 32)
				net.WriteInt(item[VENDOR_STOCK] or -1, 32)
				net.WriteInt(item[VENDOR_MAXSTOCK] or -1, 32)
				net.WriteInt(item[VENDOR_MODE] or -1, 8)
			end
		net.Send(client)

		if (client:IsAdmin()) then
			for factionID in pairs(self.factions) do
				net.Start("nutVendorAllowFaction")
					net.WriteUInt(factionID, 8)
					net.WriteBool(true)
				net.Send(client)
			end
			for classID in pairs(self.classes) do
				net.Start("nutVendorAllowClass")
					net.WriteUInt(classID, 8)
					net.WriteBool(true)
				net.Send(client)
			end
		end
	end

	function ENT:addReceiver(client, noSync)
		if (not table.HasValue(self.receivers, client)) then
			self.receivers[#self.receivers + 1] = client
		end

		if (noSync) then return end
		self:sync(client)
	end
end

function ENT:getMoney()
	return self.money
end

function ENT:hasMoney(amount)
	local moeny = self:getMoney()

	-- Vendor not using money system so they can always afford it.
	if (not money) then
		return true
	end

	return money >= amount
end

-- Return how much stock for an item the vendor has. If the stock
-- is not applicable, nil is returned.
function ENT:getStock(uniqueID)
	if (
		self.items[uniqueID] and
		self.items[uniqueID][VENDOR_MAXSTOCK]
	) then
		return self.items[uniqueID][VENDOR_STOCK] or 0,
			self.items[uniqueID][VENDOR_MAXSTOCK]
	end
end

-- Returns the maximum number of stock for an item if applicable.
function ENT:getMaxStock(itemType)
	if (self.items[itemType]) then
		return self.items[itemType][VENDOR_MAXSTOCK]
	end
end

-- Returns true if the given item is in stock.
function ENT:isItemInStock(itemType, amount)
	amount = amount or 1
	assert(isnumber(amount), "amount must be a number")

	local info = self.items[itemType]
	if (not info) then
		return false
	end
	if (not info[VENDOR_MAXSTOCK]) then
		return true
	end
	return info[VENDOR_STOCK] >= amount
end

-- Returns the price for an item. If isSellingToVendor, then the price is
-- the amount the player receives for selling the item. That is, it is scaled.
function ENT:getPrice(uniqueID, isSellingToVendor)
	local price = nut.item.list[uniqueID]
		and self.items[uniqueID]
		and self.items[uniqueID][VENDOR_PRICE]
		or nut.item.list[uniqueID]:getPrice()

	-- If selling to the vendor, scale the price down since it is "used".
	if (isSellingToVendor) then
		price = math.floor(price * self:getSellScale())
	end

	return price
end

function ENT:getTradeMode(itemType)
	if (self.items[itemType]) then
		return self.items[itemType][VENDOR_MODE]
	end
end

function ENT:getSellScale()
	return self:getNetVar("scale", 0.5)
end

function ENT:getName()
	return self:getNetVar("name", "")
end

function ENT:getDesc()
	return self:getNetVar("desc", "")
end

function ENT:getNoBubble()
	return self:getNetVar("noBubble") == true
end

function ENT:isClassAllowed(classID)
	return true
end

--if they've made it this far they already have access anyways
function ENT:isFactionAllowed(factionID)
	return true
end