ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Babu Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/babu.mdl"
ENT.material = "models/props_lab/security_screens"

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

function ENT:Initialize()
	timer.Simple(0.6, function()
		self:ResetSequence("idle01")
	end)
	
	self:basicSetup()
end