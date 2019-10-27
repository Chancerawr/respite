ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Doll"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/doll.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 10,
}

function ENT:Initialize()
	if(math.random(0,1) == 1) then
		self:SetMaterial("phoenix_storms/mrref2")
	else
		self:SetMaterial("models/props_buildings/plasterwall021a")
	end

	self:basicSetup()
end