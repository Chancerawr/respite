ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Chimera"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 12,
	["accuracy"] = 12,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Blunt"] = 5,
	["Slash"] = 5,
}

ENT.actions = {
	"smack",
	"slash",
	"stab",
}

ENT.hp = 300
ENT.armor = 150

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