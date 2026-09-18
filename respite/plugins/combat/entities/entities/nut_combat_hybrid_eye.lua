ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Hypocrite's Eye"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/gibs/humans/eye_gib.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.modelScale = 5

ENT.AttackAnim = "Attack"

ENT.color = Color(128, 0, 0, 128)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 50,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 50,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Unknown"] = 10,
}

ENT.hp = 1000
ENT.armor = 200

ENT.actions = {
	"piercing_gaze",
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	self:SetModelScale(self.modelScale)
	self:Activate()
end