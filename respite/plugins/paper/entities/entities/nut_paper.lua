ENT.Type = "anim"
ENT.PrintName = "Paper"
ENT.Author = "Black Tea"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.Category = "NutScript"

if (SERVER) then

	function ENT:Initialize()
		self:SetModel("models/props_c17/paper01.mdl")
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:setNetVar("text", "")
		self:SetUseType(SIMPLE_USE)
		local physicsObject = self:GetPhysicsObject()
		if (IsValid(physicsObject)) then
			physicsObject:Wake()
		end
	end

	function ENT:Use(activator)
		activator:OpenNote( self:getNetVar( "text" ), self, self:getNetVar( "private" ) )
	end
	
else
	function ENT:Draw()
		self:DrawModel()
	end

	local TEXT_OFFSET = Vector(0, 0, 0)
	local toScreen = FindMetaTable("Vector").ToScreen
	local colorAlpha = ColorAlpha
	local drawText = nut.util.drawText
	local configGet = nut.config.get

	ENT.DrawEntityInfo = true

	function ENT:onDrawEntityInfo(alpha)
		--local position = toScreen(self:LocalToWorld(self, self:WorldSpaceCenter(self)) + TEXT_OFFSET)
		local position = toScreen(self:WorldSpaceCenter(self))
		local x, y = position.x, position.y
		drawText("Paper", x, y, colorAlpha(Color(50,50,190), alpha), 1, 1, nil, alpha * 0.65)

		--[[
		if (self:getNetVar("text")) then
			drawText(self:getNetVar("text"), x, y + 32, colorAlpha(color_white, alpha), 1, 1, "nutSmallFont", alpha * 0.65)
		end
		--]]
	end
end
