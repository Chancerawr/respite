ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Cracked Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Cracked Blood Fiend"

ENT.model = "models/Zombie/Poison.mdl"
ENT.material = "models/flesh"

ENT.AttackAnim = "Melee_01"

ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 0,
	["str"] = 25,
	["accuracy"] = 20,
	["end"] = 30,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 30,
}

ENT.hp = 1000
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = -50,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.8)
	end)
end