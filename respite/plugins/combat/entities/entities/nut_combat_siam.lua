ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Slam"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/siam.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 30,
	["accuracy"] = 10,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 50,
}

ENT.hp = 1000
ENT.armor = 100

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

function ENT:Initialize()
	self:basicSetup()
end