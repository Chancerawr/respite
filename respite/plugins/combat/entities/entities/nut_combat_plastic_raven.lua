ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic Raven"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/crow.mdl"
ENT.material = "phoenix_storms/mrref2"

ENT.modelScale = 1.8

ENT.BloodColor = DONT_BLEED

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 1,
	["accuracy"] = 20,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 30,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Slash"] = 5,
}

ENT.hp = 30
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
	["Poison"] = 50,
	["Electric"] = 0,
}