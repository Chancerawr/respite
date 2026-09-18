ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Paranoia"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_paranoia"

ENT.model = "models/respite/wheelchair.mdl"

ENT.collisionOverwrite = true
ENT.CollisionSide = 15
ENT.CollisionHeight = 55

ENT.AttackAnim = "Attack2"
ENT.IdleAnim = "Idle"

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
	0,
}

ENT.StepPitch = {80,120}
ENT.FootstepSounds = {
	"npc/wheelchair/wc_wheel1.wav",
	"npc/wheelchair/wc_wheel2.wav",
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT