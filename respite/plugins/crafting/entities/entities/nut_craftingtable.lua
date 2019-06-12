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
		if ( IsValid(physicsObject) ) then
			physicsObject:Wake()
		end
	end

	function ENT:Use(activator)
		netstream.Start( activator, "nut_CraftWindow", activator) 
	end
else
netstream.Hook("nut_CraftWindow", function(client, data)
		if (IsValid(nut.gui.crafting)) then
			nut.gui.crafting:Remove()
			return
		end
		surface.PlaySound( "items/ammocrate_close.wav" )
		nut.gui.crafting = vgui.Create("nut_Crafting")
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

	function ENT:OnRemove()
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
		
		drawText("A wooden table with a monitor, and a hole to drop objects into.", x, y + 16, colorAlpha(color_white, alpha), 1, 1, "nutEntDesc", alpha * 0.65)
		drawText("The monitor reacts to touch, allowing a user to select a “recipe”, which will display the materials required for the object described.", x, y + 34, colorAlpha(color_white, alpha), 1, 1, "nutEntDesc", alpha * 0.65)
	end
end
