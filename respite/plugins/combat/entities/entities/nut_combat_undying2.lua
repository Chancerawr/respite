ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Undying (2)"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_skin"

ENT.name = "Undying"

ENT.models = {
	"models/Zombie/Classic.mdl",
}

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 25,
	["accuracy"] = 20,
	["end"] = 15,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 750
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
	
	if(SERVER) then
		self.boneMerge = ents.Create("prop_dynamic")
			merge = self.boneMerge
			merge:SetParent(self)
			merge:SetModel("models/tnb/citizens/male_64.mdl")
			merge.RenderGroup = RENDERGROUP_TRANSLUCENT
			merge:SetRenderMode(RENDERMODE_TRANSALPHA)

			merge:AddEffects(EF_BONEMERGE, EF_BONEMERGE_FASTCULL, EF_PARENT_ANIMATES )
		
		-- Change appearance (color, material, etc)
		self:SetColor(Color(200,200,200))
		merge:SetColor(Color(200,200,200))
		
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
			merge:SetMaterial(table.Random(faces))
		end
	end
	
	self.WalkAnim = "zombie_walk_0" ..math.random(1,6)
	self.RunAnim = "zombie_walk_0" ..math.random(1,6)
end