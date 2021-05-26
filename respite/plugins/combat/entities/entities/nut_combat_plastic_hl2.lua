ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (HL2 Model)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/Humans/Group01/Male_04.mdl"

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