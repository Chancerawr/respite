ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Drum (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_drum_s"

ENT.model = "models/player/zombie_soldier.mdl"

ENT.modelScale = 1.8

ENT.BloodColor = DONT_BLEED

ENT.IdleAnim = "zombie_walk_06"
ENT.WalkAnim = "zombie_walk_06"
ENT.RunAnim = "zombie_walk_06"
ENT.AttackAnim = "AttackC"

ENT.color = Color(0,0,0)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 30,
	["accuracy"] = 15,
	["end"] = 35,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Blight"] = 20,
}

ENT.hp = 500
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
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

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	if (SERVER) then
		self:SetBloodColor(DONT_BLEED)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxDistort)
	end

	self:basicSetup()
end