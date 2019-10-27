ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Viper Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Viper Blood Fiend"
ENT.model = "models/sient hill custom/homecoming/lurker.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 35,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 30,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.3)
	end)	
	
	if (SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(128, 20, 20))
	end
end