ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Roller"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Roller.mdl"
--ENT.material = "models/props/cs_militia/roofbeams02"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 20,
	["accuracy"] = 20,
	["end"] = 25,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 15,
	["Electric"] = 15,
}

ENT.hp = 120
ENT.armor = 80

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
	["Electric"] = 100,
}