ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amalgamation"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_hatred_s"

ENT.model = "models/zombie/hatred.mdl"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "AttackA"
ENT.WalkAnim = "A_Walk3"
ENT.RunAnim = "A_Walk3"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Bblight"] = 20,
}

ENT.hp = 500
ENT.armor = 100

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
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"cof/taller/taller_step.wav",
}

function ENT:Initialize()
	self:SetColor(Color(0,0,0))
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)

	self:basicSetup()
end