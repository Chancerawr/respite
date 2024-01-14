ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Titan (Small)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/cryoffear/taller/taller.mdl"

ENT.AttackAnim = "Attack"
ENT.WalkAnim = "Walk"
ENT.IdleAnim = "Idle"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 15,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 25,
}

ENT.hp = 400
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = -20,
	
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

function ENT:Initialize()
	self:basicSetup()
end