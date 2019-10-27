ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Portal Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Cracked Blood Fiend"
ENT.model = "models/Zombie/Poison.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	self:SetMaterial("models/flesh")
	self:SetColor(Color(128, 20, 128))
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
	end)
end