ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Plastic (10)"
ENT.Category = "NutScript - Combat (Plastic)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Plastic"

ENT.model = "models/player/group01/male_04.mdl"
ENT.material = "phoenix_storms/mrref2"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Pistol"] = 15,
}

ENT.hp = 150
ENT.armor = 25

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