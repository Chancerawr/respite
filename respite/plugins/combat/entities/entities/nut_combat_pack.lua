ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Pack"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/pack.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 5,
	["accuracy"] = 10,
	["end"] = 4,
	["luck"] = 5,
	["perception"] = 2,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 20,
}

ENT.hp = 60
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
}

function ENT:Initialize()
	self:basicSetup()
end