ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Shambler"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/freshdead/freshdead_01.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 20,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 10,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/angelsaur/ghosts/shadow")
	end
end