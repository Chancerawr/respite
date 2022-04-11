ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Helicopter"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/combine_helicopter.mdl"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 40,
	["end"] = 40,
	["luck"] = 15,
	["perception"] = 30,
	["fortitude"] = 0,
}

ENT.dmg = {
	["7.62x51mm"] = 30,
}

ENT.hp = 1000
ENT.armor = 400

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 50,
	
	["Ichor"] = 100,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 75,
	["Explosion"] = 0,
	["Acid"] = 50,
	["Poison"] = 100,
	["Electric"] = -50,
}

function ENT:Initialize()
	self:basicSetup()
end