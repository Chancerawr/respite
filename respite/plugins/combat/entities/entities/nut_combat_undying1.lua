ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Undying (1)"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_skin"

ENT.name = "Undying"

ENT.models = {
	"models/tnb/citizens/male_64.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 20,
}

ENT.hp = 500
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 20,
	["Blunt"] = 10,
	
	["Ichor"] = -100,
	["Blight"] = 50,
	["Shard"] = 50,
	["Distort"] = 0,
	["Time"] = 75,
	
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
		"models/humans/female/group01/joey_facemap",
		"models/humans/female/group01/kanisha_cylmap",
		"models/humans/female/group01/naomi_facemap",
		"models/humans/male/group01/eric_facemap",
		"models/humans/male/group01/ted_facemap",
		"models/humans/male/group01/sandro_facemap",
		"models/humans/male/group01/mike_facemap",
		"models/humans/male/group01/vance_facemap",
		"models/humans/male/group01/erdim_cylmap",
		"models/humans/male/group01/mike_facemap",
	}
	
	for k, v in pairs(self:GetMaterials()) do
		self:SetSubMaterial(k-1, table.Random(faces))
	end
	
	self.WalkAnim = "zombie_walk_0" ..math.random(1,6)
	self.RunAnim = "zombie_walk_0" ..math.random(1,6)
end