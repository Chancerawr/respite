ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Ripper"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/manhack.mdl"
--ENT.material = "models/props/cs_militia/roofbeams02"

ENT.IdleAnim = "Fly"

--all attributes
ENT.attribs = {
	["stm"] = 25,
	["str"] = 5,
	["accuracy"] = 10,
	["end"] = 5,
	["luck"] = 0,
	["perception"] = 5,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 50
ENT.armor = 40

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