ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Manuscript"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/respite/paperzombie.mdl"

ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 2,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 20
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = -50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end