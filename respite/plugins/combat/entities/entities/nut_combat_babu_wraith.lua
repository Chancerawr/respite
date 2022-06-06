ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.IdleAnim = "Idle01"
ENT.AttackAnim = "AttackB"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 12,
	["accuracy"] = 0,
	["end"] = 12,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Ichor"] = 5,
}

ENT.hp = 50
ENT.armor = 20

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)
	
	self:basicSetup()
end