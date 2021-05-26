ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (20)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 20,
	["perception"] = 20,
	["fortitude"] = 20,
}

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end