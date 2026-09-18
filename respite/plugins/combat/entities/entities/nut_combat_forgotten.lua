ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Forgotten"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_wraith"

ENT.name = "Forgotten"
ENT.model = "models/player/group01/male_04.mdl"
ENT.color = Color(128, 0, 128)

ENT.BloodColor = DONT_BLEED

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Ichor"] = 25,
}

ENT.hp = 500
ENT.armor = 0

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

ENT.FootstepSounds = {
	"npc/footsteps/hardboot_generic1.wav",
	"npc/footsteps/hardboot_generic2.wav",
	"npc/footsteps/hardboot_generic3.wav",
	"npc/footsteps/hardboot_generic4.wav",
	"npc/footsteps/hardboot_generic5.wav",
	"npc/footsteps/hardboot_generic6.wav",
}

function ENT:Initialize()
	self:SetSubMaterial(1, "models/props_combine/tpballglow")
	self:SetSubMaterial(2, "models/props_combine/tpballglow")
	self:SetSubMaterial(3, "models/props_combine/tpballglow")

	self:basicSetup()
end