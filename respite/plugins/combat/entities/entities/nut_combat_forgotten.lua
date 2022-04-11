ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Forgotten"
ENT.Category = "NutScript - Combat (Other)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Forgotten"
ENT.model = "models/player/group01/male_04.mdl"
ENT.color = Color(128, 0, 128)

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 10,
	["accuracy"] = 10,
	["end"] = 10,
	["luck"] = 10,
	["perception"] = 10,
	["fortitude"] = 5,
}

ENT.dmg = {
	["Ichor"] = 25,
}

ENT.hp = 500
ENT.armor = 0

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 50,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:SetSubMaterial(2, "models/props_combine/tpballglow")

	self:basicSetup()
end