ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Shade"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"
ENT.color = Color(0,0,0)

ENT.BloodColor = DONT_BLEED

ENT.IdleAnim = "Idle01"
ENT.AttackAnim = "AttackB"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 12,
	["accuracy"] = 5,
	["end"] = 12,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Blight"] = 5,
}

ENT.hp = 200
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 25,
}

ENT.StepData = {
	0,
	0.17,
	0.39,
	0.55,
	0.68,
	0.86,
}

ENT.SoundVolume = 0.5
ENT.SoundPitch = 55

ENT.FootstepSounds = {
	"babu/foot1.wav",
	"babu/foot2.wav",
	"babu/foot3.wav",
	"babu/foot4.wav",
}

ENT.AttackSounds = {
	"babu/attack1.wav",
	"babu/attack2.wav"
}

ENT.DeathSounds = {
	"babu/die1.wav",
	"babu/die2.wav"
}

ENT.WalkSounds = {
	"babu/loop1.wav",
	"babu/loop2.wav"
}

ENT.PainSounds = {
	"babu/pain1.wav",
	"babu/pain2.wav"
}

ENT.HitSounds = {
	"npc/zombie/claw_strike1.wav"
}

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)

	self:basicSetup()
end