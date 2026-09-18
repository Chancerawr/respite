ENT.Type = "nextbot"
ENT.Base = "nut_combat"
ENT.PrintName = "Serpent"
ENT.Category = "NutScript - Combat (Husk)"
ENT.Spawnable = true
ENT.AdminOnly = true

ENT.models = {
	"models/chillax_sf2/silenthill/sh2/lying_figure/lying_figure.mdl"
}

ENT.modelScale = 5

ENT.AttackAnim = "AttackC"

--all attributes
ENT.attribs = {
	["stm"] = 20,
	["str"] = 40,
	["accuracy"] = 40,
	["end"] = 40,
	["luck"] = -5,
	["perception"] = 25,
	["fortitude"] = 50,
}

ENT.dmg = {
	["Acid"] = 25,
}

ENT.hp = 2500
ENT.armor = 0

ENT.res = {
	["Pierce"] = -20,
	["Slash"] = 20,
	["Blunt"] = 20,
	
	["Ichor"] = 0,
	["Blight"] = 25,
	["Shard"] = 25,
	["Distort"] = 0,
	["Time"] = 25,
	
	["Fire"] = -15,
	["Explosion"] = -15,
	["Acid"] = 50,
	["Poison"] = 50,
	["Electric"] = 0,
}

ENT.actions = {
	"husk_stare",
	"husk_scream",
	"acid_spit",
}

function ENT:Initialize()
	self:basicSetup()
	
	-- Change appearance (color, material, etc)
	self:SetColor(Color(200,200,200))
	
	local faces = {
		"models/humans/male/group01/eric_facemap",
	}
	
	for k, v in pairs(self:GetMaterials()) do
		self:SetSubMaterial(k-1, table.Random(faces))
	end
	
	self.WalkAnim = "Zombie Walk 0" ..math.random(1,6)
end