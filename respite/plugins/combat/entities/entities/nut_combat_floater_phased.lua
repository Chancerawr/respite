ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Floater (Phased)"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/zombie/classic2.mdl",
	"models/zombie/classic3.mdl",
	"models/zombie/classic4.mdl"
}
ENT.material = "models/props_combine/stasisfield_beam"

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 7,
	["accuracy"] = 12,
	["end"] = 10,
	["luck"] = 15,
	["perception"] = 30,
	["fortitude"] = 0,
}