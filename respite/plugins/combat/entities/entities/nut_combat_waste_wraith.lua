ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Waste (Ice)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_waste_w"

ENT.model = "models/prosperity/freak.mdl"
ENT.material = "models/effects/splode1_sheet"
ENT.color = Color(0, 150, 255)

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Attack01"

--all attributes
ENT.attribs = {
	["stm"] = 3,
	["str"] = 6,
	["accuracy"] = 4,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 2,
	["fortitude"] = 3,
}

ENT.dmg = {
	["Slash"] = 5,
	["Cold"] = 5,
}

ENT.hp = 80
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = -50,
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
	if(SERVER) then
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxHologram)
	end

	self:basicSetup()
end