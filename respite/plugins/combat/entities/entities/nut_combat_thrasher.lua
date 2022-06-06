ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Thrasher"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/_maz_ter_/deadspace/deadspacenecros/twitcher.mdl"
ENT.material = "models/flesh"
ENT.color = Color(150, 150, 150)

ENT.AttackAnim = "Trasher_Attack01"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 4,
	["accuracy"] = 4,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 10,
	["Slash"] = 10,
}

ENT.hp = 150
ENT.armor = 30

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
	"slash",
	"whack",
	"flail",
}