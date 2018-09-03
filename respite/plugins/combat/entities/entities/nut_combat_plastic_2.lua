ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (10)"
ENT.Category = "NutScript - Combat"
ENT.Spawnable = true
ENT.AdminOnly = true

--all attributes
ENT.agil = 10
ENT.stre = 10
ENT.accu = 10
ENT.craf = 10
ENT.endu = 10
ENT.luck = 10
ENT.perc = 10
ENT.fort = 10

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