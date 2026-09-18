ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Flesh Pillar"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hunter/blocks/cube025x125x025.mdl"
ENT.material = "models/skeleton/skeleton_bloody"

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 40,
	["end"] = 30,
	["luck"] = 5,
	["perception"] = 40,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Shard"] = 20,
}

ENT.hp = 250
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 15,
	["Blunt"] = 15,
	["Siege"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 0,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -25,
	["Acid"] = -25,
	["Poison"] = 25,
	["Electric"] = -25,
}