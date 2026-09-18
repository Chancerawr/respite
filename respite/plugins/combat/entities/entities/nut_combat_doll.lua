ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Doll"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_doll_walker"

ENT.model = "models/spite/doll.mdl"

ENT.BloodColor = DONT_BLEED

ENT.IdleAnim = "Idle"
ENT.AttackAnim = "Attack2"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 8,
}

ENT.hp = 100
ENT.armor = 25

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 25,
}

ENT.StepData = {
	0.2,
	0.7,
}

ENT.FootstepSounds = {
	"monsters/suitor/metal_run01.mp3",
	"monsters/suitor/metal_run02.mp3",
	"monsters/suitor/metal_run03.mp3",
}

function ENT:Initialize()
	if(math.random(0,1) == 1) then
		self:SetMaterial("phoenix_storms/mrref2")
	else
		self:SetMaterial("models/props_buildings/plasterwall021a")
	end

	self:basicSetup()
end