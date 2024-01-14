ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Blood Bringer"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Bringer of Blood"

ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

ENT.modelScale = 1.4

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 10,
	["perception"] = 50,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Pierce"] = 30,
}

ENT.hp = 800
ENT.armor = 100

ENT.res = {
	["Pierce"] = 15,
	["Slash"] = 15,
	["Blunt"] = 15,
	["Siege"] = -50,
	
	["Ichor"] = -50,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Cold"] = -25,
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

ENT.actions = {
	"blood_shield",
	"blood_spike",
	"blood_pool",
	"blood_torrent",
	"blood_shredder",
	"blood_martyr",
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:ResetSequence("idle_all_angry")
	end)
end