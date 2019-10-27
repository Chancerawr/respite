ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (15)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 15,
	["perception"] = 15,
	["fortitude"] = 15,
}

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end