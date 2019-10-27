ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Phantom"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/junkie_01.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 5,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 5,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/comball_glow1")
	end
end