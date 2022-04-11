ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Gemini Wraith"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/gemini.mdl"
ENT.material = "models/props_lab/security_screens"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 30,
	["accuracy"] = 5,
	["end"] = 20,
	["luck"] = 0,
	["perception"] = 20,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 20,
	["Ichor"] = 10,
}

ENT.hp = 250
ENT.armor = 150

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"flail",
}