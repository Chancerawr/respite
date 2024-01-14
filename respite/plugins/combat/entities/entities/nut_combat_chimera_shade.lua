ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Chimera (Shade)"
ENT.Category = "NutScript - Combat (Shade)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/ninja/signalvariance/monsters/chimera.mdl"
ENT.material = "models/effects/portalrift_sheet"

ENT.AttackAnim = "Attack1"

--all attributes
ENT.attribs = {
	["stm"] = 12,
	["str"] = 12,
	["accuracy"] = 12,
	["end"] = 15,
	["luck"] = 5,
	["perception"] = 8,
	["fortitude"] = 15,
}

ENT.dmg = {
	["Blight"] = 5,
	["Slash"] = 5,
}

ENT.actions = {
	"smack",
	"slash",
	"stab",
}

ENT.hp = 400
ENT.armor = 100

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = -50,
	["Blight"] = 100,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	self:basicSetup()
end