ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 15,
}

ENT.hp = 140
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 25,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)

	self:basicSetup()
end