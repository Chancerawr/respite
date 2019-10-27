ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombineplayer.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 20,
	["end"] = 40,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:SetColor(Color(130, 220, 130, 255))
	self:SetMaterial("models/flesh")
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
		self:ResetSequence("zombie_walk_06")
	end)

	self:basicSetup()
end