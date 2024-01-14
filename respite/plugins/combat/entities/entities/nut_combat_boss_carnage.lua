ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Ambitionless Carnage"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/gman_high.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"

ENT.hp = 1500
ENT.armor = 100

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 5,
	["perception"] = 50,
	["fortitude"] = 100,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -25,
	["Blight"] = -25,
	["Shard"] = 50,
	["Distort"] = 25,
	
	["Time"] = 50,
	["Erasure"] = -25,
	
	["Fire"] = 25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = 10,
}

ENT.actions = {
	"ambitionless_disarm",
	"ambitionless_true",
	"carnage",
	"hypocrisy",
	"fracture",
	"blur",
	"unstable_portal",
}

function ENT:Initialize()
	self:basicSetup()
end