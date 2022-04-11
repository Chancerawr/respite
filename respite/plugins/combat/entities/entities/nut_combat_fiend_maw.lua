ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Mawed Fiend (Stage 3)"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Mawed Blood Fiend"
ENT.model = "models/spite/fiend.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 15,
	["accuracy"] = 10,
	["end"] = 20,
	["luck"] = 5,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 20,
}

ENT.hp = 500
ENT.armor = 200

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 50,
	["Electric"] = 50,
}

function ENT:Initialize()
	self:basicSetup()
	
	timer.Simple(0.6, function()
		self:SetModelScale(1.2)
		self:ResetSequence("idle_all_angry")
	end)
end