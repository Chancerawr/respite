ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Combat Prop Base"
ENT.Category = "NutScript - Combat (Prop)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Combine_Helicopter/helicopter_bomb01.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()  	
	if phys:IsValid() then  		
		phys:Wake()
	end
end

function ENT:Think()
	self:CustomThink()
end