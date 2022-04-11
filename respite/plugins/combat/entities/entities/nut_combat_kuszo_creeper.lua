ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Ghoul (Creeper)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/kuszo.mdl"
ENT.material = "models/props_lab/warp_sheet"
ENT.color = Color(190, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 4,
	["accuracy"] = 5,
	["end"] = 0,
	["luck"] = 4,
	["perception"] = 7,
	["fortitude"] = 7,
}

ENT.dmg = {
	["Slash"] = 20,
	["Electric"] = 20,
}

ENT.hp = 40
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 90,
}

ENT.actions = {
	"slash",
	"mawed_bite",
}