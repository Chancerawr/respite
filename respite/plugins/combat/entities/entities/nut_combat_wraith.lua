ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Seeker"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/predatorcz/amnesia/grunt.mdl"
ENT.material = "models/props_combine/tpballglow"

ENT.AttackAnim = "Attack2"

ENT.hp = 250
ENT.armor = 40

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 5,
	["end"] = 10,
	["luck"] = 3,
	["perception"] = 10,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Ichor"] = 20,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"ichor_spit",
}