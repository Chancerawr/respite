ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Shell"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_drum"

ENT.models = {
	"models/player/zombie_soldier.mdl"
}

ENT.modelScale = 1.8

ENT.IdleAnim = "zombie_walk_06"
ENT.WalkAnim = "zombie_walk_06"
ENT.RunAnim = "zombie_walk_06"
ENT.AttackAnim = "AttackC"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 50,
	["accuracy"] = 0,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 30,
}

ENT.hp = 1000
ENT.armor = 250

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 20,
	["Blunt"] = 20,
	
	["Ichor"] = 0,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 0,
	["Time"] = 25,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"husk_fossilize",
}

ENT.actionsAI = {
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
	self:basicSetup()
	
	-- Change appearance (color, material, etc)
	self:SetColor(Color(200,200,200))
	
	local faces = {
		"models/humans/male/group01/eric_facemap",
	}
	
	for k, v in pairs(self:GetMaterials()) do
		self:SetSubMaterial(k-1, table.Random(faces))
	end
	
	self.WalkAnim = "Zombie Walk 0" ..math.random(1,6)
end