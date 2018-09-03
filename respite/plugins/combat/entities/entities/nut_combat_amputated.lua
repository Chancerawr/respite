ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated"
ENT.Category = "NutScript - Combat"
ENT.Spawnable = true
ENT.AdminOnly = true

--all attributes
ENT.agil = 5
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 5
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	if (SERVER) then
		self:SetModel("models/am_npc/amputated.mdl")
		self:SetUseType(SIMPLE_USE)
		self:SetMoveType(MOVETYPE_PUSH)
		self:DrawShadow(true)
		self:SetSolid(SOLID_BBOX)
		--self:PhysicsInit(SOLID_BBOX)

		self:setNetVar("name", "Amputated")
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