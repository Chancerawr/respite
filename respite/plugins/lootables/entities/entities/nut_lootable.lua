local PLUGIN = PLUGIN
AddCSLuaFile()

ENT.Type = "anim"
ENT.PrintName = "Lootable"
ENT.Category = "NutScript"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Editable = true

function ENT:SetupDataTables()
	self:NetworkVar("String", 0, "EntName", {	
		KeyName = "EntName", 
		Edit = {
			type = "Generic",
			title = "Name",
			order = 1, 
		},
	})
	
	self:NetworkVar("String", 1, "EntDesc", {	
		KeyName = "EntDesc", 
		Edit = {
			type = "Generic",
			title = "Description",
			order = 2, 
		},
	})
	
	self:NetworkVar("String", 2, "EntModel", {	
		KeyName = "EntModel", 
		Edit = {
			type = "Generic",
			waitforenter = true,
			title = "Model",
			order = 3,
		},
	})
	
	self:NetworkVar("String", 3, "LootTable", {	
		KeyName = "LootTable", 
		Edit = {
			type = "Generic", 
			waitforenter = true,
			title = "Loot Table",
			order = 4,
		},
	})
end

if (SERVER) then
	function ENT:Initialize(model)
		self:SetModel("models/props_junk/wood_crate001a.mdl")
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		local physObj = self:GetPhysicsObject()
		if (IsValid(physObj)) then
			physObj:EnableMotion(true)
			physObj:Wake()
		end
		
		if(SERVER) then
			PLUGIN.lootEnts[#PLUGIN.lootEnts+1] = self
		end
		
		if (SERVER) then
			self:NetworkVarNotify("EntName", self.OnVarChanged)
			self:NetworkVarNotify("EntDesc", self.OnVarChanged)
			self:NetworkVarNotify("EntModel", self.OnVarChanged)
			self:NetworkVarNotify("LootTable", self.OnVarChanged)
		end
	end
	
	function ENT:OnVarChanged(name, old, new)
		if(name == "EntModel") then
			self:SetModel(new)
		end
		
		PLUGIN:SaveData()
	end

	function ENT:Use(client)
		if ((self.nextUse or 0) > CurTime()) then return end
		self.nextUse = CurTime() + 1

		if(self.lootEnabled) then
			client:Freeze(true)
			client:setAction("Searching...", nut.config.get("lootTime", 5), function()
				client:Freeze(false)
				self.lootEnabled = false
				
				client:EmitSound("items/ammocrate_open.wav")
				
				--randomly generates an item from the storage's table
				local item = PLUGIN:generateLoot(self)
				if(!item) then return end
				if(!nut.item.list[item]) then return end

				--add the item to the inventory
				local inventory = client:getChar():getInv()
				if(!inventory:add(item)) then --if the inventory is full, drop it on the ground
					nut.item.spawn(item, client:getItemDropPos())
				end
				
				client:notify("You found " ..nut.item.list[item].name.. ".")
			end)
		else
			client:notify("This has already been looted.")
		end
	end
	
	function ENT:OnRemove()
		table.RemoveByValue(PLUGIN.lootEnts, self)
	end
else
	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		local toScreen = FindMetaTable("Vector").ToScreen
		local colorAlpha = ColorAlpha
		local drawText = nut.util.drawText
		local configGet = nut.config.get
		
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		
		local name = self:GetEntName() or "Storage"
		local desc = self:GetEntDesc() or ""

		drawText(name, x, y, colorAlpha(color_white, alpha), 1, 1, "nutMediumFont", alpha * 0.65)
		drawText(desc, x, y+24, colorAlpha(color_white, alpha), 1, 1, "nutMediumFont", alpha * 0.65)
		drawText("<E>", x, y+48, colorAlpha(color_white, alpha), 1, 1, "nutMediumFont", alpha * 0.65)
	end
end;