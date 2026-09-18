ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated (Flame)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_amputated_w"

ENT.name = "Burning Amputated"
ENT.model = "models/am_npc/amputated.mdl"
ENT.material = "models/effects/splode1_sheet" 

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 3,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Fire"] = 10,
	["Ichor"] = 5,
}

ENT.actions = {
	"maw_bite",
	"ichor_spit",
}

ENT.hp = 60
ENT.armor = 15

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.bleeds = true --for decals

ENT.SoundPitch = {70, 90}
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