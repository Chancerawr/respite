ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sin/leperkin.mdl"
ENT.name = "Burning Hunter"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 25,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	if (SERVER) then
		self:SetMaterial("models/effects/splode1_sheet")
	end
end