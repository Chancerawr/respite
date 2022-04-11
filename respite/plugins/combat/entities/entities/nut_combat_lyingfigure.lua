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

ENT.dmg = {
	["Acid"] = 25,
}

ENT.hp = 150
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 20,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 100,
	["Poison"] = 100,
	["Electric"] = 0,
}

ENT.actions = {
	"acid_spit",
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle")
	end)

	self:basicSetup()
end