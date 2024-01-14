ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Melded Bonesphere"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Roller.mdl"
ENT.material = "models/gibs/hgibs/scapula"

ENT.IdleAnim = "Idle"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 30,
	["accuracy"] = 5,
	["end"] = 25,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 15,
	["Poison"] = 15,
}

ENT.hp = 200
ENT.armor = 100

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 20,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = 0,
	["Fire"] = 0,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 0,
}