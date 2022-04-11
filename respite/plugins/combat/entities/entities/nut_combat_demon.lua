ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Demon"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Demon"
ENT.model = "models/nh2zombies/friendly.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 30,
}

ENT.hp = 100
ENT.armor = 30

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

ENT.actions = {
	"slash",
	"stab",
	"poison_release",
}

function ENT:Initialize()
	self:basicSetup()
end