ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste"
ENT.Category = "NutScript - Combat"
ENT.Spawnable = true
ENT.AdminOnly = true

--all attributes
ENT.agil = 5
ENT.stre = 10
ENT.accu = 10
ENT.craf = 0
ENT.endu = 10
ENT.luck = 1
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/prosperity/freak.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_PUSH)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		--self:PhysicsInit(SOLID_BBOX)
		
		self:setNetVar("name", "Waste")
		self:setNetVar("desc", "")

		local physObj = self:GetPhysicsObject()

		if (IsValid(physObj)) then
			physObj:EnableMotion(false)
			physObj:Sleep()
		end
	end

	timer.Simple(1, function()
		if (IsValid(self)) then
			self:setAnim()
		end
	end)
end