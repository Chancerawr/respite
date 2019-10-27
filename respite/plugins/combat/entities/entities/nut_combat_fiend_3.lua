ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (15)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 15,
	["perception"] = 15,
	["fortitude"] = 15,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end