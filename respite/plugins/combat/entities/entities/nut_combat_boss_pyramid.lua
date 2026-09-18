ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Ambition"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/hunter/misc/squarecap2x2x2.mdl"
ENT.material = "models/props_lab/cornerunit_cloud"
ENT.modelScale = 6

ENT.color = Color(255, 0, 0)

ENT.hp = 10000
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 100,
	["str"] = 100,
	["accuracy"] = 100,
	["end"] = 100,
	["luck"] = 0,
	["perception"] = 100,
	["fortitude"] = 200,
}

ENT.dmg = {
	["Shard"] = 30,
}

ENT.res = {
	["Pierce"] = 25,
	["Slash"] = 25,
	["Blunt"] = -25,
	
	["Ichor"] = -50,
	["Blight"] = -100,
	["Shard"] = 100,
	["Distort"] = 50,
	
	["Time"] = 10,
	["Erasure"] = -25,
	
	["Rot"] = -50,
	["Cold"] = 50,
	["Fire"] = 50,
	["Explosion"] = -50,
	["Acid"] = 0,
	["Poison"] = 100,
	["Electric"] = 10,
}

ENT.actions = {
	"ambition_war",
	"ambition_beam",
	"ambition_invigorate",
	"ambition_creation",
	"ambition_blind",
	"ambition_shockwave",
	"ambition_charge",
	"corpse_burst",
}