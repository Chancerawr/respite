ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Harbinger"
ENT.Category = "NutScript - Combat (Boss)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.name = "Harbie"
ENT.model = "models/spite/doll.mdl"

ENT.AttackAnim = "Attack2"

ENT.hp = 2500
ENT.armor = 200

--all attributes
ENT.attribs = {
	["stm"] = 50,
	["str"] = 50,
	["accuracy"] = 50,
	["end"] = 50,
	["luck"] = 50,
	["perception"] = 50,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Rot"] = 15,
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 25,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 25,
	
	["Time"] = 0,
	["Erasure"] = -10,
	
	["Fire"] = 25,
	["Explosion"] = -25,
	["Acid"] = 0,
	["Poison"] = 25,
	["Electric"] = -50,
}

ENT.actions = {
	"todust",
	"toash",
	"death_decay",
	"dream_exist",
	"prophecy_self",
	"dream_harbinger",
	"violet_flamethrower",
	"violet_lmg",
	"recurring_nightmare",
	"blade_nightmare",
}

function ENT:Initialize()
	if(math.random(0,1) == 1) then
		self:SetMaterial("phoenix_storms/mrref2")
	else
		self:SetMaterial("models/props_buildings/plasterwall021a")
	end
	
	self:basicSetup()
end