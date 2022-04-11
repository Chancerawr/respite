ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Piranha"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/gunship.mdl"
ENT.material = "models/flesh"
ENT.color = Color(130, 220, 130)

--all attributes
ENT.attribs = {
	["stm"] = 40,
	["str"] = 40,
	["accuracy"] = 10,
	["end"] = 50,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Pierce"] = 30,
}

ENT.hp = 2000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 25,
	["Blunt"] = 25,
	
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
	"bone_burst",
}