ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Damaged Plastic (Random)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Damaged Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.agil = 0
ENT.stre = 0
ENT.accu = 0
ENT.craf = 0
ENT.endu = 0
ENT.luck = 0
ENT.perc = 0
ENT.fort = 0

function ENT:Initialize()
	self:basicSetup()

	self.agil = math.random(10,30)
	self.stre = math.random(10,30)
	self.accu = math.random(10,30)
	self.craf = math.random(10,30)
	self.endu = math.random(10,30)
	self.luck = math.random(10,30)
	self.perc = math.random(10,30)
	self.fort = math.random(10,30)
	
	self:SetModel(table.Random(nut.faction.indices[FACTION_PLASTIC].models))
	
	--[[
	for k, v in pairs(self:GetBodyGroups()) do
		self:SetBodygroup(v.id, math.random(0, v.num))
	end
	--]]
	
	if (SERVER) then
		self:SetMaterial("models/props_buildings/destroyedbuilldingwall01a")
	end
end