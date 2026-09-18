ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum (Ice)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_drum_w"

ENT.model = "models/player/zombie_soldier.mdl"
ENT.material = "models/effects/splode1_sheet"

ENT.modelScale = 1.8

ENT.BloodColor = DONT_BLEED

ENT.IdleAnim = "zombie_walk_06"
ENT.WalkAnim = "zombie_walk_06"
ENT.RunAnim = "zombie_walk_06"
ENT.AttackAnim = "AttackC"

ENT.color = Color(0, 150, 255)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 35,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Cold"] = 15,
	["Ichor"] = 15,
}

ENT.hp = 600
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.StepData = {
	0.15,
	0.55,
}

ENT.StepPitch = 50
ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end)

	self:basicSetup()
end