ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Tripod"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.NPCReference = "resp_tripod"

ENT.model = "models/hunter.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.BloodColor = DONT_BLEED

ENT.AttackAnim = "Meleeleft"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 25,
	["accuracy"] = 25,
	["medical"] = 0,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Pierce"] = 15,
	["Ichor"] = 10,
}

ENT.hp = 500
ENT.armor = 150

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
	["Poison"] = 50,
	["Electric"] = 50,
}

ENT.StepData = {
	0.25,
	0.75,
}

ENT.StepPitch = {40,50}
ENT.FootstepSounds = {
	"npc/ministrider/ministrider_footstep1.wav",
	"npc/ministrider/ministrider_footstep2.wav",
	"npc/ministrider/ministrider_footstep3.wav",
	"npc/ministrider/ministrider_footstep4.wav",
	"npc/ministrider/ministrider_footstep5.wav",
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetBloodColor(DONT_BLEED)
		self:SetRenderMode(RENDERMODE_TRANSALPHA)
		self:SetRenderFX(kRenderFxDistort)
		
		--a little silly, but makes it look less like a hunter, I guess
		self.shell = ents.Create("prop_physics")
		local shell = self.shell
		shell:SetPos(self:GetPos() + self:GetUp()*80)
	
		local rand = math.random(1,3)
		if(rand == 1) then
			shell:SetModel("models/hunter/misc/sphere1x1.mdl")
		elseif(rand == 2) then
			shell:SetModel("models/hunter/blocks/cube075x075x075.mdl")
			shell:SetPos(shell:GetPos() + self:GetForward()*5)
		else
			shell:SetModel("models/hunter/misc/squarecap1x1x1.mdl")
			shell:SetAngles(self:GetAngles() + Angle(0,90,90))
			shell:SetPos(shell:GetPos() + self:GetForward()*15)
		end
		
		shell:SetMaterial("models/props_lab/security_screens")
		shell:SetModelScale(1)
		shell:SetMoveType(MOVETYPE_NONE)
		shell:SetRenderMode(RENDERMODE_TRANSALPHA)
		shell:SetParent(self, 6)
	end
end