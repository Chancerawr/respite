ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Lurker"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/sient hill custom/Homecoming/lurker.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 14,
	["str"] = 18,
	["accuracy"] = 14,
	["end"] = 12,
	["luck"] = 5,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 250
ENT.armor = 60

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
}

function ENT:Initialize()
	self:basicSetup()
end