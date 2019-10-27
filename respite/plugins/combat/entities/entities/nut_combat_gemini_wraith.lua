ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 40,
	["accuracy"] = 10,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 30,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetMaterial("models/props_lab/security_screens")
	end	
end