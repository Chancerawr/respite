ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Torrent"
ENT.Category = "NutScript - Combat (Abomination)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.model = "models/zombie/classic.mdl"
ENT.material = "models/zombie_fast/fast_zombie_sheet"

ENT.modelScale = 1.1

ENT.AttackAnim = "AttackE"

ENT.hp = 400
ENT.armor = 0

--all attributes
ENT.attribs = {
	["stm"] = 5,
	["str"] = 15,
	["accuracy"] = 15,
	["end"] = 10,
	["luck"] = 0,
	["perception"] = 0,
	["fortitude"] = 0,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Slash"] = 15,
}

ENT.actions = {
	"throw_meat",
	"whack",
	"flail",
}

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = -10,
	["Blunt"] = 10,
	
	["Ichor"] = 0,
	["Blight"] = -50,
	["Shard"] = 100,
	["Distort"] = 0,
	
	["Fire"] = 25,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	--self:SetModelScale(1.1)

	self:basicSetup()
end