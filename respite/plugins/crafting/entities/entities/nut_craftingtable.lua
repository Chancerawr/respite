local PLUGIN = PLUGIN
ENT.Type = "anim"
ENT.PrintName = "Crafting Table"
ENT.Author = "Black Tea"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "NutScript"
ENT.RenderGroup 		= RENDERGROUP_BOTH
--AddCSLuaFile('cl_init.lua')

if (SERVER) then
	function ENT:Initialize()
		--self:SetModel("models/props_c17/FurnitureTable002a.mdl")
		self:SetModel("models/tnb/items/workbench.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
		
		self.receivers = {}
		
		timer.Simple(1, function()
			if(self:getNetVar("id")) then
				nut.inventory.loadByID(self:getNetVar("id"))
				:next(function(inventory)
					if (inventory and IsValid(self) and !(inventory.loaded and IsValid(inventory.loaded))) then
						inventory.loaded = self
						inventory.isStorage = true
						self:setInventory(inventory)
					end
				end)
			else
				nut.inventory.instance("grid", {10,10})
					:next(function(inventory)
						if(IsValid(self) and self.setInventory) then --why is this necessary?
							self:setInventory(inventory)
						end
					end)
			end
		end)
	end

	function ENT:Use(activator)
		netstream.Start(activator, "nut_CraftWindow", activator, self)
	end
	
	function ENT:setInventory(inventory)
		assert(inventory, "Storage setInventory called without an inventory!")
		self:setNetVar("id", inventory:getID())

		hook.Run("StorageInventorySet", self, inventory)
	end	

	function ENT:getInv()
		return nut.item.inventories[self:getNetVar("id", 0)]
	end	
	
	function ENT:OnRemove()
		if (not self.nutForceDelete) then
			if (not nut.entityDataLoaded or not PLUGIN.loadedData) then return end
			if (self.nutIsSafe) then return end
			if (nut.shuttingDown) then return end
		end
		
		self:deleteInventory()
	end
	
	function ENT:deleteInventory()
		local inventory = self:getInv()
		if (inventory) then
			inventory:delete()

			if (not self.nutForceDelete) then
				--hook.Run("StorageEntityRemoved", self, inventory)
			end

			self:setNetVar("id", nil)
		end
	end
else
	netstream.Hook("nut_CraftWindow", function(client, ent)
		if (IsValid(nut.gui.crafting)) then
			nut.gui.crafting:Remove()
			return
		end
		
		surface.PlaySound("items/ammocrate_close.wav")
		nut.gui.crafting = vgui.Create("nut_Crafting")
		nut.gui.crafting.ent = ent
		nut.gui.crafting:Center()
	end)

	function ENT:Initialize()
	end
	
	function ENT:Draw()
		self:DrawModel()
	end

	ENT.DisplayVector = Vector( 5, 5, 45 )
	ENT.DisplayAngle = Angle( 0, 270, 0 )
	ENT.DisplayScale = .5
	function ENT:DrawTranslucent()
	local pos = self:GetPos() + self:GetUp() * self.DisplayVector.z + self:GetRight() * self.DisplayVector.x + self:GetForward() * self.DisplayVector.y
	local ang = self:GetAngles() 
	ang:RotateAroundAxis( self:GetRight(), self.DisplayAngle.pitch ) -- pitch
	ang:RotateAroundAxis( self:GetUp(),  self.DisplayAngle.yaw )-- yaw
	ang:RotateAroundAxis( self:GetForward(), self.DisplayAngle	.roll )-- roll
	cam.Start3D2D( pos, ang, self.DisplayScale )	
		surface.SetDrawColor( 0, 0, 0 )
		surface.SetTextColor( 255, 255, 255 )
		surface.SetFont( "ChatFont" )
		local size = { x = 10, y = 10 }
		size.x, size.y = surface.GetTextSize("Fabricator")
		surface.SetTextPos( -size.x/2, -size.y/2 )
		size.x = size.x + 20; size.y = size.y + 15
		surface.DrawText("Fabricator")
	cam.End3D2D()
	end
end

if(CLIENT) then
	ENT.DrawEntityInfo = true
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	function ENT:onDrawEntityInfo(alpha)
		local position = toScreen(self.LocalToWorld(self, self.OBBCenter(self)))
		local x, y = position.x, position.y
		
		drawText("A wooden table with a monitor, and a hole to drop objects into.", x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
		drawText("The monitor reacts to touch, allowing a user to select a “recipe”, which will display the materials required for the object described.", x, y + 34, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
	end
end
