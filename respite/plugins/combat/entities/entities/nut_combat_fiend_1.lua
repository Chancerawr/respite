ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (5)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end