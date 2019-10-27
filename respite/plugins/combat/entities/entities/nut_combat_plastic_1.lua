ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (5)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 5,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end