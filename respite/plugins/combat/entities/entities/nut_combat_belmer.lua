ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Belmer"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.noRag = true

ENT.model = "models/chillax_sf2/silenthill/sh2/mannequin/mannequin.mdl"
ENT.material = "models/props_lab/security_screens"

ENT.AttackAnim = "Attack_01"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 15,
	["accuracy"] = 10,
	["medical"] = 0,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 10,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Ichor"] = 5,
}

ENT.hp = 200
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
	["Poison"] = 50,
	["Electric"] = 50,
}