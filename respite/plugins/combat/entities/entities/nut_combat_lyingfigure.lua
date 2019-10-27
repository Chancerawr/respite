ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Lying Figure"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Lying Figure"
ENT.model = "models/chillax_sf2/silenthill/sh2/lying_figure/lying_figure.mdl"
ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 40,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle")
	end)

	self:basicSetup()
end