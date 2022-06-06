ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Creeper Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2zombies/creeper.mdl"
ENT.material = "models/props_combine/tpballglow"

ENT.AttackAnim = "Melee"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 15,
	["accuracy"] = 12,
	["end"] = 5,
	["luck"] = 5,
	["perception"] = 10,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 5,
	["Ichor"] = 15,
}

ENT.hp = 150
ENT.armor = 50

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"stab",
}