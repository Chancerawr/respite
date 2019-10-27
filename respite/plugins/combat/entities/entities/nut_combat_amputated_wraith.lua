ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Amputated"
ENT.model = "models/am_npc/amputated.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 25,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 3,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetMaterial("models/effects/splode1_sheet")
	end	
end