ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 5,
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