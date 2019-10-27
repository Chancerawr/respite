ENT.Type = "anim"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (Random) (30-40)"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"
ENT.model = "models/tnb/citizens/male_04.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

function ENT:Initialize()
	self:basicSetup()

	self.attribs.stm = math.random(30,40)
	self.attribs.str = math.random(30,40)
	self.attribs.accuracy = math.random(30,40)
	self.attribs["end"] = math.random(30,40)
	self.attribs.luck = math.random(30,40)
	self.attribs.perception = math.random(30,40)
	self.attribs.fortitude = math.random(30,40)
	
	self:SetModel(table.Random(nut.faction.indices[FACTION_PLASTIC].models))
	
	for k, v in pairs(self:GetBodyGroups()) do
		self:SetBodygroup(v.id, math.random(0, v.num))
	end
	
	if (SERVER) then
		self:SetMaterial("phoenix_storms/mrref2")
	end
end