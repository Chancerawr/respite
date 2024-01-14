ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrower"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/zombie_fast.mdl"
ENT.material = "models/flesh"

ENT.modelScale = 1.2

ENT.color = Color(155, 255, 155)

ENT.IdleAnim = "Zombie Idle 01"
ENT.WalkAnim = "Zombie Walk 01"
ENT.RunAnim = "Zombie Walk 01"
ENT.AttackAnim = "Zombie Attack 06 Original"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 20,
	["accuracy"] = 4,
	["end"] = 7,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 15,
	["Fire"] = 5,
}

ENT.hp = 100
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"throw_meat",
	"whack",
	"flail",
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		--self:SetModelScale(1.2)
		self:ResetSequence("zombie_walk_01")
	end)

	self:basicSetup()
end