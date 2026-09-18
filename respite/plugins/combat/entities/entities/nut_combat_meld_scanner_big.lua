ENT.Type = "anim"
ENT.Base = "nut_combat_prop"
ENT.PrintName = "Eye of the Melder"
ENT.Category = "NutScript - Combat (Drone)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/Combine_Scanner.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"
ENT.modelScale = 5

ENT.IdleAnim = "Idle"

ENT.PropHeight = 100

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 0,
	["accuracy"] = 50,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 100,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Electric"] = 30,
}

ENT.hp = 1250
ENT.armor = 250

ENT.res = {
	["Pierce"] = 10,
	["Slash"] = 10,
	["Blunt"] = -15,
	["Siege"] = 0,
	
	["Ichor"] = -15,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	["Time"] = 10,
	
	["Rot"] = -25,
	["Cold"] = -15,
	["Fire"] = -15,
	["Explosion"] = -15,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -15,
}

ENT.actions = {
	"learning_str",
	"learning_agi",
	"learning_end",
	"learning_fort",
	"learning_perc",
	"learning_acc",
	"learning_luck",
	"learning_craft",
}

ENT.actionsAI = {
}

