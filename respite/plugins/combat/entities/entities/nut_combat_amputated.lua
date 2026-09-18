ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_amputated"

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

ENT.StepData = {
	0.28,
	0.76,
}

ENT.SoundPitch = {50, 70}
ENT.SoundVolume = 0.3

ENT.FootstepSounds = {
	"respite/spore/foot1.wav",
	"respite/spore/foot2.wav",
	"respite/spore/foot3.wav",
	"respite/spore/foot4.wav",
	"respite/spore/foot5.wav",
}

ENT.AttackSounds = {
	"deadzone/lepotitsa/pain1.wav",
	"respite/scare20.wav"
}

ENT.IdleSounds = {
	"soma/npc_soma_proxy/hunt_01.wav",
	"soma/npc_soma_proxy/hunt_02.wav",
	"soma/npc_soma_proxy/hunt_03.wav",
	"soma/npc_soma_proxy/hunt_04.wav",
	"soma/npc_soma_proxy/hunt_05.wav",
	"soma/npc_soma_proxy/hunt_06.wav",
	"deadzone/lepotitsa/death2.wav",
	"respite/scare20.wav"
}

ENT.DeathSounds = {
	"smog/die_01.wav",
}

ENT.PainSounds = {
	"soma/npc_soma_proxy/idle_close_08.wav",
	"soma/npc_soma_proxy/idle_close_09.wav",
}

ENT.HitSounds = {
	"npc/zombie/claw_strike1.wav"
}