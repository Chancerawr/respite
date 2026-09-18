ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Stranger"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_stranger"

ENT.model = "models/cryoffear/stranger/stranger.mdl"

ENT.AttackAnim = "Diesimple"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 50,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Blight"] = 25,
}

ENT.hp = 300
ENT.armor = 1000

ENT.res = {
	["Pierce"] = 75,
	["Slash"] = 75,
	["Blunt"] = 75,
	["Siege"] = 50,
	
	["Shotgun"] = 75,
	["Pistol"] = 75,
	["Magnum"] = 75,
	["Rifle"] = 75,
	["Sniper"] = 75,
	
	["Ichor"] = -50,
	["Blight"] = 100,
	["Shard"] = -500,
	["Distort"] = 50,
	["Time"] = 50,
	
	["Cold"] = 75,
	["Fire"] = 75,
	["Explosion"] = 75,
	["Acid"] = 75,
	["Poison"] = 75,
	["Electric"] = 75,
	["Rot"] = 75,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {40,50}
ENT.FootstepSounds = {
	"chorror/stinger2.wav",
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT