ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true
ENT.model = "models/nh2zombies/creeper.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

function ENT:Initialize()
	if (SERVER) then
		self:SetMaterial("models/props_combine/tpballglow")
	end
	
	self:basicSetup()
end