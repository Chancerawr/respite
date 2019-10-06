AddCSLuaFile()

ENT.Base = "base_entity"
ENT.Type = "anim"
ENT.PrintName = "Item"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.RenderGroup = RENDERGROUP_BOTH

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_junk/watermelon01.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		--self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
		self.health = 50

		self:SetCustomCollisionCheck(true)
		
		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end

		hook.Run("OnItemSpawned", self)
	end

	function ENT:setHealth(amount)
		self.health = amount
	end

	--[[
	function ENT:OnTakeDamage(dmginfo)
		local damage = dmginfo:GetDamage()
		self:setHealth(self.health - damage)

		if (self.health <= 0 and not self.breaking) then
			self.breaking = true
			self:Remove()
		end
	end
	--]]

	function ENT:setItem(itemID)
		local itemTable = nut.item.instances[itemID]
		if (not itemTable) then return self:Remove() end

		local model = itemTable.onGetDropModel
			and itemTable:onGetDropModel(self)
			or itemTable.model
		if (itemTable.worldModel) then
			model = itemTable.worldModel == true
				and "models/props_junk/cardboard_box004a.mdl"
				or itemTable.worldModel
		end
		
		self:SetModel(model)
		
		self:SetSkin(itemTable.skin or 0)
		
		local customData = itemTable:getData("custom", {})
		if(customData.material or itemTable.material) then
			self:SetMaterial(customData.material or itemTable.material)
		end
		
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:setNetVar("id", itemTable.uniqueID)
		self.nutItemID = itemID

		if (table.Count(itemTable.data) > 0) then
			self:setNetVar("data", itemTable.data)
		end

		local physObj = self:GetPhysicsObject()
		if (not IsValid(physObj)) then
			local min, max = Vector(-8, -8, -8), Vector(8, 8, 8)

			self:PhysicsInitBox(min, max)
			self:SetCollisionBounds(min, max)
		end
		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end

		if (itemTable.onEntityCreated) then
			itemTable:onEntityCreated(self)
		end
	end

	function ENT:breakEffects()
		self:EmitSound(
			"physics/cardboard/cardboard_box_break"..
			math.random(1, 3)..
			".wav"
		)

		local position = self:LocalToWorld(self:OBBCenter())
		local effect = EffectData()
			effect:SetStart(position)
			effect:SetOrigin(position)
			effect:SetScale(3)
		util.Effect("GlassImpact", effect)
	end

	function ENT:OnRemove()
		local itemTable = self:getItemTable()

		if (self.breaking) then
			self:breakEffects()
			if (itemTable and itemTable.onDestroyed) then
				itemTable:onDestroyed(self)
			end
			self.breaking = false
		end

		if (not nut.shuttingDown and not self.nutIsSafe and self.nutItemID) then
			nut.item.deleteByID(self.nutItemID)
		end
	end

	function ENT:Think()
		local itemTable = self:getItemTable()

		if (itemTable and itemTable.think) then
			return itemTable:think(self)
		end

		self:NextThink(CurTime() + 1)
		return true
	end
else
	ENT.DrawEntityInfo = true

	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha

	function ENT:computeDescMarkup(description)
		if (self.desc ~= description) then
			self.desc = description
			
			local test = nut.markup.parse("<font=nutItemDescFont>"..description.."</font>")
			local descW = math.min(test:getWidth() or ScrW()*.15)
			
			self.markup = nut.markup.parse(
				"<font=nutItemDescFont>"..description.."</font>",
				ScrW()*.15
			)
		end
		
		return self.markup
	end

	function ENT:onDrawEntityInfo(alpha)
		local itemTable = self:getItemTable()
		if (not itemTable) then return end

		local oldEntity = itemTable.entity
		itemTable.entity = self

		local oldData = itemTable.data
		itemTable.data = self:getNetVar("data") or oldData

		local position = toScreen(self:LocalToWorld(self:OBBCenter()))
		local x, y = position.x, position.y

		local description = itemTable:getDesc(true)
		self:computeDescMarkup(description)

		local name = L(itemTable.getName and itemTable:getName() or itemTable.name)
		
		local customData = itemTable:getData("custom", {})
		
		local nameCol = colorAlpha(customData.color or itemTable.color or nut.config.get("color"), alpha)
		
		local color = customData.color or itemTable.color or nut.config.get("color")
		local text = "<font=nutItemBoldFont>".."<color="..color.r..","..color.g..","..color.b..">"..itemTable:getName().."</color>".."</font>\n"..
		"<font=nutItemDescFont>"..itemTable:getDesc(true)
		
		local descObj = nut.markup.parse("<font=nutItemDescFont>"..description.."</font>")
		local nameObj = nut.markup.parse("<font=nutItemBoldFont>"..name.."</font>")
		local w = math.min(descObj:getWidth() + 14, ScrW()*.15 + 12)
		w = math.max(w, nameObj:getWidth() + 14)
		
		fullObj = nut.markup.parse(text, w)
		local h = math.max(fullObj:getHeight() + nameObj:getHeight() * 0.6, ScrH()*.05 + 12)
	
		surface.SetDrawColor(40, 50, 55, alpha * 0.97)
		surface.DrawRect(x - w/2, y - 14, w, h)

		surface.SetDrawColor(70, 90, 95, alpha * 0.97)
		surface.DrawOutlinedRect(x - w/2, y - 14, w, h)		
		
		nut.util.drawText(
			name,
			x, y,
			nameCol,
			1, 1,
			"nutItemBoldFont",
			alpha * 0.65
		)
		y = y + 12

		if (self.markup) then
			self.markup:draw(x, y, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, alpha)
		end

		itemTable.data = oldData
		itemTable.entity = oldEntity
	end

	function ENT:DrawTranslucent()
		local itemTable = self:getItemTable()

		if (itemTable and itemTable.drawEntity) then
			itemTable:drawEntity(self)
		else
			self:DrawModel()
		end
	end
end

function ENT:getItemID()
	return self:getNetVar("id", "")
end

function ENT:getItemTable()
	return nut.item.list[self:getItemID()]
end

function ENT:getData(key, default)
	local data = self:getNetVar("data", {})
	if (data[key] == nil) then
		return default
	end
	return data[key]
end
