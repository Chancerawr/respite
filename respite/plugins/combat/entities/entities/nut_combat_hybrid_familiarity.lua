ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Familiarity"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "⅄┴Iɹ∀I˥IW∀Ⅎ"

ENT.model = "models/player/corpse1.mdl"
ENT.material = "models/effects/comball_glow1"

ENT.AttackAnim = "Attack"

ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 20,
	["accuracy"] = 25,
	["end"] = 10,
	["luck"] = 25,
	["perception"] = 50,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Shard"] = 20,
	["Blight"] = 20,
}

ENT.hp = 2000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = 100,
	["Distort"] = 15,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}