ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Mannequin"
ENT.Category = "NutScript - Combat"
ENT.Spawnable = true
ENT.AdminOnly = true

--all attributes
ENT.agil = 0
ENT.stre = 0
ENT.accu = 0
ENT.craf = 0
ENT.endu = 0
ENT.luck = 1
ENT.perc = 0
ENT.fort = 30

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/nh2_gmn/dave_the_dummy_on_stand.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_PUSH)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		--self:PhysicsInit(SOLID_BBOX)
		
		self:setNetVar("name", "Mannequin")
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