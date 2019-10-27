ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Mawed Fiend (Stage 3)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Mawed Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 25,
	["accuracy"] = 20,
	["end"] = 40,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("idle_all_angry")
	end)
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end