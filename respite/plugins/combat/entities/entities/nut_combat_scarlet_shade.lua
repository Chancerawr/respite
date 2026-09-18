ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Scarlet (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_scarlet_s"

ENT.name = "Decrepit Puppet"

ENT.model = "models/spite/scarlet.mdl"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Attack1"

ENT.color = Color(0, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 12,
	["accuracy"] = 20,
	["end"] = 10,
	["luck"] = 1,
	["perception"] = 15,
	["fortitude"] = 30,
}

ENT.dmg = {
	["Blunt"] = 15,
	["Blight"] = 15,
}

ENT.hp = 350
ENT.armor = 50

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

ENT.actions = {
	"slash",
	"mawed_bite",
	"flail",
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.FootstepSounds = {
	"monsters/suitor/metal_walk01.mp3",
	"monsters/suitor/metal_walk02.mp3",
	"monsters/suitor/metal_walk03.mp3",
}

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:SetRenderMode(RENDERMODE_TRANSALPHA)
	self:SetRenderFX(kRenderFxDistort)
	
	self:basicSetup()
end