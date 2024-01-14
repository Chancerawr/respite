ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Club"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Club"
ENT.model = "models/cryoffear/mace/sewer_boss.mdl"

ENT.AttackAnim = "Attack1"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 0,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 25,
	["Pierce"] = 10,
}

ENT.hp = 400
ENT.armor = 50

ENT.res = {
	["Pierce"] = -10,
	["Slash"] = 15,
	["Blunt"] = 15,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 0,
}

ENT.actions = {
	"whack",
}

function ENT:Initialize()
	self:basicSetup()
end