ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Jailer"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/group01/male_04.mdl"

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.hp = 1000
ENT.armor = 1000

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 50,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Blunt"] = 35,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	["Siege"] = -50,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Time"] = 50,
	["Erasure"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = -25,
	["Acid"] = -25,
	["Poison"] = 50,
	["Electric"] = -50,
}

ENT.actions = {
	"jailer_nightmare",
	"jailer_shield",
	"jailer_lastshot",
	"jailer_uplift",
	"jailer_verdict",
	"jailer_chains",
	"jailer_brace",
	"jailer_lastwill",
}

function ENT:Initialize()
	self:basicSetup()
end