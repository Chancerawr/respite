ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Blood Stalker"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Stalker"
ENT.model = "models/spite/fiend.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 30,
	["accuracy"] = 30,
	["end"] = 30,
	["luck"] = 30,
	["perception"] = 30,
	["fortitude"] = 50,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end