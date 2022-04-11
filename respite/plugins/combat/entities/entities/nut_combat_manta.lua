ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Manta"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/combine_dropship.mdl"
ENT.material = "models/flesh"
ENT.color = Color(130, 220, 130)

--all attributes
ENT.attribs = {
	["stm"] = 30,
	["str"] = 60,
	["accuracy"] = 15,
	["end"] = 60,
	["luck"] = 0,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 40,
}

ENT.hp = 2500
ENT.armor = 200

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
	"flail",
	"whack",
	"constrict",
}