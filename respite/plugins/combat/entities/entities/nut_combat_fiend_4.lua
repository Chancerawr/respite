ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Fiend (20)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Blood Fiend"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 20,
	["luck"] = 20,
	["perception"] = 20,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Slash"] = 15,
}

ENT.hp = 250
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