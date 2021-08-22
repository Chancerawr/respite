ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Mawed Fiend (Stage 3)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Mawed Blood Fiend"
ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 20,
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
end