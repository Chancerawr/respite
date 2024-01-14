ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic Rat"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/alieneer/rat.mdl"
ENT.material = "phoenix_storms/mrref2"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 1,
	["accuracy"] = 15,
	["end"] = 2,
	["luck"] = 5,
	["perception"] = 15,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Pierce"] = 5,
}

ENT.hp = 25
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