ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/prosperity/freak.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 4,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

ENT.dmg = {
	["Slash"] = 10,
}

ENT.hp = 40
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
	"whack",
	"claw_decay",
}

function ENT:Initialize()
	self:basicSetup()
end