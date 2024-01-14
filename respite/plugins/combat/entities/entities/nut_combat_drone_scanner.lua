ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Scanner"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Combine_Scanner.mdl"
--ENT.material = "models/props/cs_militia/roofbeams02"

ENT.IdleAnim = "Idle"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 5,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 20,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Electric"] = 15,
}

ENT.hp = 60
ENT.armor = 25

ENT.res = {
	["Pierce"] = 20,
	["Slash"] = 40,
	["Blunt"] = -25,
	["Siege"] = 0,
	
	["Ichor"] = 15,
	["Blight"] = -25,
	["Shard"] = 0,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = 25,
	["Cold"] = 50,
	["Fire"] = 50,
	["Explosion"] = -25,
	["Acid"] = -25,
	["Poison"] = 100,
	["Electric"] = -25,
}