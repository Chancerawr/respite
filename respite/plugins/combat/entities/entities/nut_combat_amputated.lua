ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/am_npc/amputated.mdl"

ENT.WalkAnim = "walk"
ENT.RunAnim = "walk"
ENT.IdleAnim = "tantrum"
ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 8,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 10,
}

ENT.hp = 80
ENT.armor = 10

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
	"maw_bite",
	"throw_meat",
}

function ENT:Initialize()
	self:basicSetup()
end