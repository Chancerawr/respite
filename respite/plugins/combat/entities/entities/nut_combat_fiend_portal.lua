ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Cracked Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Cracked Blood Fiend"

ENT.model = "models/Zombie/Poison.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 25,
	["accuracy"] = 20,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
	end)
end