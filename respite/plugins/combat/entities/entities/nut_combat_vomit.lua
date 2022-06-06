ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Vomit"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombie_vomit.mdl"
ENT.name = "Vomit"

ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 4,
	["str"] = 2,
	["accuracy"] = 5,
	["end"] = 6,
	["luck"] = 2,
	["perception"] = 4,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Acid"] = 20,
}

ENT.hp = 80
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
	["Acid"] = 50,
	["Poison"] = 50,
	["Electric"] = 0,
}

ENT.actions = {
	"acid_spit",
}

function ENT:Initialize()
	self:basicSetup()
end