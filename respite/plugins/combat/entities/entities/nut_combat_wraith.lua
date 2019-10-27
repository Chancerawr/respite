ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/predatorcz/amnesia/grunt.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 35,
	["accuracy"] = 20,
	["end"] = 15,
	["luck"] = 10,
	["perception"] = 25,
	["fortitude"] = 20,
}

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/props_combine/tpballglow")
	end
	
	self:basicSetup()
end