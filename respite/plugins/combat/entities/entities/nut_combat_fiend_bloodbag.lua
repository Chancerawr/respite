ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Bloodbag"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Bloodbag"

ENT.model = "models/spite/freak02.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"
ENT.color = Color(128, 0, 0)

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 0,
	["accuracy"] = 50,
	["end"] = 0,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Acid"] = 25,
	["Fire"] = 25,
}

ENT.hp = 50
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

ENT.actions = {
	"blood_sacrifice",
}

function ENT:Initialize()
	self:basicSetup()
end