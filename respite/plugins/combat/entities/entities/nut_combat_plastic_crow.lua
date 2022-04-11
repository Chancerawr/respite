ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic Crow"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/crow.mdl"
ENT.material = "phoenix_storms/mrref2"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 1,
	["accuracy"] = 10,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 25,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Slash"] = 5,
}

ENT.hp = 15
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