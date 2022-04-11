ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Baby"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/zombibaba.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 5,
	["accuracy"] = 5,
	["medical"] = 0,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 5,
}

ENT.hp = 10
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 25,
}

ENT.actions = {
	"slash",
	"stab",
}

function ENT:Initialize()
	self:basicSetup()
end