ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic Cat"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/jeezy/animals/siamese_cat/siamese_cat.mdl"
ENT.material = "phoenix_storms/mrref2"

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 1,
	["accuracy"] = 5,
	["end"] = 2,
	["luck"] = 15,
	["perception"] = 15,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 50
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