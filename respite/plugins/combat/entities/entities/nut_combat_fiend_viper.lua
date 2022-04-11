ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Viper Fiend"
ENT.Category = "NutScript - Combat (Fiend)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Viper Blood Fiend"

ENT.model = "models/sient hill custom/homecoming/lurker.mdl"
ENT.material = "models/flesh"
ENT.color = Color(128, 20, 20)

--all attributes
ENT.attribs = {
	["stm"] = 15,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 15,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Slash"] = 25,
}

ENT.hp = 400
ENT.armor = 0

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
		self:SetModelScale(1.3)
	end)	
end