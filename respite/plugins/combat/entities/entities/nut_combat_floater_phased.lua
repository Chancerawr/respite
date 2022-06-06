ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Floater (Distorted)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/zombie/classic2.mdl",
	"models/zombie/classic3.mdl",
	"models/zombie/classic4.mdl"
}
ENT.material = "models/props_combine/stasisfield_beam"

ENT.AttackAnim = "AttackA"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 7,
	["accuracy"] = 12,
	["end"] = 10,
	["luck"] = 15,
	["perception"] = 30,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Distort"] = 15,
}

ENT.hp = 100
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = -50,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
}