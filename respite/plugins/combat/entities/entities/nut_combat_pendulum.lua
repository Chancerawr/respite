ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Pendulum"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/pendulum.mdl"

ENT.AttackAnim = "Attack"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 2,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 300
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 20,
	
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