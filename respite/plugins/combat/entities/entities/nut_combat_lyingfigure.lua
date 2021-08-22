ENT.Type = "nextbot"
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
	["stm"] = 2,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 10,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle")
	end)

	self:basicSetup()
end