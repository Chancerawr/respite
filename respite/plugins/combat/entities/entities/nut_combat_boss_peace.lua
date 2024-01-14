ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Peace"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/player/group01/male_04.mdl"

ENT.WalkAnim = "walk_all"
ENT.RunAnim = "run_all_01"

ENT.hp = 5000
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 100,
	["str"] = 100,
	["accuracy"] = 100,
	["end"] = 100,
	["luck"] = 100,
	["perception"] = 100,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Pistol"] = 15,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 25,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 25,
	
	["Time"] = -100,
	["Erasure"] = -10,
	
	["Fire"] = 25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -50,
}

ENT.actions = {
	"erasure",
	"dist_slice",
	"shard_beam",
	"blight_shadow",
	"boss_disarm",
	"peace_judgement",
	"peace_dream",
	"peace_determination",
	"peace_innocence",
	"reality_bend",
	"heartstopper",
	"ichor_glimpse",
}

function ENT:Initialize()
	self:basicSetup()
end