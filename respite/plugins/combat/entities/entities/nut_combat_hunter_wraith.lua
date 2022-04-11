ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Hunter Flame"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Burning Hunter"

ENT.model = "models/sin/leperkin.mdl"
ENT.material = "models/effects/splode1_sheet"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 20,
	["accuracy"] = 15,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 10,
	["Ichor"] = 10,
	["Fire"] = 10,
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
	
	["Fire"] = 100,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

ENT.actions = {
	"slash",
	"whack",
}