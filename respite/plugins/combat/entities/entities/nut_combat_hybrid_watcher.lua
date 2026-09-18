ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Mɐ┴ƆɥƎɹ"
ENT.Category = "NutScript - Combat (Hybrid)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/nh2_gmn/dave_the_dummy_on_stand.mdl"
ENT.material = "models/effects/comball_glow1"
ENT.color = Color(128, 0, 0)

ENT.noRag = true

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 0,
	["end"] = 100,
	["luck"] = 100,
	["perception"] = 0,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Blunt"] = 0,
}

ENT.hp = 100
ENT.armor = 10000

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}