ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrasher"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/_maz_ter_/deadspace/deadspacenecros/twitcher.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 0,
	["luck"] = 40,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/flesh")
		self:SetColor(Color(150,150,150,255))
	end
end