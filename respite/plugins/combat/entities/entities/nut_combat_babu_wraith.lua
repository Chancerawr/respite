ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 40,
	["accuracy"] = 0,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetMaterial("models/props_lab/security_screens")

	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)
	
	self:basicSetup()
end