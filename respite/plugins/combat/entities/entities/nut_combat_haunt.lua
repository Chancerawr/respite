ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Haunt"
ENT.Category = "NutScript - Combat (Wraith)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/tnb/citizens/male_04.mdl",
	"models/player/zombie_classic.mdl",
	"models/player/soldier_stripped.mdl",
	"models/player/corpse1.mdl"
}
ENT.material = "models/props_lab/security_screens"

--all attributes
ENT.attribs = {
	["stm"] = 10,
	["str"] = 12,
	["accuracy"] = 8,
	["end"] = 10,
	["luck"] = 8,
	["perception"] = 10,
	["fortitude"] = 20,
}

ENT.dmg = {
	["Blunt"] = 10,
	["Ichor"] = 10,
}

ENT.hp = 100
ENT.armor = 40

ENT.res = {
	["Pierce"] = 0,
	["Slash"] = 0,
	["Blunt"] = 0,
	
	["Ichor"] = 100,
	["Blight"] = -50,
	["Shard"] = -50,
	["Distort"] = 0,
	
	["Fire"] = 0,
	["Explosion"] = 0,
	["Acid"] = 0,
	["Poison"] = 0,
	["Electric"] = 0,
}

function ENT:Initialize()
	if(SERVER) then
		self.TV=ents.Create("prop_physics")
		self.TV:SetModel("models/props_c17/tv_monitor01.mdl")
		self.TV:SetPos(self:GetPos())
		self.TV:SetParent(self, 1)
		self.TV:SetMoveType(MOVETYPE_NONE)
		self.TV:SetMaterial("models/props_lab/security_screens")
	end

	self:basicSetup()
end