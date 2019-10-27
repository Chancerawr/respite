ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (10)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end