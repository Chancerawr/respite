ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombineplayer.mdl"
ENT.material = "models/flesh"
ENT.color = Color(130, 220, 130)

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
		self:ResetSequence("zombie_walk_06")
	end)

	self:basicSetup()
end