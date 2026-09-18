ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Peasant"
ENT.Category = "NutScript - Combat (Fantasy)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/humans/groupm1/female_01.mdl"

ENT.models = {
	"models/humans/groupm1/female_01.mdl",
	"models/humans/groupm1/female_02.mdl",
	"models/humans/groupm1/female_06.mdl",
	"models/humans/groupm1/male_02.mdl",
	"models/humans/groupm1/male_04.mdl",
	"models/humans/groupm1/male_06.mdl",
	"models/humans/groupm1/male_07.mdl",
	"models/humans/groupm1/male_08.mdl",
	"models/humans/groupm1/male_09.mdl",
	"models/humans/groupm2/female_01.mdl",
	"models/humans/groupm2/female_02.mdl",
	"models/humans/groupm2/female_06.mdl",
	"models/humans/groupm2/male_02.mdl",
	"models/humans/groupm2/male_04.mdl",
	"models/humans/groupm2/male_06.mdl",
	"models/humans/groupm2/male_07.mdl",
	"models/humans/groupm2/male_08.mdl",
	"models/humans/groupm2/male_09.mdl",
	"models/humans/groupm3/female_01.mdl",
	"models/humans/groupm3/female_02.mdl",
	"models/humans/groupm3/female_06.mdl",
	"models/humans/groupm3/male_02.mdl",
	"models/humans/groupm3/male_04.mdl",
	"models/humans/groupm3/male_06.mdl",
	"models/humans/groupm3/male_07.mdl",
	"models/humans/groupm3/male_08.mdl",
	"models/humans/groupm3/male_09.mdl",
	"models/humans/groupm4/female_01.mdl",
	"models/humans/groupm4/female_02.mdl",
	"models/humans/groupm4/female_06.mdl",
	"models/humans/groupm4/male_02.mdl",
	"models/humans/groupm4/male_04.mdl",
	"models/humans/groupm4/male_06.mdl",
	"models/humans/groupm4/male_07.mdl",
	"models/humans/groupm4/male_08.mdl",
	"models/humans/groupm4/male_09.mdl",
	"models/humans/groupm5/female_01.mdl",
	"models/humans/groupm5/female_02.mdl",
	"models/humans/groupm5/female_06.mdl",
	"models/humans/groupm5/male_02.mdl",
	"models/humans/groupm5/male_04.mdl",
	"models/humans/groupm5/male_06.mdl",
	"models/humans/groupm5/male_07.mdl",
	"models/humans/groupm5/male_08.mdl",
	"models/humans/groupm5/male_09.mdl",
	"models/humans/groupm6/female_01.mdl",
	"models/humans/groupm6/female_02.mdl",
	"models/humans/groupm6/female_06.mdl",
	"models/humans/groupm6/male_02.mdl",
	"models/humans/groupm6/male_04.mdl",
	"models/humans/groupm6/male_06.mdl",
	"models/humans/groupm6/male_07.mdl",
	"models/humans/groupm6/male_08.mdl",
	"models/humans/groupm6/male_09.mdl",
	"models/humans/groupm7/female_01.mdl",
	"models/humans/groupm7/female_02.mdl",
	"models/humans/groupm7/female_06.mdl",
	"models/humans/groupm7/male_02.mdl",
	"models/humans/groupm7/male_04.mdl",
	"models/humans/groupm7/male_06.mdl",
	"models/humans/groupm7/male_07.mdl",
	"models/humans/groupm7/male_08.mdl",
	"models/humans/groupm7/male_09.mdl",
	"models/humans/groupm8/female_01.mdl",
	"models/humans/groupm8/female_02.mdl",
	"models/humans/groupm8/female_06.mdl",
	"models/humans/groupm8/male_02.mdl",
	"models/humans/groupm8/male_04.mdl",
	"models/humans/groupm8/male_06.mdl",
	"models/humans/groupm8/male_07.mdl",
	"models/humans/groupm8/male_08.mdl",
	"models/humans/groupm8/male_09.mdl",
}

ENT.IdleAnim = "Idle_Subtle"
--ENT.AttackAnim = "Attack_Unarmed_1"
ENT.WalkAnim = "Walk_All"
ENT.RunAnim = "Run_All"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 5,
}

ENT.hp = 80
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = -50,
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
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"hgn/crussaria/move/chain/jump_01.wav",
	"hgn/crussaria/move/chain/jump_02.wav",
	"hgn/crussaria/move/chain/jump_03.wav",
}