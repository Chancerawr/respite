ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Melded Observer"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Combine_Scanner.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"

ENT.IdleAnim = "Idle"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 15,
	["end"] = 5,
	["luck"] = 0,
	["perception"] = 20,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Electric"] = 15,
}

ENT.hp = 100
ENT.armor = 25

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 10,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -15,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -15,
}