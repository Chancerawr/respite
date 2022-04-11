ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (15)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 15,
	["perception"] = 15,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 200
ENT.armor = 30

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
	["Electric"] = 50,
}