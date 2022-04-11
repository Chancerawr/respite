ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Hatred"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/hatred.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 30,
}

ENT.hp = 400
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