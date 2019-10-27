ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul (Creeper)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 0,
	["luck"] = 4,
	["perception"] = 10,
	["fortitude"] = 10,
}

function ENT:Initialize()
	if(SERVER) then
		self:SetMaterial("models/props_lab/warp_sheet")
		self:SetColor(Color(190,0,0))
	end

	self:basicSetup()
end