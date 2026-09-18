ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Charred"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_zm_charred"

ENT.model = "models/Zombie/poison.mdl"
ENT.material = "models/charple/charple4_sheet" 

ENT.modelScale = 1.25

ENT.WalkAnim = "firewalk"
ENT.RunAnim = "firewalk"
ENT.IdleAnim = ACT_IDLE
ENT.AttackAnim = "Throw"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 20,
	["accuracy"] = 10,
	["end"] = 15,
	["luck"] = -5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Fire"] = 10,
}

ENT.hp = 200
ENT.armor = -20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 0,
	["Distort"] = 0,
	
	["Cold"] = -50,
	["Fire"] = 50,
	["Explosion"] = 25,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"throw_meat",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"npc/zombie_poison/pz_left_foot1.wav",
	"npc/zombie_poison/pz_right_foot1.wav",
}