AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Item"
ENT.Category = "NutScript"
ENT.Spawnable = false
ENT.RenderGroup 		= RENDERGROUP_BOTH

if (SERVER) then
	function ENT:Initialize()
		self:SetModel("models/props_junk/watermelon01.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self.health = 50

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end
	end

	--[[
	function ENT:setHealth(amount)
		self.health = amount
	end
	--]]
	
	--[[
	function ENT:OnTakeDamage(dmginfo)
		local damage = dmginfo:GetDamage()
		self:setHealth(self.health - damage)

		if (self.health < 0 and !self.onbreak) then
			self.onbreak = true
			self:Remove()
		end
	end
	--]]

	function ENT:setItem(itemID)
		local itemTable = nut.item.instances[itemID]

		if (itemTable) then
			local model = itemTable.onGetDropModel and itemTable:onGetDropModel(self) or itemTable.model

			self:SetSkin(itemTable.skin or 0)
			
			if (itemTable.material) then --material
				self:SetMaterial(itemTable.material)
			end
			
			if (itemTable.worldModel) then
				self:SetModel(itemTable.worldModel)
			end
			
			self:SetModel(model)
			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
			self:setNetVar("id", itemTable.uniqueID)
			self.nutItemID = itemID

			if (table.Count(itemTable.data) > 0) then
				self:setNetVar("data", itemTable.data)
			end

			local physObj = self:GetPhysicsObject()

			if (!IsValid(physObj)) then
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
	end

	function ENT:OnRemove()
		if (!nut.shuttingDown and !self.nutIsSafe and self.nutItemID) then
			local item = nut.item.instances[self.nutItemID]

			if (item) then
				if (item.onRemoved) then
					item:onRemoved()
				end

				nut.db.query("DELETE FROM nut_items WHERE _itemID = "..self.nutItemID)
			end
		end
	end
	
	function ENT:Think()
		local it = self:getItemTable()
		
		if (it) then
			if (!it.id or it.id == 0) then
				self:Remove()
			end
		end
	end
else
	ENT.DrawEntityInfo = true

	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha

	function ENT:onDrawEntityInfo(alpha)
		local itemTable = self.getItemTable(self)

		if (itemTable) then
			local oldData = itemTable.data
			itemTable.data = self.getNetVar(self, "data", {})
			itemTable.entity = self

			local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
			local x, y = position.x, position.y
			local description = itemTable.getDesc(itemTable)

			local name = itemTable.getName(itemTable)
			
			local color = nut.config.get("color")
			
			--default custom color
			--[[
			if (itemTable:getData("customName") != "" and itemTable:getData("customName") != nil) then 
				color = colorAlpha(Color(200,200,0), alpha)
			else		
				color = colorAlpha(nut.config.get("color"), alpha)
			end
			--]]
			
			--couldn't use customCol to just set it on items, had to use item.color for some reason.
			if (itemTable.color != nil) then
				color = colorAlpha(itemTable.color, alpha)
			end
			
			if(itemTable:getData("customCol") != nil) then
				color = colorAlpha(itemTable:getData("customCol"), alpha)
			end
			
			if (description != self.desc) then
				self.desc = description
				self.lines, self.offset = nut.util.wrapText(description, ScrW() * 0.7, "nutSmallFont")
				self.offset = self.offset * 0.5
			end
			
			--custom names
			--[[
			if (itemTable:getData("customName") != "" and itemTable:getData("customName") != nil) then
				name = itemTable:getData("customName")
			else		
				name = itemTable.name
			end
			--]]
			
			nut.util.drawText(L(name), x, y, colorAlpha(color, alpha), 1, 1, nil, alpha * 0.65)

			local lines = self.lines
			local offset = self.offset

			for i = 1, #lines do
				nut.util.drawText(lines[i], x, y + (i * 16), colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
			end

			itemTable.entity = nil
			itemTable.data = oldData
		end		
	end

	function ENT:DrawTranslucent()
		local itemTable = self:getItemTable()

		if (itemTable and itemTable.drawEntity) then
			itemTable:drawEntity(self, itemTable)
		end
	end
	
	--doesnt draw if it's too far away. Comment this out if losing fps on maps with render zones or whatever they're called.
	--[[
	function ENT:Draw()
		if(LocalPlayer():GetPos():Distance( self:GetPos() ) < 5000) then
			self:DrawModel()
			self:DrawShadow(true)
		else
			self:DrawShadow(false)
		end
	end
	--]]
end

function ENT:getItemTable()
	return nut.item.list[self:getNetVar("id", "")]
end

function ENT:getData(key, default)
	local data = self:getNetVar("data", {})

	return data[key] or default
end