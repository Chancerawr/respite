ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (15)"
ENT.Category = "NutScript - Combat"
ENT.Spawnable = true
ENT.AdminOnly = true

--all attributes
ENT.agil = 15
ENT.stre = 15
ENT.accu = 15
ENT.craf = 15
ENT.endu = 15
ENT.luck = 15
ENT.perc = 15
ENT.fort = 15

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/tnb/citizens/male_04.mdl")
		self:SetMaterial("phoenix_storms/mrref2")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_PUSH)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		--self:PhysicsInit(SOLID_BBOX)
		
		self:setNetVar("name", "Plastic")
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