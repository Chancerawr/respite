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
ENT.agil = 0
ENT.stre = 20
ENT.accu = 40
ENT.craf = 0
ENT.endu = 20
ENT.luck = 0
ENT.perc = 0
ENT.fort = 10

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle")
	end)

	self:basicSetup()
end