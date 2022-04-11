ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Amputated (Flame)"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Amputated"
ENT.model = "models/am_npc/amputated.mdl"
ENT.material = "models/effects/splode1_sheet" 

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 3,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Fire"] = 10,
	["Ichor"] = 5,
}

ENT.actions = {
	"maw_bite",
	"ichor_spit",
}

ENT.hp = 60
ENT.armor = 15

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