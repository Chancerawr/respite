ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Red Horror"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/horror/zm_f4zt.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if (SERVER) then
		self:SetColor(Color(255,93,0))
		self:SetMaterial("models/effects/splode1_sheet")
	end
end