ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Deformed"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/spite/freak01.mdl"
ENT.name = "Deformed"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 12,
	["accuracy"] = 5,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 12,
}

ENT.hp = 100
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

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