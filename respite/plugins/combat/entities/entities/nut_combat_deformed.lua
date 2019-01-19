ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Deformed"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/freak01.mdl"
ENT.name = "Deformed"

--all attributes
ENT.agil = 5
ENT.stre = 15
ENT.accu = 5
ENT.craf = 0
ENT.endu = 15
ENT.luck = 5
ENT.perc = 5
ENT.fort = 0

local models = {
	"models/spite/freak01.mdl",
	"models/spite/freak02.mdl",
	"models/spite/freak03.mdl",
	"models/spite/freak04.mdl"
}

function ENT:Initialize()
	self:basicSetup()
	
	if(SERVER) then
		self:SetModel(table.Random(models))
	end
end